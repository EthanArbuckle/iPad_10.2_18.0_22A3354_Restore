@implementation ENTTransportException

+ (id)exceptionWithReason:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v13 = CFSTR("error");
    v14[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ENTTransportException;
  objc_msgSendSuper2(&v12, sel_exceptionWithName_reason_userInfo_, CFSTR("TTransportException"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)exceptionWithReason:(id)a3
{
  return (id)objc_msgSend(a1, "exceptionWithReason:error:", a3, 0);
}

@end
