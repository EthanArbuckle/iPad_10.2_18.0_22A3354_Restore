@implementation NSUnitSpeed

void __37__NSUnitSpeed_CAFUnit__metersPerHour__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.000277777778);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1948]), "initWithSymbol:converter:", CFSTR("m/h"), v2);
  v1 = (void *)metersPerHour_metersPerHour;
  metersPerHour_metersPerHour = v0;

}

@end
