@implementation SystemAssistantPromptEntryView

- (double)minimumTextFieldHeight
{
  double v2;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView), "intrinsicContentSize");
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtP4Siri38SystemAssistantPromptEntryViewDelegate_)delegate
{
  return (_TtP4Siri38SystemAssistantPromptEntryViewDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_delegate, a3);
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3 dictationReplacementAction:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  char *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = sub_10009512C((uint64_t)a4, x, y, width, height);

  return (_TtC4Siri30SystemAssistantPromptEntryView *)v10;
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  _TtC4Siri30SystemAssistantPromptEntryView *v4;

  v3 = !a3;
  v4 = self;
  dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonVisible.setter(v3);

}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC4Siri30SystemAssistantPromptEntryView *v6;
  void *v7;
  id v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  v7 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "setText:", v8);

  swift_bridgeObjectRelease(v5);
}

- (void)clearText
{
  void *v2;
  void *v3;
  NSString v4;
  _TtC4Siri30SystemAssistantPromptEntryView *v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView);
  v5 = self;
  v3 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v2, "invalidateIntrinsicContentSize");
}

- (void)resignKeyboard
{
  _TtC4Siri30SystemAssistantPromptEntryView *v2;
  id v3;

  v2 = self;
  v3 = (id)IntelligenceUI.PromptEntryView.textView.getter();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)prefillWithText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC4Siri30SystemAssistantPromptEntryView *v7;
  void *v8;
  NSString v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView);
  v7 = self;
  v8 = (void *)IntelligenceUI.PromptEntryView.textView.getter(v7);
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setText:", v9);

  sub_100095774((uint64_t)objc_msgSend(v6, "invalidateIntrinsicContentSize"));
  swift_bridgeObjectRelease(v5);
}

- (BOOL)becomeFirstResponder
{
  _TtC4Siri30SystemAssistantPromptEntryView *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = (void *)IntelligenceUI.PromptEntryView.textView.getter();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  return v4;
}

- (BOOL)resignFirstResponder
{
  _TtC4Siri30SystemAssistantPromptEntryView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100094620();

  return v3 & 1;
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  sub_1000958B8((uint64_t)v3, v4, v5);
}

- (void)promptEntryViewDidSubmitWithoutViewForSuggestionWithInvocationText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC4Siri30SystemAssistantPromptEntryView *v9;
  uint64_t v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_textIsProvidedBySuggestion) = 1;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_invocationTextForSuggestion);
  v8 = *(_QWORD *)&self->textIsProvidedBySuggestion[OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_invocationTextForSuggestion];
  *v7 = v4;
  v7[1] = v5;
  v9 = self;
  swift_bridgeObjectRetain(v6);
  v10 = swift_bridgeObjectRelease(v8);
  sub_100095970(v10);

  swift_bridgeObjectRelease(v6);
}

- (void)promptEntryViewDidSubmitWithoutView
{
  _TtC4Siri30SystemAssistantPromptEntryView *v2;

  v2 = self;
  sub_100095970((uint64_t)v2);

}

- (void)makeTextViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  _TtC4Siri30SystemAssistantPromptEntryView *v4;
  void *v5;
  double v6;
  id v7;

  v3 = a3;
  v4 = self;
  v5 = (void *)IntelligenceUI.PromptEntryView.textView.getter(v4);
  v7 = v5;
  v6 = 0.0;
  if (v3)
    v6 = 1.0;
  objc_msgSend(v5, "setAlpha:", v6);

}

- (void)stopLatencyAnimationIfNeeded
{
  _TtC4Siri30SystemAssistantPromptEntryView *v2;

  v2 = self;
  sub_10009488C((uint64_t)v2);

}

- (void)textViewWillPresentEditMenu:(id)a3
{
  sub_100094AEC((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_promptEntryViewWillPresentEditMenu_);
}

- (void)textViewDidDismissEditMenu:(id)a3
{
  sub_100094AEC((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_promptEntryDidDismissEditMenu_);
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3
{
  _TtC4Siri30SystemAssistantPromptEntryView *result;

  result = (_TtC4Siri30SystemAssistantPromptEntryView *)_swift_stdlib_reportUnimplementedInitializer("Siri.SystemAssistantPromptEntryView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->textIsProvidedBySuggestion[OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_invocationTextForSuggestion]);
  sub_1000769B8((uint64_t)self + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri30SystemAssistantPromptEntryView_entryView));
}

@end
