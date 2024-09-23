@implementation TileCellContentView

- (void)layoutSubviews
{
  _TtC6HomeUI19TileCellContentView *v2;

  v2 = self;
  TileCellContentView.layoutSubviews()();

}

- (void)updateConstraints
{
  _TtC6HomeUI19TileCellContentView *v2;

  v2 = self;
  TileCellContentView.updateConstraints()();

}

- (HUBaseIconView)iconView
{
  return (HUBaseIconView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView));
}

- (NSArray)standardLabels
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B9439D40;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_prefixLabel);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_titleLabel);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel);
  *(_QWORD *)(v3 + 48) = v6;
  sub_1B93EDF64();
  sub_1B8F43288();
  v7 = v4;
  v8 = v5;
  v9 = v6;
  v10 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v10;
}

- (_TtC6HomeUI19TileCellContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B8F43154();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6HomeUI19TileCellContentView *v6;

  v5 = a3;
  v6 = self;
  sub_1B8F42868(a3);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC6HomeUI19TileCellContentView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  sub_1B8F42A94(width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (_TtC6HomeUI19TileCellContentView)initWithFrame:(CGRect)a3
{
  _TtC6HomeUI19TileCellContentView *result;

  result = (_TtC6HomeUI19TileCellContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI19TileCellContentView_configuration);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI19TileCellContentView_activityIndicator));

}

@end
