@implementation ScreenSharingInteraction

- (UIView)view
{
  id v2;

  ScreenSharingInteraction.view.getter();
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5;
  _TtC15ConversationKit24ScreenSharingInteraction *v6;

  v5 = a3;
  v6 = self;
  ScreenSharingInteraction.view.setter(a3);

}

- (_TtC15ConversationKit24ScreenSharingInteraction)init
{
  ScreenSharingInteraction.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit24ScreenSharingInteraction_captureInteraction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit24ScreenSharingInteraction_interactionController));
}

- (void)willMoveToView:(id)a3
{
  id v4;
  _TtC15ConversationKit24ScreenSharingInteraction *v5;

  v4 = a3;
  v5 = self;
  ScreenSharingInteraction.willMove(to:)((UIView_optional *)v5);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC15ConversationKit24ScreenSharingInteraction *v6;

  v5 = a3;
  v6 = self;
  ScreenSharingInteraction.didMove(to:)((UIView_optional *)a3);

}

@end
