@implementation TickMarksVisibilityModel

- (_TtC13CameraEditKit24TickMarksVisibilityModel)initWithModel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections) = (Class)MEMORY[0x1E0DEE9E8];
  v6 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices;
  *(Class *)((char *)&self->super.isa + v6) = (Class)sub_1B9871FE0(MEMORY[0x1E0DEE9D8]);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model) = (Class)a3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = a3;
  return -[TickMarksVisibilityModel init](&v9, sel_init);
}

- (void)setNeedsRebuild
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) = 1;
}

- (BOOL)shouldHideTickMarkAtIndex:(unint64_t)a3
{
  _TtC13CameraEditKit24TickMarksVisibilityModel *v4;

  v4 = self;
  LOBYTE(a3) = sub_1B986F428(a3);

  return a3 & 1;
}

- (_TtC13CameraEditKit24TickMarksVisibilityModel)init
{
  _TtC13CameraEditKit24TickMarksVisibilityModel *result;

  result = (_TtC13CameraEditKit24TickMarksVisibilityModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
