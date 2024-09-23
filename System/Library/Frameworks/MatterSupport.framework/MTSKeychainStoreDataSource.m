@implementation MTSKeychainStoreDataSource

- (id)resultMatchingQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  CFTypeRef result;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (!(_DWORD)v5)
    return (id)(id)result;
  v6 = v5;
  v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
  v12 = *MEMORY[0x24BDD0FD8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SecItemCopyMatching() failed with %d: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v6, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)addItemWithAttributes:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = SecItemAdd((CFDictionaryRef)a3, 0);
  v6 = v5;
  if ((_DWORD)v5)
  {
    v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
    v11 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SecItemAdd() failed with %d: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v6, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return (_DWORD)v6 == 0;
}

- (BOOL)updateItemMatchingQuery:(id)a3 withAttributes:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = SecItemUpdate((CFDictionaryRef)a3, (CFDictionaryRef)a4);
  v7 = v6;
  if ((_DWORD)v6)
  {
    v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    v12 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SecItemUpdate() failed with %d: %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v7, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return (_DWORD)v7 == 0;
}

- (BOOL)removeItemsMatchingQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = SecItemDelete((CFDictionaryRef)a3);
  v6 = v5;
  if ((_DWORD)v5)
  {
    v7 = (__CFString *)SecCopyErrorMessageString(v5, 0);
    v11 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SecItemDelete() failed with %d: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v6, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return (_DWORD)v6 == 0;
}

@end
