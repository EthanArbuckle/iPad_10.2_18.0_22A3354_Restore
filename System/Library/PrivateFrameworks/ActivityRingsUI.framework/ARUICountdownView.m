@implementation ARUICountdownView

- (id)ringGroup
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[ARUIRingsView ringGroups](self, "ringGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v8.receiver = self;
    v8.super_class = (Class)ARUICountdownView;
    -[ARUIRingsView ringGroup](&v8, sel_ringGroup);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ARUIRingsView ringGroups](self, "ringGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)backingTrackRingGroup
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[ARUIRingsView ringGroups](self, "ringGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    -[ARUIRingsView ringGroups](self, "ringGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)countdownViewConfiguredForWatch
{
  void *v2;
  ARUIRenderer *v3;
  ARUIRingGroupController *v4;
  double v5;
  double v6;
  ARUICountdownView *v7;

  +[ARUIRingGroup countdownRingGroup](ARUIRingGroup, "countdownRingGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ARUIRenderer initWithRenderStyle:]([ARUIRenderer alloc], "initWithRenderStyle:", 1);
  v4 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v2);
  LODWORD(v5) = 1122238464;
  -[ARUIRingGroupController setRingDiameter:](v4, "setRingDiameter:", v5);
  LODWORD(v6) = 9.5;
  -[ARUIRingGroupController setRingThickness:](v4, "setRingThickness:", v6);
  -[ARUIRingGroupController setPercentage:ofRingAtIndex:animated:](v4, "setPercentage:ofRingAtIndex:animated:", 0, 0, 0.0);
  v7 = -[ARUIRingsView initWithRingGroupController:renderer:]([ARUICountdownView alloc], "initWithRingGroupController:renderer:", v4, v3);

  return v7;
}

+ (id)countdownViewConfiguredForCompanion
{
  void *v2;
  ARUIRingGroupController *v3;
  void *v4;
  ARUIRingGroupController *v5;
  ARUIRenderer *v6;
  ARUICountdownView *v7;
  void *v8;
  ARUICountdownView *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  +[ARUIRingGroup countdownRingGroup](ARUIRingGroup, "countdownRingGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v2);
  +[ARUIRingGroup countdownRingGroup](ARUIRingGroup, "countdownRingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v4);
  v6 = -[ARUIRenderer initWithRenderStyle:]([ARUIRenderer alloc], "initWithRenderStyle:", 1);
  v7 = [ARUICountdownView alloc];
  v11[0] = v5;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARUIRingsView initWithRingGroupControllers:renderer:](v7, "initWithRingGroupControllers:renderer:", v8, v6);

  return v9;
}

+ (id)countdownViewConfiguredForDisplayWithRingDiameter:(float)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  ARUIRingGroupController *v20;
  ARUIRingGroupController *v21;
  ARUIRenderer *v22;
  ARUICountdownView *v23;
  void *v24;
  ARUICountdownView *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x24BDAC8D0];
  +[ARUIRingGroup countdownRingGroup](ARUIRingGroup, "countdownRingGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  +[ARUIRingGroup countdownRingGroup](ARUIRingGroup, "countdownRingGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v4;
  v34[0] = v4;
  v34[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        *(float *)&v10 = a3;
        objc_msgSend(v14, "setGroupDiameter:", v10);
        LODWORD(v15) = 7.0;
        objc_msgSend(v14, "setThickness:", v15);
        LODWORD(v16) = 0;
        objc_msgSend(v14, "setPercentage:ofRingAtIndex:", 0, v16);
        objc_msgSend(v7, "gradientLightColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "gradientDarkColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTopColor:bottomColor:ofRingAtIndex:", v17, v18, 0);

        LODWORD(v19) = ARUIRingPercentageValueNoRing;
        objc_msgSend(v14, "setPercentage:ofRingAtIndex:", 0, v19);
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v20 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v27);
  v21 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v5);
  v22 = -[ARUIRenderer initWithRenderStyle:]([ARUIRenderer alloc], "initWithRenderStyle:", 1);
  v23 = [ARUICountdownView alloc];
  v32[0] = v21;
  v32[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[ARUIRingsView initWithRingGroupControllers:renderer:](v23, "initWithRingGroupControllers:renderer:", v24, v22);

  return v25;
}

@end
