@implementation HideMyEmailSignupAlternateView

- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription30HideMyEmailSignupAlternateView *)sub_1BA3C58F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC16NewsSubscription30HideMyEmailSignupAlternateView *result;

  v5 = OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC16NewsSubscription30HideMyEmailSignupAlternateView *)sub_1BA438260();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark));
}

@end
