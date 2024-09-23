@implementation RouteButton.Coordinator

- (void)onTouchDown:(id)a3
{
  id v4;
  _TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = sub_24148BDA0();
  objc_msgSend(v6, sel_setSourceView_, v4);

  v7 = sub_24148BDA0();
  objc_msgSend(v7, sel_startPrewarming);

}

- (void)onTouchUpOutside:(id)a3
{
  sub_24148BEA0(self, (uint64_t)a2, a3, (SEL *)&selRef_stopPrewarming);
}

- (void)onTouchUpInside:(id)a3
{
  sub_24148BEA0(self, (uint64_t)a2, a3, (SEL *)&selRef_present);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_24148CA0C(v6);

  return v9;
}

- (_TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator____lazy_storage___mediaControls) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[RouteButton.Coordinator init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV11MediaCoreUIP33_269E8A2553F691DD0D96A2E732A5863B11RouteButton11Coordinator____lazy_storage___mediaControls));
}

@end
