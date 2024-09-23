@implementation FBKBugFormPickerController

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStyle:(int64_t)a3
{
  sub_21DAA78D0();
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)init
{
  sub_21DAA5A64();
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21DAA78D0();
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithStubsPredicate:(id)a3
{
  return (_TtC12FeedbackCore26FBKBugFormPickerController *)FBKBugFormPickerController.init(stubsPredicate:)((uint64_t)a3);
}

- (int64_t)context
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_context);
  swift_beginAccess();
  return *v2;
}

- (void)setContext:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_context);
  swift_beginAccess();
  *v4 = a3;
}

- (FBKBugFormStub)currentSelection
{
  return (FBKBugFormStub *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_currentSelection);
}

- (void)setCurrentSelection:(id)a3
{
  sub_21DAA6010((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_currentSelection);
}

- (FBKTeam)team
{
  return (FBKTeam *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_team);
}

- (void)setTeam:(id)a3
{
  sub_21DAA6010((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_team);
}

- (_TtP12FeedbackCore24FBKBugFormPickerDelegate_)pickerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate;
  swift_beginAccess();
  return (_TtP12FeedbackCore24FBKBugFormPickerDelegate_ *)(id)MEMORY[0x22079912C](v2);
}

- (void)setPickerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)viewDidLoad
{
  _TtC12FeedbackCore26FBKBugFormPickerController *v2;

  v2 = self;
  sub_21DAA6308();

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC12FeedbackCore26FBKBugFormPickerController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  sub_21DAA79A0();
  v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC12FeedbackCore26FBKBugFormPickerController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_21DAA7ADC(v9, a5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  int64_t v8;

  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_formStubs);
  if (v4)
  {
    if (v4 >> 62)
    {
      v5 = (void *)self;
      v6 = a3;
      v7 = v5;
      swift_bridgeObjectRetain();
      v8 = sub_21DAC4DBC();

      swift_bridgeObjectRelease();
      return v8;
    }
    else
    {
      return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore26FBKBugFormPickerController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  sub_21DAA6830(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore26FBKBugFormPickerController *v12;
  uint64_t v13;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  sub_21DAA7BD4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12FeedbackCore26FBKBugFormPickerController *v4;

  v4 = self;
  sub_21DAA6F5C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12FeedbackCore26FBKBugFormPickerController *v4;

  v4 = self;
  sub_21DAA73E4(a3);

}

- (void)dismissPicker
{
  _TtC12FeedbackCore26FBKBugFormPickerController *v2;

  v2 = self;
  sub_21DAA7534();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  char *v5;
  void *v6;
  void *v7;
  id v8;
  _TtC12FeedbackCore26FBKBugFormPickerController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x22079912C](v5);
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, sel_respondsToSelector_, sel_bugFormPickerDidCancel_) & 1) != 0)
    {
      v8 = a3;
      v9 = self;
      objc_msgSend(v7, sel_bugFormPickerDidCancel_, v9);

    }
    swift_unknownObjectRelease();
  }
}

- (_TtC12FeedbackCore26FBKBugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12FeedbackCore26FBKBugFormPickerController *result;

  v4 = a4;
  result = (_TtC12FeedbackCore26FBKBugFormPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_stubsPredicate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_currentSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_team));
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_pickerDelegate);
  sub_21DA37AB4((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore26FBKBugFormPickerController_formsRefreshObserver);
}

@end
