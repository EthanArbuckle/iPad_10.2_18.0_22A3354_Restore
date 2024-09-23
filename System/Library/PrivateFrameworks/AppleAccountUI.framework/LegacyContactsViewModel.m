@implementation LegacyContactsViewModel

- (void)fetchAllTrustedContacts
{
  _TtC14AppleAccountUI23LegacyContactsViewModel *v2;

  v2 = self;
  sub_1DB5D0524();

}

- (void)startingRepair
{
  _TtC14AppleAccountUI23LegacyContactsViewModel *v2;

  v2 = self;
  sub_1DB5D0F64();

}

- (void)finishingRepair
{
  _TtC14AppleAccountUI23LegacyContactsViewModel *v2;

  v2 = self;
  sub_1DB5D1128();

}

- (_TtC14AppleAccountUI23LegacyContactsViewModel)init
{
  return (_TtC14AppleAccountUI23LegacyContactsViewModel *)sub_1DB5D1328();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(char *);

  v2 = OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel__trustedContacts;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02EE090);
  v4 = *(void (**)(char *))(*(_QWORD *)(v3 - 8) + 8);
  v4((char *)self + v2);
  ((void (*)(char *, uint64_t))v4)((char *)self + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel__trustedContactOwners, v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel_accountManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel_contactsProvider));
  sub_1DB570CA8();
}

@end
