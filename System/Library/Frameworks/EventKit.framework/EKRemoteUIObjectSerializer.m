@implementation EKRemoteUIObjectSerializer

- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v13;
  objc_super v15;
  uint64_t v16;
  id v17;

  v4 = a4;
  v16 = MEMORY[0x1E0DEE9E0];
  v17 = (id)MEMORY[0x1E0DEE9E0];
  v6 = a3;
  v7 = self;
  v8 = sub_1A2417380(v6, v4, &v17, &v16);
  v10 = v16;
  v9 = v17;
  v11 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v8;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v9;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v10;
  v15.receiver = v12;
  v15.super_class = v11;
  v13 = -[EKRemoteUIObjectSerializer init](&v15, sel_init);

  return v13;
}

- (id)serializedRepresentationWithEkObject:(id)a3
{
  id v4;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v11;
  objc_super v13;
  uint64_t v14;
  id v15;

  v14 = MEMORY[0x1E0DEE9E0];
  v15 = (id)MEMORY[0x1E0DEE9E0];
  v4 = a3;
  v5 = self;
  v6 = sub_1A2417380(v4, 0, &v15, &v14);
  v8 = v14;
  v7 = v15;
  v9 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v6;
  *(_QWORD *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v7;
  *(_QWORD *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v8;
  v13.receiver = v10;
  v13.super_class = v9;
  v11 = -[EKRemoteUIObjectSerializer init](&v13, sel_init);

  return v11;
}

- (id)deserializedRepresentationWithSerializedDictionary:(id)a3 objectIDToChangeSetDictionaryMap:(id)a4 objectIDToPersistentDictionaryMap:(id)a5 eventStore:(id)a6 occurrenceDate:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v18;
  id v19;
  uint64_t v21;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v22;

  v22 = self;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667950);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A2435A40();
  sub_1A2424D0C(0, &qword_1EE667958);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
  sub_1A2424CC0(&qword_1EE667968, &qword_1EE667958);
  v13 = sub_1A2435A40();
  v14 = sub_1A2435A40();
  if (a7)
  {
    sub_1A24359EC();
    v15 = sub_1A24359F8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    v16 = sub_1A24359F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  v17 = a6;
  v18 = v22;
  v19 = EKRemoteUIObjectSerializer.deserializedRepresentation(serializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:)(v12, v13, v14, v17, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A2424E44((uint64_t)v11, &qword_1EE667950);
  return v19;
}

- (_TtC8EventKit26EKRemoteUIObjectSerializer)init
{
  return (_TtC8EventKit26EKRemoteUIObjectSerializer *)EKRemoteUIObjectSerializer.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
