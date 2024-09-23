@implementation SuggestionSheetManager

- (void)suggestionSheetController:(id)a3 didTransitionTo:(unint64_t)a4
{
  _TtC21JournalingSuggestions22SuggestionSheetManager *v6;
  id v7;

  v7 = a3;
  v6 = self;
  specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(a4);

}

- (void)suggestionSheetControllerDidCancel:(id)a3
{
  _TtC21JournalingSuggestions22SuggestionSheetManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  specialized SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)();

}

- (void)suggestionSheetControllerShouldShowBlankComposeView:(id)a3
{
  uint64_t v4;
  _TtC21JournalingSuggestions22SuggestionSheetManager *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = one-time initialization token for bridge;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.bridge);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233A5C000, v7, v8, "Picker:BCV", v9, 2u);
    MEMORY[0x23493AEA8](v9, -1, -1);
  }

}

- (void)suggestionSheetController:(id)a3 shouldPerformTask:(unint64_t)a4 forSuggestion:(id)a5
{
  id v8;
  _TtC21JournalingSuggestions22SuggestionSheetManager *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = self;
  SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(v10, a4, v8);

}

- (_TtC21JournalingSuggestions22SuggestionSheetManager)init
{
  return (_TtC21JournalingSuggestions22SuggestionSheetManager *)SuggestionSheetManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock));
  swift_bridgeObjectRelease();
}

@end
