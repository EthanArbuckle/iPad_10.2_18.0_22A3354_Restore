@implementation ARUIMetricColors

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDisplayColor, 0);
  objc_storeStrong((id *)&self->_highContrastTextColor, 0);
  objc_storeStrong((id *)&self->_workoutRingColorIdentifier, 0);
  objc_storeStrong((id *)&self->_platterInactiveBackgroundColor, 0);
  objc_storeStrong((id *)&self->_platterBackgroundColor, 0);
  objc_storeStrong((id *)&self->_valueDisplayColor, 0);
  objc_storeStrong((id *)&self->_buttonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_lightenedNonGradientColor, 0);
  objc_storeStrong((id *)&self->_nonGradientTextColor, 0);
  objc_storeStrong((id *)&self->_adjustmentButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gradientContrastColor, 0);
  objc_storeStrong((id *)&self->_gradientDarkColor, 0);
  objc_storeStrong((id *)&self->_gradientLightColor, 0);
}

+ (id)paceColors
{
  id v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.980392157, 0.815686275, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.274509804, 0.380392157, 0.549019608, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientContrastColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.729411765, 0.882352941, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.22745098, 0.91372549, 0.901960784, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v6);

  objc_msgSend(v2, "nonGradientTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.300000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v8);

  objc_msgSend(v2, "nonGradientTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.300000012);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlatterBackgroundColor:", v10);

  objc_msgSend(v2, "nonGradientTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 0.219999999);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlatterInactiveBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v13);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.541176471, 1.0, 0.984313725, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v14);

  objc_msgSend(v2, "nonGradientTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v19 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __ARUIColorForCurrentContrastMode_block_invoke;
  v27 = &unk_24CEC62C0;
  v28 = v18;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = (void *)objc_msgSend(v19, "initWithDynamicProvider:", &v24);

  objc_msgSend(v2, "setTextDisplayColor:", v22, v24, v25, v26, v27);
  return v2;
}

+ (id)keyColors
{
  id v2;
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
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.717647059, 1.0, 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.215686275, 0.862745098, 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0666666667, 0.470588235, 0.392156863, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientContrastColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.650980392, 1.0, 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v6);

  objc_msgSend(v2, "nonGradientTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.300000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonDisabledTextColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.792156863, 1.0, 0.403921569, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v12);

  objc_msgSend(v2, "nonGradientTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  v17 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __ARUIColorForCurrentContrastMode_block_invoke;
  v25 = &unk_24CEC62C0;
  v26 = v16;
  v27 = v15;
  v18 = v16;
  v19 = v15;
  v20 = (void *)objc_msgSend(v17, "initWithDynamicProvider:", &v22);

  objc_msgSend(v2, "setTextDisplayColor:", v20, v22, v23, v24, v25);
  return v2;
}

+ (id)energyColors
{
  id v2;
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
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.196078431, 0.529411765, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.882352941, 0.0, 0.0784313725, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.274509804, 0.0, 0.690196078, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientContrastColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.980392157, 0.0666666667, 0.309803922, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v6);

  objc_msgSend(v2, "nonGradientTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.300000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.2, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonDisabledTextColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v11);

  objc_msgSend(v2, "setWorkoutRingColorIdentifier:", CFSTR("calorieWorkout"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.392156863, 0.509803922, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v12);

  objc_msgSend(v2, "nonGradientTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  v17 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __ARUIColorForCurrentContrastMode_block_invoke;
  v25 = &unk_24CEC62C0;
  v26 = v16;
  v27 = v15;
  v18 = v16;
  v19 = v15;
  v20 = (void *)objc_msgSend(v17, "initWithDynamicProvider:", &v22);

  objc_msgSend(v2, "setTextDisplayColor:", v20, v22, v23, v24, v25);
  return v2;
}

- (UIColor)nonGradientTextColor
{
  return self->_nonGradientTextColor;
}

- (void)setValueDisplayColor:(id)a3
{
  objc_storeStrong((id *)&self->_valueDisplayColor, a3);
}

- (void)setNonGradientTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonGradientTextColor, a3);
}

- (void)setGradientLightColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLightColor, a3);
}

- (void)setGradientDarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientDarkColor, a3);
}

- (void)setGradientContrastColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientContrastColor, a3);
}

- (void)setAdjustmentButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentButtonBackgroundColor, a3);
}

- (void)setButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextColor, a3);
}

- (void)setButtonDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonDisabledTextColor, a3);
}

- (void)setWorkoutRingColorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRingColorIdentifier, a3);
}

- (void)setPlatterInactiveBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterInactiveBackgroundColor, a3);
}

- (void)setPlatterBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterBackgroundColor, a3);
}

- (UIColor)gradientLightColor
{
  return self->_gradientLightColor;
}

- (UIColor)gradientDarkColor
{
  return self->_gradientDarkColor;
}

+ (id)systemGrayTextColor
{
  if (systemGrayTextColor_onceToken != -1)
    dispatch_once(&systemGrayTextColor_onceToken, &__block_literal_global_3);
  return (id)systemGrayTextColor_systemGrayTextColor;
}

void __39__ARUIMetricColors_systemGrayTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.682352941, 0.705882353, 0.749019608, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemGrayTextColor_systemGrayTextColor;
  systemGrayTextColor_systemGrayTextColor = v0;

}

+ (CGGradient)newGradientForStartColor:(id)a3 endColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFArray *v9;
  CGColorSpace *DeviceRGB;
  CGGradient *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v13[0] = objc_msgSend(v5, "CGColor");
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "CGColor");

  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGGradientCreateWithColors(DeviceRGB, v9, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v11;
}

+ (id)distanceColors
{
  id v2;
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
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.815686275, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.666666667, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.717647059, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(v2, "nonGradientTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.300000012);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonTextColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.2, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonDisabledTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v10);

  objc_msgSend(v2, "setWorkoutRingColorIdentifier:", CFSTR("distanceWorkout"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.329411765, 0.82745098, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v11);

  objc_msgSend(v2, "nonGradientTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v13;
  v16 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __ARUIColorForCurrentContrastMode_block_invoke;
  v24 = &unk_24CEC62C0;
  v25 = v15;
  v26 = v14;
  v17 = v15;
  v18 = v14;
  v19 = (void *)objc_msgSend(v16, "initWithDynamicProvider:", &v21);

  objc_msgSend(v2, "setTextDisplayColor:", v19, v21, v22, v23, v24);
  return v2;
}

+ (id)noMetricColors
{
  void *v2;

  objc_msgSend(a1, "keyColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWorkoutRingColorIdentifier:", CFSTR("openWorkout"));
  return v2;
}

+ (id)elapsedTimeColors
{
  id v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.917647059, 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.764705882, 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.901960784, 0.125490196, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(v2, "nonGradientTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.300000012);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v7);

  objc_msgSend(v2, "adjustmentButtonBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_colorBlendedWithColor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setLightenedNonGradientColor:", v10);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonTextColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonDisabledTextColor:", v12);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v13);

  objc_msgSend(v2, "setWorkoutRingColorIdentifier:", CFSTR("timedWorkout"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.941176471, 0.478431373, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v14);

  objc_msgSend(v2, "nonGradientTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v19 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __ARUIColorForCurrentContrastMode_block_invoke;
  v27 = &unk_24CEC62C0;
  v28 = v18;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = (void *)objc_msgSend(v19, "initWithDynamicProvider:", &v24);

  objc_msgSend(v2, "setTextDisplayColor:", v22, v24, v25, v26, v27);
  return v2;
}

+ (id)heartRateColors
{
  id v2;
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
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.262745098, 0.196078431, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.901960784, 0.129411765, 0.0901960784, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.219607843, 0.0980392157, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.941176471, 0.556862745, 0.482352941, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLightenedNonGradientColor:", v6);

  objc_msgSend(v2, "nonGradientTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.300000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.431372549, 0.298039216, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighContrastTextColor:", v10);

  objc_msgSend(v2, "nonGradientTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highContrastTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  v15 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __ARUIColorForCurrentContrastMode_block_invoke;
  v23 = &unk_24CEC62C0;
  v24 = v14;
  v25 = v13;
  v16 = v14;
  v17 = v13;
  v18 = (void *)objc_msgSend(v15, "initWithDynamicProvider:", &v20);

  objc_msgSend(v2, "setTextDisplayColor:", v18, v20, v21, v22, v23);
  return v2;
}

+ (id)clockColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v7);

  return v2;
}

+ (id)diveColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.211764706, 0.28627451, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.129411765, 0.133333333, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.717647059, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(v2, "nonGradientTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.300000012);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v8);

  return v2;
}

+ (id)grayColors
{
  return +[ARUIMetricColors pausedRingsColors](ARUIMetricColors, "pausedRingsColors");
}

+ (id)pausedRingsColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientLightColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGradientDarkColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNonGradientTextColor:", v5);

  objc_msgSend(v2, "nonGradientTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustmentButtonBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueDisplayColor:", v8);

  return v2;
}

- (UIColor)gradientContrastColor
{
  return self->_gradientContrastColor;
}

- (UIColor)adjustmentButtonBackgroundColor
{
  return self->_adjustmentButtonBackgroundColor;
}

- (UIColor)lightenedNonGradientColor
{
  return self->_lightenedNonGradientColor;
}

- (void)setLightenedNonGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_lightenedNonGradientColor, a3);
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (UIColor)buttonDisabledTextColor
{
  return self->_buttonDisabledTextColor;
}

- (UIColor)valueDisplayColor
{
  return self->_valueDisplayColor;
}

- (UIColor)platterBackgroundColor
{
  return self->_platterBackgroundColor;
}

- (UIColor)platterInactiveBackgroundColor
{
  return self->_platterInactiveBackgroundColor;
}

- (NSString)workoutRingColorIdentifier
{
  return self->_workoutRingColorIdentifier;
}

- (UIColor)highContrastTextColor
{
  return self->_highContrastTextColor;
}

- (void)setHighContrastTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highContrastTextColor, a3);
}

- (UIColor)textDisplayColor
{
  return self->_textDisplayColor;
}

- (void)setTextDisplayColor:(id)a3
{
  objc_storeStrong((id *)&self->_textDisplayColor, a3);
}

@end
