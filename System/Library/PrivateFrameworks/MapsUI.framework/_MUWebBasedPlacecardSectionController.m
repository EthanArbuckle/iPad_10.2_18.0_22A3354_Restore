@implementation _MUWebBasedPlacecardSectionController

- (MUWebBasedPlacecardSectionControllerConfiguration)configuration
{
  return (MUWebBasedPlacecardSectionControllerConfiguration *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration);
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)actionDispatcher
{
  return (_TtC6MapsUI23MUPlaceActionDispatcher *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                         + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher));
}

- (MUWebBasedPlacecardSectionController)sectionController
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_sectionController;
  swift_beginAccess();
  return (MUWebBasedPlacecardSectionController *)(id)MEMORY[0x1940213B8](v2);
}

- (void)setSectionController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5 sectionController:(id)a6
{
  id v10;
  id v11;
  objc_super v13;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration) = (Class)a5;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for _MUWebBasedPlacecardSectionController();
  v10 = a4;
  v11 = a5;
  return -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
}

- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3
{
  id v3;
  _TtC6MapsUI37_MUWebBasedPlacecardSectionController *result;

  v3 = a3;
  result = (_TtC6MapsUI37_MUWebBasedPlacecardSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher));
  swift_unknownObjectWeakDestroy();
}

- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC6MapsUI37_MUWebBasedPlacecardSectionController *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_191EEABD0();
  v10 = v9;

  _Block_copy(v6);
  sub_191E1E2D8(v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_191E1E848(v8, v10);

}

@end
