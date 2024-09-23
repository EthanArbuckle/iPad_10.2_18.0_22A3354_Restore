@implementation IdentityProvisioningSession

- (_TtC7CoreIDV27IdentityProvisioningSession)init
{
  return (_TtC7CoreIDV27IdentityProvisioningSession *)IdentityProvisioningSession.init()();
}

- (void)generateIdentityProvisioningAttestationsWithCredentialIdentifier:(NSString *)a3 pairingID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC7CoreIDV27IdentityProvisioningSession *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545D99E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20A1A8F1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2545D9F20;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2545D9A30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20A176094((uint64_t)v11, (uint64_t)aP_1, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
