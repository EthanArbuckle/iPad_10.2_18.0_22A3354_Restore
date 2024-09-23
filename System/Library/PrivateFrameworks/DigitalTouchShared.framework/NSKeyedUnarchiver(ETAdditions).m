@implementation NSKeyedUnarchiver(ETAdditions)

+ (id)_et_secureUnarchiveObjectOfClasses:()ETAdditions withData:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BDD1620];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, 0);

  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v7, CFSTR("root"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_et_secureUnarchiveObjectOfClass:()ETAdditions withData:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_et_secureUnarchiveObjectOfClasses:withData:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
