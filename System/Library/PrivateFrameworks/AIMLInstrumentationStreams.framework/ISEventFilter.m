@implementation ISEventFilter

- (ISEventFilter)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ISEventFilter_filter) = (Class)sub_21DC2BC0C(MEMORY[0x24BEE4AF8]);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EventFilter();
  return -[ISEventFilter init](&v4, sel_init);
}

+ (id)allOf:(Class)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t inited;
  unint64_t v5;
  objc_class *v6;
  char *v7;
  objc_super v9;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8568);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC73650;
  *(_QWORD *)(inited + 32) = ObjCClassMetadata;
  *(_QWORD *)(inited + 40) = 0;
  v5 = sub_21DC2BC0C((_QWORD *)inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8570);
  swift_arrayDestroy();
  v6 = (objc_class *)type metadata accessor for EventFilter();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR___ISEventFilter_filter] = v5;
  v9.receiver = v7;
  v9.super_class = v6;
  return objc_msgSendSuper2(&v9, sel_init);
}

+ (id)someOf:(Class)a3 types:(id)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v5;
  id v6;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8EC0);
  v5 = sub_21DC71B70();
  v6 = _s26AIMLInstrumentationStreams11EventFilterC4some2of5typesACSo25SISchemaTopLevelUnionTypeCm_SaySo0H22InstrumentationMessageCmGtFZ_0(ObjCClassMetadata, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (ISEventFilter)everything
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for EventFilter();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR___ISEventFilter_filter] = 0;
  v5.receiver = v3;
  v5.super_class = v2;
  return (ISEventFilter *)objc_msgSendSuper2(&v5, sel_init);
}

- (id)combine:(id)a3
{
  id v4;
  ISEventFilter *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s26AIMLInstrumentationStreams11EventFilterC1poiyA2C_ACtFZ_0((uint64_t)v5, (uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
