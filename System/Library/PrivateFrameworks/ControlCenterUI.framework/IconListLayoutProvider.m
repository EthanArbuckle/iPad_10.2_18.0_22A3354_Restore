@implementation IconListLayoutProvider

- (_TtC15ControlCenterUI22IconListLayoutProvider)init
{
  return (_TtC15ControlCenterUI22IconListLayoutProvider *)sub_1CFBEF880();
}

- (_TtC15ControlCenterUI22IconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  void *v6;
  _TtC15ControlCenterUI22IconListLayoutProvider *v7;
  objc_super v9;

  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90ADB8);
  sub_1CFBB5C0C((unint64_t *)&unk_1ED90AD90, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC01A88);
  sub_1CFBFA84C();
  swift_unknownObjectRetain();
  v6 = (void *)sub_1CFBFA840();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListLayoutProvider();
  v7 = -[SBHCustomIconListLayoutProvider initWithListLayouts:defaultLayout:](&v9, sel_initWithListLayouts_defaultLayout_, v6, a4);

  swift_unknownObjectRelease();
  return v7;
}

@end
