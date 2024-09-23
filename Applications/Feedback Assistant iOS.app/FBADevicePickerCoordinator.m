@implementation FBADevicePickerCoordinator

+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = _Block_copy(a5);
  v8 = sub_100053458(0, (unint64_t *)&unk_100116F70, FBKGroupedDevice_ptr);
  v9 = sub_10005BE04();
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v8, v9);
  v11 = swift_allocObject(&unk_1000EA270, 24, 7);
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a4;
  sub_10008F400(v10, v12, (uint64_t)sub_10006FBEC, v11);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

- (_TtC18Feedback_Assistant26FBADevicePickerCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBADevicePickerCoordinator();
  return -[FBADevicePickerCoordinator init](&v3, "init");
}

@end
