@implementation CAMMirrorOutputVideoCommand

- (CAMMirrorOutputVideoCommand)initWithOutputMirrored:(BOOL)a3
{
  CAMMirrorOutputVideoCommand *v4;
  CAMMirrorOutputVideoCommand *v5;
  CAMMirrorOutputVideoCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMMirrorOutputVideoCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_outputMirrored = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMMirrorOutputVideoCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMMirrorOutputVideoCommand isOutputMirrored](self, "isOutputMirrored");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = -[CAMMirrorOutputVideoCommand isOutputMirrored](self, "isOutputMirrored");
  objc_msgSend(v4, "currentStillImageOutput");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMovieFileOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = objc_msgSend(v8, "isMovieRecordingEnabled");
  else
    v7 = 0;
  -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:](self, "_setVideoMirrored:forOutput:requirePhysicalFlip:", v5, v8, v7);
  -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:](self, "_setVideoMirrored:forOutput:requirePhysicalFlip:", v5, v6, v5);

}

- (void)_setVideoMirrored:(BOOL)a3 forOutput:(id)a4 requirePhysicalFlip:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = a5;
  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((objc_msgSend(v10, "isVideoMirroringSupported") & 1) != 0)
      {
        if (v5)
          v12 = 2;
        else
          v12 = 1;
        objc_msgSend(v11, "supportedVideoMirroringMethodsForMovieRecording");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSObject containsObject:](v13, "containsObject:", v14);

        if (v15)
        {
          objc_msgSend(v11, "setVideoMirroringMethodForMovieRecording:", v12);
        }
        else if (v5)
        {
          -[CAMMirrorOutputVideoCommand _debugStringForMirroringMethod:](self, "_debugStringForMirroringMethod:", 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMMirrorOutputVideoCommand _debugStringForSupportedMirroringMethods:](self, "_debugStringForSupportedMirroringMethods:", v13);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = 138543874;
            v32 = v28;
            v33 = 2114;
            v34 = v29;
            v35 = 2114;
            v36 = v11;
            _os_log_error_impl(&dword_1DB760000, v30, OS_LOG_TYPE_ERROR, "Unsupported mirroring method %{public}@ (supported=%{public}@) for connection %{public}@", (uint8_t *)&v31, 0x20u);
          }

        }
        objc_msgSend(v11, "setAutomaticallyAdjustsVideoMirroring:", 0);
        objc_msgSend(v11, "setVideoMirrored:", v6);
      }
      else
      {
        if (!v6)
        {
LABEL_20:

          goto LABEL_21;
        }
        v13 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:].cold.2((uint64_t)v9, v13, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:].cold.1((uint64_t)v9, v13, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (id)_debugStringForMirroringMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1EA32B938[a3];
}

- (id)_debugStringForSupportedMirroringMethods:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  CAMMirrorOutputVideoCommand *v12;

  v4 = (objc_class *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__CAMMirrorOutputVideoCommand__debugStringForSupportedMirroringMethods___block_invoke;
  v10[3] = &unk_1EA32B918;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v8 = v7;
  return v8;
}

void __72__CAMMirrorOutputVideoCommand__debugStringForSupportedMirroringMethods___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  v5 = objc_msgSend(v8, "integerValue");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_debugStringForMirroringMethod:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

}

- (BOOL)isOutputMirrored
{
  return self->_outputMirrored;
}

- (void)_setVideoMirrored:(uint64_t)a3 forOutput:(uint64_t)a4 requirePhysicalFlip:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to find video output connection for %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_setVideoMirrored:(uint64_t)a3 forOutput:(uint64_t)a4 requirePhysicalFlip:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Video connection does not support mirroring for output %{public}@", a5, a6, a7, a8, 2u);
}

@end
