@implementation MathPresentation._LayoutContext

- (double)baseFontSize
{
  return sub_241192E08();
}

- (NSString)baseFontName
{
  uint64_t v2;
  void *v3;

  sub_241192E5C();
  if (v2)
  {
    v3 = (void *)sub_24120DFA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (CGSize)targetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_241192EAC();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)containerSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_241192EF0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGColor)baseFontColor
{
  id v2;

  sub_241192F34();
  return (CGColor *)v2;
}

- (_TtCV15MathTypesetting16MathPresentation14_LayoutContext)init
{
  sub_241192F60();
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(id *)&self->context[OBJC_IVAR____TtCV15MathTypesetting16MathPresentation14_LayoutContext_context + 64];
  swift_bridgeObjectRelease();

}

@end
