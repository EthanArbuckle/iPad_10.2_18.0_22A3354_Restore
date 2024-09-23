@implementation STKImageGlyphViewConfiguration

- (double)keyboardWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_keyboardWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setKeyboardWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_keyboardWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isInPopover
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isInPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInPopover:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isInPopover;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)doesSupportImageGlyph
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportImageGlyph:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  *v4 = a3;
}

- (STKImageGlyphViewConfiguration)init
{
  STKImageGlyphViewConfiguration *result;

  result = (STKImageGlyphViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
