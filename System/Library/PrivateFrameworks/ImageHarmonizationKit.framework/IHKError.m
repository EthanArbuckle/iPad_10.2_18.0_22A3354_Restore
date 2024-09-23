@implementation IHKError

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, a3, (uint64_t)a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5, *MEMORY[0x24BDD0FC8], a5, *MEMORY[0x24BDD1398], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.imageharmonizationkit"), a3, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
