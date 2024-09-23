@implementation DNDMutableBehaviorSettings

- (void)setInterruptionBehaviorSetting:(unint64_t)a3
{
  self->super._interruptionBehaviorSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDBehaviorSettings _initWithSettings:]([DNDBehaviorSettings alloc], "_initWithSettings:", self);
}

@end
