@implementation CustomReactionPickerEntryView

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)init
{
  _QWORD *v3;
  objc_class *v4;
  _TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction);
  v4 = (objc_class *)type metadata accessor for CustomReactionPickerEntryView();
  *v3 = 0;
  v3[1] = 0;
  v7.receiver = self;
  v7.super_class = v4;
  v5 = -[CustomReactionPickerEntryView initWithFrame:textContainer:](&v7, sel_initWithFrame_textContainer_, 0, 0.0, 0.0, 0.0, 0.0);
  -[CustomReactionPickerEntryView setKeyboardType:](v5, sel_setKeyboardType_, 124);
  -[CustomReactionPickerEntryView setForceDisableDictation:](v5, sel_setForceDisableDictation_, 1);

  return v5;
}

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  CustomReactionPickerEntryView.insertText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *result;

  v4 = a4;
  result = (_TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit29CustomReactionPickerEntryView_onReaction));
}

@end
