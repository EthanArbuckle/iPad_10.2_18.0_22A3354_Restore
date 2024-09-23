@implementation CIBurstYUVImage

- (void)convertRGBAToYUV420:(char *)a3 rgbaBytesPerRow:(int)a4
{
  char *v7;
  int bytesPerRow;
  int height;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int width;
  char *v18;
  int32x4_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int32x4_t v30;
  int v31;
  int32x4_t v32;
  int v33;
  int v34;
  int v35;
  int32x4_t v36;
  int v37;
  int32x4_t v38;
  int32x4_t v39;
  __int32 v40;
  __int32 v41;
  __int32 v42;
  int32x4_t v43;
  __int32 v44;
  char *v45;
  uint64_t v46;
  int v47;

  v7 = (char *)malloc_type_malloc((self->height + (self->height >> 1)) * self->bytesPerRow, 0x9A227F9uLL);
  height = self->height;
  bytesPerRow = self->bytesPerRow;
  v10 = &v7[height * bytesPerRow];
  self->Ybuffer = v7;
  self->Cbuffer = v10;
  if (height >= 1)
  {
    v11 = 0;
    v12 = a4;
    v13 = a4 + 1;
    v14 = a4 + 5;
    v15 = a4 + 2;
    v16 = a4 + 6;
    v46 = 2 * a4;
    width = self->width;
    v18 = a3 + 4;
    v19.i64[0] = 0xFF000000FFLL;
    v19.i64[1] = 0xFF000000FFLL;
    do
    {
      if (width >= 1)
      {
        v47 = v11;
        v20 = 0;
        v21 = v18;
        do
        {
          v22 = *(v21 - 4);
          v23 = *v21;
          v24 = *(v21 - 3);
          v25 = v21[1];
          v26 = v21[v12 - 4];
          v27 = v21[v13 - 4];
          v28 = *(v21 - 2);
          v29 = v21[2];
          v30.i32[0] = (301 * v24 + 153 * v22 + 58 * v28 + 256) >> 9;
          v31 = v21[v15 - 4];
          v30.i32[1] = (301 * v25 + 153 * v23 + 58 * v29 + 256) >> 9;
          v32.i32[0] = ((-170 * v24 - 86 * v22 + (v28 << 8) + 256) >> 9) + 128;
          v32.i32[1] = ((-170 * v25 - 86 * v23 + (v29 << 8) + 256) >> 9) + 128;
          v32.i32[2] = ((-170 * v27 - 86 * v26 + (v31 << 8) + 256) >> 9) + 128;
          v33 = -214 * v24 + (v22 << 8) - 42 * v28;
          v34 = v21[v12];
          v35 = v21[v14 - 4];
          v30.i32[2] = (301 * v27 + 153 * v26 + 58 * v31 + 256) >> 9;
          v36.i32[0] = ((v33 + 256) >> 9) + 128;
          v37 = v21[v16 - 4];
          v32.i32[3] = ((-170 * v35 - 86 * v34 + (v37 << 8) + 256) >> 9) + 128;
          v36.i32[1] = ((-214 * v25 + (v23 << 8) - 42 * v29 + 256) >> 9) + 128;
          v30.i32[3] = (301 * v35 + 153 * v34 + 58 * v37 + 256) >> 9;
          v36.i32[2] = ((-214 * v27 + (v26 << 8) - 42 * v31 + 256) >> 9) + 128;
          v36.i32[3] = ((-214 * v35 + (v34 << 8) - 42 * v37 + 256) >> 9) + 128;
          v38 = vminq_s32(v30, v19);
          v39 = vminq_s32(vmaxq_s32(v32, (int32x4_t)0), v19);
          v7[v20] = v38.i8[0];
          v7[v20 + 1] = v38.i8[4];
          v7[v20 + self->bytesPerRow] = v38.i8[8];
          v40 = v39.i32[2];
          v41 = v39.i32[0] + v39.i32[1];
          v42 = v39.i32[3];
          v43 = vminq_s32(vmaxq_s32(v36, (int32x4_t)0), v19);
          v44 = v40 + v42;
          v45 = &v10[v20];
          v7[v20 + 1 + self->bytesPerRow] = v38.i8[12];
          *v45 = (v41 + v44 + 2) >> 2;
          v45[1] = (v43.i32[0] + v43.i32[1] + v43.i32[2] + v43.i32[3] + 2) >> 2;
          width = self->width;
          v20 += 2;
          v21 += 8;
        }
        while ((int)v20 < width);
        height = self->height;
        bytesPerRow = self->bytesPerRow;
        v11 = v47;
      }
      v11 += 2;
      v7 += 2 * bytesPerRow;
      v10 += bytesPerRow;
      v18 += v46;
    }
    while (v11 < height);
  }
}

- (CIBurstYUVImage)initWithCGImage:(CGImage *)a3 maxDimension:(int)a4
{
  int Width;
  int Height;
  uint64_t v9;
  uint64_t v10;
  float v11;
  int v12;
  int v13;
  int v14;
  float v15;
  unsigned int v16;
  void *v17;
  CGColorSpace *DeviceRGB;
  CGContext *v19;
  CGContext *v20;
  CGRect v22;

  self->dataPtr = 0;
  self->pixelBuffer = 0;
  self->ioSurf = 0;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  BurstLoggingMessage("initWithCGImage: %dx%d\n", Width, Height);
  if (Width > a4 || Height > a4)
  {
    v15 = (float)a4;
    if (Width <= Height)
    {
      v11 = v15 / (float)Height;
      v12 = (int)(float)(v11 * (float)Width);
      v9 = 28;
      v10 = 24;
      v13 = a4;
      v14 = v12;
    }
    else
    {
      v11 = v15 / (float)Width;
      v12 = (int)(float)(v11 * (float)Height);
      v9 = 24;
      v10 = 28;
      v13 = v12;
      v14 = a4;
    }
  }
  else
  {
    v9 = 28;
    v10 = 24;
    v11 = 1.0;
    v12 = Width;
    a4 = Height;
    v13 = Height;
    v14 = Width;
  }
  *(_DWORD *)((char *)&self->super.isa + v10) = v12;
  *(_DWORD *)((char *)&self->super.isa + v9) = a4;
  v16 = (v14 + 3) & 0xFFFFFFFC;
  self->bytesPerRow = v16;
  v17 = malloc_type_malloc((int)(4 * v13 * v16), 0x83D4F016uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19 = CGBitmapContextCreate(v17, self->width, self->height, 8uLL, 4 * self->bytesPerRow, DeviceRGB, 5u);
  if (v19)
  {
    v20 = v19;
    CGContextScaleCTM(v19, v11, v11);
    v22.size.width = (double)Width;
    v22.size.height = (double)Height;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    CGContextDrawImage(v20, v22, a3);
    CGContextRelease(v20);
  }
  CGColorSpaceRelease(DeviceRGB);
  -[CIBurstYUVImage convertRGBAToYUV420:rgbaBytesPerRow:](self, "convertRGBAToYUV420:rgbaBytesPerRow:", v17, (4 * self->bytesPerRow));
  free(v17);
  return self;
}

- (CIBurstYUVImage)initWithCIImage:(id)a3 ctx:(id)a4 maxDimension:(int)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  const CFDictionaryKeyCallBacks *v23;
  const CFDictionaryValueCallBacks *v24;
  __CFDictionary *Mutable;
  __CFDictionary *v26;
  __CFDictionary *v27;
  int v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  const void *v35;
  const void *v36;
  __CFArray *v37;
  __IOSurface *v38;
  CFNumberRef cf;
  CFNumberRef v43;
  int v44;
  int v45;
  int v46;
  int valuePtr;

  objc_msgSend(a3, "extent");
  v10 = v9;
  v12 = v11;
  v13 = v7;
  v14 = v8;
  v15 = (int)v7;
  v16 = (int)v8;
  v17 = 24;
  v18 = (int)(float)((float)((float)a5 / (float)(int)v8) * (float)(int)v7);
  v19 = 28;
  v20 = 24;
  if ((int)v7 > (int)v8)
    v20 = 28;
  if (v15 > v16)
  {
    v18 = (int)(float)((float)((float)a5 / (float)(int)v7) * (float)(int)v8);
    v19 = 24;
  }
  v21 = v15 <= a5 && v16 <= a5;
  if (!v21)
  {
    v17 = v20;
    v15 = v18;
  }
  *(_DWORD *)((char *)&self->super.isa + v17) = v15;
  v22 = 28;
  if (!v21)
  {
    v22 = v19;
    v16 = a5;
  }
  *(_DWORD *)((char *)&self->super.isa + v22) = v16;
  self->pixelBuffer = 0;
  self->ioSurf = 0;
  self->dataPtr = 0;
  v23 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v24 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v26 = CFDictionaryCreateMutable(0, 0, v23, v24);
  v27 = CFDictionaryCreateMutable(0, 0, v23, v24);
  valuePtr = 875704422;
  v28 = self->width >> 1;
  v45 = self->height >> 1;
  v46 = v28;
  v44 = 2;
  v29 = CFNumberCreate(0, kCFNumberIntType, &self->width);
  v30 = CFNumberCreate(0, kCFNumberIntType, &self->height);
  v31 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v32 = CFNumberCreate(0, kCFNumberIntType, &v46);
  v33 = CFNumberCreate(0, kCFNumberIntType, &v45);
  v34 = CFNumberCreate(0, kCFNumberIntType, &v44);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CBC1E0], v29);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CBC008], v30);
  v43 = v31;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CBC070], v31);
  v35 = (const void *)*MEMORY[0x1E0CBC178];
  cf = v29;
  CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E0CBC178], v29);
  v36 = (const void *)*MEMORY[0x1E0CBC140];
  CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E0CBC140], v30);
  CFDictionaryAddValue(v27, v35, v32);
  CFDictionaryAddValue(v27, v36, v33);
  CFDictionaryAddValue(v27, (const void *)*MEMORY[0x1E0CBC090], v34);
  v37 = CFArrayCreateMutable(0, 2, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(v37, v26);
  CFArrayAppendValue(v37, v27);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CBC158], v37);
  v38 = IOSurfaceCreate(Mutable);
  self->ioSurf = v38;
  if (v38)
  {
    objc_msgSend(a4, "render:toIOSurface:bounds:colorSpace:", a3, v38, 0, v10, v12, v13, v14);
    IOSurfaceLock(self->ioSurf, 0, 0);
    self->width = IOSurfaceGetWidth(self->ioSurf);
    self->height = IOSurfaceGetHeight(self->ioSurf);
    self->bytesPerRow = IOSurfaceGetBytesPerRow(self->ioSurf);
    self->Ybuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 0);
    self->Cbuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 1uLL);
  }
  CFRelease(cf);
  CFRelease(v30);
  CFRelease(v43);
  CFRelease(v32);
  CFRelease(v33);
  CFRelease(v34);
  CFRelease(Mutable);
  CFRelease(v26);
  CFRelease(v27);
  CFRelease(v37);
  return self;
}

- (CIBurstYUVImage)initWithIOSurface:(__IOSurface *)a3 maxDimension:(int)a4
{
  int Width;
  int Height;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  float v13;
  OSType PixelFormat;
  const CFDictionaryKeyCallBacks *v15;
  const CFDictionaryValueCallBacks *v16;
  __CFDictionary *Mutable;
  __CFDictionary *v18;
  CFNumberRef v19;
  uint64_t v20;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  int valuePtr;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferRef pixelBufferOut;

  Width = IOSurfaceGetWidth(a3);
  Height = IOSurfaceGetHeight(a3);
  v9 = Height;
  if (Width > a4 || Height > a4)
  {
    v13 = (float)a4;
    if (Width <= Height)
    {
      v12 = (int)(float)((float)(v13 / (float)Height) * (float)Width);
      v10 = 28;
      v11 = 24;
    }
    else
    {
      v12 = (int)(float)((float)(v13 / (float)Width) * (float)Height);
      v10 = 24;
      v11 = 28;
    }
  }
  else
  {
    v10 = 28;
    v11 = 24;
    v12 = Width;
    a4 = Height;
  }
  *(_DWORD *)((char *)&self->super.isa + v11) = v12;
  *(_DWORD *)((char *)&self->super.isa + v10) = a4;
  self->pixelBuffer = 0;
  self->ioSurf = 0;
  self->dataPtr = 0;
  PixelFormat = IOSurfaceGetPixelFormat(a3);
  if (self->width == Width && self->height == v9 && PixelFormat == 875704422)
  {
    self->ioSurf = a3;
    CFRetain(a3);
    IOSurfaceLock(self->ioSurf, 1u, 0);
    self->width = IOSurfaceGetWidth(self->ioSurf);
    self->height = IOSurfaceGetHeight(self->ioSurf);
    self->bytesPerRow = IOSurfaceGetBytesPerRowOfPlane(self->ioSurf, 0);
    self->Ybuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 0);
    self->Cbuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 1uLL);
  }
  else
  {
    pixelBufferOut = 0;
    CVPixelBufferCreateWithIOSurface(0, a3, 0, &pixelBufferOut);
    pixelBuffer = 0;
    v15 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v16 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v18 = CFDictionaryCreateMutable(0, 0, v15, v16);
    valuePtr = 768;
    v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(v18, (const void *)*MEMORY[0x1E0CBBF10], v19);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA8FF0], v18);
    CVPixelBufferCreate(0, self->width, self->height, 0x34323066u, Mutable, &pixelBuffer);
    CFRelease(Mutable);
    CFRelease(v18);
    CFRelease(v19);
    pixelTransferSessionOut = 0;
    VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    v20 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, pixelBuffer);
    if ((_DWORD)v20)
      NSLog(CFSTR("Error with VTPixelTransferSessionTransferImage:%d\n"), v20);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    self->width = CVPixelBufferGetWidth(pixelBuffer);
    self->height = CVPixelBufferGetHeight(pixelBuffer);
    self->bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    self->Ybuffer = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    self->Cbuffer = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    self->pixelBuffer = pixelBuffer;
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    CFRelease(pixelBufferOut);
  }
  return self;
}

- (void)dealloc
{
  __CFData *dataPtr;
  __CVBuffer *pixelBuffer;
  __IOSurface *ioSurf;
  char *Ybuffer;
  objc_super v7;

  dataPtr = self->dataPtr;
  if (dataPtr)
    CFRelease(dataPtr);
  pixelBuffer = self->pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferRelease(self->pixelBuffer);
    self->Ybuffer = 0;
  }
  ioSurf = self->ioSurf;
  if (ioSurf)
  {
    IOSurfaceUnlock(ioSurf, 1u, 0);
    CFRelease(self->ioSurf);
    self->Ybuffer = 0;
  }
  else
  {
    Ybuffer = self->Ybuffer;
    if (Ybuffer)
      free(Ybuffer);
  }
  v7.receiver = self;
  v7.super_class = (Class)CIBurstYUVImage;
  -[CIBurstYUVImage dealloc](&v7, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  __CVBuffer *result;
  __CFDictionary *Mutable;
  CVPixelBufferRef pixelBufferOut;

  result = self->pixelBuffer;
  if (!result)
  {
    if (self->ioSurf)
    {
      pixelBufferOut = 0;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA91A8], (const void *)*MEMORY[0x1E0C9AE50]);
      CVPixelBufferCreateWithIOSurface(0, self->ioSurf, Mutable, &pixelBufferOut);
      if (Mutable)
        CFRelease(Mutable);
      return pixelBufferOut;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)width
{
  return self->width;
}

- (void)setWidth:(int)a3
{
  self->width = a3;
}

- (int)height
{
  return self->height;
}

- (void)setHeight:(int)a3
{
  self->height = a3;
}

- (char)Ybuffer
{
  return self->Ybuffer;
}

- (void)setYbuffer:(char *)a3
{
  self->Ybuffer = a3;
}

- (char)Cbuffer
{
  return self->Cbuffer;
}

- (void)setCbuffer:(char *)a3
{
  self->Cbuffer = a3;
}

- (int)bytesPerRow
{
  return self->bytesPerRow;
}

- (void)setBytesPerRow:(int)a3
{
  self->bytesPerRow = a3;
}

@end
