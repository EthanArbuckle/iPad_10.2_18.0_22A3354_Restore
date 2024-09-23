@implementation FFDefaultFileReader

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
