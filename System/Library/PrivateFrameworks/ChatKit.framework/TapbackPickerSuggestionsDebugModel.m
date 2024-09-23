@implementation TapbackPickerSuggestionsDebugModel

- (_TtC7ChatKit34TapbackPickerSuggestionsDebugModel)init
{
  _TtC7ChatKit34TapbackPickerSuggestionsDebugModel *result;

  result = (_TtC7ChatKit34TapbackPickerSuggestionsDebugModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit34TapbackPickerSuggestionsDebugModel___observationRegistrar;
  v4 = sub_18E766494();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  _TtC7ChatKit34TapbackPickerSuggestionsDebugModel *v8;
  void *v9;
  int v10;

  sub_18E768984();
  v7 = a3;
  v8 = self;
  v9 = (void *)sub_18E768954();
  v10 = CEMStringContainsEmoji();

  swift_bridgeObjectRelease();
  return v10 != 0;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC7ChatKit34TapbackPickerSuggestionsDebugModel *v5;

  v4 = a3;
  v5 = self;
  sub_18E527930(v4);

}

@end
