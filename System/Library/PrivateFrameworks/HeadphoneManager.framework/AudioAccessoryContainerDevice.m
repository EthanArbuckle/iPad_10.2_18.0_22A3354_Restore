@implementation AudioAccessoryContainerDevice

- (_TtC16HeadphoneManager29AudioAccessoryContainerDevice)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16HeadphoneManager29AudioAccessoryContainerDevice *)AudioAccessoryContainerDevice.init(coder:)(a3);
}

- (CBDevice)coreBluetoothDevice
{
  _TtC16HeadphoneManager29AudioAccessoryContainerDevice *v2;
  id v5;

  v2 = self;
  v5 = AudioAccessoryContainerDevice.coreBluetoothDevice.getter();

  return (CBDevice *)v5;
}

- (_TtC16HeadphoneManager29AudioAccessoryContainerDevice)init
{
  return (_TtC16HeadphoneManager29AudioAccessoryContainerDevice *)AudioAccessoryContainerDevice.init()();
}

- (void).cxx_destruct
{
  outlined destroy of CBDevice?((id *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC16HeadphoneManager29AudioAccessoryContainerDevice__cbDevice));
}

@end
