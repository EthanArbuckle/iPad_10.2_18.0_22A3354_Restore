@implementation APGuard

+ (id)sharedGuard
{
  if (qword_2542A52D8 != -1)
    swift_once();
  return (id)qword_2542A52E0;
}

- (void)authenticateForSubject:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  APGuard *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23627AD00(v8, (uint64_t)sub_236274D20, v7);

  swift_release();
}

- (void)authenticateForExtension:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  APGuard *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_236277930(v8, 0, 0, sub_236274D20, v7);

  swift_release();
}

- (void)authenticateForExtension:(id)a3 reasonDescription:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  APGuard *v13;

  v7 = _Block_copy(a5);
  v8 = sub_2362CB698();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a3;
  v13 = self;
  sub_236277930(v12, v8, v10, sub_23624E140, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)extensionRequiresAuthentication:(id)a3
{
  id v4;
  APGuard *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2362795F8(v4);

  return v6 & 1;
}

- (APGuard)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APGuard;
  return -[APGuard init](&v3, sel_init);
}

- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 completion:(id)a4
{
  sub_23627BA68(self, (int)a2, a3, a4, (void (*)(id, void *))sub_23627E3D4);
}

- (void)authenticateForSubject:(id)a3 relayingAuditToken:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  APGuard *v11;
  __int128 v12;
  __int128 v13;
  __int128 *v14;
  _OWORD v15[2];
  BOOL v16;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  v12 = 0uLL;
  v13 = 0uLL;
  if (!v5)
    goto LABEL_4;
  v14 = (__int128 *)APGetAuditTokenForSelf();
  if (v14)
  {
    v12 = *v14;
    v13 = v14[1];
LABEL_4:
    v15[0] = v12;
    v15[1] = v13;
    v16 = !v5;
    sub_23627E89C(v10, (uint64_t)v15, (uint64_t)sub_236274D20, v9);

    swift_release();
    return;
  }
  __break(1u);
}

- (void)initiateAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  APGuard *v15;

  v9 = *(_QWORD *)a4->var0;
  v10 = *(_QWORD *)&a4->var0[2];
  v11 = *(_QWORD *)&a4->var0[4];
  v12 = *(_QWORD *)&a4->var0[6];
  v13 = _Block_copy(a6);
  _Block_copy(v13);
  v14 = a3;
  v15 = self;
  sub_23627EB68(v14, v9, v10, v11, v12, a5, v13);
  _Block_release(v13);
  _Block_release(v13);

}

- (void)getIsChallengeCurrentlyRequiredForSubject:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  APGuard *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23627F160(v8, sub_236274210, v7);

  swift_release();
}

- (void)authenticateUnconditionallyWithCompletion:(id)a3
{
  sub_23627C750(self, (int)a2, a3, (uint64_t)&unk_250798108, (uint64_t)sub_236274D20, (void (*)(uint64_t, uint64_t))sub_23627F4C8);
}

- (void)authenticateUnconditionallyWithReason:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  APGuard *v10;

  v5 = _Block_copy(a4);
  v6 = sub_2362CB698();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_23627F610(v6, v8, (uint64_t (*)(uint64_t))sub_236274D20, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)authenticateForShieldDismissalForSubject:(id)a3 completion:(id)a4
{
  sub_23627BA68(self, (int)a2, a3, a4, (void (*)(id, void *))sub_23627F768);
}

- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 error:(id *)a4
{
  return sub_23627BD04(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_23627F974);
}

- (BOOL)authenticateSyncForSubject:(id)a3 error:(id *)a4
{
  return sub_23627BD04(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_23627FC08);
}

- (BOOL)initiateSyncAuthenticationWithShieldingForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  APGuard *v13;

  v8 = *(_QWORD *)a4->var0;
  v9 = *(_QWORD *)&a4->var0[2];
  v10 = *(_QWORD *)&a4->var0[4];
  v11 = *(_QWORD *)&a4->var0[6];
  v12 = a3;
  v13 = self;
  sub_23627FDE8(v12, v8, v9, v10, v11, a5);

  return 1;
}

- (BOOL)authenticateSyncUnconditionallyWithError:(id *)a3
{
  sub_2362801C8();
  return 1;
}

- (BOOL)authenticateSyncUnconditionallyWithReason:(id)a3 error:(id *)a4
{
  APGuard *v5;

  sub_2362CB698();
  v5 = self;
  sub_236280350();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)authenticateForSubject:(id)a3 interfacePresentationTarget:(id *)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  APGuard *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v13 = *(_OWORD *)a4->var0;
  v7 = *(_QWORD *)&a4->var0[4];
  v8 = *(_QWORD *)&a4->var0[6];
  v9 = _Block_copy(a5);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v14 = v13;
  v15 = v7;
  v16 = v8;
  v17 = 0;
  v11 = a3;
  v12 = self;
  sub_23627E89C(v11, (uint64_t)&v14, (uint64_t)sub_236274D20, v10);

  swift_release();
}

- (void)abortOngoingAuthWithCompletion:(id)a3
{
  sub_23627C750(self, (int)a2, a3, (uint64_t)&unk_250797D20, (uint64_t)sub_23624E140, (void (*)(uint64_t, uint64_t))sub_2362804FC);
}

@end
