@implementation PaddedView

- (_TtC15HealthRecordsUI10PaddedView)initWithCoder:(id)a3
{
  _TtC15HealthRecordsUI10PaddedView *result;

  result = (_TtC15HealthRecordsUI10PaddedView *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC15HealthRecordsUI10PaddedView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_contentView);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;
  v11 = *(double *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_bottomPadding);

  v12 = v10 + v11;
  v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaddedView();
  v2 = (char *)v3.receiver;
  -[PaddedView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_contentView], sel_setFrame_);

}

- (_TtC15HealthRecordsUI10PaddedView)initWithFrame:(CGRect)a3
{
  _TtC15HealthRecordsUI10PaddedView *result;

  result = (_TtC15HealthRecordsUI10PaddedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
