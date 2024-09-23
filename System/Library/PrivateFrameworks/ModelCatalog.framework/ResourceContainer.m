@implementation ResourceContainer

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ResourceContainer.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ResourceContainer.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12ModelCatalog17ResourceContainer *v5;

  v4 = a3;
  v5 = self;
  ResourceContainer.encode(with:)((NSCoder)v4);

}

- (_TtC12ModelCatalog17ResourceContainer)initWithCoder:(id)a3
{
  return (_TtC12ModelCatalog17ResourceContainer *)ResourceContainer.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_24207AA50(self, (uint64_t)a2, ResourceContainer.description.getter);
}

- (_TtC12ModelCatalog17ResourceContainer)init
{
  ResourceContainer.init()();
}

- (void).cxx_destruct
{
  sub_24207ABB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12ModelCatalog17ResourceContainer_resourceData);
}

@end
