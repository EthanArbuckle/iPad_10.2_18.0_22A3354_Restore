@implementation BSUIMappedSurfaceImage

+ (BOOL)writeSurfaceImage:(int)a3 toFileDescriptor:
{
  id v4;
  __IOSurface *v5;
  __IOSurface *v6;
  void *BaseAddress;
  _BOOL4 v8;
  size_t AllocSize;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFData *Data;
  const __CFData *v13;
  const UInt8 *BytePtr;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL8 v17;
  size_t Width;
  size_t Height;
  size_t v20;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerElementOfPlane;
  size_t BytesPerRowOfPlane;
  void *BaseAddressOfPlane;
  unint64_t v26;
  ssize_t v27;
  unint64_t v28;
  unint64_t v29;
  ssize_t v30;
  ssize_t v31;
  uint64_t v32;
  off_t v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  size_t v39;
  unint64_t Length;
  uint64_t v41;
  size_t PlaneCount;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  unint64_t v46;
  int v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v43 = v4;
  objc_opt_self();
  v5 = (__IOSurface *)objc_msgSend(v4, "ioSurface");
  v6 = v5;
  if (v5)
  {
    IOSurfaceLock(v5, 1u, 0);
    PlaneCount = IOSurfaceGetPlaneCount(v6);
    BaseAddress = IOSurfaceGetBaseAddress(v6);
    v8 = 0;
    if (BaseAddress)
    {
      v41 = (uint64_t)BaseAddress;
      if (!HIDWORD(PlaneCount))
      {
        AllocSize = IOSurfaceGetAllocSize(v6);
        if (__writeDataToFileDescriptor(a3, v41, AllocSize))
        {
          v10 = IOSurfaceCopyAllValues(v6);
          v11 = v10;
          if (!v10)
          {
            Length = 0;
            goto LABEL_18;
          }
          if (CFDictionaryGetCount(v10) >= 1
            && (Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, kCFPropertyListBinaryFormat_v1_0, 0, 0), (v13 = Data) != 0))
          {
            Length = CFDataGetLength(Data);
            if (HIDWORD(Length))
            {
              v15 = 0;
            }
            else
            {
              BytePtr = CFDataGetBytePtr(v13);
              v15 = __writeDataToFileDescriptor(a3, (uint64_t)BytePtr, Length);
            }
            CFRelease(v13);
          }
          else
          {
            Length = 0;
            v15 = 1;
          }
          CFRelease(v11);
          if (v15)
          {
LABEL_18:
            Width = IOSurfaceGetWidth(v6);
            v39 = AllocSize;
            if (Width != IOSurfaceGetWidthOfPlane(v6, 0))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("BSUIMappedSurfaceImage.m"), 99, CFSTR("width of surface not the same as width of first plane"));

            }
            Height = IOSurfaceGetHeight(v6);
            if (Height != IOSurfaceGetHeightOfPlane(v6, 0))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("BSUIMappedSurfaceImage.m"), 100, CFSTR("height of surface not the same as height of first plane"));

            }
            v20 = 0;
            while (1)
            {
              WidthOfPlane = IOSurfaceGetWidthOfPlane(v6, v20);
              HeightOfPlane = IOSurfaceGetHeightOfPlane(v6, v20);
              BytesPerElementOfPlane = IOSurfaceGetBytesPerElementOfPlane(v6, v20);
              BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v6, v20);
              BaseAddressOfPlane = IOSurfaceGetBaseAddressOfPlane(v6, v20);
              v8 = 0;
              if (HIDWORD(WidthOfPlane)
                || HIDWORD(HeightOfPlane)
                || HIDWORD(BytesPerElementOfPlane)
                || HIDWORD(BytesPerRowOfPlane)
                || ((unint64_t)BaseAddressOfPlane - v41) >> 32)
              {
                goto LABEL_46;
              }
              v26 = 0;
              *(_DWORD *)buf = WidthOfPlane;
              v45 = (const char *)__PAIR64__(BytesPerElementOfPlane, HeightOfPlane);
              LODWORD(v46) = BytesPerRowOfPlane;
              HIDWORD(v46) = (_DWORD)BaseAddressOfPlane - v41;
              do
              {
                v27 = write(a3, &buf[v26], 20 - v26);
                if (v27 < 0)
                  break;
                v26 += v27 & ~(v27 >> 63);
              }
              while (v26 <= 0x13);
              if ((v27 & 0x8000000000000000) == 0 && ++v20 < PlaneCount)
                continue;
              if ((v27 & 0x8000000000000000) == 0)
              {
                *(_DWORD *)buf = IOSurfaceGetPixelFormat(v6);
                v45 = (const char *)__PAIR64__(Length, PlaneCount);
                objc_msgSend(v43, "scale");
                v46 = bswap64(v28);
                v29 = 0;
                v47 = objc_msgSend(v43, "imageOrientation");
                v48 = -1413377484;
                do
                {
                  v30 = write(a3, &buf[v29], 28 - v29);
                  v31 = v30;
                  if (v30 < 0)
                    break;
                  v29 += v30 & ~(v30 >> 63);
                }
                while (v29 <= 0x1B);
                if ((v30 & 0x8000000000000000) == 0)
                {
                  if (PlaneCount <= 1)
                    v32 = 1;
                  else
                    v32 = PlaneCount;
                  v33 = lseek(a3, 0, 2);
                  if (v33 == 0x7FFFFFFFFFFFFFFFLL)
                    __assert_rtn("+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]", "BSUIMappedSurfaceImage.m", 140, "end < LONG_MAX");
                  v8 = v33 == v39 + 20 * v32 + Length + 28 && v31 >= 0;
                  goto LABEL_46;
                }
              }
              break;
            }
          }
        }
        v8 = 0;
      }
    }
LABEL_46:
    IOSurfaceUnlock(v6, 1u, 0);
    v17 = v8;
    v4 = v43;
    goto LABEL_47;
  }
  BSLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]";
    _os_log_error_impl(&dword_1A0234000, v16, OS_LOG_TYPE_ERROR, " %s : can not persist image that is not backed by an IOSurface", buf, 0xCu);
  }

  v17 = 0;
LABEL_47:

  return v17;
}

+ (id)mappedSurfaceImageFromPath:(int)a3 loadEagerly:
{
  id v4;
  objc_class *v5;
  const __CFData *MappedDataFromPath;
  const __CFData *v7;
  UInt8 *BytePtr;
  size_t Length;
  UInt8 *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  size_t v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  NSObject *v21;
  const __CFDictionary *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFDictionary *v30;
  IOSurfaceRef v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  size_t v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[6];
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _QWORD v58[2];
  _QWORD v59[6];
  _QWORD v60[6];
  _QWORD v61[8];
  _QWORD v62[10];

  v62[8] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (objc_class *)objc_opt_self();
  MappedDataFromPath = (const __CFData *)CPBitmapCreateMappedDataFromPath();
  v7 = MappedDataFromPath;
  if (MappedDataFromPath)
  {
    BytePtr = (UInt8 *)CFDataGetBytePtr(MappedDataFromPath);
    Length = CFDataGetLength(v7);
    if (a3)
      madvise(BytePtr, Length, 3);
    if (!BytePtr || Length < 0x30)
    {
      BSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        _os_log_error_impl(&dword_1A0234000, v15, OS_LOG_TYPE_ERROR, " %s : file too small to describe a surface", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v10 = &BytePtr[Length];
    if (*(_DWORD *)&BytePtr[Length - 4] != -1413377484)
    {
      BSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        _os_log_error_impl(&dword_1A0234000, v15, OS_LOG_TYPE_ERROR, " %s : format of file not recognized", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v12 = *((unsigned int *)v10 - 6);
    v11 = *((unsigned int *)v10 - 5);
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = *((_DWORD *)v10 - 6);
    v14 = 20 * v13 + 28;
    if (Length < v14 + v11)
    {
      BSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        v57 = 1024;
        LODWORD(v58[0]) = v12;
        _os_log_error_impl(&dword_1A0234000, v15, OS_LOG_TYPE_ERROR, " %s : file too small to describe a surface with %u planes", buf, 0x12u);
      }
LABEL_20:

      v16 = 0;
LABEL_21:
      CFRelease(v7);
      goto LABEL_22;
    }
    v47 = *((_DWORD *)v10 - 7);
    v45 = *((_QWORD *)v10 - 2);
    v46 = *((unsigned int *)v10 - 2);
    v18 = Length - v14;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke;
    v51[3] = &__block_descriptor_48_e40_v20__0___BSUISurfacePlaneInfo_IIIII_8I16l;
    v51[4] = BytePtr;
    v51[5] = v18;
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AF63A8](v51);
    ((void (**)(_QWORD, uint64_t *, _QWORD))v20)[2](v20, &v52, 0);
    if (v18 - v11 < (HIDWORD(v52) * HIDWORD(v53)))
    {
      BSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        v57 = 1024;
        LODWORD(v58[0]) = HIDWORD(v53);
        WORD2(v58[0]) = 1024;
        *(_DWORD *)((char *)v58 + 6) = HIDWORD(v52);
        _os_log_error_impl(&dword_1A0234000, v21, OS_LOG_TYPE_ERROR, " %s : file too small to describe surface with bytesPerRow=%u and height=%u", buf, 0x18u);
      }

      goto LABEL_46;
    }
    if ((_DWORD)v12)
    {
      v40 = HIDWORD(v52);
      v41 = v52;
      v50[0] = v19;
      v50[1] = 3221225472;
      v50[2] = __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke_11;
      v50[3] = &__block_descriptor_40_e51___NSDictionary_16__0___BSUISurfacePlaneInfo_IIIII_8l;
      v43 = v18 - v11;
      v50[4] = v18 - v11;
      v22 = (const __CFDictionary *)MEMORY[0x1A1AF63A8](v50);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
      (*((void (**)(const __CFDictionary *, uint64_t *))v22 + 2))(v22, &v52);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bs_safeAddObject:](v23, "bs_safeAddObject:", v24);

      if (v12 >= 2)
      {
        v25 = 1;
        do
        {
          ((void (**)(_QWORD, uint64_t *, uint64_t))v20)[2](v20, &v52, v25);
          (*((void (**)(const __CFDictionary *, uint64_t *))v22 + 2))(v22, &v52);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject bs_safeAddObject:](v23, "bs_safeAddObject:", v26);

          v25 = (v25 + 1);
        }
        while ((_DWORD)v12 != (_DWORD)v25);
      }
      if (-[NSObject count](v23, "count") == v12)
      {
        v59[0] = *MEMORY[0x1E0CBC070];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
        v60[0] = objc_claimAutoreleasedReturnValue();
        v59[1] = *MEMORY[0x1E0CBBF68];
        v48 = (void *)v60[0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", BytePtr);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v39;
        v59[2] = *MEMORY[0x1E0CBBEE0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v60[2] = v27;
        v59[3] = *MEMORY[0x1E0CBC1E0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v41);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v60[3] = v28;
        v59[4] = *MEMORY[0x1E0CBC008];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v40);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v59[5] = *MEMORY[0x1E0CBC158];
        v60[4] = v29;
        v60[5] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 6);
        v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        v31 = IOSurfaceCreate(v30);
        if (!v31)
        {
          BSLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
            v57 = 2114;
            v58[0] = v30;
            _os_log_error_impl(&dword_1A0234000, v32, OS_LOG_TYPE_ERROR, " %s : failed to create surface with properties -> %{public}@", buf, 0x16u);
          }

        }
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v61[0] = *MEMORY[0x1E0CBC070];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v42;
      v61[1] = *MEMORY[0x1E0CBBF68];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", BytePtr);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v49;
      v61[2] = *MEMORY[0x1E0CBBEE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v18 - v11);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v62[2] = v44;
      v61[3] = *MEMORY[0x1E0CBC058];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v54);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v62[3] = v33;
      v61[4] = *MEMORY[0x1E0CBC1E0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v52);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v62[4] = v34;
      v61[5] = *MEMORY[0x1E0CBC008];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v52));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v62[5] = v35;
      v61[6] = *MEMORY[0x1E0CBBF00];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v62[6] = v36;
      v61[7] = *MEMORY[0x1E0CBBF08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v53));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v62[7] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 8);
      v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v31 = IOSurfaceCreate(v22);
      if (v31)
        goto LABEL_42;
      BSLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        v57 = 2114;
        v58[0] = v22;
        _os_log_error_impl(&dword_1A0234000, v23, OS_LOG_TYPE_ERROR, " %s : failed to create surface with properties -> %{public}@", buf, 0x16u);
      }
    }

LABEL_42:
    if (v31)
    {
      v38 = objc_msgSend([v5 alloc], "_initWithIOSurface:scale:orientation:", v31, v46, COERCE_DOUBLE(bswap64(v45)));
      v16 = (void *)v38;
      if (v38)
        objc_storeStrong((id *)(v38 + 144), v7);
      CFRelease(v31);
      goto LABEL_47;
    }
LABEL_46:
    v16 = 0;
LABEL_47:

    goto LABEL_21;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

__n128 __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke(uint64_t a1, __n128 *a2, unsigned int a3)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*(_QWORD *)(a1 + 32) + *(_QWORD *)(a1 + 40) + 20 * a3);
  result = *v3;
  a2[1].n128_u32[0] = v3[1].n128_u32[0];
  *a2 = result;
  return result;
}

id __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke_11(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v3 = a2[1] * a2[3];
  if (*(_QWORD *)(a1 + 32) >= (unint64_t)a2[4] + v3)
  {
    v23[0] = *MEMORY[0x1E0CBC178];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v23[1] = *MEMORY[0x1E0CBC140];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v6;
    v23[2] = *MEMORY[0x1E0CBC090];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2[2]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v7;
    v23[3] = *MEMORY[0x1E0CBC098];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v8;
    v23[4] = *MEMORY[0x1E0CBC160];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v9;
    v23[5] = *MEMORY[0x1E0CBC168];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    BSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v13 = a2[3];
      v12 = a2[4];
      v14 = a2[1];
      v15 = 136315906;
      v16 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]_block_invoke";
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      _os_log_error_impl(&dword_1A0234000, v4, OS_LOG_TYPE_ERROR, " %s : file too small to describe plane with offset=%u bytesPerRow=%u and height=%u", (uint8_t *)&v15, 0x1Eu);
    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedSurfaceData, 0);
}

@end
