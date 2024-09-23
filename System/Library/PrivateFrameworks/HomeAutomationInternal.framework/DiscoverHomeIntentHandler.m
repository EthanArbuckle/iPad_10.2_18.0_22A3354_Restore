@implementation DiscoverHomeIntentHandler

- (void)resolveFiltersForDiscoverHome:(DiscoverHomeIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DiscoverHomeIntent *v15;
  _TtC22HomeAutomationInternal25DiscoverHomeIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25560BCD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220C98D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25560ED30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25560BD28;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220B986FC((uint64_t)v9, (uint64_t)&unk_25560BD30, (uint64_t)v14);
  swift_release();
}

- (void)confirmDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DiscoverHomeIntent *v15;
  _TtC22HomeAutomationInternal25DiscoverHomeIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25560BCD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220C98D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25560ED20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25560BD08;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220B986FC((uint64_t)v9, (uint64_t)&unk_25560BD10, (uint64_t)v14);
  swift_release();
}

- (void)handleDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DiscoverHomeIntent *v15;
  _TtC22HomeAutomationInternal25DiscoverHomeIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25560BCD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220C98D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25560ED10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25560BCE8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220B986FC((uint64_t)v9, (uint64_t)&unk_25560BCF0, (uint64_t)v14);
  swift_release();
}

- (_TtC22HomeAutomationInternal25DiscoverHomeIntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiscoverHomeIntentHandler();
  return -[DiscoverHomeIntentHandler init](&v3, sel_init);
}

@end
