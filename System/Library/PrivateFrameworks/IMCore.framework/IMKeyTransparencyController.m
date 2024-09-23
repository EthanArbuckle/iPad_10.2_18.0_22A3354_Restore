@implementation IMKeyTransparencyController

- (IMKeyTransparencyController)init
{
  return (IMKeyTransparencyController *)sub_1A200DE7C();
}

+ (id)sharedController
{
  if (qword_1EE65C298 != -1)
    swift_once();
  return (id)qword_1EE65C348;
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  uint64_t v5;
  IMKeyTransparencyController *v6;

  v5 = sub_1A219974C();
  v6 = self;
  sub_1A200E1D0(v5);

  swift_bridgeObjectRelease();
}

- (void)keyTransparencyOptInStateChanged:(BOOL)a3
{
  IMKeyTransparencyController *v4;

  v4 = self;
  sub_1A200E454(a3);

}

- (KTVerifier)verifier
{
  return (KTVerifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___IMKeyTransparencyController_verifier));
}

- (BOOL)selfOptedIn
{
  IMKeyTransparencyController *v2;
  char v3;

  v2 = self;
  v3 = sub_1A218A67C();

  return v3 & 1;
}

- (void)refreshStatusForKTPeerURI:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  IMKeyTransparencyController *v7;

  v4 = (void *)sub_1A2199764();
  v6 = v5;
  v7 = self;
  sub_1A218BFA4(v4, v6);

  swift_bridgeObjectRelease();
}

- (id)ktVerifierResultForHandleID:(id)a3
{
  return sub_1A218ABD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1A218A7E4);
}

- (void)setKTVerifierResult:(id)a3 forHandleID:(id)a4
{
  sub_1A218B1D8((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(os_unfair_lock_s *, id, uint64_t, uint64_t))sub_1A218A89C);
}

- (id)idsIDInfoResultForHandleID:(id)a3
{
  return sub_1A218ABD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1A218AB20);
}

- (void)setIDSIDInfoResult:(id)a3 forHandleID:(id)a4
{
  sub_1A218B1D8((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(os_unfair_lock_s *, id, uint64_t, uint64_t))sub_1A218AC38);
}

- (unint64_t)contactKeyVerificationStatusForHandleID:(id)a3 inChat:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  IMKeyTransparencyController *v10;
  unint64_t v11;

  v6 = sub_1A2199764();
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11 = sub_1A218B29C(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)setKTVerifierResultsFromIDSInfoResultsDictionary:(id)a3
{
  uint64_t v4;
  IMKeyTransparencyController *v5;

  v4 = sub_1A219974C();
  v5 = self;
  sub_1A218B5E8(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
