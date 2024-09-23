@implementation RKESessionDelegate

- (void)sesSession:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2158FCDA4();

}

- (void)sesSession:(id)a3 didCreateKey:(id)a4 forVehicle:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *v14;

  v7 = sub_2158FEF84();
  v9 = v8;
  v10 = sub_2158FEF84();
  v12 = v11;
  v13 = a3;
  v14 = self;
  sub_2158FCFE0(v7, v9, v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sesSession:(id)a3 event:(id)a4 fromVehicle:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *v12;

  v7 = sub_2158FEF6C();
  v8 = sub_2158FEF84();
  v10 = v9;
  v11 = a3;
  v12 = self;
  sub_2158FD830(v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4 fromVehicle:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = self;
  v11 = sub_2158FEE88();
  v13 = v12;

  v14 = sub_2158FEF84();
  v16 = v15;

  sub_2158FDEEC(v11, v13, v14, v16);
  swift_bridgeObjectRelease();
  sub_2158FA8E8(v11, v13);

}

- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate)init
{
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *result;

  result = (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
