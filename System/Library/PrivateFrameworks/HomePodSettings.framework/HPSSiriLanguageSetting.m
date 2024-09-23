@implementation HPSSiriLanguageSetting

- (HPSSiriLanguageSetting)initWithKeyPath:(id)a3
{
  return -[HPSSetting initWithKeyPath:value:](self, "initWithKeyPath:value:", a3, 0);
}

- (id)languages
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[HPSSetting value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
