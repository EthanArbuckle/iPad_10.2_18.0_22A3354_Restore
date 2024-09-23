@implementation _PFVMData

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[_PFVMData dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (_PFVMData)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (const)bytes
{
  return self->_payload;
}

- (unint64_t)length
{
  return self->_length;
}

- (_PFVMData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  _PFVMData *v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  off_t st_size;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  int *v23;
  stat v25;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)_PFVMData;
  v7 = -[_PFVMData init](&v26, sel_init, a3, a4);
  if (!v7)
    return v7;
  v8 = (const char *)objc_msgSend(a3, "fileSystemRepresentation");
  if (v8)
  {
    v9 = open(v8, 0);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = v9;
      fcntl(v9, 48, 1);
      memset(&v25, 0, sizeof(v25));
      if (fstat(v10, &v25))
      {
        if (a5)
        {
          v11 = *__error();
          v12 = *MEMORY[0x1E0CB2FE0];
          v33[0] = *MEMORY[0x1E0CB2AA0];
          v33[1] = CFSTR("reason");
          v34[0] = a3;
          v34[1] = CFSTR("fstat failed");
          *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, v11, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
        }
        close(v10);
        goto LABEL_21;
      }
      st_size = v25.st_size;
      v7->_length = v25.st_size;
      if (!st_size)
        goto LABEL_18;
      v16 = mmap(0, st_size, 3, 4098, 754974720, 0);
      v7->_payload = v16;
      if (v16)
      {
        if (read(v10, v16, v7->_length) == v7->_length)
          goto LABEL_18;
        v17 = *__error();
        munmap(v7->_payload, v7->_length);
        v7->_payload = 0;
        if (!a5)
          goto LABEL_18;
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2FE0];
        v31[0] = *MEMORY[0x1E0CB2AA0];
        v31[1] = CFSTR("reason");
        v32[0] = a3;
        v32[1] = CFSTR("read failed");
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v32;
        v22 = v31;
      }
      else
      {
        v23 = __error();
        if (!a5)
        {
LABEL_18:
          close(v10);
          goto LABEL_19;
        }
        v17 = *v23;
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2FE0];
        v29[0] = *MEMORY[0x1E0CB2AA0];
        v29[1] = CFSTR("reason");
        v30[0] = a3;
        v30[1] = CFSTR("mmap failed");
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v30;
        v22 = v29;
      }
      *a5 = (id)objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v17, objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2));
      goto LABEL_18;
    }
    if (a5)
    {
      v13 = *__error();
      v14 = *MEMORY[0x1E0CB2FE0];
      v27[0] = *MEMORY[0x1E0CB2AA0];
      v27[1] = CFSTR("reason");
      v28[0] = a3;
      v28[1] = CFSTR("open failed");
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, v13, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    }
  }
LABEL_19:
  if (!v7->_payload && v7->_length)
  {
LABEL_21:

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  void *payload;
  objc_super v4;

  payload = self->_payload;
  if (payload)
    munmap(payload, self->_length);
  v4.receiver = self;
  v4.super_class = (Class)_PFVMData;
  -[_PFVMData dealloc](&v4, sel_dealloc);
}

- (_PFVMData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  _PFVMData *v6;
  _PFVMData *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PFVMData;
  v6 = -[_PFVMData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_length = a4;
    v8 = mmap(0, a4, 3, 4098, 754974720, 0);
    v7->_payload = v8;
    memcpy(v8, a3, a4);
  }
  return v7;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end
