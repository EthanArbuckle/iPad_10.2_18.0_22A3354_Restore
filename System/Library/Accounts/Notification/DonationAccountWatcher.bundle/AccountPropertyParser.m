@implementation AccountPropertyParser

- (_TtC22DonationAccountWatcher21AccountPropertyParser)init
{
  _TtC22DonationAccountWatcher21AccountPropertyParser *result;

  result = (_TtC22DonationAccountWatcher21AccountPropertyParser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
  v4 = sub_230F0FC38();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate, v4);
}

@end
