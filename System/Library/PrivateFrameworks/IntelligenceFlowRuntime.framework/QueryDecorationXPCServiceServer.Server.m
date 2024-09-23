@implementation QueryDecorationXPCServiceServer.Server

- (void)queryDecorationCollectionWithQdInputData:(id)a3 with:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = sub_23FD713D8();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  sub_23FCA9D98(v8, v10, (uint64_t)sub_23FCAB7A4, v11);
  swift_release();
  sub_23FC577B0(v8, v10);

}

- (void)queryDecorationCollectionWithQdInputData:(id)a3 sessionUUIDData:(id)a4 with:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server *v18;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v18 = self;
  v11 = sub_23FD713D8();
  v13 = v12;

  v14 = sub_23FD713D8();
  v16 = v15;

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v8;
  sub_23FCAA2B4(v11, v13, v14, v16, (uint64_t)sub_23FCAB5B8, v17);
  swift_release();
  sub_23FC577B0(v14, v16);
  sub_23FC577B0(v11, v13);

}

- (_TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server)init
{
  sub_23FC98380();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23FCAB84C();
  sub_23FCAB84C();
  sub_23FCAB84C();
  sub_23FCAB84C();
  swift_bridgeObjectRelease();
}

@end
