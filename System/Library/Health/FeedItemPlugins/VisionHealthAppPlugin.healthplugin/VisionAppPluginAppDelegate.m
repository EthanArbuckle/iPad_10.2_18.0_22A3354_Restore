@implementation VisionAppPluginAppDelegate

- (_TtC21VisionHealthAppPlugin26VisionAppPluginAppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionAppPluginAppDelegate();
  return -[VisionAppPluginAppDelegate init](&v3, sel_init);
}

- (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = objc_allocWithZone((Class)type metadata accessor for VisionPrescriptionAllDataViewController());
  v8 = a3;
  v9 = a5;
  return sub_232252C10(v8, a5);
}

@end
