@implementation ATXSportsServer

+ (ATXSportsServer)sharedInstance
{
  if (qword_1ED84F948 != -1)
    swift_once();
  return (ATXSportsServer *)(id)qword_1ED84F940;
}

- (ATXSportsServer)init
{
  return (ATXSportsServer *)sub_1C9E13164();
}

- (void)requestedSchedulesForTeamsWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  ATXSportsServer *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF9333D0;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF9333E0;
  v13[5] = v12;
  v14 = self;
  sub_1C9DF9768((uint64_t)v8, (uint64_t)&unk_1EF9333F0, (uint64_t)v13);
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  ATXSportsServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1C9E19BEC(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{

}

@end
