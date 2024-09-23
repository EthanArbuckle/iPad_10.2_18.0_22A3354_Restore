@implementation FBABugFormPickerController

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStyle:(int64_t)a3
{
  sub_100088040(0x80000001000D8870, 26);
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)init
{
  sub_1000868A8();
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100088040(0x80000001000D8830, 28);
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithStubsPredicate:(id)a3
{
  return (_TtC18Feedback_Assistant26FBABugFormPickerController *)sub_1000869C8((uint64_t)a3);
}

- (int64_t)context
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_context);
}

- (void)setContext:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_context) = (Class)a3;
}

- (FBKBugFormStub)currentSelection
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection));
}

- (void)setCurrentSelection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection) = (Class)a3;
  v3 = a3;

}

- (FBKTeam)team
{
  return (FBKTeam *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team));
}

- (void)setTeam:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team) = (Class)a3;
  v3 = a3;

}

- (_TtP18Feedback_Assistant24FBABugFormPickerDelegate_)pickerDelegate
{
  return (_TtP18Feedback_Assistant24FBABugFormPickerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_pickerDelegate, a2);
}

- (void)setPickerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_pickerDelegate, a3);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant26FBABugFormPickerController *v2;

  v2 = self;
  sub_100086C20();

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v5 = a3;
  v6 = self;
  sub_100088110();
  v8 = v7;

  if (v8)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
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
  _TtC18Feedback_Assistant26FBABugFormPickerController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100088234(v9, a5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  int64_t v9;

  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formStubs);
  if (v4)
  {
    if ((unint64_t)v4 >> 62)
    {
      v5 = (void *)self;
      if (v4 >= 0)
        v6 = v4 & 0xFFFFFFFFFFFFFF8;
      else
        v6 = *(_QWORD *)(self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formStubs);
      v7 = a3;
      v8 = v5;
      swift_bridgeObjectRetain(v4);
      v9 = _CocoaArrayWrapper.endIndex.getter(v6);

      swift_bridgeObjectRelease(v4);
      return v9;
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100087098(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10008832C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18Feedback_Assistant26FBABugFormPickerController *v4;

  v4 = self;
  sub_100087454(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18Feedback_Assistant26FBABugFormPickerController *v4;

  v4 = self;
  sub_100087810(a3);

}

- (void)dismissPicker
{
  uint64_t v2;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v3;

  v3 = self;
  sub_100087960((uint64_t)v3, v2);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_pickerDelegate, a2);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "bugFormPickerDidCancel:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "bugFormPickerDidCancel:", v8);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (_TtC18Feedback_Assistant26FBABugFormPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18Feedback_Assistant26FBABugFormPickerController *result;

  v4 = a4;
  result = (_TtC18Feedback_Assistant26FBABugFormPickerController *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBABugFormPickerController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formStubs));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_stubsPredicate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_currentSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_team));
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_pickerDelegate);
  sub_100051ED0((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant26FBABugFormPickerController_formsRefreshObserver);
}

@end
