@implementation _EXServiceClient

+ (_EXServiceClient)sharedInstance
{
  if (qword_1EE20ACC0 != -1)
    swift_once();
  return (_EXServiceClient *)(id)qword_1EE20DF28;
}

- (_EXServiceClient)init
{
  return (_EXServiceClient *)sub_190C7AD08();
}

- (BOOL)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _EXServiceClient *v9;
  uint64_t v11;

  v5 = sub_190CA84E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190CA84B8();
  v9 = self;
  sub_190C7D464();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void)dealloc
{
  _EXServiceClient *v2;

  v2 = self;
  sub_190C7DA6C();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

}

@end
