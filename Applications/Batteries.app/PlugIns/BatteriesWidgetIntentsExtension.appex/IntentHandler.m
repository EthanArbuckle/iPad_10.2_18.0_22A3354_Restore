@implementation IntentHandler

- (_TtC31BatteriesWidgetIntentsExtension13IntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v3, "init");
}

- (void)provideDeviceOptionsCollectionForViewPossibleDevices:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC31BatteriesWidgetIntentsExtension13IntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100005C14(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (id)defaultDeviceForViewPossibleDevices:(id)a3
{
  id v4;
  _TtC31BatteriesWidgetIntentsExtension13IntentHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000063EC(v4);

  return v6;
}

@end
