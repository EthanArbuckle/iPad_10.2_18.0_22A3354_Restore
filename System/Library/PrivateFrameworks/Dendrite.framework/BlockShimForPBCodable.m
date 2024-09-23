@implementation BlockShimForPBCodable

- (_TtC8Dendrite21BlockShimForPBCodable)initWithCoder:(id)a3
{
  id v4;
  _TtC8Dendrite21BlockShimForPBCodable *result;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error) = 0;
  v4 = a3;

  result = (_TtC8Dendrite21BlockShimForPBCodable *)sub_23A362E68();
  __break(1u);
  return result;
}

- (void)writeTo:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC8Dendrite21BlockShimForPBCodable *v6;

  v4 = *(void (**)(void))((char *)&self->super.super.isa + OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtC8Dendrite21BlockShimForPBCodable)init
{
  _TtC8Dendrite21BlockShimForPBCodable *result;

  result = (_TtC8Dendrite21BlockShimForPBCodable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Dendrite21BlockShimForPBCodable)initWithData:(id)a3
{
  id v3;
  _TtC8Dendrite21BlockShimForPBCodable *result;

  if (a3)
  {
    v3 = a3;
    sub_23A362A90();

  }
  result = (_TtC8Dendrite21BlockShimForPBCodable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
