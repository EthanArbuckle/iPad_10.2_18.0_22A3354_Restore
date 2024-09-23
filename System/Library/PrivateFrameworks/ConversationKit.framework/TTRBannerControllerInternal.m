@implementation TTRBannerControllerInternal

- (TTRBannerControllerDelegate)delegate
{
  return (TTRBannerControllerDelegate *)(id)TTRBannerController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  TTRBannerControllerInternal *v4;

  swift_unknownObjectRetain();
  v4 = self;
  TTRBannerController.delegate.setter();

}

- (TTRBannerControllerInternal)init
{
  return (TTRBannerControllerInternal *)TTRBannerController.init()();
}

- (void)showTTRBannerWithFullLogArchive:(BOOL)a3
{
  TTRBannerControllerInternal *v3;

  v3 = self;
  TTRBannerController.showTTRBanner(useFullLogArchive:)(0);

}

- (void)buildTTRMessageBubbleRecipientsListWithGroupMessageUUID:(id)a3 with:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TTRBannerControllerInternal *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  TTRBannerController.buildTTRMessageBubbleRecipientsList(groupMessageUUID:with:)(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___TTRBannerControllerInternal_delegate);
}

@end
