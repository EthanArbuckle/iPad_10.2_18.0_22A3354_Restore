@implementation CalMigrationErrorUtils

+ (id)errorFromException:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14[0] = CFSTR("ExceptionName");
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("ExceptionReason");
  objc_msgSend(v3, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("ExceptionCallStackReturnAddresses");
  objc_msgSend(v3, "callStackReturnAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("ExceptionCallStackSymbols");
  objc_msgSend(v3, "callStackSymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = CFSTR("ExceptionUserInfo");
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v5)
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.MigrationErrors"), 2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
