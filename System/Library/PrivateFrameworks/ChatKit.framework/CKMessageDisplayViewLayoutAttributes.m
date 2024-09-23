@implementation CKMessageDisplayViewLayoutAttributes

- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)initWithSize:(CGSize)a3 wantsFrameClamping:(BOOL)a4
{
  objc_super v5;

  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CKMessageDisplayViewLayoutAttributes();
  return -[CKMessageDisplayViewLayoutAttributes init](&v5, sel_init);
}

- (CGSize)size
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (BOOL)wantsFrameClamping
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsFrameClamping:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)init
{
  _TtC7ChatKit36CKMessageDisplayViewLayoutAttributes *result;

  result = (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
