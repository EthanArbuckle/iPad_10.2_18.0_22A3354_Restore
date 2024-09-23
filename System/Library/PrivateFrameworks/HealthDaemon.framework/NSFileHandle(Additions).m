@implementation NSFileHandle(Additions)

- (BOOL)hk_readValue:()Additions ofSize:error:
{
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;

  v9 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(a1, "readDataOfLength:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v12 = v11 == a4;
  if (v11 == a4)
  {
    memcpy(a3, (const void *)objc_msgSend(objc_retainAutorelease(v10), "bytes"), a4);
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 102, CFSTR("hk_readValue file size mismatch."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v9);
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)hk_writeValue:()Additions size:error:
{
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "offsetInFile");
  objc_msgSend(a1, "writeData:", v8);
  v10 = v9 + a4 == objc_msgSend(a1, "offsetInFile");

  v11 = 0;
  if (a5 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 102, CFSTR("hk_writeValue file size mismatch."));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v11;
  }

  return v10;
}

@end
