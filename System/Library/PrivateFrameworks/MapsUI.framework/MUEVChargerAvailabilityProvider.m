@implementation MUEVChargerAvailabilityProvider

- (_TtC6MapsUI23MUEVChargerAvailability)availability
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availability);
  swift_beginAccess();
  return (_TtC6MapsUI23MUEVChargerAvailability *)*v2;
}

- (void)setAvailability:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availability);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  BOOL *v5;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_isActive;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  EVChargerAvailabilityDownloader.isActive.setter(a3);

}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)initWithPlaceItem:(id)a3 canAccessVirtualGarage:(BOOL)a4
{
  swift_unknownObjectRetain();
  return (_TtC6MapsUI31MUEVChargerAvailabilityProvider *)MUEVChargerAvailabilityProvider.init(placeItem:canAccessVirtualGarage:)(a3, a4);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_virtualGarageService);
  if (v4)
    objc_msgSend(v4, sel_unregisterObserver_, self);
  else
    v5 = self;
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[MUEVChargerAvailabilityProvider dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availabilityRefresher));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_virtualGarageService));

}

- (void)registerObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_observers), sel_addObject_, a3);
}

- (void)unregisterObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_observers), sel_removeObject_, a3);
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)init
{
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *result;

  result = (_TtC6MapsUI31MUEVChargerAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3
{
  id v4;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *v5;

  v4 = a3;
  v5 = self;
  MUEVChargerAvailabilityProvider.didDownloadEVChargerAvailability(evCharger:)(v4);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *v5;

  v4 = a3;
  v5 = self;
  MUEVChargerAvailabilityProvider.virtualGarageDidUpdate(_:)(v4);

}

@end
