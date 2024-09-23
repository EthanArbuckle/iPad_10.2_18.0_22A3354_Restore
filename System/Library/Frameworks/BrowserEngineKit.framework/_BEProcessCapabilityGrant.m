@implementation _BEProcessCapabilityGrant

- (BOOL)invalidate
{
  swift_retain();
  sub_2330707D8();
  swift_release();
  return 1;
}

- (BOOL)isValid
{
  return objc_msgSend(*(id *)self->inner, sel_isValid);
}

@end
