@implementation FKNFHardwareStateChangeMonitor

- (void)hardwareStateDidChange
{
  _TtC10FinanceKit30FKNFHardwareStateChangeMonitor *v2;

  v2 = self;
  sub_2336152E8();

}

- (_TtC10FinanceKit30FKNFHardwareStateChangeMonitor)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC10FinanceKit30FKNFHardwareStateChangeMonitor_implementation;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256059050);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 28) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_BYTE *)(v5 + 24) = 0;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[FKNFHardwareStateChangeMonitor init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
