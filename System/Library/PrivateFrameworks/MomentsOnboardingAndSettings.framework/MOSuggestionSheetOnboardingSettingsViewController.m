@implementation MOSuggestionSheetOnboardingSettingsViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v4;

  v4 = self;
  MOSuggestionSheetOnboardingSettingsViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  -[OBTableWelcomeController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidLayoutSubviews
{
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v2;

  v2 = self;
  MOSuggestionSheetOnboardingSettingsViewController.viewDidLayoutSubviews()();

}

- (void)switchChanged_top:(id)a3
{
  id v4;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 0);

}

- (void)switchChanged_middle:(id)a3
{
  id v4;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 1);

}

- (void)switchChanged_bottom:(id)a3
{
  id v4;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 2);

}

- (void)switchChanged:(id)a3 section:(int64_t)a4
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v7;

  v6 = a3;
  v7 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v6, a4);

}

- (void)completeOnboardingTapped
{
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v2;

  v2 = self;
  MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()();

}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *result;

  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *result;

  v5 = a5;
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *result;

  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *result;

  v6 = a5;
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings))[2];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  objc_msgSend(a3, sel_estimatedRowHeight);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(a4);

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(self
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  v5 = *(_QWORD *)(v4 + 24 * a4 + 32);
  if (v5)
    return *(_QWORD *)(v5 + 16);
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v11;
  _QWORD *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *v13;
  uint64_t v15;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = self;
  LOBYTE(self) = specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end
