@implementation AgentRequestChatLoadResult

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE503510;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE503510 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC17IMSharedUtilities26AgentRequestChatLoadResult *v6;
  void *v7;
  void *v8;

  swift_beginAccess();
  v5 = a3;
  v6 = self;
  swift_bridgeObjectRetain();
  sub_19E247E74(&qword_1EE5035A8);
  v7 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_19E36F864();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (_TtC17IMSharedUtilities26AgentRequestChatLoadResult)initWithCoder:(id)a3
{
  id v3;
  _TtC17IMSharedUtilities26AgentRequestChatLoadResult *v4;

  v3 = a3;
  v4 = (_TtC17IMSharedUtilities26AgentRequestChatLoadResult *)sub_19E363B58();

  return v4;
}

- (_TtC17IMSharedUtilities26AgentRequestChatLoadResult)init
{
  _TtC17IMSharedUtilities26AgentRequestChatLoadResult *result;

  result = (_TtC17IMSharedUtilities26AgentRequestChatLoadResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
