@implementation ULPowerLogBridge

+ (void)ULPowerLogTimeInsensitive:(id)a3 event:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (+[ULPowerLogBridge ULPowerLogEnabled](ULPowerLogBridge, "ULPowerLogEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), 4);
    PLLogRegisteredEvent();
  }

}

+ (BOOL)ULPowerLogEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULPowerLogEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
  v7 = v6;

  return v7;
}

@end
