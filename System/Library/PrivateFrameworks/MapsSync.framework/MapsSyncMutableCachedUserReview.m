@implementation MapsSyncMutableCachedUserReview

- (_TtC8MapsSync31MapsSyncMutableCachedUserReview)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCachedUserReview();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_setMuid_, a3);
}

- (int)numberPhotosUploaded
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_numberPhotosUploaded);
}

- (void)setNumberPhotosUploaded:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_setNumberPhotosUploaded_, *(_QWORD *)&a3);
}

- (signed)rating
{
  _TtC8MapsSync31MapsSyncMutableCachedUserReview *v2;
  signed __int16 v3;

  v2 = self;
  v3 = sub_1A4114600();

  return v3;
}

- (void)setRating:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_setRating_, a3);
}

- (void).cxx_destruct
{

}

@end
