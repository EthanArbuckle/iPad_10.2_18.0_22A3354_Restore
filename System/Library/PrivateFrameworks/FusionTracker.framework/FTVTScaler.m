@implementation FTVTScaler

- (FTVTScaler)initWithCommandQueue:(id)a3
{
  id v5;
  FTVTScaler *v6;
  FTVTScaler *v7;
  uint64_t v8;
  MTLDeviceSPI *device;
  uint64_t v10;
  MPSImageStatisticsMean *meanFilter;
  void *v12;
  uint64_t v13;
  MTLTexture *meanTexture;
  ft *v15;
  NSObject *v16;
  FTVTScaler *v17;
  ft *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FTVTScaler;
  v6 = -[FTVTScaler init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandQueue, a3);
    objc_msgSend(v5, "device");
    v8 = objc_claimAutoreleasedReturnValue();
    device = v7->_device;
    v7->_device = (MTLDeviceSPI *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE418]), "initWithDevice:", v7->_device);
    meanFilter = v7->_meanFilter;
    v7->_meanFilter = (MPSImageStatisticsMean *)v10;

    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, 1, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUsage:", 2);
    v13 = -[MTLDeviceSPI newTextureWithDescriptor:](v7->_device, "newTextureWithDescriptor:", v12);
    meanTexture = v7->_meanTexture;
    v7->_meanTexture = (MTLTexture *)v13;

    VTPixelTransferSessionCreate(0, &v7->_transferSession);
    v15 = (ft *)VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x24BDF9690], (CFTypeRef)*MEMORY[0x24BDBD268]);
    if ((_DWORD)v15)
    {
      ft::GetOsLog(v15);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[FTVTScaler initWithCommandQueue:].cold.2();
    }
    else
    {
      v18 = (ft *)VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98E0]);
      if (!(_DWORD)v18)
      {
        v17 = v7;
        goto LABEL_10;
      }
      ft::GetOsLog(v18);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[FTVTScaler initWithCommandQueue:].cold.1();
    }

    v17 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  VTPixelTransferSessionInvalidate(self->_transferSession);
  CFRelease(self->_transferSession);
  self->_transferSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)FTVTScaler;
  -[FTVTScaler dealloc](&v3, sel_dealloc);
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6
{
  return -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:
{
  uint64_t v6;
  uint64_t v7;
  double height;
  double width;
  CGFloat x;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v18;
  ft *v19;
  int v20;
  CFDictionaryRef DictionaryRepresentation;
  CGFloat v22;
  NSObject *v23;
  CGFloat v24;
  ft *v25;
  int v26;
  CFDictionaryRef v27;
  ft *v28;
  BOOL v29;
  ft *PixelFormatType;
  void *v32;
  size_t v33;
  void *v34;
  void *v35;
  MTLTexture *meanTexture;
  CGFloat y;
  _QWORD v38[3];
  int64x2_t v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v7 = v6;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a5.size.height;
  v12 = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  if (CGRectIsEmpty(a5))
  {
    v12 = (double)CVPixelBufferGetWidth(a3);
    v11 = (double)CVPixelBufferGetHeight(a3);
    v14 = 0.0;
    v13 = 0.0;
  }
  v18 = (double)CVPixelBufferGetWidth(a3);
  v46.size.height = (double)CVPixelBufferGetHeight(a3);
  v46.origin.x = 0.0;
  v46.origin.y = 0.0;
  v41.origin.x = v14;
  v41.origin.y = v13;
  v41.size.width = v12;
  v41.size.height = v11;
  v46.size.width = v18;
  if (CGRectEqualToRect(v41, v46))
  {
    v19 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x24BDF9688], 0);
    v20 = (int)v19;
  }
  else
  {
    v42.origin.x = v14;
    v42.origin.y = v13;
    v42.size.width = v12;
    v42.size.height = v11;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
    v19 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x24BDF9688], DictionaryRepresentation);
    v20 = (int)v19;
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  v22 = y;
  if (v20)
  {
    ft::GetOsLog(v19);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:].cold.4();
  }
  else
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    if (CGRectIsEmpty(v43))
    {
      width = (double)CVPixelBufferGetWidth(a4);
      height = (double)CVPixelBufferGetHeight(a4);
      x = 0.0;
      v22 = 0.0;
    }
    v24 = (double)CVPixelBufferGetWidth(a4);
    v47.size.height = (double)CVPixelBufferGetHeight(a4);
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v44.origin.x = x;
    v44.origin.y = v22;
    v44.size.width = width;
    v44.size.height = height;
    v47.size.width = v24;
    if (CGRectEqualToRect(v44, v47))
    {
      v25 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x24BDF9650], 0);
      v26 = (int)v25;
    }
    else
    {
      v45.origin.x = x;
      v45.origin.y = v22;
      v45.size.width = width;
      v45.size.height = height;
      v27 = CGRectCreateDictionaryRepresentation(v45);
      v25 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x24BDF9650], v27);
      v26 = (int)v25;
      if (v27)
        CFRelease(v27);
    }
    if (v26)
    {
      ft::GetOsLog(v25);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[FTVTScaler initWithCommandQueue:].cold.2();
    }
    else
    {
      v28 = (ft *)VTPixelTransferSessionTransferImage(self->_transferSession, a3, a4);
      if ((_DWORD)v28)
      {
        ft::GetOsLog(v28);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:].cold.2();
      }
      else
      {
        if (!v7)
          return 1;
        PixelFormatType = (ft *)CVPixelBufferGetPixelFormatType(a4);
        if ((_DWORD)PixelFormatType == 1111970369)
        {
          v32 = (void *)MEMORY[0x24BDDD740];
          v33 = CVPixelBufferGetWidth(a4);
          objc_msgSend(v32, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, v33, CVPixelBufferGetHeight(a4), 0);
          v23 = objc_claimAutoreleasedReturnValue();
          -[NSObject setUsage:](v23, "setUsage:", 1);
          v34 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v23, CVPixelBufferGetIOSurface(a4), 0);
          -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSImageStatisticsMean encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_meanFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v35, v34, self->_meanTexture);
          objc_msgSend(v35, "commit");
          objc_msgSend(v35, "waitUntilCompleted");
          meanTexture = self->_meanTexture;
          memset(v38, 0, sizeof(v38));
          v39 = vdupq_n_s64(1uLL);
          v40 = 1;
          -[MTLTexture getBytes:bytesPerRow:fromRegion:mipmapLevel:](meanTexture, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v7, 4, v38, 0);

          v29 = 1;
          goto LABEL_23;
        }
        ft::GetOsLog(PixelFormatType);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:].cold.1();
      }
    }
  }
  v29 = 0;
LABEL_23:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanTexture, 0);
  objc_storeStrong((id *)&self->_meanFilter, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithCommandQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_ScalingMode to 'kVTScalingMode_CropSourceToCleanAperture'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCommandQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_DestinationRectangle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "FTVTScaler error: dstBuffer has unsupported pixelformat. Mean computation only supported for dstBuffer formats: 'kCVPixelFormatType_32BGRA'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "FTVTScaler error: VTPixelTransferSessionTransferImage failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_SourceCropRectangle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
