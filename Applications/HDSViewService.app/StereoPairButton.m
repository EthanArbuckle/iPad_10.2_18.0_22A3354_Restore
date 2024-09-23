@implementation StereoPairButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StereoPairButton();
  return -[StereoPairButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StereoPairButton();
  v4 = v5.receiver;
  -[StereoPairButton setHighlighted:](&v5, "setHighlighted:", v3);
  sub_100058E08();

}

- (_TtC14HDSViewService16StereoPairButton)initWithCoder:(id)a3
{
  return (_TtC14HDSViewService16StereoPairButton *)sub_100058B38(a3);
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StereoPairButton();
  v2 = (char *)v4.receiver;
  -[StereoPairButton layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14HDSViewService16StereoPairButton_circle], "layer", v4.receiver, v4.super_class);
  objc_msgSend(v2, "frame");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetWidth(v5) * 0.5);

  sub_100058E08();
}

- (_TtC14HDSViewService16StereoPairButton)initWithFrame:(CGRect)a3
{
  _TtC14HDSViewService16StereoPairButton *result;

  result = (_TtC14HDSViewService16StereoPairButton *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.StereoPairButton", 31, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_circle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_innerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_bottomLabel));
}

@end
