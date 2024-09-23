@implementation ScreenTimeMessageViewController

- (void)viewDidLoad
{
  _TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *v2;

  v2 = self;
  sub_100017378();

}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *)sub_10001744C(v5, v7, a4);
}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t PartyApps;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *v11;
  void *v12;
  id v13;
  _TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *v14;
  objc_super v16;

  v5 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  v6 = enum case for FirstPartyApps.screentime(_:);
  PartyApps = type metadata accessor for FirstPartyApps(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(PartyApps - 8) + 104))(v5, v6, PartyApps);
  v8 = OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor;
  v9 = qword_100035358;
  v10 = a3;
  v11 = self;
  if (v9 != -1)
    swift_once(&qword_100035358, sub_100020584);
  v12 = (void *)qword_100036B48;
  *(Class *)((char *)&v11->super.super.super.super.super.isa + v8) = (Class)qword_100036B48;
  v13 = v12;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController(0);
  v14 = -[RequestMessageViewController initWithCoder:](&v16, "initWithCoder:", v10);

  return v14;
}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t PartyApps;
  uint64_t v8;
  uint64_t v9;
  _TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *v10;
  void *v11;
  id v12;
  objc_super v14;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  v6 = enum case for FirstPartyApps.screentime(_:);
  PartyApps = type metadata accessor for FirstPartyApps(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(PartyApps - 8) + 104))(v5, v6, PartyApps);
  v8 = OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor;
  v9 = qword_100035358;
  v10 = self;
  if (v9 != -1)
    swift_once(&qword_100035358, sub_100020584);
  v11 = (void *)qword_100036B48;
  *(Class *)((char *)&v10->super.super.super.super.super.isa + v8) = (Class)qword_100036B48;
  v12 = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController(0);
  return -[RequestMessageViewController initWithShouldBeSheetPresentationControllerDelegate:](&v14, "initWithShouldBeSheetPresentationControllerDelegate:", v3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t PartyApps;

  v3 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  PartyApps = type metadata accessor for FirstPartyApps(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(PartyApps - 8) + 8))(v3, PartyApps);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor));
}

@end
