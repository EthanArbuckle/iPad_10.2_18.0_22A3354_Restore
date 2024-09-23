@implementation HeadphoneShareAudioViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[HeadphoneShareAudioViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService33HeadphoneShareAudioViewController *v4;

  v4 = self;
  sub_1000641B8(a3, (SEL *)&selRef_viewWillAppear_, "Playing movie", (SEL *)&selRef_play);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20HeadphoneProxService33HeadphoneShareAudioViewController *v4;

  v4 = self;
  sub_1000641B8(a3, (SEL *)&selRef_viewDidDisappear_, "Stopping movie", (SEL *)&selRef_stop);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService33HeadphoneShareAudioViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v9;
  _BYTE v10[264];

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieContainer];
  sub_10003D4A0((uint64_t)v10);
  sub_10003CFDC((uint64_t)v10, (uint64_t)v6, &qword_1000B90F0);
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieView] = 0;
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_presenter];
  *((_QWORD *)v7 + 1) = 0;
  swift_unknownObjectWeakInit(v7, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_type] = 20;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[HeadphoneShareAudioViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  _BYTE v3[264];

  sub_10003CFDC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieContainer], (uint64_t)v3, &qword_1000B90F0);
  sub_100064EDC((uint64_t)v3);

  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_presenter]);
}

@end
