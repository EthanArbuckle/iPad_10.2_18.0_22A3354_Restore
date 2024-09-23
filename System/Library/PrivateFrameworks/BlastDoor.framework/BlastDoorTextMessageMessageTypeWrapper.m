@implementation BlastDoorTextMessageMessageTypeWrapper

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage.MessageType, &OBJC_IVAR___BlastDoorTextMessageMessageTypeWrapper_textMessage_MessageType);
}

- (unint64_t)type
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_1AD4D8498();
  v4 = v3;

  return v4;
}

- (BlastDoorTypingIndicator)typingIndicator
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8734();

  return (BlastDoorTypingIndicator *)v3;
}

- (BlastDoorMessage)textMessage
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8880();

  return (BlastDoorMessage *)v3;
}

- (BlastDoorTapBack)tapback
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D89E0();

  return (BlastDoorTapBack *)v3;
}

- (BlastDoorBalloonPlugin)balloonPlugin
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8B44();

  return (BlastDoorBalloonPlugin *)v3;
}

- (BlastDoorSticker)sticker
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8CFC();

  return (BlastDoorSticker *)v3;
}

- (BlastDoorAudioMessage)audioMessage
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8E70();

  return (BlastDoorAudioMessage *)v3;
}

- (BlastDoorEmojiTapBack)emojiTapback
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D8FAC();

  return (BlastDoorEmojiTapBack *)v3;
}

- (BlastDoorStickerTapBack)stickerTapback
{
  BlastDoorTextMessageMessageTypeWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D9120();

  return (BlastDoorStickerTapBack *)v3;
}

- (BlastDoorTextMessageMessageTypeWrapper)init
{
  BlastDoorTextMessageMessageTypeWrapper *result;

  result = (BlastDoorTextMessageMessageTypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorTextMessageMessageTypeWrapper_textMessage_MessageType, type metadata accessor for TextMessage.MessageType);
}

@end
