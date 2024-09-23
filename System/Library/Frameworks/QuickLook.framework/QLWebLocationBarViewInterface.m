@implementation QLWebLocationBarViewInterface

+ (id)makeLocationBarUI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v16;

  v3 = type metadata accessor for QLWebLocationBarView();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  v9 = sub_20D5A6618();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6600();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  sub_20D57D74C((uint64_t)v8, (uint64_t)v6);
  v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549B91B8));
  v14 = (void *)sub_20D5A68D0();
  sub_20D57D790((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (_TtC9QuickLook29QLWebLocationBarViewInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return -[QLWebLocationBarViewInterface init](&v3, sel_init);
}

@end
