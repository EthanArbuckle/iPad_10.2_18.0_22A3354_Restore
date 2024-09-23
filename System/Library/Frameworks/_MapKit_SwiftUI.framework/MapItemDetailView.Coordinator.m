@implementation MapItemDetailView.Coordinator

- (void)mapItemDetailViewControllerDidFinish:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator *v7;

  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal);
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_21C531AAC((uint64_t)v3);
    v3(v6);
    sub_21C531A9C((uint64_t)v3);

  }
}

- (_TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal);
  v4 = (objc_class *)type metadata accessor for MapItemDetailView.Coordinator();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[MapItemDetailView.Coordinator init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_21C531A9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal));
}

@end
