@implementation ReplayAudioAccessoryDevice

- (_TtC16HeadphoneManager26ReplayAudioAccessoryDevice)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16HeadphoneManager26ReplayAudioAccessoryDevice *)ReplayAudioAccessoryDevice.init(coder:)(a3);
}

- (id)headphoneDeviceWithCbDevice:(id)a3 withDelegate:(id)a4
{
  id v5;
  _TtC16HeadphoneManager26ReplayAudioAccessoryDevice *v6;
  id v10;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v10 = ReplayAudioAccessoryDevice.headphoneDevice(cbDevice:withDelegate:)();

  swift_unknownObjectRelease();
  return v10;
}

@end
