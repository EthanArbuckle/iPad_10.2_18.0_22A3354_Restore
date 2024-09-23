@implementation ControlsGalleryIconListLayoutProvider

- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)init
{
  return (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider *)sub_2384F7878();
}

- (_TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  void *v6;
  _TtC23ControlCenterUIServices37ControlsGalleryIconListLayoutProvider *v7;
  objc_super v9;

  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256916518);
  sub_2384F30B0(&qword_256915E40, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_2385082A8);
  sub_238506B18();
  swift_unknownObjectRetain();
  v6 = (void *)sub_238506B0C();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ControlsGalleryIconListLayoutProvider();
  v7 = -[SBHCustomIconListLayoutProvider initWithListLayouts:defaultLayout:](&v9, sel_initWithListLayouts_defaultLayout_, v6, a4);

  swift_unknownObjectRelease();
  return v7;
}

@end
