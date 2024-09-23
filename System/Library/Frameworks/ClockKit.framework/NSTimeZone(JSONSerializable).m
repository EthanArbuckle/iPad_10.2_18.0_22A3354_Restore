@implementation NSTimeZone(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a string. Invalid value: %@"), v4);
  v5 = objc_msgSend(a1, "initWithName:", v4);

  return v5;
}

@end
