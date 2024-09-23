@implementation DNDSMutableApplicationConfigurationRecord

- (void)setMinimumBreakthroughUrgency:(id)a3
{
  NSNumber *v4;
  NSNumber *minimumBreakthroughUrgency;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  minimumBreakthroughUrgency = self->super._minimumBreakthroughUrgency;
  self->super._minimumBreakthroughUrgency = v4;

}

- (void)setAllowedThreads:(id)a3
{
  NSSet *v4;
  NSSet *allowedThreads;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedThreads = self->super._allowedThreads;
  self->super._allowedThreads = v4;

}

- (void)setDeniedThreads:(id)a3
{
  NSSet *v4;
  NSSet *deniedThreads;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedThreads = self->super._deniedThreads;
  self->super._deniedThreads = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSApplicationConfigurationRecord _initWithRecord:]([DNDSApplicationConfigurationRecord alloc], "_initWithRecord:", self);
}

@end
