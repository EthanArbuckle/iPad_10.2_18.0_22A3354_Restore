@implementation VNCVPixelBufferHelper

+ (uint64_t)_validatePixelBuffer:(_QWORD *)a3 error:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __IOSurface *IOSurface;
  uint64_t v12;
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
  uint64_t result;
  const __CFString *v25;
  id v26;
  uint64_t v27;

  objc_opt_self();
  if (!a2)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: Pixel buffer is null"), v5, v6, v7, v8, v9, v10, v27);
    if (!a3)
      return 0;
    v25 = CFSTR("Pixel buffer is null");
LABEL_11:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v26;
    return result;
  }
  IOSurface = CVPixelBufferGetIOSurface(a2);
  if (!IOSurface)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: Pixel buffer is missing an IOSurface"), v12, v13, v14, v15, v16, v17, v27);
    if (!a3)
      return 0;
    v25 = CFSTR("Pixel buffer is missing an IOSurface");
    goto LABEL_11;
  }
  if (IOSurfaceGetBaseAddress(IOSurface))
    return 1;
  VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: IOSurface is not valid"), v18, v19, v20, v21, v22, v23, v27);
  if (a3)
  {
    v25 = CFSTR("IOSurface is not valid");
    goto LABEL_11;
  }
  return 0;
}

+ (CVPixelBufferRef)createPixelBufferUsingIOSurfaceWithWidth:(size_t)a3 height:(uint64_t)a4 pixelFormatType:(_QWORD *)a5 error:
{
  uint64_t v9;
  id v10;
  CVPixelBufferRef result;
  char v12;
  CVPixelBufferRef texture;

  objc_opt_self();
  objc_opt_self();
  texture = 0;
  v9 = VNCVPixelBufferCreateUsingIOSurface(a2, a3, a4, 0, &texture);
  if ((_DWORD)v9)
  {
    if (a5)
    {
      +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v9, a2, a3, a4, CFSTR("Failed to create CVPixelBuffer"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a5 = v10;
      return result;
    }
  }
  else
  {
    v12 = +[VNCVPixelBufferHelper _validatePixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, texture, a5);
    result = texture;
    if ((v12 & 1) != 0)
      return result;
    CVPixelBufferRelease(texture);
  }
  return 0;
}

+ (uint64_t)renderRawDataBufferWithWidth:(uint64_t)a1 height:(uint64_t)a2 pixelFormatType:(uint64_t)a3 rowBytes:(uint64_t)a4 dataBytes:(int *)a5 intoCVPixelBuffer:(__CVBuffer *)a6 error:(_QWORD *)a7
{
  size_t Width;
  size_t Height;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  size_t BytesPerRow;
  _DWORD *BaseAddress;
  uint64_t j;
  __int16 v21;
  void *v28;
  void *v29;
  uint64_t i;
  int v31;

  objc_opt_self();
  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  if (Width != a2 || Height != a3)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inference buffer image with dimensions %ld x %ld cannot be rendered into a pixel buffer with dimensions %ld x %ld"), a2, a3, Width, Height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v17);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v15 = CVPixelBufferLockBaseAddress(a6, 0);
  if (!(_DWORD)v15)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a6);
    BaseAddress = CVPixelBufferGetBaseAddress(a6);
    if ((_DWORD)a4 == 1278226534)
    {
      if (4 * a2 <= BytesPerRow)
      {
        for (i = a3 * a2; i; --i)
        {
          v31 = *a5++;
          *BaseAddress++ = v31;
        }
        goto LABEL_23;
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inference buffer image with row bytes size of %ld cannot be rendered into a pixel buffer with %lu bytes per row"), 4 * a2, BytesPerRow);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        *a7 = v29;

        v16 = 0;
LABEL_24:
        CVPixelBufferUnlockBaseAddress(a6, 0);
        return v16;
      }
    }
    else
    {
      if ((_DWORD)a4 == 1278226536)
      {
        for (j = a3 * a2; j; --j)
        {
          v21 = *(_WORD *)a5;
          a5 = (int *)((char *)a5 + 2);
          _H0 = v21;
          __asm { FCVT            S0, H0 }
          *BaseAddress++ = _S0;
        }
LABEL_23:
        v16 = 1;
        goto LABEL_24;
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported pixel format type (%u)"), a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    v16 = 0;
    goto LABEL_24;
  }
  if (!a7)
    return 0;
  +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v15, CFSTR("could not lock pixel buffer"));
  v16 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v16;
}

+ (BOOL)lockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(_QWORD *)a4 error:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_opt_self();
  v13 = CVPixelBufferLockBaseAddress(a2, a3);
  if ((_DWORD)v13)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: Failed to lock pixel buffer (%p): %d"), v7, v8, v9, v10, v11, v12, (uint64_t)a2);
    if (a4)
    {
      +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v13, CFSTR("Failed to lock pixel buffer"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return (_DWORD)v13 == 0;
}

+ (BOOL)unlockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(_QWORD *)a4 error:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_opt_self();
  v13 = CVPixelBufferUnlockBaseAddress(a2, a3);
  if ((_DWORD)v13)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: Failed to unlock buffer (%p): %d"), v7, v8, v9, v10, v11, v12, (uint64_t)a2);
    if (a4)
    {
      +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v13, CFSTR("Failed to unlock pixel buffer"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return (_DWORD)v13 == 0;
}

@end
