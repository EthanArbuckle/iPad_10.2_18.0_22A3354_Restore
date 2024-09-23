@implementation ChangeHistoryProcessor

- (void)visitDeleteContactEvent:(id)a3
{
  void (*v4)(uint64_t, uint64_t);
  id v5;
  _TtC14CopresenceCore22ChangeHistoryProcessor *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC14CopresenceCore22ChangeHistoryProcessor_onContactDeleted);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v5, sel_contactIdentifier);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v4(v8, v10);
  swift_bridgeObjectRelease();
}

- (_TtC14CopresenceCore22ChangeHistoryProcessor)init
{
  _TtC14CopresenceCore22ChangeHistoryProcessor *result;

  result = (_TtC14CopresenceCore22ChangeHistoryProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
