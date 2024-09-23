@implementation TransitIncidentsSectionView

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithConfiguration:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MUPlaceVerticalCardContainerView initWithConfiguration:](&v7, sel_initWithConfiguration_, a3);
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithShowsSeparators:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  objc_super v7;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v7, sel_initWithShowsSeparators_, v3);
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MUStackView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI27TransitIncidentsSectionView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_incidentViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TransitIncidentsSectionView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI27TransitIncidentsSectionView_feedbackDelegate);
  swift_bridgeObjectRelease();
}

@end
