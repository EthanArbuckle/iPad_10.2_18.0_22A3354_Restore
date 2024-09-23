@implementation AAFPhoneNumberFormatter

- (const)defaultCountryCode
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  return (const __CFString *)*v2;
}

- (void)setDefaultCountryCode:(const __CFString *)a3
{
  void **v4;
  void *v5;
  const __CFString *v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  v5 = *v4;
  *v4 = (void *)a3;
  v6 = (id)a3;

}

- (id)normalizedFormatFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  AAFPhoneNumberFormatter *v7;
  void *v8;

  v4 = sub_1B408FDF8();
  v6 = v5;
  v7 = self;
  sub_1B406C248(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B408FDEC();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)displayFormatFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  AAFPhoneNumberFormatter *v7;
  void *v8;

  v4 = sub_1B408FDF8();
  v6 = v5;
  v7 = self;
  sub_1B406B294(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B408FDEC();
  swift_bridgeObjectRelease();
  return v8;
}

- (AAFPhoneNumberFormatter)init
{
  return (AAFPhoneNumberFormatter *)PhoneNumberFormatter.init()();
}

- (void).cxx_destruct
{

}

@end
