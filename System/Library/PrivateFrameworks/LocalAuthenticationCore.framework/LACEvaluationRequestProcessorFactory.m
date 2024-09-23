@implementation LACEvaluationRequestProcessorFactory

+ (id)makeProcessorWithSubprocessors:(id)a3
{
  uint64_t v3;
  objc_class *v4;
  char *v5;
  char *v6;
  id v7;
  objc_super v9;

  __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for LACEvaluationRequestProcessor);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = (objc_class *)type metadata accessor for LACEvaluationRequestCompoundProcessor();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_nextProcessor] = 0;
  v6 = &v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_currentProcessorIndex];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_involvedProcessorIndices] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_processors] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_bridgeObjectRetain();
  v7 = objc_msgSendSuper2(&v9, sel_init);
  swift_bridgeObjectRelease();
  return v7;
}

@end
