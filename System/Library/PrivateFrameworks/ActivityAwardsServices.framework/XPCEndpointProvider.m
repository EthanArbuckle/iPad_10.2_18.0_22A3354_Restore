@implementation XPCEndpointProvider

- (void)createEndpointNamed:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC22ActivityAwardsServices19XPCEndpointProvider *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1D2AB6808();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EFC9AF10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EFC9AF18;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D2AAFD18((uint64_t)v9, (uint64_t)&unk_1EFC9AF20, (uint64_t)v14);
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC22ActivityAwardsServices19XPCEndpointProvider *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D2A9A520(v7);

  return v9 & 1;
}

- (_TtC22ActivityAwardsServices19XPCEndpointProvider)init
{
  return (_TtC22ActivityAwardsServices19XPCEndpointProvider *)XPCEndpointProvider.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
