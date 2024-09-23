@implementation PurchaseSharingHostViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14FamilyCircleUI33PurchaseSharingHostViewController *v4;

  v4 = self;
  sub_20DEF0840(a3);

}

- (_TtC14FamilyCircleUI33PurchaseSharingHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC14FamilyCircleUI33PurchaseSharingHostViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_20E07D5D4();
    v6 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI33PurchaseSharingHostViewController_item;
    v7 = type metadata accessor for PurchaseSharingItem(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
    v8 = a4;
    v9 = (void *)sub_20E07D5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI33PurchaseSharingHostViewController_item;
    v11 = type metadata accessor for PurchaseSharingItem(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
    v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PurchaseSharingHostViewController(0);
  v13 = -[HelpfulRemoteUiHostingVC initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v9, a4);

  return v13;
}

- (_TtC14FamilyCircleUI33PurchaseSharingHostViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI33PurchaseSharingHostViewController_item;
  v6 = type metadata accessor for PurchaseSharingItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PurchaseSharingHostViewController(0);
  return -[HelpfulRemoteUiHostingVC initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_20DE93FC8((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI33PurchaseSharingHostViewController_item, &qword_2549FA300);
}

@end
