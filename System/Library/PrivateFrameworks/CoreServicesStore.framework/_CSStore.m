@implementation _CSStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessContext, 0);

}

+ (void)initialize
{
  char *v2;
  void *v3;
  int v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = getenv("CS_ENABLE_IO_LOGGING");
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "BOOLValue");

      if (v4)
        CSStore2::Writer::logIO = 1;
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3 error:(id *)a4
{
  _CSStoreAccessContext *accessContext;
  tableOffsets *dataContainer;
  Bytef *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(_QWORD *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
  }
  dataContainer = self->_store.dataContainer;
  if (dataContainer)
  {
    v9 = (Bytef *)*((_QWORD *)dataContainer + 1);
    v10 = (void *)*((unsigned int *)dataContainer + 4);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  CSStore2::Store::CreateWithBytes(&v18, v9, v10, a4);
  v11 = v18;
  if (!v18)
    return 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__87;
  v24 = __Block_byref_object_dispose__88;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke;
  v19[3] = &unk_1E4E219E0;
  v19[4] = &v20;
  CSStore2::Store::enumerateTables((CSStore2 **)v18, v19);
  v12 = v21[5];
  if (v12)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v26[0] = *MEMORY[0x1E0CB2938];
      v26[1] = CFSTR("Line");
      v27[0] = CFSTR("kCSStoreValidationErr");
      v27[1] = &unk_1E4E25070;
      v26[2] = CFSTR("FullTable");
      v27[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9491, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&v18, 0);
    v11 = v18;
  }
  _Block_object_dispose(&v20, 8);

  if (!v11)
    return 0;
  v15 = *(_DWORD *)(*((_QWORD *)self->_store.dataContainer + 1) + 8);
  v11[38] = (id)self->_store.pedigree.family;
  *((_DWORD *)v11 + 78) = v15;
  *((_BYTE *)v11 + 316) = 1;
  v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initByMovingStore:", v11);

  MEMORY[0x1A85AA130](v11, 0x10A0C4017B00345);
  return v16;
}

- (BOOL)isReadOnly
{
  _CSStoreAccessContext *accessContext;
  _CSStoreAccessContext *v4;

  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(_QWORD *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
      if (performConstantAssertions)
      {
        v4 = self->_accessContext;
        if (v4)
          (*(void (**)(CSStoreAccessContextInterface *))(*(_QWORD *)v4->_impl.__ptr_ + 8))(v4->_impl.__ptr_);
      }
    }
  }
  return *(_BYTE *)&self->_store.flags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  __int128 v2;
  unint64_t v3;
  __int16 v4;
  char v5;
  __int16 v6;
  char v7;

  *((_BYTE *)self + 320) = 0;
  *((_BYTE *)self + 324) = 0;
  *((_QWORD *)self + 1) = 0;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *((_OWORD *)self + 1) = v2;
  *((_OWORD *)self + 2) = v2;
  *((_OWORD *)self + 3) = v2;
  *((_OWORD *)self + 4) = v2;
  *((_OWORD *)self + 5) = v2;
  *((_OWORD *)self + 6) = v2;
  *((_OWORD *)self + 7) = v2;
  *((_OWORD *)self + 8) = v2;
  *((_OWORD *)self + 9) = v2;
  *((_OWORD *)self + 10) = v2;
  *((_OWORD *)self + 11) = v2;
  *((_OWORD *)self + 12) = v2;
  *((_OWORD *)self + 13) = v2;
  *((_OWORD *)self + 14) = v2;
  *((_OWORD *)self + 15) = v2;
  *((_OWORD *)self + 16) = v2;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  atomic_store(0, (unint64_t *)self + 37);
  atomic_store(0, (unint64_t *)self + 38);
  do
    v3 = __ldaxr(&CSStore2::Store::Store(void)::nextFamily);
  while (__stlxr(v3 + 1, &CSStore2::Store::Store(void)::nextFamily));
  *((_QWORD *)self + 39) = v3;
  *((_BYTE *)self + 320) = 0;
  *((_BYTE *)self + 323) = v7;
  *(_WORD *)((char *)self + 321) = v6;
  *((_BYTE *)self + 324) = 0;
  *((_BYTE *)self + 327) = v5;
  *(_WORD *)((char *)self + 325) = v4;
  *((_BYTE *)self + 328) = 0;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _CSStoreAccessContext *accessContext;
  __CFString *v7;
  void *v8;
  CSStore2 *v9;
  CSStore2 *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  CSStore2 *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSStore.mm"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aCoder isKindOfClass:[NSXPCCoder class]]"));

  }
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
      (*(void (**)(CSStoreAccessContextInterface *))(*(_QWORD *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_);
  }
  v13 = v5;
  v7 = CFSTR("XPCRepresentation");
  if (v13)
  {
    v14 = 0;
    CSStore2::Store::encodeAsXPCObject((uint64_t)self->_store.dataContainer, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CSStore2 *)v14;
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v13, "encodeXPCObject:forKey:", v8, CFSTR("XPCRepresentation"));
    }
    else
    {
      CSStore2::GetLog(v9);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_fault_impl(&dword_1A4E5A000, v11, OS_LOG_TYPE_FAULT, "Unexpectedly could not encode store: %@", buf, 0xCu);
      }

    }
  }

}

- (_CSStore)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CSStore2 *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id *v33;
  _CSStore *v34;
  id *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  unsigned int v41;
  FILE *v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  CSStore2 *v46;
  CSStore2 *v47;
  NSObject *v48;
  CSStore2 *v49;
  CSStore2 *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  CSStore2 *v54;
  void *v55;
  id v56;
  CSStore2 **v57;
  id v58;
  const CSStore2::Store *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  id *v70;
  id v71;
  id v72;
  _BYTE buf[22];
  __int128 __ptr;
  void (*v75)(uint64_t, CSStore2::Table *);
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;

  v4 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v6 = v5;
  v7 = (void *)v4;
  v79 = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v9;
  v70 = 0;
  if (!v9 || !objc_msgSend(v9, "isFileURL"))
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2938];
    *(_QWORD *)&buf[8] = CFSTR("Line");
    *(_QWORD *)&__ptr = CFSTR("paramErr");
    *((_QWORD *)&__ptr + 1) = &unk_1E4E25130;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &__ptr, buf, 2);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    goto LABEL_10;
  }
  v72 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v10, 1, &v72);
  v12 = (CSStore2 *)v72;
  v13 = v12;
  if (!v11)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_10;
  }
  CSStore2::GetLog(v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v52 = objc_msgSend(v11, "length");
    LODWORD(__ptr) = 134217984;
    *(_QWORD *)((char *)&__ptr + 4) = v52;
    _os_log_debug_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_DEBUG, "Creating CSStore from file with length %llu", (uint8_t *)&__ptr, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v11, "length") >> 32)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2938];
    *(_QWORD *)&buf[8] = CFSTR("Line");
    *(_QWORD *)&__ptr = CFSTR("fileBoundsErr");
    *((_QWORD *)&__ptr + 1) = &unk_1E4E25118;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &__ptr, buf, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -1309);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
    goto LABEL_8;
  }
  v18 = objc_retainAutorelease(v11);
  v71 = v13;
  CSStore2::Store::_Create((CSStore2 *)&__ptr, (Bytef *)objc_msgSend(v18, "bytes"), (void *)objc_msgSend(v18, "length"), 1, 1, &v71);
  v68 = v71;

  v36 = (id *)__ptr;
  *(_QWORD *)&__ptr = 0;
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&v70, v36);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)&__ptr, 0);
  v17 = v70;
  if (v70)
    goto LABEL_30;
  objc_msgSend(v68, "userInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKey:", CFSTR("ZeroedRanges"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (v39)
  {
    v17 = 0;
LABEL_30:
    v13 = v68;
    goto LABEL_10;
  }
  objc_msgSend(v68, "userInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v40, "mutableCopy");

  v67 = objc_retainAutorelease(v18);
  v66 = objc_msgSend(v67, "bytes");
  v41 = objc_msgSend(v67, "length");
  v65 = objc_retainAutorelease(v10);
  v42 = fopen((const char *)objc_msgSend(v65, "fileSystemRepresentation"), "rb");
  if (!v42)
  {
    CSStore2::GetLog(0);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__ptr) = 138412290;
      *(_QWORD *)((char *)&__ptr + 4) = v65;
      _os_log_error_impl(&dword_1A4E5A000, v53, OS_LOG_TYPE_ERROR, "verifying map with file: URL %@ could not be opened", (uint8_t *)&__ptr, 0xCu);
    }

    v44 = 4;
    goto LABEL_62;
  }
  v43 = 0;
  v44 = 0;
  v45 = v41;
  while (!feof(v42) && !ferror(v42))
  {
    v46 = (CSStore2 *)fread(&__ptr, 1uLL, 0x1000uLL, v42);
    v47 = v46;
    if (!v46)
      goto LABEL_46;
    if ((unint64_t)v46 <= v45 - v43)
    {
      v49 = (CSStore2 *)memcmp(&__ptr, (const void *)(v66 + v43), (size_t)v46);
      if (!(_DWORD)v49)
        goto LABEL_46;
      CSStore2::GetLog(v49);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (char *)v47 + v43;
        _os_log_error_impl(&dword_1A4E5A000, v48, OS_LOG_TYPE_ERROR, "file/map mismatch between offsets %#zx and %#zx", buf, 0x16u);
      }
      v44 = 1;
    }
    else
    {
      CSStore2::GetLog(v46);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v45;
        _os_log_error_impl(&dword_1A4E5A000, v48, OS_LOG_TYPE_ERROR, "file/map mismatch: file longer than map of length %#zx", buf, 0xCu);
      }
      v44 = 3;
    }

LABEL_46:
    v43 += (uint64_t)v47;
  }
  v50 = (CSStore2 *)ferror(v42);
  if ((_DWORD)v50)
  {
    CSStore2::GetLog(v50);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__ptr) = 0;
      _os_log_error_impl(&dword_1A4E5A000, v51, OS_LOG_TYPE_ERROR, "file/map comparison read error", (uint8_t *)&__ptr, 2u);
    }
    v44 = 4;
    goto LABEL_51;
  }
  if (v45 != v43)
  {
    v54 = (CSStore2 *)feof(v42);
    if ((_DWORD)v54)
    {
      CSStore2::GetLog(v54);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__ptr) = 134217984;
        *(_QWORD *)((char *)&__ptr + 4) = v45;
        _os_log_error_impl(&dword_1A4E5A000, v51, OS_LOG_TYPE_ERROR, "file/map mismatch: file shorter than map of length %#zx", (uint8_t *)&__ptr, 0xCu);
      }
      v44 = 2;
LABEL_51:

    }
  }
  fclose(v42);
LABEL_62:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v55, CFSTR("filecmp"));

  v56 = objc_retainAutorelease(v67);
  CSStore2::Store::_Create((CSStore2 *)buf, (Bytef *)objc_msgSend(v56, "bytes"), (void *)objc_msgSend(v56, "length"), 1, 0, 0);
  v57 = *(CSStore2 ***)buf;
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&__ptr = MEMORY[0x1E0C809B0];
    *((_QWORD *)&__ptr + 1) = 3221225472;
    v75 = ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke;
    v76 = &unk_1E4E21A28;
    v78 = *(_QWORD *)buf;
    v58 = v69;
    v77 = v58;
    CSStore2::Store::enumerateTables(v57, &__ptr);
    CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)v57, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v60, CFSTR("string$"));

  }
  v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v68, "domain");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v68, "code");
  v64 = (void *)objc_msgSend(v69, "copy");
  v13 = (void *)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, v63, v64);

  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)buf, 0);
LABEL_8:

  v17 = 0;
  v18 = v11;
LABEL_10:

  v20 = (void *)MEMORY[0x1A85AA4B4]();
  v21 = v10 == 0;
  if (v17)
    v21 = 1;
  if (!v21)
  {
    if (v13)
    {
      objc_msgSend(v13, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x1E0CB3308];
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3308]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
      {
        objc_msgSend(v13, "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v10, v23);
        v28 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "domain");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, objc_msgSend(v13, "code"), v27);
        v30 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v30;
      }
    }
  }
  objc_autoreleasePoolPop(v20);
  if (v17)
    v31 = 0;
  else
    v31 = objc_retainAutorelease(v13);

  v32 = v31;
  v33 = v70;
  if (v70)
  {
    v34 = (_CSStore *)objc_msgSend(v7, "initByMovingStore:", v70);
    if (!v6)
      goto LABEL_25;
  }
  else
  {

    v34 = 0;
    if (!v6)
      goto LABEL_25;
  }
  if (!v34)
  {
    *v6 = objc_retainAutorelease(v32);
    v33 = v70;
  }
LABEL_25:
  if (v33)
  {

    MEMORY[0x1A85AA130](v33, 0x10A0C4017B00345);
  }

  return v34;
}

- (_CSStore)initWithCoder:(id)a3
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  id *v9;
  id *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  _CSStore *v17;
  void *v18;
  id v20;
  id *v21;
  _QWORD v22[2];
  id *v23[3];

  v23[2] = *(id **)MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      goto LABEL_3;
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSStore.mm"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder isKindOfClass:[NSXPCCoder class]]"));

  if (!self)
    goto LABEL_16;
LABEL_3:
  v20 = 0;
  v6 = v5;
  v7 = CFSTR("XPCRepresentation");
  v21 = 0;
  if (!v6)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22[0] = *MEMORY[0x1E0CB2938];
    v22[1] = CFSTR("Line");
    v23[0] = (id *)CFSTR("paramErr");
    v23[1] = (id *)&unk_1E4E25088;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    v10 = 0;
    v13 = 1;
LABEL_10:
    v12 = objc_retainAutorelease(v11);
    v20 = v12;
    goto LABEL_11;
  }
  objc_msgSend(v6, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812E8], CFSTR("XPCRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_9;
  }
  CSStore2::Store::CreateWithXPCObject(v23, v8, &v20);
  v9 = v23[0];
  v23[0] = 0;
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&v21, v9);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](v23, 0);
  v10 = v21;

  v11 = 0;
  v12 = 0;
  v13 = v10 == 0;
  if (!v10)
    goto LABEL_10;
LABEL_11:

  v16 = v20;
  if (v13)
  {
    objc_msgSend(v6, "failWithError:", v16);

    v17 = 0;
  }
  else
  {
    v17 = -[_CSStore initByMovingStore:](self, "initByMovingStore:", v10);

    MEMORY[0x1A85AA130](v10, 0x10A0C4017B00345);
  }

LABEL_17:
  return v17;
}

- (id)initByMovingStore:(void *)a3
{
  char *v4;
  id *v5;
  BOOL v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_CSStore;
  v4 = -[_CSStore init](&v21, sel_init);
  v5 = (id *)(v4 + 8);
  if (v4)
    v6 = v5 == a3;
  else
    v6 = 1;
  if (!v6)
  {
    objc_storeStrong(v5, *(id *)a3);
    v7 = *(id *)a3;
    *(_QWORD *)a3 = 0;

    v8 = *(_OWORD *)((char *)a3 + 8);
    v9 = *(_OWORD *)((char *)a3 + 24);
    v10 = *(_OWORD *)((char *)a3 + 56);
    *((_OWORD *)v4 + 3) = *(_OWORD *)((char *)a3 + 40);
    *((_OWORD *)v4 + 4) = v10;
    *((_OWORD *)v4 + 1) = v8;
    *((_OWORD *)v4 + 2) = v9;
    v11 = *(_OWORD *)((char *)a3 + 72);
    v12 = *(_OWORD *)((char *)a3 + 88);
    v13 = *(_OWORD *)((char *)a3 + 120);
    *((_OWORD *)v4 + 7) = *(_OWORD *)((char *)a3 + 104);
    *((_OWORD *)v4 + 8) = v13;
    *((_OWORD *)v4 + 5) = v11;
    *((_OWORD *)v4 + 6) = v12;
    v14 = *(_OWORD *)((char *)a3 + 136);
    v15 = *(_OWORD *)((char *)a3 + 152);
    v16 = *(_OWORD *)((char *)a3 + 184);
    *((_OWORD *)v4 + 11) = *(_OWORD *)((char *)a3 + 168);
    *((_OWORD *)v4 + 12) = v16;
    *((_OWORD *)v4 + 9) = v14;
    *((_OWORD *)v4 + 10) = v15;
    v17 = *(_OWORD *)((char *)a3 + 200);
    v18 = *(_OWORD *)((char *)a3 + 216);
    v19 = *(_OWORD *)((char *)a3 + 248);
    *((_OWORD *)v4 + 15) = *(_OWORD *)((char *)a3 + 232);
    *((_OWORD *)v4 + 16) = v19;
    *((_OWORD *)v4 + 13) = v17;
    *((_OWORD *)v4 + 14) = v18;
    *((_QWORD *)v4 + 34) = *((_QWORD *)a3 + 33);
    *(_OWORD *)(v4 + 280) = *((_OWORD *)a3 + 17);
    atomic_store(0, (unint64_t *)v4 + 37);
    atomic_store(0, (unint64_t *)v4 + 38);
    *(_OWORD *)(v4 + 312) = *((_OWORD *)a3 + 19);
  }
  return v4;
}

- (void)setReadOnly:(BOOL)a3
{
  _BOOL4 v3;
  _CSStoreAccessContext *accessContext;
  _CSStoreAccessContext *v6;
  uint64_t v7;
  tableOffsets *dataContainer;
  uint64_t v9;
  uint64_t v10;
  CSStore2 *v11;
  int v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (performMutatingAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (**(void (***)(CSStoreAccessContextInterface *, SEL))accessContext->_impl.__ptr_)(accessContext->_impl.__ptr_, a2);
      if (performMutatingAssertions)
      {
        v6 = self->_accessContext;
        if (v6)
          (**(void (***)(CSStoreAccessContextInterface *))v6->_impl.__ptr_)(v6->_impl.__ptr_);
      }
    }
  }
  if (((((*(_BYTE *)&self->_store.flags & 1) == 0) ^ v3) & 1) == 0)
  {
    if (v3)
      v7 = 1;
    else
      v7 = 3;
    dataContainer = self->_store.dataContainer;
    if (dataContainer)
    {
      v9 = *((_QWORD *)dataContainer + 1);
      v10 = *((unsigned int *)dataContainer + 4);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v11 = (CSStore2 *)MEMORY[0x1A85AA814](*MEMORY[0x1E0C83DA0], v9, v10, 0, v7);
    if ((_DWORD)v11)
    {
      v12 = (int)v11;
      CSStore2::GetLog(v11);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 134218752;
        v15 = v9;
        v16 = 2048;
        v17 = v10;
        v18 = 2048;
        v19 = v7;
        v20 = 2048;
        v21 = v12;
        _os_log_error_impl(&dword_1A4E5A000, v13, OS_LOG_TYPE_ERROR, "Failed to set protection of region at %p length %zu to %lx: %lx", (uint8_t *)&v14, 0x2Au);
      }

    }
    *(_BYTE *)&self->_store.flags = *(_BYTE *)&self->_store.flags & 0xFE | v3;
  }
}

- (_CSStore)init
{
  abort();
}

- (_CSStore)initWithError:(id *)a3
{
  id v5;
  id *v6;
  _CSStore *v7;
  id v9;
  id *v10;

  v9 = 0;
  CSStore2::Store::_Create((CSStore2 *)&v10, 0, 0, 0, 0, &v9);
  v5 = v9;
  v6 = v10;
  if (v10)
  {
    v7 = -[_CSStore initByMovingStore:](self, "initByMovingStore:", v10);
    if (!a3)
      goto LABEL_7;
  }
  else
  {

    v7 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v7)
    *a3 = objc_retainAutorelease(v5);
LABEL_7:
  if (v6)
  {

    MEMORY[0x1A85AA130](v6, 0x10A0C4017B00345);
  }

  return v7;
}

- (void)setAccessContext:(id)a3
{
  _CSStoreAccessContext *accessContext;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_accessContext, a3);
  accessContext = self->_accessContext;
  if (accessContext
    && (*(unsigned int (**)(CSStoreAccessContextInterface *))(*(_QWORD *)accessContext->_impl.__ptr_ + 40))(accessContext->_impl.__ptr_)
    && -[_CSStore setAccessContext:]::once != -1)
  {
    dispatch_once(&-[_CSStore setAccessContext:]::once, &__block_literal_global_120);
  }

}

- (id)description
{
  _CSStoreAccessContext *accessContext;
  void *v4;
  objc_class *v5;
  void *v6;
  tableOffsets *dataContainer;
  void *v8;

  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(_QWORD *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dataContainer = self->_store.dataContainer;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> { p = %p, gen = %llu, length = %llu/%llu/%llu }"), v6, self, *((_QWORD *)dataContainer + 1), *(unsigned int *)(*((_QWORD *)dataContainer + 1) + 8), *((unsigned int *)dataContainer + 4), *(unsigned int *)(*((_QWORD *)dataContainer + 1) + 12), *(unsigned int *)(*((_QWORD *)dataContainer + 1) + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)new
{
  abort();
}

@end
