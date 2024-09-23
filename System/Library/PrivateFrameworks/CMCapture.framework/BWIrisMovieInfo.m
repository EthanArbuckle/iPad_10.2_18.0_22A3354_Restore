@implementation BWIrisMovieInfo

+ (id)emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3
{
  return -[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:]([BWIrisMovieInfo alloc], a3);
}

- (_QWORD)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWIrisMovieInfo;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

+ (BWIrisMovieInfo)irisMovieInfoWithFigCaptureMovieFileRecordingSettings:(id)a3 stillImageCaptureTime:(id *)a4 stillImageCaptureHostTime:(id *)a5 stillImageCaptureAbsoluteStartTime:(double)a6 stillImageRequestSettings:(id)a7 stillImageCaptureSettings:(id)a8 originalPhotoRecording:(BOOL)a9 semanticStyle:(id)a10
{
  BWIrisMovieInfo *v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;

  v17 = [BWIrisMovieInfo alloc];
  v20 = *a4;
  v19 = *a5;
  return (BWIrisMovieInfo *)-[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:stillImageCaptureTime:stillImageCaptureHostTime:stillImageCaptureAbsoluteStartTime:stillImageRequestSettings:stillImageCaptureSettings:originalPhotoRecording:semanticStyle:](v17, a3, (uint64_t)&v20, (__int128 *)&v19.var0, a7, a8, a9, a10, a6);
}

- (char)_initWithFigCaptureMovieFileRecordingSettings:(uint64_t)a3 stillImageCaptureTime:(__int128 *)a4 stillImageCaptureHostTime:(void *)a5 stillImageCaptureAbsoluteStartTime:(void *)a6 stillImageRequestSettings:(char)a7 stillImageCaptureSettings:(void *)a8 originalPhotoRecording:(double)a9 semanticStyle:
{
  char *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  objc_super v26;

  if (!a1)
    return 0;
  v26.receiver = a1;
  v26.super_class = (Class)BWIrisMovieInfo;
  v17 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (v17)
  {
    *((_QWORD *)v17 + 1) = a2;
    v18 = *(_QWORD *)(a3 + 16);
    *(_OWORD *)(v17 + 60) = *(_OWORD *)a3;
    *(_QWORD *)(v17 + 76) = v18;
    v19 = *a4;
    *(_QWORD *)(v17 + 100) = *((_QWORD *)a4 + 2);
    *(_OWORD *)(v17 + 84) = v19;
    *((double *)v17 + 14) = a9;
    *((_QWORD *)v17 + 15) = a5;
    *((_QWORD *)v17 + 16) = a6;
    *((_QWORD *)v17 + 2) = (id)objc_msgSend(*((id *)v17 + 1), "outputURL");
    v20 = (id)objc_msgSend(*((id *)v17 + 1), "spatialOverCaptureMovieURL");
    *((_QWORD *)v17 + 6) = v20;
    v17[56] = v20 != 0;
    v21 = MEMORY[0x1E0CA2E30];
    *(_OWORD *)(v17 + 140) = *MEMORY[0x1E0CA2E30];
    *(_QWORD *)(v17 + 156) = *(_QWORD *)(v21 + 16);
    v17[493] = a7;
    v22 = MEMORY[0x1E0CA2E18];
    v23 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v17 + 308) = *MEMORY[0x1E0CA2E18];
    v24 = *(_QWORD *)(v22 + 16);
    *(_QWORD *)(v17 + 324) = v24;
    *(_OWORD *)(v17 + 356) = v23;
    *(_QWORD *)(v17 + 372) = v24;
    *(_OWORD *)(v17 + 380) = v23;
    *(_QWORD *)(v17 + 396) = v24;
    *(_OWORD *)(v17 + 404) = v23;
    *(_QWORD *)(v17 + 420) = v24;
    *(_QWORD *)(v17 + 444) = v24;
    *(_OWORD *)(v17 + 428) = v23;
    *((_QWORD *)v17 + 73) = a8;
    *((_QWORD *)v17 + 79) = 0;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIrisMovieInfo;
  -[BWIrisMovieInfo dealloc](&v3, sel_dealloc);
}

- (int)stillImageCaptureType
{
  return -[BWStillImageCaptureSettings captureType](-[BWIrisMovieInfo stillImageCaptureSettings](self, "stillImageCaptureSettings"), "captureType");
}

- (void)setMomentCaptureRecordingStillImageCaptureHostTimeOverride:(id *)a3 stillImageCaptureTimeOverride:(id *)a4
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_stillImageCaptureHostTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_stillImageCaptureTime.epoch + 4) = v4;
  v5 = *(_OWORD *)&a4->var0;
  *(_QWORD *)&self->_stillImageCaptureTime.flags = a4->var3;
  *(_OWORD *)(&self->_spatialOverCaptureExpected + 4) = v5;
  self->_stillImageCaptureAbsoluteStartTime = CFAbsoluteTimeGetCurrent();
}

- (BOOL)containsTrims
{
  CMTime v4;
  CMTime time1;

  *(_OWORD *)&time1.value = *(_OWORD *)(&self->_movieStartTimeRequiresCutting + 4);
  time1.epoch = *(_QWORD *)&self->_movieStartTime.flags;
  *(_OWORD *)&v4.value = *(_OWORD *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  v4.epoch = *(_QWORD *)&self->_movieTrimStartTime.flags;
  if (CMTimeCompare(&time1, &v4))
    return 1;
  time1 = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  v4 = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  return CMTimeCompare(&time1, &v4) != 0;
}

- (int)numberOfRequestedVariants
{
  uint8x8_t v2;

  v2 = (uint8x8_t)vcnt_s8((int8x8_t)self->_requestedSDOFVariants);
  v2.i16[0] = vaddlv_u8(v2);
  if (self->_requestedSDOFVariants)
    return v2.i32[0];
  else
    return 1;
}

- (id)copyMovieInfosForRequestedSDOFVariants
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_requestedSDOFVariants)
    return 0;
  if (-[BWIrisMovieInfo numberOfRequestedVariants](self, "numberOfRequestedVariants") != 1)
  {
    if (-[BWIrisMovieInfo numberOfRequestedVariants](self, "numberOfRequestedVariants") == 2)
    {
      v5 = (void *)-[BWIrisMovieInfo copy](self, "copy");
      objc_msgSend(v5, "setRequestedSDOFVariants:", 2);
      objc_msgSend(v5, "setOriginalPhotoRecording:", 1);
      objc_msgSend(v5, "setFinalEnqueuedIrisRequest:", 0);
      objc_msgSend(v5, "setFinalReferenceMovie:", 0);
      objc_msgSend(v5, "setOutputMovieURL:", objc_msgSend(v5, "outputURLForSDOFOriginalMovie"));
      objc_msgSend(v5, "setTemporaryMovieURL:", objc_msgSend(v5, "temporaryURLForSDOFOriginalMovie"));
      if (objc_msgSend(v5, "movieLevelMetadataForSDOFOriginalMovie"))
      {
        objc_msgSend((id)objc_msgSend(v5, "settings"), "setMovieLevelMetadata:", objc_msgSend(v5, "movieLevelMetadataForSDOFOriginalMovie"));
        objc_msgSend(v5, "setMovieLevelMetadataForSDOFOriginalMovie:", 0);
      }
      objc_msgSend(v5, "setOutputURLForSDOFOriginalMovie:", 0);
      objc_msgSend(v5, "setTemporaryURLForSDOFOriginalMovie:", 0);
      v3 = (void *)-[BWIrisMovieInfo copy](self, "copy");
      objc_msgSend(v3, "setRequestedSDOFVariants:", 1);
      objc_msgSend(v3, "setOutputURLForSDOFOriginalMovie:", 0);
      objc_msgSend(v3, "setTemporaryURLForSDOFOriginalMovie:", 0);
      objc_msgSend(v3, "setMovieLevelMetadataForSDOFOriginalMovie:", 0);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, v3, 0);

      goto LABEL_8;
    }
    return 0;
  }
  v3 = (void *)-[BWIrisMovieInfo copy](self, "copy");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, 0);
LABEL_8:

  return v4;
}

- (id)copySpatialOverCaptureVariant
{
  void *v3;

  v3 = (void *)-[BWIrisMovieInfo copy](self, "copy");
  objc_msgSend(v3, "setOutputMovieURL:", -[BWIrisMovieInfo spatialOverCaptureOutputMovieURL](self, "spatialOverCaptureOutputMovieURL"));
  objc_msgSend(v3, "setTemporaryMovieURL:", -[BWIrisMovieInfo spatialOverCaptureTemporaryMovieURL](self, "spatialOverCaptureTemporaryMovieURL"));
  objc_msgSend(v3, "setMasterMovieURL:", -[BWIrisMovieInfo spatialOverCaptureMasterMovieURL](self, "spatialOverCaptureMasterMovieURL"));
  objc_msgSend((id)objc_msgSend(v3, "settings"), "setMovieLevelMetadata:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieLevelMetadata](-[BWIrisMovieInfo settings](self, "settings"), "spatialOverCaptureMovieLevelMetadata"));
  return v3;
}

- (id)description
{
  void *v3;
  int64_t v4;
  Float64 v5;
  Float64 v6;
  Float64 v7;
  Float64 v8;
  Float64 v9;
  Float64 v10;
  Float64 v11;
  Float64 v12;
  NSString *v13;
  NSString *v14;
  _BOOL8 finalReferenceMovie;
  _BOOL8 finalEnqueuedIrisRequest;
  _BOOL8 stillImageEncoderKeyFrameEmitted;
  _BOOL8 stillImageVISKeyFrameTagged;
  const __CFString *v19;
  const __CFString *v21;
  Float64 v22;
  Float64 v23;
  Float64 v24;
  Float64 v25;
  Float64 Seconds;
  uint64_t v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime rhs;
  CMTime v34;
  CMTime time;

  if (FigIsItOKToLogURLs())
    v21 = -[NSURL lastPathComponent](self->_outputMovieURL, "lastPathComponent");
  else
    v21 = CFSTR("<redacted>");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v27 = objc_opt_class();
  v4 = -[FigCaptureRecordingSettings settingsID](self->_settings, "settingsID");
  time = *(CMTime *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4);
  Seconds = CMTimeGetSeconds(&time);
  time = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  v25 = CMTimeGetSeconds(&time);
  time = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  v24 = CMTimeGetSeconds(&time);
  time = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  v23 = CMTimeGetSeconds(&time);
  time = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  v22 = CMTimeGetSeconds(&time);
  time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  v5 = CMTimeGetSeconds(&time);
  time = *(CMTime *)((char *)&self->_movieEndTime.epoch + 4);
  v6 = CMTimeGetSeconds(&time);
  time = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  rhs = *(CMTime *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4);
  CMTimeSubtract(&v34, &time, &rhs);
  v7 = CMTimeGetSeconds(&v34);
  time = *(CMTime *)((char *)&self->_movieStartTime.epoch + 4);
  rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v32, &time, &rhs);
  v8 = CMTimeGetSeconds(&v32);
  time = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v31, &time, &rhs);
  v9 = CMTimeGetSeconds(&v31);
  time = *(CMTime *)((char *)&self->_movieTrimStartTime.epoch + 4);
  rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v30, &time, &rhs);
  v10 = CMTimeGetSeconds(&v30);
  time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  rhs = *(CMTime *)(&self->_movieStartTimeRequiresCutting + 4);
  CMTimeSubtract(&v29, &time, &rhs);
  v11 = CMTimeGetSeconds(&v29);
  time = *(CMTime *)(&self->_spatialOverCaptureExpected + 4);
  rhs = *(CMTime *)((char *)&self->_movieEndingVideoPTS.epoch + 4);
  CMTimeSubtract(&v28, &time, &rhs);
  v12 = CMTimeGetSeconds(&v28);
  v13 = -[NSURL lastPathComponent](self->_masterMovieURL, "lastPathComponent");
  v14 = -[NSURL lastPathComponent](self->_temporaryMovieURL, "lastPathComponent");
  finalReferenceMovie = self->_finalReferenceMovie;
  finalEnqueuedIrisRequest = self->_finalEnqueuedIrisRequest;
  stillImageEncoderKeyFrameEmitted = self->_stillImageEncoderKeyFrameEmitted;
  stillImageVISKeyFrameTagged = self->_stillImageVISKeyFrameTagged;
  time = *(CMTime *)((char *)&self->_beginTrimMasterPTS.epoch + 4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %p: captureID:%lld, [Capture - master:%.4f movie:%.4f-%.4f trim:%.4f-%.4f still:%.4f endingVideoPTS:%.4f] [Movie - master:%.4f movie:0.-%.4f trim:%.4f-%.4f still:%.4f/%.4f] url:%@, master:%@, temporary:%@, isFinalReference:%d isFinalInSequence:%d keyFrameEmitted:%d stillImageVISKeyFrameTagged:%d audio offset: %.4f originalPhotoRecording:%d"), v27, self, v4, *(_QWORD *)&Seconds, *(_QWORD *)&v25, *(_QWORD *)&v24, *(_QWORD *)&v23, *(_QWORD *)&v22, *(_QWORD *)&v5, *(_QWORD *)&v6, *(_QWORD *)&v7, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12,
    v21,
    v13,
    v14,
    finalReferenceMovie,
    finalEnqueuedIrisRequest,
    stillImageEncoderKeyFrameEmitted,
    stillImageVISKeyFrameTagged,
    CMTimeGetSeconds(&time),
    self->_originalPhotoRecording);
  objc_msgSend(v3, "appendFormat:", CFSTR(" isMomentCaptureMovieRecording:%d"), self->_isMomentCaptureMovieRecording);
  if (self->_requestedSDOFVariants)
  {
    if (FigIsItOKToLogURLs())
      v19 = -[NSURL lastPathComponent](self->_outputURLForSDOFOriginalMovie, "lastPathComponent");
    else
      v19 = CFSTR("<redacted>");
    objc_msgSend(v3, "appendFormat:", CFSTR(" requestedSDOFVariants:0x%x originalSDOFURL:%@"), self->_requestedSDOFVariants, v19);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  BWIrisMovieInfo *v6;
  double stillImageCaptureAbsoluteStartTime;
  FigCaptureIrisStillImageSettings *stillImageRequestSettings;
  BWStillImageCaptureSettings *stillImageCaptureSettings;
  char originalPhotoRecording;
  FigCaptureSemanticStyle *semanticStyle;
  char *v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;

  v5 = (void *)-[FigCaptureMovieFileRecordingSettings copy](self->_settings, "copy");
  v6 = +[BWIrisMovieInfo allocWithZone:](BWIrisMovieInfo, "allocWithZone:", a3);
  stillImageCaptureAbsoluteStartTime = self->_stillImageCaptureAbsoluteStartTime;
  stillImageRequestSettings = self->_stillImageRequestSettings;
  stillImageCaptureSettings = self->_stillImageCaptureSettings;
  originalPhotoRecording = self->_originalPhotoRecording;
  semanticStyle = self->_semanticStyle;
  v68 = *(_OWORD *)(&self->_spatialOverCaptureExpected + 4);
  v69 = *(_QWORD *)&self->_stillImageCaptureTime.flags;
  v66 = *(_OWORD *)((char *)&self->_stillImageCaptureTime.epoch + 4);
  v67 = *(_QWORD *)&self->_stillImageCaptureHostTime.flags;
  v12 = -[BWIrisMovieInfo _initWithFigCaptureMovieFileRecordingSettings:stillImageCaptureTime:stillImageCaptureHostTime:stillImageCaptureAbsoluteStartTime:stillImageRequestSettings:stillImageCaptureSettings:originalPhotoRecording:semanticStyle:](v6, v5, (uint64_t)&v68, &v66, stillImageRequestSettings, stillImageCaptureSettings, originalPhotoRecording, semanticStyle, stillImageCaptureAbsoluteStartTime);

  objc_msgSend(v12, "setOutputMovieURL:", -[BWIrisMovieInfo outputMovieURL](self, "outputMovieURL"));
  objc_msgSend(v12, "setTemporaryMovieURL:", -[BWIrisMovieInfo temporaryMovieURL](self, "temporaryMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureOutputMovieURL:", -[BWIrisMovieInfo spatialOverCaptureOutputMovieURL](self, "spatialOverCaptureOutputMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureTemporaryMovieURL:", -[BWIrisMovieInfo spatialOverCaptureTemporaryMovieURL](self, "spatialOverCaptureTemporaryMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureMasterMovieURL:", -[BWIrisMovieInfo spatialOverCaptureMasterMovieURL](self, "spatialOverCaptureMasterMovieURL"));
  objc_msgSend(v12, "setSpatialOverCaptureExpected:", -[BWIrisMovieInfo spatialOverCaptureExpected](self, "spatialOverCaptureExpected"));
  objc_msgSend(v12, "setMomentCaptureMovieRecording:", -[BWIrisMovieInfo isMomentCaptureMovieRecording](self, "isMomentCaptureMovieRecording"));
  -[BWIrisMovieInfo momentCaptureMovieRecordingMasterEndTime](self, "momentCaptureMovieRecordingMasterEndTime");
  v62 = v64;
  v63 = v65;
  objc_msgSend(v12, "setMomentCaptureMovieRecordingMasterEndTime:", &v62);
  -[BWIrisMovieInfo nonDestructiveCropSize](self, "nonDestructiveCropSize");
  objc_msgSend(v12, "setNonDestructiveCropSize:");
  objc_msgSend(v12, "setMovieStartTimeRequiresCutting:", -[BWIrisMovieInfo movieStartTimeRequiresCutting](self, "movieStartTimeRequiresCutting"));
  -[BWIrisMovieInfo movieStartTime](self, "movieStartTime");
  v58 = v60;
  v59 = v61;
  objc_msgSend(v12, "setMovieStartTime:", &v58);
  -[BWIrisMovieInfo movieEndTime](self, "movieEndTime");
  v54 = v56;
  v55 = v57;
  objc_msgSend(v12, "setMovieEndTime:", &v54);
  -[BWIrisMovieInfo movieEndingVideoPTS](self, "movieEndingVideoPTS");
  v50 = v52;
  v51 = v53;
  objc_msgSend(v12, "setMovieEndingVideoPTS:", &v50);
  -[BWIrisMovieInfo movieTrimStartTime](self, "movieTrimStartTime");
  v46 = v48;
  v47 = v49;
  objc_msgSend(v12, "setMovieTrimStartTime:", &v46);
  -[BWIrisMovieInfo movieTrimEndTime](self, "movieTrimEndTime");
  v42 = v44;
  v43 = v45;
  objc_msgSend(v12, "setMovieTrimEndTime:", &v42);
  -[BWIrisMovieInfo beginTrimMasterPTS](self, "beginTrimMasterPTS");
  v38 = v40;
  v39 = v41;
  objc_msgSend(v12, "setBeginTrimMasterPTS:", &v38);
  -[BWIrisMovieInfo audioOffset](self, "audioOffset");
  v34 = v36;
  v35 = v37;
  objc_msgSend(v12, "setAudioOffset:", &v34);
  -[BWIrisMovieInfo stillTimeOffsetToVideoPrerollStartTime](self, "stillTimeOffsetToVideoPrerollStartTime");
  v30 = v32;
  v31 = v33;
  objc_msgSend(v12, "setStillTimeOffsetToVideoPrerollStartTime:", &v30);
  -[BWIrisMovieInfo stillTimeOffsetToVideoPrerollStopTime](self, "stillTimeOffsetToVideoPrerollStopTime");
  v26 = v28;
  v27 = v29;
  objc_msgSend(v12, "setStillTimeOffsetToVideoPrerollStopTime:", &v26);
  -[BWIrisMovieInfo stillTimeOffsetToAudioPrerollStartTime](self, "stillTimeOffsetToAudioPrerollStartTime");
  v22 = v24;
  v23 = v25;
  objc_msgSend(v12, "setStillTimeOffsetToAudioPrerollStartTime:", &v22);
  -[BWIrisMovieInfo stillTimeOffsetToAudioPrerollStopTime](self, "stillTimeOffsetToAudioPrerollStopTime");
  v18 = v20;
  v19 = v21;
  objc_msgSend(v12, "setStillTimeOffsetToAudioPrerollStopTime:", &v18);
  -[BWIrisMovieInfo masterMovieStartTime](self, "masterMovieStartTime");
  v14 = v16;
  v15 = v17;
  objc_msgSend(v12, "setMasterMovieStartTime:", &v14);
  objc_msgSend(v12, "setMasterMovieURL:", -[BWIrisMovieInfo masterMovieURL](self, "masterMovieURL"));
  objc_msgSend(v12, "setFinalReferenceMovie:", -[BWIrisMovieInfo isFinalReferenceMovie](self, "isFinalReferenceMovie"));
  objc_msgSend(v12, "setStillImageEncoderKeyFrameEmitted:", -[BWIrisMovieInfo stillImageEncoderKeyFrameEmitted](self, "stillImageEncoderKeyFrameEmitted"));
  objc_msgSend(v12, "setStillImageVISKeyFrameTagged:", -[BWIrisMovieInfo stillImageVISKeyFrameTagged](self, "stillImageVISKeyFrameTagged"));
  objc_msgSend(v12, "setFinalEnqueuedIrisRequest:", -[BWIrisMovieInfo isFinalEnqueuedIrisRequest](self, "isFinalEnqueuedIrisRequest"));
  objc_msgSend(v12, "setIsOverlappingRequest:", -[BWIrisMovieInfo isOverlappingRequest](self, "isOverlappingRequest"));
  objc_msgSend(v12, "setRequestedSDOFVariants:", -[BWIrisMovieInfo requestedSDOFVariants](self, "requestedSDOFVariants"));
  objc_msgSend(v12, "setTemporaryURLForSDOFOriginalMovie:", -[BWIrisMovieInfo temporaryURLForSDOFOriginalMovie](self, "temporaryURLForSDOFOriginalMovie"));
  objc_msgSend(v12, "setOutputURLForSDOFOriginalMovie:", -[BWIrisMovieInfo outputURLForSDOFOriginalMovie](self, "outputURLForSDOFOriginalMovie"));
  objc_msgSend(v12, "setMovieLevelMetadataForSDOFOriginalMovie:", -[BWIrisMovieInfo movieLevelMetadataForSDOFOriginalMovie](self, "movieLevelMetadataForSDOFOriginalMovie"));
  objc_msgSend(v12, "setVitalityScoreValid:", -[BWIrisMovieInfo isVitalityScoreValid](self, "isVitalityScoreValid"));
  -[BWIrisMovieInfo vitalityScore](self, "vitalityScore");
  objc_msgSend(v12, "setVitalityScore:");
  objc_msgSend(v12, "setVitalityScoringVersion:", -[BWIrisMovieInfo vitalityScoringVersion](self, "vitalityScoringVersion"));
  objc_msgSend(v12, "setTransitionVitalityScoreValid:", -[BWIrisMovieInfo isTransitionVitalityScoreValid](self, "isTransitionVitalityScoreValid"));
  -[BWIrisMovieInfo transitionVitalityScoreV1](self, "transitionVitalityScoreV1");
  objc_msgSend(v12, "setTransitionVitalityScoreV1:");
  objc_msgSend(v12, "setLimitStillImageTransformDuringVitalityPlayback:", -[BWIrisMovieInfo limitStillImageTransformDuringVitalityPlayback](self, "limitStillImageTransformDuringVitalityPlayback"));
  objc_msgSend(v12, "setSubjectRelightingResult:", -[BWIrisMovieInfo subjectRelightingResult](self, "subjectRelightingResult"));
  objc_msgSend(v12, "setStagingNodeOverallVideoFrameReceptionStats:", -[BWIrisMovieInfo stagingNodeOverallVideoFrameReceptionStats](self, "stagingNodeOverallVideoFrameReceptionStats"));
  objc_msgSend(v12, "setStagingNodeValveActiveVideoFrameReceptionStats:", -[BWIrisMovieInfo stagingNodeValveActiveVideoFrameReceptionStats](self, "stagingNodeValveActiveVideoFrameReceptionStats"));
  objc_msgSend(v12, "setFileCoordinatorToWriterMovingWindowLatencyStats:", -[BWIrisMovieInfo fileCoordinatorToWriterMovingWindowLatencyStats](self, "fileCoordinatorToWriterMovingWindowLatencyStats"));
  return v12;
}

- (BOOL)requiresSubjectRelightingCalculation
{
  int v3;
  FigCaptureSmartStyle *v4;

  v3 = !-[BWIrisMovieInfo isMomentCaptureMovieRecording](self, "isMomentCaptureMovieRecording");
  v4 = -[FigCaptureStillImageSettings smartStyle](-[BWIrisMovieInfo stillImageRequestSettings](self, "stillImageRequestSettings"), "smartStyle");
  if (v4)
    return -[FigCaptureSmartStyle isIdentity](v4, "isIdentity") & v3;
  return v3;
}

- (NSString)livePhotoMetadataStillImageKeyFrameSettingsID
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:isOriginalPhotoRecording:", -[FigCaptureRecordingSettings settingsID](self->_settings, "settingsID"), self->_originalPhotoRecording);
}

+ (id)livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:(int64_t)a3 isOriginalPhotoRecording:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("captureID:%lld:%d"), a3, a4);
}

- (FigCaptureMovieFileRecordingSettings)settings
{
  return self->_settings;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  retstr->var3 = *(int64_t *)((char *)&self[3].var0 + 4);
  return self;
}

- (void)setStillImageCaptureTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_stillImageCaptureTime.flags = a3->var3;
  *(_OWORD *)(&self->_spatialOverCaptureExpected + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageCaptureHostTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2;
  retstr->var3 = *(int64_t *)((char *)&self[4].var0 + 4);
  return self;
}

- (double)stillImageCaptureAbsoluteStartTime
{
  return self->_stillImageCaptureAbsoluteStartTime;
}

- (FigCaptureIrisStillImageSettings)stillImageRequestSettings
{
  return self->_stillImageRequestSettings;
}

- (BWStillImageCaptureSettings)stillImageCaptureSettings
{
  return self->_stillImageCaptureSettings;
}

- (BOOL)isMomentCaptureMovieRecording
{
  return self->_isMomentCaptureMovieRecording;
}

- (void)setMomentCaptureMovieRecording:(BOOL)a3
{
  self->_isMomentCaptureMovieRecording = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[5].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[6].var2;
  return self;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_momentCaptureMovieRecordingMasterEndTime.flags = a3->var3;
  *(_OWORD *)(&self->_isMomentCaptureMovieRecording + 4) = v3;
}

- (CGSize)nonDestructiveCropSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nonDestructiveCropSize.width;
  height = self->_nonDestructiveCropSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNonDestructiveCropSize:(CGSize)a3
{
  self->_nonDestructiveCropSize = a3;
}

- (BOOL)movieStartTimeRequiresCutting
{
  return self->_movieStartTimeRequiresCutting;
}

- (void)setMovieStartTimeRequiresCutting:(BOOL)a3
{
  self->_movieStartTimeRequiresCutting = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[7].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[8].var2;
  return self;
}

- (void)setMovieStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieStartTime.flags = a3->var3;
  *(_OWORD *)(&self->_movieStartTimeRequiresCutting + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[8].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[9].var2;
  return self;
}

- (void)setMovieEndTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieEndTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieStartTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieEndingVideoPTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[9].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[10].var2;
  return self;
}

- (void)setMovieEndingVideoPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieEndingVideoPTS.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieEndTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[10].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[11].var2;
  return self;
}

- (void)setMovieTrimStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieTrimStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieEndingVideoPTS.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieTrimEndTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[11].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[12].var2;
  return self;
}

- (void)setMovieTrimEndTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieTrimEndTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieTrimStartTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimMasterPTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[12].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[13].var2;
  return self;
}

- (void)setBeginTrimMasterPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_beginTrimMasterPTS.flags = a3->var3;
  *(_OWORD *)((char *)&self->_movieTrimEndTime.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[18].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[19].var2;
  return self;
}

- (void)setMasterMovieStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_masterMovieStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_stillTimeOffsetToAudioPrerollStopInMilliseconds.epoch + 4) = v3;
}

- (NSURL)outputMovieURL
{
  return self->_outputMovieURL;
}

- (void)setOutputMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSURL)temporaryMovieURL
{
  return self->_temporaryMovieURL;
}

- (void)setTemporaryMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSURL)masterMovieURL
{
  return self->_masterMovieURL;
}

- (void)setMasterMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (NSURL)spatialOverCaptureMasterMovieURL
{
  return self->_spatialOverCaptureMasterMovieURL;
}

- (void)setSpatialOverCaptureMasterMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSURL)spatialOverCaptureTemporaryMovieURL
{
  return self->_spatialOverCaptureTemporaryMovieURL;
}

- (void)setSpatialOverCaptureTemporaryMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSURL)spatialOverCaptureOutputMovieURL
{
  return self->_spatialOverCaptureOutputMovieURL;
}

- (void)setSpatialOverCaptureOutputMovieURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)spatialOverCaptureExpected
{
  return self->_spatialOverCaptureExpected;
}

- (void)setSpatialOverCaptureExpected:(BOOL)a3
{
  self->_spatialOverCaptureExpected = a3;
}

- (BOOL)isFinalReferenceMovie
{
  return self->_finalReferenceMovie;
}

- (void)setFinalReferenceMovie:(BOOL)a3
{
  self->_finalReferenceMovie = a3;
}

- (BOOL)isFinalEnqueuedIrisRequest
{
  return self->_finalEnqueuedIrisRequest;
}

- (void)setFinalEnqueuedIrisRequest:(BOOL)a3
{
  self->_finalEnqueuedIrisRequest = a3;
}

- (BOOL)isOverlappingRequest
{
  return self->_isOverlappingRequest;
}

- (void)setIsOverlappingRequest:(BOOL)a3
{
  self->_isOverlappingRequest = a3;
}

- (BOOL)stillImageEncoderKeyFrameEmitted
{
  return self->_stillImageEncoderKeyFrameEmitted;
}

- (void)setStillImageEncoderKeyFrameEmitted:(BOOL)a3
{
  self->_stillImageEncoderKeyFrameEmitted = a3;
}

- (BOOL)stillImageVISKeyFrameTagged
{
  return self->_stillImageVISKeyFrameTagged;
}

- (void)setStillImageVISKeyFrameTagged:(BOOL)a3
{
  self->_stillImageVISKeyFrameTagged = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffset
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[13].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[14].var2;
  return self;
}

- (void)setAudioOffset:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_audioOffset.flags = a3->var3;
  *(_OWORD *)((char *)&self->_beginTrimMasterPTS.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 656);
  return self;
}

- (void)setStillTimeOffsetToVideoPrerollStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToVideoPrerollStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStartTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToVideoPrerollStopTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 680);
  return self;
}

- (void)setStillTimeOffsetToVideoPrerollStopTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToVideoPrerollStopTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStopTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 704);
  return self;
}

- (void)setStillTimeOffsetToAudioPrerollStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToAudioPrerollStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStartTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTimeOffsetToAudioPrerollStopTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 728);
  return self;
}

- (void)setStillTimeOffsetToAudioPrerollStopTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillTimeOffsetToAudioPrerollStopTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStopTime.value = v3;
}

- (BOOL)isOriginalPhotoRecording
{
  return self->_originalPhotoRecording;
}

- (void)setOriginalPhotoRecording:(BOOL)a3
{
  self->_originalPhotoRecording = a3;
}

- (unsigned)requestedSDOFVariants
{
  return self->_requestedSDOFVariants;
}

- (void)setRequestedSDOFVariants:(unsigned int)a3
{
  self->_requestedSDOFVariants = a3;
}

- (NSURL)temporaryURLForSDOFOriginalMovie
{
  return self->_temporaryURLForSDOFOriginalMovie;
}

- (void)setTemporaryURLForSDOFOriginalMovie:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSURL)outputURLForSDOFOriginalMovie
{
  return self->_outputURLForSDOFOriginalMovie;
}

- (void)setOutputURLForSDOFOriginalMovie:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSArray)movieLevelMetadataForSDOFOriginalMovie
{
  return self->_movieLevelMetadataForSDOFOriginalMovie;
}

- (void)setMovieLevelMetadataForSDOFOriginalMovie:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BWStats)stagingNodeOverallVideoFrameReceptionStats
{
  return self->_stagingNodeOverallVideoFrameReceptionStats;
}

- (void)setStagingNodeOverallVideoFrameReceptionStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (BWStats)stagingNodeValveActiveVideoFrameReceptionStats
{
  return self->_stagingNodeValveActiveVideoFrameReceptionStats;
}

- (void)setStagingNodeValveActiveVideoFrameReceptionStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (BWStats)fileCoordinatorToWriterMovingWindowLatencyStats
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyStats;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (int)stillImageCaptureLuxLevel
{
  return self->_stillImageCaptureLuxLevel;
}

- (void)setStillImageCaptureLuxLevel:(int)a3
{
  self->_stillImageCaptureLuxLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (NSNumber)irisSequenceAdjusterRecipeIdentifier
{
  return self->_irisSequenceAdjusterRecipeIdentifier;
}

- (void)setIrisSequenceAdjusterRecipeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (float)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(float)a3
{
  self->_targetFrameRate = a3;
}

- (BWStats)videoFrameDurationStats
{
  return self->_videoFrameDurationStats;
}

- (void)setVideoFrameDurationStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (unint64_t)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unint64_t)a3
{
  self->_numberOfFramesDropped = a3;
}

- (double)processingTimeInMilliseconds
{
  return self->_processingTimeInMilliseconds;
}

- (void)setProcessingTimeInMilliseconds:(double)a3
{
  self->_processingTimeInMilliseconds = a3;
}

- (BOOL)isVitalityScoreValid
{
  return self->_vitalityScoreValid;
}

- (void)setVitalityScoreValid:(BOOL)a3
{
  self->_vitalityScoreValid = a3;
}

- (float)vitalityScore
{
  return self->_vitalityScore;
}

- (void)setVitalityScore:(float)a3
{
  self->_vitalityScore = a3;
}

- (unsigned)vitalityScoringVersion
{
  return self->_vitalityScoringVersion;
}

- (void)setVitalityScoringVersion:(unsigned int)a3
{
  self->_vitalityScoringVersion = a3;
}

- (BOOL)isTransitionVitalityScoreValid
{
  return self->_transitionVitalityScoreValid;
}

- (void)setTransitionVitalityScoreValid:(BOOL)a3
{
  self->_transitionVitalityScoreValid = a3;
}

- (float)transitionVitalityScoreV1
{
  return self->_transitionVitalityScoreV1;
}

- (void)setTransitionVitalityScoreV1:(float)a3
{
  self->_transitionVitalityScoreV1 = a3;
}

- (BOOL)limitStillImageTransformDuringVitalityPlayback
{
  return self->_limitStillImageTransformDuringVitalityPlayback;
}

- (void)setLimitStillImageTransformDuringVitalityPlayback:(BOOL)a3
{
  self->_limitStillImageTransformDuringVitalityPlayback = a3;
}

- (BWSubjectRelightingCalculatorResult)subjectRelightingResult
{
  return self->_subjectRelightingResult;
}

- (void)setSubjectRelightingResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (NSDictionary)transitionVitalityFeatures
{
  return self->_transitionVitalityFeatures;
}

- (void)setTransitionVitalityFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (int64_t)enqueuedHostTime
{
  return self->_enqueuedHostTime;
}

- (void)setEnqueuedHostTime:(int64_t)a3
{
  self->_enqueuedHostTime = a3;
}

@end
