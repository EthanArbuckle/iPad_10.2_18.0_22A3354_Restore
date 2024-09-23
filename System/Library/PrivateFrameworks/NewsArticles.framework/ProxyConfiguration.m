@implementation ProxyConfiguration

- (BOOL)usePrivateRelay
{
  _TtC12NewsArticles18ProxyConfiguration *v2;
  char v3;

  v2 = self;
  v3 = ProxyConfiguration.usePrivateRelay.getter();

  return v3 & 1;
}

- (NSString)proxyAutoConfigScript
{
  _TtC12NewsArticles18ProxyConfiguration *v2;
  void *v3;

  v2 = self;
  ProxyConfiguration.proxyAutoConfigScript.getter();

  v3 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)proxyHost
{
  _TtC12NewsArticles18ProxyConfiguration *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  ProxyConfiguration.proxyHost.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BA0BE81C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC12NewsArticles18ProxyConfiguration)init
{
  _TtC12NewsArticles18ProxyConfiguration *result;

  result = (_TtC12NewsArticles18ProxyConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles18ProxyConfiguration_embedProxyConfiguration));
}

@end
