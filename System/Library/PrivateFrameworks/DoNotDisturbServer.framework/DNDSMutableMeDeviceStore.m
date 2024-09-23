@implementation DNDSMutableMeDeviceStore

- (void)setMeDeviceStatus:(id)a3
{
  NSNumber *v4;
  NSNumber *meDeviceStatus;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  meDeviceStatus = self->super._meDeviceStatus;
  self->super._meDeviceStatus = v4;

}

- (void)setMeDeviceName:(id)a3
{
  NSString *v4;
  NSString *meDeviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  meDeviceName = self->super._meDeviceName;
  self->super._meDeviceName = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSMeDeviceStore _initWithStore:]([DNDSMeDeviceStore alloc], "_initWithStore:", self);
}

@end
