@implementation NSFileManager(DESExtensions)

- (uint64_t)_fides_removeItemAtPath:()DESExtensions error:
{
  char v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v5 = objc_msgSend(a1, "removeItemAtPath:error:", a3, &v12);
  v6 = v12;
  v7 = v6;
  if ((v5 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == 4)
    {

      v7 = 0;
LABEL_5:
      v10 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a4 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_10:

  return v10;
}

@end
