@implementation AirTagStartViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService25AirTagStartViewController *v2;

  v2 = self;
  sub_1000602C8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService25AirTagStartViewController *v4;

  v4 = self;
  sub_100060A88(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v8.receiver;
  -[AirTagStartViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(void (**)(__n128))&v4[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor + 8];
    v7 = swift_retain(v6);
    v5(v7);
    sub_100012F60((uint64_t)v5, v6);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC18SharingViewService25AirTagStartViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[AirTagMovieViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100012F60(*(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor], *(_QWORD *)&self->super.movie[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor]);
}

@end
