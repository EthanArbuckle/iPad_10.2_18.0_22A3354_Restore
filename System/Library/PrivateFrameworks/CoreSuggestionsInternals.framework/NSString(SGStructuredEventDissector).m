@implementation NSString(SGStructuredEventDissector)

- (BOOL)sg_isEmptySchemaObject
{
  return objc_msgSend(a1, "length") == 0;
}

@end
