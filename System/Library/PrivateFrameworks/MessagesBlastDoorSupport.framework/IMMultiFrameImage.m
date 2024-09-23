@implementation IMMultiFrameImage

- (id)initForWritingWithFileURL:(id)a3 scale:(float)a4
{
  id v7;
  IMMultiFrameImage *v8;
  IMMultiFrameImage *v9;
  float v10;
  uint64_t v11;
  NSOutputStream *outputStream;
  NSMutableArray *v13;
  NSMutableArray *durations;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMMultiFrameImage;
  v8 = -[IMMultiFrameImage init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputURL, a3);
    v10 = 1.0;
    if (a4 > 0.0)
      v10 = a4;
    v9->_scale = v10;
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v7, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    outputStream = v9->_outputStream;
    v9->_outputStream = (NSOutputStream *)v11;

    -[NSOutputStream open](v9->_outputStream, "open");
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    durations = v9->_durations;
    v9->_durations = v13;

  }
  return v9;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (float)scale
{
  return self->_scale;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSMutableArray)durations
{
  return self->_durations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
}

- (void)deleteStream
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  -[IMMultiFrameImage outputStream](self, "outputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[IMMultiFrameImage outputURL](self, "outputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0;
  v6 = objc_msgSend(v4, "removeItemAtURL:error:", v5, v9);
  v7 = v9[0];

  if ((v6 & 1) == 0)
  {
    IMMultiFrameImageLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(OptimizedBitmap_Persistence) deleteStream].cold.1();

  }
}

- (BOOL)writeASTCImage:(CGImage *)a3 duration:(double)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  __CFData *v14;
  CGImageDestination *v15;
  BOOL v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  -[IMMultiFrameImage outputStream](self, "outputStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 || a4 == 0.0)
  {
    IMMultiFrameImageLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:].cold.3((uint64_t)a3, v13, a4);
    v17 = 0;
  }
  else
  {
    -[IMMultiFrameImage durations](self, "durations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v12 = *MEMORY[0x1E0CBC830];
    v41[0] = *MEMORY[0x1E0CBCA18];
    v41[1] = v12;
    v42[0] = *MEMORY[0x1E0CBC840];
    v42[1] = &unk_1E78B5900;
    v41[2] = *MEMORY[0x1E0CBC848];
    v42[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v15 = CGImageDestinationCreateWithData(v14, CFSTR("org.khronos.ktx"), 1uLL, 0);
    CGImageDestinationAddImage(v15, a3, (CFDictionaryRef)v13);
    v16 = CGImageDestinationFinalize(v15);
    CFRelease(v15);
    if (v16)
    {
      v39 = 0;
      v40 = -[__CFData length](v14, "length");
      v37 = 0;
      v38[0] = &v37;
      v38[1] = 0x3032000000;
      v38[2] = __Block_byref_object_copy_;
      v38[3] = __Block_byref_object_dispose_;
      if (objc_msgSend(v9, "write:maxLength:", &v40, 8) == 8)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke;
        v29[3] = &unk_1E78B32C8;
        v30 = v9;
        v31 = &v37;
        v32 = &v33;
        -[__CFData enumerateByteRangesUsingBlock:](v14, "enumerateByteRangesUsingBlock:", v29);
        v17 = *((_BYTE *)v34 + 24) == 0;
        if (a5 && *((_BYTE *)v34 + 24))
          *a5 = objc_retainAutorelease(*(id *)(v38[0] + 40));

        _Block_object_dispose(&v33, 8);
      }
      else
      {
        objc_msgSend(v9, "streamError");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(v38[0] + 40);
        *(_QWORD *)(v38[0] + 40) = v19;

        IMMultiFrameImageLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:].cold.1((uint64_t)v38, v21, v22, v23, v24, v25, v26, v27);

        v17 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(*(id *)(v38[0] + 40));
      }
      _Block_object_dispose(&v37, 8);

    }
    else
    {
      IMMultiFrameImageLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[IMMultiFrameImage(ASTC_Persistence) writeASTCImage:duration:error:].cold.2(v18);

      v17 = 0;
    }

  }
  return v17;
}

void __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2) != a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamError");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    IMMultiFrameImageLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);

    *a5 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)finalizeASTCWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  NSObject *v22;
  uint64_t v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[IMMultiFrameImage scale](self, "scale");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("CKAnimatedImageScale"));

  -[IMMultiFrameImage durations](self, "durations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IMMultiFrameImage durations](self, "durations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("CKAnimatedImageDurations"));

  }
  v10 = (void *)objc_msgSend(v5, "copy");
  -[IMMultiFrameImage outputStream](self, "outputStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v12 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v10, v11, 200, 0, v25);
  v13 = v25[0];
  if (v12 <= 0)
  {
    IMMultiFrameImageLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:].cold.4();

    v21 = v13;
    goto LABEL_17;
  }
  v24 = v12;
  if (objc_msgSend(v11, "write:maxLength:", &v24, 8) != 8)
  {
    objc_msgSend(v11, "streamError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    IMMultiFrameImageLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:].cold.3();
    goto LABEL_16;
  }
  -[IMMultiFrameImage durations](self, "durations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v24 = v15;
  if (objc_msgSend(v11, "write:maxLength:", &v24, 8) != 8)
  {
    objc_msgSend(v11, "streamError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    IMMultiFrameImageLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:].cold.2();
LABEL_16:

LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  LODWORD(v24) = 1129005385;
  v16 = objc_msgSend(v11, "write:maxLength:", &v24, 4);
  v17 = v16 == 4;
  if (v16 == 4)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v11, "streamError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    IMMultiFrameImageLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[IMMultiFrameImage(ASTC_Persistence) finalizeASTCWithError:].cold.1();

  }
LABEL_18:
  objc_msgSend(v11, "close");
  if (a3)
    *a3 = objc_retainAutorelease(v21);

  return v17;
}

void __69__IMMultiFrameImage_ASTC_Persistence__writeASTCImage_duration_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, a2, a3, "Failed to write image data to stream with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
