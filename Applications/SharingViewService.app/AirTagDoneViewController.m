@implementation AirTagDoneViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService24AirTagDoneViewController *v2;

  v2 = self;
  sub_10002E0F4();

}

- (_TtC18SharingViewService24AirTagDoneViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(_QWORD *)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagDoneViewController_mapViewController] = 0;
  swift_unknownObjectWeakInit(&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagDoneViewController_mainController], 0);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[AirTagDoneViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy(&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagDoneViewController_mainController], v3);
}

@end
