@implementation SGWalletOrderSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  sub_1B1193980();
}

- (void)setSuggestionDelegate:(id)a3
{
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B1193A04();

}

- (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion)initWithRealtimeWalletOrder:(id)a3
{
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *result;

  SGWalletOrderSuggestion.init(realtimeWalletOrder:)(a3);
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
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v2;
  void *v3;

  v2 = self;
  sub_1B1194924();
  OUTLINED_FUNCTION_53_0();
  v3 = (void *)OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_28_0();
  return OUTLINED_FUNCTION_2_1(v3);
}

- (id)suggestionSubtitle
{
  uint64_t v2;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v3;
  void *v4;

  v3 = self;
  sub_1B1194A24();
  OUTLINED_FUNCTION_61_0();

  if (!v2)
    return OUTLINED_FUNCTION_2_1(0);
  v4 = (void *)OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_2_1(v4);
}

- (id)suggestionAttributedSubtitle
{
  void *v2;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v3;

  v3 = self;
  sub_1B1194B40();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionPrimaryAction
{
  void *v2;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v3;

  v3 = self;
  sub_1B1194BB4();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (int64_t)suggestionActionButtonType
{
  int64_t result;

  sub_1B119509C();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionCategoryId
{
  return sub_1B118A100(self, (uint64_t)a2, sub_1B11950D4);
}

- (id)suggestionCategoryImage
{
  void *v2;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v3;

  v3 = self;
  sub_1B1195104();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionCategoryTitle
{
  return sub_1B118A100(self, (uint64_t)a2, (void (*)(void))sub_1B11951AC);
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B11951D0);
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  unint64_t v5;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v5 = sub_1B11BB440();
  v6 = self;
  sub_1B1195254(v5);
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
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1195254);
}

- (int64_t)suggestionCategoryActionButtonType
{
  int64_t result;

  sub_1B119509C();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)realtimeSuggestion
{
  void *v2;
  _TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *v3;

  v3 = self;
  sub_1B11954D8();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion)init
{
  SGWalletOrderSuggestion.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_suggestionDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderHelpers));
  sub_1B11958F8((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderBundleURL);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger;
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_realtimeOrderSuggestion));
}

@end
