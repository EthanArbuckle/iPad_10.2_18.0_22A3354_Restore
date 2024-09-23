@implementation FBKTeamPickerController

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub);
}

- (void)setFormStub:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12FeedbackCore23FBKTeamPickerController *v8;

  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_21DAAD9D4();
}

- (NSArray)teams
{
  void *v2;

  swift_beginAccess();
  sub_21DA3BF58(0, (unint64_t *)&unk_25539A010);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setTeams:(id)a3
{
  uint64_t v4;
  _TtC12FeedbackCore23FBKTeamPickerController *v5;

  sub_21DA3BF58(0, (unint64_t *)&unk_25539A010);
  v4 = sub_21DAC496C();
  v5 = self;
  sub_21DAAC4DC(v4);

}

- (FBKTeam)selectedTeam
{
  return (FBKTeam *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam);
}

- (void)setSelectedTeam:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)showsDismissButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_showsDismissButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDismissButton:(BOOL)a3
{
  _TtC12FeedbackCore23FBKTeamPickerController *v4;

  v4 = self;
  sub_21DAAC9D4(a3);

}

- (_TtP12FeedbackCore21FBKTeamPickerDelegate_)pickerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_pickerDelegate;
  swift_beginAccess();
  return (_TtP12FeedbackCore21FBKTeamPickerDelegate_ *)(id)MEMORY[0x22079912C](v2);
}

- (void)setPickerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)viewDidLoad
{
  _TtC12FeedbackCore23FBKTeamPickerController *v2;

  v2 = self;
  sub_21DAACD78();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC12FeedbackCore23FBKTeamPickerController *v6;
  double v7;
  double v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for FBKTeamPickerController();
  v13.receiver = self;
  v13.super_class = v5;
  v6 = self;
  -[FBKTeamPickerController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
  v12.receiver = v6;
  v12.super_class = v5;
  -[FBKTeamPickerController preferredContentSize](&v12, sel_preferredContentSize);
  v8 = v7;
  v9 = (unint64_t *)((char *)v6 + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_teams);
  swift_beginAccess();
  v10 = *v9;
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_21DAC4DBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  -[FBKTeamPickerController setPreferredContentSize:](v6, sel_setPreferredContentSize_, v8, (double)v11 * 70.0 + 15.0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  _TtC12FeedbackCore23FBKTeamPickerController *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_teams);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_21DAC4DBC();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 5.0;
  if (!a4)
    return 15.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 5.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore23FBKTeamPickerController *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_21DAAD25C(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void)dismissSelf
{
  uint64_t v3;
  void *v4;
  _TtC12FeedbackCore23FBKTeamPickerController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_21DAAE5B4;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21DA5D6A4;
  v6[3] = &block_descriptor_12;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  -[FBKTeamPickerController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore23FBKTeamPickerController *v12;
  uint64_t v13;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  sub_21DAAE120();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithStyle:(int64_t)a3
{
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(style:)(a3);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_21DAC481C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC12FeedbackCore23FBKTeamPickerController)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore23FBKTeamPickerController *)FBKTeamPickerController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_formStub));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_selectedTeam));
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore23FBKTeamPickerController_pickerDelegate);
}

@end
