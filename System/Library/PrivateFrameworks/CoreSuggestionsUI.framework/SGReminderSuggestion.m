@implementation SGReminderSuggestion

- (SGSuggestionDelegate)suggestionDelegate
{
  void *v2;

  v2 = (void *)sub_1B119ABD4();
  return (SGSuggestionDelegate *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setSuggestionDelegate:(id)a3
{
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B119AC54();

}

- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)initWithRealtimeReminder:(id)a3
{
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *result;

  SGReminderSuggestion.init(realtimeReminder:)(a3);
  OUTLINED_FUNCTION_41();
  return result;
}

- (NSAttributedString)title
{
  void *v2;

  sub_1B119B11C((uint64_t)self);
  OUTLINED_FUNCTION_23();
  return (NSAttributedString *)OUTLINED_FUNCTION_4_2(v2);
}

- (NSAttributedString)notes
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  sub_1B119B1D4();
  OUTLINED_FUNCTION_23();
  return (NSAttributedString *)OUTLINED_FUNCTION_4_2(v2);
}

- (NSDateComponents)dueDateComponents
{
  uint64_t v2;
  uint64_t v4;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v5;
  uint64_t v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11AE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_120();
  v5 = self;
  sub_1B119B2DC(v2);

  v6 = OUTLINED_FUNCTION_35_4();
  v7 = 0;
  if (__swift_getEnumTagSinglePayload(v2, 1, v6) != 1)
  {
    v7 = (void *)sub_1B11BA8DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v2, v6);
  }
  return (NSDateComponents *)OUTLINED_FUNCTION_2_1(v7);
}

- (CLLocation)location
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  sub_1B119B388();
  OUTLINED_FUNCTION_23();
  return (CLLocation *)OUTLINED_FUNCTION_4_2(v2);
}

- (NSString)locationString
{
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B119B5F4();
  v4 = v3;

  if (!v4)
    return (NSString *)OUTLINED_FUNCTION_2_1(0);
  OUTLINED_FUNCTION_22_4();
  v5 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_2_1(v5);
}

- (NSURL)url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v5 = v4 - v3;
  sub_1B119B71C(v4 - v3);
  v6 = sub_1B11BA954();
  v7 = 0;
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) != 1)
  {
    v7 = (void *)sub_1B11BA930();
    v8 = OUTLINED_FUNCTION_22_4();
    v9(v8);
  }
  return (NSURL *)OUTLINED_FUNCTION_2_1(v7);
}

- (NSUserActivity)userActivity
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  sub_1B119B778();
  OUTLINED_FUNCTION_23();
  return (NSUserActivity *)OUTLINED_FUNCTION_4_2(v2);
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return 1;
}

- (int64_t)locationProximity
{
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v2;
  int64_t result;

  v2 = self;
  sub_1B119BA80();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5
{
  id v8;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_1B119BAD4((uint64_t)v8, a4);

}

- (_TtC17CoreSuggestionsUI20SGReminderSuggestion)init
{
  SGReminderSuggestion.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_suggestionDelegate);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_logger;
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)dismissViewController:(id)a3 finished:(BOOL)a4
{
  UIViewController *v6;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v7;

  v6 = (UIViewController *)a3;
  v7 = self;
  SGReminderSuggestion.dismissViewController(_:finished:)(v6, a4);

}

- (id)suggestionTitle
{
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v2;
  void *v3;

  v2 = self;
  SGReminderSuggestion.suggestionTitle()();
  OUTLINED_FUNCTION_53_0();
  v3 = (void *)OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_28_0();
  return OUTLINED_FUNCTION_2_1(v3);
}

- (id)suggestionPrimaryAction
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.suggestionPrimaryAction()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionImage
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.suggestionImage()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionDismissAction
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.suggestionDismissAction()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionSubtitle
{
  uint64_t v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;
  void *v4;

  v3 = self;
  SGReminderSuggestion.suggestionSubtitle()();
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
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.suggestionAttributedSubtitle()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (int64_t)suggestionActionButtonType
{
  int64_t result;

  SGReminderSuggestion.suggestionActionButtonType()();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)suggestionCategory
{
  SGReminderSuggestion.suggestionCategory()();
  return OUTLINED_FUNCTION_4_2(self);
}

- (id)suggestionCategoryId
{
  return sub_1B118A100(self, (uint64_t)a2, (void (*)(void))SGReminderSuggestion.suggestionCategoryId());
}

- (id)suggestionCategoryImage
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.suggestionCategoryImage()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

- (id)suggestionCategoryTitle
{
  return sub_1B118A100(self, (uint64_t)a2, (void (*)(void))SGReminderSuggestion.suggestionCategoryTitle());
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SGReminderSuggestion.suggestionCategoryTitle(forItems:));
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  uint64_t v5;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v5 = sub_1B11BB440();
  v6 = self;
  SGReminderSuggestion.suggestionCategorySubtitle(forItems:)((Swift::OpaquePointer)v5);
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
  return sub_1B118A2E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SGReminderSuggestion.suggestionCategoryLocalizedCount(ofItems:));
}

- (int64_t)suggestionCategoryActionButtonType
{
  int64_t result;

  SGReminderSuggestion.suggestionActionButtonType()();
  OUTLINED_FUNCTION_41();
  return result;
}

- (id)realtimeSuggestion
{
  void *v2;
  _TtC17CoreSuggestionsUI20SGReminderSuggestion *v3;

  v3 = self;
  SGReminderSuggestion.realtimeSuggestion()();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_4_2(v2);
}

@end
