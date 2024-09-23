@implementation HomePodSetupIntroViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService31HomePodSetupIntroViewController *v2;

  v2 = self;
  sub_100066A94();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController(0);
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

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController(0);
  v4 = (char *)v6.receiver;
  -[HomePodSetupIconContentViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_audioPlayer];
  if (v5)
    objc_msgSend(v5, "invalidateWithFlags:", 1, v6.receiver, v6.super_class);

}

- (void)handleTapOnInfoButton
{
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  _TtC14HDSViewService31HomePodSetupIntroViewController *v7;

  v7 = self;
  v2 = -[HomePodSetupIntroViewController infoButton](v7, "infoButton");
  if (v2 && (v3 = v2, v4 = objc_msgSend(v2, "isActive"), v3, v4))
    sub_100067690(v5, v6);
  else
    sub_100067B6C();

}

- (_TtC14HDSViewService31HomePodSetupIntroViewController)initWithContentView:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_audioPlayer] = 0;
  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController____lazy_storage___infoTableView] = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_loadedInfo] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController(0);
  return -[HomePodSetupIconContentViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

}

@end
