@implementation HPSHeaderView

- (_TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = sub_1DB3BC340();
  v9 = v8;
  if (a4)
  {
    sub_1DB3BC340();
    a4 = v10;
  }
  v11 = a5;
  return (_TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView *)sub_1DB3AA0FC(v7, v9, (uint64_t)a4, a5);
}

- (_TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView *result;

  result = (_TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel));
}

@end
