@implementation EVChargerAvailabilityDownloader

- (_TtP6MapsUI39EVChargerAvailabilityDownloaderDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_delegate;
  swift_beginAccess();
  return (_TtP6MapsUI39EVChargerAvailabilityDownloaderDelegate_ *)(id)MEMORY[0x1940213B8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  BOOL *v5;
  _TtC6MapsUI31EVChargerAvailabilityDownloader *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_191E1ECD0();

}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_timer) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isDownloadInProgress) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_mapItemIdentifier) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[EVChargerAvailabilityDownloader init](&v8, sel_init);
}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)init
{
  _TtC6MapsUI31EVChargerAvailabilityDownloader *result;

  result = (_TtC6MapsUI31EVChargerAvailabilityDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_mapItemIdentifier));

}

@end
