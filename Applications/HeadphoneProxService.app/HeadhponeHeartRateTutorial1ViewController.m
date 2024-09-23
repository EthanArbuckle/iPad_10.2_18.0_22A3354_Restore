@implementation HeadhponeHeartRateTutorial1ViewController

- (void)viewDidLoad
{
  _TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController *v2;

  v2 = self;
  sub_10006EC88();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeadhponeHeartRateTutorial1ViewController();
  v4 = v7.receiver;
  -[HeadhponeHeartRateTutorial1ViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_type]);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_super v7;

  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController____lazy_storage___topAsset] = 0;
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_type] = 28;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeadhponeHeartRateTutorial1ViewController();
  return -[HeadhponeHeartRateTutorial1ViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_presenter]);
}

@end
