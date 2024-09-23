@implementation FeatureStatusInputSignal.FeatureStatusObserver

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v7;
  _TtCC14HealthPlatform24FeatureStatusInputSignal21FeatureStatusObserver *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  sub_1BC7125E4(a3, v7);
  swift_unknownObjectRelease();

}

- (_TtCC14HealthPlatform24FeatureStatusInputSignal21FeatureStatusObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[FeatureStatusInputSignal.FeatureStatusObserver init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
