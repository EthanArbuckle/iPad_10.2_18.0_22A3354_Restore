@implementation HFDashboardReorderableItemList

- (HFDashboardReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  void *v6;
  HFDashboardReorderableItemList *v7;
  objc_super v9;

  sub_1DD63E14C();
  swift_unknownObjectRetain();
  v6 = (void *)sub_1DD63E11C();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DashboardReorderableItemList();
  v7 = -[HFReorderableItemList initWithApplicationDataContainer:category:](&v9, sel_initWithApplicationDataContainer_category_, a3, v6);

  swift_unknownObjectRelease();
  return v7;
}

@end
