@implementation CLKUIHandsView

- (CLKUIHandsView)initWithDiameter:(double)a3 forDevice:(id)a4
{
  CLKUIHandsView *v5;
  CLKUIHandsView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  v5 = -[CLKUIAnalogHandsView initForDevice:](&v8, sel_initForDevice_, a4);
  v6 = v5;
  if (v5)
  {
    -[CLKUIHandsView setFrame:](v5, "setFrame:", 0.0, 0.0, a3, a3);
    -[CLKUIAnalogHandsView setMinuteHandDotDiameter:](v6, "setMinuteHandDotDiameter:", 1.0);
  }
  return v6;
}

- (id)hourHandConfiguration
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;

  v16 = 0.0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_2(v3, (uint64_t)&v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  -[CLKUIAnalogHandsView hourHandConfiguration](&v8, sel_hourHandConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)&v9;
  v6 = *((double *)&v10 + 1);
  objc_msgSend(v4, "setHandLength:", *((double *)&v11 + 1));
  objc_msgSend(v4, "setHandWidth:", v5);
  objc_msgSend(v4, "setArmLength:", *(double *)&v10);
  objc_msgSend(v4, "setArmWidth:", *((double *)&v9 + 1));
  objc_msgSend(v4, "setSmoothingRadius:", 0.5);
  objc_msgSend(v4, "setPegRadius:", v6 * 0.5);
  objc_msgSend(v4, "setPegStrokeWidth:", (v5 - v6) * 0.5);
  objc_msgSend(v4, "setRadialShadowRadius:", *(double *)&v11);
  objc_msgSend(v4, "setRadialShadowOpacity:", *((double *)&v15 + 1));
  objc_msgSend(v4, "setInlayInsetRadius:", v16);
  return v4;
}

- (id)minuteHandConfiguration
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;

  v16 = 0.0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_2(v3, (uint64_t)&v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  -[CLKUIAnalogHandsView minuteHandConfiguration](&v8, sel_minuteHandConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)&v9;
  v6 = *((double *)&v10 + 1);
  objc_msgSend(v4, "setHandLength:", *(double *)&v12);
  objc_msgSend(v4, "setHandWidth:", v5);
  objc_msgSend(v4, "setArmLength:", *(double *)&v10);
  objc_msgSend(v4, "setArmWidth:", *((double *)&v9 + 1));
  objc_msgSend(v4, "setSmoothingRadius:", 0.5);
  objc_msgSend(v4, "setPegRadius:", v6 * 0.5);
  objc_msgSend(v4, "setPegStrokeWidth:", (v5 - v6) * 0.5);
  objc_msgSend(v4, "setRadialShadowRadius:", *(double *)&v11);
  objc_msgSend(v4, "setRadialShadowOpacity:", *((double *)&v15 + 1));
  objc_msgSend(v4, "setInlayInsetRadius:", v16);
  return v4;
}

- (id)secondHandConfiguration
{
  void *v3;
  void *v4;
  __int128 v5;
  double v6;
  objc_super v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_2(v3, (uint64_t)v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  -[CLKUIAnalogHandsView secondHandConfiguration](&v8, sel_secondHandConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(double *)&v12 * 0.5;
  objc_msgSend(v4, "setHandLength:", *(double *)&v12 * 0.5 + *((double *)&v10 + 1));
  objc_msgSend(v4, "setHandWidth:", *((double *)&v11 + 1));
  objc_msgSend(v4, "setTailLength:", v6 + *(double *)&v11);
  objc_msgSend(v4, "setPegRadius:", *((double *)&v5 + 1) * 0.5);
  objc_msgSend(v4, "setPegStrokeWidth:", (*(double *)&v5 - *((double *)&v5 + 1)) * 0.5);
  return v4;
}

- (void)setOverrideDate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    -[CLKUIAnalogHandsView _stopTimeAnimation](self, "_stopTimeAnimation");
    objc_storeStrong((id *)&self->_overrideDate, a3);
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      -[CLKUIAnalogHandsView displayTime](self, "displayTime");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[CLKUIAnalogHandsView calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CLKHourMinuteSecondAnglesForTime();

    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setZRotation:", 0.0);

    if (!v5)
      -[CLKUIAnalogHandsView _startNewTimeAnimation](self, "_startNewTimeAnimation");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end
