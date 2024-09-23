@implementation NSUnitDispersion(PartsPerBillion)

+ (id)wf_partsPerBillion
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.001);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18D0]), "initWithSymbol:converter:", CFSTR("ppb"), v0);

  return v1;
}

@end
