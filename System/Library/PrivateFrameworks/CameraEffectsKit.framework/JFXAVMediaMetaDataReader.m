@implementation JFXAVMediaMetaDataReader

- (id)createAssetReaderTrackOutput
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXAVMediaMetaDataReader;
  -[JFXAVMediaDataReader createAssetReaderTrackOutput](&v6, sel_createAssetReaderTrackOutput);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB23C8], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXAVMediaMetaDataReader setAssetReaderOutputMetadataAdaptor:](self, "setAssetReaderOutputMetadataAdaptor:", v4);

  return v3;
}

- (void)cancelReadingForReaderReset
{
  objc_super v3;

  -[JFXAVMediaMetaDataReader setAssetReaderOutputMetadataAdaptor:](self, "setAssetReaderOutputMetadataAdaptor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)JFXAVMediaMetaDataReader;
  -[JFXAVMediaDataReader cancelReadingForReaderReset](&v3, sel_cancelReadingForReaderReset);
}

- (void)didUpdateReadingRange
{
  -[JFXAVMediaMetaDataReader setCurrentMetadataItem:](self, "setCurrentMetadataItem:", 0);
  -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", 0);
  -[JFXAVMediaMetaDataReader JFX_preloadData](self, "JFX_preloadData");
}

- (BOOL)readAheadToTime:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int32_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;
  CMTime time2;

  -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "time");
      else
        memset(&time2, 0, sizeof(time2));
      v22 = *a3;
      v9 = CMTimeCompare((CMTime *)&v22, &time2);

      if (v9 < 0)
        break;
      v10 = (void *)MEMORY[0x2276A1DB0]();
      -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAVMediaMetaDataReader setCurrentMetadataItem:](self, "setCurrentMetadataItem:", v11);

      -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_assetReaderOutputMetadataAdaptor, "nextTimedMetadataGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "items");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", v15);

      }
      else
      {
        -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", 0);
      }

      objc_autoreleasePoolPop(v10);
      -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v6);
  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "status");

  if (v17 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v20);

    goto LABEL_15;
  }
  -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24EE9C548, 0);
LABEL_15:

  }
  return v17 != 3;
}

- (void)readAndDiscardRemainingAvailableData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      v4 = (void *)MEMORY[0x2276A1DB0]();
      -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_assetReaderOutputMetadataAdaptor, "nextTimedMetadataGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "items");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", v8);

      }
      else
      {
        -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", 0);
      }

      objc_autoreleasePoolPop(v4);
      -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v9);
  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "status");

  if (v11 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v12);

  }
}

- (BOOL)hasRemainingAvailableData
{
  void *v2;
  BOOL v3;

  -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
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

  -[JFXAVMediaMetaDataReader currentMetadataItem](self, "currentMetadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[JFXAVMediaMetaDataReader currentMetadataItem](self, "currentMetadataItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = v7;
      objc_msgSend(v7, "time");
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

- (id)metadataForTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  if (-[JFXAVMediaDataReader seekToTime:](self, "seekToTime:", &v6))
  {
    -[JFXAVMediaMetaDataReader currentMetadataItem](self, "currentMetadataItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)JFX_preloadData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  Float64 Seconds;
  CMTime v23;
  CMTime time;
  uint8_t buf[4];
  JFXAVMediaMetaDataReader *v26;
  __int16 v27;
  Float64 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 1)
  {
    -[JFXAVMediaMetaDataReader assetReaderOutputMetadataAdaptor](self, "assetReaderOutputMetadataAdaptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextTimedMetadataGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaMetaDataReader setCurrentMetadataItem:](self, "setCurrentMetadataItem:", v8);

  }
  -[JFXAVMediaMetaDataReader currentMetadataItem](self, "currentMetadataItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    JFXLog_DebugMediaDataReader();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[JFXAVMediaDataReader currentReadingRange](self, "currentReadingRange");
      time = v23;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2048;
      v28 = Seconds;
      _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "%@ could not preload metadata from time %f", buf, 0x16u);
    }

  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "status");

  if (v12 == 1)
  {
    -[JFXAVMediaMetaDataReader assetReaderOutputMetadataAdaptor](self, "assetReaderOutputMetadataAdaptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nextTimedMetadataGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaMetaDataReader setNextMetadataItem:](self, "setNextMetadataItem:", v16);

    -[JFXAVMediaMetaDataReader nextMetadataItem](self, "nextMetadataItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "time");

  }
  -[JFXAVMediaDataReader assetReader](self, "assetReader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "status");

  if (v19 == 3)
  {
    -[JFXAVMediaDataReader assetReader](self, "assetReader");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVMediaDataReader didFailWithError:](self, "didFailWithError:", v21);

  }
}

- (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptor
{
  return self->_assetReaderOutputMetadataAdaptor;
}

- (void)setAssetReaderOutputMetadataAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_assetReaderOutputMetadataAdaptor, a3);
}

- (AVMetadataItem)currentMetadataItem
{
  return self->_currentMetadataItem;
}

- (void)setCurrentMetadataItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentMetadataItem, a3);
}

- (AVMetadataItem)nextMetadataItem
{
  return self->_nextMetadataItem;
}

- (void)setNextMetadataItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextMetadataItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMetadataItem, 0);
  objc_storeStrong((id *)&self->_currentMetadataItem, 0);
  objc_storeStrong((id *)&self->_assetReaderOutputMetadataAdaptor, 0);
}

@end
