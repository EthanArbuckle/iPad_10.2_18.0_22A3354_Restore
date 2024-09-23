@implementation APGuardClient

- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 completion:(id)a4
{
  sub_236270ECC(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_236272A5C);
}

- (void)authenticateForBundle:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC13AppProtection13APGuardClient *v9;
  _OWORD v10[2];
  char v11;

  v5 = _Block_copy(a4);
  v6 = sub_2362CB698();
  v8 = v7;
  memset(v10, 0, sizeof(v10));
  v11 = 1;
  _Block_copy(v5);
  v9 = self;
  sub_236272CA0(v6, v8, 0, 0, (uint64_t)v10, (uint64_t)v9, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)initiateAuthenticationWithShieldingForBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC13AppProtection13APGuardClient *v13;

  v9 = _Block_copy(a6);
  v10 = sub_2362CB698();
  v12 = v11;
  _Block_copy(v9);
  v13 = self;
  sub_236272F44(v10, v12, (uint64_t)a4, a5, (uint64_t)v13, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)getIsChallengeCurrentlyRequiredForBundle:(id)a3 completion:(id)a4
{
  sub_236270ECC(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_236273198);
}

- (void)beginTransactionForAccessOfBundle:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 transactionUUID:(id)a6 completion:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC13AppProtection13APGuardClient *v20;
  uint64_t v21;

  v11 = sub_2362CB428();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = sub_2362CB698();
  v19 = v18;
  sub_2362CB410();
  _Block_copy(v16);
  v20 = self;
  sub_236273410(v17, v19, (uint64_t)a4, a5, (uint64_t)v15, (uint64_t)v20, (void (**)(_QWORD, _QWORD))v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

- (void)endTransactionWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC13AppProtection13APGuardClient *v12;
  uint64_t v13;

  v6 = sub_2362CB428();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  sub_2362CB410();
  _Block_copy(v11);
  v12 = self;
  sub_236273684((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)authenticateUnconditionallyWithCompletion:(id)a3
{
  void *v4;
  _TtC13AppProtection13APGuardClient *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_2362738D4(0, 0, (uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC13AppProtection13APGuardClient *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = sub_2362CB698();
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_2362738D4(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)authenticateForShieldUnlockOfBundle:(id)a3 completion:(id)a4
{
  sub_236270ECC(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_236273B1C);
}

- (void)authenticateForBundle:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _TtC13AppProtection13APGuardClient *v13;
  _OWORD v14[2];
  BOOL v15;

  v7 = _Block_copy(a5);
  v8 = sub_2362CB698();
  v10 = v9;
  if (a4)
  {
    v11 = *(_OWORD *)a4->var0;
    v12 = *(_OWORD *)&a4->var0[4];
  }
  else
  {
    v11 = 0uLL;
    v12 = 0uLL;
  }
  v14[0] = v11;
  v14[1] = v12;
  v15 = a4 == 0;
  _Block_copy(v7);
  v13 = self;
  sub_236272CA0(v8, v10, 0, 0, (uint64_t)v14, (uint64_t)v13, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)abortOngoingAuthWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13AppProtection13APGuardClient *v6;
  _QWORD v7[4];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v7[2] = sub_236272790;
  v7[3] = v5;
  v6 = self;
  sub_23626F92C((void (*)(id))sub_236272798, (uint64_t)v7, (void (*)(_BYTE *))sub_2362712F0);

  swift_release();
}

- (_TtC13AppProtection13APGuardClient)init
{
  _TtC13AppProtection13APGuardClient *result;

  result = (_TtC13AppProtection13APGuardClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection13APGuardClient_delegate);
}

@end
