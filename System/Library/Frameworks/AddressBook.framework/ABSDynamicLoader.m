@implementation ABSDynamicLoader

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5
{
  id v6;
  char v7;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("System/Library/Assistant/Plugins/AddressBook.assistantBundle/AddressBook"));
  if ((v7 & 1) != 0)
  {
    if (a5)
      *a5 = objc_alloc_init(ABSBundle);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Path %@ isn't something AddressBook.framework can load at the moment"), v6);
  }

  return v7;
}

@end
