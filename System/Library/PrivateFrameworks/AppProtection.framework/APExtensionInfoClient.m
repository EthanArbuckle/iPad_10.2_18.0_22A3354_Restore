@implementation APExtensionInfoClient

- (void)authenticateForExtensionWithUUID:(id)a3 reasonDescription:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _TtC13AppProtection21APExtensionInfoClient *v16;
  uint64_t v17;

  v8 = sub_2362CB428();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  sub_2362CB410();
  if (a4)
  {
    v14 = sub_2362CB698();
    a4 = v15;
  }
  else
  {
    v14 = 0;
  }
  _Block_copy(v13);
  v16 = self;
  sub_2362876C4((uint64_t)v12, v14, (uint64_t)a4, (uint64_t)v16, (void (**)(_QWORD, _QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)extensionRequiresAuthentication:(id)a3 completion:(id)a4
{
  sub_236287314(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_23628811C);
}

- (void)getExtensionIsLockedForUUID:(id)a3 completion:(id)a4
{
  sub_236287314(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_23628841C);
}

- (_TtC13AppProtection21APExtensionInfoClient)init
{
  _TtC13AppProtection21APExtensionInfoClient *result;

  result = (_TtC13AppProtection21APExtensionInfoClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection21APExtensionInfoClient_delegate);

}

@end
