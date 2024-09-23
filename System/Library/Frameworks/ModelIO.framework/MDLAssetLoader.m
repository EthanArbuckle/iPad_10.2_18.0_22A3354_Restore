@implementation MDLAssetLoader

- (id)loadURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  id v15;
  const char *v16;
  const char *v17;
  int v18;
  off_t st_size;
  const char *v20;
  std::string::value_type *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  stat v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v4 = a3;
  if (!sub_1DCC1CD44(v4, v5, v6))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("Could not open %@ file"), self->_extension);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v35 = 0uLL;
  v36 = 0;
  if (!objc_msgSend_isEqualToString_(self->_extension, v7, (uint64_t)CFSTR("PLY")))
  {
    objc_msgSend_path(v4, v8, v9);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend_cStringUsingEncoding_(v15, v16, 4);
    v18 = open(v17, 0);

    memset(&v30, 0, sizeof(v30));
    fstat(v18, &v30);
    st_size = v30.st_size;
    v21 = (std::string::value_type *)mmap(0, v30.st_size, 1, 2, v18, 0);
    if (v21 == (std::string::value_type *)-1)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@ file map failed"), self->_extension);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (st_size)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if (objc_msgSend_isEqualToString_(self->_extension, v20, (uint64_t)CFSTR("OBJ")))
          {
            sub_1DCAF11A0(v4, v21, st_size, &v28);
            v35 = v28;
            v36 = v29;
          }
          else if (objc_msgSend_isEqualToString_(self->_extension, v22, (uint64_t)CFSTR("STL")))
          {
            objc_msgSend_absoluteString(v4, v23, v24);
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend_UTF8String(v25, v26, v27);
            sub_1DCB2824C(v21, st_size, &v28);
            v35 = v28;
            v36 = v29;
            HIBYTE(v29) = 0;
            LOBYTE(v28) = 0;

          }
          munmap(v21, st_size);
          close(v18);
          goto LABEL_4;
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("Could not read %@ file"), self->_extension);
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@ file has no contents"), self->_extension);
      }
      v12 = objc_claimAutoreleasedReturnValue();
    }
LABEL_8:
    v13 = (__CFString *)v12;
    goto LABEL_9;
  }
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  memset(&v30, 0, sizeof(v30));
  sub_1DCB81648(&v30, 0);
  sub_1DCB86B58(&v30, v4, v10, &v28);
  v35 = v28;
  v36 = v29;
  sub_1DCB81700(&v30);
LABEL_4:
  if (SHIBYTE(v36) < 0)
  {
    if (!*((_QWORD *)&v35 + 1))
    {
      v13 = &stru_1EA577998;
LABEL_23:
      operator delete((void *)v35);
      goto LABEL_9;
    }
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v11, v35);
  }
  else
  {
    if (!HIBYTE(v36))
    {
      v13 = &stru_1EA577998;
      goto LABEL_9;
    }
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v11, (uint64_t)&v35);
  }
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v36 < 0)
    goto LABEL_23;
LABEL_9:

  return v13;
}

- (MDLAssetLoader)initWithExtension:(id)a3
{
  id v5;
  MDLAssetLoader *v6;
  MDLAssetLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDLAssetLoader;
  v6 = -[MDLAssetLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_extension, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
