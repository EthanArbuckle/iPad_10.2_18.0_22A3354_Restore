@implementation _EXDomainAttribute

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXDomainAttribute *v5;

  v4 = a3;
  v5 = self;
  sub_190C2EB84(v4);

}

- (_EXDomainAttribute)initWithCoder:(id)a3
{
  return (_EXDomainAttribute *)sub_190C30AF4(a3);
}

+ (BOOL)supportsSecureCoding
{
  return byte_1EE20BEE0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EE20BEE0 = a3;
}

- (_EXDomainAttribute)init
{
  _EXDomainAttribute *result;

  result = (_EXDomainAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
