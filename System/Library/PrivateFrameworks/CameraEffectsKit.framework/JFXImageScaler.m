@implementation JFXImageScaler

- (id)initForCPU:(BOOL)a3
{
  JFXImageScaler *v4;
  JFXImageScaler *v5;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)JFXImageScaler;
  v4 = -[JFXImageScaler init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_useCPU = a3;
    if (!a3)
    {
      v6 = VTPixelTransferSessionCreate(0, &v4->_vtPixelTransferSession);
      if (v6)
      {
        v7 = v6;
        JFXLog_matting();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v12 = v7;
          _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "VTPixelTransferSessionCreate failed with error %ld", buf, 0xCu);
        }

      }
    }
  }
  return v5;
}

- (void)scaleImage:(__CVBuffer *)a3 destinationImage:(__CVBuffer *)a4
{
  OSType PixelFormatType;
  OSType v7;
  OSType v8;
  vImage_Error v9;
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  NSObject *v11;
  NSObject *v12;
  vImage_Buffer v13;
  vImage_Buffer src;
  __int16 v15;
  OSType v16;
  __int16 v17;
  OSType v18;
  __int16 v19;
  OSType v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_useCPU)
  {
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v7 = CVPixelBufferGetPixelFormatType(a4);
    v8 = v7;
    if (PixelFormatType == 1278226488 && v7 == 1278226488)
    {
      memset(&src, 0, sizeof(src));
      JFXToVImage(a3, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXToVImage(a4, (uint64_t)&v13);
      v9 = vImageScale_Planar8(&src, &v13, 0, 0x28u);
    }
    else if ((PixelFormatType & 0xFFFFFFEF) == 0x34323066 && (v7 & 0xFFFFFFEF) == 0x34323066)
    {
      memset(&src, 0, sizeof(src));
      JFXPlanarToVImage(a3, 0, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXPlanarToVImage(a4, 0, (uint64_t)&v13);
      if (vImageScale_Planar8(&src, &v13, 0, 0x28u))
        goto LABEL_19;
      memset(&src, 0, sizeof(src));
      JFXPlanarToVImage(a3, 1uLL, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXPlanarToVImage(a4, 1uLL, (uint64_t)&v13);
      v9 = vImageScale_CbCr8(&src, &v13, 0, 0x28u);
    }
    else
    {
      if (PixelFormatType != 1717855600 || v7 != 1717855600)
      {
        JFXLog_matting();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(src.data) = 0;
          _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "Error: image scaler does not support this pixel format", (uint8_t *)&src, 2u);
        }

        goto LABEL_19;
      }
      memset(&src, 0, sizeof(src));
      JFXToVImage(a3, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXToVImage(a4, (uint64_t)&v13);
      v9 = vImageScale_PlanarF(&src, &v13, 0, 0x28u);
    }
    if (!v9)
    {
LABEL_22:
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      return;
    }
LABEL_19:
    JFXLog_matting();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(src.data) = 67110912;
      HIDWORD(src.data) = HIBYTE(PixelFormatType);
      LOWORD(src.height) = 1024;
      *(_DWORD *)((char *)&src.height + 2) = HIWORD(PixelFormatType);
      HIWORD(src.height) = 1024;
      LODWORD(src.width) = PixelFormatType >> 8;
      WORD2(src.width) = 1024;
      *(_DWORD *)((char *)&src.width + 6) = PixelFormatType;
      WORD1(src.rowBytes) = 1024;
      HIDWORD(src.rowBytes) = HIBYTE(v8);
      v15 = 1024;
      v16 = HIWORD(v8);
      v17 = 1024;
      v18 = v8 >> 8;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "Error: image scale from %c%c%c%c to %c%c%c%c failed.", (uint8_t *)&src, 0x32u);
    }

    goto LABEL_22;
  }
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
    VTPixelTransferSessionTransferImage(vtPixelTransferSession, a3, a4);
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  objc_super v4;

  if (!self->_useCPU)
  {
    vtPixelTransferSession = self->_vtPixelTransferSession;
    if (vtPixelTransferSession)
    {
      VTPixelTransferSessionInvalidate(vtPixelTransferSession);
      CFRelease(self->_vtPixelTransferSession);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXImageScaler;
  -[JFXImageScaler dealloc](&v4, sel_dealloc);
}

@end
