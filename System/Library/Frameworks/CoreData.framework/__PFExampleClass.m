@implementation __PFExampleClass

- (void)pfExampleFunction
{
  uint64_t v3;
  __PFExampleClass *v4;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_18A5098C0;
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 32) = 0xD000000000000011;
  *(_QWORD *)(v3 + 40) = 0x800000018A50ADA0;
  v4 = self;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
}

- (__PFExampleClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PFExampleClass();
  return -[__PFExampleClass init](&v3, sel_init);
}

@end
