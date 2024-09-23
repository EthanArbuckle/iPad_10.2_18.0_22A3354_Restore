@implementation LACStorageError

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x24BDD0BA0]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.Storage"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
