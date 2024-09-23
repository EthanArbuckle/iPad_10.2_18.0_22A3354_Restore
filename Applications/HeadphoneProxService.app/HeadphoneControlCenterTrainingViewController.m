@implementation HeadphoneControlCenterTrainingViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController *v3;

  v3 = self;
  sub_10006B6B4((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[HeadphoneControlCenterTrainingViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_10006BAA8();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_trainingView] = 0;
  *(_QWORD *)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_horizontalConstraint] = 0;
  *(_QWORD *)&self->trainingView[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_type] = 4;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneControlCenterTrainingViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

  sub_100009FD0((uint64_t)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_presenter]);
}

@end
