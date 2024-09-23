@implementation DNDSMutableExplicitRegionStore

- (void)setEnteredRegionIdentifiersPendingExit:(id)a3
{
  NSSet *v4;
  NSSet *enteredRegionIdentifiersPendingExit;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  enteredRegionIdentifiersPendingExit = self->super._enteredRegionIdentifiersPendingExit;
  self->super._enteredRegionIdentifiersPendingExit = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSExplicitRegionStore _initWithStore:]([DNDSExplicitRegionStore alloc], "_initWithStore:", self);
}

@end
