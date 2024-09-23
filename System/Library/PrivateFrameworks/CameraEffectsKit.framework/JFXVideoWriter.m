@implementation JFXVideoWriter

- (void)setStoreDepthDataAsVideoTrack:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  if (a3 && -[JFXVideoWriter depthDimensions](self, "depthDimensions"))
  {
    if ((unint64_t)-[JFXVideoWriter depthDimensions](self, "depthDimensions") >> 32)
    {
      v4 = *MEMORY[0x24BDC56B8];
      v10[0] = &unk_24EE9BD38;
      v5 = *MEMORY[0x24BDC5708];
      v9[0] = v4;
      v9[1] = v5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v6;
      v9[2] = *MEMORY[0x24BDC5650];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (unint64_t)-[JFXVideoWriter depthDimensions](self, "depthDimensions") >> 32);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXVideoWriter setDepthBGRAPixelBufferAttributes:](self, "setDepthBGRAPixelBufferAttributes:", v8);

      BYTE1(self->_audioBufferQ) = 1;
    }
  }
}

- (NSURL)videoURL
{
  void *v2;
  void *v3;

  -[JFXVideoWriter folderURL](self, "folderURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("video.mov"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)metadataURL
{
  void *v2;
  void *v3;

  -[JFXVideoWriter folderURL](self, "folderURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("metadata.mov"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (JFXVideoWriter)initWithFolderURL:(id)a3 videoOutputSettings:(id)a4 audioOutputSettings:(id)a5 audioFormatHint:(opaqueCMFormatDescription *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v44;
  id v45;
  id v46;
  opaqueCMFormatDescription *v47;
  objc_super v48;
  char v49;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v49 = 0;
  v14 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v11, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, &v49);

  v48.receiver = self;
  v48.super_class = (Class)JFXVideoWriter;
  v16 = -[JFXVideoWriter init](&v48, sel_init);
  if (v16)
  {
    if (initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint__onceToken != -1)
      dispatch_once(&initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint__onceToken, &__block_literal_global_43);
    *((_QWORD *)v16 + 37) = JFXSignpostIDFromObject(v16);
    v17 = v12;
    v18 = v17;
    if (v17)
    {
      v47 = a6;
      v19 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDB2268]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqual:", *MEMORY[0x24BDB22A0]))
      {
        v45 = v13;
        v46 = v12;
        v44 = *MEMORY[0x24BDB22C8];
        objc_msgSend(v19, "objectForKeyedSubscript:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDB2248]);
        v23 = *MEMORY[0x24BDB2250];
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDB2250]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27 * 1.2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v23);

        }
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, v44);

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v19);
        v30 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v30;
        v13 = v45;
        v12 = v46;
      }

      a6 = v47;
    }
    objc_storeStrong((id *)v16 + 32, a3);
    v31 = objc_msgSend(v18, "copy");
    v32 = (void *)*((_QWORD *)v16 + 33);
    *((_QWORD *)v16 + 33) = v31;

    v33 = objc_msgSend(v13, "copy");
    v34 = (void *)*((_QWORD *)v16 + 34);
    *((_QWORD *)v16 + 34) = v33;

    *((_QWORD *)v16 + 4) = a6;
    *((_QWORD *)v16 + 29) = 0x16800000280;
    *((_WORD *)v16 + 112) = 0;
    v16[120] = 0;
    v35 = MEMORY[0x24BDC0D88];
    v36 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)(v16 + 124) = *MEMORY[0x24BDC0D88];
    v37 = *(_QWORD *)(v35 + 16);
    *(_QWORD *)(v16 + 140) = v37;
    *(_OWORD *)(v16 + 148) = v36;
    *(_QWORD *)(v16 + 164) = v37;
    *(_OWORD *)(v16 + 172) = v36;
    *(_QWORD *)(v16 + 188) = v37;
    atomic_store(0, (unsigned __int8 *)v16 + 196);
    atomic_store(0, (unsigned __int8 *)v16 + 197);
    v38 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v39 = (void *)*((_QWORD *)v16 + 25);
    *((_QWORD *)v16 + 25) = v38;

    v16[121] = 0;
    v16[226] = 0;
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v41 = (void *)*((_QWORD *)v16 + 27);
    *((_QWORD *)v16 + 27) = v40;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    s_enableAutoExposureFilter = objc_msgSend(v42, "BOOLForKey:", CFSTR("enableAutoExposureFilter"));

    *((_DWORD *)v16 + 57) = 0;
  }

  return (JFXVideoWriter *)v16;
}

void __92__JFXVideoWriter_initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint___block_invoke()
{
  void *v0;

  v0 = (void *)s_streamNames;
  s_streamNames = (uint64_t)&unk_24EE9C4B8;

}

- (BOOL)startWriterWithVideoTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  __int128 v7;
  _BOOL4 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  NSLock *finishingLock;
  WriterReorderQ *v14;
  NSLock *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  atomic_store(1u, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  if (-[JFXVideoWriter JFX_writerCanBegin:](self, "JFX_writerCanBegin:", a4))
  {
    v7 = *(_OWORD *)&a3->c;
    v18 = *(_OWORD *)&a3->a;
    v19 = v7;
    v20 = *(_OWORD *)&a3->tx;
    v8 = -[JFXVideoWriter JFX_setupVideoWriterWithTransform:error:](self, "JFX_setupVideoWriterWithTransform:error:", &v18, a4);
    if (v8)
    {
      v9 = *(_OWORD *)&a3->c;
      v18 = *(_OWORD *)&a3->a;
      v19 = v9;
      v20 = *(_OWORD *)&a3->tx;
      v8 = -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:](self, "JFX_setupMetadataWriterWithTransform:error:", &v18, a4);
      if (v8)
      {
        -[JFXVideoWriter videoURL](self, "videoURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v10;
        -[JFXVideoWriter metadataURL](self, "metadataURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __54__JFXVideoWriter_startWriterWithVideoTransform_error___block_invoke;
        v17[3] = &unk_24EE5A9F8;
        v17[4] = self;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

        self->_wroteSessionStartTime = 0;
        atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
        if (-[AVAssetWriter startWriting](self->_videoAssetWriter, "startWriting")
          && -[AVAssetWriter startWriting](self->_metadataAssetWriter, "startWriting"))
        {
          finishingLock = self->_finishingLock;
          self->_finishingLock = 0;

          if (-[JFXVideoWriter trackOutOfOrderVideoBuffers](self, "trackOutOfOrderVideoBuffers"))
          {
            v14 = objc_alloc_init(WriterReorderQ);
            v15 = self->_finishingLock;
            self->_finishingLock = (NSLock *)v14;

          }
          atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
          kdebug_trace();
          LOBYTE(v8) = 1;
        }
        else
        {
          SetError(a4, CFSTR("com.apple.Clips.JFXVideoWriter"), 4, CFSTR("Could not start writing"));
          LOBYTE(v8) = 0;
        }
      }
    }
  }
  else
  {
    kdebug_trace();
    LOBYTE(v8) = 0;
    atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  }
  return v8;
}

uint64_t __54__JFXVideoWriter_startWriterWithVideoTransform_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_removeFileAtURL:", a2);
}

- (void)startSessionAtSourceTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  objc_msgSend(*(id *)&self->_preparingWriter, "lock");
  v5 = *a3;
  -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:](self, "JFX_startSessionAtSourceTime_noLock:", &v5);
  objc_msgSend(*(id *)&self->_preparingWriter, "unlock");
}

- (void)writeCameraFrameSet:(id)a3
{
  id v4;
  NSLock *finishingLock;
  void *v6;
  void *v7;
  opaqueCMSampleBuffer *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CMSampleTimingInfo v13;
  CMSampleTimingInfo timingInfoOut;

  v4 = a3;
  finishingLock = self->_finishingLock;
  v6 = v4;
  if (finishingLock)
  {
    -[NSLock getReorderedFrameSet:](finishingLock, "getReorderedFrameSet:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    objc_msgSend(v6, "colorSampleBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "sampleBufferRef");

    objc_msgSend(v6, "metadataObjectForKey:", CFSTR("PVFrameSetMetadataARMetadataKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:](self, "JFX_writeBuffer:sampleType:arMetadata:", v8, 0, v9);
    memset(&timingInfoOut, 0, sizeof(timingInfoOut));
    if (CMSampleBufferGetSampleTimingInfo(v8, 0, &timingInfoOut))
    {
      JFXLog_DebugWriter();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter writeCameraFrameSet:].cold.1();
    }
    else
    {
      if (-[JFXVideoWriter storeDepthDataAsVideoTrack](self, "storeDepthDataAsVideoTrack"))
      {
        objc_msgSend(v9, "arFrame");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "capturedDepthData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = timingInfoOut;
        -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:](self, "JFX_writeDepthBufferForAVDepthData:withTimingInfo:", v12, &v13);

      }
      if (!-[JFXVideoWriter storeFaceMetadata](self, "storeFaceMetadata"))
        goto LABEL_12;
      objc_msgSend(v6, "metadataDict");
      v10 = objc_claimAutoreleasedReturnValue();
      v13 = timingInfoOut;
      -[JFXVideoWriter JFX_writeFaceMetadata:withTimingInfo:](self, "JFX_writeFaceMetadata:withTimingInfo:", v10, &v13);
    }

LABEL_12:
  }

}

- (void)JFX_writeDepthData:(id)a3 timingInfo:(id *)a4
{
  __int128 v4;
  __int128 v5;
  _OWORD v6[4];
  int64_t var3;

  v4 = *(_OWORD *)&a4->var2.var0;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  v6[3] = v4;
  var3 = a4->var2.var3;
  v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:](self, "JFX_writeDepthBufferForAVDepthData:withTimingInfo:", a3, v6);
}

- (void)writeAudioBuffer:(opaqueCMSampleBuffer *)a3
{
  -[JFXVideoWriter JFX_writeBuffer:sampleType:](self, "JFX_writeBuffer:sampleType:", a3, 1);
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
  NSObject *v4;
  NSLock *finishingLock;
  void *v6;
  _BOOL4 wroteSessionStartTime;
  NSObject *v8;
  _BOOL4 v9;
  dispatch_group_t v10;
  AVAssetWriter *metadataAssetWriter;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD block[5];
  NSObject *v25;
  _QWORD v26[4];
  dispatch_group_t v27;
  JFXVideoWriter *v28;
  CMTime rhs;
  CMTime v30;
  _QWORD v31[2];
  CMTime lhs;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  finishingLock = self->_finishingLock;
  if (finishingLock)
  {
    -[NSLock clearQueuedFrameSet](finishingLock, "clearQueuedFrameSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[JFXVideoWriter writeCameraFrameSet:](self, "writeCameraFrameSet:", v6);

  }
  kdebug_trace();
  objc_msgSend(*(id *)&self->_preparingWriter, "lock");
  atomic_store(1u, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
  wroteSessionStartTime = self->_wroteSessionStartTime;
  JFXLog_DebugWriter();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (wroteSessionStartTime)
  {
    if (v9)
    {
      lhs = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
      JFXNSStringForCMTime(&lhs);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      lhs = *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4);
      JFXNSStringForCMTime(&lhs);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      lhs = *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4);
      rhs = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
      CMTimeSubtract(&v30, &lhs, &rhs);
      JFXNSStringForCMTime(&v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.value) = 138412802;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v19;
      LOWORD(lhs.flags) = 2112;
      *(_QWORD *)((char *)&lhs.flags + 2) = v20;
      HIWORD(lhs.epoch) = 2112;
      v33 = v21;
      _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "Finishing writing with session start time: %@\t\tend time: %@\t duration: %@", (uint8_t *)&lhs, 0x20u);

    }
    v10 = dispatch_group_create();
    metadataAssetWriter = self->_metadataAssetWriter;
    v31[0] = self->_videoAssetWriter;
    v31[1] = metadataAssetWriter;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke;
    v26[3] = &unk_24EE5AA20;
    v27 = v10;
    v28 = self;
    v14 = v10;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3;
    block[3] = &unk_24EE580A0;
    block[4] = self;
    v25 = v4;
    v16 = v4;
    dispatch_group_notify(v14, v15, block);

  }
  else
  {
    if (v9)
      -[JFXVideoWriter finishWritingWithCompletionHandler:].cold.1();

    dispatch_get_global_queue(21, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_51;
    v22[3] = &unk_24EE580C8;
    v23 = v4;
    v18 = v4;
    dispatch_async(v17, v22);

    v14 = v23;
  }

  objc_msgSend(*(id *)&self->_preparingWriter, "unlock");
  kdebug_trace();
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int32_t v8;
  int32_t v9;
  _QWORD v10[4];
  id v11;
  CMTime time2;
  CMTime time1;
  CMTime v14;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40);
  v7 = 172;
  if (!a3)
    v7 = 148;
  v14 = *(CMTime *)(v6 + v7);
  time1 = v14;
  time2 = *(CMTime *)(v6 + 124);
  v8 = CMTimeCompare(&time1, &time2);
  time1 = v14;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v9 = CMTimeCompare(&time1, &time2);
  if (v8 >= 1)
  {
    time1 = v14;
    objc_msgSend(v5, "endSessionAtSourceTime:", &time1);
  }
  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_24EE57B60;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v5, "finishWritingWithCompletionHandler:", v10);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  JFXLog_DebugWriter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3_cold_1();

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "status");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "videoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != 2)
  {
    objc_msgSend(v4, "JFX_removeFileAtURL:", v5);

    v5 = 0;
  }
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "status");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != 2)
  {
    objc_msgSend(v7, "JFX_removeFileAtURL:", v8);

    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)JFX_setupVideoWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  AVAssetWriter *v10;
  id v11;
  AVAssetWriter *videoAssetWriter;
  BOOL v13;
  AVAssetWriter *v14;
  __int128 v15;
  _OWORD v17[3];
  CMTime v18;
  CMTime v19;
  id v20;

  v7 = objc_alloc(MEMORY[0x24BDB2400]);
  -[JFXVideoWriter videoURL](self, "videoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB1C40];
  v20 = 0;
  v10 = (AVAssetWriter *)objc_msgSend(v7, "initWithURL:fileType:error:", v8, v9, &v20);
  v11 = v20;
  videoAssetWriter = self->_videoAssetWriter;
  self->_videoAssetWriter = v10;

  if (!v11)
  {
    CMTimeMakeWithSeconds(&v19, 2.0, 600);
    v14 = self->_videoAssetWriter;
    v18 = v19;
    -[AVAssetWriter setMovieFragmentInterval:](v14, "setMovieFragmentInterval:", &v18);
    v15 = *(_OWORD *)&a3->c;
    v17[0] = *(_OWORD *)&a3->a;
    v17[1] = v15;
    v17[2] = *(_OWORD *)&a3->tx;
    if (-[JFXVideoWriter JFX_setupVideoOutput:error:](self, "JFX_setupVideoOutput:error:", v17, a4))
    {
      v13 = -[JFXVideoWriter JFX_setupAudioOutput:](self, "JFX_setupAudioOutput:", a4);
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  v13 = 0;
  *a4 = objc_retainAutorelease(v11);
LABEL_7:

  return v13;
}

- (BOOL)JFX_setupMetadataWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  AVAssetWriter *v10;
  id v11;
  AVAssetWriter *metadataAssetWriter;
  BOOL v13;
  AVAssetWriter *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  __int128 v19;
  NSObject *v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime v28;
  CMTime v29;
  id v30;

  v7 = objc_alloc(MEMORY[0x24BDB2400]);
  -[JFXVideoWriter metadataURL](self, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB1C40];
  v30 = 0;
  v10 = (AVAssetWriter *)objc_msgSend(v7, "initWithURL:fileType:error:", v8, v9, &v30);
  v11 = v30;
  metadataAssetWriter = self->_metadataAssetWriter;
  self->_metadataAssetWriter = v10;

  if (!v11)
  {
    CMTimeMakeWithSeconds(&v29, 2.0, 600);
    v14 = self->_metadataAssetWriter;
    v28 = v29;
    -[AVAssetWriter setMovieFragmentInterval:](v14, "setMovieFragmentInterval:", &v28);
    -[JFXVideoWriter JFX_fileLevelMetadata](self, "JFX_fileLevelMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAssetWriter setMetadata:](self->_metadataAssetWriter, "setMetadata:", v15);
    if (-[JFXVideoWriter storeDepthDataAsVideoTrack](self, "storeDepthDataAsVideoTrack"))
    {
      if (!-[JFXVideoWriter depthCodecType](self, "depthCodecType"))
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerForKey:", CFSTR("JFXDepthCodecType"));

        if (v17)
          v18 = v17;
        else
          v18 = 1212493921;
        -[JFXVideoWriter setDepthCodecType:](self, "setDepthCodecType:", v18);
      }
      if (-[JFXVideoWriter depthCodecType](self, "depthCodecType") == 1111970369)
      {
        v19 = *(_OWORD *)&a3->c;
        v25 = *(_OWORD *)&a3->a;
        v26 = v19;
        v27 = *(_OWORD *)&a3->tx;
        if (!-[JFXVideoWriter JFX_setupDepthOutputWithTransform:error:](self, "JFX_setupDepthOutputWithTransform:error:", &v25, a4))
        {
          JFXLog_DebugWriter();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:].cold.2();
          goto LABEL_25;
        }
      }
      else
      {
        v21 = *(_OWORD *)&a3->c;
        v25 = *(_OWORD *)&a3->a;
        v26 = v21;
        v27 = *(_OWORD *)&a3->tx;
        if (!-[JFXVideoWriter JFX_setupCompressedDepthOutputWithTransform:error:](self, "JFX_setupCompressedDepthOutputWithTransform:error:", &v25, a4))
        {
          JFXLog_DebugWriter();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:].cold.3();
          goto LABEL_25;
        }
      }
    }
    if (!-[JFXVideoWriter storeFaceMetadata](self, "storeFaceMetadata")
      || -[JFXVideoWriter JFX_setupFaceMetadataOutput:](self, "JFX_setupFaceMetadataOutput:", a4))
    {
      +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "cameraPosition");

      if (v23 != 2 || -[JFXVideoWriter JFX_setupJFXARMetadataTrack:](self, "JFX_setupJFXARMetadataTrack:", a4))
      {
        v13 = -[JFXVideoWriter JFX_setupAutoExposureMetadataOutput:](self, "JFX_setupAutoExposureMetadataOutput:", a4);
LABEL_27:

        goto LABEL_28;
      }
LABEL_26:
      v13 = 0;
      goto LABEL_27;
    }
    JFXLog_DebugWriter();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:].cold.1();
LABEL_25:

    goto LABEL_26;
  }
  v13 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_28:

  return v13;
}

- (BOOL)JFX_setupCompressedDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  JFXDepthCompressor *v7;
  void *v8;
  void *v9;
  void *v10;
  const void *v11;
  AVAssetWriterInput *v12;
  AVAssetWriterInput *compressedDepthAssetWriterInput;
  __int128 v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  _OWORD v19[3];

  v7 = -[JFXDepthCompressor initWithDepthCodecType:]([JFXDepthCompressor alloc], "initWithDepthCodecType:", -[JFXVideoWriter depthCodecType](self, "depthCodecType"));
  -[JFXVideoWriter setDepthCompressor:](self, "setDepthCompressor:", v7);

  -[JFXVideoWriter depthCompressor](self, "depthCompressor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "depthOutputSettingsForDepthDimensions:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXVideoWriter depthCompressor](self, "depthCompressor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const void *)objc_msgSend(v10, "depthFormatDescriptionForDepthDimensions:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));

  objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D50], v9, v11);
  v12 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
  compressedDepthAssetWriterInput = self->_compressedDepthAssetWriterInput;
  self->_compressedDepthAssetWriterInput = v12;

  if (v11)
    CFRelease(v11);
  -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_compressedDepthAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
  v14 = *(_OWORD *)&a3->c;
  v19[0] = *(_OWORD *)&a3->a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&a3->tx;
  -[AVAssetWriterInput setTransform:](self->_compressedDepthAssetWriterInput, "setTransform:", v19);
  -[AVAssetWriterInput setMediaTimeScale:](self->_compressedDepthAssetWriterInput, "setMediaTimeScale:", 600);
  if (-[AVAssetWriter canAddInput:](self->_metadataAssetWriter, "canAddInput:", self->_compressedDepthAssetWriterInput))
  {
    -[AVAssetWriter addInput:](self->_metadataAssetWriter, "addInput:", self->_compressedDepthAssetWriterInput);
    -[JFXVideoWriter depthCompressor](self, "depthCompressor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

  }
  else
  {
    JFXLog_DebugWriter();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_setupCompressedDepthOutputWithTransform:error:].cold.1();

    SetError(a4, CFSTR("com.apple.Clips.JFXVideoWriter"), 4, CFSTR("Could not add compressed depth writerInput to the writer"));
    v16 = 0;
  }

  return v16;
}

- (BOOL)JFX_setupDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  AVAssetWriterInput *v7;
  AVAssetWriterInput *depthAssetWriterInput;
  __int128 v9;
  void *v10;
  AVAssetWriterInput *v11;
  void *v12;
  AVAssetWriterInputPixelBufferAdaptor *v13;
  AVAssetWriterInputPixelBufferAdaptor *depthAdaptor;
  __CFString *v16;
  _OWORD v17[3];

  objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x24BDB1D50], 0);
  v7 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
  depthAssetWriterInput = self->_depthAssetWriterInput;
  self->_depthAssetWriterInput = v7;

  -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_depthAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
  v9 = *(_OWORD *)&a3->c;
  v17[0] = *(_OWORD *)&a3->a;
  v17[1] = v9;
  v17[2] = *(_OWORD *)&a3->tx;
  -[AVAssetWriterInput setTransform:](self->_depthAssetWriterInput, "setTransform:", v17);
  -[AVAssetWriterInput setMediaTimeScale:](self->_depthAssetWriterInput, "setMediaTimeScale:", 600);
  v10 = (void *)MEMORY[0x24BDB2418];
  v11 = self->_depthAssetWriterInput;
  -[JFXVideoWriter depthBGRAPixelBufferAttributes](self, "depthBGRAPixelBufferAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v11, v12);
  v13 = (AVAssetWriterInputPixelBufferAdaptor *)objc_claimAutoreleasedReturnValue();
  depthAdaptor = self->_depthAdaptor;
  self->_depthAdaptor = v13;

  if (self->_depthAdaptor)
  {
    if (-[AVAssetWriter canAddInput:](self->_metadataAssetWriter, "canAddInput:", self->_depthAssetWriterInput))
    {
      -[AVAssetWriter addInput:](self->_metadataAssetWriter, "addInput:", self->_depthAssetWriterInput);
      return 1;
    }
    v16 = CFSTR("Could not add depth writerInput to the writer");
  }
  else
  {
    v16 = CFSTR("Could not create depth adaptor");
  }
  SetError(a4, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, v16);
  return 0;
}

- (BOOL)JFX_setupVideoOutput:(CGAffineTransform *)a3 error:(id *)a4
{
  void *v7;
  AVAssetWriter *videoAssetWriter;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AVAssetWriterInput *v13;
  AVAssetWriterInput *videoAssetWriterInput;
  __int128 v15;
  __CFString *v17;
  _OWORD v18[3];

  -[JFXVideoWriter videoOutputSettings](self, "videoOutputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 1;
  videoAssetWriter = self->_videoAssetWriter;
  -[JFXVideoWriter videoOutputSettings](self, "videoOutputSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDB1D50];
  LOBYTE(videoAssetWriter) = -[AVAssetWriter canApplyOutputSettings:forMediaType:](videoAssetWriter, "canApplyOutputSettings:forMediaType:", v9, *MEMORY[0x24BDB1D50]);

  if ((videoAssetWriter & 1) != 0)
  {
    v11 = (void *)MEMORY[0x24BDB2408];
    -[JFXVideoWriter videoOutputSettings](self, "videoOutputSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetWriterInputWithMediaType:outputSettings:", v10, v12);
    v13 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
    videoAssetWriterInput = self->_videoAssetWriterInput;
    self->_videoAssetWriterInput = v13;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_videoAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
    v15 = *(_OWORD *)&a3->c;
    v18[0] = *(_OWORD *)&a3->a;
    v18[1] = v15;
    v18[2] = *(_OWORD *)&a3->tx;
    -[AVAssetWriterInput setTransform:](self->_videoAssetWriterInput, "setTransform:", v18);
    if (-[AVAssetWriter canAddInput:](self->_videoAssetWriter, "canAddInput:", self->_videoAssetWriterInput))
    {
      -[AVAssetWriter addInput:](self->_videoAssetWriter, "addInput:", self->_videoAssetWriterInput);
      return 1;
    }
    v17 = CFSTR("Could not add video writerInput to the writer");
  }
  else
  {
    v17 = CFSTR("Cannot apply videoOutputSettings to writer");
  }
  SetError(a4, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, v17);
  return 0;
}

- (BOOL)JFX_setupAutoExposureMetadataOutput:(id *)a3
{
  void *v5;
  void *v6;
  const __CFArray *v7;
  OSStatus v8;
  void *v9;
  __CFString *v10;
  id *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  id v16;
  AVAssetWriterInput *v17;
  AVAssetWriterInput *exposureMetadataAssetWriterInput;
  AVAssetWriterInputMetadataAdaptor *v19;
  AVAssetWriterInputMetadataAdaptor *exposureMetadataAdaptor;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  if (s_enableAutoExposureFilter)
  {
    v27[0] = *MEMORY[0x24BDC0C58];
    BrightnessIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = *MEMORY[0x24BDC0C48];
    v28[0] = v5;
    v28[1] = *MEMORY[0x24BDC0BD8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    formatDescriptionOut = 0;
    v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, v7, &formatDescriptionOut);
    if (v8 > -12711)
    {
      if (v8 == -12710)
      {
        v24 = 0;
        v9 = (void *)*MEMORY[0x24BDB1C58];
        v10 = CFSTR("AVF would return AVErrorClientProgrammingError = -11999 with exception dict, but this should never happen");
        v11 = (id *)&v24;
        v12 = &v24;
        goto LABEL_12;
      }
      if (!v8)
        goto LABEL_16;
    }
    else
    {
      if (v8 == -12718)
      {
        v23 = 0;
        v9 = (void *)*MEMORY[0x24BDB1C58];
        v10 = CFSTR("AVF would return AVErrorClientProgrammingError = -11999 with exception dict, but this should never happen");
        v11 = (id *)&v23;
        v12 = &v23;
        goto LABEL_12;
      }
      if (v8 == -12711)
      {
        v25 = 0;
        v9 = (void *)*MEMORY[0x24BDB1C58];
        v10 = &stru_24EE5C428;
        v11 = (id *)&v25;
        v12 = &v25;
        v13 = -11801;
        goto LABEL_13;
      }
    }
    v22 = 0;
    v9 = (void *)*MEMORY[0x24BDB1C58];
    v10 = &stru_24EE5C428;
    v11 = (id *)&v22;
    v12 = &v22;
LABEL_12:
    v13 = -11800;
LABEL_13:
    SetError(v12, v9, v13, v10);
    v15 = *v11;
    if (v15)
    {
      v16 = v15;
      if (a3)
      {
        v16 = objc_retainAutorelease(v15);
        v14 = 0;
        *a3 = v16;
LABEL_20:

        return v14;
      }
      goto LABEL_19;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, formatDescriptionOut);
    v17 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
    exposureMetadataAssetWriterInput = self->_exposureMetadataAssetWriterInput;
    self->_exposureMetadataAssetWriterInput = v17;

    -[AVAssetWriterInput setMediaTimeScale:](self->_exposureMetadataAssetWriterInput, "setMediaTimeScale:", 600);
    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_exposureMetadataAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
    objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", self->_exposureMetadataAssetWriterInput);
    v19 = (AVAssetWriterInputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
    exposureMetadataAdaptor = self->_exposureMetadataAdaptor;
    self->_exposureMetadataAdaptor = v19;

    if (-[AVAssetWriter canAddInput:](self->_metadataAssetWriter, "canAddInput:", self->_exposureMetadataAssetWriterInput))
    {
      -[AVAssetWriter addInput:](self->_metadataAssetWriter, "addInput:", self->_exposureMetadataAssetWriterInput);
      v16 = 0;
      v14 = 1;
      goto LABEL_20;
    }
    SetError(a3, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, CFSTR("Could not add exposure metadata input to writer"));
    v16 = 0;
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  return 1;
}

- (BOOL)JFX_setupFaceMetadataOutput:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  AVAssetWriterInput *v11;
  AVAssetWriterInput *faceMetadataAssetWriterInput;
  AVAssetWriterInputMetadataAdaptor *v13;
  AVAssetWriterInputMetadataAdaptor *faceMetadataAdaptor;
  _BOOL4 v15;
  CMTime v17;
  CMTime duration;
  CMTimeRange v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", *MEMORY[0x24BDB1E10]);
  objc_msgSend(v5, "setDataType:", CFSTR("com.apple.quicktime.detected-face"));
  v6 = objc_alloc(MEMORY[0x24BDB2580]);
  objc_msgSend(v5, "setValue:", v6);

  v7 = objc_alloc(MEMORY[0x24BDB26C0]);
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&duration, 20, 600);
  v17 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake(&v19, &v17, &duration);
  v9 = (void *)objc_msgSend(v7, "initWithItems:timeRange:", v8, &v19);

  v10 = (const void *)objc_msgSend(v9, "copyFormatDescription");
  objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, v10);
  v11 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
  faceMetadataAssetWriterInput = self->_faceMetadataAssetWriterInput;
  self->_faceMetadataAssetWriterInput = v11;

  -[AVAssetWriterInput setMediaTimeScale:](self->_faceMetadataAssetWriterInput, "setMediaTimeScale:", 600);
  -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_faceMetadataAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
  objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", self->_faceMetadataAssetWriterInput);
  v13 = (AVAssetWriterInputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
  faceMetadataAdaptor = self->_faceMetadataAdaptor;
  self->_faceMetadataAdaptor = v13;

  v15 = -[AVAssetWriter canAddInput:](self->_metadataAssetWriter, "canAddInput:", self->_faceMetadataAssetWriterInput);
  if (v15)
  {
    -[AVAssetWriter addInput:](self->_metadataAssetWriter, "addInput:", self->_faceMetadataAssetWriterInput);
    if (!v10)
      goto LABEL_6;
    goto LABEL_5;
  }
  SetError(a3, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, CFSTR("Could not add face metadata input to writer"));
  if (v10)
LABEL_5:
    CFRelease(v10);
LABEL_6:

  return v15;
}

- (BOOL)JFX_setupAudioOutput:(id *)a3
{
  void *v5;
  AVAssetWriter *videoAssetWriter;
  void *v7;
  uint64_t v8;
  opaqueCMFormatDescription *audioFormatHint;
  void *v10;
  void *v11;
  AVAssetWriterInput *v12;
  __CFString *v13;
  AVAssetWriterInput *audioAssetWriterInput;

  -[JFXVideoWriter audioOutputSettings](self, "audioOutputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  videoAssetWriter = self->_videoAssetWriter;
  -[JFXVideoWriter audioOutputSettings](self, "audioOutputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDB1CF0];
  LOBYTE(videoAssetWriter) = -[AVAssetWriter canApplyOutputSettings:forMediaType:](videoAssetWriter, "canApplyOutputSettings:forMediaType:", v7, *MEMORY[0x24BDB1CF0]);

  if ((videoAssetWriter & 1) != 0)
  {
    audioFormatHint = self->_audioFormatHint;
    v10 = (void *)MEMORY[0x24BDB2408];
    -[JFXVideoWriter audioOutputSettings](self, "audioOutputSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (audioFormatHint)
      objc_msgSend(v10, "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", v8, v11, self->_audioFormatHint);
    else
      objc_msgSend(v10, "assetWriterInputWithMediaType:outputSettings:", v8, v11);
    v12 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
    audioAssetWriterInput = self->_audioAssetWriterInput;
    self->_audioAssetWriterInput = v12;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_audioAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
    if (-[AVAssetWriter canAddInput:](self->_videoAssetWriter, "canAddInput:", self->_audioAssetWriterInput))
    {
      -[AVAssetWriter addInput:](self->_videoAssetWriter, "addInput:", self->_audioAssetWriterInput);
      return 1;
    }
    v13 = CFSTR("Count not add audio writer input to writer");
  }
  else
  {
    v13 = CFSTR("Cannot apply audioOutputSettings to writer");
  }
  SetError(a3, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, v13);
  return 0;
}

- (BOOL)JFX_setupJFXARMetadataTrack:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  AVAssetWriterInput *v13;
  AVAssetWriterInput *JFXARMetadataAssetWriterInput;
  AVAssetWriterInputMetadataAdaptor *v15;
  AVAssetWriterInputMetadataAdaptor *JFXARMetadataMetadataAdaptor;
  _BOOL4 v17;
  CMTimeRange v19;
  CMTime duration;
  CMTimeRange v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "META_JFXARMetadataIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5);
  objc_msgSend(v6, "setDataType:", *MEMORY[0x24BDC0C00]);
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v7);

  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&v19.start.value = *MEMORY[0x24BDC0D88];
  v19.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  CMTimeRangeMake(&v21, &v19.start, &duration);
  v8 = objc_alloc(MEMORY[0x24BDB26C0]);
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21;
  v10 = (void *)objc_msgSend(v8, "initWithItems:timeRange:", v9, &v19);

  v11 = objc_msgSend(v10, "copyFormatDescription");
  if (v11)
  {
    v12 = (const void *)v11;
    objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, v11);
    v13 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
    JFXARMetadataAssetWriterInput = self->_JFXARMetadataAssetWriterInput;
    self->_JFXARMetadataAssetWriterInput = v13;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_JFXARMetadataAssetWriterInput, "setExpectsMediaDataInRealTime:", 1);
    objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", self->_JFXARMetadataAssetWriterInput);
    v15 = (AVAssetWriterInputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
    JFXARMetadataMetadataAdaptor = self->_JFXARMetadataMetadataAdaptor;
    self->_JFXARMetadataMetadataAdaptor = v15;

    v17 = -[AVAssetWriter canAddInput:](self->_metadataAssetWriter, "canAddInput:", self->_JFXARMetadataAssetWriterInput);
    if (v17)
      -[AVAssetWriter addInput:](self->_metadataAssetWriter, "addInput:", self->_JFXARMetadataAssetWriterInput);
    else
      SetError(a3, CFSTR("com.apple.Clips.JFXVideoWriter"), 5, CFSTR("Could not add face metadata input to writer"));
    CFRelease(v12);
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (void)JFX_startSessionAtSourceTime_noLock:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  AVAssetWriter *videoAssetWriter;
  AVAssetWriter *metadataAssetWriter;
  __int128 v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  int64_t var3;

  if (!self->_wroteSessionStartTime)
  {
    -[JFXVideoWriter audioOutputSettings](self, "audioOutputSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5 && (v6 = (void *)v5, v7 = -[WriterReorderQ count](self->_reorderQ, "count"), v6, !v7))
    {
      JFXLog_DebugWriter();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:].cold.2();

    }
    else
    {
      videoAssetWriter = self->_videoAssetWriter;
      v13 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[AVAssetWriter startSessionAtSourceTime:](videoAssetWriter, "startSessionAtSourceTime:", &v13);
      metadataAssetWriter = self->_metadataAssetWriter;
      v13 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[AVAssetWriter startSessionAtSourceTime:](metadataAssetWriter, "startSessionAtSourceTime:", &v13);
      self->_wroteSessionStartTime = 1;
      v10 = *(_OWORD *)&a3->var0;
      *(_QWORD *)&self->_sessionStartTime.flags = a3->var3;
      *(_OWORD *)(&self->_wroteFirstAudioSample + 3) = v10;
      JFXLog_DebugWriter();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:].cold.1((uint64_t)a3);

      -[JFXVideoWriter JFX_drainQueuedAudioBufferBeforeSessionStart_noLock](self, "JFX_drainQueuedAudioBufferBeforeSessionStart_noLock");
    }
  }
}

- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4
{
  -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:](self, "JFX_writeBuffer:sampleType:arMetadata:", a3, *(_QWORD *)&a4, 0);
}

- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4 arMetadata:(id)a5
{
  uint64_t v5;
  id v8;
  unsigned __int8 v9;
  NSObject *v10;
  NSObject *v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  AVAssetWriterInput *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double Seconds;
  Float64 v41;
  void *v42;
  CMTime time2;
  CMTime v44;
  _BYTE time1[38];
  __int16 v46;
  void *v47;
  uint64_t v48;

  v5 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = atomic_load((unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  if ((v9 & 1) != 0)
  {
    JFXLog_DebugWriter();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.8();

    JFXLog_DebugWriter();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.7();
    goto LABEL_9;
  }
  memset(&v44, 0, sizeof(v44));
  CMSampleBufferGetPresentationTimeStamp(&v44, a3);
  if ((v44.flags & 1) != 0)
  {
    kdebug_trace();
    objc_msgSend(*(id *)&self->_preparingWriter, "lock");
    v12 = atomic_load((unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
    if ((v12 & 1) != 0
      || -[AVAssetWriter status](self->_videoAssetWriter, "status") != AVAssetWriterStatusWriting
      || -[AVAssetWriter status](self->_metadataAssetWriter, "status") != AVAssetWriterStatusWriting)
    {
      JFXLog_DebugWriter();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = v12 & 1;
        objc_msgSend((id)s_streamNames, "objectAtIndexedSubscript:", v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AVAssetWriter status](self->_videoAssetWriter, "status"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AVAssetWriter status](self->_metadataAssetWriter, "status"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(CMTime *)time1 = v44;
        JFXNSStringForCMTime((CMTime *)time1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)time1 = 138413314;
        *(_QWORD *)&time1[4] = v22;
        *(_WORD *)&time1[12] = 1024;
        *(_DWORD *)&time1[14] = v21;
        *(_WORD *)&time1[18] = 2112;
        *(_QWORD *)&time1[20] = v23;
        *(_WORD *)&time1[28] = 2112;
        *(_QWORD *)&time1[30] = v24;
        v46 = 2112;
        v47 = v25;
        _os_log_debug_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEBUG, "No Write %@. finishing (%d), video status: %@, metadata status: %@ (%@)", time1, 0x30u);

      }
      -[AVAssetWriter error](self->_videoAssetWriter, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        JFXLog_DebugWriter();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.6((id *)&self->_videoAssetWriter);

      }
      -[AVAssetWriter error](self->_metadataAssetWriter, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_47;
      JFXLog_DebugWriter();
      v20 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.5((id *)&self->_metadataAssetWriter);
      goto LABEL_32;
    }
    JFXLog_DebugWriter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)s_streamNames, "objectAtIndexedSubscript:", v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(CMTime *)time1 = v44;
      JFXNSStringForCMTime((CMTime *)time1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time1 = 138412546;
      *(_QWORD *)&time1[4] = v35;
      *(_WORD *)&time1[12] = 2112;
      *(_QWORD *)&time1[14] = v36;
      _os_log_debug_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEBUG, "Write %@ %@", time1, 0x16u);

    }
    if (self->_wroteSessionStartTime || v5 > 3 || (_DWORD)v5 == 1)
    {
      JFXLog_DebugWriter();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)s_streamNames, "objectAtIndexedSubscript:", v5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(CMTime *)time1 = v44;
        JFXNSStringForCMTime((CMTime *)time1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)time1 = *(_OWORD *)(&self->_wroteFirstAudioSample + 3);
        *(_QWORD *)&time1[16] = *(_QWORD *)&self->_sessionStartTime.flags;
        JFXNSStringForCMTime((CMTime *)time1);
        v38 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)time1 = 138412802;
        *(_QWORD *)&time1[4] = v37;
        *(_WORD *)&time1[12] = 2112;
        *(_QWORD *)&time1[14] = v42;
        *(_WORD *)&time1[22] = 2112;
        *(_QWORD *)&time1[24] = v38;
        v39 = (void *)v38;
        _os_log_debug_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEBUG, "Skipped write for %@ at time (%@) startTime (%@)", time1, 0x20u);

      }
      if ((_DWORD)v5 == 1)
      {
        *(_OWORD *)time1 = *MEMORY[0x24BDC0D88];
        *(_QWORD *)&time1[16] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
        if (!CMTimeCompare((CMTime *)time1, &time2))
        {
          JFXLog_DebugWriter();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.3();

          -[JFXVideoWriter JFX_queueAudioBufferBeforeSessionStart:](self, "JFX_queueAudioBufferBeforeSessionStart:", a3);
        }
      }
    }
    else
    {
      JFXLog_DebugWriter();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.4((uint64_t)&v44);

      *(CMTime *)time1 = v44;
      -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:](self, "JFX_startSessionAtSourceTime_noLock:", time1);
      if (!self->_wroteSessionStartTime)
        goto LABEL_47;
      -[JFXVideoWriter delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[JFXVideoWriter delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "videoWriterWroteFirstFrame:", self);

      }
    }
    if (!self->_wroteSessionStartTime
      || (*(CMTime *)time1 = v44,
          time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3),
          CMTimeCompare((CMTime *)time1, &time2) < 0))
    {
LABEL_47:
      objc_msgSend(*(id *)&self->_preparingWriter, "unlock");
      kdebug_trace();
      goto LABEL_48;
    }
    if ((_DWORD)v5)
    {
      if ((_DWORD)v5 == 2)
      {
        v20 = self->_depthAssetWriterInput;
        if (!-[JFXVideoWriter JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:](self, "JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:", a3, v20, 2, self->_depthAdaptor))goto LABEL_32;
        goto LABEL_66;
      }
      v29 = 56;
      if ((_DWORD)v5 != 3)
        v29 = 24;
    }
    else
    {
      v29 = 16;
    }
    v20 = (AVAssetWriterInput *)*(id *)((char *)&self->super.isa + v29);
    v30 = -[JFXVideoWriter JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:](self, "JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:", a3, v20, v5, 0);
    v31 = v30;
    if (!(_DWORD)v5)
    {
      -[JFXVideoWriter JFX_writeAutoExposureMetadata:](self, "JFX_writeAutoExposureMetadata:", a3);
      if (v31)
      {
        JFXLog_DebugWriter();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(CMTime *)time1 = v44;
          Seconds = CMTimeGetSeconds((CMTime *)time1);
          *(_OWORD *)time1 = *(_OWORD *)((char *)&self->_sessionStartTime.epoch + 4);
          *(_QWORD *)&time1[16] = *(_QWORD *)&self->_sessionVideoEndTime.flags;
          v41 = CMTimeGetSeconds((CMTime *)time1);
          *(_DWORD *)time1 = 134217984;
          *(double *)&time1[4] = Seconds - v41;
          _os_log_debug_impl(&dword_2269A9000, v33, OS_LOG_TYPE_DEBUG, "Video time difference: %f", time1, 0xCu);
        }

        *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4) = v44;
      }
      if (v8)
      {
        *(CMTime *)time1 = v44;
        -[JFXVideoWriter JFX_writeJFXARMetadata:time:](self, "JFX_writeJFXARMetadata:time:", v8, time1);
      }
      goto LABEL_32;
    }
    if ((v5 & 0xFFFFFFFE) != 2 || !v30)
    {
      if ((_DWORD)v5 == 1 && !self->_wroteFirstAudioSample)
      {
        self->_wroteFirstAudioSample = 1;
        JFXLog_DebugWriter();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.2((uint64_t)&v44);

      }
      goto LABEL_32;
    }
LABEL_66:
    *(CMTime *)((char *)&self->_sessionVideoEndTime.epoch + 4) = v44;
LABEL_32:

    goto LABEL_47;
  }
  JFXLog_DebugWriter();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[WriterReorderQ getReorderedFrameSet:].cold.5();
LABEL_9:

LABEL_48:
}

- (void)JFX_writeDepthBufferForAVDepthData:(id)a3 withTimingInfo:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  os_signpost_id_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __CVBuffer *v16;
  __CVBuffer *v17;
  const __CFAllocator *v18;
  NSObject *v19;
  unint64_t v20;
  os_signpost_id_t v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  unint64_t v34;
  os_signpost_id_t v35;
  NSObject *v36;
  unint64_t v37;
  os_signpost_id_t v38;
  NSObject *v39;
  unint64_t v40;
  os_signpost_id_t v41;
  const char *v42;
  NSObject *v43;
  unint64_t v44;
  unint64_t v45;
  CMVideoFormatDescriptionRef formatDescription[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int64_t var3;
  uint64_t v51;
  uint8_t buf[8];
  CMSampleBufferRef sampleBufferOut;

  v6 = a3;
  v7 = v6;
  if ((a4->var1.var2 & 1) == 0)
  {
    JFXLog_DebugWriter();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:].cold.1();
    goto LABEL_52;
  }
  if (v6)
  {
    v9 = -[JFXVideoWriter depthCodecType](self, "depthCodecType");
    JFXVideoWriterIntervalSignpostCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[JFXVideoWriter signPostID](self, "signPostID");
    v12 = v11 - 1;
    if (v9 == 1111970369)
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(formatDescription[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "encode_uncompressed_depth", (const char *)&unk_226AC25B2, (uint8_t *)formatDescription, 2u);
      }

      v13 = v7;
      if (objc_msgSend(v13, "depthDataType") != 1717855600)
      {
        objc_msgSend(v13, "depthDataByConvertingToDepthDataType:", 1717855600);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v14;
      }
      v8 = objc_retainAutorelease(v13);
      v15 = -[NSObject depthDataMap](v8, "depthDataMap");
      if (v15)
      {
        v16 = -[JFXVideoWriter JFX_copyDepthBufferAsBGRA:](self, "JFX_copyDepthBufferAsBGRA:", v15);
        if (v16)
        {
          v17 = v16;
          formatDescription[0] = 0;
          v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v16, formatDescription);
          if (formatDescription[0])
          {
            sampleBufferOut = 0;
            CMSampleBufferCreateReadyWithImageBuffer(v18, v17, formatDescription[0], (const CMSampleTimingInfo *)a4, &sampleBufferOut);
            if (sampleBufferOut)
            {
              JFXVideoWriterIntervalSignpostCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = -[JFXVideoWriter signPostID](self, "signPostID");
              if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v21 = v20;
                if (os_signpost_enabled(v19))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_2269A9000, v19, OS_SIGNPOST_INTERVAL_END, v21, "encode_uncompressed_depth", (const char *)&unk_226AC25B2, buf, 2u);
                }
              }

              JFXVideoWriterIntervalSignpostCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = -[JFXVideoWriter signPostID](self, "signPostID");
              if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v24 = v23;
                if (os_signpost_enabled(v22))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_2269A9000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "write_uncompressed_depth", (const char *)&unk_226AC25B2, buf, 2u);
                }
              }

              -[JFXVideoWriter JFX_writeBuffer:sampleType:](self, "JFX_writeBuffer:sampleType:", sampleBufferOut, 2);
              JFXVideoWriterIntervalSignpostCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = -[JFXVideoWriter signPostID](self, "signPostID");
              if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v27 = v26;
                if (os_signpost_enabled(v25))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_2269A9000, v25, OS_SIGNPOST_INTERVAL_END, v27, "write_uncompressed_depth", (const char *)&unk_226AC25B2, buf, 2u);
                }
              }

              CFRelease(sampleBufferOut);
              CVPixelBufferRelease(v17);
              CFRelease(formatDescription[0]);
              goto LABEL_52;
            }
            CVPixelBufferRelease(v17);
            CFRelease(formatDescription[0]);
          }
        }
      }
      JFXVideoWriterIntervalSignpostCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      v45 = -[JFXVideoWriter signPostID](self, "signPostID");
      if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v41 = v45, !os_signpost_enabled(v39)))
      {
LABEL_51:

        goto LABEL_52;
      }
      LOWORD(formatDescription[0]) = 0;
      v42 = "encode_uncompressed_depth";
    }
    else
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(formatDescription[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2269A9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "encode_compressed_depth", (const char *)&unk_226AC25B2, (uint8_t *)formatDescription, 2u);
      }

      -[JFXVideoWriter depthCompressor](self, "depthCompressor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_OWORD *)&a4->var2.var0;
      v48 = *(_OWORD *)&a4->var1.var1;
      v49 = v29;
      var3 = a4->var2.var3;
      v51 = 0;
      v30 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)formatDescription = *(_OWORD *)&a4->var0.var0;
      v47 = v30;
      objc_msgSend(v28, "compressAVDepthData:timingInfo:error:", v7, formatDescription, &v51);
      v8 = objc_claimAutoreleasedReturnValue();
      v31 = v51;

      if (v31 || !v8)
      {
        JFXLog_DebugWriter();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:].cold.3();

        JFXVideoWriterIntervalSignpostCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        v44 = -[JFXVideoWriter signPostID](self, "signPostID");
        if (v44 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_51;
        v41 = v44;
        if (!os_signpost_enabled(v39))
          goto LABEL_51;
        LOWORD(formatDescription[0]) = 0;
        v42 = "encode_compressed_depth";
      }
      else
      {
        v32 = -[NSObject sampleBufferRef](v8, "sampleBufferRef");
        JFXVideoWriterIntervalSignpostCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = -[JFXVideoWriter signPostID](self, "signPostID");
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = v34;
          if (os_signpost_enabled(v33))
          {
            LOWORD(formatDescription[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_2269A9000, v33, OS_SIGNPOST_INTERVAL_END, v35, "encode_compressed_depth", (const char *)&unk_226AC25B2, (uint8_t *)formatDescription, 2u);
          }
        }

        JFXVideoWriterIntervalSignpostCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = -[JFXVideoWriter signPostID](self, "signPostID");
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v38 = v37;
          if (os_signpost_enabled(v36))
          {
            LOWORD(formatDescription[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_2269A9000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v38, "write_compressed_depth", (const char *)&unk_226AC25B2, (uint8_t *)formatDescription, 2u);
          }
        }

        -[JFXVideoWriter JFX_writeBuffer:sampleType:](self, "JFX_writeBuffer:sampleType:", v32, 3);
        JFXVideoWriterIntervalSignpostCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = -[JFXVideoWriter signPostID](self, "signPostID");
        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_51;
        v41 = v40;
        if (!os_signpost_enabled(v39))
          goto LABEL_51;
        LOWORD(formatDescription[0]) = 0;
        v42 = "write_compressed_depth";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_2269A9000, v39, OS_SIGNPOST_INTERVAL_END, v41, v42, (const char *)&unk_226AC25B2, (uint8_t *)formatDescription, 2u);
    goto LABEL_51;
  }
  JFXLog_DebugWriter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:].cold.2();
LABEL_52:

}

- (BOOL)JFX_writeSampleBuffer:(opaqueCMSampleBuffer *)a3 assetWriterInput:(id)a4 sampleType:(int)a5 depthAdaptor:(id)a6
{
  id v9;
  id v10;
  CVImageBufferRef ImageBuffer;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  CMTime v18;
  CMTime buf;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetPresentationTimeStamp(&v18, a3);
  if (!objc_msgSend(v9, "isReadyForMoreMediaData"))
  {
    JFXLog_DebugWriter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend((id)s_streamNames, "objectAtIndexedSubscript:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v18;
    JFXNSStringForCMTime(&buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v15;
    v16 = "%@ input not ready %@";
LABEL_12:
    _os_log_debug_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&buf, 0x16u);

    goto LABEL_9;
  }
  if (a5 != 2)
  {
    if ((objc_msgSend(v9, "appendSampleBuffer:", a3) & 1) != 0)
      goto LABEL_4;
    goto LABEL_8;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  buf = v18;
  if ((objc_msgSend(v10, "appendPixelBuffer:withPresentationTime:", ImageBuffer, &buf) & 1) == 0)
  {
LABEL_8:
    JFXLog_DebugWriter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    objc_msgSend((id)s_streamNames, "objectAtIndexedSubscript:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v18;
    JFXNSStringForCMTime(&buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v15;
    v16 = "%@ append failed %@";
    goto LABEL_12;
  }
LABEL_4:
  v12 = 1;
LABEL_10:

  return v12;
}

- (void)JFX_queueAudioBufferBeforeSessionStart:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  NSObject *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE78FF0]), "initWithSampleBuffer:", a3);
  if ((unint64_t)-[WriterReorderQ count](self->_reorderQ, "count") >= 6)
  {
    JFXLog_DebugWriter();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_queueAudioBufferBeforeSessionStart:].cold.1(v5);

    -[WriterReorderQ removeObjectAtIndex:](self->_reorderQ, "removeObjectAtIndex:", 0);
  }
  -[WriterReorderQ addObject:](self->_reorderQ, "addObject:", v4);

}

- (void)JFX_drainQueuedAudioBufferBeforeSessionStart_noLock
{
  WriterReorderQ *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int32_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  CMTime time2;
  CMTime v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime time1;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_reorderQ;
  v4 = -[WriterReorderQ countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        memset(&v15, 0, sizeof(v15));
        if (v8)
          objc_msgSend(v8, "presentationTimeStamp");
        time1 = v15;
        time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
        v9 = CMTimeCompare(&time1, &time2);
        JFXLog_DebugWriter();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9 < 0)
        {
          if (v11)
          {
            time1 = v15;
            JFXNSStringForCMTime(&time1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(time1.value) = 138412290;
            *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v13;
            _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "skipping queued audio sample before session start time: %@", (uint8_t *)&time1, 0xCu);

          }
        }
        else
        {
          if (v11)
          {
            time1 = v15;
            JFXNSStringForCMTime(&time1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(time1.value) = 138412290;
            *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v12;
            _os_log_debug_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEBUG, "Draining queued audio buffer: %@", (uint8_t *)&time1, 0xCu);

          }
          -[JFXVideoWriter JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:](self, "JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:", objc_msgSend(v8, "sampleBufferRef"), self->_audioAssetWriterInput, 1, 0);
        }
      }
      v5 = -[WriterReorderQ countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v5);
  }

}

- (id)JFX_fileLevelMetadata
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraPosition");

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "JFX_funcamCameraPositionMetadataIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = *MEMORY[0x24BDC0C28];
  objc_msgSend(v5, "setDataType:", *MEMORY[0x24BDC0C28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap64(v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v8);

  v9 = bswap64(+[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "JFX_funcamCaptureInterfaceOrientationMetadataIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  objc_msgSend(v10, "setDataType:", v7);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:", v12);

  v23[0] = v5;
  v23[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[JFXVideoWriter animojiMetadata](self, "animojiMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "JFX_animojiMetadataIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", v18);

    objc_msgSend(v17, "setDataType:", *MEMORY[0x24BDC0C00]);
    -[JFXVideoWriter animojiMetadata](self, "animojiMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:", v19);

    objc_msgSend(v14, "addObject:", v17);
  }
  if (-[JFXVideoWriter storeDepthDataAsVideoTrack](self, "storeDepthDataAsVideoTrack"))
  {
    v20 = objc_alloc_init(MEMORY[0x24BDB25B8]);
    objc_msgSend(v20, "setKeySpace:", *MEMORY[0x24BDB1E38]);
    objc_msgSend(v20, "setKey:", *MEMORY[0x24BDB1D98]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RGBDV%04d"), 114);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:", v21);

    objc_msgSend(v14, "addObject:", v20);
  }

  return v14;
}

- (void)JFX_writeAutoExposureMetadata:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  NSObject *v6;
  float v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  CMTimeRange v18;
  CMTime duration;
  CMTime start;
  CMTimeRange v21;
  CMTime v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (s_enableAutoExposureFilter)
  {
    memset(&v22, 0, sizeof(v22));
    CMSampleBufferGetPresentationTimeStamp(&v22, a3);
    if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_exposureMetadataAssetWriterInput, "isReadyForMoreMediaData"))
    {
      JFXLog_DebugWriter();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:].cold.4((uint64_t)&v22);
      goto LABEL_17;
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    exifMetadataForCVPixelBuffer(ImageBuffer);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = exifBrightnessFromEXIFMetadata(v6);
    if (fabsf(v7) == INFINITY)
    {
      JFXLog_DebugWriter();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:].cold.2();

      v17 = objc_alloc(MEMORY[0x24BDB26C0]);
      start = v22;
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      CMTimeRangeMake(&v18, &start, &duration);
      v8 = (void *)objc_msgSend(v17, "initWithItems:timeRange:", MEMORY[0x24BDBD1A8], &v18);
      if (-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](self->_exposureMetadataAdaptor, "appendTimedMetadataGroup:", v8))
      {
        goto LABEL_16;
      }
      JFXLog_DebugWriter();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BrightnessIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIdentifier:", v9);

      objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0BD8]);
      *(float *)&v10 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:", v11);

      v12 = objc_alloc(MEMORY[0x24BDB26C0]);
      v23[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      start = v22;
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      CMTimeRangeMake(&v21, &start, &duration);
      v14 = objc_msgSend(v12, "initWithItems:timeRange:", v13, &v21);

      if (!-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](self->_exposureMetadataAdaptor, "appendTimedMetadataGroup:", v14))
      {
        JFXLog_DebugWriter();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[JFXVideoWriter JFX_writeAutoExposureMetadata:].cold.1();

      }
    }

LABEL_16:
LABEL_17:

  }
}

- (void)JFX_writeJFXARMetadata:(id)a3 time:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  CMTimeRange v15;
  CMTime duration;
  CMTimeRange v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6
    && -[AVAssetWriterInput isReadyForMoreMediaData](self->_JFXARMetadataAssetWriterInput, "isReadyForMoreMediaData"))
  {
    objc_msgSend((id)objc_opt_class(), "META_JFXARMetadataIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIdentifier:", v7);
      objc_msgSend(v10, "setDataType:", *MEMORY[0x24BDC0C00]);
      objc_msgSend(v10, "setValue:", v8);
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&v15.start.value = *(_OWORD *)&a4->var0;
      v15.start.epoch = a4->var3;
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      CMTimeRangeMake(&v17, &v15.start, &duration);
      v11 = objc_alloc(MEMORY[0x24BDB26C0]);
      v19[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v13 = (void *)objc_msgSend(v11, "initWithItems:timeRange:", v12, &v15);

      if (-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](self->_JFXARMetadataMetadataAdaptor, "appendTimedMetadataGroup:", v13))
      {
        v14 = *(_OWORD *)&a4->var0;
        *(_QWORD *)&self->_sessionMetadataEndTime.flags = a4->var3;
        *(_OWORD *)((char *)&self->_sessionVideoEndTime.epoch + 4) = v14;
      }

    }
  }

}

- (void)JFX_writeFaceMetadata:(id)a3 withTimingInfo:(id *)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  int64_t v17;
  __int128 v18;
  int64_t var3;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE795E0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = v6;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v12, "faceObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v12, "faceObject");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v14);

            }
          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      v18 = *(_OWORD *)&a4->var1.var0;
      var3 = a4->var1.var3;
      JFXLog_DebugWriter();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeFaceMetadata:withTimingInfo:].cold.2();

      v16 = v18;
      v17 = var3;
      -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:](self, "JFX_writeFaceDetectMetadata:pts:", v7, &v16);

    }
  }
  else
  {
    JFXLog_DebugWriter();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_writeFaceMetadata:withTimingInfo:].cold.1();
  }

}

- (void)JFX_writeFaceDetectMetadata:(id)a3 pts:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  JFXVideoWriter *v24;
  CMTimeRange v25;
  CMTime duration;
  CMTimeRange v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTime time2;
  CMTime time1;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!self->_wroteSessionStartTime
    || (time1 = (CMTime)*a4, time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3), CMTimeCompare(&time1, &time2) < 0))
  {
    JFXLog_DebugWriter();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.1((uint64_t)a4);

  }
  else
  {
    time1 = (CMTime)*a4;
    if (-[AVAssetWriterInput isReadyForMoreMediaData](self->_faceMetadataAssetWriterInput, "isReadyForMoreMediaData"))
    {
      if (v6 && objc_msgSend(v6, "count"))
      {
        v24 = self;
        v7 = objc_opt_new();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v29;
          v12 = *MEMORY[0x24BDB1E10];
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v8);
              v14 = (void *)MEMORY[0x24BDB25B8];
              v15 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v14, "metadataItem");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setIdentifier:", v12);
              objc_msgSend(v16, "setDataType:", CFSTR("com.apple.quicktime.detected-face"));
              objc_msgSend(v16, "setValue:", v15);

              -[NSObject addObject:](v7, "addObject:", v16);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          }
          while (v10);
        }

        v17 = objc_alloc(MEMORY[0x24BDB26C0]);
        time2 = time1;
        duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
        CMTimeRangeMake(&v27, &time2, &duration);
        v18 = (void *)objc_msgSend(v17, "initWithItems:timeRange:", v7, &v27);
        if (!-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](v24->_faceMetadataAdaptor, "appendTimedMetadataGroup:", v18))
        {
          JFXLog_DebugWriter();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.2();

        }
      }
      else
      {
        JFXLog_DebugWriter();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.3();

        v22 = objc_alloc(MEMORY[0x24BDB26C0]);
        time2 = time1;
        duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
        CMTimeRangeMake(&v25, &time2, &duration);
        v7 = objc_msgSend(v22, "initWithItems:timeRange:", MEMORY[0x24BDBD1A8], &v25);
        if (!-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](self->_faceMetadataAdaptor, "appendTimedMetadataGroup:", v7))
        {
          JFXLog_DebugWriter();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.2();

        }
      }
    }
    else
    {
      JFXLog_DebugWriter();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.5((uint64_t)&time1);
    }

  }
}

+ (void)META_metadataForVideo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_group_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30 = v6;
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "count"))
  {
    v11 = dispatch_group_create();
    objc_msgSend(a1, "JFX_funcamCameraPositionMetadataIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "JFX_funcamCaptureInterfaceOrientationMetadataIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v12;
    v49[1] = v13;
    v50[0] = &unk_24EE9BD50;
    v50[1] = &unk_24EE9BD50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_95;
    v43[3] = &unk_24EE5AA70;
    v17 = v10;
    v44 = v17;
    v18 = v11;
    v45 = v18;
    v19 = v15;
    v46 = v19;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v43);

    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__18;
    v41[4] = __Block_byref_object_dispose__18;
    v42 = 0;
    objc_msgSend(a1, "JFX_animojiMetadataIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:filteredByIdentifier:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v18);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_104;
      v37[3] = &unk_24EE58190;
      v40 = v41;
      v22 = v21;
      v38 = v22;
      v39 = v18;
      objc_msgSend(v22, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24EE9C4E8, v37);

    }
    dispatch_get_global_queue(21, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2_105;
    block[3] = &unk_24EE5AA98;
    v32 = v19;
    v33 = v12;
    v34 = v13;
    v35 = v7;
    v36 = v41;
    v28 = v7;
    v24 = v13;
    v25 = v12;
    v26 = v19;
    dispatch_group_notify(v18, v23, block);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke;
    v47[3] = &unk_24EE580C8;
    v48 = v7;
    v18 = v7;
    dispatch_async(v27, v47);

    v26 = v48;
  }

}

uint64_t __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:filteredByIdentifier:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2;
    v7[3] = &unk_24EE5AA48;
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    v6 = v5;
    objc_msgSend(v6, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24EE9C4D0, v7);

  }
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "unsignedLongLongValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", bswap64(v2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_104(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2_105(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "longLongValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "longLongValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (id)META_JFXARMetadataIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("JFXARMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", v5, *MEMORY[0x24BDB1E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)META_metadataAssetTrackFromAsset:(id)a3 metadataIdentifier:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18;
  v31 = __Block_byref_object_dispose__18;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__18;
  v25 = __Block_byref_object_dispose__18;
  v26 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x24BDAC760];
  v9 = *MEMORY[0x24BDB1D10];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke;
  v18[3] = &unk_24EE58C80;
  v20 = &v21;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v5, "loadTracksWithMediaType:completionHandler:", v9, v18);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (void *)v22[5];
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_2;
  v15[3] = &unk_24EE5AAE8;
  v12 = v6;
  v16 = v12;
  v17 = &v27;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a2;
  objc_msgSend(v6, "formatDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_3;
  v11[3] = &unk_24EE5AAC0;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v14 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_3(uint64_t a1, CMMetadataFormatDescriptionRef desc, uint64_t a3, _BYTE *a4)
{
  id v6;

  CMMetadataFormatDescriptionGetIdentifiers(desc);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
  }

}

+ (id)META_ARMetadataTrackForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "META_JFXARMetadataIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "META_metadataAssetTrackFromAsset:metadataIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)JFX_funcamCameraPositionMetadataIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("cameraPosition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", v5, *MEMORY[0x24BDB1E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)JFX_funcamCaptureInterfaceOrientationMetadataIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("captureInterfaceOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", v5, *MEMORY[0x24BDB1E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)JFX_faceAnchorMetadataIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("faceanchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", v5, *MEMORY[0x24BDB1E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)JFX_animojiMetadataIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("animojiMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", v5, *MEMORY[0x24BDB1E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)JFX_writerCanBegin:(id *)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  id *v8;
  uint64_t v9;
  void *v10;

  -[JFXVideoWriter folderURL](self, "folderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[JFXVideoWriter videoOutputSettings](self, "videoOutputSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      return 1;
    }
    -[JFXVideoWriter audioOutputSettings](self, "audioOutputSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      return 1;
    v7 = CFSTR("No video or audio output settings provided");
    v8 = a3;
    v9 = 3;
  }
  else
  {
    v7 = CFSTR("nil url");
    v8 = a3;
    v9 = 1;
  }
  SetError(v8, CFSTR("com.apple.Clips.JFXVideoWriter"), v9, v7);
  return 0;
}

- (void)JFX_removeFileAtURL:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
    objc_msgSend(v3, "removeItemAtURL:error:", v6, 0);

}

- (__CVBuffer)JFX_copyDepthBufferAsBGRA:(__CVBuffer *)a3
{
  AVAssetWriterInputPixelBufferAdaptor *depthAdaptor;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v8;
  char *BaseAddress;
  char *v10;
  char *v11;
  size_t v12;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  if (a3)
  {
    depthAdaptor = self->_depthAdaptor;
    if (depthAdaptor)
    {
      CVPixelBufferPoolCreatePixelBuffer(0, -[AVAssetWriterInputPixelBufferAdaptor pixelBufferPool](depthAdaptor, "pixelBufferPool"), &pixelBufferOut);
      if (pixelBufferOut)
      {
        if (CVPixelBufferGetPixelFormatType(pixelBufferOut) == 1111970369)
        {
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
          v8 = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
          v10 = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
          if (Height)
          {
            v11 = v10;
            v12 = 4 * Width;
            do
            {
              memcpy(v11, BaseAddress, v12);
              BaseAddress += BytesPerRow;
              v11 += v8;
              --Height;
            }
            while (Height);
          }
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
        }
      }
    }
  }
  return pixelBufferOut;
}

- (BOOL)wroteSessionStartTime
{
  return self->_wroteSessionStartTime;
}

- (BOOL)storeFaceMetadata
{
  return (BOOL)self->_audioBufferQ;
}

- (void)setStoreFaceMetadata:(BOOL)a3
{
  LOBYTE(self->_audioBufferQ) = a3;
}

- (BOOL)storeDepthDataAsVideoTrack
{
  return BYTE1(self->_audioBufferQ);
}

- ($2825F4736939C4A6D3AD43837233062D)depthDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_storeFaceMetadata;
}

- (void)setDepthDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_storeFaceMetadata = a3;
}

- (NSData)animojiMetadata
{
  return (NSData *)self->_depthDimensions;
}

- (void)setAnimojiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_depthDimensions, a3);
}

- (JFXVideoWriterDelegate)delegate
{
  return (JFXVideoWriterDelegate *)objc_loadWeakRetained((id *)&self->_animojiMetadata);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animojiMetadata, a3);
}

- (BOOL)trackOutOfOrderVideoBuffers
{
  return BYTE2(self->_audioBufferQ);
}

- (void)setTrackOutOfOrderVideoBuffers:(BOOL)a3
{
  BYTE2(self->_audioBufferQ) = a3;
}

- (int)depthCodecType
{
  return HIDWORD(self->_audioBufferQ);
}

- (void)setDepthCodecType:(int)a3
{
  HIDWORD(self->_audioBufferQ) = a3;
}

- (NSURL)folderURL
{
  return (NSURL *)self->_delegate;
}

- (void)setFolderURL:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSDictionary)videoOutputSettings
{
  return (NSDictionary *)self->_folderURL;
}

- (void)setVideoOutputSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSDictionary)audioOutputSettings
{
  return self->_videoOutputSettings;
}

- (void)setAudioOutputSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (JFXDepthCompressor)depthCompressor
{
  return (JFXDepthCompressor *)self->_audioOutputSettings;
}

- (void)setDepthCompressor:(id)a3
{
  objc_storeStrong((id *)&self->_audioOutputSettings, a3);
}

- (NSDictionary)depthBGRAPixelBufferAttributes
{
  return (NSDictionary *)self->_depthCompressor;
}

- (void)setDepthBGRAPixelBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (unint64_t)signPostID
{
  return (unint64_t)self->_depthBGRAPixelBufferAttributes;
}

- (void)setSignPostID:(unint64_t)a3
{
  self->_depthBGRAPixelBufferAttributes = (NSDictionary *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthCompressor, 0);
  objc_storeStrong((id *)&self->_audioOutputSettings, 0);
  objc_storeStrong((id *)&self->_videoOutputSettings, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_animojiMetadata);
  objc_storeStrong((id *)&self->_depthDimensions, 0);
  objc_storeStrong((id *)&self->_reorderQ, 0);
  objc_storeStrong((id *)&self->_finishingLock, 0);
  objc_storeStrong((id *)&self->_preparingWriter, 0);
  objc_storeStrong((id *)&self->_JFXARMetadataMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_faceMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_exposureMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_depthAdaptor, 0);
  objc_storeStrong((id *)&self->_JFXARMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_faceMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_exposureMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_compressedDepthAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_depthAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_metadataAssetWriter, 0);
  objc_storeStrong((id *)&self->_audioAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_videoAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_videoAssetWriter, 0);
}

- (void)writeCameraFrameSet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Failed to get color buffer timing info, so not writing depth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finishWritingWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: finishWritingWithCompletionHandler was called without writing a session start time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Finished writing with completion handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: failed to setup face metadata output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: failed to setup depth output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: failed to setup compressed depth output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_setupCompressedDepthOutputWithTransform:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: Could not add compressed depth writerInput", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_startSessionAtSourceTime_noLock:(uint64_t)a1 .cold.1(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Session start time:      %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_startSessionAtSourceTime_noLock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Waiting for some queued audio before starting session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeBuffer:(uint64_t)a1 sampleType:arMetadata:.cold.2(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Audio Sample Start time: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Queue audio buffer to write when session starts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeBuffer:(uint64_t)a1 sampleType:arMetadata:.cold.4(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "start session at %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeBuffer:(id *)a1 sampleType:arMetadata:.cold.5(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "metadata error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeBuffer:(id *)a1 sampleType:arMetadata:.cold.6(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "video error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "NO Write during preparing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "still preparing writer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: invalid timing info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Skipping compressed depth sample write because avDepthData is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: compressAVDepthData failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_queueAudioBufferBeforeSessionStart:(os_log_t)log .cold.1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "Queued audio samples exceeded max size (%d). Dropping sample.", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeAutoExposureMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: autoexposure metadata writing failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeAutoExposureMetadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: writing gap in autoexposure metadata instead of invalid metadata. Reader must support this.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeAutoExposureMetadata:(uint64_t)a1 .cold.4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1, *MEMORY[0x24BDAC8D0], v7, v8, v9);
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "Error: dropping autoexposure metadata at time %f because writer not ready", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeFaceMetadata:withTimingInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: metadata is nil in JFXVideoWriter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeFaceMetadata:withTimingInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "Writing face metadata for %@", v2);
}

- (void)JFX_writeFaceDetectMetadata:(uint64_t)a1 pts:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1, *MEMORY[0x24BDAC8D0], v7, v8, v9);
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "Droppping face detection metadata at pts=%f", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3();
}

- (void)JFX_writeFaceDetectMetadata:pts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: face detection metadata writing failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeFaceDetectMetadata:pts:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: writing gap in face detection metadata instead of invalid metadata. Reader must support this.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_writeFaceDetectMetadata:(uint64_t)a1 pts:.cold.5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1, *MEMORY[0x24BDAC8D0], v7, v8, v9);
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "Error: dropping face detection metadata at time %f because writer not ready", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3();
}

@end
