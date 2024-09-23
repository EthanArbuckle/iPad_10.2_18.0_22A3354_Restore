@implementation STKStickerSearchConfiguration

- (double)fontSize
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_fontSize);
  swift_beginAccess();
  return *v2;
}

- (void)setFontSize:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_fontSize);
  swift_beginAccess();
  *v4 = a3;
}

- (double)margin
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_margin);
  swift_beginAccess();
  return *v2;
}

- (void)setMargin:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_margin);
  swift_beginAccess();
  *v4 = a3;
}

- (double)spacing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_spacing);
  swift_beginAccess();
  return *v2;
}

- (void)setSpacing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_spacing);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)visible
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchConfiguration_visible;
  swift_beginAccess();
  return *v2;
}

- (void)setVisible:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchConfiguration_visible;
  swift_beginAccess();
  *v4 = a3;
}

- (STKStickerSearchConfiguration)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_fontSize) = (Class)0x4040000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_margin) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_spacing) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_visible) = 1;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[STKStickerSearchConfiguration init](&v5, sel_init);
}

@end
