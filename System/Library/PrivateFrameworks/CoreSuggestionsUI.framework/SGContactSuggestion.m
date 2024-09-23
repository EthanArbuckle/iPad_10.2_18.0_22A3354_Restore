@implementation SGContactSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  void *v2;

  v2 = (void *)sub_1B1188A5C();
  return (SGSuggestionDelegate *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setSuggestionDelegate:(id)a3
{
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B1188AEC();

}

- (_TtC17CoreSuggestionsUI19SGContactSuggestion)initWithSgContact:(id)a3
{
  _TtC17CoreSuggestionsUI19SGContactSuggestion *result;

  SGContactSuggestion.init(sgContact:)(a3);
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionTitle
{
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v2;
  void *v3;

  v2 = self;
  sub_1B1188E7C();
  OUTLINED_FUNCTION_53_0();
  v3 = (void *)OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_28_0();
  return OUTLINED_FUNCTION_2_1(v3);
}

- (id)suggestionPrimaryAction
{
  void *v2;

  sub_1B1189228((uint64_t)self);
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionSubtitle
{
  uint64_t v2;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v3;

  v3 = self;
  sub_1B1189C44();
  OUTLINED_FUNCTION_61_0();

  if (v2)
  {
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    v3 = 0;
  }
  return OUTLINED_FUNCTION_2_1(v3);
}

- (id)suggestionDismissAction
{
  void *v2;

  sub_1B1189DF0((uint64_t)self);
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (int64_t)suggestionActionButtonType
{
  int64_t result;

  sub_1B1189EB8();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionImage
{
  void *v2;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v3;

  v3 = self;
  sub_1B1189EF0();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionIconSFSymbol
{
  return sub_1B1180A7C(self, (uint64_t)a2, (void (*)(void))sub_1B118A00C);
}

- (id)suggestionCategory
{
  sub_1B118A04C();
  return OUTLINED_FUNCTION_4_2(self);
}

- (id)suggestionCategoryId
{
  return sub_1B118A100(self, (uint64_t)a2, sub_1B118A074);
}

- (id)suggestionCategoryImage
{
  void *v2;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v3;

  v3 = self;
  j___s17CoreSuggestionsUI19SGContactSuggestionC12contactImageSo7UIImageCyF();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionCategoryTitle
{
  return sub_1B118A100(self, (uint64_t)a2, (void (*)(void))sub_1B118A0D8);
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, sub_1B118A13C);
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  unint64_t v5;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v5 = sub_1B11BB440();
  v6 = self;
  sub_1B118A1BC(v5);
  OUTLINED_FUNCTION_61_0();

  OUTLINED_FUNCTION_28_0();
  if (a3)
  {
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    self = 0;
  }
  return OUTLINED_FUNCTION_2_1(self);
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B118A1BC);
}

- (int64_t)suggestionCategoryActionButtonType
{
  int64_t result;

  sub_1B1189EB8();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionCategoryIconSFSymbol
{
  return sub_1B1180A7C(self, (uint64_t)a2, (void (*)(void))sub_1B118B254);
}

- (id)realtimeSuggestion
{
  void *v2;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v3;

  v3 = self;
  sub_1B118A380();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (_TtC17CoreSuggestionsUI19SGContactSuggestion)init
{
  SGContactSuggestion.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact));
  v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger;
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController));
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  CNContactViewController *v6;
  id v7;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v8;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v9;
  CNContact_optional v10;

  v6 = (CNContactViewController *)a3;
  v7 = a4;
  v8 = self;
  v10.is_nil = (char)v8;
  v9 = v8;
  v10.value.super.isa = (Class)a4;
  SGContactSuggestion.contactViewController(_:didCompleteWith:)(v6, v10);

}

- (void)confirm:(BOOL)a3 suggestion:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v11;

  v6 = a3;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = OUTLINED_FUNCTION_4_0();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1B119F804;
  }
  else
  {
    v9 = 0;
  }
  v10 = a4;
  v11 = self;
  SGContactSuggestion.confirm(_:suggestion:completion:)((const void *)v6, (uint64_t)v10, (uint64_t)v8, v9);
  sub_1B119F7D0((uint64_t)v8);

}

- (id)mailingAddressFromPostalAddress:(id)a3
{
  id v4;
  _TtC17CoreSuggestionsUI19SGContactSuggestion *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  SGContactSuggestion.mailingAddressFromPostalAddress(_:)(v4);
  OUTLINED_FUNCTION_23_4();

  v6 = (void *)sub_1B11BB398();
  OUTLINED_FUNCTION_96();
  return v6;
}

@end
