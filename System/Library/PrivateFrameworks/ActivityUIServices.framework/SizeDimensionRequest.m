@implementation SizeDimensionRequest

- (double)minimum
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
}

- (double)maximum
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  objc_super v6;

  if (a3 <= 0.0)
    a3 = 0.0;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type) = (Class)a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return -[SizeDimensionRequest init](&v6, sel_init);
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return -[SizeDimensionRequest initWithMinimum:maximum:type:](self, sel_initWithMinimum_maximum_type_, 0, a3, a4);
}

- (int64_t)hash
{
  return sub_22D849EAC();
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v4;
  _TtC18ActivityUIServices20SizeDimensionRequest *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_22D849FA4((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v2;
  void *v3;

  v2 = self;
  sub_22D84A12C();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_22D84A30C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_22D84B988();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityUIServices20SizeDimensionRequest *v5;

  v4 = a3;
  v5 = self;
  sub_22D84A424(v4);

}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices20SizeDimensionRequest *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices20SizeDimensionRequest *)sub_22D84A884(v3);

  return v4;
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)initWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v4;

  swift_unknownObjectRetain();
  v4 = (_TtC18ActivityUIServices20SizeDimensionRequest *)sub_22D84A9B0(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v4;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    xpc_dictionary_set_int64(a3, "type", *(int64_t *)((char *)&v4->super.isa + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type));
    swift_unknownObjectRelease();

  }
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)init
{
  _TtC18ActivityUIServices20SizeDimensionRequest *result;

  result = (_TtC18ActivityUIServices20SizeDimensionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
