@implementation _EFProtectedFile

- (id)initWithFilePath:(char)a3 isSensitive:(void *)a4 protectionType:
{
  id v8;
  id v9;
  id *v10;
  id v11;
  int v12;
  objc_super v14;

  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_EFProtectedFile;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((_BYTE *)a1 + 16) = a3;
      v11 = v9;
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0)
      {
        v12 = 1;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) != 0)
      {
        v12 = 2;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
      {
        v12 = 3;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AE0]) & 1) != 0)
      {
        v12 = 4;
      }
      else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AD0]))
      {
        v12 = 7;
      }
      else
      {
        v12 = -1;
      }

      *((_DWORD *)a1 + 5) = v12;
      *((_DWORD *)a1 + 3) = 0;
    }
  }

  return a1;
}

- (uint64_t)fileDescriptorWithError:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
  v5 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v5
    && (v6 = objc_retainAutorelease(*(id *)(a1 + 24)),
        *(_DWORD *)(a1 + 8) = open_dprotected_np((const char *)objc_msgSend(v6, "UTF8String"), 0, *(_DWORD *)(a1 + 20), 0, 384), v6, v5 = *(unsigned int *)(a1 + 8), (_DWORD)v5 == -1))
  {
    *(_DWORD *)(a1 + 8) = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v5 = *(unsigned int *)(a1 + 8);
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(v4);
  if (a2)
    *a2 = objc_retainAutorelease(v7);

  return v5;
}

- (NSString)ef_publicDescription
{
  _BOOL4 filePathIsSensitive;
  void *v3;
  void *v4;
  void *v5;
  _EFProtectedFile *v6;
  void *v7;

  if (self
    && (filePathIsSensitive = self->_filePathIsSensitive, self = (_EFProtectedFile *)self->_filePath,
                                                          filePathIsSensitive))
  {
    -[_EFProtectedFile pathComponents](self, "pathComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EFDevice currentDevice](EFDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isInternal"))
    {
      objc_msgSend(v3, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v5);
    }
    else
    {
      objc_msgSend(v3, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v5);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (_EFProtectedFile *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<depth=%lu>/%@"), objc_msgSend(v3, "count") - 1, v7);
  }
  else
  {
    v6 = self;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
