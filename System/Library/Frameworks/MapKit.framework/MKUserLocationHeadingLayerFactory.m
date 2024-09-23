@implementation MKUserLocationHeadingLayerFactory

+ (id)headingLayerWithStyle:(int64_t)a3 userLocationView:(id)a4 shouldMatchAccuracyRadius:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  MKUserLocationHeadingArrowLayer *v8;
  MKUserLocationHeadingArrowLayer *v9;

  v5 = a5;
  v7 = a4;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v8 = -[MKUserLocationHeadingArrowLayer initWithUserLocationView:]([MKUserLocationHeadingArrowLayer alloc], "initWithUserLocationView:", v7);
      goto LABEL_6;
    }
    if (a3)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  v8 = -[MKUserLocationHeadingConeLayer initWithUserLocationView:shouldMatchAccuracyRadius:minimumPresentationAngle:]([MKUserLocationHeadingConeLayer alloc], "initWithUserLocationView:shouldMatchAccuracyRadius:minimumPresentationAngle:", v7, v5, 40.0);
LABEL_6:
  v9 = v8;
LABEL_8:

  return v9;
}

@end
