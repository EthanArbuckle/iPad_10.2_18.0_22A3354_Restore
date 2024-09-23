@implementation SGSuggestionTableController

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithStore:(id)a3 delegate:(id)a4 suggestionPresenter:(id)a5 suggestionList:(id)a6
{
  id v9;
  _TtC17CoreSuggestionsUI27SGSuggestionTableController *result;

  v9 = a3;
  swift_unknownObjectRetain();
  SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  OUTLINED_FUNCTION_22();
  return result;
}

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1196398();
}

- (void)dealloc
{
  _TtC17CoreSuggestionsUI27SGSuggestionTableController *v2;

  v2 = self;
  SGSuggestionTableController.__deallocating_deinit();
  OUTLINED_FUNCTION_41();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_store));
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController);
  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_presenterDelegate);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionPresenter);
  OUTLINED_FUNCTION_143(*(id *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionList));
}

- (void)updateWithSuggestionStore:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_70_1((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_81_2();
  v4 = (void *)OUTLINED_FUNCTION_49_0();
  sub_1B1196568(v4);

  OUTLINED_FUNCTION_8_1(v5);
}

- (void)viewDidLoad
{
  _TtC17CoreSuggestionsUI27SGSuggestionTableController *v2;

  v2 = self;
  sub_1B119669C();
  OUTLINED_FUNCTION_3(v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_90_1(self);
  OUTLINED_FUNCTION_6_0();
  sub_1B11970C8();
  OUTLINED_FUNCTION_3(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_90_1(self);
  OUTLINED_FUNCTION_6_0();
  sub_1B119720C();
  OUTLINED_FUNCTION_3(v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_90_1(self);
  v3 = OUTLINED_FUNCTION_6_0();
  sub_1B11972F0(v3);
  OUTLINED_FUNCTION_3(v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_90_1(self);
  OUTLINED_FUNCTION_6_0();
  sub_1B119744C();
  OUTLINED_FUNCTION_3(v3);
}

- (void)presentViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_70_1((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_81_2();
  v4 = (void *)OUTLINED_FUNCTION_49_0();
  sub_1B1197534(v4);

  OUTLINED_FUNCTION_8_1(v5);
}

- (void)dismissViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_70_1((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_81_2();
  v4 = (void *)OUTLINED_FUNCTION_49_0();
  sub_1B119764C(v4);

  OUTLINED_FUNCTION_8_1(v5);
}

- (void)dismissalPressed:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_70_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_81_2();
  sub_1B1197808();

  OUTLINED_FUNCTION_8_1(v4);
}

- (_TtC17CoreSuggestionsUI27SGSuggestionTableController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B11BB3C8();
  v5 = a4;
  SGSuggestionTableController.init(nibName:bundle:)();
}

@end
