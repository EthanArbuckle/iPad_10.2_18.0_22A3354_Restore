@implementation ParticipantTransformer

+ (BOOL)allowsReverseTransformation
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static ParticipantTransformer.allowsReverseTransformation()();
  return _convertBoolToObjCBool(_:)() & 1;
}

- (id)transformedValue:(id)a3
{
  _TtC8GroupKit22ParticipantTransformer *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _BYTE *v16;
  id v17;
  id v18;
  _TtC8GroupKit22ParticipantTransformer *v19;
  id v20;
  _BYTE v21[32];
  _QWORD v22[4];
  _QWORD v23[3];
  uint64_t v24;

  v19 = self;
  v20 = a3;
  swift_unknownObjectRetain();
  v3 = v19;
  if (v20)
  {
    v18 = v20;
    v17 = v20;
    v16 = v21;
    _bridgeAnyObjectToAny(_:)();
    outlined init with take of Any((uint64_t)v21, (uint64_t)v22);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v22, 0, sizeof(v22));
  }
  v15 = v22;
  ParticipantTransformer.transformedValue(_:)((uint64_t)v22, v23);
  outlined destroy of Any?((uint64_t)v22);

  if (v24)
  {
    v12 = v23;
    v9 = v24;
    __swift_project_boxed_opaque_existential_0(v23, v24);
    v8 = *(_QWORD *)(v9 - 8);
    v4 = *(_QWORD *)(v8 + 64);
    v11 = &v7;
    v7 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x24BDAC7A8](&v7);
    v10 = (char *)&v7 - v7;
    (*(void (**)(void))(v5 + 16))();
    v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)reverseTransformedValue:(id)a3
{
  _TtC8GroupKit22ParticipantTransformer *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _BYTE *v16;
  id v17;
  id v18;
  _TtC8GroupKit22ParticipantTransformer *v19;
  id v20;
  _BYTE v21[32];
  _QWORD v22[4];
  _QWORD v23[3];
  uint64_t v24;

  v19 = self;
  v20 = a3;
  swift_unknownObjectRetain();
  v3 = v19;
  if (v20)
  {
    v18 = v20;
    v17 = v20;
    v16 = v21;
    _bridgeAnyObjectToAny(_:)();
    outlined init with take of Any((uint64_t)v21, (uint64_t)v22);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v22, 0, sizeof(v22));
  }
  v15 = v22;
  ParticipantTransformer.reverseTransformedValue(_:)((uint64_t)v22, v23);
  outlined destroy of Any?((uint64_t)v22);

  if (v24)
  {
    v12 = v23;
    v9 = v24;
    __swift_project_boxed_opaque_existential_0(v23, v24);
    v8 = *(_QWORD *)(v9 - 8);
    v4 = *(_QWORD *)(v8 + 64);
    v11 = &v7;
    v7 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x24BDAC7A8](&v7);
    v10 = (char *)&v7 - v7;
    (*(void (**)(void))(v5 + 16))();
    v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (_TtC8GroupKit22ParticipantTransformer)init
{
  return (_TtC8GroupKit22ParticipantTransformer *)ParticipantTransformer.init()();
}

@end
