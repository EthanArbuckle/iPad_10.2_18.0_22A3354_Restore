@implementation JEMetricsSecretMigrator

+ (void)migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:(NSString *)a3 topic:(NSString *)a4 secretKey:(AMSMetricsIdentifierKey *)a5 configuration:(NSDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  NSString *v22;
  NSString *v23;
  AMSMetricsIdentifierKey *v24;
  NSDictionary *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB29B0);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = v17;
  v18[7] = a1;
  v19 = sub_19CFDFA10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EE441E80;
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EE441E90;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  sub_19CF5B8E4((uint64_t)v16, (uint64_t)&unk_1EE441EA0, (uint64_t)v21);
  swift_release();
}

- (_TtC9JetEngine23JEMetricsSecretMigrator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JEMetricsSecretMigrator();
  return -[JEMetricsSecretMigrator init](&v3, sel_init);
}

@end
