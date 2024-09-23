@implementation NSDate(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a number. Invalid value: %@"), v4);
  objc_msgSend(v4, "doubleValue");
  v5 = objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");

  return v5;
}

- (uint64_t)JSONObjectRepresentation
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v1, "numberWithDouble:");
}

@end
