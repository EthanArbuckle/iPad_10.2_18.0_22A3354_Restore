@implementation NSDictionary(SUUIExtensions)

+ (id)su_dictionaryWithSize:()SUUIExtensions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("height");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
