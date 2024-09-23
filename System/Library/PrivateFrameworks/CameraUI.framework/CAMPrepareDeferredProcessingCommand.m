@implementation CAMPrepareDeferredProcessingCommand

- (CAMPrepareDeferredProcessingCommand)initWithRequest:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  CAMPrepareDeferredProcessingCommand *v9;
  CAMPrepareDeferredProcessingCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMPrepareDeferredProcessingCommand;
  v9 = -[CAMCaptureCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__request, a3);
    objc_storeStrong((id *)&v10->__deferredProcessingCoordinator, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMPrepareDeferredProcessingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[CAMPrepareDeferredProcessingCommand _request](self, "_request");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  -[CAMPrepareDeferredProcessingCommand _deferredProcessingCoordinator](self, "_deferredProcessingCoordinator");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CAMPrepareDeferredProcessingCommand _request](self, "_request");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capturePhotoSettingsWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deferredSettingsForCapturingPhotoWithSettings:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPrepareDeferredProcessingCommand _deferredProcessingCoordinator](self, "_deferredProcessingCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prewarmWithPhotoSettings:completionHandler:", v7, &__block_literal_global_27);

}

void __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke_cold_1((uint64_t)v4, v5);

  }
}

- (CAMStillImageCaptureRequest)_request
{
  return self->__request;
}

- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator
{
  return self->__deferredProcessingCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deferredProcessingCoordinator, 0);
  objc_storeStrong((id *)&self->__request, 0);
}

void __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to pre-warm deferred processing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
