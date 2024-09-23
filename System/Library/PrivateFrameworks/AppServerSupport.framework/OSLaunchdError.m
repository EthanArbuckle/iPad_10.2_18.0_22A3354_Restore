@implementation OSLaunchdError

+ (id)createXPCError:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_strerror());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD0FD8];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("OSLaunchdErrorDomain"), a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
