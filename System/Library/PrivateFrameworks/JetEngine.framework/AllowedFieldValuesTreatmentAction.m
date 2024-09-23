@implementation AllowedFieldValuesTreatmentAction

- (_TtC9JetEngine33AllowedFieldValuesTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v4 = sub_19CFDF578();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = sub_19CFDF3C8();
  return (_TtC9JetEngine33AllowedFieldValuesTreatmentAction *)AllowedFieldValuesTreatmentAction.init(field:configuration:)(v4, v6, v7);
}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6;
  _TtC9JetEngine33AllowedFieldValuesTreatmentAction *v7;
  id v8;
  _TtC9JetEngine33AllowedFieldValuesTreatmentAction *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_19CFE004C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v8 = a4;
    v9 = self;
  }
  AllowedFieldValuesTreatmentAction.perform(_:context:)((uint64_t)v18, (uint64_t)v19);

  sub_19CCECFE4((uint64_t)v18, &qword_1ECEB3370);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = __swift_project_boxed_opaque_existential_1(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x1E0C80A78](v11, v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)sub_19CFE0688();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  return v16;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
