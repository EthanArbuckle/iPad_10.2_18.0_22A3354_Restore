@implementation FBAParticipantTableViewController

- (_TtP18Feedback_Assistant41FBAParticipantTableViewControllerDelegate_)participantDelegate
{
  return (_TtP18Feedback_Assistant41FBAParticipantTableViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_participantDelegate, a2);
}

- (void)setParticipantDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_participantDelegate, a3);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v2;

  v2 = self;
  sub_100060AC0();

}

- (void)configureWithContentItem:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100060C68(v4);

}

- (void)dismissSelf
{
  -[FBAParticipantTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_displayedParticipants);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_displayedParticipants);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10006129C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v19;
  id v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)aBlock - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 24) & ~v14;
  v16 = swift_allocObject(&unk_1000E8F70, v15 + v9, v14 | 7);
  *(_QWORD *)(v16 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, v11, v7);
  aBlock[4] = sub_1000623E0;
  v22 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10008F5C0;
  aBlock[3] = &unk_1000E8F88;
  v17 = _Block_copy(aBlock);
  v18 = v22;
  v19 = self;
  v20 = a3;
  swift_release(v18);
  -[FBAParticipantTableViewController dismissViewControllerAnimated:completion:](v19, "dismissViewControllerAnimated:completion:", 1, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_100061980(a3);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_100061AA4(v5, v7, a4);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_100061C48(a3);
}

- (void).cxx_destruct
{
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_participantDelegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->participantDelegate[OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_cellReuseIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_participants));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_displayedParticipants));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_assignee));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_originator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_searchController));
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAParticipantTableViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100061E54(v4);

}

@end
