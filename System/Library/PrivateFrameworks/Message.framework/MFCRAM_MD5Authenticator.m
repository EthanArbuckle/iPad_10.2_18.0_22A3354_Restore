@implementation MFCRAM_MD5Authenticator

- (id)responseForServerData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFData *v11;
  __int128 v12;
  __CFData *Mutable;
  id v14;
  id v15;
  __CFData *v16;
  uint64_t i;
  UInt8 bytes;
  char v20[3];
  _OWORD c[12];
  _OWORD v22[2];
  _QWORD v23[5];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ECSASLAuthenticator account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ECSASLAuthenticator account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "password");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v7 && v10)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)((char *)v22 + 12) = v12;
      c[11] = v12;
      v22[0] = v12;
      c[9] = v12;
      c[10] = v12;
      c[8] = v12;
      c[6] = v12;
      c[7] = v12;
      c[4] = v12;
      c[5] = v12;
      c[2] = v12;
      c[3] = v12;
      c[0] = v12;
      c[1] = v12;
      bytes = 32;
      Mutable = CFDataCreateMutable(0, objc_msgSend(v7, "length") + 33);
      v14 = objc_retainAutorelease(v7);
      CFDataAppendBytes(Mutable, (const UInt8 *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
      CFDataAppendBytes(Mutable, &bytes, 1);
      MF_MD5HMAC_Init();
      v15 = objc_retainAutorelease(v4);
      CC_MD5_Update((CC_MD5_CTX *)c, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

      v16 = Mutable;
      v23[0] = 0xAAAAAAAAAAAAAAAALL;
      v23[1] = 0xAAAAAAAAAAAAAAAALL;
      MF_MD5HMAC_Output();
      v11 = v16;
      for (i = 0; i != 16; ++i)
      {
        memset(v20, 170, sizeof(v20));
        __snprintf_chk(v20, 3uLL, 0, 3uLL, "%02x", *((unsigned __int8 *)v23 + i));
        -[__CFData appendBytes:length:](v11, "appendBytes:length:", v20, 2);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
