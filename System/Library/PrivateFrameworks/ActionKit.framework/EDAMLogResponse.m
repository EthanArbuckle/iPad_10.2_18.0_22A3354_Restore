@implementation EDAMLogResponse

+ (id)structName
{
  return CFSTR("LogResponse");
}

+ (id)structFields
{
  void *v2;

  v2 = (void *)structFields_structFields_1675;
  if (!structFields_structFields_1675)
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
    structFields_structFields_1675 = MEMORY[0x24BDBD1A8];
  }
  return v2;
}

@end
