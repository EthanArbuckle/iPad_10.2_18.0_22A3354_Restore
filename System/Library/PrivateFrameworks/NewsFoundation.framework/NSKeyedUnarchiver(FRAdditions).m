@implementation NSKeyedUnarchiver(FRAdditions)

+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withData:
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDD1620];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, 0);

  objc_msgSend(v7, "nf_securelyUnarchiveObjectOfClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withFile:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nf_securelyUnarchiveObjectOfClass:withData:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)nf_securelyUnarchiveObjectOfClass:()FRAdditions
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:", a3, *MEMORY[0x24BDD0E88]);
}

+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withData:
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

  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x24BDD0E88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withFile:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCE50];
  v7 = a3;
  objc_msgSend(v6, "dataWithContentsOfFile:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nf_securelyUnarchiveObjectOfClasses:withData:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
