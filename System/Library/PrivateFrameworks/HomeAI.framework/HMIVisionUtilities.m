@implementation HMIVisionUtilities

+ (__CVBuffer)cropPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 error:(id *)a5
{
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, CVPixelBufferGetPixelFormatType(a3), 0, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a4.size.width, a4.size.height);
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 error:(id *)a5
{
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, CVPixelBufferGetPixelFormatType(a3), 0, a5, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), a4.width, a4.height);
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5 options:(int64_t)a6 error:(id *)a7
{
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, *(_QWORD *)&a5, a6, a7, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), a4.width, a4.height);
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 pixelFormat:(unsigned int)a4 options:(int64_t)a5 error:(id *)a6
{
  uint64_t v8;
  double Size;
  double v12;

  v8 = *(_QWORD *)&a4;
  Size = HMICVPixelBufferGetSize(a3);
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, v8, a5, a6, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), Size, v12);
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 size:(CGSize)a5 pixelFormat:(unsigned int)a6 options:(int64_t)a7 error:(id *)a8
{
  uint64_t v10;
  double height;
  double width;
  double v13;
  double v14;
  double y;
  double x;
  __CVBuffer *v17;
  IOSurfaceRef IOSurface;
  double Size;
  double v21;
  double v22;
  _BOOL4 v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  int v27;
  uint64_t PixelFormatType;
  uint64_t v29;
  double v30;
  double v31;
  int v33;
  __CVBuffer *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CVBuffer *v43;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  HMISignpost *v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v10 = *(_QWORD *)&a6;
  height = a5.height;
  width = a5.width;
  v13 = a4.size.height;
  v14 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  Size = HMICVPixelBufferGetSize(v17);
  v22 = v21;
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = v14;
  v55.size.height = v13;
  if (CGRectIsNull(v55))
  {
    v23 = 1;
  }
  else
  {
    v58.origin.x = HMICGRectMakeWithSize();
    v58.origin.y = v24;
    v58.size.width = v25;
    v58.size.height = v26;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = v14;
    v56.size.height = v13;
    v23 = CGRectEqualToRect(v56, v58);
  }
  v27 = !v23;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v17);
  v29 = PixelFormatType;
  if (!v23
    || (_DWORD)PixelFormatType != (_DWORD)v10
    || Size != width
    || v22 != height
    || (IOSurface != 0) != (a7 & 1))
  {
    pixelTransferSessionOut = 0;
    v54 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("transferPixelBuffer"));
    if ((a7 & 8) != 0)
    {
      v30 = width * 2.1;
      v31 = height * 2.1;
      if (!v23)
      {
        if (v14 <= v30 || v13 <= v31)
        {
          v33 = 0;
          v27 = 1;
          goto LABEL_19;
        }
        goto LABEL_42;
      }
      if (Size > v30 && v22 > v31)
      {
LABEL_42:
        v43 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v17, v29, a7 & 0xFFFFFFFFFFFFFFF7 | (IOSurface != 0), a8, x, y, v14, v13, width + width, height + height);
        v27 = 0;
        if (!v43)
        {
          v34 = 0;
          goto LABEL_28;
        }
        v33 = 1;
        v17 = v43;
LABEL_19:
        v34 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", v10, a7 & 1, width, height);
        if (v34)
        {
          v35 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
          if ((_DWORD)v35)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTPixelTransferSessionCreate failed. Error %d"), v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1022, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (a8)
              *a8 = objc_retainAutorelease(v37);
          }
          else
          {
            if (!v27)
              goto LABEL_72;
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = v14;
            v57.size.height = v13;
            DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v57);
            v45 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x24BDF9688], DictionaryRepresentation);
            if (DictionaryRepresentation)
              CFRelease(DictionaryRepresentation);
            if ((_DWORD)v45)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTSessionSetProperty failed. Error %d"), v45);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1022, v36);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v46;
              if (a8)
                *a8 = objc_retainAutorelease(v46);
            }
            else
            {
LABEL_72:
              if ((a7 & 2) != 0
                && (v47 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x24BDF9668], (CFTypeRef)*MEMORY[0x24BDBD270]), (_DWORD)v47))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTSessionSetProperty failed. Error %d"), v47);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1022, v36);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v48;
                if (a8)
                  *a8 = objc_retainAutorelease(v48);
              }
              else if ((a7 & 4) != 0
                     && (v49 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x24BDF9670], (CFTypeRef)*MEMORY[0x24BDBD270]), (_DWORD)v49))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTSessionSetProperty failed. Error %d"), v49);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1022, v36);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v50;
                if (a8)
                  *a8 = objc_retainAutorelease(v50);
              }
              else
              {
                CVPixelBufferLockBaseAddress(v17, 1uLL);
                v51 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, v17, v34);
                CVPixelBufferUnlockBaseAddress(v17, 1uLL);
                if (!(_DWORD)v51)
                {
                  VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
                  if (pixelTransferSessionOut)
                    CFRelease(pixelTransferSessionOut);
                  if (v33)
                    CVPixelBufferRelease(v17);
                  goto LABEL_34;
                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTPixelTransferSessionTransferImage failed. Error %d"), v51);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1022, v36);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v52;
                if (a8)
                  *a8 = objc_retainAutorelease(v52);
              }
            }
          }
          HMIErrorLogC(v38);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1001);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (a8)
            *a8 = objc_retainAutorelease(v39);
          HMIErrorLogC(v40);

          v34 = 0;
        }
        v27 = v33;
LABEL_28:
        CVPixelBufferRelease(v34);
        if (v27)
          CVPixelBufferRelease(v17);
        if (pixelTransferSessionOut)
        {
          VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
          if (pixelTransferSessionOut)
            CFRelease(pixelTransferSessionOut);
        }
        v34 = 0;
LABEL_34:
        __HMISignpostScopeLeave(&v54);

        return v34;
      }
      v27 = 0;
    }
    v33 = 0;
    goto LABEL_19;
  }
  CVPixelBufferRetain(v17);
  return v17;
}

+ (id)createJPEGDataFromPixelBuffer:(__CVBuffer *)a3 scale:(float)a4 encodeQuality:(float)a5 error:(id *)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double Size;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  OpaqueCMBlockBuffer *v32;
  size_t DataLength;
  void *v34;
  CGAffineTransform v35;
  CFTypeRef cf;
  CMBlockBufferRef theBuffer;
  HMISignpost *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  theBuffer = 0;
  v38 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("JPEGDataFromPixelBuffer"));
  cf = 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDBD1C8];
  v11 = *MEMORY[0x24BE120C8];
  v45[0] = *MEMORY[0x24BE120D0];
  v45[1] = v11;
  v46[0] = MEMORY[0x24BDBD1C8];
  v46[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (CMPhotoCompressionSessionCreate())
  {
    v13 = 0;
LABEL_4:
    v15 = 0;
    goto LABEL_5;
  }
  v14 = *MEMORY[0x24BE12030];
  v43[0] = *MEMORY[0x24BE12038];
  v43[1] = v14;
  v44[0] = &unk_24DC14528;
  v44[1] = &unk_24DC14540;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (CMPhotoCompressionSessionOpenEmptyContainer())
    goto LABEL_4;
  Size = HMICVPixelBufferGetSize(a3);
  v19 = v18;
  if (a4 > 0.0 && a4 < 1.0)
  {
    CGAffineTransformMakeScale(&v35, a4, a4);
    v20 = v19 * v35.c;
    v19 = v19 * v35.d + v35.b * Size;
    Size = v20 + v35.a * Size;
  }
  if (Size <= v19)
    v21 = v19;
  else
    v21 = Size;
  v22 = (void *)MEMORY[0x24BDBCED8];
  v23 = *MEMORY[0x24BE12068];
  v41[0] = *MEMORY[0x24BE12050];
  v41[1] = v23;
  v42[0] = &unk_24DC14558;
  v42[1] = v10;
  v41[2] = *MEMORY[0x24BE12080];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *MEMORY[0x24BE12098];
  if (a5 <= 0.0 || a5 > 1.0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DC14588, v26);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DC14528, *MEMORY[0x24BE12090]);
  }
  else
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DC14570, v26);
    v39 = *MEMORY[0x24BE12140];
    *(float *)&v27 = a5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE12090]);

  }
  if (!CMPhotoCompressionSessionAddImage()
    || (objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v15, 0),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v30, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE12088]),
        v31 = CMPhotoCompressionSessionAddImage(),
        v30,
        !v31))
  {
    if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking())
    {
      v32 = theBuffer;
      DataLength = CMBlockBufferGetDataLength(theBuffer);
      v34 = malloc_type_malloc(DataLength, 0xD1CBE15uLL);
      CMBlockBufferCopyDataBytes(v32, 0, DataLength, v34);
      CFRelease(v32);
      objc_msgSend(v9, "appendBytes:length:", v34, DataLength);
      free(v34);
    }
  }
LABEL_5:
  CMPhotoCompressionSessionDiscardCaches();
  CMPhotoCompressionSessionReleaseHardwareResources();
  CMPhotoCompressionSessionInvalidate();
  if (cf)
    CFRelease(cf);

  __HMISignpostScopeLeave(&v38);
  return v9;
}

+ (__CVBuffer)createPixelBufferFromJPEGDataProvider:(CGDataProvider *)a3 error:(id *)a4
{
  CGImage *v6;
  CGImage *v7;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *ColorSpace;
  CGColorSpace *v11;
  double v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v17;
  CGContext *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGRect v26;

  if (!a3 || (v6 = CGImageCreateWithJPEGDataProvider(a3, 0, 0, kCGRenderingIntentDefault)) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1000);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    HMIErrorLogC(v20);

    v18 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  Width = CGImageGetWidth(v6);
  Height = CGImageGetHeight(v7);
  ColorSpace = CGImageGetColorSpace(v7);
  v11 = CGColorSpaceRetain(ColorSpace);
  v12 = (double)Width;
  v13 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 0, (double)Width, (double)Height);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1000);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a4)
      *a4 = objc_retainAutorelease(v22);
    HMIErrorLogC(v23);

    v18 = 0;
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = v13;
  CVPixelBufferLockBaseAddress(v13, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v14);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  v17 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, v11, 0x2002u);
  if (v17)
  {
    v18 = v17;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = v12;
    v26.size.height = (double)Height;
    CGContextDrawImage(v17, v26, v7);
    CVPixelBufferUnlockBaseAddress(v14, 0);
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(v14, 0);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1000);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4)
      *a4 = objc_retainAutorelease(v24);
    HMIErrorLogC(v25);

    v18 = 0;
  }
LABEL_10:
  CGColorSpaceRelease(v11);
  CGContextRelease(v18);
  CGImageRelease(v7);
  return v14;
}

+ (__CVBuffer)createPixelBufferFromJPEGPath:(id)a3 error:(id *)a4
{
  CGDataProvider *v6;
  __CVBuffer *v7;
  void *v8;
  void *v9;

  v6 = CGDataProviderCreateWithFilename((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v6)
  {
    v7 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferFromJPEGDataProvider:error:", v6, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    HMIErrorLogC(v9);

    v7 = 0;
  }
  CGDataProviderRelease(v6);
  return v7;
}

+ (__CVBuffer)createPixelBufferFromJPEGData:(id)a3 error:(id *)a4
{
  CGDataProvider *v6;
  __CVBuffer *v7;
  void *v8;
  void *v9;

  v6 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  if (v6)
  {
    v7 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferFromJPEGDataProvider:error:", v6, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    HMIErrorLogC(v9);

    v7 = 0;
  }
  CGDataProviderRelease(v6);
  return v7;
}

+ (__CVBuffer)createPixelBufferFromImageData:(id)a3 error:(id *)a4
{
  void *v5;
  double v6;
  double v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithData:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extent");
  v8 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 0, v6, v7);
  v9 = v8;
  if (v8)
  {
    CVPixelBufferLockBaseAddress(v8, 0);
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "render:toCVPixelBuffer:", v5, v9);
    CVPixelBufferUnlockBaseAddress(v9, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1001);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    HMIErrorLogC(v10);
  }

  return v9;
}

+ (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormat:(unsigned int)a4 useIOSurface:(BOOL)a5
{
  double height;
  double width;
  const __CFDictionary *v8;
  __CVBuffer *v9;
  CVPixelBufferRef v11;
  uint64_t v12;
  _QWORD v13[2];

  height = a3.height;
  width = a3.width;
  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v12 = *MEMORY[0x24BDC5668];
    v13[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v11 = 0;
  if (CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, a4, v8, &v11))
    v9 = 0;
  else
    v9 = v11;

  return v9;
}

+ (CGRect)applyPadding:(CGRect)a3 withOriginalSize:(CGSize)a4 padding:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat y;
  CGFloat x;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  int v23;
  int v24;
  CGFloat v25;
  int v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, a4.width, a4.height);
  v30 = v31;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = v10;
  v32.size.height = v9;
  v33 = CGRectApplyAffineTransform(v32, &v30);
  v13 = (int)v33.origin.y;
  v14 = (int)v33.origin.x;
  v15 = (int)v33.origin.x + (int)v33.size.width;
  v16 = (int)v33.origin.y + (int)v33.size.height;
  v17 = (int)width / 2;
  if (v17 >= (int)v33.origin.x)
    v17 = (int)v33.origin.x;
  v18 = (int)height / 2;
  if (v18 >= v13)
    v18 = (int)v33.origin.y;
  v19 = width + (double)v15 - (double)v17;
  if (v8 < v19)
    v19 = v8;
  v20 = (int)v19;
  if (v7 >= height + (double)v16 - (double)v18)
    v21 = height + (double)v16 - (double)v18;
  else
    v21 = v7;
  v22 = (int)(width - (double)(v20 - v15));
  v23 = (int)(height - (double)((int)v21 - v16));
  if (v17 > v22)
    v22 = v17;
  if (v18 > v23)
    v23 = v18;
  v24 = (v14 - v22) & ~((v14 - v22) >> 31);
  v25 = (double)v24;
  v26 = (v13 - v23) & ~((v13 - v23) >> 31);
  v27 = (double)v26;
  v28 = (double)(v20 - v24);
  v29 = (double)((int)v21 - v26);
  CGAffineTransformMakeScale(&v30, 1.0 / v8, 1.0 / v7);
  v31 = v30;
  v34.origin.x = v25;
  v34.origin.y = v27;
  v34.size.width = v28;
  v34.size.height = v29;
  return CGRectApplyAffineTransform(v34, &v30);
}

+ (CGRect)imposeMinSizeFor:(CGRect)a3 withOriginalSize:(CGSize)a4 minCrop:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double y;
  double x;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, a4.width, a4.height);
  v25 = v26;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = v10;
  v27.size.height = v9;
  v28 = CGRectApplyAffineTransform(v27, &v25);
  v14 = (int)v28.size.height;
  if (width <= (double)(int)v28.size.width)
    v15 = *MEMORY[0x24BDBF148];
  else
    v15 = width - (double)(int)v28.size.width;
  if (height <= (double)v14)
    v16 = *(double *)(MEMORY[0x24BDBF148] + 8);
  else
    v16 = height - (double)v14;
  if (v16 >= 0.0 || v15 >= 0.0)
  {
    objc_msgSend(a1, "applyPadding:withOriginalSize:padding:", x, y, v10, v9, v8, v7, v15);
    x = v17;
    y = v18;
    v10 = v19;
    v9 = v20;
  }
  v21 = x;
  v22 = y;
  v23 = v10;
  v24 = v9;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)maintainAspectRatio:(CGRect)a3 originalSize:(CGSize)a4 ratioThreshold:(float)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, a4.width, a4.height);
  v27 = v28;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = v9;
  v29.size.height = v8;
  v30 = CGRectApplyAffineTransform(v29, &v27);
  v13 = v30.size.width;
  v14 = v30.size.height;
  if (v13 <= v14)
  {
    v18 = v14 / v13;
    if (v18 > a5)
    {
      v17 = (float)((float)((float)(v18 / a5) + -1.0) * v13);
      v16 = 0.0;
      goto LABEL_6;
    }
  }
  else
  {
    v15 = v13 / v14;
    if (v15 > a5)
    {
      v16 = (float)((float)((float)(v15 / a5) + -1.0) * v14);
      v17 = 0.0;
LABEL_6:
      objc_msgSend(a1, "applyPadding:withOriginalSize:padding:", x, y, v9, v8, width, height, v17, v16);
      x = v19;
      y = v20;
      v9 = v21;
      v8 = v22;
    }
  }
  v23 = x;
  v24 = y;
  v25 = v9;
  v26 = v8;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 rotationAngle:(float)a4 crop:(CGRect)a5 size:(CGSize)a6 precision:(unint64_t)a7 error:(id *)a8
{
  double height;
  double width;
  CGFloat v12;
  CGFloat v13;
  CGFloat y;
  CGFloat x;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CVBuffer *v24;
  uint64_t v26;
  CGFloat v27;
  CGFloat MidY;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  _QWORD v46[4];
  _QWORD v47[4];
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a6.height;
  width = a6.width;
  v12 = a5.size.height;
  v13 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (CGRectIsNull(a5))
    goto LABEL_4;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = v13;
  v48.size.height = v12;
  if (CGRectIsInfinite(v48)
    || (v49.origin.x = x, v49.origin.y = y, v49.size.width = v13, v49.size.height = v12, CGRectIsEmpty(v49)))
  {
LABEL_4:
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = CFSTR("Invalid crop for affine transform");
LABEL_5:
    objc_msgSend(v19, "stringWithFormat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a8)
      *a8 = objc_retainAutorelease(v22);
    HMIErrorLogC(v23);

    return 0;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = CFSTR("Error in pixelbuffer format for affine transform");
    goto LABEL_5;
  }
  v26 = objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 1, width, height);
  if (!v26)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = CFSTR("Error generating pixelbuffer for affine transform");
    goto LABEL_5;
  }
  v24 = (__CVBuffer *)v26;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v24, 0);
  v47[0] = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v47[1] = CVPixelBufferGetHeight(a3);
  v47[2] = CVPixelBufferGetWidth(a3);
  v47[3] = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v46[0] = CVPixelBufferGetBaseAddressOfPlane(v24, 0);
  v46[1] = CVPixelBufferGetHeight(v24);
  v46[2] = CVPixelBufferGetWidth(v24);
  v46[3] = CVPixelBufferGetBytesPerRowOfPlane(v24, 0);
  v36 = (float)CVPixelBufferGetHeight(a3);
  memset(&v45, 0, sizeof(v45));
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = v13;
  v50.size.height = v12;
  v27 = -CGRectGetMidX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = v13;
  v51.size.height = v12;
  MidY = CGRectGetMidY(v51);
  CGAffineTransformMakeTranslation(&v45, v27, MidY - v36);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeRotation(&v44, a4);
  memset(&v43, 0, sizeof(v43));
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = v13;
  v52.size.height = v12;
  v29 = width / CGRectGetWidth(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = v13;
  v53.size.height = v12;
  v30 = CGRectGetHeight(v53);
  CGAffineTransformMakeScale(&v43, v29, height / v30);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeTranslation(&v42, width * 0.5, height * 0.5);
  memset(&v41, 0, sizeof(v41));
  t1 = v43;
  t2 = v42;
  CGAffineTransformConcat(&v39, &t1, &t2);
  t1 = v44;
  CGAffineTransformConcat(&v40, &t1, &v39);
  t1 = v45;
  CGAffineTransformConcat(&v41, &t1, &v40);
  LODWORD(t1.a) = 0;
  if (a7 == 1)
    v31 = 36;
  else
    v31 = 4;
  v32 = MEMORY[0x220735A20](v47, v46, 0, &v41, &t1, v31);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v24, 0);
  if (v32)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error applying affine transform"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a8)
      *a8 = objc_retainAutorelease(v34);
    HMIErrorLogC(v35);

    CVPixelBufferRelease(v24);
    return 0;
  }
  return v24;
}

+ (void)releaseCachedVisionResources
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF9CE8], "globalSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseCachedResources");

}

@end
