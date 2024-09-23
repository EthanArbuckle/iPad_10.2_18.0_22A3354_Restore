@implementation HMCameraView

- (void)willMoveToWindow:(id)a3
{
  void *v5;

  -[HMCameraView cameraSource](self, "cameraSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v5)
      -[HMCameraView _fillSlotForCameraSource](self, "_fillSlotForCameraSource");
  }
}

- (HMCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (HMCameraView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraView;
  return -[HMCameraView init](&v3, sel_init);
}

- (void)setCameraSource:(HMCameraSource *)cameraSource
{
  HMCameraSource *v5;
  HMCameraSource *v6;
  void *v7;
  void *v8;
  HMCameraSource *v9;

  v9 = cameraSource;
  -[HMCameraView cameraSource](self, "cameraSource");
  v5 = (HMCameraSource *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    objc_storeStrong((id *)&self->_cameraSource, cameraSource);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[HMCameraView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContents:", 0);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      goto LABEL_6;
    }
    -[HMCameraView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (v7)
    {
      -[HMCameraView _fillSlotForCameraSource](self, "_fillSlotForCameraSource");
LABEL_6:
      v6 = v9;
    }
  }

}

- (void)_fillSlotForCameraSource
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[5];
  int v8;

  -[HMCameraView cameraSource](self, "cameraSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  -[HMCameraView cameraSource](self, "cameraSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HMCameraView__fillSlotForCameraSource__block_invoke;
  v7[3] = &unk_1E3AAEF68;
  v7[4] = self;
  v8 = v5;
  objc_msgSend(v6, "fillSlotWithCompletionHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSource, 0);
}

void __40__HMCameraView__fillSlotForCameraSource__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fill slot for camera source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__HMCameraView__fillSlotForCameraSource__block_invoke_1;
    v8[3] = &unk_1E3AAEF40;
    v9 = *(_DWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }

}

void __40__HMCameraView__fillSlotForCameraSource__block_invoke_1(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting layer contents: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", v2);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
