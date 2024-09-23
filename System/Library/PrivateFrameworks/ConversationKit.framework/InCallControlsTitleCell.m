@implementation InCallControlsTitleCell

- (_TtC15ConversationKit23InCallControlsTitleCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit23InCallControlsTitleCell *)InCallControlsTitleCell.init(frame:)();
}

- (_TtC15ConversationKit23InCallControlsTitleCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsTitleCell.init(coder:)();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC15ConversationKit23InCallControlsTitleCell *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  isa = InCallControlsTitleCell.preferredLayoutAttributesFitting(_:)((UICollectionViewLayoutAttributes)v4).super.isa;

  return isa;
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23InCallControlsTitleCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23InCallControlsTitleCell_avatarHeaderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23InCallControlsTitleCell_avatarHeaderVCWrapper));
}

@end
