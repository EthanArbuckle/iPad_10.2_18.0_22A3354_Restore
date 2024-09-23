@implementation NSFileHandle(FileProtection)

+ (id)fileHandleForCreatingURL:()FileProtection protection:error:
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CF8]))
  {
    v7 = 4;
  }
  else
  {
    v7 = 3;
  }
  objc_msgSend(v5, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = open_dprotected_np((const char *)objc_msgSend(v8, "UTF8String"), 2562, v7, 0, 416);

  if ((v9 & 0x80000000) != 0)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v9);

  return v10;
}

@end
