@implementation FBATeamPickerController

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub));
}

- (void)setFormStub:(id)a3
{
  void *v4;
  _TtC18Feedback_Assistant23FBATeamPickerController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_100052DC8();
}

- (NSArray)teams
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  sub_100053458(0, &qword_100116610, FBKTeam_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setTeams:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC18Feedback_Assistant23FBATeamPickerController *v7;

  v5 = sub_100053458(0, &qword_100116610, FBKTeam_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10005204C(v6);

}

- (FBKTeam)selectedTeam
{
  return (FBKTeam *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam));
}

- (void)setSelectedTeam:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam) = (Class)a3;
  v3 = a3;

}

- (BOOL)showsDismissButton
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_showsDismissButton);
}

- (void)setShowsDismissButton:(BOOL)a3
{
  _TtC18Feedback_Assistant23FBATeamPickerController *v4;

  v4 = self;
  sub_1000521E8(a3);

}

- (_TtP18Feedback_Assistant21FBATeamPickerDelegate_)pickerDelegate
{
  return (_TtP18Feedback_Assistant21FBATeamPickerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_pickerDelegate, a2);
}

- (void)setPickerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_pickerDelegate, a3);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant23FBATeamPickerController *v2;

  v2 = self;
  sub_1000522D8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC18Feedback_Assistant23FBATeamPickerController *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for FBATeamPickerController();
  v13.receiver = self;
  v13.super_class = v5;
  v6 = self;
  -[FBATeamPickerController viewWillAppear:](&v13, "viewWillAppear:", v3);
  v12.receiver = v6;
  v12.super_class = v5;
  -[FBATeamPickerController preferredContentSize](&v12, "preferredContentSize");
  v8 = v7;
  v9 = *(uint64_t *)((char *)&v6->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v11 = *(uint64_t *)((char *)&v6->super.super.super.super.isa
                       + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
    else
      v11 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(Class *)((char *)&v6->super.super.super.super.isa
                                      + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams));
    v10 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  -[FBATeamPickerController setPreferredContentSize:](v6, "setPreferredContentSize:", v8, (double)v10 * 70.0 + 15.0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  _TtC18Feedback_Assistant23FBATeamPickerController *v8;
  int64_t v9;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  if (!((unint64_t)v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3 < 0)
    v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams);
  else
    v6 = v3 & 0xFFFFFFFFFFFFFF8;
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain(v3);
  v9 = _CocoaArrayWrapper.endIndex.getter(v6);

  swift_bridgeObjectRelease(v3);
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:viewForHeaderInSection:
{
  return objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant23FBATeamPickerController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000525DC(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)dismissSelf
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _TtC18Feedback_Assistant23FBATeamPickerController *v6;
  _QWORD v7[5];
  uint64_t v8;

  v3 = swift_allocObject(&unk_1000E84B8, 24, 7);
  *(_QWORD *)(v3 + 16) = self;
  v7[4] = sub_100053590;
  v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10008F5C0;
  v7[3] = &unk_1000E84D0;
  v4 = _Block_copy(v7);
  v5 = v8;
  v6 = self;
  swift_release(v5);
  -[FBATeamPickerController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, v4);
  _Block_release(v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant23FBATeamPickerController *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100053490((uint64_t)v10, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100053030(a3);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100053108(v5, v7, a4);
}

- (_TtC18Feedback_Assistant23FBATeamPickerController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant23FBATeamPickerController *)sub_100053260(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->cellReuseIdentifier[OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_cellReuseIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_formStub));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_teams));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_selectedTeam));
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant23FBATeamPickerController_pickerDelegate);
}

@end
