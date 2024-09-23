@implementation AvatarViewControllerDelegateWrapper

- (id)hostingViewControllerForController:(id)a3
{
  _TtC15ConversationKit35AvatarViewControllerDelegateWrapper *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)AvatarViewControllerDelegateWrapper.hostingViewController(for:)();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC15ConversationKit35AvatarViewControllerDelegateWrapper)init
{
  AvatarViewControllerDelegateWrapper.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
