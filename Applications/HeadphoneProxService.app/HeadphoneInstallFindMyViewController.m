@implementation HeadphoneInstallFindMyViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneInstallFindMyViewController();
  v2 = v3.receiver;
  -[HeadphoneInstallFindMyViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController)initWithContentView:(id)a3
{
  objc_super v6;

  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController_type] = 25;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeadphoneInstallFindMyViewController();
  return -[HeadphoneInstallFindMyViewController initWithContentView:](&v6, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController_presenter]);
}

@end
