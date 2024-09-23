@implementation FRCScaler

- (FRCScaler)init
{
  FRCScaler *v2;
  FRCScaler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRCScaler;
  v2 = -[FRCScaler init](&v5, sel_init);
  if (v2 && (IOSurfaceAcceleratorCreate(), !v2->_scaler))
  {
    NSLog(CFSTR("Failed to create scaler instance"));
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (void)scaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 cropRectangles:(id *)a5 upscale:(BOOL)a6 rotate:(int64_t)a7 waitForCompletion:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  const __CFAllocator *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  const void *v16;
  int v17;
  CFNumberRef v18;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  size_t v22;
  size_t v23;
  uint64_t v24;
  __int128 valuePtr;
  uint64_t v26;

  v8 = a8;
  v10 = a6;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v15 = Mutable;
  if (v8)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D3A328], (const void *)*MEMORY[0x1E0C9AE50]);
    if (v10)
    {
LABEL_3:
      v16 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0D3A220], (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0D3A290], v16);
      if (!a7)
        goto LABEL_4;
LABEL_8:
      switch(a7)
      {
        case 3:
          v17 = 3;
          break;
        case 2:
          v17 = 7;
          break;
        case 1:
          v17 = 4;
          break;
        default:
          LODWORD(valuePtr) = 0;
LABEL_16:
          v18 = CFNumberCreate(v13, kCFNumberIntType, &valuePtr);
          CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0D3A330], v18);
          CFRelease(v18);
          if (v8)
            goto LABEL_5;
          goto LABEL_17;
      }
      LODWORD(valuePtr) = v17;
      goto LABEL_16;
    }
  }
  if (a7)
    goto LABEL_8;
LABEL_4:
  if (v8)
  {
LABEL_5:
    CVPixelBufferGetIOSurface(a3);
    CVPixelBufferGetIOSurface(a4);
    goto LABEL_18;
  }
LABEL_17:
  valuePtr = xmmword_1E9786968;
  v26 = 0;
  CVPixelBufferGetIOSurface(a3);
  CVPixelBufferGetIOSurface(a4);
LABEL_18:
  if (IOSurfaceAcceleratorTransformSurface())
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v22 = CVPixelBufferGetWidth(a4);
    v23 = CVPixelBufferGetHeight(a4);
    v24 = CVPixelBufferGetPixelFormatType(a4);
    NSLog(CFSTR("[Scaler] Error! failed to run scaler. Source: %ld x %ld, format:%d, Destination: %ld x %ld, format: %d\n"), Width, Height, PixelFormatType, v22, v23, v24);
  }
  CFRelease(v15);
}

- (void)downScaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 rotate:(int64_t)a5 waitForCompletion:(BOOL)a6
{
  _BOOL8 v6;
  __int128 v11;
  size_t v12;
  size_t v13;
  __int128 v14;

  v6 = a6;
  kdebug_trace();
  v14 = 0u;
  v11 = 0u;
  v12 = CVPixelBufferGetWidth(a3) << 16;
  v13 = CVPixelBufferGetHeight(a3) << 16;
  -[FRCScaler scaleFrameSource:destination:cropRectangles:upscale:rotate:waitForCompletion:](self, "scaleFrameSource:destination:cropRectangles:upscale:rotate:waitForCompletion:", a3, a4, &v11, 0, a5, v6);
  kdebug_trace();
}

- (void)upScaleAndCropFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 upscale:(BOOL)a5 rotate:(int64_t)a6 waitForCompletion:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  size_t Width;
  int v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  int v21;
  size_t Height;
  size_t v23;

  v7 = a7;
  v9 = a5;
  kdebug_trace();
  Width = CVPixelBufferGetWidth(a4);
  v14 = Width;
  v23 = Width;
  Height = CVPixelBufferGetHeight(a4);
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v20 = v14;
  v21 = Height;
  if ((unint64_t)(a6 - 1) <= 1)
    swapWidthAndHeight((uint64_t *)&v23, (uint64_t *)&Height);
  if (v9)
  {
    v15 = (v23 << 15) & 0xFFFFFFFFFFFF0000;
    v16 = (Height << 15) & 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v15 = v23 << 16;
    v16 = Height << 16;
  }
  *(_QWORD *)&v18 = v15;
  *((_QWORD *)&v18 + 1) = v16;
  -[FRCScaler scaleFrameSource:destination:cropRectangles:upscale:rotate:waitForCompletion:](self, "scaleFrameSource:destination:cropRectangles:upscale:rotate:waitForCompletion:", a3, a4, &v17, v9, a6, v7);
  kdebug_trace();
}

- (void)dealloc
{
  __IOSurfaceAccelerator *scaler;
  objc_super v4;

  scaler = self->_scaler;
  if (scaler)
    CFRelease(scaler);
  v4.receiver = self;
  v4.super_class = (Class)FRCScaler;
  -[FRCScaler dealloc](&v4, sel_dealloc);
}

@end
