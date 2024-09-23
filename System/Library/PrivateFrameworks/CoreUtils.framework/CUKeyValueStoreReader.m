@implementation CUKeyValueStoreReader

- (CUKeyValueStoreReader)init
{
  CUKeyValueStoreReader *v2;
  CUKeyValueStoreReader *v3;
  CUKeyValueStoreReader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUKeyValueStoreReader;
  v2 = -[CUKeyValueStoreReader init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    v4 = v2;
  }

  return v3;
}

- (CUKeyValueStoreReader)initWithKeyType:(Class)a3 valueType:(Class)a4
{
  CUKeyValueStoreReader *v6;
  CUKeyValueStoreReader *v7;
  CUKeyValueStoreReader *v8;

  v6 = -[CUKeyValueStoreReader init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_keyType = a3;
    v6->_valueType = a4;
    v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  char *map;
  int fd;
  objc_super v5;

  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error())
      __error();
    self->_fd = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)CUKeyValueStoreReader;
  -[CUKeyValueStoreReader dealloc](&v5, sel_dealloc);
}

- (BOOL)openAtPath:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  int fd;
  int v15;
  char *map;
  int v17;
  char *v18;
  BOOL result;
  const char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  stat v24;

  v6 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (!v6)
  {
    if (a4)
    {
      v20 = "No file path";
      v21 = 4294960592;
LABEL_20:
      NSErrorWithOSStatusF(v21, (uint64_t)v20, v7, v8, v9, v10, v11, v12, v23);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v22;
      return result;
    }
    return 0;
  }
  v13 = (const char *)v6;
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error())
      __error();
    self->_fd = -1;
  }
  v15 = open(v13, 0);
  self->_fd = v15;
  if ((v15 & 0x80000000) == 0)
    goto LABEL_8;
  if (!*__error())
  {
    v21 = 4294960596;
    if (a4)
      goto LABEL_19;
    return 0;
  }
  v21 = *__error();
  if ((_DWORD)v21)
  {
    if (a4)
    {
LABEL_19:
      v23 = (uint64_t)v13;
      v20 = "Open file '%s' failed";
      goto LABEL_20;
    }
    return 0;
  }
LABEL_8:
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  v17 = self->_fd;
  memset(&v24, 0, sizeof(v24));
  self->_cdb.loop = 0;
  self->_cdb.fd = v17;
  if (!fstat(v17, &v24) && v24.st_size <= 0xFFFFFFFFLL)
  {
    v18 = (char *)mmap(0, v24.st_size, 1, 1, v17, 0);
    self->_cdb.size = v24.st_size;
    self->_cdb.map = v18;
  }
  return 1;
}

- (void)close
{
  char *map;
  int fd;

  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd))
    {
      if (*__error())
        __error();
    }
    self->_fd = -1;
  }
}

- (id)_readObjectAtOffset:(unsigned int)a3 length:(unsigned int)a4 type:(Class)a5 error:(id *)a6
{
  size_t v8;
  size_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;

  v8 = *(_QWORD *)&a4;
  if (a4 <= 1)
    v11 = 1;
  else
    v11 = a4;
  v12 = (char *)malloc_type_malloc(v11, 0xB7DA8181uLL);
  if (!v12)
  {
    if (a6)
    {
      NSErrorWithOSStatusF(4294960568, (uint64_t)"malloc %zu bytes failed", v13, v14, v15, v16, v17, v18, v8);
LABEL_16:
      v27 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      return v27;
    }
    goto LABEL_11;
  }
  v19 = v12;
  if (cdb_read((uint64_t)&self->_cdb, v12, v8, a3))
  {
    free(v19);
    if (a6)
    {
      if (*__error())
        v26 = *__error();
      else
        v26 = 4294960596;
      NSErrorWithOSStatusF(v26, (uint64_t)"Read bytes failed", v20, v21, v22, v23, v24, v25, v31);
      goto LABEL_16;
    }
LABEL_11:
    v27 = 0;
    return v27;
  }
  -[objc_class createWithBytesNoCopy:length:error:](a5, "createWithBytesNoCopy:length:error:", v19, v8, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v28;
  if (v28)
    v29 = v28;
  else
    free(v19);

  return v27;
}

- (BOOL)enumerateKeysAndValuesAndReturnError:(id *)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  BOOL v21;
  uint64_t v23;

  v6 = a4;
  v13 = self->_keyType;
  if (v13)
  {
    v20 = self->_valueType;
    if (v20)
    {
      v21 = -[CUKeyValueStoreReader enumerateKeyType:valueType:error:handler:](self, "enumerateKeyType:valueType:error:handler:", v13, v20, a3, v6);
    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v14, v15, v16, v17, v18, v19, v23);
      v21 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown key type", v7, v8, v9, v10, v11, v12, v23);
    v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)enumerateKeyType:(Class)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(id, void *, uint64_t, _BYTE *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  uint64_t v35;
  char v38;
  _DWORD __dst[2];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = (void (**)(id, void *, uint64_t, _BYTE *))a6;
  if (self->_fd < 0)
  {
    if (a5)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960551, (uint64_t)"Not opened", v8, v9, v10, v11, v12, v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_22;
  }
  if (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 4uLL, 0))
  {
    v21 = __dst[0];
    if (__dst[0] < 0x801u)
    {
LABEL_24:
      v27 = 1;
      goto LABEL_25;
    }
    v22 = 2048;
    while (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 8uLL, v22))
    {
      v24 = __dst[0];
      v23 = __dst[1];
      v25 = v22 + 8;
      -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:](self, "_readObjectAtOffset:length:type:error:", v22 + 8, __dst[0], a3, a5);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26 != 0;
      if (!v26)
        goto LABEL_25;
      v28 = (void *)v26;
      v29 = v24 + v25;
      -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:](self, "_readObjectAtOffset:length:type:error:", v24 + v25, v23, a4, a5);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {

        goto LABEL_22;
      }
      v31 = (void *)v30;
      v38 = 0;
      v13[2](v13, v28, v30, &v38);
      if (v38)
      {

        goto LABEL_24;
      }
      v22 = v23 + v29;

      if (v22 >= v21)
        goto LABEL_24;
    }
    if (!a5)
      goto LABEL_22;
    if (*__error())
      v20 = *__error();
    else
      v20 = 4294960596;
    v32 = "Read key/value lengths failed";
    goto LABEL_16;
  }
  if (!a5)
  {
LABEL_22:
    v27 = 0;
    goto LABEL_25;
  }
  if (*__error())
    v20 = *__error();
  else
    v20 = 4294960596;
  v32 = "Read header failed";
LABEL_16:
  NSErrorWithOSStatusF(v20, (uint64_t)v32, v14, v15, v16, v17, v18, v19, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v27 = 0;
  *a5 = v33;
LABEL_25:

  return v27;
}

- (BOOL)enumerateValuesForKey:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  BOOL v17;
  uint64_t v19;

  v8 = a3;
  v9 = a5;
  v16 = self->_valueType;
  if (v16)
  {
    v17 = -[CUKeyValueStoreReader enumerateValuesForKey:valueType:error:handler:](self, "enumerateValuesForKey:valueType:error:handler:", v8, v16, a4, v9);
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v10, v11, v12, v13, v14, v15, v19);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)enumerateValuesForKey:(id)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  void (**v11)(id, void *, _BYTE *);
  id v12;
  unsigned __int8 *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  char v39;
  id v40;
  id v41;
  unint64_t v42;

  v10 = a3;
  v11 = (void (**)(id, void *, _BYTE *))a6;
  v42 = 0;
  v12 = objc_retainAutorelease(v10);
  v41 = 0;
  v13 = (unsigned __int8 *)objc_msgSend(v12, "encodedBytesAndReturnLength:error:", &v42, &v41);
  v14 = v41;
  v20 = v14;
  if (v13)
  {
    v21 = 0;
    v22 = v42;
    goto LABEL_3;
  }
  if (v14)
  {
    if (a5)
    {
LABEL_9:
      v24 = objc_retainAutorelease(v20);
      v20 = v24;
      v21 = 0;
      goto LABEL_10;
    }
    goto LABEL_26;
  }
  v40 = 0;
  objc_msgSend(v12, "encodedDataAndReturnError:", &v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v40;
  v20 = v29;
  if (!v28)
  {
    if (a5)
    {
      if (v29)
        goto LABEL_9;
      NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v30, v31, v32, v33, v34, v35, v38);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v36;

    }
LABEL_26:
    v21 = 0;
    goto LABEL_27;
  }
  v21 = objc_retainAutorelease(v28);
  v13 = (unsigned __int8 *)objc_msgSend(v21, "bytes");
  v22 = objc_msgSend(v21, "length");
  v42 = v22;
LABEL_3:
  if (!HIDWORD(v22))
  {
    if ((self->_fd & 0x80000000) == 0)
    {
      self->_cdb.loop = 0;
      if ((int)cdb_findnext(&self->_cdb, v13, v22) >= 1)
      {
        -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:](self, "_readObjectAtOffset:length:type:error:", self->_cdb.dpos, self->_cdb.dlen, a4, a5);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
          goto LABEL_27;
        v27 = (void *)v26;
        while (1)
        {
          v39 = 0;
          v11[2](v11, v27, &v39);
          if (v39 || (int)cdb_findnext(&self->_cdb, v13, v42) < 1)
            break;

          -[CUKeyValueStoreReader _readObjectAtOffset:length:type:error:](self, "_readObjectAtOffset:length:type:error:", self->_cdb.dpos, self->_cdb.dlen, a4, a5);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_27;
        }

      }
      v25 = 1;
      goto LABEL_28;
    }
    if (a5)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960551, (uint64_t)"Not opened", v15, v16, v17, v18, v19, v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_27:
    v25 = 0;
    goto LABEL_28;
  }
  if (!a5)
    goto LABEL_27;
  NSErrorWithOSStatusF(4294960591, (uint64_t)"Key too big %zu vs %u", v22, v15, v16, v17, v18, v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v24 = v23;
LABEL_10:
  v25 = 0;
  *a5 = v24;
LABEL_28:

  return v25;
}

- (BOOL)valueExistsForKey:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  BOOL v10;
  id v12;
  id v13;
  unint64_t v14;

  v14 = 0;
  v4 = objc_retainAutorelease(a3);
  v13 = 0;
  v5 = (unsigned __int8 *)objc_msgSend(v4, "encodedBytesAndReturnLength:error:", &v14, &v13);
  v6 = v13;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      v8 = 0;
    }
    else
    {
      v12 = 0;
      objc_msgSend(v4, "encodedDataAndReturnError:", &v12);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      if (v8)
      {
        v8 = objc_retainAutorelease(v8);
        v5 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
        v9 = objc_msgSend(v8, "length");
        v14 = v9;
        goto LABEL_3;
      }
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  v9 = v14;
LABEL_3:
  if (HIDWORD(v9) || self->_fd < 0)
    goto LABEL_8;
  self->_cdb.loop = 0;
  v10 = (int)cdb_findnext(&self->_cdb, v5, v9) > 0;
LABEL_9:

  return v10;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  v13 = self->_valueType;
  if (v13)
  {
    -[CUKeyValueStoreReader valueForKey:valueType:error:](self, "valueForKey:valueType:error:", v6, v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v7, v8, v9, v10, v11, v12, v16);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)valueForKey:(id)a3 valueType:(Class)a4 error:(id *)a5
{
  id v8;
  unsigned __int8 *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  size_t dlen;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  id v44;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  unint64_t v50;

  v50 = 0;
  v8 = objc_retainAutorelease(a3);
  v49 = 0;
  v9 = (unsigned __int8 *)objc_msgSend(v8, "encodedBytesAndReturnLength:error:", &v50, &v49);
  v10 = v49;
  v16 = v10;
  if (v9)
  {
    v17 = 0;
    v18 = v50;
    goto LABEL_3;
  }
  if (v10)
  {
    if (a5)
    {
LABEL_11:
      v22 = objc_retainAutorelease(v16);
      v16 = v22;
      v17 = 0;
      goto LABEL_12;
    }
    goto LABEL_30;
  }
  v48 = 0;
  objc_msgSend(v8, "encodedDataAndReturnError:", &v48);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v48;
  v16 = v34;
  if (!v33)
  {
    if (a5)
    {
      if (v34)
        goto LABEL_11;
      NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v35, v36, v37, v38, v39, v40, v47);
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v44;

    }
LABEL_30:
    v17 = 0;
    goto LABEL_31;
  }
  v17 = objc_retainAutorelease(v33);
  v9 = (unsigned __int8 *)objc_msgSend(v17, "bytes");
  v18 = objc_msgSend(v17, "length");
  v50 = v18;
LABEL_3:
  if (!HIDWORD(v18))
  {
    if (self->_fd < 0)
    {
      if (a5)
      {
        NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960551, (uint64_t)"Not opened", v11, v12, v13, v14, v15, v47);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      goto LABEL_31;
    }
    self->_cdb.loop = 0;
    if ((int)cdb_findnext(&self->_cdb, v9, v18) <= 0)
    {
      if (a5)
      {
        v23 = 0;
        *a5 = 0;
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    dlen = self->_cdb.dlen;
    if ((_DWORD)dlen)
    {
      v25 = (char *)malloc_type_malloc(self->_cdb.dlen, 0x85F21751uLL);
      if (v25)
      {
        v26 = v25;
        if (cdb_read((uint64_t)&self->_cdb, v25, dlen, self->_cdb.dpos))
        {
          free(v26);
          if (a5)
          {
            NSErrorWithOSStatusF(4294960550, (uint64_t)"Read failed (%d)", v27, v28, v29, v30, v31, v32, 0xFFFFFFFFLL);
            goto LABEL_7;
          }
LABEL_31:
          v23 = 0;
          goto LABEL_32;
        }
        -[objc_class createWithBytesNoCopy:length:error:](a4, "createWithBytesNoCopy:length:error:", v26, dlen, a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_36;
        v43 = v26;
        goto LABEL_41;
      }
      if (!a5)
        goto LABEL_31;
      v47 = dlen;
      v19 = "malloc %zu bytes failed";
    }
    else
    {
      v41 = (char *)malloc_type_malloc(1uLL, 0x3A43D0FFuLL);
      if (v41)
      {
        v42 = v41;
        -[objc_class createWithBytesNoCopy:length:error:](a4, "createWithBytesNoCopy:length:error:", v41, 0, a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
LABEL_36:
          v46 = v23;
LABEL_42:

          goto LABEL_32;
        }
        v43 = v42;
LABEL_41:
        free(v43);
        goto LABEL_42;
      }
      if (!a5)
        goto LABEL_31;
      v19 = "malloc 1 byte failed";
    }
    v20 = 4294960568;
    goto LABEL_6;
  }
  if (!a5)
    goto LABEL_31;
  v47 = v18;
  v19 = "Key too big %zu vs %u";
  v20 = 4294960591;
LABEL_6:
  NSErrorWithOSStatusF(v20, (uint64_t)v19, v18, v11, v12, v13, v14, v15, v47);
LABEL_7:
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v22 = v21;
LABEL_12:
  v23 = 0;
  *a5 = v22;
LABEL_32:

  return v23;
}

@end
