@implementation SearchPreparingView

- (void)updateWith:(id)a3
{
  id v4;
  _TtC6MailUI19SearchPreparingView *v5;

  v4 = a3;
  v5 = self;
  sub_1D5649914(a3);

}

- (_TtC6MailUI19SearchPreparingView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI19SearchPreparingView *)sub_1D56499E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI19SearchPreparingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D564A404();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel));
  sub_1D5565D18((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus));
}

@end
