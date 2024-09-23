@implementation HeadphoneNotYoursViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[HeadphoneNotYoursViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService31HeadphoneNotYoursViewController *v4;

  v4 = self;
  sub_10006FC40(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id *v5;
  _BYTE v6[24];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (char *)v7.receiver;
  -[HeadphoneNotYoursViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = (id *)&v4[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_movieView];
  swift_beginAccess(&v4[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_movieView], v6, 0, 0);
  if (*v5)
    objc_msgSend(*v5, "stop");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService31HeadphoneNotYoursViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_movieView] = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_viewModel];
  v7 = type metadata accessor for HeadphoneViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_presenter];
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_type] = 18;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[HeadphoneNotYoursViewController initWithContentView:](&v10, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

  sub_100017E48((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_viewModel], &qword_1000B8C40);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_presenter]);
}

@end
