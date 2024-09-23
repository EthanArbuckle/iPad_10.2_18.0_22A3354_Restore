@implementation JFXMetalHelpers

- (id)device
{
  return self->m_device;
}

- (JFXMetalHelpers)initWithDevice:(id)a3
{
  id v5;
  JFXMetalHelpers *v6;
  JFXMetalHelpers *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXMetalHelpers;
  v6 = -[JFXMetalHelpers init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->m_device, a3);

  return v7;
}

- (id)newTexture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self, "newTextureWithSameSizeAs:pixelFormat:", v4, objc_msgSend(v4, "pixelFormat"));

  return v5;
}

- (id)newTextureWithSameSizeAs:(id)a3 pixelFormat:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[JFXMetalHelpers newTextureWithWidth:height:pixelFormat:usage:](self, "newTextureWithWidth:height:pixelFormat:usage:", objc_msgSend(v6, "width"), objc_msgSend(v6, "height"), a4, 3);

  return v7;
}

- (id)newTextureWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 usage:(unint64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, a3, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsage:", a6);
  objc_msgSend(v8, "setStorageMode:", 2);
  v9 = (void *)-[MTLDevice newTextureWithDescriptor:](self->m_device, "newTextureWithDescriptor:", v8);

  return v9;
}

- (id)newPipelineStateForFunctionWithName:(id)a3
{
  id v4;
  MTLDevice *m_device;
  id v6;
  id v7;
  NSObject *v8;
  MTLDevice *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;

  v4 = a3;
  m_device = self->m_device;
  v34 = 0;
  v6 = +[JFXMetalHelpers copyMetalLibraryWithDevice:error:](JFXMetalHelpers, "copyMetalLibraryWithDevice:error:", m_device, &v34);
  v7 = v34;
  if (v6)
  {
    v8 = objc_msgSend(v6, "newFunctionWithName:", v4);
    if (v8)
    {
      v9 = self->m_device;
      v33 = v7;
      v10 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9, "newComputePipelineStateWithFunction:error:", v8, &v33);
      v11 = v33;

      if (v10)
      {
        v10 = v10;
        v12 = v10;
      }
      else
      {
        JFXLog_matting();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[JFXMetalHelpers newPipelineStateForFunctionWithName:].cold.3((uint64_t)v11, v25, v26, v27, v28, v29, v30, v31);

        v12 = 0;
      }
    }
    else
    {
      JFXLog_matting();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[JFXMetalHelpers newPipelineStateForFunctionWithName:].cold.2((uint64_t)v7, v10, v19, v20, v21, v22, v23, v24);
      v12 = 0;
      v11 = v7;
    }

    v7 = v11;
  }
  else
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[JFXMetalHelpers newPipelineStateForFunctionWithName:].cold.1((uint64_t)v7, v8, v13, v14, v15, v16, v17, v18);
    v12 = 0;
  }

  return v12;
}

- (BOOL)runComputeEncoder:(id)a3 pipelineState:(id)a4 referenceTexture:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD v15[3];
  _QWORD v16[3];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "threadExecutionWidth");
  v11 = objc_msgSend(v8, "maxTotalThreadsPerThreadgroup");
  v12 = v10 - 1;
  if (v10 - 1 >= v11)
  {
    JFXLog_matting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[JFXMetalHelpers runComputeEncoder:pipelineState:referenceTexture:].cold.1();

  }
  else
  {
    v16[0] = objc_msgSend(v9, "width");
    v16[1] = objc_msgSend(v9, "height");
    v16[2] = 1;
    v15[0] = v10;
    v15[1] = v11 / v10;
    v15[2] = 1;
    objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", v16, v15);
  }

  return v12 < v11;
}

+ (unint64_t)metalPixelFormatForImage:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  unsigned int v4;
  NSObject *v6;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v4 = PixelFormatType;
  if (PixelFormatType > 1278226535)
  {
    if (PixelFormatType > 1380411456)
    {
      if (PixelFormatType == 2019963440 || PixelFormatType == 2016686640)
        return 20;
      if (PixelFormatType == 1380411457)
        return 115;
    }
    else
    {
      switch(PixelFormatType)
      {
        case 1278226536:
          return 25;
        case 1380401729:
          return 70;
        case 1380410945:
          return 125;
      }
    }
    goto LABEL_23;
  }
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1111970369)
      return 80;
    if (PixelFormatType != 1278226488)
    {
      if (PixelFormatType == 1278226534)
        return 55;
      goto LABEL_23;
    }
    return 10;
  }
  if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
    return 10;
LABEL_23:
  JFXLog_matting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[JFXMetalHelpers metalPixelFormatForImage:].cold.1(v4, v6);

  return 0;
}

+ (__CVBuffer)createCVTextureFromImage:(__CVBuffer *)a3 withTextureCache:(__CVMetalTextureCache *)a4
{
  const __CFAllocator *v6;
  MTLPixelFormat v7;
  size_t Width;
  size_t Height;
  NSObject *v10;
  CVMetalTextureRef textureOut;

  if (!a4)
  {
    JFXLog_matting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:].cold.1();
    goto LABEL_10;
  }
  if (!a3)
  {
    JFXLog_matting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:].cold.2();
    goto LABEL_10;
  }
  textureOut = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = +[JFXMetalHelpers metalPixelFormatForImage:](JFXMetalHelpers, "metalPixelFormatForImage:", a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (CVMetalTextureCacheCreateTextureFromImage(v6, a4, a3, 0, v7, Width, Height, 0, &textureOut))
  {
    JFXLog_matting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:].cold.3();
LABEL_10:

    return 0;
  }
  return textureOut;
}

+ (id)copyMetalLibraryWithDevice:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v7, 0),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = 0;
    v9 = (void *)objc_msgSend(v5, "newLibraryWithURL:error:", v8, &v14);
    v10 = v14;
    v11 = v10;
    if (v10)
    {
      v12 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      v12 = v9;
    }

  }
  else
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[JFXMetalHelpers copyMetalLibraryWithDevice:error:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_device, 0);
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a2, a3, "Error: Could not get library: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a2, a3, "Error: Could not get function: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a2, a3, "Error: Could not create pipeline state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)runComputeEncoder:pipelineState:referenceTexture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Error: threadsPerGroup is wrong", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)metalPixelFormatForImage:(unsigned int)a1 .cold.1(unsigned int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  unsigned int v4;
  __int16 v5;
  unsigned int v6;
  __int16 v7;
  unsigned int v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67110144;
  v2[1] = HIBYTE(a1);
  v3 = 1024;
  v4 = HIWORD(a1);
  v5 = 1024;
  v6 = a1 >> 8;
  v7 = 1024;
  v8 = a1;
  v9 = 1024;
  v10 = a1;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "Error: tried to get metal pixel format for %c%c%c%c (0x%04x)", (uint8_t *)v2, 0x20u);
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Error: texture cache must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Error: image must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Error: Failed to create CVMetalTextureRef.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)copyMetalLibraryWithDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Error: Could not find metal library", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
