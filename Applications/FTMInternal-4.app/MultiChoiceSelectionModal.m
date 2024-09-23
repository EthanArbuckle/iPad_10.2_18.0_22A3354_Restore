@implementation MultiChoiceSelectionModal

- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC13FTMInternal_425MultiChoiceSelectionModal *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton;
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_10018A970();

  result = (_TtC13FTMInternal_425MultiChoiceSelectionModal *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/MultiChoiceSelectionModal.swift", 45, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MultiChoiceSelectionModal();
  v2 = v3.receiver;
  -[MultiChoiceSelectionModal viewDidLoad](&v3, "viewDidLoad");
  sub_10018ACD0();

}

- (void)didTapDismiss:(id)a3
{
  id v5;
  id v6;
  _TtC13FTMInternal_425MultiChoiceSelectionModal *v7;
  id v8;

  v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "initWithStyle:", 1);
  objc_msgSend(v8, "impactOccurred");
  -[MultiChoiceSelectionModal dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13FTMInternal_425MultiChoiceSelectionModal *result;

  v4 = a4;
  result = (_TtC13FTMInternal_425MultiChoiceSelectionModal *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.MultiChoiceSelectionModal", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_tableViewData));
  sub_10014C77C((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton));
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 75.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_425MultiChoiceSelectionModal *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10018B470(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_tableViewData))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_425MultiChoiceSelectionModal *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10018B720(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

@end
