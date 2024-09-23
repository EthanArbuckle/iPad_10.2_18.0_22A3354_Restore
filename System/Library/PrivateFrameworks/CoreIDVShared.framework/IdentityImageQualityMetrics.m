@implementation IdentityImageQualityMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared27IdentityImageQualityMetrics)init
{
  return (_TtC13CoreIDVShared27IdentityImageQualityMetrics *)IdentityImageQualityMetrics.init()();
}

- (_TtC13CoreIDVShared27IdentityImageQualityMetrics)initWithCoder:(id)a3
{
  return (_TtC13CoreIDVShared27IdentityImageQualityMetrics *)IdentityImageQualityMetrics.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared27IdentityImageQualityMetrics *v5;

  v4 = a3;
  v5 = self;
  IdentityImageQualityMetrics.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
