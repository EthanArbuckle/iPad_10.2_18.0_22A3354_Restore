@implementation ISStreamsProvider

- (id)events
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  ISStreamsProvider *v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83B0);
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83B8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v13 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v12);
  v14 = *(void (**)(uint64_t, uint64_t))(v13 + 128);
  v17 = self;
  v14(v12, v13);
  type metadata accessor for TimestampedEventBridge();
  sub_21DC0D7E4();
  sub_21DC71630();
  v15 = (void *)sub_21DC71600();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v15;
}

- (id)eventGraphsWithWindowLength:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, double);
  ISStreamsProvider *v13;
  void *v14;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v11 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v10);
  v12 = *(void (**)(uint64_t, uint64_t, double))(v11 + 136);
  v13 = self;
  v12(v10, v11, a3);
  v14 = (void *)sub_21DC71648();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

- (id)eventGraphs
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  ISStreamsProvider *v10;
  void *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v9 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  v10 = self;
  InstrumentationStreamsProviderProtocol.eventGraphs()(v8, v9);
  v11 = (void *)sub_21DC71648();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v11;
}

- (id)connectedComponentGroupsWithWindowLength:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  ISStreamsProvider *v11;
  void *v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83D0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v10 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v9);
  v11 = self;
  InstrumentationStreamsProviderProtocol.connectedComponentGroups(windowLength:)(v9, v10);
  v12 = (void *)sub_21DC71648();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v12;
}

- (id)siriTurns
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  ISStreamsProvider *v11;
  void *v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A83D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v9 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 144);
  v11 = self;
  v10(v8, v9);
  v12 = (void *)sub_21DC71648();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v12;
}

- (id)siriConversations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  ISStreamsProvider *v11;
  void *v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_2553A83E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 16];
  v9 = *(_QWORD *)&self->provider[OBJC_IVAR___ISStreamsProvider_provider + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___ISStreamsProvider_provider), v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 152);
  v11 = self;
  v10(v8, v9);
  v12 = (void *)sub_21DC71648();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v12;
}

- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 windowLength:(double)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  ISComponentIdentifier *v18;
  ISStreamsProvider *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(double *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = self;
  v15 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2553A8460;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2553A8468;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_21DC23A8C((uint64_t)v12, (uint64_t)&unk_2553A8470, (uint64_t)v17);
  swift_release();
}

- (void)searchForEventGraphWithComponentIdentifier:(ISComponentIdentifier *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ISComponentIdentifier *v16;
  ISStreamsProvider *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2553A8440;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2553A8448;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_21DC23A8C((uint64_t)v10, (uint64_t)&unk_2553A8450, (uint64_t)v15);
  swift_release();
}

- (ISStreamsProvider)init
{
  ISStreamsProvider *result;

  result = (ISStreamsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___ISStreamsProvider_provider);
}

@end
