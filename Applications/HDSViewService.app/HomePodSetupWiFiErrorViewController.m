@implementation HomePodSetupWiFiErrorViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService35HomePodSetupWiFiErrorViewController *v2;

  v2 = self;
  sub_100041BBC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomePodSetupWiFiErrorViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupIconContentViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_10006EB30();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (_TtC14HDSViewService35HomePodSetupWiFiErrorViewController)initWithContentView:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupWiFiErrorViewController____lazy_storage___infoTableView] = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupWiFiErrorViewController_showInfo] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupWiFiErrorViewController(0);
  return -[HomePodSetupIconContentViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

}

@end
