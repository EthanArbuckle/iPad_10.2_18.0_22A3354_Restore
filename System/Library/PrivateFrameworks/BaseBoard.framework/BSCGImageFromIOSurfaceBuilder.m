@implementation BSCGImageFromIOSurfaceBuilder

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
  -[BSCGImageFromIOSurfaceBuilder dealloc](&v4, sel_dealloc);
}

- (id)setOpaque:(BOOL)a3
{
  if (*((_BYTE *)self + 25) != a3)
  {
    *((_BYTE *)self + 25) = a3;
    *((_BYTE *)self + 24) = 1;
  }
  return self;
}

- (CGImage)buildCGImage
{
  _BOOL4 isDirty;
  CGImage *image;
  IOSurface *surface;
  IOSurface *v6;
  OSType v7;
  void *v8;
  CGImage *v9;
  IOSurface *v10;
  void *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  CGDataProvider *v16;
  _BOOL4 isOpaque;
  __IOSurface *v18;
  CFTypeRef v19;
  const void *v20;
  CGColorSpace *DeviceRGB;
  uint64_t (*v22)(_OWORD *);
  CGBitmapInfo v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  _OWORD v31[7];
  int v32;
  _QWORD v33[7];

  v33[5] = *MEMORY[0x1E0C80C00];
  isDirty = self->_isDirty;
  image = self->_image;
  if (isDirty)
  {
    if (image)
    {
      CFRelease(image);
      self->_image = 0;
    }
  }
  else if (image)
  {
    return (CGImage *)CFRetain(image);
  }
  self->_isDirty = 0;
  surface = self->_surface;
  if (surface)
  {
    v6 = surface;
    -[IOSurface lockWithOptions:seed:](v6, "lockWithOptions:seed:", 1, 0);
    v7 = -[IOSurface pixelFormat](v6, "pixelFormat");
    if (v7 == 1999843442 || v7 == 1647534392)
    {
      v33[0] = *MEMORY[0x1E0CBC750];
      *(_QWORD *)&v31[0] = &unk_1E1EDA178;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v33, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CGImage *)CGImageCreateFromIOSurface();
      -[IOSurface unlockWithOptions:seed:](v6, "unlockWithOptions:seed:", 1, 0);

    }
    else
    {
      v10 = objc_retainAutorelease(v6);
      v11 = -[IOSurface baseAddress](v10, "baseAddress");
      v12 = -[IOSurface bytesPerRow](v10, "bytesPerRow");
      v13 = -[IOSurface width](v10, "width");
      v14 = -[IOSurface height](v10, "height");
      v15 = -[IOSurface allocationSize](v10, "allocationSize");
      CFRetain(v10);
      v16 = CGDataProviderCreateWithData(v10, v11, v15, (CGDataProviderReleaseDataCallback)unlockIOSurface);
      -[IOSurface incrementUseCount](v10, "incrementUseCount");
      isOpaque = self->_isOpaque;
      v18 = v10;
      v19 = IOSurfaceCopyValue(v18, (CFStringRef)*MEMORY[0x1E0CBBF90]);
      v20 = v19;
      if (v19)
      {
        DeviceRGB = CGColorSpaceCreateWithPropertyList(v19);
        CFRelease(v20);
      }
      else
      {
        v32 = 0;
        memset(v31, 0, sizeof(v31));
        DeviceRGB = 0;
        if (!IOSurfaceGetBulkAttachments())
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v22 = (uint64_t (*)(_OWORD *))_MergedGlobals_4;
          v30 = _MergedGlobals_4;
          if (!_MergedGlobals_4)
          {
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke;
            v33[3] = &unk_1E1EBE608;
            v33[4] = &v27;
            __getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke(v33);
            v22 = (uint64_t (*)(_OWORD *))v28[3];
          }
          _Block_object_dispose(&v27, 8);
          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGColorSpaceRef softlinkCVCreateColorSpaceFromIOSurfaceBulkAttachments(const IOSurfaceColorAndSpatialKeys *)");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("IOSurface+BaseBoard.m"), 26, CFSTR("%s"), dlerror());

            __break(1u);
          }
          DeviceRGB = (CGColorSpace *)v22(v31);
        }
      }
      if (!DeviceRGB)
        DeviceRGB = CGColorSpaceCreateDeviceRGB();

      if (isOpaque)
        v23 = 8198;
      else
        v23 = 8194;
      v9 = CGImageCreate(v13, v14, 8uLL, 0x20uLL, v12, DeviceRGB, v23, v16, 0, 1, kCGRenderingIntentDefault);
      CGImageSetProperty();
      if (DeviceRGB)
        CGColorSpaceRelease(DeviceRGB);
      CGDataProviderRelease(v16);
    }

  }
  else
  {
    v9 = 0;
  }
  self->_image = v9;
  image = v9;
  return (CGImage *)CFRetain(image);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
}

@end
