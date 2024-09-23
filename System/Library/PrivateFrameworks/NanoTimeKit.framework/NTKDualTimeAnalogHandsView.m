@implementation NTKDualTimeAnalogHandsView

- (id)hourHandConfiguration
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  -[CLKUIAnalogHandsView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  _LayoutConstants_47(v2, &v5);
  objc_msgSend(off_1E6BCA6C0, "defaultHourConfigurationForDevice:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandWidth:", *(double *)&v5);
  objc_msgSend(v3, "setHandLength:", *((double *)&v5 + 1));
  objc_msgSend(v3, "setPegRadius:", *(double *)&v6);
  objc_msgSend(v3, "setPegStrokeWidth:", *((double *)&v6 + 1));
  objc_msgSend(v3, "setArmWidth:", *(double *)&v7);
  objc_msgSend(v3, "setArmLength:", *((double *)&v7 + 1));
  objc_msgSend(v3, "setDropShadowRadius:", *(double *)&v8);
  objc_msgSend(v3, "setDropShadowOpacity:", *((double *)&v8 + 1));
  objc_msgSend(v3, "setRadialShadowRadius:", *(double *)&v9);
  objc_msgSend(v3, "setRadialShadowOpacity:", *((double *)&v9 + 1));
  objc_msgSend(v3, "setDirectionalShadowOffset:", v10);

  return v3;
}

- (id)createHourHandView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDualTimeAnalogHandsView;
  -[CLKUIAnalogHandsView createHourHandView](&v3, sel_createHourHandView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)minuteHandConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  memset(v7, 0, sizeof(v7));
  _LayoutConstants_47(v3, v7);
  -[CLKUIAnalogHandsView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E6BCA6C0, "defaultMinuteConfigurationForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHandWidth:", *(double *)&v8);
  objc_msgSend(v5, "setHandLength:", *((double *)&v8 + 1));
  objc_msgSend(v5, "setPegRadius:", *(double *)&v9);
  objc_msgSend(v5, "setPegStrokeWidth:", *((double *)&v9 + 1));
  objc_msgSend(v5, "setArmWidth:", *(double *)&v10);
  objc_msgSend(v5, "setArmLength:", *((double *)&v10 + 1));
  objc_msgSend(v5, "setDropShadowRadius:", *(double *)&v11);
  objc_msgSend(v5, "setDropShadowOpacity:", *((double *)&v11 + 1));
  objc_msgSend(v5, "setRadialShadowRadius:", *(double *)&v12);
  objc_msgSend(v5, "setRadialShadowOpacity:", *((double *)&v12 + 1));
  objc_msgSend(v5, "setDirectionalShadowOffset:", v13);

  return v5;
}

- (id)createMinuteHandView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDualTimeAnalogHandsView;
  -[CLKUIAnalogHandsView createMinuteHandView](&v3, sel_createMinuteHandView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)secondHandConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v7[12];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;

  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  memset(v7, 0, sizeof(v7));
  _LayoutConstants_47(v3, v7);
  -[CLKUIAnalogHandsView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E6BCA6C0, "defaultSecondConfigurationForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHandWidth:", *(double *)&v8);
  objc_msgSend(v5, "setHandLength:", *((double *)&v8 + 1));
  objc_msgSend(v5, "setPegRadius:", *(double *)&v9);
  objc_msgSend(v5, "setPegStrokeWidth:", *((double *)&v9 + 1));
  objc_msgSend(v5, "setTailLength:", *(double *)&v10);
  objc_msgSend(v5, "setDropShadowRadius:", *((double *)&v10 + 1));
  objc_msgSend(v5, "setDropShadowOpacity:", *(double *)&v11);
  objc_msgSend(v5, "setRadialShadowRadius:", *((double *)&v11 + 1));
  objc_msgSend(v5, "setRadialShadowOpacity:", *(double *)&v12);
  objc_msgSend(v5, "setDirectionalShadowOffset:", *((double *)&v12 + 1), v13);

  return v5;
}

@end
