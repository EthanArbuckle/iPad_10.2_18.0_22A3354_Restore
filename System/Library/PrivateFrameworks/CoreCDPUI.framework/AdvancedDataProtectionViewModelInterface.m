@implementation AdvancedDataProtectionViewModelInterface

- (_TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface)init
{
  _TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface *result;

  result = (_TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_cdpContext));
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__progressViewIsDisplayed;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E2E20);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__isWalrusEnabled, v4);
  v5((char *)self+ OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__isWalrusAvailableForPrimaryAccount, v4);
  v6 = (char *)self
     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__localizedWalrusUnavailableMessage;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E2E28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__walrusStatusMismatchDetected, v4);
  v8 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__adpState;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E2E30);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_accountRecoveryRowViewModel));
  swift_release();
  swift_release();
  v10 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_walrusStatePublisher;
  v11 = sub_20DCF6DA8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
}

@end
