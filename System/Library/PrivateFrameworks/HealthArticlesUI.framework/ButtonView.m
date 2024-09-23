@implementation ButtonView

- (_TtC16HealthArticlesUI10ButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI10ButtonView *)sub_1BC9797EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI10ButtonView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD *v6;
  _TtC16HealthArticlesUI10ButtonView *result;

  v4 = OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_button;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1BC9796AC();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
  *v6 = 0;
  v6[1] = 0;

  result = (_TtC16HealthArticlesUI10ButtonView *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void)performActionWithSender:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtC16HealthArticlesUI10ButtonView *v7;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction);
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_1BC979B34((uint64_t)v3);
    v3(v6);
    sub_1BC968170((uint64_t)v3);

  }
}

- (void).cxx_destruct
{

  sub_1BC968170(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16HealthArticlesUI10ButtonView_buttonAction));
}

@end
