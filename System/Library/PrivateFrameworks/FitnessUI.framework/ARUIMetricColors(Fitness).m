@implementation ARUIMetricColors(Fitness)

+ (id)metricColorsForGoalTypeIdentifier:()Fitness
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "noMetricColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "distanceColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "elapsedTimeColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "energyColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)metricColorsForMetricType:()Fitness
{
  void *v3;

  switch(a3)
  {
    case 1:
      objc_msgSend(a1, "distanceColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 7:
      objc_msgSend(a1, "energyColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "elapsedTimeColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
    case 8:
    case 14:
      objc_msgSend(a1, "paceColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "heartRateColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(a1, "clockColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      objc_msgSend(a1, "lapsColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
    case 17:
      objc_msgSend(a1, "elevationColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
    case 12:
      objc_msgSend(a1, "powerColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      objc_msgSend(a1, "flightsClimbedColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
    case 16:
      objc_msgSend(a1, "cadenceColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
    case 34:
      objc_msgSend(a1, "splitsColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(a1, "keyColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)lapsColors
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = objc_alloc_init(a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientLightColor:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientDarkColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNonGradientTextColor:", v4);

  objc_msgSend(v1, "nonGradientTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.300000012);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAdjustmentButtonBackgroundColor:", v6);

  objc_msgSend(v1, "adjustmentButtonBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_colorBlendedWithColor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "setLightenedNonGradientColor:", v9);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonTextColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.2, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonDisabledTextColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValueDisplayColor:", v12);

  objc_msgSend(v1, "setWorkoutRingColorIdentifier:", CFSTR("lapsWorkout"));
  return v1;
}

+ (id)lapColors
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = objc_alloc_init(a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNonGradientTextColor:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientDarkColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientLightColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.635294118, 0.545098039, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAdjustmentButtonBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValueDisplayColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonTextColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonDisabledTextColor:", v8);

  return v1;
}

+ (id)elevationColors
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = objc_alloc_init(a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.505882353, 1.0, 0.368627451, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNonGradientTextColor:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.505882353, 1.0, 0.368627451, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientDarkColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.505882353, 1.0, 0.368627451, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientLightColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.505882353, 1.0, 0.368627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAdjustmentButtonBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValueDisplayColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonTextColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setButtonDisabledTextColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.592156863, 1.0, 0.478431373, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighContrastTextColor:", v9);

  objc_msgSend(v1, "nonGradientTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "highContrastTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIColorForCurrentContrastMode(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTextDisplayColor:", v12);

  return v1;
}

+ (id)deepBreathingColors
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = objc_alloc_init(a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.192156863, 0.639215686, 0.701960784, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientLightColor:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.352941176, 0.956862745, 0.705882353, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGradientDarkColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.517647059, 0.956862745, 0.925490196, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNonGradientTextColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAdjustmentButtonBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValueDisplayColor:", v6);

  return v1;
}

+ (id)splitsColors
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = objc_alloc_init(a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.466666667, 0.533333333, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNonGradientTextColor:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.466666667, 0.533333333, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValueDisplayColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.639215686, 0.68627451, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighContrastTextColor:", v4);

  objc_msgSend(v1, "nonGradientTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "highContrastTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIColorForCurrentContrastMode(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTextDisplayColor:", v7);

  return v1;
}

+ (id)metricColorsForGoal:()Fitness
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "goalTypeIdentifier") == 2
    && (objc_msgSend(v4, "requiredDistance"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(a1, "paceColors");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "metricColorsForGoalTypeIdentifier:", objc_msgSend(v4, "goalTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

@end
