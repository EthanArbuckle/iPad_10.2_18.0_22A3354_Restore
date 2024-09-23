@implementation SignInOptionCell

- (_TtC14AppleIDSetupUI16SignInOptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_2367372DC();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC14AppleIDSetupUI16SignInOptionCell *)sub_236727940(a3, (uint64_t)a4, v6);
}

- (_TtC14AppleIDSetupUI16SignInOptionCell)initWithCoder:(id)a3
{
  _TtC14AppleIDSetupUI16SignInOptionCell *result;

  result = (_TtC14AppleIDSetupUI16SignInOptionCell *)sub_23673757C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI16SignInOptionCell_icon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI16SignInOptionCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI16SignInOptionCell_subTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI16SignInOptionCell_containerView));
}

@end
