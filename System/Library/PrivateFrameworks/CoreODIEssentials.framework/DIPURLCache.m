@implementation DIPURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6;
  id v7;
  _TtC17CoreODIEssentials11DIPURLCache *v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_20A4D679C(v6);
  if (v9)
  {
    v10 = v9;
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for DIPURLCache();
    -[NSURLCache storeCachedResponse:forDataTask:](&v11, sel_storeCachedResponse_forDataTask_, v10, v7);

  }
  else
  {

  }
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC17CoreODIEssentials11DIPURLCache *v12;
  id v13;
  id v14;
  uint64_t v15;
  objc_class *v16;
  objc_super v17;

  v6 = sub_20A5B8240();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A5B8204();
  v11 = a3;
  v12 = self;
  v13 = sub_20A4D679C(v11);
  if (v13)
  {
    v14 = v13;
    v15 = sub_20A5B81EC();
    v16 = (objc_class *)type metadata accessor for DIPURLCache();
    v17.receiver = v12;
    v17.super_class = v16;
    -[NSURLCache storeCachedResponse:forRequest:](&v17, sel_storeCachedResponse_forRequest_, v14, v15);

    v11 = v14;
    v12 = (_TtC17CoreODIEssentials11DIPURLCache *)v15;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC17CoreODIEssentials11DIPURLCache *v11;
  objc_super v13;

  if (a5)
  {
    sub_20A5B8900();
    v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
    *v8 = 45;
    v8[1] = 0xE100000000000000;
    v9 = (void *)sub_20A5B88F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
    v10 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
    *v10 = 45;
    v10[1] = 0xE100000000000000;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DIPURLCache();
  v11 = -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:](&v13, sel_initWithMemoryCapacity_diskCapacity_diskPath_, a3, a4, v9);

  return v11;
}

- (_TtC17CoreODIEssentials11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  _TtC17CoreODIEssentials11DIPURLCache *v22;
  objc_super v24;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EB4980);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v24 - v15;
  if (a5)
  {
    sub_20A5B848C();
    v17 = sub_20A5B84D4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    v17 = sub_20A5B84D4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  }
  v18 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
  *v18 = 45;
  v18[1] = 0xE100000000000000;
  sub_20A4D7C7C((uint64_t)v16, (uint64_t)v13);
  sub_20A5B84D4();
  v19 = *(_QWORD *)(v17 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17) != 1)
  {
    v20 = (void *)sub_20A5B8474();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v13, v17);
  }
  v21 = (objc_class *)type metadata accessor for DIPURLCache();
  v24.receiver = self;
  v24.super_class = v21;
  v22 = -[NSURLCache initWithMemoryCapacity:diskCapacity:directoryURL:](&v24, sel_initWithMemoryCapacity_diskCapacity_directoryURL_, a3, a4, v20);

  sub_20A44CE2C((uint64_t)v16, (uint64_t *)&unk_253EB4980);
  return v22;
}

- (_TtC17CoreODIEssentials11DIPURLCache)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17CoreODIEssentials11DIPURLCache_logger);
  *v2 = 45;
  v2[1] = 0xE100000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DIPURLCache();
  return -[NSURLCache init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
