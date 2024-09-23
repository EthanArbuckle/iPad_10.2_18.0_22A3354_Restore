@implementation ICCameraFileFingerprint

- (ICCameraFileFingerprint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCameraFileFingerprint;
  return -[ICCameraFileFingerprint init](&v3, sel_init);
}

- (id)fixupFileHandleError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB28A8];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v6)
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], objc_msgSend(v3, "code"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      objc_msgSend(v15, "setObject:forKey:", v10, v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, objc_msgSend(v3, "code"), v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v16;
    }

  }
  return v3;
}

- (void)_createSignatureGenerator
{
  void *v2;
  void **v3;

  objc_msgSend(CFSTR("MYSUPERSECRECTKEYPADDEDTO32BYTES"), "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void **)MMCSSignatureGeneratorCreateWithBoundaryKey();

  return v3;
}

- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[ICCameraFileFingerprint fingerprintForFD:error:](self, "fingerprintForFD:error:", objc_msgSend(v6, "fileDescriptor"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "closeFile");
  }
  else if (a4)
  {
    -[ICCameraFileFingerprint fixupFileHandleError:](self, "fixupFileHandleError:", *a4);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fingerprintForData:(id)a3 error:(id *)a4
{
  id v5;
  void **v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = -[ICCameraFileFingerprint _createSignatureGenerator](self, "_createSignatureGenerator");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  MEMORY[0x1BCCC7124](v6, v8, v9, 1);
  v10 = MMCSSignatureGeneratorFinish();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v10, MEMORY[0x1BCCC7100](v10), 1);
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fingerprintForFD:(int)a3 error:(id *)a4
{
  void *v6;
  void **i;
  ssize_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  lseek(a3, 0, 0);
  v6 = malloc_type_malloc(0x20000uLL, 0xCD74D96CuLL);
  for (i = -[ICCameraFileFingerprint _createSignatureGenerator](self, "_createSignatureGenerator");
        ;
        MEMORY[0x1BCCC7124](i, v6, v8, 1))
  {
    v8 = read(a3, v6, 0x20000uLL);
    if (!v8)
      break;
    if (v8 == -1)
    {
      MMCSSignatureGeneratorFinish();
      i = 0;
      break;
    }
  }
  if (v6)
    free(v6);
  if (i)
  {
    v9 = MMCSSignatureGeneratorFinish();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, MEMORY[0x1BCCC7100](v9), 1);
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)zeroByteFileFingerprint
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSString *v5;
  id v6;
  NSString *zeroByteFileFingerprint;
  id v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_zeroByteFileFingerprint)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    -[ICCameraFileFingerprint fingerprintForData:error:](self, "fingerprintForData:error:", v4, &v9);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    zeroByteFileFingerprint = self->_zeroByteFileFingerprint;
    self->_zeroByteFileFingerprint = v5;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_zeroByteFileFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroByteFileFingerprint, 0);
}

@end
