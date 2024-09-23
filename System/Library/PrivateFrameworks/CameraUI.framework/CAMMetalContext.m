@implementation CAMMetalContext

- (CAMMetalContext)init
{
  CAMMetalContext *v2;
  id v3;
  void *v4;
  os_log_t v5;
  CAMMetalContext *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CAMMetalContext;
  v2 = -[CAMMetalContext init](&v23, sel_init);
  if (v2)
  {
    v3 = MTLCreateSystemDefaultDevice();
    v4 = v3;
    if (v3)
    {
      v5 = (os_log_t)objc_msgSend(v3, "newCommandQueue");
      if (v5)
      {
        objc_storeStrong((id *)&v2->_device, v4);
        objc_storeStrong((id *)&v2->_commandQueue, v5);
        v6 = v2;
LABEL_12:

        goto LABEL_13;
      }
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CAMMetalContext init].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    else
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CAMMetalContext init].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to create default Metal command queue", a5, a6, a7, a8, 0);
}

@end
