@implementation HeadphoneSpatialAudioProfileViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController *v3;

  v3 = self;
  sub_10006F1B4((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController_type] = 23;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneSpatialAudioProfileViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController_presenter]);
}

@end
