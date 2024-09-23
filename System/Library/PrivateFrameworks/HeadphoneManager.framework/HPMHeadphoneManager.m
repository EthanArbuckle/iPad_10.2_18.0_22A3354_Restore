@implementation HPMHeadphoneManager

+ (HPMHeadphoneManager)shared
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return (HPMHeadphoneManager *)static Headphone_Manager.shared.getter();
}

- (HPMHeadphoneMangerTopLevelEntryUIHandling)topLevelUIHandler
{
  HPMHeadphoneManager *v2;
  id v5;

  v2 = self;
  v5 = (id)Headphone_Manager.topLevelUIHandler.getter();

  return (HPMHeadphoneMangerTopLevelEntryUIHandling *)v5;
}

- (void)setTopLevelUIHandler:(id)a3
{
  HPMHeadphoneManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Headphone_Manager.topLevelUIHandler.setter();

}

- (NSDictionary)connectedRecords
{
  HPMHeadphoneManager *v2;
  Class isa;

  v2 = self;
  Headphone_Manager.connectedRecords.getter();

  type metadata accessor for HMDeviceRecord();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setConnectedRecords:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  type metadata accessor for HMDeviceRecord();
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.connectedRecords.setter(v6);

}

- (CBDeviceReporting)deviceConnectionListener
{
  HPMHeadphoneManager *v2;
  id v5;

  v2 = self;
  v5 = (id)Headphone_Manager.deviceConnectionListener.getter();

  return (CBDeviceReporting *)v5;
}

- (void)setDeviceConnectionListener:(id)a3
{
  HPMHeadphoneManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Headphone_Manager.deviceConnectionListener.setter();

}

- (NSDictionary)connectedHeadphones
{
  HPMHeadphoneManager *v2;
  Class isa;

  v2 = self;
  Headphone_Manager.connectedHeadphones.getter();

  type metadata accessor for HeadphoneDevice();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setConnectedHeadphones:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  type metadata accessor for HeadphoneDevice();
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.connectedHeadphones.setter(v6);

}

- (NSDictionary)pendingConnectedHeadphones
{
  HPMHeadphoneManager *v2;
  Class isa;

  v2 = self;
  Headphone_Manager.pendingConnectedHeadphones.getter();

  type metadata accessor for HeadphoneDevice();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setPendingConnectedHeadphones:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  type metadata accessor for HeadphoneDevice();
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.pendingConnectedHeadphones.setter(v6);

}

- (HPMHeadphoneManager)init
{
  return (HPMHeadphoneManager *)Headphone_Manager.init()();
}

- (void)dealloc
{
  HPMHeadphoneManager *v2;

  v2 = self;
  Headphone_Manager.__deallocating_deinit();
}

- (void).cxx_destruct
{

  outlined destroy of weak HeadphoneMangerTopLevelEntryUIHandling?();
  outlined destroy of HMServiceClient?((id *)((char *)&self->super.isa
                                            + OBJC_IVAR___HPMHeadphoneManager____lazy_storage___hmsClient));
  outlined destroy of [String : HMDeviceRecord]();
  outlined destroy of weak CBDeviceReporting?();
  outlined destroy of [String : HeadphoneDevice]();
  outlined destroy of [String : HeadphoneDevice]();
}

- (BOOL)isAppleHeadphoneWithCbDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.isAppleHeadphone(cbDevice:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)updateDeviceConfigWithHpDevice:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  HPMHeadphoneManager *v7;

  v5 = a3;
  v6 = a4;
  v7 = self;
  Headphone_Manager.updateDeviceConfig(hpDevice:settings:)((char *)a3, a4);

}

- (void)disconnectWithHpDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.disconnect(hpDevice:)(a3);

}

- (void)unpairWithHpDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.unpair(hpDevice:)(a3);

}

- (void)updateTitleBar
{
  HPMHeadphoneManager *v2;

  v2 = self;
  Headphone_Manager.updateTitleBar()();

}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.addTopLevelEntry(hpDevice:)((uint64_t)a3);

}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.updateTopLevelEntry(hpDevice:)((uint64_t)a3);

}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPMHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  Headphone_Manager.removeTopLevelEntry(hpDevice:)((uint64_t)a3);

}

@end
