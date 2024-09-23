@implementation VNCVPixelBufferConversionHelpers

+ (id)dictionaryRepresentationClassesSet
{
  if (+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::onceToken != -1)
    dispatch_once(&+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::onceToken, &__block_literal_global_16084);
  return (id)+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::classesSet;
}

+ (id)createDictionaryRepresentationOfCVPixelBuffer:(__CVBuffer *)a3
{
  id v4;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  void *v8;
  void *v9;
  void *v10;
  size_t PlaneCount;
  size_t v12;
  int HeightOfPlane;
  size_t BytesPerRowOfPlane;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  size_t BytesPerRow;
  void *v20;
  void *v21;
  CFDictionaryRef v23;
  void *v24;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferGetAttributes();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("vnpbo_width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("vnpbo_height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PixelFormatType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("vnpbo_pixelFormat"));

  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("vnpbo_attribs"));
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("vnpbo_attach"));
  if (CVPixelBufferIsPlanar(a3))
  {
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount)
    {
      v12 = 0;
      do
      {
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v12);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v12);
        CVPixelBufferLockBaseAddress(a3, 0);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", CVPixelBufferGetBaseAddressOfPlane(a3, v12), HeightOfPlane * (int)BytesPerRowOfPlane);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BytesPerRowOfPlane);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%zu"), CFSTR("vnpbo_bpr"), v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v16, v17);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%zu"), CFSTR("vnpbo_bytes"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v15, v18);

        CVPixelBufferUnlockBaseAddress(a3, 0);
        ++v12;
      }
      while (PlaneCount != v12);
    }
  }
  else
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferLockBaseAddress(a3, 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", CVPixelBufferGetBaseAddress(a3), (int)Height * (int)BytesPerRow);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BytesPerRow);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("vnpbo_bpr"));

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("vnpbo_bytes"));
    CVPixelBufferUnlockBaseAddress(a3, 0);

  }
  return v4;
}

+ (__CVBuffer)createCVPixelBufferRefFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  OSType v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  size_t v12;
  uint64_t v13;
  __CVBuffer *v14;
  size_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  size_t v20;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  id v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  size_t BytesPerRow;
  char *BaseAddress;
  id v32;
  char *v33;
  size_t v34;
  const __CFDictionary *v36;
  size_t PlaneCount;
  id v38;
  CVBufferRef buffer;

  v3 = a3;
  v38 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_width"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_pixelFormat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_attribs"));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_attach"));
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  v13 = v7;
  buffer = 0;
  if (VNCVPixelBufferCreateUsingIOSurface(v12, v7, v9, v10, &buffer))
  {
    v14 = 0;
  }
  else
  {
    if (v11)
      CVBufferSetAttachments(buffer, v11, kCVAttachmentMode_ShouldNotPropagate);
    v36 = v11;
    if (CVPixelBufferIsPlanar(buffer))
    {
      PlaneCount = CVPixelBufferGetPlaneCount(buffer);
      CVPixelBufferLockBaseAddress(buffer, 0);
      if (PlaneCount)
      {
        for (i = 0; i != PlaneCount; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%zu"), CFSTR("vnpbo_bytes"), i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%zu"), CFSTR("vnpbo_bpr"), i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = objc_msgSend(v19, "intValue");

          HeightOfPlane = CVPixelBufferGetHeightOfPlane(buffer, i);
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(buffer, i);
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(buffer, i);
          v24 = objc_retainAutorelease(v17);
          v25 = (char *)objc_msgSend(v24, "bytes");
          v26 = (int)v20;
          if (BytesPerRowOfPlane == (int)v20)
          {
            memcpy(BaseAddressOfPlane, v25, HeightOfPlane * (int)v20);
          }
          else
          {
            if ((int)v20 >= BytesPerRowOfPlane)
              v20 = BytesPerRowOfPlane;
            else
              v20 = (int)v20;
            for (; HeightOfPlane; --HeightOfPlane)
            {
              memcpy(BaseAddressOfPlane, v25, v20);
              v25 += v26;
              BaseAddressOfPlane += BytesPerRowOfPlane;
            }
          }

          v3 = v38;
        }
      }
      CVPixelBufferUnlockBaseAddress(buffer, 0);
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_bytes"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("vnpbo_bpr"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "intValue");

      CVPixelBufferLockBaseAddress(buffer, 0);
      BytesPerRow = CVPixelBufferGetBytesPerRow(buffer);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(buffer);
      v32 = objc_retainAutorelease(v27);
      v33 = (char *)objc_msgSend(v32, "bytes");
      if (BytesPerRow == v29)
      {
        memcpy(BaseAddress, v33, v29 * (uint64_t)v7);
      }
      else
      {
        if (v29 >= BytesPerRow)
          v34 = BytesPerRow;
        else
          v34 = v29;
        if (v7)
        {
          do
          {
            memcpy(BaseAddress, v33, v34);
            v33 += v29;
            BaseAddress += BytesPerRow;
            --v13;
          }
          while (v13);
        }
      }
      CVPixelBufferUnlockBaseAddress(buffer, 0);

      v3 = v38;
    }
    v14 = buffer;
    v11 = v36;
  }

  return v14;
}

+ (BOOL)isCVPixelBuffer:(__CVBuffer *)a3 equalToCVPixelBuffer:(__CVBuffer *)a4
{
  int Height;
  int v7;
  OSType PixelFormatType;
  int IsPlanar;
  int PlaneCount;
  size_t v11;
  char v12;
  int BytesPerRowOfPlane;
  int v14;
  int HeightOfPlane;
  int WidthOfPlane;
  char *BaseAddressOfPlane;
  char *v18;
  char *v19;
  size_t v20;
  BOOL v21;
  int BytesPerRow;
  int v24;
  int v25;
  int Width;
  char *BaseAddress;
  char *v28;
  char *v29;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  CFDictionaryRef v36;
  CFDictionaryRef v37;
  void *v38;
  void *v39;

  if ((!a3 || a4) && (a3 || !a4))
  {
    if (a4 == a3)
      return 1;
    Height = CVPixelBufferGetHeight(a3);
    if (Height == CVPixelBufferGetHeight(a4))
    {
      v7 = CVPixelBufferGetHeight(a3);
      if (v7 == CVPixelBufferGetHeight(a4))
      {
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        if (PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
        {
          IsPlanar = CVPixelBufferIsPlanar(a3);
          if (IsPlanar == CVPixelBufferIsPlanar(a4))
          {
            CVPixelBufferGetAttributes();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            CVPixelBufferGetAttributes();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v39, "isEqual:") & 1) == 0)
            {
              v21 = 0;
LABEL_46:

              return v21;
            }
            v37 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
            v36 = CVBufferCopyAttachments(a4, kCVAttachmentMode_ShouldNotPropagate);
            if ((-[__CFDictionary isEqual:](v37, "isEqual:") & 1) != 0)
            {
              if (IsPlanar)
              {
                PlaneCount = CVPixelBufferGetPlaneCount(a3);
                if (PlaneCount == CVPixelBufferGetPlaneCount(a4))
                {
                  if (PlaneCount < 1)
                  {
                    v12 = 1;
LABEL_48:
                    v21 = v12 & 1;
                    goto LABEL_45;
                  }
                  v11 = 0;
                  v35 = PlaneCount;
                  v12 = 1;
                  while (1)
                  {
                    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v11);
                    v14 = CVPixelBufferGetBytesPerRowOfPlane(a4, v11);
                    if (BytesPerRowOfPlane != v14)
                      break;
                    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v11);
                    if (HeightOfPlane != CVPixelBufferGetHeightOfPlane(a4, v11))
                      break;
                    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v11);
                    if (WidthOfPlane != CVPixelBufferGetWidthOfPlane(a4, v11))
                      break;
                    if (WidthOfPlane && HeightOfPlane)
                    {
                      CVPixelBufferLockBaseAddress(a3, 0);
                      CVPixelBufferLockBaseAddress(a4, 0);
                      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v11);
                      v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v11);
                      if (HeightOfPlane >= 1)
                      {
                        v19 = v18;
                        v20 = (BytesPerRowOfPlane / WidthOfPlane * WidthOfPlane);
                        do
                        {
                          if (memcmp(BaseAddressOfPlane, v19, v20))
                            v12 = 0;
                          v19 += v14;
                          BaseAddressOfPlane += BytesPerRowOfPlane;
                          --HeightOfPlane;
                        }
                        while (HeightOfPlane);
                      }
                      CVPixelBufferUnlockBaseAddress(a3, 0);
                      CVPixelBufferUnlockBaseAddress(a4, 0);
                    }
                    if (++v11 == v35)
                      goto LABEL_48;
                  }
                }
              }
              else
              {
                BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
                v24 = CVPixelBufferGetBytesPerRow(a4);
                if (BytesPerRow == v24)
                {
                  v25 = CVPixelBufferGetHeight(a3);
                  if (v25 == CVPixelBufferGetHeight(a4))
                  {
                    Width = CVPixelBufferGetWidth(a3);
                    if (Width == CVPixelBufferGetWidth(a4))
                    {
                      v21 = 1;
                      if (Width && v25)
                      {
                        CVPixelBufferLockBaseAddress(a3, 0);
                        CVPixelBufferLockBaseAddress(a4, 0);
                        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
                        v28 = (char *)CVPixelBufferGetBaseAddress(a4);
                        if (v25 < 1)
                        {
                          v34 = 1;
                        }
                        else
                        {
                          v29 = v28;
                          v30 = (BytesPerRow / Width * Width);
                          v31 = v24;
                          v32 = BytesPerRow;
                          v33 = 1;
                          do
                          {
                            if (memcmp(BaseAddress, v29, v30))
                              v33 = 0;
                            v29 += v31;
                            BaseAddress += v32;
                            --v25;
                          }
                          while (v25);
                          v34 = v33 & 1;
                        }
                        CVPixelBufferUnlockBaseAddress(a3, 0);
                        CVPixelBufferUnlockBaseAddress(a4, 0);
                        v21 = v34 != 0;
                      }
                      goto LABEL_45;
                    }
                  }
                }
              }
            }
            v21 = 0;
LABEL_45:

            goto LABEL_46;
          }
        }
      }
    }
  }
  return 0;
}

+ (unint64_t)computeHashForCVPixelBuffer:(__CVBuffer *)a3
{
  int IsPlanar;
  unsigned int Width;
  unsigned int Height;
  OSType PixelFormatType;
  uint64_t v8;
  CFDictionaryRef v9;
  uint64_t v10;
  int PlaneCount;
  uint64_t v12;
  unint64_t v13;
  size_t v14;
  int BytesPerRowOfPlane;
  int HeightOfPlane;
  void *BaseAddressOfPlane;
  int BytesPerRow;
  int v19;
  void *BaseAddress;

  IsPlanar = CVPixelBufferIsPlanar(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = objc_msgSend((id)CVPixelBufferGetAttributes(), "hash");
  v9 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
  v10 = -[__CFDictionary hash](v9, "hash") ^ __ROR8__(v8 ^ __ROR8__(((unint64_t)Width << 26) ^ ((unint64_t)Height << 13) ^ PixelFormatType, 51), 51);

  if (IsPlanar)
  {
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    v12 = PlaneCount;
    v13 = PlaneCount ^ __ROR8__(v10, 51);
    CVPixelBufferLockBaseAddress(a3, 0);
    if (PlaneCount >= 1)
    {
      v14 = 0;
      do
      {
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v14);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v14);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, v14);
        v13 = VNHashMemory((uint64_t)BaseAddressOfPlane, BytesPerRowOfPlane * HeightOfPlane) ^ __ROR8__(v13, 51);
        ++v14;
      }
      while (v12 != v14);
    }
  }
  else
  {
    CVPixelBufferLockBaseAddress(a3, 0);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v19 = CVPixelBufferGetHeight(a3);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    v13 = VNHashMemory((uint64_t)BaseAddress, BytesPerRow * v19) ^ __ROR8__(v10, 51);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v13;
}

void __70__VNCVPixelBufferConversionHelpers_dictionaryRepresentationClassesSet__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v5 = (void *)+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::classesSet;
  +[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::classesSet = v4;

}

@end
