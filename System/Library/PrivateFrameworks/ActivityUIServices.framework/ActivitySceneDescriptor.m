@implementation ActivitySceneDescriptor

- (NSString)activityIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)activitySceneType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType);
}

- (NSData)activityDescriptorData
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData));
}

- (NSData)activityDescriptor
{
  sub_22D84B340();
  sub_22D816680();
  return (NSData *)(id)sub_22D84B454();
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)metricsRequest
{
  return (_TtC18ActivityUIServices22ActivityMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
}

- (NSString)payloadID
{
  void *v2;

  if (*(_QWORD *)&self->activityIdentifier[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_22D84B5BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)metrics
{
  objc_class *v3;
  char *v4;
  void **v5;
  void *v6;
  _TtC18ActivityUIServices23ActivitySceneDescriptor *v7;
  _TtC18ActivityUIServices23ActivitySceneDescriptor *v8;
  objc_super v10;

  v3 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  *(_OWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_22D84F130;
  *(_QWORD *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
  swift_beginAccess();
  v6 = *v5;
  *v5 = 0;
  v7 = self;

  v10.receiver = v4;
  v10.super_class = v3;
  v8 = -[ActivitySceneDescriptor init](&v10, sel_init);

  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)v8;
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)initWithActivitySceneType:(int64_t)a3 activityDescriptor:(id)a4 metricsRequest:(id)a5 payloadID:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _TtC18ActivityUIServices23ActivitySceneDescriptor *v15;
  uint64_t v17;

  v9 = sub_22D84B340();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D816680();
  sub_22D84B448();
  if (a6)
  {
    v12 = sub_22D84B5C8();
    a6 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = a5;
  v15 = (_TtC18ActivityUIServices23ActivitySceneDescriptor *)sub_22D83F648(a3, (uint64_t)v11, v14, v12, (uint64_t)a6);

  return v15;
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)init
{
  _TtC18ActivityUIServices23ActivitySceneDescriptor *result;

  result = (_TtC18ActivityUIServices23ActivitySceneDescriptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData));
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor;
  v4 = sub_22D84B340();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest));
  swift_bridgeObjectRelease();
}

@end
