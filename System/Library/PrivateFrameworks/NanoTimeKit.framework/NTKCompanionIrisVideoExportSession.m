@implementation NTKCompanionIrisVideoExportSession

- (NTKCompanionIrisVideoExportSession)initWithVideo:(id)a3 crop:(CGRect)a4 outputSize:(CGSize)a5 bitrate:(unint64_t)a6 outputURL:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  NTKCompanionIrisVideoExportSession *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *exportQueue;
  dispatch_queue_t v22;
  OS_dispatch_queue *encodeQueue;
  uint64_t v24;
  NSURL *outputURL;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  NSError *error;
  objc_super v39;

  height = a5.height;
  width = a5.width;
  v11 = a4.size.height;
  v12 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)NTKCompanionIrisVideoExportSession;
  v19 = -[NTKCompanionIrisVideoExportSession init](&v39, sel_init);
  if (v19)
  {
    v20 = dispatch_queue_create("com.apple.NanoTimeKitCompanion.exportQ", 0);
    exportQueue = v19->_exportQueue;
    v19->_exportQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_create("com.apple.NanoTimeKitCompanion.encodeQ", 0);
    encodeQueue = v19->_encodeQueue;
    v19->_encodeQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_video, a3);
    v19->_crop.origin.x = x;
    v19->_crop.origin.y = y;
    v19->_crop.size.width = v12;
    v19->_crop.size.height = v11;
    v19->_outputSize.width = width;
    v19->_outputSize.height = height;
    v19->_bitrate = a6;
    v24 = objc_msgSend(v18, "copy");
    outputURL = v19->_outputURL;
    v19->_outputURL = (NSURL *)v24;

    if (CGRectEqualToRect(v19->_crop, *MEMORY[0x1E0C9D628]))
    {
      v26 = v19->_outputSize.width;
      v27 = v19->_outputSize.height;
      v28 = NTKPhotosVideoDimensions(v19->_video);
      v30 = v27 * v28 / v26;
      v31 = v26 * v29 / v27;
      if (v28 / v29 > v26 / v27)
        v30 = v29;
      else
        v31 = v28;
      v32 = (v28 - v31) * 0.5;
      v33 = (v29 - v30) * 0.5;
      v19->_crop.origin.x = v32;
      v19->_crop.origin.y = v33;
      v19->_crop.size.width = v31;
      v19->_crop.size.height = v30;
    }
    else
    {
      v32 = v19->_crop.origin.x;
      v33 = v19->_crop.origin.y;
      v31 = v19->_crop.size.width;
      v30 = v19->_crop.size.height;
    }
    v19->_crop.origin.x = denormalizeIfNecessary(v17, v32, v33, v31, v30);
    v19->_crop.origin.y = v34;
    v19->_crop.size.width = v35;
    v19->_crop.size.height = v36;
    error = v19->_error;
    v19->_error = 0;

    v19->_status = 1;
  }

  return v19;
}

- (void)exportAsynchronouslyWithCompletion:(id)a3
{
  id v4;
  NSObject *exportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  exportQueue = self->_exportQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke;
  v7[3] = &unk_1E6BD00B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(exportQueue, v7);

}

void __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  __int128 v34;
  uint64_t v35;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_makeReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "_makeWriter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startReading");
  objc_msgSend(v4, "startWriting");
  v34 = *MEMORY[0x1E0CA2E68];
  v35 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v4, "startSessionAtSourceTime:", &v34);
  objc_msgSend(v3, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = dispatch_semaphore_create(0);
  objc_msgSend(*v2, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *v2;
  if (v10)
  {
    objc_msgSend(v11, "setStatus:", 4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v11, "setStatus:", 2);
    v12 = *((_QWORD *)*v2 + 2);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_2;
    v27[3] = &unk_1E6BD5B20;
    v22 = v8;
    v28 = v8;
    v23 = v6;
    v29 = v6;
    v13 = v4;
    v14 = *v2;
    v30 = v13;
    v31 = v14;
    v15 = v3;
    v32 = v15;
    v16 = v9;
    v33 = v16;
    objc_msgSend(v28, "requestMediaDataWhenReadyOnQueue:usingBlock:", v12, v27);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*v2, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_cold_1(v2);

      objc_msgSend(v15, "cancelReading");
      objc_msgSend(v13, "cancelWriting");
    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_3;
      v24[3] = &unk_1E6BCDCB8;
      v24[4] = *v2;
      v25 = v13;
      v19 = v16;
      v26 = v19;
      objc_msgSend(v25, "finishWritingWithCompletionHandler:", v24);
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    }
    v8 = v22;
    objc_msgSend(*(id *)(a1 + 32), "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v21 = 4;
    else
      v21 = 3;
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = v23;
  }

}

uint64_t __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  char v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData");
  if ((_DWORD)result)
  {
    v3 = 0;
    do
    {
      while (1)
      {
        v4 = objc_msgSend(*(id *)(a1 + 40), "copyNextSampleBuffer");
        if (v4)
          break;
        if (objc_msgSend(*(id *)(a1 + 64), "status") == 2)
          objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
        objc_msgSend(*(id *)(a1 + 64), "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setError:", v6);

        v3 = 1;
        if ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) == 0)
          return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
      }
      v5 = (const void *)v4;
      objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v4);
      CFRelease(v5);
      if (objc_msgSend(*(id *)(a1 + 48), "status") != 1)
      {
        objc_msgSend(*(id *)(a1 + 48), "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setError:", v7);

        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
      }
      result = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData");
    }
    while ((result & 1) != 0);
    if ((v3 & 1) == 0)
      return result;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  }
  return result;
}

intptr_t __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v2);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_makeReader
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  -[NTKCompanionIrisVideoExportSession video](self, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  compositionAssetForVideo(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v5, "count"))
    {
      v6 = *MEMORY[0x1E0CA8FF0];
      v35[0] = *MEMORY[0x1E0CA9040];
      v35[1] = v6;
      v36[0] = &unk_1E6CA1B90;
      v36[1] = MEMORY[0x1E0C9AA70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B008], "assetReaderVideoCompositionOutputWithVideoTracks:videoSettings:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCompanionIrisVideoExportSession crop](self, "crop");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[NTKCompanionIrisVideoExportSession outputSize](self, "outputSize");
      v18 = v17;
      v20 = v19;
      -[NTKCompanionIrisVideoExportSession video](self, "video");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      cropCompositionFor(v4, v21, v10, v12, v14, v16, v18, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVideoComposition:", v22);

      v34 = 0;
      objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v4, &v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v34;
      if (v24)
      {
        -[NTKCompanionIrisVideoExportSession setError:](self, "setError:", v24);
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[NTKCompanionIrisVideoExportSession _makeReader].cold.3((uint64_t)v4, self);

        v26 = 0;
      }
      else
      {
        objc_msgSend(v23, "addOutput:", v8);
        v26 = v23;
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = CFSTR("No video tracks.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("NTKCompananionIrisVideoExportSession"), 1, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCompanionIrisVideoExportSession setError:](self, "setError:", v32);

      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NTKCompanionIrisVideoExportSession _makeReader].cold.2();
      v26 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("Cannot create composition asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("NTKCompananionIrisVideoExportSession"), 1, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionIrisVideoExportSession setError:](self, "setError:", v29);

    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKCompanionIrisVideoExportSession _makeReader].cold.1(self);
    v26 = 0;
  }

  return v26;
}

- (id)_makeWriter
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  -[NTKCompanionIrisVideoExportSession outputSize](self, "outputSize");
  if (v3 == 0.0 || (-[NTKCompanionIrisVideoExportSession outputSize](self, "outputSize"), v4 == 0.0))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("Invalid output size.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NTKCompananionIrisVideoExportSession"), 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionIrisVideoExportSession setError:](self, "setError:", v7);

    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NTKCompanionIrisVideoExportSession _makeWriter].cold.1(self);
    v9 = 0;
  }
  else
  {
    v11 = *MEMORY[0x1E0C8AE68];
    v33[0] = *MEMORY[0x1E0C8AE70];
    v12 = *MEMORY[0x1E0C8AF60];
    v32[0] = v11;
    v32[1] = v12;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[NTKCompanionIrisVideoExportSession outputSize](self, "outputSize");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v14;
    v32[2] = *MEMORY[0x1E0C8AEF0];
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NTKCompanionIrisVideoExportSession outputSize](self, "outputSize");
    objc_msgSend(v15, "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v17;
    v32[3] = *MEMORY[0x1E0C8AEB8];
    v30[0] = *MEMORY[0x1E0C8AE20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKCompanionIrisVideoExportSession bitrate](self, "bitrate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    v31[1] = &unk_1E6CA1BA8;
    v19 = *MEMORY[0x1E0C8AF20];
    v30[1] = *MEMORY[0x1E0C8AEF8];
    v30[2] = v19;
    v30[3] = *MEMORY[0x1E0C8AEE8];
    v20 = *MEMORY[0x1E0C8AEE0];
    v31[2] = *MEMORY[0x1E0C8AF18];
    v31[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C8B018];
    -[NTKCompanionIrisVideoExportSession outputURL](self, "outputURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0C8A2E8];
    v29 = 0;
    objc_msgSend(v23, "assetWriterWithURL:fileType:error:", v24, v25, &v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v29;

    if (v27)
    {
      -[NTKCompanionIrisVideoExportSession setError:](self, "setError:", v27);
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[NTKCompanionIrisVideoExportSession _makeWriter].cold.2(self);

      v9 = 0;
    }
    else
    {
      objc_msgSend(v26, "addInput:", v22);
      objc_msgSend(v26, "setShouldOptimizeForNetworkUse:", 1);
      v9 = v26;
    }

  }
  return v9;
}

- (AVAsset)video
{
  return self->_video;
}

- (CGRect)crop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_crop.origin.x;
  y = self->_crop.origin.y;
  width = self->_crop.size.width;
  height = self->_crop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)bitrate
{
  return self->_bitrate;
}

- (NSURL)outputURL
{
  return self->_outputURL;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_encodeQueue, 0);
  objc_storeStrong((id *)&self->_exportQueue, 0);
}

void __73__NTKCompanionIrisVideoExportSession_exportAsynchronouslyWithCompletion___block_invoke_cold_1(id *a1)
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
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1B72A3000, v2, v3, "Error during export: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_makeReader
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "_makeReader: cannot create AVAssetReader for composition %@, error: %@\n", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)_makeWriter
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "outputURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "_makeWriter: cannnot create AVAssetWriter for url %@, error: %@\n", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

@end
