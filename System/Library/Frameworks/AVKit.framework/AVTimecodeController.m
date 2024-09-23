@implementation AVTimecodeController

- (AVTimecodeController)initWithTimecodeTrack:(id)a3 videoTrack:(id)a4
{
  id v7;
  id v8;
  AVTimecodeController *v9;
  AVTimecodeController *v10;
  uint64_t v11;
  NSMutableArray *timecodes;
  uint64_t v13;
  AVTimecodeController *v14;
  AVTimecodeController *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTimecodeController;
  v9 = -[AVTimecodeController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timecodeTrack, a3);
    objc_storeStrong((id *)&v10->_videoTrack, a4);
    v11 = objc_opt_new();
    timecodes = v10->_timecodes;
    v10->_timecodes = (NSMutableArray *)v11;

    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v10->_observationInterval.value = *MEMORY[0x1E0CA2E18];
    v10->_observationInterval.epoch = *(_QWORD *)(v13 + 16);
  }
  if (-[AVTimecodeController readTimecodes](v10, "readTimecodes"))
    v14 = v10;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (void)calculateMaxFrameAndTimecode
{
  AVAssetTrack *videoTrack;
  int64_t v4;
  __int128 v5;
  uint64_t v6;
  _OWORD v7[2];
  __int128 v8;
  uint64_t v9;

  videoTrack = self->_videoTrack;
  if (videoTrack)
    -[AVAssetTrack timeRange](videoTrack, "timeRange");
  else
    memset(v7, 0, sizeof(v7));
  v8 = *(_OWORD *)((char *)v7 + 8);
  v9 = *((_QWORD *)&v7[1] + 1);
  v4 = -[AVTimecodeController calculateFrameNumberAtCMTime:](self, "calculateFrameNumberAtCMTime:", &v8);
  self->_maxFrameNumber = v4;
  -[AVTimecodeController timecodeForFrameNumber64UsingCachedDescription:](self, "timecodeForFrameNumber64UsingCachedDescription:", v4);
  *(_OWORD *)&self->_maxTimecode.subframes = v5;
  *(_QWORD *)&self->_maxTimecode.hours = v6;
}

- (id)maxTimecodeString
{
  void *v3;
  char v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tc_flags");
  v5 = CFSTR(";");
  if ((v4 & 1) == 0)
    v5 = CFSTR(":");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%02d%@%02d"), self->_maxTimecode.hours, self->_maxTimecode.minutes, self->_maxTimecode.seconds, v6, self->_maxTimecode.frames);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)maxFrameCountString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu F"), self->_maxFrameNumber);
}

- (int64_t)calculateFrameNumberAtCMTime:(id *)a3
{
  void *v5;
  float v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
  v8 = *a3;
  return vcvtmd_s64_f64(CMTimeGetSeconds((CMTime *)&v8) * v6);
}

- (id)calculateTimecodeAtFrame:(int64_t)a3
{
  void *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  -[AVTimecodeController timecodeForFrameNumber64UsingCachedDescription:](self, "timecodeForFrameNumber64UsingCachedDescription:", a3);
  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tc_flags");
  v6 = CFSTR(";");
  if ((v5 & 1) == 0)
    v6 = CFSTR(":");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%02d%@%02d"), 0, 0, 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)calculateFrameNumberAtTimecode:(id)a3
{
  NSMutableArray *timecodes;
  id v5;
  void *v6;
  int64_t v7;

  timecodes = self->_timecodes;
  v5 = a3;
  -[NSMutableArray firstObject](timecodes, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTimecodeController offsetFor:fromTimecode:](self, "offsetFor:fromTimecode:", v5, v6);

  return v7;
}

- (id)timecodeForFrameNumber32UsingFormatDescription:(opaqueCMFormatDescription *)a3 timecodeStartFrame:(int64_t)a4
{
  FourCharCode MediaSubType;
  uint32_t TimeCodeFlags;
  void *v9;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  FourCharCode v16;
  uint32_t v17;
  uint64_t v18;
  CMTime v19;
  CMTime v20;

  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  TimeCodeFlags = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a3);
  memset(&v20, 0, sizeof(v20));
  CMTimeCodeFormatDescriptionGetFrameDuration(&v20, a3);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setFrameNumber:", a4);
  v19 = v20;
  objc_msgSend(v9, "setFrameDuration:", &v19);
  v15 = 0;
  v16 = MediaSubType;
  v17 = TimeCodeFlags;
  v18 = 0;
  objc_msgSend(v9, "setTimecodeStruct:", &v15);
  objc_msgSend(v9, "setTc_flags:", CMTimeCodeFormatDescriptionGetTimeCodeFlags(a3));
  -[AVTimecodeController timecodeForOffset:from:timecode:](self, "timecodeForOffset:from:timecode:", 0, a4, v9);
  v11 = v13;
  v12 = v14;
  objc_msgSend(v9, "setTimecodeStruct:", &v11);
  return v9;
}

- (CVSMPTETime)timecodeForFrameNumber64UsingCachedDescription:(SEL)a3
{
  void *v7;
  uint64_t v8;
  void *v9;
  CVSMPTETime *result;
  CVSMPTETime v11;

  *(_QWORD *)&retstr->subframes = 0;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->hours = 0;
  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "frameNumber");
  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimecodeController timecodeForOffset:from:timecode:](self, "timecodeForOffset:from:timecode:", a4, v8, v9);
  *retstr = v11;

  return result;
}

- (int64_t)offsetFor:(id)a3 fromTimecode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CMTimeValue value;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  char v21;
  int v22;
  int v23;
  int32_t v24;
  int v25;
  int v26;
  int v27;
  int32_t v28;
  int v29;
  BOOL v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int64_t v38;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime lhs;
  CMTime rhs;
  CMTime time;
  CMTime v47;
  CMTime v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CMTime v73;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  memset(&v73, 0, sizeof(v73));
  if (v7)
  {
    objc_msgSend(v7, "frameDuration");
    value = v73.value;
    v10 = v73.timescale - 1;
  }
  else
  {
    value = 0;
    v10 = -1;
  }
  v11 = v10 + value;
  if (v6)
  {
    objc_msgSend(v6, "timecodeStruct");
    v12 = SHIWORD(v72);
    if (v8)
    {
LABEL_6:
      objc_msgSend(v8, "timecodeStruct");
      v13 = SHIWORD(v69);
      goto LABEL_9;
    }
  }
  else
  {
    v12 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    if (v8)
      goto LABEL_6;
  }
  v13 = 0;
  v67 = 0;
  v68 = 0;
  v69 = 0;
LABEL_9:
  v14 = v11;
  v15 = v12 - v13;
  if (v6)
  {
    objc_msgSend(v6, "timecodeStruct");
    v16 = SWORD2(v66);
  }
  else
  {
    v16 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
  }
  v17 = v15 >> 31;
  v18 = v14 / value;
  if (v8)
  {
    objc_msgSend(v8, "timecodeStruct");
    v19 = SWORD2(v63);
  }
  else
  {
    v19 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
  }
  v20 = v16 - v19;
  v22 = v20 + v17;
  v21 = (v20 + v17 < 0) ^ __OFADD__(v20, v17);
  v23 = v20 + v17 + 60;
  if (v21)
    v24 = v23;
  else
    v24 = v22;
  if (v6)
  {
    objc_msgSend(v6, "timecodeStruct");
    v25 = SWORD1(v60);
  }
  else
  {
    v25 = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
  }
  v26 = v22 >> 31;
  if (v8)
  {
    objc_msgSend(v8, "timecodeStruct");
    v27 = SWORD1(v57);
  }
  else
  {
    v27 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
  }
  v28 = (v18 & (v15 >> 31)) + v15;
  v29 = v25 - v27;
  v30 = __OFADD__(v29, v26);
  v31 = v29 + v26;
  v32 = v31 >> 31;
  if (v31 < 0 != v30)
    v33 = v31 + 60;
  else
    v33 = v31;
  if (v6)
  {
    objc_msgSend(v6, "timecodeStruct");
    v34 = (__int16)v54;
  }
  else
  {
    v34 = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
  }
  v35 = v32 & 0xFFFFFFFE;
  if (v8)
  {
    objc_msgSend(v8, "timecodeStruct");
    v36 = (__int16)v51;
  }
  else
  {
    v36 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
  }
  v37 = v34 - v36 + v35;
  memset(&v48, 0, sizeof(v48));
  CMTimeMake(&v48, v73.timescale, v73.timescale);
  memset(&v47, 0, sizeof(v47));
  CMTimeMake(&v47, 0, v48.timescale);
  time = v48;
  CMTimeMultiply(&rhs, &time, 3600 * v37);
  lhs = v47;
  CMTimeAdd(&time, &lhs, &rhs);
  v47 = time;
  time = v48;
  CMTimeMultiply(&v43, &time, 60 * v33);
  lhs = v47;
  CMTimeAdd(&time, &lhs, &v43);
  v47 = time;
  time = v48;
  CMTimeMultiply(&v42, &time, v24);
  lhs = v47;
  CMTimeAdd(&time, &lhs, &v42);
  v47 = time;
  time = v73;
  CMTimeMultiply(&v41, &time, v28);
  lhs = v47;
  CMTimeAdd(&time, &lhs, &v41);
  v47 = time;
  if ((objc_msgSend(v8, "tc_flags") & 1) != 0)
  {
    CMTimeMake(&v40, ((int)(108 * v37) + (uint64_t)(2 * (v33 / -10 + v33))) << ((int)v18 > 50), v48.timescale);
    lhs = v47;
    CMTimeAdd(&time, &lhs, &v40);
    v47 = time;
  }
  time = v47;
  v38 = -[AVTimecodeController calculateFrameNumberAtCMTime:](self, "calculateFrameNumberAtCMTime:", &time);

  return v38;
}

- (CVSMPTETime)timecodeForOffset:(SEL)a3 from:(int64_t)a4 timecode:(int64_t)a5
{
  id v10;
  void *v11;
  float v12;
  AVAssetTrack *videoTrack;
  uint64_t v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int64_t v19;
  UInt32 v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CVSMPTETime *result;
  _BYTE v31[64];

  v10 = a6;
  v11 = v10;
  memset(&v31[32], 0, 24);
  if (v10)
    objc_msgSend(v10, "frameDuration");
  -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
  if (v12 <= 50.0)
  {
    v14 = 2;
  }
  else
  {
    videoTrack = self->_videoTrack;
    if (videoTrack)
      -[AVAssetTrack minFrameDuration](videoTrack, "minFrameDuration");
    else
      memset(v31, 0, 24);
    *(CMTime *)&v31[32] = *(CMTime *)v31;
    a5 *= 2;
    v14 = 4;
  }
  *(CMTime *)v31 = *(CMTime *)&v31[32];
  if (!-[AVTimecodeController validateCMTime:](self, "validateCMTime:", v31))
  {
    -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
    CMTimeMake((CMTime *)v31, 1, (int)v15);
    *(CMTime *)&v31[32] = *(CMTime *)v31;
    if (!-[AVTimecodeController validateCMTime:](self, "validateCMTime:", v31))
    {
      CMTimeMake((CMTime *)v31, 1, 60);
      *(CMTime *)&v31[32] = *(CMTime *)v31;
    }
  }
  v16 = *(int *)&v31[40];
  v17 = *(_QWORD *)&v31[32];
  memset(v31, 0, 24);
  if (v11)
  {
    objc_msgSend(v11, "timecodeStruct", *(_QWORD *)v31);
    v18 = *(_DWORD *)&v31[8];
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;
    *(_QWORD *)&retstr->subframes = 0;
    if (v18 == 1953325924)
    {
      v19 = a5 + a4;
      v20 = *(_DWORD *)&v31[12];
      retstr->type = 1953325924;
      retstr->flags = v20;
      if (a5 + a4 >= 0)
        v21 = a5 + a4;
      else
        v21 = -v19;
      v22 = (v16 + v17 - 1) / v17;
      if ((v20 & 1) != 0)
      {
        v23 = 60 * v22 - v14;
        v24 = 9 * v23 + 60 * v22;
        v25 = 9 * v14 * (v21 / v24);
        v26 = v21 % v24;
        if (v26 >= 60 * v22)
          v25 += v14 + v14 * ((v26 - 60 * v22) / v23);
        v21 += v25;
      }
      v27 = v21 / v22;
      retstr->frames = v21 % v22;
      retstr->seconds = v21 / v22 % 60;
      v28 = v21 / v22 / 60 % 60;
      retstr->minutes = v28;
      v29 = v27 / 3600;
      if ((v20 & 2) != 0 && (v29 %= 24, v19 < 0) && (v20 & 4) == 0)
      {
        retstr->hours = 23 - v29;
      }
      else
      {
        retstr->hours = v29;
        if (v19 < 0)
          retstr->minutes = v28 | 0x80;
      }
    }
  }
  else
  {
    *(_QWORD *)&retstr->subframes = 0;
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;
  }

  return result;
}

- (int64_t)calculateFrameNumberAtTimeInterval:(double)a3
{
  CMTime v5;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, -[AVAssetTrack naturalTimeScale](self->_videoTrack, "naturalTimeScale"));
  v5 = v6;
  return -[AVTimecodeController calculateFrameNumberAtCMTime:](self, "calculateFrameNumberAtCMTime:", &v5);
}

- (double)timeIntervalForFrameNumber:(int64_t)a3
{
  void *v5;
  double result;
  void *v7;
  void *v8;
  int32_t v9;
  CMTime v10;
  CMTime time;
  CMTime v12;
  CMTime v13;

  -[NSMutableArray firstObject](self->_timecodes, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0.0;
  if (a3 >= 1 && v5)
  {
    memset(&v13, 0, sizeof(v13));
    -[NSMutableArray firstObject](self->_timecodes, "firstObject", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "frameDuration");
    else
      memset(&v13, 0, sizeof(v13));

    memset(&v12, 0, sizeof(v12));
    v9 = -[AVAssetTrack naturalTimeScale](self->_videoTrack, "naturalTimeScale");
    time = v13;
    CMTimeConvertScale(&v12, &time, v9, kCMTimeRoundingMethod_QuickTime);
    memset(&time, 0, sizeof(time));
    v10 = v12;
    CMTimeMultiply(&time, &v10, a3);
    v10 = time;
    return CMTimeGetSeconds(&v10);
  }
  return result;
}

- (void)cacheTimecodeDescriptionForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  OpaqueCMBlockBuffer *DataBuffer;
  CMFormatDescriptionRef FormatDescription;
  const opaqueCMFormatDescription *v7;
  void *v8;
  char *dataPointerOut;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut;

  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (DataBuffer)
  {
    v7 = FormatDescription;
    if (FormatDescription)
    {
      totalLengthOut = 0;
      lengthAtOffsetOut = 0;
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut)
        && CMFormatDescriptionGetMediaSubType(v7) == 1953325924)
      {
        -[AVTimecodeController timecodeForFrameNumber32UsingFormatDescription:timecodeStartFrame:](self, "timecodeForFrameNumber32UsingFormatDescription:timecodeStartFrame:", v7, bswap32(*(_DWORD *)dataPointerOut));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_timecodes, "addObject:", v8);

      }
    }
  }
}

- (BOOL)validateCMTime:(id *)a3
{
  CMTime v4;
  CMTime time1;

  if ((a3->var2 & 0x15) != 1)
    return 0;
  time1 = *(CMTime *)a3;
  v4 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return CMTimeCompare(&time1, &v4) > 0;
}

- (BOOL)readTimecodes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  const void *v17;
  $95D729B680665BEAEFA1D6FCA8238556 *p_observationInterval;
  void *v19;
  void *v20;
  __int128 v22;
  int64_t epoch;

  -[AVTimecodeController timecodeTrack](self, "timecodeTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C8AFD0]);
    -[AVTimecodeController timecodeTrack](self, "timecodeTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithAsset:error:", v7, 0);

    if (v8)
    {
      -[AVTimecodeController timecodeTrack](self, "timecodeTrack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A800]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count")
        && (objc_msgSend(v11, "firstObject"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = (void *)v12;
        objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v12, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addOutput:", v14);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
    v15 = objc_msgSend(v8, "startReading");
    if (v15)
    {
      while (objc_msgSend(v8, "status") == 1)
      {
        if (-[NSMutableArray count](self->_timecodes, "count"))
          break;
        v16 = objc_msgSend(v14, "copyNextSampleBuffer");
        if (!v16)
          break;
        v17 = (const void *)v16;
        -[AVTimecodeController cacheTimecodeDescriptionForSampleBuffer:](self, "cacheTimecodeDescriptionForSampleBuffer:", v16);
        CFRelease(v17);
        if (-[NSMutableArray count](self->_timecodes, "count"))
          objc_msgSend(v8, "cancelReading");
      }
    }
    p_observationInterval = &self->_observationInterval;
    -[NSMutableArray firstObject](self->_timecodes, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "frameDuration");
    }
    else
    {
      v22 = 0uLL;
      epoch = 0;
    }
    *(_OWORD *)&p_observationInterval->value = v22;
    self->_observationInterval.epoch = epoch;

    v22 = *(_OWORD *)&p_observationInterval->value;
    epoch = self->_observationInterval.epoch;
    if (-[AVTimecodeController validateCMTime:](self, "validateCMTime:", &v22))
      -[AVTimecodeController calculateMaxFrameAndTimecode](self, "calculateMaxFrameAndTimecode");
    else
      LOBYTE(v15) = 0;

  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (BOOL)timecodeAvailable
{
  return -[NSMutableArray count](self->_timecodes, "count") != 0;
}

- (AVAssetTrack)timecodeTrack
{
  return self->_timecodeTrack;
}

- (void)setTimecodeTrack:(id)a3
{
  objc_storeStrong((id *)&self->_timecodeTrack, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)observationInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_timecodes, 0);
  objc_storeStrong((id *)&self->_timecodeTrack, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
}

@end
