@implementation Message

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore7Message *v5;

  v4 = a3;
  v5 = self;
  sub_23B308F74();

}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_100_1(v3);
  OUTLINED_FUNCTION_146((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_callUUID);
  OUTLINED_FUNCTION_146((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_conversationID);
  v4 = (char *)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_messageFile;
  v5 = OUTLINED_FUNCTION_29_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  OUTLINED_FUNCTION_51_8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_messageThumbnail);
  OUTLINED_FUNCTION_51_8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message__transcript);
  OUTLINED_FUNCTION_84_4();
  OUTLINED_FUNCTION_84_4();
  v6 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_100_1(v6);
  OUTLINED_FUNCTION_146((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_dateModified);
  OUTLINED_FUNCTION_84_4();
  OUTLINED_FUNCTION_84_4();
  swift_bridgeObjectRelease();

}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static Message.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static Message.supportsSecureCoding.setter(a3);
}

- (NSString)description
{
  _TtC20FaceTimeMessageStore7Message *v2;
  void *v3;

  v2 = self;
  sub_23B376620();

  v3 = (void *)sub_23B3D5228();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore7Message)init
{
  Message.init()();
}

@end
