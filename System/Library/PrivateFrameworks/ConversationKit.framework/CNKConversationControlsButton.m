@implementation CNKConversationControlsButton

- (CNKConversationControlsButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsButton.init(coder:)();
}

- (NSString)description
{
  return (NSString *)@objc ConversationControlsButton.description.getter(self, (uint64_t)a2, ConversationControlsButton.description.getter);
}

- (void)layoutSubviews
{
  CNKConversationControlsButton *v2;

  v2 = self;
  ConversationControlsButton.layoutSubviews()();

}

- (void)didMoveToWindow
{
  CNKConversationControlsButton *v2;

  v2 = self;
  ConversationControlsButton.didMoveToWindow()();

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  @objc ConversationControlsButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))ConversationControlsButton.contextMenuInteraction(_:willDisplayMenuFor:animator:));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  @objc ConversationControlsButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))ConversationControlsButton.contextMenuInteraction(_:willEndFor:animator:));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  CNKConversationControlsButton *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  v9 = (void *)ConversationControlsButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  CNKConversationControlsButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)ConversationControlsButton._contextMenuInteraction(_:styleForMenuWith:)((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  CNKConversationControlsButton *v5;
  CGPoint v6;
  double x;
  double y;
  CGPoint result;

  v4 = a3;
  v5 = self;
  v6 = ConversationControlsButton.menuAttachmentPoint(for:)((UIContextMenuConfiguration)v4);

  x = v6.x;
  y = v6.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CNKConversationControlsButton)initWithFrame:(CGRect)a3
{
  ConversationControlsButton.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___CNKConversationControlsButton_delegate);
  swift_bridgeObjectRelease();
}

@end
