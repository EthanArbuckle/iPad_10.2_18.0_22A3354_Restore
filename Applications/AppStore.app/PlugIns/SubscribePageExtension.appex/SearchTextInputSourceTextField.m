@implementation SearchTextInputSourceTextField

- (void)textFieldDidEdit:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension30SearchTextInputSourceTextField *v5;

  v4 = a3;
  v5 = self;
  sub_10018947C();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC22SubscribePageExtension30SearchTextInputSourceTextField *v12;
  uint64_t v13;

  length = a4.length;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = (char *)a3;
  v12 = self;
  LOBYTE(length) = sub_100188D94(v11, v13, length, v8, v10);

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  uint64_t ObjectType;
  id v6;
  id v7;
  _TtC22SubscribePageExtension30SearchTextInputSourceTextField *v8;

  ObjectType = swift_getObjectType();
  if (swift_conformsToProtocol2(ObjectType, &protocol descriptor for GhostHintTextDisplayable))
    v6 = a3;
  else
    v6 = 0;
  if (v6)
  {
    v7 = a3;
    v8 = self;
    sub_10018A7B4(0, 0);

  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return 1;
}

- (_TtC22SubscribePageExtension30SearchTextInputSourceTextField)init
{
  _TtC22SubscribePageExtension30SearchTextInputSourceTextField *result;

  result = (_TtC22SubscribePageExtension30SearchTextInputSourceTextField *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.SearchTextInputSourceTextField", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30SearchTextInputSourceTextField_textField));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30SearchTextInputSourceTextField_scribbleInteraction));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30SearchTextInputSourceTextField_onSnapshotDidUpdate));
}

@end
