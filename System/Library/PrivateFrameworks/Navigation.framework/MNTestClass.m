@implementation MNTestClass

- (void)testFunction
{
  uint64_t v3;
  uint64_t v4;
  _TtC10Navigation11MNTestClass *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEC8C20);
  v3 = swift_allocObject();
  v4 = MEMORY[0x1E0DEA968];
  *(_OWORD *)(v3 + 16) = xmmword_1B0BF2CF0;
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 32) = 1953719668;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  v5 = self;
  sub_1B0BCAB64();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(objc_allocWithZone((Class)MNParkedVehicleDetector), sel_init);
  objc_msgSend(v6, sel_startMonitoring);

}

- (_TtC10Navigation11MNTestClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MNTestClass();
  return -[MNTestClass init](&v3, sel_init);
}

@end
