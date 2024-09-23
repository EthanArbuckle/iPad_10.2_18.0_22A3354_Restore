@implementation TetraMessageSignerFormatter

- (id)signedData
{
  uint64_t v2;
  unint64_t v3;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData);
  v3 = *(_QWORD *)&self->_signedData[OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData];
  outlined copy of Data._Representation(v2, v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v3);
  return isa;
}

- (_TtC17MessageProtection27TetraMessageSignerFormatter)init
{
  _TtC17MessageProtection27TetraMessageSignerFormatter *result;

  result = (_TtC17MessageProtection27TetraMessageSignerFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData), *(_QWORD *)&self->_signedData[OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData]);
}

@end
