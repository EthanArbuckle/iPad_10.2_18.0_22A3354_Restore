@implementation EXConnectionEndpoint

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)service
{
  void *v2;
  EXConnectionEndpoint *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, sel_service);
    sub_190CA85F0();

    v2 = (void *)sub_190CA85D8();
    swift_bridgeObjectRelease();
  }
  return (NSString *)v2;
}

- (BSServiceConnectionEndpoint)bsServiceConnectionEndpoint
{
  return (BSServiceConnectionEndpoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint));
}

- (OS_xpc_object)xpcEndpoint
{
  return (OS_xpc_object *)(id)swift_unknownObjectRetain();
}

- (void)setXpcEndpoint:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (EXConnectionEndpoint)initWithIdentifier:(id)a3 bsServiceConnectionEndpoint:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  EXConnectionEndpoint *v11;
  objc_super v13;

  v6 = sub_190CA85F0();
  v7 = OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = 0;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___EXConnectionEndpoint_identifier);
  *v8 = v6;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint) = (Class)a4;
  *(Class *)((char *)&self->super.isa + v7) = 0;
  v10 = a4;
  swift_unknownObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for EXConnectionEndpoint();
  v11 = -[EXConnectionEndpoint init](&v13, sel_init);

  return v11;
}

- (EXConnectionEndpoint)initWithIdentifier:(id)a3 xpcEndpoint:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  EXConnectionEndpoint *v10;
  objc_super v12;

  v6 = sub_190CA85F0();
  v7 = OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_xpcEndpoint) = 0;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___EXConnectionEndpoint_identifier);
  *v8 = v6;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EXConnectionEndpoint_bsServiceConnectionEndpoint) = 0;
  *(Class *)((char *)&self->super.isa + v7) = (Class)a4;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EXConnectionEndpoint();
  v10 = -[EXConnectionEndpoint init](&v12, sel_init);
  swift_unknownObjectRelease();
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  EXConnectionEndpoint *v5;

  v4 = a3;
  v5 = self;
  sub_190C8C8CC(v4);

}

- (EXConnectionEndpoint)initWithCoder:(id)a3
{
  id v3;
  EXConnectionEndpoint *v4;

  v3 = a3;
  v4 = (EXConnectionEndpoint *)sub_190C8CB64(v3);

  return v4;
}

- (EXConnectionEndpoint)init
{
  EXConnectionEndpoint *result;

  result = (EXConnectionEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
