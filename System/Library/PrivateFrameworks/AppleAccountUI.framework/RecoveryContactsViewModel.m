@implementation RecoveryContactsViewModel

- (void)fetchAllTrustedContacts
{
  _TtC14AppleAccountUI25RecoveryContactsViewModel *v2;

  v2 = self;
  sub_1DB568A50();

}

- (void)startingRepair
{
  _TtC14AppleAccountUI25RecoveryContactsViewModel *v2;

  v2 = self;
  sub_1DB56BE74();

}

- (void)finishingRepair
{
  _TtC14AppleAccountUI25RecoveryContactsViewModel *v2;

  v2 = self;
  sub_1DB56C038();

}

- (_TtC14AppleAccountUI25RecoveryContactsViewModel)init
{
  return (_TtC14AppleAccountUI25RecoveryContactsViewModel *)sub_1DB56C25C();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(char *);

  v2 = OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel__trustedContacts;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02EE090);
  v4 = *(void (**)(char *))(*(_QWORD *)(v3 - 8) + 8);
  v4((char *)self + v2);
  ((void (*)(char *, uint64_t))v4)((char *)self + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel__trustedContactOwners, v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_accountManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_contactsProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_custodianController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_repairHelper));
}

@end
