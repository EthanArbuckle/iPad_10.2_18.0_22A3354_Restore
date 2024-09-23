@implementation NBObjCURLHasher

- (NBObjCURLHasher)init
{
  objc_class *ObjectType;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___NBObjCURLHasher_urlHasher;
  type metadata accessor for URLHasher();
  v5 = (objc_class *)swift_allocObject();
  type metadata accessor for StringHasher();
  *((_QWORD *)v5 + 2) = swift_allocObject();
  *(Class *)((char *)&self->super.isa + v4) = v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[NBObjCURLHasher init](&v7, sel_init);
}

- (id)hashForURL:(id)a3 maxLength:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NBObjCURLHasher *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v18;

  v5 = sub_1ABFBC598();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABFBC544();
  v9 = self;
  v10 = sub_1ABFBC52C();
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v10, v11);
  v13 = v12;
  v15 = v14;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = (void *)sub_1ABFBC5E0();
  sub_1ABFB8DCC(v13, v15);
  return v16;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
