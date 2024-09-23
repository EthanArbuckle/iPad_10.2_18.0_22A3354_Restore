@implementation PHHandsetDialerNumberPadButton

+ (double)verticalPadding
{
  double v3;
  double v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  if (+[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
        v6 = objc_msgSend(v5, "hasCurrentAudioCalls"),
        v5,
        v4 = 3.5,
        (v6 & 1) == 0)
    && !+[PHUIConfiguration requiresSmallScreenConfig](PHUIConfiguration, "requiresSmallScreenConfig"))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___PHHandsetDialerNumberPadButton;
    objc_msgSendSuper2(&v8, "verticalPadding");
    return v3;
  }
  return v4;
}

+ (double)outerCircleDiameter
{
  double v2;
  double v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PHHandsetDialerNumberPadButton;
  objc_msgSendSuper2(&v6, "outerCircleDiameter");
  v3 = v2;
  if (+[PHUIConfiguration requiresSmallScreenConfig](PHUIConfiguration, "requiresSmallScreenConfig"))
    return 67.0;
  if (+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities"))
  {
    v4 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    if (v4 == 2)
    {
      return 73.0;
    }
    else if (!v4)
    {
      return 70.0;
    }
  }
  return v3;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

+ (BOOL)usesButtonSaturationFilters
{
  return 0;
}

@end
