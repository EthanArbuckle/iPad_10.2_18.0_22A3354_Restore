@implementation MUEVChargingSectionController

- (BOOL)isActive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MUPlaceSectionController isActive](&v3, sel_isActive);
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  _BYTE *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[MUPlaceSectionController setActive:](&v6, sel_setActive_, v3);
  v5 = (_BYTE *)(*(_QWORD *)&v4[OBJC_IVAR___MUEVChargingSectionController_viewModel]
               + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_isActive);
  swift_beginAccess();
  *v5 = v3;

}

- (MUEVChargingSectionController)initWithMapItem:(id)a3 availabilityProvider:(id)a4
{
  return (MUEVChargingSectionController *)EVChargingSectionController.init(mapItem:availabilityProvider:)(a3, a4);
}

- (NSArray)sectionViews
{
  void *v2;

  sub_191E0922C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)hasContent
{
  unint64_t v2;
  uint64_t v3;
  MUEVChargingSectionController *v5;

  v2 = *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MUEVChargingSectionController__sectionViews);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    v3 = sub_191EEB2D8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 42;
}

- (MUPlaceSectionControllerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MUPlaceSectionController delegate](&v3, sel_delegate);
}

- (void)setDelegate:(id)a3
{
  MUEVChargingSectionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_191E27280((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (MUEVChargingSectionController)initWithMapItem:(id)a3
{
  id v3;
  MUEVChargingSectionController *result;

  v3 = a3;
  result = (MUEVChargingSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
