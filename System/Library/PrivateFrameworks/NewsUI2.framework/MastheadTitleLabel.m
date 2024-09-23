@implementation MastheadTitleLabel

- (_TtC7NewsUI218MastheadTitleLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model) = (Class)0xF000000000000007;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_cachedAccessibilityLabel);
  *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MastheadTitleLabel initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI218MastheadTitleLabel)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7NewsUI218MastheadTitleLabel *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model) = (Class)0xF000000000000007;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_cachedAccessibilityLabel);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC7NewsUI218MastheadTitleLabel *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5F73A14(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model));
  swift_bridgeObjectRelease();
}

- (NSString)accessibilityLabel
{
  _TtC7NewsUI218MastheadTitleLabel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1D6356160();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
