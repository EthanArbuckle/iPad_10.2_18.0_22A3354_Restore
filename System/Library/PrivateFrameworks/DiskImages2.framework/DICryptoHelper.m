@implementation DICryptoHelper

+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  uint64_t v6;
  Backend **ptr;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  std::bad_alloc *exception;
  std::bad_alloc *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD *v30;
  uint64_t v31;

  v6 = *(_QWORD *)&a5;
  ptr = (Backend **)a3.__ptr_;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v24 = *(_QWORD *)a3.__ptr_;
  v25 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:](DICryptoHelper, "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:", &v24, a3.__cntrl_, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v11 = v25;
  if (v25)
  {
    v12 = (unint64_t *)&v25->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (!v26)
    return 0;
  v14 = (char *)malloc_type_valloc(*(_QWORD *)(v26 + 12), 0xF8ED6DDuLL);
  if (!v14)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v23 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v23, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v29[0] = &off_24CEF08B8;
  v30 = v29;
  v27 = v14;
  std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)&v28, (uint64_t)v29);
  v15 = v30;
  if (v30 == v29)
  {
    v16 = 4;
    v15 = v29;
    goto LABEL_16;
  }
  if (v30)
  {
    v16 = 5;
LABEL_16:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }
  v18 = Backend::read(*ptr, v27, *(_QWORD *)(v26 + 12), *(_QWORD *)(v26 + 4));
  if ((v18 & 0x80000000) != 0)
  {
    v20 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", v18, CFSTR("can't read crypto header"), v6);
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v27, *(_QWORD *)(v26 + 12));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)&v27);
  v21 = v26;
  v26 = 0;
  if (v21)
    MEMORY[0x2199A8A18](v21, 0x1000C40A86A77D5);
  return v19;
}

+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  crypto::auth_table_entry **v6;
  uint64_t v7;
  int cntrl;
  Backend **ptr;
  crypto::auth_table_entry **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  crypto::auth_table_entry *v17;
  id v18;

  v7 = *(_QWORD *)&a5;
  cntrl = (int)a3.__cntrl_;
  ptr = (Backend **)a3.__ptr_;
  v11 = v6;
  v12 = 20 * SLODWORD(a3.__cntrl_);
  v13 = (void *)operator new[]();
  bzero(v13, v12);
  v14 = Backend::read(*ptr, (char *)v13, v12, 76);
  if ((v14 & 0x80000000) != 0)
  {
    v18 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", v14, CFSTR("can't read crypto header"), v7);
  }
  else if (cntrl >= 1)
  {
    v15 = cntrl;
    v16 = (const char *)v13;
    while (1)
    {
      v17 = (crypto::auth_table_entry *)operator new();
      crypto::auth_table_entry::auth_table_entry(v17, v16);
      *v11 = v17;
      if (*(_DWORD *)v17 == a4)
        break;
      *v11 = 0;
      MEMORY[0x2199A8A18](v17, 0x1000C40A86A77D5);
      v16 += 20;
      if (!--v15)
        goto LABEL_8;
    }
LABEL_9:
    JUMPOUT(0x2199A8A00);
  }
LABEL_8:
  *v11 = 0;
  goto LABEL_9;
}

+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  BOOL v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;

  v7 = a3;
  v8 = v7;
  v30 = 0;
  v31 = 0;
  if (v7)
  {
    objc_msgSend(v7, "getCryptoHeaderBackend");
    v10 = v28;
    v9 = v29;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v30 = v10;
  v31 = v9;
  v11 = *(unsigned int *)(*(_QWORD *)objc_msgSend(v8, "cryptoHeader") + 72);
  v26 = v10;
  v27 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v25 = 0;
  +[DICryptoHelper getAuthValueWithBackend:authTableNumEntries:mechanism:error:](DICryptoHelper, "getAuthValueWithBackend:authTableNumEntries:mechanism:error:", &v26, v11, 9, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  v16 = v27;
  if (!v27)
    goto LABEL_11;
  v17 = (unint64_t *)&v27->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_11:
    if (v14)
    {
LABEL_12:
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
      v20 = +[DIKeyRetriever decryptKeyWithData:destKey:destKeySize:error:](DIKeyRetriever, "decryptKeyWithData:destKey:destKeySize:error:", v19, a4, 88, a5);

      goto LABEL_13;
    }
  }
  if (v15)
  {
    v20 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    v20 = 1;
  }
LABEL_13:

  v21 = v31;
  if (v31)
  {
    v22 = (unint64_t *)&v31->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v20;
}

+ (BOOL)validateWithPubKeyHeader:(void *)a3
{
  return *(_DWORD *)a3 <= 0x20u && *((_DWORD *)a3 + 12) < 0x201u;
}

+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  Backend *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::bad_alloc *exception;
  std::bad_alloc *v27;
  Backend *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  Backend *v31;
  std::__shared_weak_count *v32;
  _QWORD v33[3];
  _QWORD *v34;
  char *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *(unsigned int *)(*(_QWORD *)objc_msgSend(v7, "cryptoHeader") + 72);
  v31 = 0;
  v32 = 0;
  if (v7)
  {
    objc_msgSend(v7, "getCryptoHeaderBackend");
    v10 = (Backend *)v33[0];
    v9 = (std::__shared_weak_count *)v33[1];
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v31 = v10;
  v32 = v9;
  v28 = v10;
  v29 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:](DICryptoHelper, "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:", &v28, v8, 2, a5);
  v13 = v29;
  if (v29)
  {
    v14 = (unint64_t *)&v29->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (!v30)
  {
    v19 = 0;
    goto LABEL_25;
  }
  v16 = (char *)malloc_type_valloc(*(_QWORD *)(v30 + 12), 0xF8ED6DDuLL);
  if (!v16)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v27 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v27, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v33[0] = &off_24CEF08B8;
  v34 = v33;
  v35 = v16;
  std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)v36, (uint64_t)v33);
  v17 = v34;
  if (v34 == v33)
  {
    v18 = 4;
    v17 = v33;
  }
  else
  {
    if (!v34)
      goto LABEL_20;
    v18 = 5;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v18))(v17);
LABEL_20:
  v20 = Backend::read(v31, v35, 564, *(_QWORD *)(v30 + 4));
  if ((_DWORD)v20 == 564)
  {
    crypto::public_key_header::public_key_header((crypto::public_key_header *)v33, v35);
    std::optional<crypto::public_key_header>::operator=[abi:ne180100]<crypto::public_key_header,void>((uint64_t)a4, (uint64_t)v33);
    v19 = 1;
  }
  else
  {
    v19 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", v20, CFSTR("Error while creating public key header"), a5, v28);
  }
  std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)&v35);
  v21 = v30;
  v30 = 0;
  if (v21)
    MEMORY[0x2199A8A18](v21, 0x1000C40A86A77D5);
LABEL_25:
  v22 = v32;
  if (v32)
  {
    v23 = (unint64_t *)&v32->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  return v19;
}

+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFDictionary *v13;
  BOOL v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)a3 + 4, *(unsigned int *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = *MEMORY[0x24BDE9028];
  v16[0] = *MEMORY[0x24BDE9220];
  v16[1] = v9;
  v10 = *MEMORY[0x24BDE9030];
  v17[0] = *MEMORY[0x24BDE9248];
  v17[1] = v10;
  v11 = *MEMORY[0x24BDE94D8];
  v16[2] = *MEMORY[0x24BDE8FB0];
  v16[3] = v11;
  v17[2] = v7;
  v17[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v12);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (SecItemCopyMatching(v13, (CFTypeRef *)a4))
    v14 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Couldn't find item in keychain"), a5);
  else
    v14 = 1;

  return v14;
}

+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  const __CFData *v7;
  _BOOL8 v8;
  __SecCertificate *v9;
  __SecCertificate *v10;
  id v11;

  v7 = (const __CFData *)a3;
  LOBYTE(v8) = 1;
  if (v7 && a4)
  {
    v9 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
    v10 = v9;
    if (v9)
    {
      *a4 = SecCertificateCopyKey(v9);
      CFRelease(v10);
      if (*a4)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        v11 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("public key has an encoding issue or uses an unsupported algorithm"), a5);
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      v8 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("not a valid DER-encoded X.509 certificate"), a5);
    }
  }

  return v8;
}

@end
