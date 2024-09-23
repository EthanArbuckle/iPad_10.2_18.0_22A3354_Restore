@implementation ATMD5SignatureProvider

- (id)createSignature:(id *)a3 forData:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  id v8;

  v5 = a4;
  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x6BEEF075uLL);
    v8 = objc_retainAutorelease(v5);
    CC_MD5((const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, 16, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a3 = v6;

  return 0;
}

- (id)verifySignature:(id)a3 forData:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
  {
    v7 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x45F5624AuLL);
    v8 = objc_retainAutorelease(v6);
    CC_MD5((const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, 16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToData:", v5) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      _ATLogCategoryFramework();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "failed to verify signature", v13, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (objc_msgSend(v6, "length") || objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
