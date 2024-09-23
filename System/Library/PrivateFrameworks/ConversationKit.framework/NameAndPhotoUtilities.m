@implementation NameAndPhotoUtilities

+ (void)prewarm
{
  swift_getObjCClassMetadata();
  static NameAndPhotoUtilities.prewarm()();
}

- (_TtC15ConversationKit21NameAndPhotoUtilities)init
{
  return (_TtC15ConversationKit21NameAndPhotoUtilities *)NameAndPhotoUtilities.init()();
}

- (void)handleIdsStatusChanged
{
  _TtC15ConversationKit21NameAndPhotoUtilities *v2;

  v2 = self;
  NameAndPhotoUtilities.handleIdsStatusChanged()();

}

- (void)handlePersonalNicknameChanged:(id)a3
{
  id v4;
  _TtC15ConversationKit21NameAndPhotoUtilities *v5;

  v4 = a3;
  v5 = self;
  NameAndPhotoUtilities.handlePersonalNicknameChanged(_:)((NSNotification)v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_personalNickname));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_delegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_personalAvatarView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_imNicknameProvider);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_imNicknameController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_contactStore);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21NameAndPhotoUtilities_idsLookupManager));
}

@end
