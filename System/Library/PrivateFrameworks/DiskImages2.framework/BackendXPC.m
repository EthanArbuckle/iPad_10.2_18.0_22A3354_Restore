@implementation BackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BackendXPC)initWithCoder:(id)a3
{
  crypto::header_serializer *v4;
  BackendXPC *v5;
  crypto::header *v6;
  header *value;
  crypto::header *v8;
  crypto::header *v10;
  objc_super v11;

  v4 = (crypto::header_serializer *)a3;
  v11.receiver = self;
  v11.super_class = (Class)BackendXPC;
  v5 = -[BackendXPC init](&v11, sel_init);
  if (v5)
  {
    crypto::header_serializer::decode(v4, &v10);
    v6 = v10;
    v10 = 0;
    value = v5->_cryptoHeader.__ptr_.__value_;
    v5->_cryptoHeader.__ptr_.__value_ = (header *)v6;
    if (value)
    {
      MEMORY[0x2199A8A18](value, 0x1000C4015A9971DLL);
      v8 = v10;
      v10 = 0;
      if (v8)
        MEMORY[0x2199A8A18](v8, 0x1000C4015A9971DLL);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  header *value;
  id v5;

  v5 = a3;
  value = self->_cryptoHeader.__ptr_.__value_;
  if (value)
    objc_msgSend(v5, "encodeBytes:length:forKey:", value, 76, CFSTR("crypto_header"));

}

- (int)lock
{
  uint64_t (***v2)(_QWORD);
  void **p_lpsrc;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  int v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  void *lpsrc;
  std::__shared_weak_count *v18;
  uint64_t (***v19)(_QWORD);
  std::__shared_weak_count *v20;

  -[BackendXPC backend](self, "backend");
  get_sink_backend((uint64_t)&v15, &lpsrc);
  if (lpsrc
  {
    v19 = v2;
    v20 = v18;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = (void **)&v19;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v4 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = v16;
  if (v16)
  {
    v8 = (unint64_t *)&v16->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v19)
    v10 = (**v19)(v19);
  else
    v10 = 0;
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (NSUUID)instanceID
{
  id v3;
  uint64_t v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  -[BackendXPC backend](self, "backend");
  v12[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 160))(v10);
  v12[1] = v4;
  v5 = (void *)objc_msgSend(v3, "initWithUUIDBytes:", v12);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return (NSUUID *)v5;
}

- (BOOL)tryCreatingCryptoHeader
{
  BOOL v3;
  crypto::header *v4;
  header *value;
  unint64_t *p_shared_owners;
  unint64_t v7;
  Backend *v9;
  std::__shared_weak_count *v10;

  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (v9 && (unint64_t)(*(uint64_t (**)())(*(_QWORD *)v9 + 40))() >= 0x4C)
  {
    v4 = (crypto::header *)operator new();
    crypto::header::header(v4, v9);
    value = self->_cryptoHeader.__ptr_.__value_;
    self->_cryptoHeader.__ptr_.__value_ = (header *)v4;
    if (value)
      MEMORY[0x2199A8A18](value, 0x1000C4015A9971DLL);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v3;
}

- (void)cryptoHeader
{
  return &self->_cryptoHeader;
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *exception;
  const std::error_category *v9;
  __int128 v10;

  v4 = a3;
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_24CF07908;
    v9 = std::generic_category();
    exception[1] = 22;
    exception[2] = v9;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Unexpected backend replace request";
  }
  if (v4)
    objc_msgSend(v4, "backend");
  else
    v10 = 0uLL;
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&self->_backend, &v10);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

- (id)newWithCryptoFormat:(const void *)a3
{
  return -[CryptoBackendXPC initWithFormat:baseBackendXPC:]([CryptoBackendXPC alloc], "initWithFormat:baseBackendXPC:", a3, self);
}

- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = +[DICryptoHelper createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:](DICryptoHelper, "createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:", self, a3);
  if (v8)
    LOBYTE(v8) = +[DICryptoHelper getPrivateKeyWithHeader:privateKey:error:](DICryptoHelper, "getPrivateKeyWithHeader:privateKey:error:", a3, a4, a5);
  return v8;
}

- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6
{
  uint64_t v11;
  void *v12;
  unsigned int var0;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[512];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)a7.__ptr_;
  v12 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
  if (a4)
    return (keys *)crypto::keys::keys(retstr, v11, v12, a4);
  var0 = a6->var0.var0.var0;
  v15 = *(_OWORD *)a6->var0.var1.var0;
  v16 = *(_OWORD *)&a6->var0.var1.var0[16];
  v17 = *(_OWORD *)&a6->var1.var0;
  memcpy(v18, &a6->var4.var1, sizeof(v18));
  return (keys *)crypto::keys::keys(retstr, v11, v12, a5, &var0);
}

- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  unint64_t v9;
  void *v10;
  const __CFString *v11;
  BOOL v12;
  BOOL v13;

  v7 = a5;
  v9 = (unint64_t)a4;
  v10 = (void *)v9;
  if ((unint64_t)a3 | v9)
  {
    if (!v9)
    {
      if (!a3 || !*a3)
      {
        v11 = CFSTR("Passphrase cannot be empty");
        goto LABEL_11;
      }
      if (strnlen(a3, 0x101uLL) >= 0x101)
      {
        v11 = CFSTR("Passphrase is too long");
LABEL_11:
        v12 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, v11, a6);
        goto LABEL_12;
      }
    }
  }
  else if (v7)
  {
    v12 = +[DIError failWithOSStatus:description:error:](DIError, "failWithOSStatus:description:error:", 22, CFSTR("Certificate cannot be empty"), a6);
LABEL_12:
    v13 = v12;
    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6
{
  _QWORD *v6;
  _BOOL4 v9;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  format *v26;
  __shared_weak_count *v27;
  _QWORD *exception;
  const std::error_category *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *__p;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  const char *v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[512];
  _BYTE v50[20];
  __int128 v51;
  __int128 v52;
  _BYTE v53[516];
  uint64_t v54;
  shared_ptr<crypto::format> result;

  v9 = a3;
  v11 = v6;
  v54 = *MEMORY[0x24BDAC8D0];
  v44 = a4;
  v12 = a5;
  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (!v42)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_24CF07908;
    v29 = std::generic_category();
    exception[1] = 4294967291;
    exception[2] = v29;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Failed opening the crypto header backend";
  }
  v40 = 0;
  v41 = 0;
  if (!v9)
  {
    v50[0] = 0;
    v53[512] = 0;
    v39 = 0;
    if (a4)
    {
      crypto::keys::keys(&v30, v42, -[BackendXPC cryptoHeader](self, "cryptoHeader"), a4);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v37);
      v15 = v37;
      v16 = v38;
      v37 = 0;
      v38 = 0;
      v40 = v15;
      v41 = v16;
      if (__p)
      {
        v36 = __p;
        operator delete(__p);
      }
      v17 = v34;
      v34 = 0;
      if (v17)
        MEMORY[0x2199A8A18](v17, 0x1000C4015A9971DLL);
      if (v32)
      {
        v33 = v32;
        operator delete(v32);
      }
      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }
      goto LABEL_25;
    }
    if (-[BackendXPC getPrivateKeyWithHeader:privateKey:error:](self, "getPrivateKeyWithHeader:privateKey:error:", v50, &v39, a6))
    {
      v18 = v39;
      v19 = v42;
      v20 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
      v45 = *(_DWORD *)v50;
      v46 = *(_OWORD *)&v50[4];
      v47 = v51;
      v48 = v52;
      memcpy(v49, v53, sizeof(v49));
      crypto::keys::keys(&v30, v19, v20, v39, &v45);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v37);
      v15 = v37;
      v16 = v38;
      v37 = 0;
      v38 = 0;
      v40 = v15;
      v41 = v16;
      if (__p)
      {
        v36 = __p;
        operator delete(__p);
      }
      v21 = v34;
      v34 = 0;
      if (v21)
        MEMORY[0x2199A8A18](v21, 0x1000C4015A9971DLL);
      if (v32)
      {
        v33 = v32;
        operator delete(v32);
      }
      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }

      goto LABEL_25;
    }
LABEL_27:
    *v11 = 0;
    v11[1] = 0;
    goto LABEL_28;
  }
  v30 = 0;
  if (!+[DICryptoHelper getPublicKeyWithCertificate:key:error:](DICryptoHelper, "getPublicKeyWithCertificate:key:error:", v12, &v30, a6))goto LABEL_27;
  v13 = v30;
  if (!((unint64_t)a4 | (unint64_t)v30))
  {
    v22 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("No passphrase or certificate was supplied."), a6);
    goto LABEL_27;
  }
  v14 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
  std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,std::unique_ptr<crypto::header>,Backend &,char const*&,__SecKey *&,void>((uint64_t)v14, v42, &v44, &v30, v50);
  v15 = *(_QWORD *)v50;
  v16 = *(_QWORD *)&v50[8];

LABEL_25:
  *v11 = v15;
  v11[1] = v16;
  v40 = 0;
  v41 = 0;
LABEL_28:
  v23 = v43;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v7 = a5;
  v10 = a4;
  if (-[BackendXPC newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:](self, "newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:", a3, v10, v7, a6))
  {
    -[BackendXPC makeCryptoFormatWithIsNewImage:pass:certificate:error:](self, "makeCryptoFormatWithIsNewImage:pass:certificate:error:", v7, a3, v10, a6);
    if (v16)
      v11 = -[BackendXPC newWithCryptoFormat:](self, "newWithCryptoFormat:", &v16);
    else
      v11 = 0;
    v12 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isUnlocked
{
  return 0;
}

+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  __objc2_class **v13;
  void *v14;
  stat v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  dev_t st_dev;
  __int16 v23;
  __darwin_ino64_t st_ino;
  __int16 v25;
  int st_mode;
  __int16 v27;
  uid_t st_uid;
  __int16 v29;
  gid_t st_gid;
  __int16 v31;
  off_t st_size;
  __int16 v33;
  blkcnt_t st_blocks;
  uint64_t v35;

  v6 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v16))
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", *__error(), CFSTR("stat failed"), a5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      v18 = 56;
      v19 = 2080;
      *(_DWORD *)buf = 68159746;
      v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
      v21 = 1024;
      st_dev = v16.st_dev;
      v23 = 2048;
      st_ino = v16.st_ino;
      v25 = 1024;
      st_mode = v16.st_mode;
      v27 = 1024;
      st_uid = v16.st_uid;
      v29 = 1024;
      st_gid = v16.st_gid;
      v31 = 2048;
      st_size = v16.st_size;
      v33 = 2048;
      st_blocks = v16.st_blocks;
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      getDIOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 56;
        v19 = 2080;
        *(_DWORD *)buf = 68159746;
        v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
        v21 = 1024;
        st_dev = v16.st_dev;
        v23 = 2048;
        st_ino = v16.st_ino;
        v25 = 1024;
        st_mode = v16.st_mode;
        v27 = 1024;
        st_uid = v16.st_uid;
        v29 = 1024;
        st_gid = v16.st_gid;
        v31 = 2048;
        st_size = v16.st_size;
        v33 = 2048;
        st_blocks = v16.st_blocks;
        _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)", buf, 0x48u);
      }

    }
    *__error() = v9;
    if ((v16.st_mode & 0xF000) == 0x4000)
      v13 = &off_24CEEAC30;
    else
      v13 = &off_24CEEAAE8;
    v8 = objc_msgSend(objc_alloc(*v13), "initWithURL:fileOpenFlags:", v7, v6);
  }
  v14 = (void *)v8;

  return v14;
}

- (shared_ptr<Backend>)backend
{
  Backend **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Backend> result;

  cntrl = self->_backend.__cntrl_;
  *v2 = self->_backend.__ptr_;
  v2[1] = (Backend *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Backend *)self;
  return result;
}

- (void)setBackend:(shared_ptr<Backend>)a3
{
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](&self->_backend.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  header *value;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&self->_backend);
  value = self->_cryptoHeader.__ptr_.__value_;
  self->_cryptoHeader.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x2199A8A18);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
