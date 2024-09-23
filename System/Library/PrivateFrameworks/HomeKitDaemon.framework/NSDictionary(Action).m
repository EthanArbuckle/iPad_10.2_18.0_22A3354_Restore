@implementation NSDictionary(Action)

+ (id)hmd_dictionaryWithActionExecutionError:()Action
{
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = CFSTR("HM.genericErrorDataKey");
    encodeRootObjectForIncomingXPCMessage(a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v8 = CFSTR("HM.genericSuccessDataKey");
    v9[0] = CFSTR("Success");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
