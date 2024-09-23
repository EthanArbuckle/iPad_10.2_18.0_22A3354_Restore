@implementation DNDMutableModeAssertionInvalidationDetails

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDModeAssertionInvalidationDetails _initWithDetails:]([DNDModeAssertionInvalidationDetails alloc], "_initWithDetails:", self);
}

@end
