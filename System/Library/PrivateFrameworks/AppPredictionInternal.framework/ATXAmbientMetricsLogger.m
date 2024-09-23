@implementation ATXAmbientMetricsLogger

- (void)collectWithActivity:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  ATXAmbientMetricsLogger *v14;
  uint64_t v15;
  ATXAmbientMetricsLogger *v16;

  ObjectType = swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v16 = self;
  if (objc_msgSend(v10, sel_setContinue))
  {
    v11 = sub_1C9E45DE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = v10;
    v12[5] = v16;
    v12[6] = ObjectType;
    v13 = v10;
    v14 = v16;
    sub_1C9DEBF40((uint64_t)v9, (uint64_t)&unk_1EF931A30, (uint64_t)v12);

    swift_release();
  }
  else
  {

  }
}

- (ATXAmbientMetricsLogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientMetricsLogger();
  return -[ATXAmbientMetricsLogger init](&v3, sel_init);
}

@end
