@implementation AAJSON

- (void).cxx_destruct
{
  sub_1A5EDCB44((uint64_t)self + OBJC_IVAR___AAJSON_value);
}

- (AAJSON)initWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  AAJSON *v7;

  v3 = a3;
  v4 = sub_1A5F63E3C();
  v6 = v5;

  v7 = (AAJSON *)sub_1A5F06490();
  sub_1A5EF0908(v4, v6);
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AAJSON *v7;
  id v8;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = self;
  v8 = sub_1A5F03930(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)objectAtIndexedSubscript:(int64_t)a3
{
  AAJSON *v4;
  id v5;

  v4 = self;
  v5 = sub_1A5F03AE8(a3);

  return v5;
}

- (BOOL)exists
{
  BOOL v2;
  _QWORD v4[4];

  sub_1A5EDCB9C((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v4);
  v2 = v4[3] != 0;
  sub_1A5EDCB44((uint64_t)v4);
  return v2;
}

- (id)any
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  sub_1A5EDCB9C((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v10);
  v2 = v11;
  if (!v11)
    return 0;
  v3 = __swift_project_boxed_opaque_existential_1(v10, v11);
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v4 + 16))(v7, v5);
  v8 = (void *)sub_1A5F64874();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v8;
}

- (NSString)string
{
  AAJSON *v3;
  void *v4;
  _BYTE v6[24];
  uint64_t v7;

  sub_1A5EDCB9C((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v6);
  if (v7)
  {
    v3 = self;
    if ((swift_dynamicCast() & 1) != 0)
    {

      v4 = (void *)sub_1A5F6410C();
      swift_bridgeObjectRelease();
      return (NSString *)v4;
    }

  }
  else
  {
    sub_1A5EDCB44((uint64_t)v6);
  }
  return (NSString *)0;
}

- (NSArray)array
{
  AAJSON *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1A5F0410C();

  if (v3)
  {
    type metadata accessor for JSON();
    v4 = (void *)sub_1A5F64298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSDictionary)object
{
  AAJSON *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1A5EDC758();

  if (v3)
  {
    type metadata accessor for JSON();
    v4 = (void *)sub_1A5F640A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (NSNumber)number
{
  AAJSON *v2;
  id v3;

  v2 = self;
  v3 = sub_1A5F04338();

  return (NSNumber *)v3;
}

- (id)toDataWithOptions:(unint64_t)a3 :(id *)a4
{
  AAJSON *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = self;
  v6 = sub_1A5EC6350(a3);
  v8 = v7;

  v9 = (void *)sub_1A5F63E24();
  sub_1A5EF0908((uint64_t)v6, v8);
  return v9;
}

- (AAJSON)init
{
  AAJSON *result;

  result = (AAJSON *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  AAJSON *v2;
  void *v3;

  v2 = self;
  JSON.description.getter();

  v3 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
