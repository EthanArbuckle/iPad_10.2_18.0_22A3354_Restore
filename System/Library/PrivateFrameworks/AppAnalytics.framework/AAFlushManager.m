@implementation AAFlushManager

- (AAFlushManager)initWithAppSessionManager:(id)a3 client:(id)a4 endpoint:(id)a5 config:(id)a6
{
  objc_class *ObjectType;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AAFlushManager *v18;
  uint64_t v19;
  char *v20;
  AAFlushManager *v21;
  objc_super v23;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for URLSessionUploadClientFactory();
  v12 = swift_allocObject();
  v13 = a4;
  swift_unknownObjectRetain_n();
  v14 = a6;
  v15 = v13;
  v16 = v14;
  v17 = a3;
  v18 = self;
  v19 = swift_retain();
  v20 = sub_1A5F02348(v19, v15, a5, 0, v16, v12);
  swift_release();
  *(Class *)((char *)&v18->super.isa + OBJC_IVAR___AAFlushManager_flushManager) = (Class)v20;

  v23.receiver = v18;
  v23.super_class = ObjectType;
  v21 = -[AAFlushManager init](&v23, sel_init);

  swift_unknownObjectRelease();
  return v21;
}

- (void)flushWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  AAFlushManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A5EBC084;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1A5EC8138(0, 0, (void (*)(void))v7, v6);
  sub_1A5ED0004((uint64_t)v7);

}

- (AAFlushManager)init
{
  AAFlushManager *result;

  result = (AAFlushManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
