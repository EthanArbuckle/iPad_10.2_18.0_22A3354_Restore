@implementation ActivityUpdateProvider

- (int64_t)activityState
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  swift_beginAccess();
  return *v2;
}

- (void)setActivityState:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  swift_beginAccess();
  *v4 = a3;
}

- (ACActivityDescriptor)descriptor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  return (ACActivityDescriptor *)*v2;
}

- (void)setDescriptor:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC18ActivityUIServices22ActivityUpdateProvider)initWithActivityDescriptor:(id)a3 activityState:(int64_t)a4 systemMetricsRequest:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18ActivityUIServices22ActivityUpdateProvider *v11;
  uint64_t v13;

  v7 = sub_22D84B340();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D816680();
  sub_22D84B448();
  v10 = a5;
  v11 = (_TtC18ActivityUIServices22ActivityUpdateProvider *)sub_22D81D4D8((uint64_t)v9, a4, v10);

  return v11;
}

- (_TtC18ActivityUIServices22ActivityUpdateProvider)init
{
  _TtC18ActivityUIServices22ActivityUpdateProvider *result;

  result = (_TtC18ActivityUIServices22ActivityUpdateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityDescriptor;
  v4 = sub_22D84B340();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_systemMetricsRequest));
}

@end
