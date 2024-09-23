@implementation NSError(XCTDaemonErrors)

+ (id)_axAudit_error:()XCTDaemonErrors description:
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v16 = *MEMORY[0x24BDD0FC8];
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibilityAudit"), a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
