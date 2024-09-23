@implementation BannerActivityManager

+ (_TtC15ConversationKit21BannerActivityManager)sharedManager
{
  return (_TtC15ConversationKit21BannerActivityManager *)static BannerActivityManager.shared.getter();
}

- (_TtC15ConversationKit21BannerActivityManager)init
{
  _TtC15ConversationKit21BannerActivityManager *result;

  BannerActivityManager.init()();
  return result;
}

- (void).cxx_destruct
{

  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21BannerActivityManager__bannerPresentationManager);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21BannerActivityManager__callUIPresentationStateProvider);
  swift_release();
  OUTLINED_FUNCTION_32_2();
}

@end
