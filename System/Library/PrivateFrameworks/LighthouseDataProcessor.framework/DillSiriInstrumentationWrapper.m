@implementation DillSiriInstrumentationWrapper

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)init
{
  _TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *result;

  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_2408E602C();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithCoder:(id)a3
{
  _TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *result;

  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_2408E602C();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper)initWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *result;

  if (a3)
  {
    v3 = a3;
    v4 = sub_2408E5564();
    v6 = v5;

    sub_240363D58(v4, v6);
  }
  result = (_TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper *)sub_2408E602C();
  __break(1u);
  return result;
}

- (NSData)data
{
  return (NSData *)sub_2408C4FD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_dillData);
}

- (id)qualifiedMessageName
{
  return (id)sub_2408E5CE4();
}

- (BOOL)isProvisional
{
  return 0;
}

- (int)getAnyEventType
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_anyEventType);
}

- (void).cxx_destruct
{
  sub_240363D58(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_dillData), *(_QWORD *)&self->dillData[OBJC_IVAR____TtC23LighthouseDataProcessor30DillSiriInstrumentationWrapper_dillData]);
}

@end
