@implementation MapsSyncMutableAnonymousCredential

- (_TtC8MapsSync34MapsSyncMutableAnonymousCredential)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedAnonymousCredential();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSData)anonymousId
{
  return (NSData *)sub_1A41FBD9C((char *)self, (uint64_t)a2, (SEL *)&selRef_anonymousId);
}

- (void)setAnonymousId:(id)a3
{
  sub_1A41FBEB4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setAnonymousId_);
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A41FBD9C((char *)self, (uint64_t)a2, (SEL *)&selRef_mapsToken);
}

- (void)setMapsToken:(id)a3
{
  sub_1A41FBEB4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setMapsToken_);
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8MapsSync34MapsSyncMutableAnonymousCredential *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject);
  v10 = self;
  v11 = objc_msgSend(v9, sel_mapsTokenCreatedAt);
  if (v11)
  {
    v12 = v11;
    sub_1A423BF84();

    v13 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    v13 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A40F1F64((uint64_t)v6, (uint64_t)v8);

  sub_1A423BF9C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setMapsTokenCreatedAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8MapsSync34MapsSyncMutableAnonymousCredential *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BF84();
    v8 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A41FC47C((uint64_t)v7);

}

- (unint64_t)mapsTokenTTL
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenTTL);
}

- (void)setMapsTokenTTL:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_setMapsTokenTTL_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject));
}

@end
