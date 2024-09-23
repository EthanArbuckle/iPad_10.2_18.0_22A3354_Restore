@implementation PHInCallNumberPadButton

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHInCallNumberPadButton;
  v4 = -[PHInCallNumberPadButton initForCharacter:style:](&v9, "initForCharacter:style:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

  }
  return v5;
}

+ (double)outerCircleDiameter
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double result;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v4 = objc_msgSend(v3, "isDialPadEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    if (v7 >= v9)
      v10 = v9;
    else
      v10 = v7;
    v11 = v10 * 0.1976;
    return roundf(v11);
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___PHInCallNumberPadButton;
    objc_msgSendSuper2(&v13, "outerCircleDiameter");
  }
  return result;
}

+ (double)horizontalPadding
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  objc_super v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v4 = objc_msgSend(v3, "isDialPadEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    if (v7 >= v9)
      v10 = v9;
    else
      v10 = v7;
    v11 = v10 + v10 * -0.102 * 2.0;
    objc_msgSend(a1, "outerCircleDiameter");
    return (v11 + v12 * -3.0) * 0.25;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___PHInCallNumberPadButton;
    objc_msgSendSuper2(&v14, "horizontalPadding");
  }
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

+ (double)unhighlightedCircleViewAlpha
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (objc_msgSend(v2, "isButtonLayoutEnabled"))
    v3 = 0.0;
  else
    v3 = 0.100000001;

  return v3;
}

+ (BOOL)usesButtonColorMatrixFilters
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  return v3;
}

+ (BOOL)usesEmergencyCallButtonColorMatrixFilters
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (objc_msgSend(v2, "isEnhancedEmergencyEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostCall"));
    v5 = objc_msgSend(v4, "isEmergency");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
