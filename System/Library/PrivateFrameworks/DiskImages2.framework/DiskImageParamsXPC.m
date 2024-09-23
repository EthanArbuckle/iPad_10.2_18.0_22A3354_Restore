@implementation DiskImageParamsXPC

+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  ReadSynchronizerBackendXPC *v10;
  DiskImageParamsRAM_XPC *v11;
  DiskImageParamsPlugin_XPC *v12;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  ReadSynchronizerBackendXPC *v24;
  char v25;
  int v26;
  NSObject *v27;
  void *v28;
  char *v29;
  void *v30;
  int v31;
  PluginBackendXPC *v32;
  uint64_t v33;
  const __CFString *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _QWORD *p_lpsrc;
  std::__shared_weak_count *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  char v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint8_t *v52;
  uint64_t v53;
  void *lpsrc;
  std::__shared_weak_count *v55;
  size_t v56;
  DiskImageParamsPlugin_XPC *v57;
  uint8_t buf[8];
  _BYTE v59[10];
  __int16 v60;
  void *v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v6 = *(_QWORD *)&a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ram"));

  if (v9)
  {
    v10 = 0;
    v11 = -[DiskImageParamsRAM_XPC initWithURL:error:]([DiskImageParamsRAM_XPC alloc], "initWithURL:error:", v7, a5);
LABEL_3:
    v12 = (DiskImageParamsPlugin_XPC *)v11;
    goto LABEL_4;
  }
  objc_msgSend(v7, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("knox"));

  if (!v15)
  {
    if (!objc_msgSend(v7, "isFileURL"))
    {
      objc_msgSend(v7, "scheme");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("plugin"));

      if (v31)
      {
        v32 = -[PluginBackendXPC initWithURL:openMode:]([PluginBackendXPC alloc], "initWithURL:openMode:", v7, v6);
        v12 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsPlugin_XPC alloc], "initWithBackendXPC:", v32);
        v10 = (ReadSynchronizerBackendXPC *)v32;
        goto LABEL_4;
      }
      v10 = 0;
      +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Unsupported URL scheme"), a5);
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v10 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:](BackendXPC, "newFileBackendWithURL:fileOpenFlags:error:", v7, v6, a5);
    if (!v10)
    {
      v12 = 0;
      goto LABEL_4;
    }
    v26 = *__error();
    if (DIForwardLogs())
    {
      lpsrc = 0;
      getDIOSLog();
      v27 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v7, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158467;
      *(_DWORD *)&buf[4] = 53;
      *(_WORD *)v59 = 2080;
      *(_QWORD *)&v59[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
      v60 = 2113;
      v61 = v28;
      v62 = 1024;
      v63 = v6;
      LODWORD(v53) = 34;
      v52 = buf;
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v29);
        free(v29);
      }
    }
    else
    {
      getDIOSLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "path");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158467;
        *(_DWORD *)&buf[4] = 53;
        *(_WORD *)v59 = 2080;
        *(_QWORD *)&v59[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
        v60 = 2113;
        v61 = v42;
        v62 = 1024;
        v63 = v6;
        _os_log_impl(&dword_212EB0000, v41, OS_LOG_TYPE_DEFAULT, "%.*s: Image file %{private}@ opened with flags %d", buf, 0x22u);

      }
    }
    *__error() = v26;
    -[BackendXPC backend](v10, "backend");
    if (lpsrc
    {
      *(_QWORD *)buf = v43;
      *(_QWORD *)v59 = v55;
      p_lpsrc = &lpsrc;
    }
    else
    {
      p_lpsrc = buf;
    }
    *p_lpsrc = 0;
    p_lpsrc[1] = 0;
    v45 = v55;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        v47 = __ldaxr(p_shared_owners);
      while (__stlxr(v47 - 1, p_shared_owners));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    v12 = *(DiskImageParamsPlugin_XPC **)buf;
    if (*(_QWORD *)buf && FileDescriptor::is_device(*(FileDescriptor **)(*(_QWORD *)buf + 40)))
    {
      v12 = -[DiskImageParamsXPC initWithBackendXPC:blockSize:]([DiskImageParamsRaw_XPC alloc], "initWithBackendXPC:blockSize:", v10, v12->super._cacheURL->_clients);
      v48 = 0;
    }
    else
    {
      v48 = 1;
    }
    v49 = *(std::__shared_weak_count **)v59;
    if (*(_QWORD *)v59)
    {
      v50 = (unint64_t *)(*(_QWORD *)v59 + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    if ((v48 & 1) != 0)
      goto LABEL_56;
    goto LABEL_4;
  }
  v16 = operator new[]();
  std::shared_ptr<char>::shared_ptr[abi:ne180100]<char,std::default_delete<char []>,void>(buf, v16);
  v56 = 0;
  v57 = *(DiskImageParamsPlugin_XPC **)buf;
  v17 = operator new[]();
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>(&lpsrc, v17);
  objc_msgSend(v7, "absoluteString");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "UTF8String");
  v20 = AAS3KnoxResolveURL(v19, 0, &v57, 0x20uLL, lpsrc, &v56, 0);

  if (v20 < 0)
  {
    v33 = *__error();
    v34 = CFSTR("Error with resolving knox url");
LABEL_18:
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", v33, v34, a5);
    v12 = (DiskImageParamsPlugin_XPC *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v10 = 0;
    goto LABEL_19;
  }
  if (v56 != 32)
  {
    v34 = CFSTR("Error with decryption key size");
    v33 = 22;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v57);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v22);

  v24 = [ReadSynchronizerBackendXPC alloc];
  v12 = -[KNOXBackendXPC initWithURL:key:]([KNOXBackendXPC alloc], "initWithURL:key:", v23, &lpsrc);
  v10 = -[ReadSynchronizerBackendXPC initWithBackend:](v24, "initWithBackend:", v12);

  v25 = 1;
  v7 = v23;
LABEL_19:
  v35 = v55;
  if (v55)
  {
    v36 = (unint64_t *)&v55->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v38 = *(std::__shared_weak_count **)v59;
  if (*(_QWORD *)v59)
  {
    v39 = (unint64_t *)(*(_QWORD *)v59 + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  if ((v25 & 1) != 0)
  {
    if (!v10)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Error creating backendXPC"), a5);
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_56:
    if (-[BackendXPC tryCreatingCryptoHeader](v10, "tryCreatingCryptoHeader", v52, v53))
      v11 = -[DiskImageParamsLocked_XPC initWithBackendXPC:]([DiskImageParamsLocked_XPC alloc], "initWithBackendXPC:", v10);
    else
      v11 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:error:](DiskImageParamsXPC, "newWithUnlockedBackendXPC:error:", v10, a5);
    goto LABEL_3;
  }
LABEL_4:

  return v12;
}

+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  Backend *v7;
  udsp_header *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  BOOL v11;
  Backend *v13;
  std::__shared_weak_count *v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backend");
    v7 = v13;
  }
  else
  {
    v7 = 0;
    v14 = 0;
  }
  v8 = (udsp_header *)operator new();
  udsp_header::udsp_header(v8, v7);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v11 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 45, CFSTR("sparseimage format is not supported by DiskImages2 framework"), a4);
  MEMORY[0x2199A8A18](v8, 0x1000C40FA0F61DDLL);

  return v11;
}

+ (BOOL)getAEAKeyFromSAKSWithMetadata:(id)a3 key:(char *)a4 error:(id *)a5
{
  id v7;
  BOOL v8;
  CC_LONG v9;
  char v11[88];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = +[DIKeyRetriever decryptKeyWithData:destKey:destKeySize:error:](DIKeyRetriever, "decryptKeyWithData:destKey:destKeySize:error:", v7, v11, 88, a5);
  if (v8)
  {
    v9 = strnlen(v11, 0x58uLL);
    CC_SHA256(v11, v9, (unsigned __int8 *)a4);
  }

  return v8;
}

+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v6;
  _QWORD v8[11];
  id *v9;
  unint64_t v10;
  char *v11;
  id v12;
  _QWORD *v13;

  v11 = a4;
  v12 = a1;
  v9 = a6;
  v10 = a5;
  v8[0] = &v11;
  v8[1] = &v10;
  v8[2] = &v9;
  v8[3] = &v12;
  v8[4] = &v11;
  v8[5] = &v9;
  v8[6] = &v11;
  v8[7] = &v10;
  v8[8] = &v9;
  v8[9] = &v11;
  v8[10] = &v10;
  v6 = *((unsigned int *)a3 + 10);
  if ((_DWORD)v6 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v13 = v8;
  return ((uint64_t (*)(_QWORD **, char *))off_24CEEDA38[v6])(&v13, (char *)a3 + 8);
}

+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  AEABackendXPC *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  AEABackendXPC *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  AEAAuthData v28[6];
  __int128 v29;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "backend");
    v8 = *(_OWORD *)v28;
  }
  else
  {
    v8 = 0uLL;
  }
  v29 = v8;
  AEAHelper::AEAHelper(v28, &v29);
  v9 = operator new[]();
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>(&v26, v9);
  if ((objc_msgSend(a1, "getAEAKeyWithHelper:keyBuffer:bufferSize:error:", v28, v26, 32, a4) & 1) != 0)
  {
    v10 = [AEABackendXPC alloc];
    v24 = v26;
    v25 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    v13 = -[AEABackendXPC initWithBackend:key:](v10, "initWithBackend:key:", v7, &v24);
    v14 = v25;
    if (v25)
    {
      v15 = (unint64_t *)&v25->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::unique_ptr<unsigned char []>,AEAHelper::saks_metadata_t,AEAHelper::kms_t,AEAHelper::wkms_t>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28[1]);
  AEAwrapper::AuthData::~AuthData(v28);
  v20 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v13;
}

+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void **p_lpsrc;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  int v12;
  int v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD *exception;
  const std::error_category *v20;
  void *lpsrc;
  std::__shared_weak_count *v22;
  void *v23;
  std::__shared_weak_count *v24;
  AAByteStream v25;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    lpsrc = 0;
    v22 = 0;
LABEL_6:
    p_lpsrc = &v23;
    goto LABEL_7;
  }
  objc_msgSend(v5, "backend");
  if (!lpsrc)
    goto LABEL_6;
  if (!v7)
    goto LABEL_6;
  v23 = v7;
  v24 = v22;
  p_lpsrc = &lpsrc;
LABEL_7:
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v9 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!v23)
    goto LABEL_15;
  v12 = (*(uint64_t (**)(void *))(*(_QWORD *)v23 + 176))(v23);
  v25 = AAFileStreamOpenWithFD(v12, 0);
  AEAwrapper::ByteStream::ByteStream(&lpsrc, &v25);
  if (AEAwrapper::ByteStream::pread((AAByteStream *)&lpsrc, &v25, 4uLL, 0) < 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_24CF07908;
    v20 = std::generic_category();
    exception[1] = 22;
    exception[2] = v20;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "is_aea: Error reading magic.";
  }
  v13 = (int)v25;
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)&lpsrc);
  if (v13 == 826361153)
  {
    +[DiskImageParamsXPC createAEABackendWithBackendXPC:error:](DiskImageParamsXPC, "createAEABackendWithBackendXPC:error:", v6, a4);
    v14 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_15:
    v14 = 0;
  }
  v15 = v24;
  if (v24)
  {
    v16 = (unint64_t *)&v24->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return v6;
}

+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4
{
  id v6;
  DiskImageParamsSparseBundle_XPC *v7;
  void *v8;
  di_asif::header *v9;
  uint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  std::__shared_weak_count *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsSparseBundle_XPC alloc], "initWithBackendXPC:", v6);
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "tryCreateAEABackendWithBackendXPC:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "backend");
      v9 = (di_asif::header *)operator new();
      di_asif::header::header(v9, (Backend *)v14[1]);
      if (v15)
      {
        p_shared_owners = &v15->__shared_owners_;
        do
          v11 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v11 - 1, (unint64_t *)p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v14[0] = v9;
      v7 = -[DiskImageParamsASIF_XPC initWithBackendXPC:header:]([DiskImageParamsASIF_XPC alloc], "initWithBackendXPC:header:", v8, v14);
      v12 = v14[0];
      v14[0] = 0;
      if (v12)
        MEMORY[0x2199A8A18](v12, 0x1000C404247E4FDLL);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSURL)cacheURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *cacheURL;

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBaseImageCache");

  if (v4)
  {
    -[DiskImageParamsXPC shadowChain](self, "shadowChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    cacheURL = self->_cacheURL;
    self->_cacheURL = v8;

  }
  return self->_cacheURL;
}

- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", 0, v6, 1, a4);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v8);

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v9 != 0;

  return (char)a4;
}

- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", a3, v8, 1, a5);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v10);

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = v11 != 0;

  return (char)a5;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4
{
  id v7;
  DiskImageParamsXPC *v8;
  DiskImageParamsXPC *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DiskImageParamsXPC;
  v8 = -[DiskImageParamsXPC init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backendXPC, a3);
    v9->_blockSize = a4;
  }

  return v9;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3
{
  return -[DiskImageParamsXPC initWithBackendXPC:blockSize:](self, "initWithBackendXPC:blockSize:", a3, 512);
}

- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7
{
  uint64_t *v7;
  unint64_t v8;
  int v9;
  __shared_weak_count *cntrl;
  Backend **ptr;
  uint64_t *v13;
  int v14;
  DiskImage *v15;
  __shared_weak_count *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  DiskImage *v20;
  uint64_t v21;
  __int128 *p_identifier;
  void *exception;
  _QWORD *v24;
  const std::error_category *v25;
  _QWORD *v26;
  const std::error_category *v27;
  uint64_t v28;
  __int128 v29;
  __shared_weak_count *v30;
  unint64_t v31;
  char v32;
  _BYTE v33[11];
  uint64_t identifier;
  uint64_t v35;
  __int128 v36[16];
  uint64_t v37;
  shared_ptr<DiskImage> result;

  v8 = a6;
  v9 = (int)a5;
  cntrl = a3.__cntrl_;
  ptr = (Backend **)a3.__ptr_;
  v13 = v7;
  v37 = *MEMORY[0x24BDAC8D0];
  if ((*(uint64_t (**)(unint64_t, SEL))(*(_QWORD *)a4 + 24))(a4, a2) != 512)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"Shadow file cannot be used with a ", 34);
    (*(void (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"-bytes block size", 17);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v36, 0x13u);
  }
  v32 = 0;
  *(_DWORD *)&v33[7] = 0;
  *(_QWORD *)v33 = 256;
  v14 = *((_DWORD *)system_properties::get_resources((system_properties *)0x200) + 8);
  *(_DWORD *)&v33[3] = (v14 - (v8 > 3)) & ~((v14 - (v8 > 3)) >> 31);
  v33[7] = 1;
  if ((*(uint64_t (**)(Backend *))(*(_QWORD *)*ptr + 40))(*ptr))
  {
    di_asif::header::header((di_asif::header *)v36, *ptr);
    v15 = (DiskImage *)std::allocate_shared[abi:ne180100]<DiskImageASIF,std::allocator<DiskImageASIF>,std::shared_ptr<Backend> &,di_asif::header &,di_asif::options &,void>((DiskImageASIF **)ptr, (Backend *)v36, (uint64_t)&v32, &identifier);
    if (((((*(_BYTE *)(identifier + 44) & 1) == 0) ^ v9) & 1) == 0)
    {
      v24 = __cxa_allocate_exception(0x40uLL);
      *v24 = &off_24CF07908;
      v25 = std::generic_category();
      v24[1] = 22;
      v24[2] = v25;
      *((_BYTE *)v24 + 24) = 0;
      *((_BYTE *)v24 + 48) = 0;
      v24[7] = "Shadow/cache file mismatches the cache file attribute";
    }
    v17 = v35;
    *v13 = identifier;
    v13[1] = v17;
  }
  else
  {
    v31 = 0;
    v18 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
    v19 = 0x10000000000000 / v18;
    v30 = 0;
    v31 = 0x10000000000000 / v18;
    if (!cntrl)
    {
      v18 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 32))(a4);
      cntrl = (__shared_weak_count *)v18;
      v19 = v31;
    }
    v30 = cntrl;
    if ((unint64_t)cntrl > v19)
    {
      v26 = __cxa_allocate_exception(0x40uLL);
      *v26 = &off_24CF07908;
      v27 = std::generic_category();
      v26[1] = 22;
      v26[2] = v27;
      *((_BYTE *)v26 + 24) = 0;
      *((_BYTE *)v26 + 48) = 0;
      v26[7] = "Size cannot exceed max ASIF size";
    }
    *(_QWORD *)&v36[0] = di_utils::random_uuid((di_utils *)v18);
    *((_QWORD *)&v36[0] + 1) = v20;
    identifier = di_stackable::get_identifier((di_stackable *)a4, v20);
    v35 = v21;
    v28 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
    v33[0] = v9;
    if (v9)
      p_identifier = (__int128 *)&identifier;
    else
      p_identifier = v36;
    std::allocate_shared[abi:ne180100]<DiskImageASIF,std::allocator<DiskImageASIF>,unsigned long,unsigned int const&,unsigned long long &,unsigned long long &,std::shared_ptr<Backend> &,di_asif::options &,boost::uuids::uuid const&,boost::uuids::uuid const&,void>((unsigned __int16 *)&v28, &di_asif::chunk_size_default, (unint64_t *)&v30, &v31, (uint64_t)ptr, (uint64_t *)&v32, p_identifier, &v29, v36);
    v15 = (DiskImage *)DiskImageASIF::set_stackable_source_identifier(v29, (uint64_t)&identifier);
    *(_OWORD *)v13 = v29;
  }
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3
{
  void *v3;
  char v4;
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[DiskImageParamsXPC shadowChain](self, "shadowChain", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBaseImageCache");

  if ((v4 & 1) == 0)
  {
    v5 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v11 = 56;
      v12 = 2080;
      v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
      v7 = (char *)_os_log_send_and_compose_impl();

      if (v7)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v7);
        free(v7);
      }
    }
    else
    {
      getDIOSLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v11 = 56;
        v12 = 2080;
        v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
        _os_log_impl(&dword_212EB0000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache is not supported on embedded systems", buf, 0x12u);
      }

    }
    *__error() = v5;
  }
  return 0;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  _QWORD *v4;
  _BOOL4 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = a3;
  v6 = v4;
  -[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:](self, "createDiskImageWithCache:shadowValidation:", 0, 0);
  v7 = v10;
  if (v5)
    v8 = 7;
  else
    v8 = 0;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(&v10, v10, v8);
  *v6 = v10;
  return (unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
}

- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4
{
  _QWORD *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  std::__shared_weak_count *v10;
  di_stackable *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  di_stackable *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  int v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  DiskImage *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  char *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  unint64_t *v52;
  unint64_t v53;
  di_stackable *v54;
  void *v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  uint64_t v75;
  int v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  _QWORD *exception;
  const std::error_category *v84;
  _BYTE *v85;
  uint64_t v86;
  _BOOL4 v87;
  _QWORD *v88;
  _BOOL4 v89;
  id obj;
  uint64_t v92;
  std::__shared_weak_count *v93;
  __int128 v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  di_stackable *v103;
  std::__shared_weak_count *v104;
  di_stackable *v105;
  std::__shared_weak_count *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  di_stackable *v110;
  _BYTE buf[20];
  void *v112;
  uint64_t identifier;
  uint64_t v114;
  char v115[16];
  int v116;
  _BYTE v117[128];
  uint64_t v118;

  v87 = a4;
  v5 = a3;
  v88 = v4;
  v118 = *MEMORY[0x24BDAC8D0];
  -[DiskImageParamsXPC createSinkDiskImage](self, "createSinkDiskImage");
  v89 = v5
     && -[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:](self, "allowOnDiskCacheWithSinkDiskImage:", &v110);
  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    if (v89)
      goto LABEL_6;
LABEL_11:
    *v88 = v110;
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v6;
  }
  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmpty");

  if (((v9 ^ 1 | v89) & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v105 = v110;
  if (v110)
  {
    v10 = (std::__shared_weak_count *)operator new();
    v11 = v110;
    v10->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_24CEEED20;
    v10->__shared_weak_owners_ = 0;
    v10[1].__vftable = (std::__shared_weak_count_vtbl *)v11;
    v106 = v10;
    v110 = 0;
    v103 = v105;
    v104 = v10;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  else
  {
    v106 = 0;
    v110 = 0;
    v103 = 0;
    v104 = 0;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nodes");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v100 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v18, "fileBackend");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "backend");
        }
        else
        {
          v97 = 0;
          v98 = 0;
        }
        v21 = objc_msgSend(v18, "numBlocks");
        v22 = v103;
        v23 = objc_msgSend(v18, "isCache");
        -[DiskImageParamsXPC shadowChain](self, "shadowChain");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "nodes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v97, v21, v22, v23, objc_msgSend(v25, "count") + 1);

        v26 = v98;
        if (v98)
        {
          v27 = (unint64_t *)&v98->__shared_owners_;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }

        if ((objc_msgSend(v18, "isCache") & 1) != 0)
        {
          v29 = 2;
        }
        else
        {
          v29 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)buf + 40))(*(_QWORD *)buf) ^ 1;
          std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v103, (uint64_t *)buf);
        }
        *(_OWORD *)v115 = *(_OWORD *)buf;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        v116 = v29;
        std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::insert(&v107, v107, (__n128 *)v115);
        v30 = *(std::__shared_weak_count **)&v115[8];
        if (*(_QWORD *)&v115[8])
        {
          v31 = (unint64_t *)(*(_QWORD *)&v115[8] + 8);
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v33 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v34 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
    }
    while (v15);
  }

  if (v89)
  {
    if (!confstr(65538, v115, 0x400uLL))
    {
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_24CF07908;
      v84 = std::generic_category();
      exception[1] = 2;
      exception[2] = v84;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Could not determine cache dir";
    }
    identifier = 0;
    v114 = 0;
    identifier = di_stackable::get_identifier(v105, v36);
    v114 = v37;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    if (identifier | v37)
    {
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &identifier);
    }
    else
    {
      -[DiskImageParamsXPC instanceID](self, "instanceID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("diskimage_"), v39, CFSTR("cache"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v115, 1, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URLByAppendingPathComponent:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageParamsXPC setCacheURL:](self, "setCacheURL:", v42);

    v43 = *__error();
    if (DIForwardLogs())
    {
      v95 = 0;
      getDIOSLog();
      v44 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
      -[DiskImageParamsXPC cacheURL](self, "cacheURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 64;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
      *(_WORD *)&buf[18] = 2114;
      v112 = v46;
      LODWORD(v86) = 28;
      v85 = buf;
      v47 = (char *)_os_log_send_and_compose_impl();

      if (v47)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v47);
        free(v47);
      }
    }
    else
    {
      getDIOSLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        -[DiskImageParamsXPC cacheURL](self, "cacheURL");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 64;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
        *(_WORD *)&buf[18] = 2114;
        v112 = v50;
        _os_log_impl(&dword_212EB0000, v48, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache path: %{public}@", buf, 0x1Cu);

      }
    }
    *__error() = v43;
    -[DiskImageParamsXPC cacheURL](self, "cacheURL");
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)buf = objc_msgSend(v51, "fileSystemRepresentation");
    std::allocate_shared[abi:ne180100]<PurgeableFileBackend,std::allocator<PurgeableFileBackend>,char const*,void>((char **)buf, &v95);

    v92 = v95;
    v93 = v96;
    if (v96)
    {
      v52 = (unint64_t *)&v96->__shared_owners_;
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
    v54 = v105;
    -[DiskImageParamsXPC shadowChain](self, "shadowChain", v85, v86);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "nodes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v92, 0, v54, 1, objc_msgSend(v56, "count") + 1);

    v57 = v93;
    if (v93)
    {
      v58 = (unint64_t *)&v93->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    *(_OWORD *)buf = v94;
    v94 = 0uLL;
    *(_DWORD *)&buf[16] = 2;
    std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::emplace_back<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>(&v107, (uint64_t)buf);
    v60 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v61 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
    v63 = (std::__shared_weak_count *)*((_QWORD *)&v94 + 1);
    if (*((_QWORD *)&v94 + 1))
    {
      v64 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    v66 = v96;
    if (v96)
    {
      v67 = (unint64_t *)&v96->__shared_owners_;
      do
        v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }

  }
  v69 = (*(uint64_t (**)(di_stackable *))(*(_QWORD *)v105 + 40))(v105) ^ 1;
  if (v107 != v108)
    v69 = 1;
  *(_QWORD *)v115 = v105;
  *(_QWORD *)&v115[8] = v106;
  if (v106)
  {
    v70 = (unint64_t *)&v106->__shared_owners_;
    do
      v71 = __ldxr(v70);
    while (__stxr(v71 + 1, v70));
  }
  v116 = v69;
  std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::emplace_back<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>(&v107, (uint64_t)v115);
  v72 = *(std::__shared_weak_count **)&v115[8];
  if (*(_QWORD *)&v115[8])
  {
    v73 = (unint64_t *)(*(_QWORD *)&v115[8] + 8);
    do
      v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
  v75 = operator new();
  if (v87)
    v76 = 2;
  else
    v76 = 1;
  LODWORD(v95) = v76;
  identifier = 0x200000001;
  smart_enums::validators::flags<unsigned int>((uint64_t)"config_t", v76, (int *)&identifier, 2);
  DiskImageStackable::DiskImageStackable(v75, &v107, &v95);
  *v88 = v75;
  v77 = v104;
  if (v104)
  {
    v78 = (unint64_t *)&v104->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }
  v80 = v106;
  if (v106)
  {
    v81 = (unint64_t *)&v106->__shared_owners_;
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  *(_QWORD *)v115 = &v107;
  std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::__destroy_vector::operator()[abi:ne180100]((void ***)v115);
  v6 = (uint64_t)v110;
  v110 = 0;
  if (v6)
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v6;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  return (*(uint64_t (**)(_QWORD, unint64_t))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3, a4);
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  _QWORD *v2;

  *v2 = 0;
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)self;
}

- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  if (-[DiskImageParamsXPC isWritableFormat](self, "isWritableFormat") || !v5)
  {
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "lock");

    if ((_DWORD)v8)
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v8, CFSTR("Failed locking the image"), a4);
  }
  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[DiskImageParamsXPC shadowChain](self, "shadowChain", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "fileBackend");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "lock");

          if ((_DWORD)v17)
          {
            v18 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v17, CFSTR("Failed locking the shadow file"), a4);

            return v18;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  return 1;
}

- (BOOL)lockBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 0, a3);
}

- (BOOL)lockWritableBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 1, a3);
}

- (BOOL)isWritableFormat
{
  return 0;
}

- (BOOL)isSparseFormat
{
  return 0;
}

- (unint64_t)numBlocks
{
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsXPC)initWithCoder:(id)a3
{
  id v4;
  BackendXPC *v5;
  BackendXPC *backendXPC;
  DIShadowChain *v7;
  DIShadowChain *shadowChain;
  NSUUID *v9;
  NSUUID *instanceID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backend"));
  v5 = (BackendXPC *)objc_claimAutoreleasedReturnValue();
  backendXPC = self->_backendXPC;
  self->_backendXPC = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowChain"));
  v7 = (DIShadowChain *)objc_claimAutoreleasedReturnValue();
  shadowChain = self->_shadowChain;
  self->_shadowChain = v7;

  self->_blockSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blockSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceID"));
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  instanceID = self->_instanceID;
  self->_instanceID = v9;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("backend"));

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("shadowChain"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[DiskImageParamsXPC blockSize](self, "blockSize"), CFSTR("blockSize"));
  -[DiskImageParamsXPC instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("instanceID"));

}

- (NSUUID)instanceID
{
  NSUUID *instanceID;
  void *v5;
  NSUUID *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  NSUUID *v17;
  NSUUID *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSUUID **p_instanceID;
  NSUUID *v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  instanceID = self->_instanceID;
  if (instanceID)
    return instanceID;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instanceID");
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[DiskImageParamsXPC shadowChain](self, "shadowChain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nonCacheNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      v24 = (uint64_t)&v24;
      v10 = 16 * objc_msgSend(v9, "count") + 16;
      -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", (char *)&v25[-1] - v10);
      v11 = 0;
      v12 = (char *)&v25[1] - v10;
      while (objc_msgSend(v9, "count") > v11)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fileBackend");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "instanceID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "getUUIDBytes:", v12);
        v12 += 16;
        ++v11;
      }
      v19 = objc_alloc(MEMORY[0x24BDD1880]);
      v25[0] = di_utils::buffer_to_uuid((di_utils *)((char *)&v25[-1] - v10), v10);
      v25[1] = v20;
      v21 = objc_msgSend(v19, "initWithUUIDBytes:", v25);
      v23 = self->_instanceID;
      p_instanceID = &self->_instanceID;
      *p_instanceID = (NSUUID *)v21;

      instanceID = *p_instanceID;
      return instanceID;
    }
  }
  else
  {
    v9 = 0;
  }
  v16 = self->_instanceID;
  self->_instanceID = v6;
  v17 = v6;

  v18 = self->_instanceID;
  return v18;
}

- (BOOL)mountedOnAPFS
{
  void *v2;
  void *v3;
  FileDescriptor **v4;
  void **p_lpsrc;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  BOOL is_mounted_on_apfs;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  void *lpsrc;
  std::__shared_weak_count *v20;
  FileDescriptor **v21;
  std::__shared_weak_count *v22;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "backend");
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  get_sink_backend((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    v21 = v4;
    v22 = v20;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = (void **)&v21;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v6 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = v18;
  if (v18)
  {
    v10 = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (v21)
    is_mounted_on_apfs = FileDescriptor::is_mounted_on_apfs(v21[5]);
  else
    is_mounted_on_apfs = 0;
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return is_mounted_on_apfs;
}

- (BackendXPC)backendXPC
{
  return self->_backendXPC;
}

- (void)setBackendXPC:(id)a3
{
  objc_storeStrong((id *)&self->_backendXPC, a3);
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (void)setShadowChain:(id)a3
{
  objc_storeStrong((id *)&self->_shadowChain, a3);
}

- (BackendXPC)cacheBackendXPC
{
  return self->_cacheBackendXPC;
}

- (void)setCacheBackendXPC:(id)a3
{
  objc_storeStrong((id *)&self->_cacheBackendXPC, a3);
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_cacheBackendXPC, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_backendXPC, 0);
}

@end
