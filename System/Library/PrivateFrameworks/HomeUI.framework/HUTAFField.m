@implementation HUTAFField

- (NSString)label
{
  return (NSString *)sub_1B8F74570();
}

- (NSString)formKey
{
  return (NSString *)sub_1B8F74570();
}

- (BOOL)required
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC6HomeUI10HUTAFField_required);
}

- (id)init:(id)a3
{
  id v4;
  _TtC6HomeUI10HUTAFField *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _TtC6HomeUI10HUTAFField *v12;
  objc_super v14;

  v4 = a3;
  v5 = self;
  v6 = sub_1B93EC374();
  v7 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC6HomeUI10HUTAFField_label);
  *v7 = v6;
  v7[1] = v8;
  v9 = sub_1B93EC380();
  v10 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC6HomeUI10HUTAFField_formKey);
  *v10 = v9;
  v10[1] = v11;
  *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC6HomeUI10HUTAFField_required) = sub_1B93EC38C() & 1;

  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for HUTAFField();
  v12 = -[HUTAFField init](&v14, sel_init);

  return v12;
}

- (_TtC6HomeUI10HUTAFField)init
{
  _TtC6HomeUI10HUTAFField *result;

  result = (_TtC6HomeUI10HUTAFField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
