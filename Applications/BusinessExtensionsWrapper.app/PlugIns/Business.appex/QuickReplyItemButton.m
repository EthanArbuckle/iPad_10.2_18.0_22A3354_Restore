@implementation QuickReplyItemButton

- (_TtC8Business20QuickReplyItemButton)initWithCoder:(id)a3
{
  id v4;
  _TtC8Business20QuickReplyItemButton *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20QuickReplyItemButton____lazy_storage___titleLabel) = 0;
  v4 = a3;

  result = (_TtC8Business20QuickReplyItemButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/QuickReplyItemButton.swift", 35, 2, 65, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickReplyItemButton();
  return -[QuickReplyItemButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8Business20QuickReplyItemButton *v4;

  v4 = self;
  sub_100060DBC(a3);

}

- (_TtC8Business20QuickReplyItemButton)initWithFrame:(CGRect)a3
{
  _TtC8Business20QuickReplyItemButton *result;

  result = (_TtC8Business20QuickReplyItemButton *)_swift_stdlib_reportUnimplementedInitializer("Business.QuickReplyItemButton", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20QuickReplyItemButton____lazy_storage___titleLabel));
}

@end
