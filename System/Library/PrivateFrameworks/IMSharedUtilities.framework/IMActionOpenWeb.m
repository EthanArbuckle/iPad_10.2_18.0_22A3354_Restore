@implementation IMActionOpenWeb

- (int64_t)mode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMActionOpenWeb_mode);
}

- (NSString)url
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)parameters
{
  return (NSString *)sub_19E325D9C();
}

- (IMActionOpenWeb)initWithMode:(int64_t)a3 url:(id)a4 parameters:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  objc_super v15;

  v7 = sub_19E36F888();
  v9 = v8;
  v10 = sub_19E36F888();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionOpenWeb_mode) = (Class)a3;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionOpenWeb_url);
  *v11 = v7;
  v11[1] = v9;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionOpenWeb_parameters);
  *v12 = v10;
  v12[1] = v13;
  v15.receiver = self;
  v15.super_class = (Class)IMActionOpenWeb;
  return -[IMActionOpenWeb init](&v15, sel_init);
}

- (IMActionOpenWeb)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionOpenWeb *)IMActionOpenWeb.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionOpenWeb *v2;
  void *v3;

  v2 = self;
  sub_19E3467A4();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionOpenWeb)init
{
  IMActionOpenWeb *result;

  result = (IMActionOpenWeb *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
