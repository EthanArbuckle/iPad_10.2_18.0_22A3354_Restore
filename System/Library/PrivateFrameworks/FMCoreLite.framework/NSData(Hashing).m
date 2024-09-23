@implementation NSData(Hashing)

- (id)fm_sha1Hash
{
  id v1;
  unsigned __int8 md[20];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_sha256Hash
{
  id v1;
  unsigned __int8 md[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_sha512Hash
{
  id v1;
  unsigned __int8 md[64];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA512((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 64);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_hmac_md5WithKey:()Hashing
{
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  _BYTE macOut[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = objc_retainAutorelease(a1);
  CCHmac(1u, v5, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), macOut);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_hmac_sha1WithKey:()Hashing
{
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  _BYTE macOut[20];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = objc_retainAutorelease(a1);
  CCHmac(0, v5, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), macOut);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_hmac_sha256WithKey:()Hashing
{
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  _BYTE macOut[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = objc_retainAutorelease(a1);
  CCHmac(2u, v5, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), macOut);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fm_hmac_sha512WithKey:()Hashing
{
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  _BYTE macOut[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = objc_retainAutorelease(a1);
  CCHmac(4u, v5, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), macOut);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 64);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
