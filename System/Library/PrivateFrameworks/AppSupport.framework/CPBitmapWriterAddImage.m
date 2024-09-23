@implementation CPBitmapWriterAddImage

void __CPBitmapWriterAddImage_block_invoke(uint64_t a1)
{
  CGImage *v2;
  uint64_t v3;
  CFErrorRef *v4;
  char *v5;
  CFIndex v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  CFErrorRef *v12;
  size_t Width;
  size_t Height;
  _QWORD *v15;
  uint64_t *v16;
  int v17;
  CGColorSpace *ColorSpace;
  CGColorSpaceRef v19;
  char v20;
  CFDataRef Data;
  size_t v22;
  size_t v23;
  void *v24;
  CGContextRef v25;
  CFErrorRef *v26;
  CFErrorRef *v27;
  size_t v28;
  size_t v29;
  int v30;
  const __CFString *v31;
  _DWORD *v32;
  CGDataConsumer *v33;
  CGImageDestinationRef v34;
  int v35;
  CGColorSpace *v36;
  CGColorSpaceRef v37;
  const __CFAllocator *v38;
  const CFDictionaryKeyCallBacks *v39;
  const CFDictionaryValueCallBacks *v40;
  CFIndex v41;
  const __CFString *v42;
  char *v43;
  CFErrorRef *v44;
  CFIndex v45;
  const __CFString *v46;
  char *v47;
  int v48;
  const __CFString *v49;
  char *v50;
  CFErrorRef *v51;
  CFIndex v52;
  CFPropertyListRef v53;
  const void *v54;
  int v55;
  const __CFAllocator *v56;
  CFNumberRef v57;
  void *v58;
  uint64_t v59;
  CFDictionaryRef v60;
  void *aBlock;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  size_t v71;
  char v72;
  int valuePtr;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  void *keys;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t *v104;
  char v105;
  void *values[5];

  values[3] = *(void **)MEMORY[0x1E0C80C00];
  v2 = *(CGImage **)(a1 + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(v3 + 64))
    {
      v4 = *(CFErrorRef **)(a1 + 48);
      if (v4)
      {
        v5 = "Writer already finalized";
        v6 = 9;
LABEL_7:
        __CPBitmapSetErrorIfNecessary(v4, CFSTR("CPBitmapErrorDomain"), v6, v5);
        return;
      }
      return;
    }
    if (*(_QWORD *)(v3 + 112) || (v10 = *(_DWORD *)(v3 + 28), v10 > 7))
    {
LABEL_9:
      v7 = *(_QWORD *)(a1 + 56);
      if (*(_QWORD *)(v7 + 112))
      {
        v8 = *(_QWORD *)(v7 + 96);
        if (v8 == CGImageGetWidth(*(CGImageRef *)(a1 + 40))
          && (v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 104), v9 == CGImageGetHeight(*(CGImageRef *)(a1 + 40))))
        {
          if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 112) + 16))())
          {
            ++*(_QWORD *)(*(_QWORD *)(a1 + 56) + 88);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          }
        }
        else
        {
          v26 = *(CFErrorRef **)(a1 + 48);
          if (v26)
            __CPBitmapSetErrorIfNecessary(v26, CFSTR("CPBitmapErrorDomain"), 2, "Mismatched image sizes");
        }
      }
      return;
    }
    v11 = (void *)MEMORY[0x1E0C809B0];
    if (((1 << v10) & 0x2F) != 0)
    {
      v12 = *(CFErrorRef **)(a1 + 48);
      v94 = 0;
      v95 = &v94;
      v96 = 0x2000000000;
      v97 = 0;
      keys = (void *)MEMORY[0x1E0C809B0];
      v90 = 0;
      v91 = &v90;
      v92 = 0x2000000000;
      v93 = 0;
      v86 = 0;
      v87 = &v86;
      v88 = 0x2000000000;
      v89 = 0;
      v99 = 0x40000000;
      v100 = ____CPCGBitmapContextBlockSetup_block_invoke;
      v101 = &unk_1E2881C78;
      v102 = &v86;
      v103 = &v90;
      v104 = &v94;
      Width = CGImageGetWidth(v2);
      Height = CGImageGetHeight(v2);
      v15 = malloc_type_malloc(0x38uLL, 0x10200401A3D0951uLL);
      v16 = v95;
      v95[3] = (uint64_t)v15;
      if (v15)
      {
        v15[6] = 0;
        *((_OWORD *)v15 + 1) = 0u;
        *((_OWORD *)v15 + 2) = 0u;
        *(_OWORD *)v15 = 0u;
        v17 = *(_DWORD *)(v3 + 32);
        if ((v17 & 1) != 0)
        {
          ColorSpace = CGImageGetColorSpace(v2);
          v19 = CGColorSpaceRetain(ColorSpace);
          *(_QWORD *)v95[3] = v19;
          v16 = v95;
        }
        if (__CPBitmapGetImageInfoForFormat(*(_DWORD *)(v3 + 28), Width, Height, v16[3], 1, 0))
        {
          v20 = v17 & 1;
          if ((v17 & 1) == 0 || (CGColorSpaceEqualToColorSpace() & 1) != 0)
          {
            Data = 0;
            goto LABEL_23;
          }
          v53 = CGColorSpaceCopyPropertyList(*(CGColorSpaceRef *)v95[3]);
          if (v53)
          {
            v54 = v53;
            Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v53, kCFPropertyListBinaryFormat_v1_0, 0, v12);
            CFRelease(v54);
            if (Data)
            {
LABEL_23:
              if (Height >= 0x100)
                v22 = 256;
              else
                v22 = Height;
              v23 = *(_QWORD *)(v95[3] + 32) * v22;
              v24 = malloc_type_malloc(v23, 0xF610C80AuLL);
              v91[3] = (uint64_t)v24;
              if (v24)
              {
                v25 = CGBitmapContextCreate(v24, Width, v22, *(_QWORD *)(v95[3] + 16), *(_QWORD *)(v95[3] + 32), *(CGColorSpaceRef *)v95[3], *(_DWORD *)(v95[3] + 48));
                v87[3] = (uint64_t)v25;
                if (v25)
                {
                  aBlock = v11;
                  v62 = 0x40000000;
                  v63 = ____CPCGBitmapContextBlockSetup_block_invoke_2;
                  v64 = &unk_1E2881CA0;
                  v72 = v20;
                  v69 = (uint64_t *)v22;
                  v70 = (uint64_t *)Width;
                  v65 = &v94;
                  v66 = &v90;
                  v71 = v23;
                  v67 = &v86;
                  v68 = (uint64_t *)Height;
                  *(_QWORD *)(v3 + 96) = Width;
                  *(_QWORD *)(v3 + 104) = Height;
                  *(_QWORD *)(v3 + 56) = Data;
                  *(_QWORD *)(v3 + 112) = _Block_copy(&aBlock);
                  *(_QWORD *)(v3 + 120) = _Block_copy(&keys);
                  _Block_object_dispose(&v86, 8);
                  _Block_object_dispose(&v90, 8);
                  _Block_object_dispose(&v94, 8);
                  goto LABEL_9;
                }
                if (!v12)
                  goto LABEL_62;
                v49 = CFSTR("CPBitmapErrorDomain");
                v50 = "Could not create bitmap context with desired arguments";
                v51 = v12;
                v52 = 3;
              }
              else
              {
                if (!v12)
                  goto LABEL_62;
                v49 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
                v50 = "Could not allocate bitmap buffer";
                v51 = v12;
                v52 = 12;
              }
              __CPBitmapSetErrorIfNecessary(v51, v49, v52, v50);
LABEL_62:
              if (Data)
                CFRelease(Data);
            }
LABEL_64:
            ((void (*)(void **, _QWORD, _QWORD))v100)(&keys, 0, 0);
            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(&v90, 8);
            _Block_object_dispose(&v94, 8);
            return;
          }
          if (!v12)
            goto LABEL_64;
          v42 = CFSTR("CPBitmapErrorDomain");
          v43 = "Failed to create colorSpace plist";
          v44 = v12;
          v45 = 8;
        }
        else
        {
          if (!v12)
            goto LABEL_64;
          v42 = CFSTR("CPBitmapErrorDomain");
          v43 = "Trying to serialize invalid bitmap format";
          v44 = v12;
          v45 = 3;
        }
      }
      else
      {
        if (!v12)
          goto LABEL_64;
        v42 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v43 = "Could not allocate bitmap info";
        v44 = v12;
        v45 = 12;
      }
      __CPBitmapSetErrorIfNecessary(v44, v42, v45, v43);
      goto LABEL_64;
    }
    v27 = *(CFErrorRef **)(a1 + 48);
    v94 = 0;
    v95 = &v94;
    v96 = 0x2000000000;
    v97 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2000000000;
    v93 = 0;
    v86 = 0;
    v87 = &v86;
    v88 = 0x2000000000;
    v89 = 0;
    v82 = 0;
    v83 = &v82;
    v84 = 0x2000000000;
    v85 = 0;
    v78 = 0;
    v79 = &v78;
    v80 = 0x2000000000;
    v81 = 0;
    v74 = 0;
    v75 = &v74;
    v76 = 0x2000000000;
    v77 = 0;
    aBlock = (void *)MEMORY[0x1E0C809B0];
    v62 = 0x40000000;
    v63 = ____CPCGDestinationKTXBlockSetup_block_invoke;
    v64 = &unk_1E2881CC8;
    v65 = &v74;
    v66 = &v78;
    v67 = &v82;
    v68 = &v86;
    v69 = &v94;
    v70 = &v90;
    v28 = CGImageGetWidth(v2);
    v29 = CGImageGetHeight(v2);
    v30 = *(_DWORD *)(v3 + 28);
    if ((v30 & 0xFFFFFFFE) == 6)
      v31 = CFSTR("com.apple.atx");
    else
      v31 = CFSTR("org.khronos.ktx");
    v32 = malloc_type_malloc(0x18uLL, 0x1060040C052FB36uLL);
    v95[3] = (uint64_t)v32;
    if (!v32
      || (*(_QWORD *)v32 = v3,
          v32[2] = 0,
          *((_QWORD *)v32 + 2) = 0,
          v33 = CGDataConsumerCreate((void *)v95[3], (const CGDataConsumerCallbacks *)__CPCGDestinationKTXDataConsumerCallbacks), (v91[3] = (uint64_t)v33) == 0))
    {
      if (!v27)
      {
LABEL_46:
        ((void (*)(void **, _QWORD, _QWORD))v63)(&aBlock, 0, 0);
        v48 = 0;
        goto LABEL_47;
      }
      v46 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v47 = "Could not allocate ATX/KTX data consumer";
LABEL_45:
      __CPBitmapSetErrorIfNecessary(v27, v46, 12, v47);
      goto LABEL_46;
    }
    v34 = CGImageDestinationCreateWithDataConsumer(v33, v31, *(_QWORD *)(v3 + 40), 0);
    v87[3] = (uint64_t)v34;
    if (!v34)
    {
      if (!v27)
        goto LABEL_46;
      v46 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v47 = "Could not allocate ATX/KTX destination";
      goto LABEL_45;
    }
    v35 = *(_DWORD *)(v3 + 32);
    if ((v35 & 1) != 0)
    {
      v36 = CGImageGetColorSpace(v2);
      v37 = CGColorSpaceRetain(v36);
      v75[3] = (uint64_t)v37;
    }
    if (v30 == 7)
    {
      keys = (void *)*MEMORY[0x1E0CBCA18];
      values[0] = *(void **)MEMORY[0x1E0CBC808];
      v38 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v39 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
      v40 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
      v41 = 1;
    }
    else
    {
      v55 = *(_DWORD *)(v3 + 28);
      valuePtr = 68;
      v56 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v57 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
      v83[3] = (uint64_t)v57;
      if (!v57)
      {
LABEL_72:
        if (!v27)
          goto LABEL_46;
        v46 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v47 = "Could not allocate ATX/KTX props";
        goto LABEL_45;
      }
      v58 = (void *)*MEMORY[0x1E0C9AE50];
      if (v55 != 6)
        v58 = (void *)*MEMORY[0x1E0C9AE40];
      v59 = *MEMORY[0x1E0CBC830];
      keys = (void *)*MEMORY[0x1E0CBCA18];
      v99 = v59;
      v100 = (void *)*MEMORY[0x1E0CBC848];
      values[0] = *(void **)MEMORY[0x1E0CBC840];
      values[1] = v57;
      values[2] = v58;
      v39 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
      v40 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
      v38 = v56;
      v41 = 3;
    }
    v60 = CFDictionaryCreate(v38, (const void **)&keys, (const void **)values, v41, v39, v40);
    v79[3] = (uint64_t)v60;
    if (v60)
    {
      keys = v11;
      v99 = 0x40000000;
      v100 = ____CPCGDestinationKTXBlockSetup_block_invoke_2;
      v101 = &unk_1E2881CF0;
      v105 = v35 & 1;
      v102 = &v74;
      v103 = &v86;
      v104 = &v78;
      *(_QWORD *)(v3 + 96) = v28;
      *(_QWORD *)(v3 + 104) = v29;
      *(_QWORD *)(v3 + 112) = _Block_copy(&keys);
      *(_QWORD *)(v3 + 120) = _Block_copy(&aBlock);
      v48 = 1;
LABEL_47:
      _Block_object_dispose(&v74, 8);
      _Block_object_dispose(&v78, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v86, 8);
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v94, 8);
      if (!v48)
        return;
      goto LABEL_9;
    }
    goto LABEL_72;
  }
  v4 = *(CFErrorRef **)(a1 + 48);
  if (v4)
  {
    v5 = "No images provided";
    v6 = 1;
    goto LABEL_7;
  }
}

@end
