@implementation SGWalletPassSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  id v2;

  sub_1B11A6EFC();
  return (SGSuggestionDelegate *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setSuggestionDelegate:(id)a3
{
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B11A6F6C();
  OUTLINED_FUNCTION_3(v4);
}

- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)initWithRealtimeWalletPass:(id)a3
{
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *result;

  SGWalletPassSuggestion.init(realtimeWalletPass:)(a3);
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionCategory
{
  sub_1B118A04C();
  return OUTLINED_FUNCTION_4_2(self);
}

- (id)suggestionTitle
{
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v2;
  void *v3;

  v2 = self;
  sub_1B11A79E4();
  OUTLINED_FUNCTION_53_0();
  v3 = (void *)OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_28_0();
  return OUTLINED_FUNCTION_2_1(v3);
}

- (id)suggestionSubtitle
{
  uint64_t v2;
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v3;
  void *v4;

  v3 = self;
  sub_1B11A7B5C();
  OUTLINED_FUNCTION_61_0();

  if (!v2)
    return OUTLINED_FUNCTION_2_1(0);
  v4 = (void *)OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_2_1(v4);
}

- (id)suggestionPrimaryAction
{
  void *v2;
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v3;

  v3 = self;
  sub_1B11A7E10();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (int64_t)suggestionActionButtonType
{
  int64_t result;

  sub_1B11A816C();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionCategoryId
{
  return sub_1B118A100(self, (uint64_t)a2, sub_1B11A81A4);
}

- (id)suggestionCategoryImage
{
  void *v2;
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v3;

  v3 = self;
  sub_1B11A81D8();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionCategoryTitle
{
  return sub_1B118A100(self, (uint64_t)a2, (void (*)(void))sub_1B11A827C);
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B11A82A0);
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  unint64_t v5;
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v5 = sub_1B11BB440();
  v6 = self;
  sub_1B11A8328(v5);
  OUTLINED_FUNCTION_61_0();

  OUTLINED_FUNCTION_28_0();
  if (!a3)
    return OUTLINED_FUNCTION_2_1(0);
  v7 = (void *)OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_2_1(v7);
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B11A8328);
}

- (int64_t)suggestionCategoryActionButtonType
{
  int64_t result;

  sub_1B11A816C();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)realtimeSuggestion
{
  void *v2;
  _TtC17CoreSuggestionsUI22SGWalletPassSuggestion *v3;

  v3 = self;
  sub_1B11A846C();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (_TtC17CoreSuggestionsUI22SGWalletPassSuggestion)init
{
  SGWalletPassSuggestion.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_suggestionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger;
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passViewManager));
}

@end
