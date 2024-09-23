@implementation ACDXPCEventPublisherWrapper

+ (void)notifySubscribersOfAccountChange:(id)a3 type:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v9 = sub_20D93751C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(v10 + 24) = 0;
    *(_QWORD *)(v10 + 32) = a3;
    *(_DWORD *)(v10 + 40) = a4;
    v11 = a3;
    sub_20D924AF4((uint64_t)v8, (uint64_t)&unk_2549CC360, v10);

    swift_release();
    sub_20D92D068((uint64_t)v8, (uint64_t *)&unk_253E54DA8);

  }
}

- (_TtC14AccountsDaemon27ACDXPCEventPublisherWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return -[ACDXPCEventPublisherWrapper init](&v3, sel_init);
}

@end
