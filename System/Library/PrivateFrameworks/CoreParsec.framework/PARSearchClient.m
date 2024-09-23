@implementation PARSearchClient

- (_TtC10CoreParsec15PARSearchClient)init
{
  _TtC10CoreParsec15PARSearchClient *result;

  PARSearchClient.init()();
  return result;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)PARSearchClient.connection.getter();
}

- (void)dealloc
{
  _TtC10CoreParsec15PARSearchClient *v2;

  v2 = self;
  PARSearchClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_19A85CB3C((uint64_t)self + OBJC_IVAR____TtC10CoreParsec15PARSearchClient_receivingStreamDelegate);

}

- (void)bag:(id)a3 reply:(id)a4
{
  sub_19A85F43C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_19A85DE20);
}

- (void)forceFetchBag:(id)a3 reply:(id)a4
{
  sub_19A85F43C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_19A85E7BC);
}

- (unint64_t)request:(id)a3 request:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC10CoreParsec15PARSearchClient *v11;
  id v12;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = sub_19A860D08((uint64_t)v9, v10, (uint64_t)v11, v8);
  _Block_release(v8);

  return (unint64_t)v12;
}

- (void)reportFeedback:(id)a3 feedback:(id)a4 queryId:(unint64_t)a5
{
  id v7;
  id v8;
  _TtC10CoreParsec15PARSearchClient *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_19A832E38();

}

- (void)listSessions:(id)a3
{
  void *v4;
  _TtC10CoreParsec15PARSearchClient *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_19A861E54();

  swift_release();
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC10CoreParsec15PARSearchClient *v6;

  v5 = _Block_copy(a4);
  sub_19A8C4944();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_19A832B34();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getImageMap:(id)a3
{
  void *v4;
  _TtC10CoreParsec15PARSearchClient *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19A8620AC((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)clearEngagementsFrom:(id)a3 to:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _TtC10CoreParsec15PARSearchClient *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v5 = sub_19A8C3EA0();
  v6 = *(_QWORD *)(v5 - 8);
  v11 = MEMORY[0x1E0C80A78](v5, v7, v8, v9, v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14, v15, v16, v17);
  v19 = (char *)&v22 - v18;
  sub_19A8C3E88();
  sub_19A8C3E88();
  v20 = self;
  sub_19A86360C();

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v13, v5);
  v21(v19, v5);
}

- (void)clearEngagementsWith:(id)a3 type:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10CoreParsec15PARSearchClient *v10;

  v6 = sub_19A8C4944();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_19A863758(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)clearEngagedResults:(id)a3 with:(id)a4 completion:(id)a5
{
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC10CoreParsec15PARSearchClient *v11;

  v7 = _Block_copy(a5);
  sub_19A8275AC(0, (unint64_t *)&unk_1ECFFDFF0);
  v8 = sub_19A8C4A1C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_19A85C880;
  }
  else
  {
    v9 = 0;
  }
  v10 = a4;
  v11 = self;
  sub_19A86381C(v8, (uint64_t)v10, (uint64_t)v7, v9);
  sub_19A85C888((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  id v6;
  id v7;
  _TtC10CoreParsec15PARSearchClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19A863B74((uint64_t)v6, (uint64_t)v7);

}

- (void)bagDidLoad:(id)a3 error:(id)a4
{
  id v6;
  _TtC10CoreParsec15PARSearchClient *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  PARSearchClient.bagDidLoad(_:error:)();

}

- (void)didDownloadResource:(id)a3
{
  sub_19A864680(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))PARSearchClient.didDownloadResource(_:));
}

- (void)didDeleteResource:(id)a3
{
  sub_19A864680(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))PARSearchClient.didDeleteResource(_:));
}

- (void)didReceiveFeedbackData:(id)a3 agent:(id)a4
{
  id v6;
  _TtC10CoreParsec15PARSearchClient *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC10CoreParsec15PARSearchClient *v16;

  if (!a3)
  {
    v15 = a4;
    v16 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v14 = 0;
    goto LABEL_6;
  }
  v6 = a4;
  v7 = self;
  v8 = a3;
  v9 = sub_19A8C3E40();
  v11 = v10;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v12 = sub_19A8C4944();
  v14 = v13;

LABEL_6:
  PARSearchClient.didReceiveFeedbackData(_:agent:)(v9, v11, v12, v14);
  swift_bridgeObjectRelease();
  sub_19A83334C(v9, v11);

}

@end
