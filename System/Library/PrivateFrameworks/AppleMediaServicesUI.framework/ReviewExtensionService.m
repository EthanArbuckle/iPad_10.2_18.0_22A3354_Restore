@implementation ReviewExtensionService

- (_TtC20AppleMediaServicesUI22ReviewExtensionService)init
{
  return (_TtC20AppleMediaServicesUI22ReviewExtensionService *)ReviewExtensionService.init()();
}

- (void)loadWith:(id)a3 bagProfile:(id)a4 bagProfileVersion:(id)a5
{
  id v7;
  _TtC20AppleMediaServicesUI22ReviewExtensionService *v8;

  sub_21124639C();
  sub_21124639C();
  v7 = a3;
  v8 = self;
  sub_21122D8C0(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService_xpcConnection));
  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__context);
  sub_21122EAF8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__state));
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__dialogCoordinator);
  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__account);
  v3 = (char *)self + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService___observationRegistrar;
  v4 = sub_2112450A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
