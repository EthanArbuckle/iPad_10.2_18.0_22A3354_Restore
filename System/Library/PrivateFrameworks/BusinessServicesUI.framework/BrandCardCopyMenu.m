@implementation BrandCardCopyMenu

- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithCoder:(id)a3
{
  _TtC18BusinessServicesUI17BrandCardCopyMenu *result;

  sub_2303BBA74(a3);
  return result;
}

- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  _QWORD *v9;
  objc_class *v10;
  _TtC18BusinessServicesUI17BrandCardCopyMenu *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip);
  v10 = (objc_class *)type metadata accessor for BrandCardCopyMenu();
  *v9 = 0;
  v9[1] = 0;
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[BrandCardCopyMenu initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_2303BBC8C();

  return v11;
}

- (void)handleLongPress:(id)a3
{
  id v4;
  _TtC18BusinessServicesUI17BrandCardCopyMenu *v5;

  v4 = a3;
  v5 = self;
  sub_2303BC108();

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC18BusinessServicesUI17BrandCardCopyMenu *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_2303BC1D8();

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
