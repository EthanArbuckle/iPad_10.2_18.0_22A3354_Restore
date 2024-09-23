@implementation FBKDevicePickerCoordinator

+ (void)showDevicePickerWithChoices:(id)a3 onViewController:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = _Block_copy(a5);
  sub_21DA3BF58(0, &qword_255399B70);
  sub_21DA405D4();
  v7 = sub_21DAC49D8();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = a4;
  _s12FeedbackCore26FBKDevicePickerCoordinatorC010showDeviceD07choices16onViewController10completionyShySo010FBKGroupedG0CG_So06UIViewK0CyAJctFZ_0(v7, v9, (uint64_t)sub_21DA40650, v8);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC12FeedbackCore26FBKDevicePickerCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBKDevicePickerCoordinator();
  return -[FBKDevicePickerCoordinator init](&v3, sel_init);
}

@end
