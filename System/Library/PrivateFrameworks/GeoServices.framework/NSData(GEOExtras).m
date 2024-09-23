@implementation NSData(GEOExtras)

- (id)_GEOCreateDispatchData
{
  return (id)objc_msgSend(a1, "_createDispatchData");
}

@end
