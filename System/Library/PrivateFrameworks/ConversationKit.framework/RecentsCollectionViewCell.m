@implementation RecentsCollectionViewCell

- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit25RecentsCollectionViewCell *)RecentsCollectionViewCell.init(frame:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit25RecentsCollectionViewCell *v2;

  v2 = self;
  RecentsCollectionViewCell.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit25RecentsCollectionViewCell *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = RecentsCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIView)trailingAccessoryView
{
  _TtC15ConversationKit25RecentsCollectionViewCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)RecentsCollectionViewCell.trailingAccessoryView.getter();

  return (UIView *)v3;
}

- (_TtC15ConversationKit25RecentsCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RecentsCollectionViewCell.init(coder:)();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit25RecentsCollectionViewCell *v6;
  _TtC15ConversationKit25RecentsCollectionViewCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  RecentsCollectionViewCell.traitCollectionDidChange(_:)(v8);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = type metadata accessor for UICellConfigurationState();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit25RecentsCollectionViewCell_joinButton));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC15ConversationKit25RecentsCollectionViewCell_doubleTapHandler));
}

- (void)didDoubleTapWithGesture:(id)a3
{
  id v4;
  _TtC15ConversationKit25RecentsCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  RecentsCollectionViewCell.didDoubleTap(gesture:)((uint64_t)v4);

}

@end
