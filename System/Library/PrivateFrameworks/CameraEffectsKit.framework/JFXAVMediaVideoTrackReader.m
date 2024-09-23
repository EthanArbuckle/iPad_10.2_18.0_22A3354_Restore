@implementation JFXAVMediaVideoTrackReader

- (id)createAssetReaderTrackOutput
{
  void *v3;
  void *v4;
  void *v5;
  FourCharCode MediaSubType;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[JFXAVMediaDataReader assetTrack](self, "assetTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v5);
  if (MediaSubType == 1752589105)
    v7 = 1212493921;
  else
    v7 = MediaSubType;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "trackOptionsForDepthCodecType:error:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = *MEMORY[0x24BDC56B8];
    v16[0] = &unk_24EE9B9D8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = objc_alloc(MEMORY[0x24BDB23D0]);
  -[JFXAVMediaDataReader assetTrack](self, "assetTrack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTrack:outputSettings:", v11, v8);

  return v12;
}

- (void)didUpdateReadingRange
{
  -[JFXAVMediaVideoTrackReader setCurrentSample:](self, "setCurrentSample:", 0);
  -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", 0);
  -[JFXAVMediaVideoTrackReader JFX_preloadData](self, "JFX_preloadData");
}

- (BOOL)readAheadToTime:(id *)a3
{
  uint64_t v5;
  void *v6;
  CMTime *v7;
  void *v8;
  void *v9;
  int32_t v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  JFXAVMediaVideoTrackReaderSample *v15;
  JFXAVMediaVideoTrackReaderSample *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;
  CMTime time2;

  -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (CMTime *)MEMORY[0x24BDC0D88];
    do
    {
      -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "presentationTimeStamp");
      else
        memset(&time2, 0, sizeof(time2));
      v22 = *a3;
      v10 = CMTimeCompare((CMTime *)&v22, &time2);

      if (v10 < 0)
        break;
      v11 = (void *)MEMORY[0x2276A1DB0]();
      -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAVMediaVideoTrackReader setCurrentSample:](self, "setCurrentSample:", v12);

      -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (const void *)objc_msgSend(v13, "copyNextSampleBuffer");

      if (v14)
      {
        v15 = [JFXAVMediaVideoTrackReaderSample alloc];
        v22 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)v7;
        v16 = -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:duration:](v15, "initWithSampleBuffer:duration:", v14, &v22);
        -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", v16);

        CFRelease(v14);
      }
      else
      {
        -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", 0);
      }
      objc_autoreleasePoolPop(v11);
      -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v6);
  }
  -[JFXAVMediaVideoTrackReader JFX_updateCurrentSampleDurationIfNeeded](self, "JFX_updateCurrentSampleDurationIfNeeded");
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "status");

  if (v18 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v20);

  }
  return v18 != 3;
}

- (void)readAndDiscardRemainingAvailableData
{
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  JFXAVMediaVideoTrackReaderSample *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      v4 = (void *)MEMORY[0x2276A1DB0]();
      -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (const void *)objc_msgSend(v5, "copyNextSampleBuffer");

      if (v6)
      {
        v7 = -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:]([JFXAVMediaVideoTrackReaderSample alloc], "initWithSampleBuffer:", v6);
        -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", v7);

        CFRelease(v6);
      }
      else
      {
        -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", 0);
      }
      objc_autoreleasePoolPop(v4);
      -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v8);
  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "status");

  if (v10 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v11);

  }
}

- (BOOL)hasRemainingAvailableData
{
  void *v2;
  BOOL v3;

  -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;
  uint64_t v8;
  void *v9;

  -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = v7;
      objc_msgSend(v7, "presentationTimeStamp");
      v7 = v9;
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }

  }
  else
  {
    v8 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D88];
    retstr->var3 = *(_QWORD *)(v8 + 16);
  }
  return result;
}

- (void)JFX_preloadData
{
  void *v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  JFXAVMediaVideoTrackReaderSample *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  JFXAVMediaVideoTrackReaderSample *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Float64 Seconds;
  CMTime v20;
  CMTime time;
  uint8_t buf[4];
  JFXAVMediaVideoTrackReader *v23;
  __int16 v24;
  Float64 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 1)
  {
    -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)objc_msgSend(v5, "copyNextSampleBuffer");

    if (v6)
    {
      v7 = -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:]([JFXAVMediaVideoTrackReaderSample alloc], "initWithSampleBuffer:", v6);
      -[JFXAVMediaVideoTrackReader setCurrentSample:](self, "setCurrentSample:", v7);

      CFRelease(v6);
    }
  }
  -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    JFXLog_DebugMediaDataReader();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[JFXAVMediaDataReader currentReadingRange](self, "currentReadingRange");
      time = v20;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2048;
      v25 = Seconds;
      _os_log_debug_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEBUG, "%@ could not preload metadata from time %f", buf, 0x16u);
    }

  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "status");

  if (v11 == 1)
  {
    -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const void *)objc_msgSend(v12, "copyNextSampleBuffer");

    if (v13)
    {
      v14 = -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:]([JFXAVMediaVideoTrackReaderSample alloc], "initWithSampleBuffer:", v13);
      -[JFXAVMediaVideoTrackReader setNextSample:](self, "setNextSample:", v14);

      CFRelease(v13);
    }
  }
  -[JFXAVMediaVideoTrackReader JFX_updateCurrentSampleDurationIfNeeded](self, "JFX_updateCurrentSampleDurationIfNeeded");
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "status");

  if (v16 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v18);

  }
}

- (void)JFX_updateCurrentSampleDurationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  JFXAVMediaVideoTrackReaderSample *v12;
  void *v13;
  uint64_t v14;
  JFXAVMediaVideoTrackReaderSample *v15;
  CMTime v16;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  CMTime v20;

  -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    memset(&v20, 0, sizeof(v20));
    -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&v20, 0, sizeof(v20));

    if ((v20.flags & 1) == 0
      || (time1 = v20, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88], !CMTimeCompare(&time1, &time2)))
    {
      memset(&time1, 0, sizeof(time1));
      -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CMSampleBufferGetDuration(&time1, (CMSampleBufferRef)objc_msgSend(v6, "sampleBufferRef"));

      if ((time1.flags & 1) == 0)
      {
        -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[JFXAVMediaVideoTrackReader nextSample](self, "nextSample");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
            objc_msgSend(v8, "presentationTimeStamp");
          else
            memset(&lhs, 0, sizeof(lhs));
          -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
            objc_msgSend(v10, "presentationTimeStamp");
          else
            memset(&v16, 0, sizeof(v16));
          CMTimeSubtract(&time2, &lhs, &v16);
          time1 = time2;

        }
      }
      if ((time1.flags & 1) != 0)
      {
        v12 = [JFXAVMediaVideoTrackReaderSample alloc];
        -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "sampleBufferRef");
        time2 = time1;
        v15 = -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:duration:](v12, "initWithSampleBuffer:duration:", v14, &time2);
        -[JFXAVMediaVideoTrackReader setCurrentSample:](self, "setCurrentSample:", v15);

      }
    }
  }
}

- (id)videoSampleForTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  if (-[JFXAVMediaDataReader seekToTime:](self, "seekToTime:", &v6))
  {
    -[JFXAVMediaVideoTrackReader currentSample](self, "currentSample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (JFXAVMediaVideoTrackReaderSample)currentSample
{
  return self->_currentSample;
}

- (void)setCurrentSample:(id)a3
{
  objc_storeStrong((id *)&self->_currentSample, a3);
}

- (JFXAVMediaVideoTrackReaderSample)nextSample
{
  return self->_nextSample;
}

- (void)setNextSample:(id)a3
{
  objc_storeStrong((id *)&self->_nextSample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSample, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end
