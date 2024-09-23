@implementation ASUIClientManager

+ (_TtC17AccessorySetupKit17ASUIClientManager)shared
{
  if (qword_255FF9950 != -1)
    swift_once();
  return (_TtC17AccessorySetupKit17ASUIClientManager *)(id)qword_255FF9958;
}

- (void)activateConnectionWithSession:(id)a3 with:(id)a4 for:(id)a5 completionHandler:(id)a6
{
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  _TtC17AccessorySetupKit17ASUIClientManager *v15;

  v9 = _Block_copy(a6);
  sub_232DD0A94(0, &qword_255FF99B8);
  v10 = sub_232DD0E38();
  if (a5)
  {
    v11 = sub_232DD0DFC();
    a5 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = a3;
  v15 = self;
  sub_232DCC534((uint64_t)v14, v10, v11, (char **)a5, (uint64_t)sub_232DD0C70, v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)failWithAccessory:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC17AccessorySetupKit17ASUIClientManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_232DCD4B4(v8, (uint64_t)sub_232DD0C70, v7);

  swift_release();
}

- (void)updateWithAccessory:(id)a3 options:(unint64_t)a4 for:(id)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC17AccessorySetupKit17ASUIClientManager *v15;

  v10 = _Block_copy(a6);
  if (a5)
  {
    v11 = sub_232DD0DFC();
    a5 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v14 = a3;
  v15 = self;
  sub_232DCD684(v14, a4, v11, (uint64_t)a5, (uint64_t)sub_232DD099C, v13);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  void *v3;
  _TtC17AccessorySetupKit17ASUIClientManager *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ASUIClientManager();
  -[ASUIClientManager dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  sub_232DCD34C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler));

  swift_unknownObjectRelease();
}

- (_TtC17AccessorySetupKit17ASUIClientManager)init
{
  return (_TtC17AccessorySetupKit17ASUIClientManager *)ASUIClientManager.init()();
}

@end
