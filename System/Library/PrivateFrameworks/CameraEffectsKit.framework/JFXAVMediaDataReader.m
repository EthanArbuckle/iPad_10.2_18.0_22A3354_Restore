@implementation JFXAVMediaDataReader

- (JFXAVMediaDataReader)initWithAVAssetTrack:(id)a3 withName:(id)a4
{
  id v7;
  id v8;
  char *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  _OWORD *v15;
  CMTime v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)JFXAVMediaDataReader;
  v9 = -[JFXAVMediaDataReader init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x24BDC0D78];
    v12 = *(_OWORD *)(MEMORY[0x24BDC0D78] + 16);
    *(_OWORD *)(v9 + 104) = *MEMORY[0x24BDC0D78];
    *(_OWORD *)(v9 + 120) = v12;
    *(_OWORD *)(v9 + 136) = *(_OWORD *)(v11 + 32);
    objc_storeStrong((id *)v9 + 5, a3);
    objc_msgSend(*((id *)v10 + 5), "asset");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = v13;

    *((_QWORD *)v10 + 9) = JFXSignpostIDFromObject(v10);
    objc_storeStrong((id *)v10 + 2, a4);
    v15 = v10 + 80;
    if (v7)
      objc_msgSend(v7, "minFrameDuration");
    else
      memset(&v17, 0, sizeof(v17));
    *v15 = *(_OWORD *)&v17.value;
    *((_QWORD *)v10 + 12) = v17.epoch;
    if ((v10[92] & 1) == 0)
    {
      CMTimeMake(&v17, 1, +[JFXMediaSettings frameRate](JFXMediaSettings, "frameRate"));
      *v15 = *(_OWORD *)&v17.value;
      *((_QWORD *)v10 + 12) = v17.epoch;
    }
  }

  return (JFXAVMediaDataReader *)v10;
}

- (BOOL)beginReading
{
  _OWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  -[JFXAVMediaDataReader JFX_allMediaTimeRange](self, "JFX_allMediaTimeRange");
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  return -[JFXAVMediaDataReader beginReadingAtTimeRange:](self, "beginReadingAtTimeRange:", v4);
}

- (BOOL)beginReadingAtTimeRange:(id *)a3
{
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  Float64 Seconds;
  __int128 v16;
  CMTimeValue v17;
  __int128 v18;
  CMTimeEpoch v19;
  CMTime v20;
  _OWORD v21[3];
  CMTime time;
  CMTimeRange time2;
  CMTime v24;
  __int128 v25;
  CMTimeEpoch v26;
  CMTime v27;
  CMTimeRange v28;
  CMTimeRange range1;
  CMTimeRange time1;
  CMTime end;
  CMTime v32;
  CMTime lhs;
  CMTime start;
  CMTimeRange range2;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (-[JFXAVMediaDataReader status](self, "status") == 1)
  {
    -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
    v5 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range2.start.epoch = v5;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
    if (CMTimeRangeEqual(&range1, &range2))
      return 1;
  }
  memset(&v28, 0, sizeof(v28));
  -[JFXAVMediaDataReader JFX_allMediaTimeRange](self, "JFX_allMediaTimeRange");
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var1.var0;
  time1.start.epoch = a3->var1.var3;
  *(_OWORD *)&time2.start.value = kMinimumReadingRangeDuration;
  time2.start.epoch = 0;
  CMTimeMaximum(&range2.start, &time1.start, &time2.start);
  *(_OWORD *)&a3->var1.var0 = *(_OWORD *)&range2.start.value;
  a3->var1.var3 = range2.start.epoch;
  memset(&v27, 0, sizeof(v27));
  -[JFXAVMediaDataReader minimumFrameDuration](self, "minimumFrameDuration");
  v7 = *(_OWORD *)&a3->var0.var0;
  time2 = v28;
  *(_OWORD *)&v24.value = v7;
  v24.epoch = a3->var0.var3;
  memset(&start, 0, sizeof(start));
  range2 = v28;
  CMTimeRangeGetEnd(&lhs, &range2);
  *(_OWORD *)&range2.start.value = v25;
  range2.start.epoch = v26;
  CMTimeSubtract(&start, &lhs, &range2.start);
  memset(&v32, 0, sizeof(v32));
  *(_OWORD *)&range2.start.value = *(_OWORD *)&time2.start.value;
  range2.start.epoch = time2.start.epoch;
  time1.start = start;
  CMTimeMaximum(&v32, &range2.start, &time1.start);
  range2.start = v32;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
  time1.start.epoch = time2.start.epoch;
  if (CMTimeCompare(&range2.start, &time1.start))
  {
    memset(&range2, 0, sizeof(range2));
    *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
    time1.start.epoch = time2.start.epoch;
    end = v32;
    CMTimeRangeFromTimeToTime(&range2, &time1.start, &end);
    end = v24;
    time1 = range2;
    CMTimeClampToRange(&v27, &end, &time1);
  }
  else
  {
    v27 = v32;
  }
  memset(&time1, 0, 24);
  v8 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range2.start.epoch = v8;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&time, &range2);
  range2 = v28;
  CMTimeClampToRange(&time1.start, &time, &range2);
  time2.start = v27;
  start = time1.start;
  CMTimeRangeFromTimeToTime(&range2, &time2.start, &start);
  v9 = *(_OWORD *)&range2.start.epoch;
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)&range2.start.value;
  *(_OWORD *)&a3->var0.var3 = v9;
  *(_OWORD *)&a3->var1.var1 = *(_OWORD *)&range2.duration.timescale;
  v10 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v10;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  -[JFXAVMediaDataReader setReadableTimeRange:](self, "setReadableTimeRange:", v21);
  JFXLog_DebugMediaDataReader();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    range2.start.epoch = a3->var0.var3;
    Seconds = CMTimeGetSeconds(&range2.start);
    v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range2.start.epoch = v16;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v20, &range2);
    *(double *)&v17 = CMTimeGetSeconds(&v20);
    LODWORD(range2.start.value) = 138412802;
    *(CMTimeValue *)((char *)&range2.start.value + 4) = (CMTimeValue)self;
    LOWORD(range2.start.flags) = 2048;
    *(Float64 *)((char *)&range2.start.flags + 2) = Seconds;
    HIWORD(range2.start.epoch) = 2048;
    range2.duration.value = v17;
    _os_log_debug_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEBUG, "%@ beginReadingAtTimeRange %f-%f", (uint8_t *)&range2, 0x20u);
  }

  JFXMediaDataReaderEventSignpostPointCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(range2.start.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v12, OS_SIGNPOST_EVENT, v14, "beginReadingAtTimeRange", (const char *)&unk_226AC25B2, (uint8_t *)&range2, 2u);
    }
  }

  -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
  *(_OWORD *)&range2.start.value = v18;
  range2.start.epoch = v19;
  if (-[JFXAVMediaDataReader status](self, "status") == 1)
  {
    *(_OWORD *)&time2.start.value = *(_OWORD *)&range2.start.value;
    time2.start.epoch = range2.start.epoch;
    return -[JFXAVMediaDataReader JFX_resetReaderFromTime:](self, "JFX_resetReaderFromTime:", &time2);
  }
  else
  {
    *(_OWORD *)&time2.start.value = *(_OWORD *)&range2.start.value;
    time2.start.epoch = range2.start.epoch;
    return -[JFXAVMediaDataReader beginReadingAtTime:](self, "beginReadingAtTime:", &time2);
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  _BYTE v9[24];
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_isScrubbing != a3)
  {
    v3 = a3;
    self->_isScrubbing = a3;
    JFXLog_DebugMediaDataReader();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[JFXAVMediaDataReader setIsScrubbing:].cold.1((uint64_t)self, v3, v5);

    JFXMediaDataReaderEventSignpostPointCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v3;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v6, OS_SIGNPOST_EVENT, v8, "ScrubModeChanged", "scrubbingMode set to %{BOOL}d", buf, 8u);
      }
    }

    if (-[JFXAVMediaDataReader status](self, "status") == 1)
    {
      -[JFXAVMediaDataReader startTimeOfCurrentData](self, "startTimeOfCurrentData");
      -[JFXAVMediaDataReader JFX_resetReaderFromTime:](self, "JFX_resetReaderFromTime:", v9);
    }
  }
}

- (BOOL)beginReadingAtTime:(id *)a3
{
  int64_t v5;
  double Seconds;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = -[JFXAVMediaDataReader status](self, "status");
  if (v5 != 1)
  {
    v19 = *a3;
    Seconds = CMTimeGetSeconds((CMTime *)&v19);
    JFXMediaDataReaderIntervalSignpostCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        LODWORD(v19.var0) = 134217984;
        *(double *)((char *)&v19.var0 + 4) = Seconds;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "beginReadingAtTime", "beginReading %f", (uint8_t *)&v19, 0xCu);
      }
    }

    JFXLog_DebugMediaDataReader();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[JFXAVMediaDataReader beginReadingAtTime:].cold.1(self, v10, Seconds);

    -[JFXAVMediaDataReader createAssetReader](self, "createAssetReader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader setAssetReader:](self, "setAssetReader:", v11);

    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_11;
    v19 = *a3;
    -[JFXAVMediaDataReader JFX_configureAssetReaderToReadFromTime:](self, "JFX_configureAssetReaderToReadFromTime:", &v19);
    -[JFXAVMediaDataReader createAssetReaderTrackOutput](self, "createAssetReaderTrackOutput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader setAssetReaderTrackOutput:](self, "setAssetReaderTrackOutput:", v13);

    -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_11;
    -[JFXAVMediaDataReader JFX_configureAssetReaderTrackOutput](self, "JFX_configureAssetReaderTrackOutput");
    LODWORD(v5) = -[JFXAVMediaDataReader prepareAssetReaderForReading](self, "prepareAssetReaderForReading");
    if ((_DWORD)v5)
    {
      if (-[JFXAVMediaDataReader status](self, "status") == 2)
      {
LABEL_11:
        LOBYTE(v5) = 0;
        return v5;
      }
      -[JFXAVMediaDataReader setStatus:](self, "setStatus:", 1);
      -[JFXAVMediaDataReader didUpdateReadingRange](self, "didUpdateReadingRange");
      JFXMediaDataReaderIntervalSignpostCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          LOWORD(v19.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_2269A9000, v15, OS_SIGNPOST_INTERVAL_END, v17, "beginReadingAtTime", (const char *)&unk_226AC25B2, (uint8_t *)&v19, 2u);
        }
      }

      LOBYTE(v5) = -[JFXAVMediaDataReader status](self, "status") != 2;
    }
  }
  return v5;
}

- (void)JFX_configureAssetReaderToReadFromTime:(id *)a3
{
  void *v5;
  CMTimeRange v6;
  CMTimeRange v7;
  CMTimeRange v8;
  CMTime rhs;
  CMTime lhs;
  CMTime start;
  CMTimeRange range;
  CMTime v13;
  CMTimeRange v14;

  memset(&v14, 0, sizeof(v14));
  memset(&v13, 0, sizeof(v13));
  -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
  CMTimeRangeGetEnd(&v13, &range);
  if (-[JFXAVMediaDataReader isScrubbing](self, "isScrubbing"))
  {
    memset(&start, 0, sizeof(start));
    lhs = (CMTime)*a3;
    *(_OWORD *)&rhs.value = kDefaultScrubbingReadingRangeDuration;
    rhs.epoch = 0;
    CMTimeAdd(&start, &lhs, &rhs);
    lhs = start;
    rhs = v13;
    if (CMTimeCompare(&lhs, &rhs) < 0)
      v13 = start;
  }
  start = (CMTime)*a3;
  lhs = v13;
  CMTimeRangeFromTimeToTime(&v14, &start, &lhs);
  v8 = v14;
  -[JFXAVMediaDataReader setCurrentReadingRange:](self, "setCurrentReadingRange:", &v8);
  v7 = v14;
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v5, "setTimeRange:", &v6);

}

- (void)setCurrentReadingRange:(id *)a3
{
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  Float64 Seconds;
  __int128 v11;
  Float64 v12;
  Float64 v13;
  Float64 v14;
  void *v15;
  void *v16;
  Float64 v17;
  CMTime v18;
  CMTimeRange range;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  _BYTE time[32];
  _BYTE v25[20];
  __int16 v26;
  Float64 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = *(_OWORD *)&a3->var0.var0;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_currentReadingRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_currentReadingRange.start.epoch = v6;
  *(_OWORD *)&self->_currentReadingRange.start.value = v5;
  JFXLog_DebugMediaDataReader();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    JFXLog_DebugMediaDataReader();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
      *(_QWORD *)&time[16] = a3->var0.var3;
      Seconds = CMTimeGetSeconds((CMTime *)time);
      v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&time[16] = v11;
      *(_OWORD *)v25 = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v23, (CMTimeRange *)time);
      v12 = CMTimeGetSeconds(&v23);
      -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
      v22 = v21;
      v13 = CMTimeGetSeconds(&v22);
      -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
      CMTimeRangeGetEnd(&v20, &range);
      v14 = CMTimeGetSeconds(&v20);
      -[JFXAVMediaDataReader asset](self, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "duration");
      else
        memset(&v18, 0, sizeof(v18));
      v17 = CMTimeGetSeconds(&v18);
      *(_DWORD *)time = 138413570;
      *(_QWORD *)&time[4] = self;
      *(_WORD *)&time[12] = 2048;
      *(Float64 *)&time[14] = Seconds;
      *(_WORD *)&time[22] = 2048;
      *(Float64 *)&time[24] = v12;
      *(_WORD *)v25 = 2048;
      *(Float64 *)&v25[2] = v13;
      *(_WORD *)&v25[10] = 2048;
      *(Float64 *)&v25[12] = v14;
      v26 = 2048;
      v27 = v17;
      _os_log_debug_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEBUG, "%@ asset reading range configured to start:%f end:%f with overall mediaStart %f, mediaDuration %f assetDuration %f", time, 0x3Eu);

    }
  }
}

- (void)JFX_configureAssetReaderTrackOutput
{
  void *v3;
  id v4;

  if (-[JFXAVMediaDataReader isScrubbing](self, "isScrubbing"))
  {
    -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSupportsRandomAccess:", 1);

  }
  -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysCopiesSampleData:", 0);

}

- (id)createAssetReader
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  v3 = (void *)MEMORY[0x24BDB23B8];
  -[JFXAVMediaDataReader asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "assetReaderWithAsset:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v5)
    v7 = v5;
  else
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v6);

  return v5;
}

- (id)createAssetReaderTrackOutput
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDB23D0];
  -[JFXAVMediaDataReader assetTrack](self, "assetTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetReaderTrackOutputWithTrack:outputSettings:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)prepareAssetReaderForReading
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOutput:", v4);

  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "startReading");

  if ((v6 & 1) == 0)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v8);

  }
  return v6;
}

- (BOOL)seekToTime:(id *)a3
{
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  Float64 Seconds;
  Float64 v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  _BOOL4 v16;
  Float64 v17;
  CMTimeValue v18;
  Float64 v20;
  CMTimeValue v21;
  Float64 v22;
  CMTimeValue v23;
  void *v24;
  CMTime time;
  CMTime v26;
  __int128 v27;
  CMTimeEpoch v28;
  CMTimeRange v29;
  CMTime v30;
  CMTimeRange time2;
  CMTime end;
  CMTime v33;
  CMTime lhs;
  CMTime v35;
  CMTimeRange range;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[JFXAVMediaDataReader status](self, "status") == 2)
    return 0;
  -[JFXAVMediaDataReader readableTimeRange](self, "readableTimeRange");
  -[JFXAVMediaDataReader minimumFrameDuration](self, "minimumFrameDuration");
  v26 = (CMTime)*a3;
  memset(&v35, 0, sizeof(v35));
  range = v29;
  CMTimeRangeGetEnd(&lhs, &range);
  *(_OWORD *)&range.start.value = v27;
  range.start.epoch = v28;
  CMTimeSubtract(&v35, &lhs, &range.start);
  memset(&v33, 0, sizeof(v33));
  *(_OWORD *)&range.start.value = *(_OWORD *)&v29.start.value;
  range.start.epoch = v29.start.epoch;
  time2.start = v35;
  CMTimeMaximum(&v33, &range.start, &time2.start);
  range.start = v33;
  *(_OWORD *)&time2.start.value = *(_OWORD *)&v29.start.value;
  time2.start.epoch = v29.start.epoch;
  if (CMTimeCompare(&range.start, &time2.start))
  {
    memset(&range, 0, sizeof(range));
    *(_OWORD *)&time2.start.value = *(_OWORD *)&v29.start.value;
    time2.start.epoch = v29.start.epoch;
    end = v33;
    CMTimeRangeFromTimeToTime(&range, &time2.start, &end);
    end = v26;
    time2 = range;
    CMTimeClampToRange(&v30, &end, &time2);
  }
  else
  {
    v30 = v33;
  }
  *(CMTime *)a3 = v30;
  memset(&time2, 0, 24);
  -[JFXAVMediaDataReader startTimeOfCurrentData](self, "startTimeOfCurrentData");
  JFXMediaDataReaderIntervalSignpostCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
      range.start.epoch = time2.start.epoch;
      Seconds = CMTimeGetSeconds(&range.start);
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
      range.start.epoch = a3->var3;
      v9 = CMTimeGetSeconds(&range.start);
      LODWORD(range.start.value) = 134218240;
      *(Float64 *)((char *)&range.start.value + 4) = Seconds;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v9;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Seeking", "seek from %f to %f ", (uint8_t *)&range, 0x16u);
    }
  }

  JFXLog_DebugMediaDataReader();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
    range.start.epoch = time2.start.epoch;
    v20 = CMTimeGetSeconds(&range.start);
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
    range.start.epoch = a3->var3;
    *(double *)&v21 = CMTimeGetSeconds(&range.start);
    LODWORD(range.start.value) = 138412802;
    *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
    LOWORD(range.start.flags) = 2048;
    *(Float64 *)((char *)&range.start.flags + 2) = v20;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v21;
    _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "%@ seek from %f to %f", (uint8_t *)&range, 0x20u);
  }

  *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
  range.start.epoch = time2.start.epoch;
  v35 = (CMTime)*a3;
  -[JFXAVMediaDataReader JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:toTime:](self, "JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:toTime:", &range, &v35);
  if (-[JFXAVMediaDataReader status](self, "status") == 2)
    return 0;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  v11 = -[JFXAVMediaDataReader readAheadToTime:](self, "readAheadToTime:", &range);
  JFXMediaDataReaderIntervalSignpostCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(range.start.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v12, OS_SIGNPOST_INTERVAL_END, v14, "Seeking", (const char *)&unk_226AC25B2, (uint8_t *)&range, 2u);
    }
  }

  JFXLog_DebugMediaDataReader();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v16)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
      range.start.epoch = a3->var3;
      v17 = CMTimeGetSeconds(&range.start);
      -[JFXAVMediaDataReader startTimeOfCurrentData](self, "startTimeOfCurrentData");
      *(double *)&v18 = CMTimeGetSeconds(&time);
      LODWORD(range.start.value) = 138412802;
      *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v17;
      HIWORD(range.start.epoch) = 2048;
      range.duration.value = v18;
      _os_log_debug_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEBUG, "%@ data found for time %f at %f", (uint8_t *)&range, 0x20u);
    }
  }
  else if (v16)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
    range.start.epoch = a3->var3;
    v22 = CMTimeGetSeconds(&range.start);
    v23 = -[JFXAVMediaDataReader status](self, "status");
    -[JFXAVMediaDataReader error](self, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(range.start.value) = 138413058;
    *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
    LOWORD(range.start.flags) = 2048;
    *(Float64 *)((char *)&range.start.flags + 2) = v22;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v23;
    LOWORD(range.duration.timescale) = 2112;
    *(_QWORD *)((char *)&range.duration.timescale + 2) = v24;
    _os_log_debug_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEBUG, "%@ data not found for time %f, status %ld error %@", (uint8_t *)&range, 0x2Au);

  }
  return v11;
}

- (void)JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  v6 = *a4;
  if (-[JFXAVMediaDataReader JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:toTime:](self, "JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:toTime:", &v7, &v6))
  {
    if (-[JFXAVMediaDataReader isScrubbing](self, "isScrubbing"))
    {
      v7 = *a4;
      -[JFXAVMediaDataReader JFX_resetReadingRangeWhenScrubbingToTime:](self, "JFX_resetReadingRangeWhenScrubbingToTime:", &v7);
    }
    else
    {
      v7 = *a4;
      -[JFXAVMediaDataReader JFX_resetReaderFromTime:](self, "JFX_resetReaderFromTime:", &v7);
    }
  }
}

- (BOOL)JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4
{
  Float64 Seconds;
  Float64 v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  CMTimeRange v18;
  CMTime time2;
  CMTime time;
  Float64 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  time = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&time);
  time = *(CMTime *)a4;
  v8 = CMTimeGetSeconds(&time);
  time = *(CMTime *)a4;
  time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time, &time2) < 0)
  {
    JFXMediaDataReaderEventSignpostPointCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        LODWORD(time.value) = 134218240;
        *(Float64 *)((char *)&time.value + 4) = Seconds;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v8;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v15, OS_SIGNPOST_EVENT, v17, "Seeking", "seek backwards from %f to %f", (uint8_t *)&time, 0x16u);
      }
    }

    JFXLog_DebugMediaDataReader();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    LODWORD(time.value) = 138412802;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = Seconds;
    HIWORD(time.epoch) = 2048;
    v21 = v8;
    v13 = "%@ seek backwards from %f to %f";
    goto LABEL_19;
  }
  time = (CMTime)*a4;
  time2 = (CMTime)*a3;
  if (CMTimeCompare(&time, &time2) >= 1)
  {
    time = (CMTime)*a3;
    time2 = (CMTime)*a4;
    if (-[JFXAVMediaDataReader seekingAheadIsExpensiveFromTime:toTime:](self, "seekingAheadIsExpensiveFromTime:toTime:", &time, &time2))
    {
      JFXMediaDataReaderEventSignpostPointCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          LODWORD(time.value) = 134218240;
          *(Float64 *)((char *)&time.value + 4) = Seconds;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v8;
          _os_signpost_emit_with_name_impl(&dword_2269A9000, v9, OS_SIGNPOST_EVENT, v11, "Seeking", "large seek forward from %f to %f", (uint8_t *)&time, 0x16u);
        }
      }

      JFXLog_DebugMediaDataReader();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      HIWORD(time.epoch) = 2048;
      v21 = v8;
      v13 = "%@ large seek forward from %f to %f";
LABEL_19:
      _os_log_debug_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&time, 0x20u);
LABEL_16:

      return 1;
    }
  }
  if (!-[JFXAVMediaDataReader isScrubbing](self, "isScrubbing"))
    return 0;
  -[JFXAVMediaDataReader currentReadingRange](self, "currentReadingRange");
  time = (CMTime)*a4;
  return !CMTimeRangeContainsTime(&v18, &time);
}

- (BOOL)seekingAheadIsExpensiveFromTime:(id *)a3 toTime:(id *)a4
{
  double Seconds;
  CMTime v7;

  v7 = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&v7);
  v7 = *(CMTime *)a4;
  return CMTimeGetSeconds(&v7) - Seconds > 1.0;
}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  JFXLog_mediaDataReader();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[JFXAVMediaDataReader didFailWithError:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  -[JFXAVMediaDataReader setError:](self, "setError:", v4);
  -[JFXAVMediaDataReader setStatus:](self, "setStatus:", 2);

}

- (BOOL)JFX_resetReaderFromTime:(id *)a3
{
  Float64 Seconds;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = *a3;
  Seconds = CMTimeGetSeconds((CMTime *)&v15);
  JFXMediaDataReaderIntervalSignpostCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LODWORD(v15.var0) = 134217984;
      *(Float64 *)((char *)&v15.var0 + 4) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "resetReader", "resetReaderAtTime %f", (uint8_t *)&v15, 0xCu);
    }
  }

  JFXLog_DebugMediaDataReader();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[JFXAVMediaDataReader JFX_resetReaderFromTime:].cold.1();

  -[JFXAVMediaDataReader cancelReadingForReaderReset](self, "cancelReadingForReaderReset");
  -[JFXAVMediaDataReader JFX_releaseReadersForReset](self, "JFX_releaseReadersForReset");
  -[JFXAVMediaDataReader setStatus:](self, "setStatus:", 0);
  v15 = *a3;
  v10 = -[JFXAVMediaDataReader beginReadingAtTime:](self, "beginReadingAtTime:", &v15);
  JFXMediaDataReaderIntervalSignpostCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v15.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v11, OS_SIGNPOST_INTERVAL_END, v13, "resetReader", (const char *)&unk_226AC25B2, (uint8_t *)&v15, 2u);
    }
  }

  return v10;
}

- (void)cancelReadingForReaderReset
{
  id v2;

  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelReading");

}

- (void)JFX_releaseReadersForReset
{
  -[JFXAVMediaDataReader setAssetReader:](self, "setAssetReader:", 0);
  -[JFXAVMediaDataReader setAssetReaderTrackOutput:](self, "setAssetReaderTrackOutput:", 0);
}

- (void)JFX_resetReadingRangeWhenScrubbingToTime:(id *)a3
{
  Float64 Seconds;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  CMTimeRange v16;
  CMTimeRange start;
  CMTime duration;
  void *v19;
  CMTimeRange time;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  time.start = (CMTime)*a3;
  Seconds = CMTimeGetSeconds(&time.start);
  JFXMediaDataReaderIntervalSignpostCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LODWORD(time.start.value) = 134217984;
      *(Float64 *)((char *)&time.start.value + 4) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "resetReadingRangeWhenScrubbingToTime", "reset when scrubbing at %f", (uint8_t *)&time, 0xCu);
    }
  }

  JFXLog_DebugMediaDataReader();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[JFXAVMediaDataReader JFX_resetReadingRangeWhenScrubbingToTime:].cold.1();

  if (!-[JFXAVMediaDataReader hasRemainingAvailableData](self, "hasRemainingAvailableData")
    || (-[JFXAVMediaDataReader readAndDiscardRemainingAvailableData](self, "readAndDiscardRemainingAvailableData"),
        -[JFXAVMediaDataReader status](self, "status") != 2))
  {
    memset(&time, 0, sizeof(time));
    *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
    start.start.epoch = a3->var3;
    *(_OWORD *)&duration.value = kDefaultScrubbingReadingRangeDuration;
    duration.epoch = 0;
    CMTimeRangeMake(&time, &start.start, &duration);
    start = time;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTimeRange:", &start);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXAVMediaDataReader assetReaderTrackOutput](self, "assetReaderTrackOutput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetForReadingTimeRanges:", v11);

    v16 = time;
    -[JFXAVMediaDataReader setCurrentReadingRange:](self, "setCurrentReadingRange:", &v16);
    -[JFXAVMediaDataReader didUpdateReadingRange](self, "didUpdateReadingRange");
    JFXMediaDataReaderIntervalSignpostCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[JFXAVMediaDataReader signPostID](self, "signPostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        LOWORD(start.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v13, OS_SIGNPOST_INTERVAL_END, v15, "resetReadingRangeWhenScrubbingToTime", (const char *)&unk_226AC25B2, (uint8_t *)&start, 2u);
      }
    }

  }
}

- (void)didUpdateReadingRange
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)readAheadToTime:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)readAndDiscardRemainingAvailableData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)hasRemainingAvailableData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- ($70930193D4F448A53BB9343C0237EB5F)JFX_allMediaTimeRange
{
  void *v4;
  void *v5;
  $70930193D4F448A53BB9343C0237EB5F *result;
  CMTime v7;
  CMTime duration;

  -[JFXAVMediaDataReader asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake((CMTimeRange *)retstr, &v7, &duration);

  return result;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (void)setAssetTrack:(id)a3
{
  objc_storeStrong((id *)&self->_assetTrack, a3);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
  objc_storeStrong((id *)&self->_assetReader, a3);
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_assetReaderTrackOutput;
}

- (void)setAssetReaderTrackOutput:(id)a3
{
  objc_storeStrong((id *)&self->_assetReaderTrackOutput, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (unint64_t)signPostID
{
  return self->_signPostID;
}

- (void)setSignPostID:(unint64_t)a3
{
  self->_signPostID = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setReadableTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_readableTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_readableTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_readableTimeRange.start.value = v3;
}

- ($70930193D4F448A53BB9343C0237EB5F)currentReadingRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReaderTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetTrack, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setIsScrubbing:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "%@ scrubbingMode set to %{BOOL}d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)beginReadingAtTime:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  int v4;
  void *v5;
  __int16 v6;
  double v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 138412802;
  v5 = a1;
  v6 = 2048;
  v7 = a3;
  v8 = 1024;
  v9 = objc_msgSend(a1, "isScrubbing");
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "%@ begin reading for time %f isScrubbing %{BOOL}d", (uint8_t *)&v4, 0x1Cu);
}

- (void)didFailWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "%@ reading did fail, and can no longer be read with error %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)JFX_resetReaderFromTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3(&dword_2269A9000, v0, v1, "%@ reset reader at time %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)JFX_resetReadingRangeWhenScrubbingToTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3(&dword_2269A9000, v0, v1, "%@ resetReadingRangeWhenScrubbingToTime for time %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
