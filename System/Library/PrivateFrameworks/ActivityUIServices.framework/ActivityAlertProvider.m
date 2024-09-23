@implementation ActivityAlertProvider

- (int64_t)action
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction);
}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_22D81A8FC(self, (uint64_t)a2, (void (*)(void))sub_22D81A300);
}

- (NSString)payloadIdentifier
{
  return (NSString *)sub_22D81A8FC(self, (uint64_t)a2, (void (*)(void))sub_22D81A318);
}

- (TLAlertConfiguration)configuration
{
  return (TLAlertConfiguration *)sub_22D81A584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
}

- (void)setConfiguration:(id)a3
{
  sub_22D81A620((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
}

- (ACAlertPresentationOptions)presentationOptions
{
  return (ACAlertPresentationOptions *)sub_22D81A584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
}

- (void)setPresentationOptions:(id)a3
{
  sub_22D81A620((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
}

- (NSString)title
{
  return (NSString *)sub_22D81A8FC(self, (uint64_t)a2, (void (*)(void))sub_22D81A77C);
}

- (NSString)body
{
  return (NSString *)sub_22D81A8FC(self, (uint64_t)a2, (void (*)(void))sub_22D81A8E4);
}

- (NSString)deviceIdentifier
{
  return (NSString *)sub_22D81A8FC(self, (uint64_t)a2, (void (*)(void))sub_22D81A964);
}

- (_TtC18ActivityUIServices21ActivityAlertProvider)initWithIdentifier:(id)a3 action:(int64_t)a4 presentationOptions:(id)a5 payload:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC18ActivityUIServices21ActivityAlertProvider *v18;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D97048);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22D84B5C8();
  v14 = v13;
  if (a6)
  {
    v15 = sub_22D84B3E8();
    sub_22D81B630();
    sub_22D84B448();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    v16 = sub_22D84B3E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  v17 = a5;
  v18 = (_TtC18ActivityUIServices21ActivityAlertProvider *)sub_22D81AD34(v12, v14, (char *)a4, a5, (uint64_t)v11);

  return v18;
}

- (_TtC18ActivityUIServices21ActivityAlertProvider)init
{
  _TtC18ActivityUIServices21ActivityAlertProvider *result;

  result = (_TtC18ActivityUIServices21ActivityAlertProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions));
  swift_bridgeObjectRelease();
  sub_22D81B6C0((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertConfiguration, &qword_255D970F0);
  sub_22D81B6C0((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload, &qword_255D97048);
}

@end
