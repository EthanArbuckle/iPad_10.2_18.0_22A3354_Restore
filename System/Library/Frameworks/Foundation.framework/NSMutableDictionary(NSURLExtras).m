@implementation NSMutableDictionary(NSURLExtras)

- (void)_web_setInt:()NSURLExtras forKey:
{
  NSNumber *v6;

  v6 = -[NSNumber initWithInt:]([NSNumber alloc], "initWithInt:", a3);
  objc_msgSend(a1, "setObject:forKey:", v6, a4);

}

- (void)_web_setBool:()NSURLExtras forKey:
{
  NSNumber *v6;

  v6 = -[NSNumber initWithBool:]([NSNumber alloc], "initWithBool:", a3);
  objc_msgSend(a1, "setObject:forKey:", v6, a4);

}

- (void)_web_setObject:()NSURLExtras forUncopiedKey:
{
  CFDictionarySetValue(a1, key, a3);
}

@end
