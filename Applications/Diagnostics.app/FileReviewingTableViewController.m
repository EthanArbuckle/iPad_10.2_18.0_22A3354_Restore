@implementation FileReviewingTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics32FileReviewingTableViewController *v4;

  v4 = self;
  sub_100068EBC(a3);

}

- (BOOL)hasSecondaryButton
{
  _TtC11Diagnostics32FileReviewingTableViewController *v2;
  id v3;
  void *v4;
  char containsCellularRadioCapability;

  v2 = self;
  v3 = (id)MobileGestalt_get_current_device(v2);
  if (v3)
  {
    v4 = v3;
    containsCellularRadioCapability = MobileGestalt_get_containsCellularRadioCapability();

    LOBYTE(v3) = containsCellularRadioCapability;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (_TtC11Diagnostics32FileReviewingTableViewController)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_activationReason) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_remoteFiles) = (Class)&_swiftEmptyArrayStorage;
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion);
  v4 = (objc_class *)type metadata accessor for FileReviewingTableViewController();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[ConsentNoticeTableViewController init](&v6, "init");
}

- (_TtC11Diagnostics32FileReviewingTableViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_activationReason) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_remoteFiles) = (Class)&_swiftEmptyArrayStorage;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion);
  v6 = (objc_class *)type metadata accessor for FileReviewingTableViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ConsentNoticeTableViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_remoteFiles), a2, v2, v3, v4, v5, v6, v7);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion), *(_QWORD *)&self->super.super.fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion]);
}

@end
