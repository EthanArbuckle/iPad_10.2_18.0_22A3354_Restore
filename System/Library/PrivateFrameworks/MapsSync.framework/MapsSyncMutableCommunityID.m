@implementation MapsSyncMutableCommunityID

- (_TtC8MapsSync26MapsSyncMutableCommunityID)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCommunityID();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)communityIdentifier
{
  void *v2;
  _TtC8MapsSync26MapsSyncMutableCommunityID *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
  v3 = self;
  v4 = objc_msgSend(v2, sel_communityIdentifier);
  if (v4)
  {
    v5 = v4;
    sub_1A423C14C();

    v6 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setCommunityIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync26MapsSyncMutableCommunityID *v6;
  id v7;
  id v8;
  _TtC8MapsSync26MapsSyncMutableCommunityID *v9;
  id v10;
  id v11;

  if (!a3)
  {
    v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
    goto LABEL_5;
  }
  sub_1A423C14C();
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
  if (!v5)
  {
LABEL_5:
    v9 = self;
    v7 = v4;
    v8 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = v4;
  v10 = (id)sub_1A423C140();
  swift_bridgeObjectRelease();
  v8 = v10;
LABEL_6:
  v11 = v8;
  objc_msgSend(v7, sel_setCommunityIdentifier_);

}

- (BOOL)expired
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_expired);
}

- (void)setExpired:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_setExpired_, a3);
}

- (int64_t)usedCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_usedCount);
}

- (void)setUsedCount:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_setUsedCount_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject));
}

@end
