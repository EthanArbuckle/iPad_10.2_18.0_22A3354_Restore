@implementation BLSHForceActiveAttributeHandler

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

@end
