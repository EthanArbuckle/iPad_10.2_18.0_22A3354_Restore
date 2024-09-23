@implementation WrappedUITextViewCoordinator

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC8SOSBuddy28WrappedUITextViewCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1000DC184(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _TtC8SOSBuddy28WrappedUITextViewCoordinator *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1000DD52C(v7, v9);

  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  id v8;
  id v9;
  _TtC8SOSBuddy28WrappedUITextViewCoordinator *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1000DD7B8(a4, a5);

}

- (_TtC8SOSBuddy28WrappedUITextViewCoordinator)init
{
  _TtC8SOSBuddy28WrappedUITextViewCoordinator *result;

  result = (_TtC8SOSBuddy28WrappedUITextViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.WrappedUITextViewCoordinator", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView);
  v4 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView];
  v5 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView + 16];
  v6 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView + 24];
  v7 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView + 32];
  v8 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView + 72];
  v9 = *(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView + 88];
  swift_release(*(_QWORD *)&self->wrappedTextView[OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_wrappedTextView
                                                + 104]);
  swift_release(v9);
  swift_release(v8);
  swift_release(v7);
  swift_bridgeObjectRelease(v5);
  swift_release(v4);
  swift_release(v3);
  swift_release(v6);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8SOSBuddy28WrappedUITextViewCoordinator_textView);
}

@end
