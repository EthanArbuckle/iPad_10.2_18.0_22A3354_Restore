@implementation MTLDynamicLibraryContainer

- (MTLDynamicLibraryContainer)initWithLibrary:(void *)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 *v22;
  __int128 v23;
  objc_super v25;

  if (a6)
    *a6 = 0;
  v25.receiver = self;
  v25.super_class = (Class)MTLDynamicLibraryContainer;
  v10 = -[MTLDynamicLibraryContainer init](&v25, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 2) = a5;
    v11 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 32))(a3);
    *((_QWORD *)v10 + 10) = v11;
    *((_QWORD *)v10 + 14) = objc_msgSend(v11, "length");
    *((_DWORD *)v10 + 34) = (unint64_t)+[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, (uint64_t)a3) >> 32;
    v12 = (id)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 56))(a3);
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v14 = v12;
    else
      v14 = (id)MEMORY[0x1E0C9AA60];
    *((_QWORD *)v10 + 6) = v14;
    v15 = (id)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 40))(a3);
    if (v15)
      v16 = v15;
    else
      v16 = v13;
    *((_QWORD *)v10 + 5) = v16;
    v17 = (id)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 72))(a3);
    if (v17)
      v18 = v17;
    else
      v18 = v13;
    *((_QWORD *)v10 + 8) = v18;
    v19 = (id)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 64))(a3);
    if (v19)
      v20 = v19;
    else
      v20 = v13;
    *((_QWORD *)v10 + 7) = v20;
    v21 = (id)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 104))(a3);
    *((_QWORD *)v10 + 9) = v21;
    if (v21 && objc_msgSend(v21, "length"))
    {
      v22 = (__int128 *)(*(uint64_t (**)(void *))(*(_QWORD *)a3 + 296))(a3);
      v23 = *v22;
      *(_OWORD *)(v10 + 156) = v22[1];
      *(_OWORD *)(v10 + 140) = v23;
      (*(void (**)(void *, char *, char *))(*(_QWORD *)a3 + 216))(a3, v10 + 88, v10 + 96);
      (*(void (**)(void *, char *, char *, id *))(*(_QWORD *)a3 + 224))(a3, v10 + 120, v10 + 128, a6);
      *((_QWORD *)v10 + 3) = a4;
      dispatch_retain((dispatch_object_t)a4);
      *((_QWORD *)v10 + 4) = 0;
      *((_DWORD *)v10 + 46) = 0;
    }
    else
    {
      if (a6)
        *a6 = newErrorWithMessage(CFSTR("Library has no install name"), MTLDynamicLibraryErrorCompilationFailure);

      return 0;
    }
  }
  return (MTLDynamicLibraryContainer *)v10;
}

- (MTLDynamicLibraryContainer)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7;
  id v10;
  uint64_t v11;
  uint64_t v12;
  MTLLoadedFile *v13;
  uint64_t v14;
  MTLDynamicLibraryContainer *v15;
  NSData *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  void *v21;
  float *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t *v27;
  char v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _MTLLibrary *v35;
  _MTLLibrary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void *v41;
  _QWORD v43[6];
  _QWORD v44[10];
  int v45;
  unint64_t v46;
  _QWORD v47[5];
  _QWORD v48[14];
  unsigned int v49;
  unsigned int v50[2];
  uint64_t v51;
  float *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, _QWORD *);
  uint64_t (*v55)(uint64_t);
  _BYTE v56[32];
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  objc_super v84;

  v7 = a5;
  v84.receiver = self;
  v84.super_class = (Class)MTLDynamicLibraryContainer;
  v10 = -[MTLDynamicLibraryContainer init](&v84, sel_init);
  if (!v10)
    return (MTLDynamicLibraryContainer *)v10;
  *((_QWORD *)v10 + 2) = a4;
  v11 = *((_QWORD *)a4 + 59);
  v12 = -[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:](v11, (NSURL *)a3, (NSError **)a6, CFSTR("MTLDynamicLibraryDomain"), 1);
  if (!v12)
  {

    return 0;
  }
  v13 = (MTLLoadedFile *)v12;
  v14 = -[MTLLoader associateLoadedFile:withObject:](v11, v12, 0);
  if (!v14)
  {
    v16 = -[MTLLoadedFile contents](v13, "contents");
    v83 = 0;
    v82 = 0;
    v81 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v83, &v82);
    v17 = +[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, 0);
    v77 = 0;
    v78 = &v77;
    v79 = 0x2020000000;
    v80 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3052000000;
    v62 = __Block_byref_object_copy__0;
    v63 = __Block_byref_object_dispose__0;
    v64 = 0;
    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v51 = 0;
    v52 = (float *)&v51;
    v53 = 0x5812000000;
    v54 = __Block_byref_object_copy__7;
    v55 = __Block_byref_object_dispose__8;
    memset(v56, 0, sizeof(v56));
    v57 = 0;
    v58 = 1065353216;
    *(_QWORD *)v50 = 0;
    v18 = _MTLGetMTLCompilerLLVMVersionForDevice(a4);
    _MTLGetMaxAIRAndLanguageVersions(v18, &v50[1], v50);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke;
    v48[3] = &unk_1E0FE2F30;
    v48[6] = &v59;
    v48[7] = &v51;
    v48[8] = &v77;
    v48[9] = &v69;
    v48[12] = v81;
    v48[13] = v17;
    v49 = v50[1];
    v48[10] = &v65;
    v48[11] = &v73;
    v48[4] = v10;
    v48[5] = v16;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_2;
    v47[3] = &unk_1E0FE2E20;
    v47[4] = v16;
    v19 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v48, (uint64_t)v47, -[NSData length](v16, "length"));
    if (*((_BYTE *)v78 + 24)
      && (v20 = isVendorSliceCompatible((uint64_t)&v81, (uint64_t)v16, v70[3], a4),
          *((_BYTE *)v78 + 24) = v20,
          (v20 & 1) != 0)
      || (v21 = (void *)objc_msgSend(a4, "getMostCompatibleArchitecture:", v60[5]),
          !objc_msgSend(v21, "cpuType")))
    {
      v26 = 0;
    }
    else
    {
      v22 = v52;
      v23 = objc_msgSend(v21, "cpuType");
      v46 = (int)objc_msgSend(v21, "cpuSubtype") | (unint64_t)(v23 << 32);
      v24 = std::unordered_map<unsigned long long,-[MTLDynamicLibraryContainer initWithURL:device:options:error:]::archSliceId>::operator[](v22 + 12, &v46);
      v25 = v24[1];
      v70[3] = *v24;
      v66[3] = v25;
      v26 = 1;
    }
    objc_msgSend((id)v60[5], "removeAllObjects");

    v60[5] = 0;
    v27 = v78;
    if (((*((_BYTE *)v78 + 24) == 0) & ~v26) == 0)
    {
      if (v19)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_3;
        v44[3] = &unk_1E0FE2F58;
        v44[4] = v10;
        v44[5] = v16;
        v44[6] = &v73;
        v44[7] = &v69;
        v44[8] = v83;
        v44[9] = v81;
        v45 = v82;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_4;
        v43[3] = &unk_1E0FE2F80;
        v43[4] = v16;
        v43[5] = &v69;
        v28 = +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 1, (uint64_t)v44, (uint64_t)v43);
        v27 = v78;
      }
      else
      {
        v28 = 0;
      }
      *((_BYTE *)v27 + 24) = v28;
    }
    if (*((_BYTE *)v74 + 24))
    {
      v29 = *((id *)v10 + 10);
      if (*((_BYTE *)v74 + 24))
      {
        v30 = objc_msgSend(v10, "airData");
        v35 = MTLLibraryBuilder::newLibraryWithData(*(_MTLDevice ***)(*((_QWORD *)v10 + 2) + 424), *((_MTLDevice **)v10 + 2), v30, a6, v31, v32, v33, v34);
        v36 = v35;
        if (v35)
        {
          v37 = -[_MTLLibrary libraryData](v35, "libraryData");
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v37 + 216))(v37, (uint64_t)v10 + 88, (uint64_t)v10 + 96);
          v38 = -[_MTLLibrary libraryData](v36, "libraryData");
          (*(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)v38 + 224))(v38, (uint64_t)v10 + 120, (uint64_t)v10 + 128, a6);
          v39 = *((_QWORD *)v10 + 13);
          *((_QWORD *)v10 + 11) += v39;
          *((_QWORD *)v10 + 15) += v39;
          if ((v7 & 2) != 0)
            -[_MTLLibrary setShaderValidationEnabled:](v36, "setShaderValidationEnabled:", 1);
        }
        dispatch_release(v30);
        if (*((_BYTE *)v78 + 24))
        {

        }
        else
        {
          if (v36)
            v41 = (void *)objc_msgSend(*((id *)v10 + 2), "newDynamicLibrary:error:", v36, a6);
          else
            v41 = 0;

          if (v41)
          {
            v15 = (MTLDynamicLibraryContainer *)(id)objc_msgSend(v41, "container");

            -[MTLLoader releaseLoadedFile:](v11, v13);
LABEL_34:
            v40 = 0;
            goto LABEL_36;
          }
        }
      }
    }
    else if ((v7 & 1) == 0)
    {
      if (a6)
        *a6 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTLDynamicLibrary could not be loaded as its AIR slice is missing")), MTLDynamicLibraryErrorInvalidFile);
      -[MTLLoader releaseLoadedFile:](v11, v13);

      v40 = 0;
      v15 = 0;
      goto LABEL_36;
    }
    v15 = (MTLDynamicLibraryContainer *)-[MTLLoader associateLoadedFile:withObject:](v11, (uint64_t)v13, (uint64_t)v10);
    if (v15)
    {
      -[MTLLoader releaseLoadedFile:](v11, v13);

      goto LABEL_34;
    }
    *((_QWORD *)v10 + 4) = 0;
    *((_DWORD *)v10 + 46) = 0;
    v40 = 1;
    *((_QWORD *)v10 + 1) = v13;
LABEL_36:
    _Block_object_dispose(&v51, 8);
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v56[8]);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v77, 8);
    if ((v40 & 1) == 0)
      return v15;
    return (MTLDynamicLibraryContainer *)v10;
  }
  v15 = (MTLDynamicLibraryContainer *)v14;
  -[MTLLoader releaseLoadedFile:](v11, v13);

  return v15;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  MTLArchitecture *v9;
  float *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v15 = a2;
  v8 = HIDWORD(a2);
  v9 = -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", a2, HIDWORD(a2));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
  v10 = (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  v14 = (a2 << 32) | (a2 >> 32);
  v11 = std::unordered_map<unsigned long long,-[MTLDynamicLibraryContainer initWithURL:device:options:error:]::archSliceId>::operator[](v10, (unint64_t *)&v14);
  *v11 = a3;
  v11[1] = a4;

  if (v15 == *(_QWORD *)(a1 + 96))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a4;
  }
  else if (*(_DWORD *)(a1 + 104) == (_DWORD)a2 && *(_DWORD *)(a1 + 112) >= v8)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (!*(_BYTE *)(v12 + 24) || *(_DWORD *)(*(_QWORD *)(a1 + 32) + 136) < (int)v8)
    {
      *(_BYTE *)(v12 + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = a3;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = a4;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 136) = v8;
    }
  }
  return 1;
}

- (_QWORD)initWithURL:(float *)a1 device:(unint64_t *)a2 options:error:
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  _QWORD **v7;
  _QWORD *i;
  unint64_t v9;
  float v10;
  float v11;
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  int8x8_t prime;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  uint8x8_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v31;

  v4 = *a2;
  v5 = *((_QWORD *)a1 + 1);
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v2 = *a2;
      if (v4 >= v5)
        v2 = v4 % v5;
    }
    else
    {
      v2 = (v5 - 1) & v4;
    }
    v7 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v2);
    if (v7)
    {
      for (i = *v7; i; i = (_QWORD *)*i)
      {
        v9 = i[1];
        if (v9 == v4)
        {
          if (i[2] == v4)
            return i + 3;
        }
        else
        {
          if (v6.u32[0] > 1uLL)
          {
            if (v9 >= v5)
              v9 %= v5;
          }
          else
          {
            v9 &= v5 - 1;
          }
          if (v9 != v2)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = v4;
  i[3] = 0;
  i[4] = 0;
  i[2] = v4;
  v10 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v11 = a1[8];
  if (!v5 || (float)(v11 * (float)v5) < v10)
  {
    v12 = (v5 & (v5 - 1)) == 0;
    if (v5 < 3)
      v12 = 0;
    v13 = (2 * v5) | !v12;
    v14 = vcvtps_u32_f32(v10 / v11);
    if (v13 <= v14)
      prime = (int8x8_t)v14;
    else
      prime = (int8x8_t)v13;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v5 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v5)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v5)
    {
      v22 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v5 < 3 || (v23 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v23.i16[0] = vaddlv_u8(v23), v23.u32[0] > 1uLL))
      {
        v22 = std::__next_prime(v22);
      }
      else
      {
        v24 = 1 << -(char)__clz(v22 - 1);
        if (v22 >= 2)
          v22 = v24;
      }
      if (*(_QWORD *)&prime <= v22)
        prime = (int8x8_t)v22;
      if (*(_QWORD *)&prime >= v5)
      {
        v5 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v16 = operator new(8 * *(_QWORD *)&prime);
          v17 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v16;
          if (v17)
            operator delete(v17);
          v18 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v18++) = 0;
          while (*(_QWORD *)&prime != v18);
          v19 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v19)
          {
            v20 = v19[1];
            v21 = (uint8x8_t)vcnt_s8(prime);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              if (v20 >= *(_QWORD *)&prime)
                v20 %= *(_QWORD *)&prime;
            }
            else
            {
              v20 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v20) = a1 + 4;
            v25 = (_QWORD *)*v19;
            if (*v19)
            {
              do
              {
                v26 = v25[1];
                if (v21.u32[0] > 1uLL)
                {
                  if (v26 >= *(_QWORD *)&prime)
                    v26 %= *(_QWORD *)&prime;
                }
                else
                {
                  v26 &= *(_QWORD *)&prime - 1;
                }
                if (v26 != v20)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v26))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v26) = v19;
                    goto LABEL_55;
                  }
                  *v19 = *v25;
                  *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v26);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v26) = v25;
                  v25 = v19;
                }
                v26 = v20;
LABEL_55:
                v19 = v25;
                v25 = (_QWORD *)*v25;
                v20 = v26;
              }
              while (v25);
            }
          }
          v5 = (unint64_t)prime;
          goto LABEL_59;
        }
        v31 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v31)
          operator delete(v31);
        v5 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v4 >= v5)
        v2 = v4 % v5;
      else
        v2 = v4;
    }
    else
    {
      v2 = (v5 - 1) & v4;
    }
  }
  v27 = *(_QWORD **)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
  if (v28)
  {
    *i = *v28;
LABEL_72:
    *v28 = i;
    goto LABEL_73;
  }
  *i = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = i;
  v27[v2] = a1 + 4;
  if (*i)
  {
    v29 = *(_QWORD *)(*i + 8);
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v29 >= v5)
        v29 %= v5;
    }
    else
    {
      v29 &= v5 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return i + 3;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + a2;
  else
    return 0;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  if (*(_QWORD *)(a3 + 96))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a3 + 96)
                                              + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a3 + 104);
  }
  if (*(_QWORD *)(a1 + 72) != v27)
    return 0;
  v10 = *(_QWORD *)(a3 + 48);
  if (!*(_BYTE *)(a3 + 41))
  {
    if (*(_QWORD *)(a1 + 64) == v10)
      goto LABEL_10;
    return 0;
  }
  if (*(_DWORD *)(a1 + 80) != (_DWORD)v10)
    return 0;
LABEL_10:
  result = objc_msgSend(*(id *)(a3 + 56), "length");
  if (result)
  {
    v11 = a5 + a4 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v11 <= objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      v26[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a4;
      v26[1] = a5;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = _MTLNSDataToDispatchData(*(void **)(a1 + 40), v26);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_OWORD *)(v12 + 156);
      v14 = *(_OWORD *)(v12 + 140);
      v15 = *(_OWORD *)(a3 + 24);
      *(_OWORD *)(v12 + 140) = *(_OWORD *)(a3 + 8);
      *(_OWORD *)(v12 + 156) = v15;
      *(_OWORD *)(a3 + 8) = v14;
      *(_OWORD *)(a3 + 24) = v13;
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(v16 + 72);
      *(_QWORD *)(v16 + 72) = *(_QWORD *)(a3 + 56);
      *(_QWORD *)(a3 + 56) = v17;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(v18 + 64);
      *(_QWORD *)(v18 + 64) = *(_QWORD *)(a3 + 64);
      *(_QWORD *)(a3 + 64) = v19;
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(v20 + 56);
      *(_QWORD *)(v20 + 56) = *(_QWORD *)(a3 + 72);
      *(_QWORD *)(a3 + 72) = v21;
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(v22 + 40);
      *(_QWORD *)(v22 + 40) = *(_QWORD *)(a3 + 80);
      *(_QWORD *)(a3 + 80) = v23;
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(v24 + 48);
      *(_QWORD *)(v24 + 48) = *(_QWORD *)(a3 + 88);
      *(_QWORD *)(a3 + 88) = v25;
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + v4;
  else
    return 0;
}

- (void)dealloc
{
  MTLLoadedFile *fileMapping;
  NSObject *vendorData;
  NSObject *reflectionData;
  objc_super v6;

  fileMapping = self->_fileMapping;
  if (fileMapping)
    -[MTLLoader disassociateLoadedFile:withObject:](*((_QWORD *)self->_device + 59), fileMapping);

  vendorData = self->_vendorData;
  if (vendorData)
    dispatch_release(vendorData);
  reflectionData = self->_reflectionData;
  if (reflectionData)
    dispatch_release(reflectionData);

  v6.receiver = self;
  v6.super_class = (Class)MTLDynamicLibraryContainer;
  -[MTLDynamicLibraryContainer dealloc](&v6, sel_dealloc);
}

- (void)release
{
  MTLLoadedFile *fileMapping;
  uint64_t v4;
  objc_super v5;
  _QWORD block[5];

  fileMapping = self->_fileMapping;
  if (fileMapping)
  {
    v4 = *((_QWORD *)self->_device + 59);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MTLDynamicLibraryContainer_release__block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = self;
    -[MTLLoader executeBlockForLoadedFile:withAssociatedObject:block:](v4, (int)fileMapping, (int)self, block);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLDynamicLibraryContainer;
    -[MTLDynamicLibraryContainer release](&v5, sel_release);
  }
}

id __37__MTLDynamicLibraryContainer_release__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)MTLDynamicLibraryContainer;
  return objc_msgSendSuper2(&v2, sel_release);
}

- (id)airData
{
  id result;
  __int128 v4;

  result = self->_airData;
  if (result)
  {
    v4 = *(_OWORD *)&self->_airOffset;
    return _MTLNSDataToDispatchData(result, &v4);
  }
  return result;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MTLDynamicLibraryContainer *v7;
  int64_t v8;
  _QWORD *v9;
  unint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  dispatch_data_t v13;
  NSObject *vendorData;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  BOOL v31;
  id v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  id v36;
  void *context;
  _QWORD v38[9];
  uint64_t v39;
  std::__shared_weak_count *v40;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  void *v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD *v50;
  std::__shared_weak_count *v51;
  stat v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;

  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3052000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  if (!self->_airData)
  {
    if (!a5)
      goto LABEL_15;
    v20 = newErrorWithMessage(CFSTR("AIR is required, but not available."), MTLDynamicLibraryErrorCompilationFailure);
    goto LABEL_12;
  }
  if (!a3 || (v7 = self, !objc_msgSend(a3, "path", a3, a4)) || !objc_msgSend(a3, "filePathURL"))
  {
    if (!a5)
      goto LABEL_15;
    v20 = newErrorWithMessage(CFSTR("Invalid URL"), MTLDynamicLibraryErrorInvalidFile);
LABEL_12:
    LOBYTE(v7) = 0;
    *a5 = v20;
    goto LABEL_16;
  }
  if (stat((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "path"), "UTF8String"), &v52) == -1)
  {
    if (a5)
    {
      v20 = newErrorWithMessage(CFSTR("Invalid URL"), MTLDynamicLibraryErrorInvalidFile);
      goto LABEL_12;
    }
LABEL_15:
    LOBYTE(v7) = 0;
    goto LABEL_16;
  }
  context = (void *)MEMORY[0x186DAC640]();
  v8 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, v7->_device, 0);
  v9 = operator new(0x30uLL);
  v9[1] = 0;
  v10 = v9 + 1;
  v9[2] = 0;
  *v9 = &off_1E0FDF460;
  v9[3] = 0;
  v11 = v9 + 3;
  v9[4] = 0;
  v9[5] = 0;
  v50 = v9 + 3;
  v51 = (std::__shared_weak_count *)v9;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  v46 = 0u;
  v12 = (v8 << 32) | (v8 >> 32);
  v45 = v12;
  v44 = *(_OWORD *)&v7->_bitcodeOffset;
  v13 = _MTLNSDataToDispatchData(v7->_airData, &v44);
  vendorData = v7->_vendorData;
  *(_QWORD *)&v47 = v13;
  *((_QWORD *)&v47 + 1) = vendorData;
  dispatch_retain(vendorData);
  v43 = 0;
  v43 = strdup(-[NSString UTF8String](v7->_installName, "UTF8String"));
  v15 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_msgSend((id)objc_msgSend(a3, "path"), "stringByDeletingLastPathComponent");
  v17 = objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("/%@.metallib"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
  v18 = v9[4];
  if (v18 >= v9[5])
  {
    v19 = std::vector<machOEntry>::__push_back_slow_path<machOEntry const&>(v11, (__int128 *)&v45);
  }
  else
  {
    std::vector<machOEntry>::__construct_one_at_end[abi:ne180100]<machOEntry const&>((uint64_t)v11, (__int128 *)&v45);
    v19 = v18 + 72;
  }
  v9[4] = v19;
  v22 = (void *)-[MTLDevice compiler](v7->_device, "compiler");
  v41 = v9 + 3;
  v42 = (std::__shared_weak_count *)v9;
  do
    v23 = __ldxr(v10);
  while (__stxr(v23 + 1, v10));
  v39 = 0;
  v40 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __59__MTLDynamicLibraryContainer_serializeToURL_options_error___block_invoke;
  v38[3] = &unk_1E0FE2FA8;
  v38[4] = v15;
  v38[5] = a3;
  v38[6] = v17;
  v38[7] = &v59;
  v38[8] = &v53;
  objc_msgSend(v22, "generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:", 0, &v41, &v43, 1, v17, v12, &v39, v38);
  v24 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v42;
  if (v42)
  {
    v28 = (unint64_t *)&v42->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  dispatch_release(*((dispatch_object_t *)&v47 + 1));
  dispatch_release((dispatch_object_t)v47);
  free(v43);
  if (a5)
  {
    v30 = (void *)v54[5];
    *a5 = v30;
    if (*((_BYTE *)v60 + 24))
      v31 = 1;
    else
      v31 = v30 == 0;
    if (!v31)
      v32 = v30;
  }
  else
  {
    LOBYTE(v7) = *((_BYTE *)v60 + 24) != 0;
  }
  if (*((_QWORD *)&v48 + 1))
  {
    *(_QWORD *)&v49 = *((_QWORD *)&v48 + 1);
    operator delete(*((void **)&v48 + 1));
  }
  v33 = v51;
  if (v51)
  {
    v34 = (unint64_t *)&v51->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  objc_autoreleasePoolPop(context);
  if (a5)
  {
    if (*a5)
      v36 = *a5;
    LOBYTE(v7) = *((_BYTE *)v60 + 24) != 0;
  }
LABEL_16:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  return v7 & 1;
}

BOOL __59__MTLDynamicLibraryContainer_serializeToURL_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  const std::__fs::filesystem::path *v3;
  std::error_code *v4;

  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = newErrorWithMessage(*(NSString **)(a2 + 8), MTLDynamicLibraryErrorCompilationFailure);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 48), 0), 0, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  v3 = (const std::__fs::filesystem::path *)objc_msgSend(*(id *)(a1 + 48), "UTF8String");
  return remove(v3, v4);
}

- (void)initReflectionData
{
  os_unfair_lock_s *p_reflectionDataLock;
  __int128 v4;

  p_reflectionDataLock = &self->_reflectionDataLock;
  os_unfair_lock_lock(&self->_reflectionDataLock);
  if (!self->_reflectionData)
  {
    v4 = *(_OWORD *)&self->_reflectionOffset;
    self->_reflectionData = (OS_dispatch_data *)_MTLNSDataToDispatchData(self->_airData, &v4);
  }
  os_unfair_lock_unlock(p_reflectionDataLock);
}

- (id)reflectionData
{
  id result;

  result = self->_reflectionData;
  if (!result)
  {
    if (self->_airData && self->_reflectionSize)
    {
      -[MTLDynamicLibraryContainer initReflectionData](self, "initReflectionData");
      return self->_reflectionData;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
