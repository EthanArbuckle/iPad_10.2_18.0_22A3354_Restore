@implementation BEMediaEnvironment

- (BEMediaEnvironment)initWithWebPageURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  BEMediaEnvironment *v14;
  objc_class *v15;
  BEMediaEnvironment *v16;
  objc_super v18;

  v4 = type metadata accessor for MediaEnvironment(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_233073730();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  sub_233073718();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = self;
  MediaEnvironment.init(webPage:)((uint64_t)v11, v6);
  sub_233072070((uint64_t)v6, (uint64_t)v14 + OBJC_IVAR___BEMediaEnvironment_inner);

  v15 = (objc_class *)type metadata accessor for BEMediaEnvironment(0);
  v18.receiver = v14;
  v18.super_class = v15;
  v16 = -[BEMediaEnvironment init](&v18, sel_init);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v16;
}

- (BEMediaEnvironment)initWithXPCRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  BEMediaEnvironment *v9;
  objc_class *v10;
  BEMediaEnvironment *v11;
  uint64_t v13;
  objc_super v14;

  v6 = type metadata accessor for MediaEnvironment(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_unknownObjectRetain_n();
  v9 = self;
  MediaEnvironment.init(xpcRepresentation:)(a3, v8);
  sub_233072070((uint64_t)v8, (uint64_t)v9 + OBJC_IVAR___BEMediaEnvironment_inner);

  v10 = (objc_class *)type metadata accessor for BEMediaEnvironment(0);
  v14.receiver = v9;
  v14.super_class = v10;
  v11 = -[BEMediaEnvironment init](&v14, sel_init);
  swift_unknownObjectRelease();
  return v11;
}

- (id)createXPCRepresentation
{
  BEMediaEnvironment *v2;
  xpc_object_t empty;
  uint64_t v4;
  uint64_t v5;

  v2 = self;
  empty = xpc_dictionary_create_empty();
  v4 = sub_2330739AC();
  xpc_dictionary_set_string(empty, "identifier", (const char *)(v4 + 32));
  swift_release();
  type metadata accessor for MediaEnvironment(0);
  sub_2330736DC();
  v5 = sub_2330739AC();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_string(empty, "url", (const char *)(v5 + 32));

  swift_release();
  return empty;
}

- (BOOL)activateWithError:(id *)a3
{
  return sub_23306FBA8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))MediaEnvironment.activate());
}

- (BOOL)suspendWithError:(id *)a3
{
  return sub_23306FBA8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))MediaEnvironment.suspend());
}

- (id)makeCaptureSessionWithError:(id *)a3
{
  id v4;
  BEMediaEnvironment *v5;
  void *v6;
  id v7;

  v4 = objc_allocWithZone(MEMORY[0x24BDB24D0]);
  v5 = self;
  swift_bridgeObjectRetain();
  v6 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithMediaEnvironment_, v6);

  return v7;
}

- (BEMediaEnvironment)init
{
  BEMediaEnvironment *result;

  result = (BEMediaEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23306DAA8((uint64_t)self + OBJC_IVAR___BEMediaEnvironment_inner, type metadata accessor for MediaEnvironment);
}

@end
