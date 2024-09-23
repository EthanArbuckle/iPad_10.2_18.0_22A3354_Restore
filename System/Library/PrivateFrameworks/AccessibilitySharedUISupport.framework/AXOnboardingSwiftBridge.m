@implementation AXOnboardingSwiftBridge

+ (id)viewControllerForType:(int64_t)a3 dismiss:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  char *v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for ViewController());
  swift_retain();
  v8 = sub_21C7901A0(a3, (uint64_t)sub_21C79135C, v6);
  swift_release();
  return v8;
}

- (_TtC28AccessibilitySharedUISupport23AXOnboardingSwiftBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXOnboardingSwiftBridge();
  return -[AXOnboardingSwiftBridge init](&v3, sel_init);
}

@end
