@implementation InCallControlsShareLinkCell

- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit27InCallControlsShareLinkCell *)InCallControlsShareLinkCell.init(frame:)();
}

- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsShareLinkCell.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit27InCallControlsShareLinkCell *v6;
  _TtC15ConversationKit27InCallControlsShareLinkCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InCallControlsShareLinkCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_shareLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_buttonHeightConstraint));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_delegate);
}

@end
