@implementation NSUserDefaults

+ (id)appDefaults
{
  id v2;
  NSString v3;
  id v4;
  id result;

  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  if (v4)
    return v4;
  __break(1u);
  return result;
}

@end
