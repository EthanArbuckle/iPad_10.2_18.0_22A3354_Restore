@implementation AccountRecoveryRowViewModel

- (_TtC9CoreCDPUI27AccountRecoveryRowViewModel)init
{
  _TtC9CoreCDPUI27AccountRecoveryRowViewModel *result;

  result = (_TtC9CoreCDPUI27AccountRecoveryRowViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  sub_20DCC2410((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel__isRecoveryEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E2E20);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel__isSpinnerActive, v4);
}

- (id)accountsForAccountManager:(id)a3
{
  uint64_t inited;
  void *v6;
  id v7;
  _TtC9CoreCDPUI27AccountRecoveryRowViewModel *v8;
  id v9;
  id v10;
  id v11;
  id result;
  void *v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E41F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DCFD0D0;
  v6 = (void *)*MEMORY[0x24BE06080];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE06080];
  v7 = a3;
  v8 = self;
  v9 = v6;
  v10 = objc_msgSend(v7, sel_accountStore);
  v11 = objc_msgSend(v10, sel_aa_primaryAppleAccount);

  if (v11)
  {
    *(_QWORD *)(inited + 40) = v11;
    sub_20DCF1ED4(inited);

    type metadata accessor for AIDAServiceType(0);
    sub_20DCF20F4();
    sub_20DCF2130();
    v13 = (void *)sub_20DCF6BA4();
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
