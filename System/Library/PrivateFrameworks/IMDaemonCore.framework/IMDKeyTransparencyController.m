@implementation IMDKeyTransparencyController

- (NSDictionary)setupInfo
{
  uint64_t inited;
  IMDKeyTransparencyController *v4;
  unsigned __int8 v5;
  void *v6;

  sub_1D141AC58(&qword_1ED9356C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D1683B20;
  sub_1D166DACC();
  v4 = self;
  sub_1D166E048();
  v5 = -[IMDKeyTransparencyController selfOptedIn](v4, sel_selfOptedIn);
  *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 72) = v5;
  sub_1D141BB00(inited);

  v6 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v6;
}

+ (id)sharedController
{
  if (qword_1ED935658 != -1)
    swift_once();
  return (id)qword_1ED935650;
}

- (BOOL)selfOptedIn
{
  IMDKeyTransparencyController *v2;
  char v3;

  v2 = self;
  v3 = sub_1D16581C8();

  return v3 & 1;
}

- (IMDKeyTransparencyController)init
{
  return (IMDKeyTransparencyController *)sub_1D1658260();
}

- (void)optInStateChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  IMDKeyTransparencyController *v8;
  uint64_t v9;

  v4 = sub_1D166D460();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D43C();
  v8 = self;
  sub_1D1658A40();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{

  swift_release();
}

@end
