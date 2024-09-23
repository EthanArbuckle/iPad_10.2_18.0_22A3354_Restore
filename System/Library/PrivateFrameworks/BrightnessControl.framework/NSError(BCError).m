@implementation NSError(BCError)

- (uint64_t)initWithBCError:()BCError
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 16) > 2)
    v5 = CFSTR("Unknown error");
  else
    v5 = *(&off_24F2A73F8 + a3 - 16);
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.BrightnessControl");
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = v5;
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", v6, a3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
}

- (uint64_t)initWithIOKitError:()BCError
{
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.BrightnessControl");
  v7[0] = *MEMORY[0x24BDD0FC8];
  v7[1] = CFSTR("IOKitCode");
  v8[0] = CFSTR("IOKit error");
  v8[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", v5, 17, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

- (uint64_t)retIOKitError
{
  void *v1;

  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", CFSTR("IOKitCode"));
  if (v1)
    return objc_msgSend(v1, "intValue");
  else
    return 5;
}

@end
