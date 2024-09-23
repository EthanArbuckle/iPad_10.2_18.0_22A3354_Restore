@implementation HAHDPinnedContentTaskServer

- (HAHDPinnedContentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  HAHDPinnedContentTaskServer *v18;
  objc_super v20;

  v10 = sub_23DB8C1C0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C1B4();
  v14 = a4;
  v15 = a5;
  swift_unknownObjectRetain();
  v16 = (void *)sub_23DB8C1A8();
  v17 = (objc_class *)type metadata accessor for PinnedContentTaskServer();
  v20.receiver = self;
  v20.super_class = v17;
  v18 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, v16, v14, v15, a6);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v18;
}

+ (NSString)taskIdentifier
{
  void *v2;

  sub_23DB8C100();
  sub_23DB8C0DC();
  v2 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)exportedInterface
{
  sub_23DB8C100();
  return (id)MEMORY[0x24263BD88]();
}

- (id)remoteInterface
{
  sub_23DB8C100();
  return (id)sub_23DB8C0E8();
}

- (void)remote_fetchPinnedContentInDomain:(id)a3 withCompletion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HAHDPinnedContentTaskServer *v10;

  v5 = _Block_copy(a4);
  v6 = sub_23DB8C310();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_23DB80654(v6, v8, (void (*)(_QWORD, void *))sub_23DB83064, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)remote_pinContentWithIdentifier:(id)a3 inDomain:(id)a4 atIndex:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  HAHDPinnedContentTaskServer *v16;

  v8 = _Block_copy(a6);
  v9 = sub_23DB8C310();
  v11 = v10;
  v12 = sub_23DB8C310();
  v14 = v13;
  _Block_copy(v8);
  v15 = a5;
  v16 = self;
  sub_23DB823B0(v9, v11, v12, v14, a5, v16, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_unpinContentWithIdentifier:(id)a3 inDomain:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HAHDPinnedContentTaskServer *v13;

  v6 = _Block_copy(a5);
  v7 = sub_23DB8C310();
  v9 = v8;
  v10 = sub_23DB8C310();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_23DB825B8(v7, v9, v10, v12, v13, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_movePinnedContentWithIdentifier:(id)a3 inDomain:(id)a4 toIndex:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  HAHDPinnedContentTaskServer *v16;

  v8 = _Block_copy(a6);
  v9 = sub_23DB8C310();
  v11 = v10;
  v12 = sub_23DB8C310();
  v14 = v13;
  _Block_copy(v8);
  v15 = a5;
  v16 = self;
  sub_23DB82788(v9, v11, v12, v14, v15, v16, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_unpinAllContentInDomain:(id)a3 withCompletion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HAHDPinnedContentTaskServer *v9;

  v5 = _Block_copy(a4);
  v6 = sub_23DB8C310();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_23DB8297C(v6, v8, v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)remote_applyDifferencesWithDifferences:(id)a3 inDomain:(id)a4 completion:(id)a5
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HAHDPinnedContentTaskServer *v11;

  v6 = _Block_copy(a5);
  sub_23DB8C148();
  v7 = sub_23DB8C370();
  v8 = sub_23DB8C310();
  v10 = v9;
  _Block_copy(v6);
  v11 = self;
  sub_23DB82DA4(v7, v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
