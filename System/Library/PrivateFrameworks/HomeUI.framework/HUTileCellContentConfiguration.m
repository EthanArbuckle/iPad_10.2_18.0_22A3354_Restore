@implementation HUTileCellContentConfiguration

- (BOOL)prefixHidden
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[32];
}

- (void)setPrefixHidden:(BOOL)a3
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[32] = a3;
}

- (BOOL)titleHidden
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[104];
}

- (void)setTitleHidden:(BOOL)a3
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[104] = a3;
}

- (BOOL)descriptionHidden
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[176];
}

- (void)setDescriptionHidden:(BOOL)a3
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[176] = a3;
}

- (HUTileCellContentConfiguration)init
{
  objc_super v4;

  sub_1B8F9B654((uint64_t)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for __TileCellContentConfiguration();
  return -[HUTileCellContentConfiguration init](&v4, sel_init);
}

- (id)updatedForItem:(id)a3
{
  id v4;
  HUTileCellContentConfiguration *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F9E44C(v4);

  return v6;
}

- (void).cxx_destruct
{
  _BYTE __dst[440];

  memcpy(__dst, (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration, sizeof(__dst));
  sub_1B8EA2FE8((uint64_t)__dst);
}

@end
