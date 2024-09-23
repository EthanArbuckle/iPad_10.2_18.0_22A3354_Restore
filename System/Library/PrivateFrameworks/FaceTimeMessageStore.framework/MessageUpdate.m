@implementation MessageUpdate

+ (BOOL)supportsSecureCoding
{
  return static MessageUpdate.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static MessageUpdate.supportsSecureCoding.setter(a3);
}

- (_TtC20FaceTimeMessageStore13MessageUpdate)initWithCoder:(id)a3
{
  id v3;
  _TtC20FaceTimeMessageStore13MessageUpdate *result;

  v3 = a3;
  MessageUpdate.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore13MessageUpdate *v5;

  v4 = a3;
  v5 = self;
  MessageUpdate.encode(with:)((NSCoder)v4);

}

- (NSString)description
{
  _TtC20FaceTimeMessageStore13MessageUpdate *v2;
  void *v3;

  v2 = self;
  MessageUpdate.description.getter();

  v3 = (void *)sub_23B3D5228();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore13MessageUpdate)init
{
  MessageUpdate.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_recordUUID;
  v4 = OUTLINED_FUNCTION_134();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_29_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_callUUID);
  OUTLINED_FUNCTION_29_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_conversationID);
  OUTLINED_FUNCTION_84_4();
  OUTLINED_FUNCTION_84_4();
  OUTLINED_FUNCTION_84_4();
  sub_23B305768((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_transcriptURL, (uint64_t *)&unk_2542F19F0);
  OUTLINED_FUNCTION_84_4();
  sub_23B305768((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_dateCreated, (uint64_t *)&unk_2542EF570);
}

@end
