@implementation CCUISystemControlsCoordinator

- (CCUISystemControlsCoordinator)initWithSystemHost:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISystemControlsCoordinator_systemHost) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)CCUISystemControlsCoordinator;
  swift_unknownObjectRetain();
  return -[CCUISystemControlsCoordinator init](&v4, sel_init);
}

- (void)beginObservingSystemState
{
  CCUISystemControlsCoordinator *v2;

  v2 = self;
  sub_1CFBE80D0();

}

- (void)endObservingSystemState
{
  CCUISystemControlsCoordinator *v2;

  v2 = self;
  sub_1CFBE8278();

}

- (CCUISystemControlsCoordinator)init
{
  CCUISystemControlsCoordinator *result;

  result = (CCUISystemControlsCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
  sub_1CFBE83DC();
}

@end
