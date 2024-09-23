@implementation TAFField

- (NSString)type
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)label
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)formKey
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)hintText
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)textContextType
{
  return (NSString *)sub_23EBABEB4();
}

- (BOOL)isSecure
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_isSecure);
}

- (int64_t)maxCharacterCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_maxCharacterCount);
}

- (int64_t)minCharacterCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_minCharacterCount);
}

- (NSString)regex
{
  return (NSString *)sub_23EBABEB4();
}

- (BOOL)required
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_required);
}

- (_TtC19HomeUtilityServices8TAFField)initWithType:(id)a3 label:(id)a4 formKey:(id)a5 textContextType:(id)a6 isSecure:(BOOL)a7 maxCharacterCount:(int64_t)a8 minCharacterCount:(int64_t)a9 regex:(id)a10 required:(BOOL)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_23EC2E780();
  v13 = v12;
  v14 = sub_23EC2E780();
  v16 = v15;
  v17 = sub_23EC2E780();
  v19 = v18;
  v20 = sub_23EC2E780();
  v22 = v21;
  v23 = sub_23EC2E780();
  return (_TtC19HomeUtilityServices8TAFField *)sub_23EBABF54(v11, v13, v14, v16, v17, v19, v20, v22, a7, a8, a9, v23, v24, a11);
}

- (_TtC19HomeUtilityServices8TAFField)init
{
  _TtC19HomeUtilityServices8TAFField *result;

  result = (_TtC19HomeUtilityServices8TAFField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
