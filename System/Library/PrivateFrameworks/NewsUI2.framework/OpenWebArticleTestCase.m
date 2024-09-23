@implementation OpenWebArticleTestCase

- (_TtC7NewsUI222OpenWebArticleTestCase)init
{
  objc_class *ObjectType;
  char *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_testName;
  strcpy((char *)self + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_testName, "OpenWebArticle");
  v4[15] = -18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[OpenWebArticleTestCase init](&v6, sel_init);
}

- (NSString)testName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7NewsUI222OpenWebArticleTestCase *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v8, sel_application);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1D5FACAE0;
  *(_QWORD *)(v11 + 24) = v7;
  v13[4] = sub_1D602D4B4;
  v13[5] = v11;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1D5EB52E8;
  v13[3] = &block_descriptor_38;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_ts_installCACommitCompletionBlock_, v12);
  _Block_release(v12);

  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
