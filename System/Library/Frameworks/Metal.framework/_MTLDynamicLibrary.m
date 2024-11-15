@implementation _MTLDynamicLibrary

- (MTLDevice)device
{
  return self->_container->_device;
}

- (OS_dispatch_data)binaryData
{
  return self->_container->_vendorData;
}

- (OS_dispatch_data)reflectionData
{
  return (OS_dispatch_data *)-[MTLDynamicLibraryContainer reflectionData](self->_container, "reflectionData");
}

- (NSArray)exportedFunctions
{
  return self->_container->_exportedFunctions;
}

- (NSArray)exportedVariables
{
  return self->_container->_exportedVariables;
}

- (NSArray)importedSymbols
{
  return self->_container->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_container->_importedLibraries;
}

- (NSString)installName
{
  return self->_container->_installName;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_container->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
  MTLDynamicLibraryContainer *container;
  unint64_t *p_debugInstrumentationData;
  MTLDebugInstrumentationData *debugInstrumentationData;
  MTLDebugInstrumentationData *v7;

  container = self->_container;
  debugInstrumentationData = container->_debugInstrumentationData;
  p_debugInstrumentationData = (unint64_t *)&container->_debugInstrumentationData;
  if (!debugInstrumentationData)
  {
    do
    {
      if (__ldaxr(p_debugInstrumentationData))
      {
        __clrex();
        return;
      }
    }
    while (__stlxr((unint64_t)a3, p_debugInstrumentationData));
    v7 = self->_container->_debugInstrumentationData;
  }
}

- (_MTLDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  _MTLDynamicLibrary *v10;
  uint64_t v11;
  objc_super v13;

  if (a6)
    *a6 = 0;
  v13.receiver = self;
  v13.super_class = (Class)_MTLDynamicLibrary;
  v10 = -[_MTLObjectWithLabel init](&v13, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(a3, "libraryData");
    v10->_libraryPath = (NSString *)(id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 304))(v11);
    v10->_container = -[MTLDynamicLibraryContainer initWithLibrary:binaryData:device:error:]([MTLDynamicLibraryContainer alloc], "initWithLibrary:binaryData:device:error:", v11, a4, a5, a6);
    v10->_shaderValidationEnabled = objc_msgSend(a3, "shaderValidationEnabled");
  }
  return v10;
}

- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5
{
  return -[_MTLDynamicLibrary initWithURL:device:options:error:](self, "initWithURL:device:options:error:", a3, a4, 0, a5);
}

- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  _MTLDynamicLibrary *v10;
  MTLDynamicLibraryContainer *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MTLDynamicLibrary;
  v10 = -[_MTLObjectWithLabel init](&v13, sel_init);
  if (v10)
  {
    if (a3)
    {
      v11 = -[MTLDynamicLibraryContainer initWithURL:device:options:error:]([MTLDynamicLibraryContainer alloc], "initWithURL:device:options:error:", a3, a4, a5, a6);
      v10->_container = v11;
      if (v11)
      {
        v10->_libraryPath = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "standardizedURL"), "path");
        v10->_shaderValidationEnabled = (a5 & 2) != 0;
        return v10;
      }
    }
    else if (a6)
    {
      *a6 = newErrorWithMessage(CFSTR("URL for dynamic library is nil"), MTLDynamicLibraryErrorInvalidFile);
    }

    return 0;
  }
  return v10;
}

+ (unsigned)dynamicLibraryTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  MTLLoadedFile *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  NSData *v16;
  uint64_t v17;
  int v18;
  char v19;
  void *v20;
  float *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  int v26;
  id v27;
  _QWORD v29[6];
  _QWORD v30[8];
  int v31;
  unint64_t v32;
  _QWORD v33[5];
  _QWORD v34[12];
  uint64_t v35;
  float *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, _QWORD *);
  uint64_t (*v39)(uint64_t);
  _BYTE v40[32];
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  unint64_t v65;
  int v66;
  uint64_t v67;

  if (a5)
    *a5 = 0;
  v8 = (void *)MEMORY[0x186DAC640](a1, a2);
  v9 = (void *)objc_opt_new();
  v10 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v9, (NSURL *)a3, (NSError **)a5, CFSTR("MTLDynamicLibraryDomain"), 1);
  v67 = 0;
  v66 = 0;
  v11 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v67, &v66);
  v65 = v11;
  v12 = +[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, 0);
  v13 = 0;
  if (v9)
    v14 = v10 == 0;
  else
    v14 = 1;
  if (v14)
    goto LABEL_28;
  v15 = v12;
  v16 = -[MTLLoadedFile contents](v10, "contents");
  if (-[NSData length](v16, "length") >= 0x58)
  {
    v17 = -[NSData bytes](v16, "bytes");
    if (*(_DWORD *)v17 == 1112298573 && (*(_BYTE *)(v17 + 10) & 0x7F) != 2)
    {
      -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v10);

      v13 = 0;
      goto LABEL_31;
    }
  }
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3052000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  v35 = 0;
  v36 = (float *)&v35;
  v37 = 0x5812000000;
  v38 = __Block_byref_object_copy__105;
  v39 = __Block_byref_object_dispose__106;
  memset(v40, 0, sizeof(v40));
  v41 = 0;
  v42 = 1065353216;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke;
  v34[3] = &unk_1E0FE2FD0;
  v34[4] = &v43;
  v34[5] = &v35;
  v34[6] = &v61;
  v34[7] = &v53;
  v34[10] = v11;
  v34[11] = v15;
  v34[8] = &v49;
  v34[9] = &v57;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_2;
  v33[3] = &unk_1E0FE2E20;
  v33[4] = v16;
  v18 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v34, (uint64_t)v33, -[NSData length](v16, "length"));
  if (*((_BYTE *)v62 + 24)
    && (v19 = isVendorSliceCompatible((uint64_t)&v65, (uint64_t)v16, v54[3], a4),
        *((_BYTE *)v62 + 24) = v19,
        (v19 & 1) != 0)
    || (v20 = (void *)objc_msgSend(a4, "getMostCompatibleArchitecture:", v44[5]),
        !objc_msgSend(v20, "cpuType")))
  {
    v25 = 0;
  }
  else
  {
    v21 = v36;
    v22 = objc_msgSend(v20, "cpuType");
    v32 = (int)objc_msgSend(v20, "cpuSubtype") | (unint64_t)(v22 << 32);
    v23 = std::unordered_map<unsigned long long,+[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]::archSliceId>::operator[](v21 + 12, &v32);
    v24 = v23[1];
    v54[3] = *v23;
    v50[3] = v24;
    v25 = 1;
  }
  objc_msgSend((id)v44[5], "removeAllObjects");

  v44[5] = 0;
  if (!v18)
    goto LABEL_20;
  if (((*((_BYTE *)v62 + 24) == 0) & ~v25) != 0)
  {
LABEL_21:
    if (v25)
      v26 = 3;
    else
      v26 = 1;
    if (*((_BYTE *)v58 + 24))
      v13 = v26;
    else
      v13 = 4;
    goto LABEL_27;
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_3;
  v30[3] = &unk_1E0FE2FF8;
  v31 = v66;
  v30[6] = &v53;
  v30[7] = v67;
  v30[4] = v16;
  v30[5] = &v57;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_4;
  v29[3] = &unk_1E0FE2F80;
  v29[4] = v16;
  v29[5] = &v53;
  if (!+[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 1, (uint64_t)v30, (uint64_t)v29))
  {
LABEL_20:
    v13 = 0;
    goto LABEL_27;
  }
  if (!*((_BYTE *)v62 + 24))
    goto LABEL_21;
  v13 = 2;
LABEL_27:
  -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v10);
  _Block_object_dispose(&v35, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v40[8]);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
LABEL_28:

  if (a5 && *a5)
    v27 = *a5;
LABEL_31:
  objc_autoreleasePoolPop(v8);
  return v13;
}

+ (_QWORD)dynamicLibraryTypeAtURL:(float *)a1 device:(unint64_t *)a2 error:
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

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLDynamicLibrary;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  NSString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *installName;
  NSString *libraryPath;
  void *v12;
  objc_super v14;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)_MTLDynamicLibrary;
  v7 = -[_MTLDynamicLibrary description](&v14, sel_description);
  v15[0] = v4;
  v15[1] = CFSTR("label =");
  v8 = CFSTR("<none>");
  if (v5)
    v9 = v5;
  else
    v9 = CFSTR("<none>");
  v15[2] = v9;
  v15[3] = v4;
  installName = (const __CFString *)self->_container->_installName;
  if (!installName)
    installName = CFSTR("<none>");
  v15[4] = CFSTR("installName =");
  v15[5] = installName;
  libraryPath = self->_libraryPath;
  v15[6] = v4;
  v15[7] = CFSTR("loadPath =");
  if (libraryPath)
    v8 = (const __CFString *)libraryPath;
  v15[8] = v8;
  v12 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9), "componentsJoinedByString:", CFSTR(" ")));

  return v12;
}

- (NSString)description
{
  return (NSString *)-[_MTLDynamicLibrary formattedDescription:](self, "formattedDescription:", 0);
}

- (const)libraryUUID
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_container->_libraryUUID;
}

- (id)airData
{
  return -[MTLDynamicLibraryContainer airData](self->_container, "airData");
}

- (id)container
{
  return self->_container;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return -[MTLDynamicLibraryContainer serializeToURL:options:error:](self->_container, "serializeToURL:options:error:", a3, 15, a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return -[MTLDynamicLibraryContainer serializeToURL:options:error:](self->_container, "serializeToURL:options:error:", a3, a4, a5);
}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (NSArray)relocations
{
  return self->_relocations;
}

- (void)setRelocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shaderValidationEnabled
{
  return self->_shaderValidationEnabled;
}

@end
