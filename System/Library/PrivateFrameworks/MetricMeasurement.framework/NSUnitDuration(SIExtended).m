@implementation NSUnitDuration(SIExtended)

+ (id)nanoseconds
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDD18D8]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.000000001);
  v2 = (void *)objc_msgSend(v0, "initWithSymbol:converter:", CFSTR("ns"), v1);

  return v2;
}

+ (id)microseconds
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDD18D8]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.000001);
  v2 = (void *)objc_msgSend(v0, "initWithSymbol:converter:", CFSTR("µs"), v1);

  return v2;
}

+ (id)milliseconds
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDD18D8]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.001);
  v2 = (void *)objc_msgSend(v0, "initWithSymbol:converter:", CFSTR("ms"), v1);

  return v2;
}

@end
