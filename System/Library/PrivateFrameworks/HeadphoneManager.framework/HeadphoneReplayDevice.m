@implementation HeadphoneReplayDevice

- (NSString)name
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = self;
  v6 = HeadphoneReplayDevice.name.getter();
  v7 = v3;

  v8 = (id)MEMORY[0x24263ADA4](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (void)setName:(id)a3
{
  id v4;
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v5;

  v4 = a3;
  v5 = self;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneReplayDevice.name.setter();

}

- (unsigned)accessorySettingFeatureBitMask
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  unsigned int v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.accessorySettingFeatureBitMask.getter();

  return v5;
}

- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.accessorySettingFeatureBitMask.setter(a3);

}

- (unsigned)deviceColor
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  unsigned int v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.deviceColor.getter();

  return v5;
}

- (void)setDeviceColor:(unsigned int)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.deviceColor.setter(a3);

}

- (CBProductInfo)productInfo
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.productInfo.getter();

  return (CBProductInfo *)v5;
}

- (void)setProductInfo:(id)a3
{
  id v4;
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v5;

  v4 = a3;
  v5 = self;
  HeadphoneReplayDevice.productInfo.setter(a3);

}

- (float)batteryLevelMain
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.batteryLevelMain.getter();

  return v5;
}

- (void)setBatteryLevelMain:(float)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.batteryLevelMain.setter();

}

- (float)batteryLevelCase
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.batteryLevelCase.getter();

  return v5;
}

- (void)setBatteryLevelCase:(float)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.batteryLevelCase.setter();

}

- (float)batteryLevelLeft
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.batteryLevelLeft.getter();

  return v5;
}

- (void)setBatteryLevelLeft:(float)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.batteryLevelLeft.setter();

}

- (float)batteryLevelRight
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneReplayDevice.batteryLevelRight.getter();

  return v5;
}

- (void)setBatteryLevelRight:(float)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.batteryLevelRight.setter();

}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  _TtC16HeadphoneManager21HeadphoneReplayDevice *v3;

  v3 = self;
  HeadphoneReplayDevice.isServiceSupported(_:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void).cxx_destruct
{
  outlined destroy of ReplayData?();
  outlined destroy of [AnyCancellable]();
}

@end
