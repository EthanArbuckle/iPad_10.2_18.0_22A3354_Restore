@implementation ARQLInlineTouch(ARQLInlineTouch_ASVTouch)

- (float64_t)location
{
  float64x2_t v1;
  float64_t v2;

  objc_msgSend(a1, "cgLocation");
  return pointToFloat2(v1, v2);
}

- (float64_t)previousLocation
{
  float64x2_t v1;
  float64_t v2;

  objc_msgSend(a1, "cgPreviousLocation");
  return pointToFloat2(v1, v2);
}

@end
