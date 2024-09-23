@implementation TetraVersions

+ (BOOL)isWireCompatibleWith:(unsigned int)a3
{
  return a3 - 13 < 0x13;
}

+ (unsigned)currentTetraVersion
{
  return 13;
}

- (_TtC17MessageProtection13TetraVersions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraVersions();
  return -[TetraVersions init](&v3, sel_init);
}

@end
