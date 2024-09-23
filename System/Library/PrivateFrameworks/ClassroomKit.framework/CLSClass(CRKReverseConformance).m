@implementation CLSClass(CRKReverseConformance)

- (BOOL)isEditable
{
  return objc_msgSend(a1, "source") == 3;
}

@end
