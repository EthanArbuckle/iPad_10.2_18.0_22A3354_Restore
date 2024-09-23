@implementation MCMFileHandle

- (MCMFileHandle)initWithPath:(id)a3 relativeToFileHandle:(id)a4 direction:(unint64_t)a5 symlinks:(unint64_t)a6 createMode:(unsigned __int16)a7 createDPClass:(id)a8 openLazily:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  MCMFileHandle *v19;
  MCMFileHandle *v20;
  NSError *openError;
  int v22;
  NSNumber *createDPClass;
  objc_super v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MCMFileHandle;
  v19 = -[MCMFileHandle init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_path, a3);
    objc_storeStrong((id *)&v20->_relativeToFileHandle, a4);
    v20->_direction = a5;
    v20->_symlinks = a6;
    v20->_openLazily = a9;
    v20->_fd = -1;
    v20->_invalid = 0;
    openError = v20->_openError;
    v20->_openError = 0;

    v20->_open = 0;
    v22 = -[MCMFileHandle _computeFlags](v20, "_computeFlags");
    createDPClass = v20->_createDPClass;
    v20->_flags = v22;
    v20->_createMode = 0;
    v20->_createDPClass = 0;

    if ((v20->_flags & 0x200) != 0)
    {
      v20->_createMode = a7;
      objc_storeStrong((id *)&v20->_createDPClass, a8);
    }
  }

  return v20;
}

- (int)_computeFlags
{
  unint64_t v2;
  int v3;
  unint64_t symlinks;
  int v5;

  v2 = self->_direction - 1;
  if (v2 > 9)
    v3 = 0x1000000;
  else
    v3 = dword_1CF8D9CA8[v2];
  symlinks = self->_symlinks;
  v5 = v3 | 0x100;
  if (!symlinks)
    v3 |= 0x20000000u;
  if (symlinks == 1)
    return v5;
  else
    return v3;
}

- (id)copyValueAsStringFromXattr:(id)a3 maxLength:(unint64_t)a4 error:(id *)a5
{
  id v8;
  _BOOL4 v9;
  id v10;
  size_t v11;
  _BYTE *v12;
  uint64_t (*v13)(uint64_t, uint64_t, _BYTE *, unint64_t, _QWORD, _QWORD);
  uint64_t v14;
  id v15;
  int64_t v16;
  void *v17;
  int v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  MCMFileHandle *v23;
  int v24;
  id v25;
  _QWORD __s[2];

  __s[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0;
  __s[0] = 0;
  v9 = -[MCMFileHandle expectOpenWithError:](self, "expectOpenWithError:", &v25);
  v10 = v25;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if (a4 + 1 > 1)
    v11 = a4 + 1;
  else
    v11 = 1;
  v12 = malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL);
  __s[0] = v12;
  if (!v12)
  {
LABEL_12:
    v17 = 0;
    if (!a5)
      goto LABEL_15;
    goto LABEL_13;
  }
  v13 = *(uint64_t (**)(uint64_t, uint64_t, _BYTE *, unint64_t, _QWORD, _QWORD))(*MEMORY[0x1E0C835E8]
                                                                                              + 264);
  v14 = -[MCMFileHandle fd](self, "fd");
  v15 = objc_retainAutorelease(v8);
  v16 = v13(v14, objc_msgSend(v15, "UTF8String"), v12, a4, 0, 0);
  if (v16 < 1)
  {
    if (*__error() != 93)
    {
      v19 = *__error();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke;
      v21[3] = &unk_1E8CB5A28;
      v22 = v15;
      v23 = self;
      v24 = v19;
      __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke((uint64_t)v21);
      v20 = objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v10 = (id)v20;
      if (!a5)
        goto LABEL_15;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16 < a4)
    v12[v16] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
LABEL_13:
    if (!v17)
      *a5 = objc_retainAutorelease(v10);
  }
LABEL_15:
  if (v12)
  {
    free(v12);
    memset_s(__s, 8uLL, 0, 8uLL);
  }

  return v17;
}

- (int)fd
{
  return self->_fd;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[MCMFileHandle close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MCMFileHandle;
  -[MCMFileHandle dealloc](&v3, sel_dealloc);
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (void)close
{
  if (-[MCMFileHandle isOpen](self, "isOpen"))
  {
    (*(void (**)(_QWORD))(*MEMORY[0x1E0C835E8] + 152))(-[MCMFileHandle fd](self, "fd"));
    -[MCMFileHandle setOpen:](self, "setOpen:", 0);
    -[MCMFileHandle setInvalid:](self, "setInvalid:", 1);
  }
}

- (BOOL)expectOpenWithError:(id *)a3
{
  id v5;
  BOOL v6;
  BOOL result;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  if (-[MCMFileHandle isOpen](self, "isOpen"))
  {
    v5 = 0;
    v6 = 1;
LABEL_8:

    return v6;
  }
  if (-[MCMFileHandle invalid](self, "invalid"))
  {
    _os_crash();
    __break(1u);
  }
  else if (-[MCMFileHandle openLazily](self, "openLazily"))
  {
    v8[0] = 0;
    v6 = -[MCMFileHandle openWithError:](self, "openWithError:", v8);
    v5 = v8[0];
    if (a3)
    {
      if (!v6)
      {
        v5 = objc_retainAutorelease(v5);
        v6 = 0;
        *a3 = v5;
      }
    }
    goto LABEL_8;
  }
  result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)openWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  BOOL result;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (!-[MCMFileHandle isOpen](self, "isOpen"))
  {
    if (-[MCMFileHandle invalid](self, "invalid"))
    {
      result = _os_crash();
      __break(1u);
      return result;
    }
    -[MCMFileHandle openError](self, "openError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[MCMFileHandle relativeToFileHandle](self, "relativeToFileHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v7 = -[MCMFileHandle _openRelative](self, "_openRelative");
      else
        v7 = -[MCMFileHandle _openAbsolute](self, "_openAbsolute");
      self->_fd = v7;
      if (v7 < 0)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __31__MCMFileHandle_openWithError___block_invoke;
        v11[3] = &unk_1E8CB67B8;
        v11[4] = self;
        __31__MCMFileHandle_openWithError___block_invoke((uint64_t)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMFileHandle setOpenError:](self, "setOpenError:", v8);

      }
      else
      {
        -[MCMFileHandle setOpen:](self, "setOpen:", 1);
      }
    }
  }
  v9 = -[MCMFileHandle isOpen](self, "isOpen");
  if (a3)
  {
    if (!v9)
    {
      -[MCMFileHandle openError](self, "openError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return -[MCMFileHandle isOpen](self, "isOpen");
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (int)_openAbsolute
{
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, _QWORD);
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t (*v11)(uint64_t, _QWORD);

  -[MCMFileHandle _computeMode](self, "_computeMode");
  -[MCMFileHandle createDPClass](self, "createDPClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0C835E8];
  if (v3)
  {
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 520);
    -[MCMFileHandle path](self, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "fileSystemRepresentation");
    v8 = -[MCMFileHandle flags](self, "flags");
    -[MCMFileHandle createDPClass](self, "createDPClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5(v7, v8, objc_msgSend(v9, "intValue"), 0);

  }
  else
  {
    v11 = *(uint64_t (**)(uint64_t, _QWORD))(v4 + 512);
    -[MCMFileHandle path](self, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = v11(objc_msgSend(v6, "fileSystemRepresentation"), -[MCMFileHandle flags](self, "flags"));
  }

  return v10;
}

- (MCMFileHandle_Private)relativeToFileHandle
{
  return self->_relativeToFileHandle;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)openLazily
{
  return self->_openLazily;
}

- (NSError)openError
{
  return self->_openError;
}

- (int)flags
{
  return self->_flags;
}

- (NSNumber)createDPClass
{
  return self->_createDPClass;
}

- (unsigned)_computeMode
{
  if ((self->_flags & 0x200) != 0)
    return self->_createMode;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openError, 0);
  objc_storeStrong((id *)&self->_createDPClass, 0);
  objc_storeStrong((id *)&self->_relativeToFileHandle, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)copyValueAsUUIDFromXattr:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  MCMFileHandle *v15;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v17[0] = 0;
  v7 = -[MCMFileHandle copyValueAsStringFromXattr:maxLength:error:](self, "copyValueAsStringFromXattr:maxLength:error:", v6, 36, v17);
  v8 = v17[0];
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_8;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke;
    v13[3] = &unk_1E8CB5A50;
    v14 = v6;
    v15 = self;
    v16 = v7;
    __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke((uint64_t)v13);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v11;
  }
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v10 = 0;
    *a4 = v8;
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)copyValueAsNumberFromXattr:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  MCMFileHandle *v16;
  id v17;
  char *__endptr;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v19[0] = 0;
  v7 = -[MCMFileHandle copyValueAsStringFromXattr:maxLength:error:](self, "copyValueAsStringFromXattr:maxLength:error:", v6, 20, v19);
  v8 = v19[0];
  if (v7)
  {
    __endptr = 0;
    v9 = objc_retainAutorelease(v7);
    v10 = strtoull((const char *)objc_msgSend(v9, "UTF8String"), &__endptr, 10);
    if (__endptr && !*__endptr)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_11;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke;
      v14[3] = &unk_1E8CB5A50;
      v15 = v6;
      v16 = self;
      v17 = v9;
      __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke((uint64_t)v14);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v8 = (id)v11;
      if (!a4)
        goto LABEL_11;
    }
  }
  else
  {
    v12 = 0;
    if (!a4)
      goto LABEL_11;
  }
  if (!v12)
    *a4 = objc_retainAutorelease(v8);
LABEL_11:

  return v12;
}

- (BOOL)withOpenFileDoBlock:(id)a3
{
  uint64_t (**v4)(id, id);
  _BOOL4 v5;
  id v6;
  _BOOL4 v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, id))a3;
  v9[0] = 0;
  v5 = -[MCMFileHandle openWithError:](self, "openWithError:", v9);
  v6 = v9[0];
  v7 = v5 & v4[2](v4, v6);
  -[MCMFileHandle close](self, "close");

  return v7;
}

- (BOOL)setPermissions:(unsigned __int16)a3 andOwner:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  int v19;
  _QWORD v20[5];
  int v21;
  __int16 v22;
  id v23[2];

  v6 = a3;
  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a4;
  v23[0] = 0;
  v9 = -[MCMFileHandle expectOpenWithError:](self, "expectOpenWithError:", v23);
  v10 = v23[0];
  if (v9)
  {
    v11 = MEMORY[0x1E0C835E8];
    if ((*(unsigned int (**)(_QWORD, uint64_t))(*MEMORY[0x1E0C835E8] + 208))(-[MCMFileHandle fd](self, "fd"), v6)&& (v12 = *__error()) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke;
      v20[3] = &unk_1E8CB5A00;
      v20[4] = self;
      v22 = v6;
      v21 = v12;
      __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke((uint64_t)v20);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8
        || !(*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)v11 + 224))(-[MCMFileHandle fd](self, "fd"), objc_msgSend(v8, "UID"), objc_msgSend(v8, "primaryGID"))|| (v14 = *__error()) == 0)
      {
        v15 = 1;
        goto LABEL_14;
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_17;
      v17[3] = &unk_1E8CB5A28;
      v17[4] = self;
      v18 = v8;
      v19 = v14;
      __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_17((uint64_t)v17);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = v18;
    }

    v10 = (id)v13;
  }
  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    v15 = 0;
    *a5 = v10;
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  return v15;
}

- (BOOL)setXattr:(id)a3 valueAsString:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  id *v22;
  _QWORD v23[4];
  id v24;
  MCMFileHandle *v25;
  id v26;
  int v27;
  id v28[2];

  v28[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28[0] = 0;
  v10 = -[MCMFileHandle expectOpenWithError:](self, "expectOpenWithError:", v28);
  v11 = v28[0];
  if (v10)
  {
    v22 = a5;
    v12 = objc_retainAutorelease(v9);
    v13 = objc_msgSend(v12, "UTF8String");
    v14 = objc_msgSend(v12, "length");
    v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*MEMORY[0x1E0C835E8]
                                                                                            + 328);
    v16 = -[MCMFileHandle fd](self, "fd");
    v17 = objc_retainAutorelease(v8);
    if (!v15(v16, objc_msgSend(v17, "UTF8String"), v13, v14, 0, 0) || (v18 = *__error()) == 0)
    {
      v20 = 1;
      goto LABEL_9;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke;
    v23[3] = &unk_1E8CB5A78;
    v24 = v17;
    v25 = self;
    v26 = v12;
    v27 = v18;
    __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke((uint64_t)v23);
    v19 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v19;
    a5 = v22;
  }
  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v20 = 0;
    *a5 = v11;
  }
  else
  {
    v20 = 0;
  }
LABEL_9:

  return v20;
}

- (BOOL)setXattr:(id)a3 valueAsUUID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[MCMFileHandle setXattr:valueAsString:error:](self, "setXattr:valueAsString:error:", v8, v9, a5);

  return (char)a5;
}

- (BOOL)setXattr:(id)a3 valueAsNumber:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[MCMFileHandle setXattr:valueAsString:error:](self, "setXattr:valueAsString:error:", v8, v9, a5);

  return (char)a5;
}

- (BOOL)removeXattr:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  unsigned int (*v9)(uint64_t, uint64_t, _QWORD);
  uint64_t v10;
  id v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  MCMFileHandle *v18;
  int v19;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v20[0] = 0;
  v7 = -[MCMFileHandle expectOpenWithError:](self, "expectOpenWithError:", v20);
  v8 = v20[0];
  if (!v7)
    goto LABEL_6;
  v9 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*MEMORY[0x1E0C835E8] + 304);
  v10 = -[MCMFileHandle fd](self, "fd");
  v11 = objc_retainAutorelease(v6);
  if (!v9(v10, objc_msgSend(v11, "UTF8String"), 0))
  {
    v13 = 1;
    goto LABEL_10;
  }
  v12 = *__error();
  v13 = 1;
  if (v12 && v12 != 93)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __35__MCMFileHandle_removeXattr_error___block_invoke;
    v16[3] = &unk_1E8CB5A28;
    v17 = v11;
    v18 = self;
    v19 = v12;
    __35__MCMFileHandle_removeXattr_error___block_invoke((uint64_t)v16);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v14;
LABEL_6:
    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      v13 = 0;
      *a4 = v8;
    }
    else
    {
      v13 = 0;
    }
  }
LABEL_10:

  return v13;
}

- (BOOL)checkAppContainerProtection:(BOOL *)a3 error:(id *)a4
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (BOOL)registerAppContainerForProtectionWithError:(id *)a3
{
  return 1;
}

- (NSString)description
{
  return -[MCMFileHandle path](self, "path");
}

- (int)_openRelative
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD);
  uint64_t v17;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  -[MCMFileHandle relativeToFileHandle](self, "relativeToFileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v4 = objc_msgSend(v3, "expectOpenWithError:", v19);
  v5 = v19[0];

  if (!v4)
  {
    _os_crash();
    __break(1u);
  }
  -[MCMFileHandle _computeMode](self, "_computeMode");
  -[MCMFileHandle createDPClass](self, "createDPClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C835E8];
  if (v6)
  {
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 536);
    -[MCMFileHandle relativeToFileHandle](self, "relativeToFileHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fd");
    -[MCMFileHandle path](self, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "fileSystemRepresentation");
    v13 = -[MCMFileHandle flags](self, "flags");
    -[MCMFileHandle createDPClass](self, "createDPClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8(v10, v12, v13, objc_msgSend(v14, "intValue"), 0);

  }
  else
  {
    v16 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7 + 528);
    -[MCMFileHandle relativeToFileHandle](self, "relativeToFileHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "fd");
    -[MCMFileHandle path](self, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = v16(v17, objc_msgSend(v11, "fileSystemRepresentation"), -[MCMFileHandle flags](self, "flags"));
  }

  return v15;
}

- (void)setRelativeToFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_relativeToFileHandle, a3);
}

- (unint64_t)direction
{
  return self->_direction;
}

- (unint64_t)symlinks
{
  return self->_symlinks;
}

- (unsigned)createMode
{
  return self->_createMode;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (void)setOpenError:(id)a3
{
  objc_storeStrong((id *)&self->_openError, a3);
}

id __35__MCMFileHandle_removeXattr_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not clear xattr [%@] from [%@]; error = %{darwin.errno}d"),
                 v3,
                 v4,
                 *(unsigned int *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle removeXattr:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD6228;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 48), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not set xattr [%@] on [%@] to [%@]; error = %{darwin.errno}d"),
                 v3,
                 v4,
                 *(_QWORD *)(a1 + 48),
                 *(unsigned int *)(a1 + 56));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle setXattr:valueAsString:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD6210;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 56), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Xattr [%@] on [%@] was not a number; value = [%@]"),
                 v3,
                 v4,
                 *(_QWORD *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle copyValueAsNumberFromXattr:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD61F8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Xattr [%@] on [%@] was not a UUID; value = [%@]"),
                 v3,
                 v4,
                 *(_QWORD *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle copyValueAsUUIDFromXattr:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD61E0;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not read xattr [%@] from [%@]; error = %{darwin.errno}d"),
                 v3,
                 v4,
                 *(unsigned int *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle copyValueAsStringFromXattr:maxLength:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD61C8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 48), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not chmod [%@] to [0%o]; error = %{darwin.errno}d"),
                 v3,
                 *(unsigned __int16 *)(a1 + 44),
                 *(unsigned int *)(a1 + 40));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle setPermissions:andOwner:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD6198;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_17(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not chown [%@] to [%@]; error = %{darwin.errno}d"),
                 v3,
                 *(_QWORD *)(a1 + 40),
                 *(unsigned int *)(a1 + 48));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle setPermissions:andOwner:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD61B0;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 48), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __31__MCMFileHandle_openWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to open [%@] with [%@]"), v3, *(_QWORD *)(a1 + 32));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileHandle openWithError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD6180;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)compareDataProtectionClassTarget:(id)a3 withExisting:(id)a4
{
  id v5;
  unsigned int v6;
  int v7;
  int v9;

  v5 = a4;
  v6 = objc_msgSend(a3, "intValue");
  v7 = objc_msgSend(v5, "intValue");

  if ((v7 | v6) > 7 || v6 - 5 < 2)
    return 0;
  v9 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v7];
  if ((v7 - 5) < 2)
    v9 = 2;
  if (MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v6] <= v9)
    return 2;
  else
    return 1;
}

@end
