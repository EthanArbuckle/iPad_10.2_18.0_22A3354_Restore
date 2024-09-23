@implementation SystemApertureButton

- (_TtC15ConversationKit20SystemApertureButton)initWithCoder:(id)a3
{
  SystemApertureButton.init(coder:)();
}

- (NSString)description
{
  return (NSString *)@objc ConversationControlsButton.description.getter(self, (uint64_t)a2, SystemApertureButton.description.getter);
}

- (void)layoutSubviews
{
  _TtC15ConversationKit20SystemApertureButton *v2;

  v2 = self;
  SystemApertureButton.layoutSubviews()();

}

- (void)didMoveToWindow
{
  _TtC15ConversationKit20SystemApertureButton *v2;

  v2 = self;
  SystemApertureButton.didMoveToWindow()();

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  @objc ConversationControlsButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))SystemApertureButton.contextMenuInteraction(_:willDisplayMenuFor:animator:));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  @objc ConversationControlsButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))SystemApertureButton.contextMenuInteraction(_:willEndFor:animator:));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC15ConversationKit20SystemApertureButton *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  v9 = (void *)SystemApertureButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit20SystemApertureButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)SystemApertureButton._contextMenuInteraction(_:styleForMenuWith:)((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  _TtC15ConversationKit20SystemApertureButton *v5;
  CGPoint v6;
  double x;
  double y;
  CGPoint result;

  v4 = a3;
  v5 = self;
  v6 = SystemApertureButton.menuAttachmentPoint(for:)((UIContextMenuConfiguration)v4);

  x = v6.x;
  y = v6.y;
  result.y = y;
  result.x = x;
  return result;
}

- (_TtC15ConversationKit20SystemApertureButton)initWithFrame:(CGRect)a3
{
  SystemApertureButton.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
