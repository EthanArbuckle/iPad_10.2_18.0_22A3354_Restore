@implementation DNDMutableScheduleTime

- (void)setHour:(unint64_t)a3
{
  self->super._hour = a3 % 0x18;
}

- (void)setMinute:(unint64_t)a3
{
  self->super._minute = a3 % 0x3C;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleTime _initWithTime:]([DNDScheduleTime alloc], "_initWithTime:", self);
}

@end
