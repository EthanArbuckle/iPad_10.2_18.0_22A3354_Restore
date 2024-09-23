@implementation ResourceBundleContainer

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ResourceBundleContainer.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ResourceBundleContainer.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12ModelCatalog23ResourceBundleContainer *v5;

  v4 = a3;
  v5 = self;
  ResourceBundleContainer.encode(with:)((NSCoder)v4);

}

- (_TtC12ModelCatalog23ResourceBundleContainer)initWithCoder:(id)a3
{
  return (_TtC12ModelCatalog23ResourceBundleContainer *)ResourceBundleContainer.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_24207AA50(self, (uint64_t)a2, ResourceBundleContainer.description.getter);
}

- (_TtC12ModelCatalog23ResourceBundleContainer)init
{
  ResourceBundleContainer.init()();
}

- (void).cxx_destruct
{
  sub_24207ABB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12ModelCatalog23ResourceBundleContainer_resourceBundleData);
}

@end
