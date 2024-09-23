@implementation BLSHDurationAttributeHandler

+ (id)attributeClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
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
