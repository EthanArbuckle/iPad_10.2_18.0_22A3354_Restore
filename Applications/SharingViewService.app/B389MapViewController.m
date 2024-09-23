@implementation B389MapViewController

- (_TtC18SharingViewService21B389MapViewController)initWithCoder:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  id v6;
  _TtC18SharingViewService21B389MapViewController *v7;
  void *v8;
  uint64_t v9;

  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView;
  v6 = objc_allocWithZone((Class)MKMapView);
  v7 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  sub_100012F60(*v4, v4[1]);
  v8 = *(Class *)((char *)&self->super.super.super.isa + v5);

  v9 = type metadata accessor for B389MapViewController();
  swift_deallocPartialClassInstance(v7, v9, 40, 7);
  return 0;
}

- (void)loadView
{
  _TtC18SharingViewService21B389MapViewController *v2;

  v2 = self;
  sub_10009BFF4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for B389MapViewController();
  v4 = (char *)v7.receiver;
  -[B389MapViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView];
  v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapAnnotation];
  objc_msgSend(v5, "addAnnotation:", v6, v7.receiver, v7.super_class);
  objc_msgSend(v5, "selectAnnotation:animated:", v6, v3);

}

- (void)viewTapped:(id)a3
{
  void (*v3)(id);
  uint64_t v6;
  id v7;
  _TtC18SharingViewService21B389MapViewController *v8;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler);
  if (v3)
  {
    v6 = *(_QWORD *)&self->mapAnnotation[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler];
    v7 = a3;
    v8 = self;
    sub_100022024((uint64_t)v3, v6);
    v3(a3);
    sub_100012F60((uint64_t)v3, v6);

  }
}

- (_TtC18SharingViewService21B389MapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18SharingViewService21B389MapViewController *result;

  v4 = a4;
  result = (_TtC18SharingViewService21B389MapViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.B389MapViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapAnnotation));
  sub_100012F60(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler), *(_QWORD *)&self->mapAnnotation[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView));
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtC18SharingViewService21B389MapViewController *v7;
  void *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10009C400(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

@end
