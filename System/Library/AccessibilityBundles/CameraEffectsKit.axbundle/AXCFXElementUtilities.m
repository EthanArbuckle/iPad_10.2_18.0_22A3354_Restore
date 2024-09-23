@implementation AXCFXElementUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)_SharedInstance;
}

void __39__AXCFXElementUtilities_sharedInstance__block_invoke()
{
  AXCFXElementUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(AXCFXElementUtilities);
  v1 = (void *)_SharedInstance;
  _SharedInstance = (uint64_t)v0;

}

- (id)axElementForJTEffect:(id)a3 vc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  UIAccessibilityFunCamElement *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIAccessibilityFunCamCustomAction *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  uint64_t v25;
  UIAccessibilityFunCamCustomAction *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  UIAccessibilityFunCamCustomAction *v31;
  void *v32;
  void *v33;
  id v34;
  UIAccessibilityFunCamCustomAction *v35;
  UIAccessibilityFunCamCustomAction *v36;
  void *v37;
  void *v38;
  id v39;
  UIAccessibilityFunCamCustomAction *v40;
  UIAccessibilityFunCamCustomAction *v41;
  void *v42;
  void *v43;
  id v44;
  UIAccessibilityFunCamCustomAction *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  _QWORD v59[4];
  id v60;
  id v61[6];
  id v62[2];
  id v63;
  id *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id from;
  id location[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x234909C04](CFSTR("JFXEffectEditingUtilities"));
  v8 = objc_initWeak(location, v5);
  v9 = objc_msgSend(v5, "safeIntForKey:", CFSTR("type"));

  if (v9 == 2)
  {
    objc_msgSend(v6, "safeUIViewForKey:", CFSTR("view"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[UIAccessibilityFunCamElement initWithAccessibilityContainer:]([UIAccessibilityFunCamElement alloc], "initWithAccessibilityContainer:", v10);
    objc_initWeak(&from, v6);
    v12 = (void *)MEMORY[0x24BDAC760];
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke;
    v74[3] = &unk_2501A9DE0;
    objc_copyWeak(&v76, &from);
    v13 = v5;
    v75 = v13;
    -[UIAccessibilityFunCamElement _setAccessibilityFrameBlock:](v11, "_setAccessibilityFrameBlock:", v74);
    v57 = (void *)v10;
    v72[0] = v12;
    v72[1] = 3221225472;
    v72[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_3;
    v72[3] = &unk_2501A9E08;
    objc_copyWeak(&v73, location);
    -[UIAccessibilityFunCamElement _setAccessibilityLabelBlock:](v11, "_setAccessibilityLabelBlock:", v72);
    objc_initWeak(&v71, v11);
    v67[0] = v12;
    v67[1] = 3221225472;
    v67[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_4;
    v67[3] = &unk_2501A9E30;
    objc_copyWeak(&v69, location);
    objc_copyWeak(&v70, &v71);
    v14 = v13;
    v68 = v14;
    -[UIAccessibilityFunCamElement _setAccessibilityValueBlock:](v11, "_setAccessibilityValueBlock:", v67);
    objc_msgSend(v14, "safeValueForKey:", CFSTR("trackingProps"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "safeIntForKey:", CFSTR("trackingType")))
      -[UIAccessibilityFunCamElement setTracked:](v11, "setTracked:", 1);
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v61[1] = v12;
    v61[2] = (id)3221225472;
    v61[3] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_5;
    v61[4] = &unk_2501A9E58;
    v61[5] = &v63;
    v62[1] = v7;
    objc_copyWeak(v62, location);
    AXPerformSafeBlock();
    v15 = *((unsigned __int8 *)v64 + 24);
    objc_destroyWeak(v62);
    _Block_object_dispose(&v63, 8);
    if (v15)
    {
      objc_initWeak(&v63, v6);
      v59[0] = v12;
      v59[1] = 3221225472;
      v59[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_6;
      v59[3] = &unk_2501A9E80;
      objc_copyWeak(&v60, &v63);
      objc_copyWeak(v61, location);
      -[UIAccessibilityFunCamElement _setAccessibilityActivateBlock:](v11, "_setAccessibilityActivateBlock:", v59);
      accessibilityLocalizedString(CFSTR("text.effect.hint"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("effect.hint"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityFunCamElement setAccessibilityHint:](v11, "setAccessibilityHint:", v18, v17, CFSTR("__AXStringForVariablesSentinel"));

      objc_destroyWeak(v61);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&v63);
    }
    else
    {
      -[UIAccessibilityFunCamElement _setAccessibilityActivateBlock:](v11, "_setAccessibilityActivateBlock:", &__block_literal_global_275);
      accessibilityLocalizedString(CFSTR("effect.hint"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityFunCamElement setAccessibilityHint:](v11, "setAccessibilityHint:", v19);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [UIAccessibilityFunCamCustomAction alloc];
    accessibilityLocalizedString(CFSTR("increase.size.action"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(location);
    v25 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:effect:axElement:vc:](v21, "initWithName:target:selector:effect:axElement:vc:", v22, v23, sel__axScaleUp_, WeakRetained, v11, v6);

    objc_msgSend(v20, "addObject:", v25);
    v55 = (void *)v25;
    v26 = [UIAccessibilityFunCamCustomAction alloc];
    accessibilityLocalizedString(CFSTR("decrease.size.action"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_loadWeakRetained(location);
    v30 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:effect:axElement:vc:](v26, "initWithName:target:selector:effect:axElement:vc:", v27, v28, sel__axScaleDown_, v29, v11, v6);

    objc_msgSend(v20, "addObject:", v30);
    v54 = (void *)v30;
    v31 = [UIAccessibilityFunCamCustomAction alloc];
    accessibilityLocalizedString(CFSTR("rotate.clockwise.action"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_loadWeakRetained(location);
    v35 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:effect:axElement:vc:](v31, "initWithName:target:selector:effect:axElement:vc:", v32, v33, sel__axRotateClockwise_, v34, v11, v6);

    objc_msgSend(v20, "addObject:", v35);
    v36 = [UIAccessibilityFunCamCustomAction alloc];
    accessibilityLocalizedString(CFSTR("rotate.counterclockwise.action"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_loadWeakRetained(location);
    v40 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:effect:axElement:vc:](v36, "initWithName:target:selector:effect:axElement:vc:", v37, v38, sel__axRotateCounterClockwise_, v39, v11, v6);

    objc_msgSend(v20, "addObject:", v40);
    v41 = [UIAccessibilityFunCamCustomAction alloc];
    accessibilityLocalizedString(CFSTR("remove.effect.action"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_loadWeakRetained(location);
    v45 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:effect:axElement:vc:](v41, "initWithName:target:selector:effect:axElement:vc:", v42, v43, sel__axRemoveEffect_, v44, v11, v6);

    objc_msgSend(v20, "addObject:", v45);
    -[UIAccessibilityFunCamElement setAccessibilityCustomActions:](v11, "setAccessibilityCustomActions:", v20);
    LOBYTE(v63) = 0;
    objc_opt_class();
    v46 = objc_loadWeakRetained(location);
    objc_msgSend(v46, "safeValueForKeyPath:", CFSTR("effectParameters"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v63)
      abort();
    objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE796E0]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      objc_msgSend(v49, "SIMDDouble4x4");
      v51 = v58;
    }
    else
    {
      v51 = *MEMORY[0x24BDBD8B8];
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityFunCamElement _accessibilitySetValue:forKey:storageMode:](v11, "_accessibilitySetValue:forKey:storageMode:", v52, CFSTR("AXOriginalScale"), 0);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);

    objc_destroyWeak(&v76);
    objc_destroyWeak(&from);

  }
  else
  {
    v11 = 0;
  }
  objc_destroyWeak(location);

  return v11;
}

double __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char isKindOfClass;
  id v5;
  void *v6;
  const __CFString *v7;
  char v8;
  UIView *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  id v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect v24;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  MEMORY[0x234909C04](CFSTR("CFXCaptureViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = CFSTR("liveCaptureContainer");
  }
  else
  {
    MEMORY[0x234909C04](CFSTR("CFXPreviewViewController"));
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");

      v9 = 0;
      goto LABEL_8;
    }
    v5 = objc_loadWeakRetained(v2);
    v6 = v5;
    v7 = CFSTR("playerContainerView");
  }
  objc_msgSend(v5, "safeUIViewForKey:", v7);
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
  -[UIView frame](v9, "frame");
LABEL_8:
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = &unk_2324D7B53;
  v22 = 0u;
  v23 = 0u;
  v17 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  v11 = v19[4];
  v12 = v19[5];
  v13 = v19[6];
  v14 = v19[7];

  _Block_object_dispose(&v18, 8);
  v24.origin.x = v11;
  v24.origin.y = v12;
  v24.size.width = v13;
  v24.size.height = v14;
  *(_QWORD *)&v15 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v24, v9);

  return v15;
}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v9 = *MEMORY[0x24BDC0D88];
  v10 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  result = objc_msgSend(v2, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v9, 1, 1, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

id __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("accessibilityName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  MEMORY[0x234909C04](CFSTR("JFXTextEffect"));
  LOBYTE(WeakRetained) = objc_opt_isKindOfClass();

  if ((WeakRetained & 1) != 0)
  {
    v24 = 0;
    objc_opt_class();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "safeValueForKey:", CFSTR("strings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v10);
          v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
          __UIAXStringForVariables();
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          ++v15;
          v16 = v13;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, v19, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_4(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  long double v8;
  long double v9;
  id v10;
  long double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __CFString *v22;
  float v23;
  void *v24;
  id *v25;
  id v26;
  void *v27;
  float v28;
  float v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _BYTE v46[144];

  v46[135] = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("effectParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE796E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v46;
    objc_msgSend(v5, "SIMDDouble4x4");
  }
  else
  {
    v7 = (_BYTE *)MEMORY[0x24BDBD8B8];
  }
  v8 = *(double *)v7;
  v9 = *((double *)v7 + 1);
  v10 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v10, "setRoundingMode:", 6);
  v11 = atan2(v9, v8) * 180.0 / 3.14159265;
  if (fabs(v11) >= 0.001)
  {
    *(float *)&v11 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", (double)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberFromString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v16, "numberWithDouble:", fabs(v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 180);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = CFSTR("rotation.value.degrees");
    }
    else
    {
      objc_msgSend(v15, "floatValue");
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (v23 <= 0.0)
        v22 = CFSTR("rotation.value.counterclockwise");
      else
        v22 = CFSTR("rotation.value.clockwise");
    }
    accessibilityLocalizedString(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v24, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v25 = a1 + 6;
  v26 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v26, "_accessibilityValueForKey:", CFSTR("AXOriginalScale"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v29 = v28;

  if (v29 > 0.0)
    v30 = v8 / v29;
  else
    v30 = 1.0;
  v31 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v31, "setMaximumFractionDigits:", 2);
  objc_msgSend(v31, "setNumberStyle:", 1);
  objc_msgSend(v31, "setRoundingMode:", 6);
  v32 = 0;
  v33 = fabs(v30 + -1.0);
  if (v33 >= 0.001 && v30 > 0.0)
  {
    *(float *)&v33 = v30;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromNumber:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberFromString:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("scale.value"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringWithFormat:", v38, v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1[4], "safeValueForKey:", CFSTR("trackingProps"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "safeIntForKey:", CFSTR("trackingType")) != 0;
  v41 = objc_loadWeakRetained(v25);
  objc_msgSend(v41, "setTracked:", v40);

  v42 = objc_loadWeakRetained(v25);
  if (objc_msgSend(v42, "tracked"))
  {
    accessibilityLocalizedString(CFSTR("following.face"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  __UIAXStringForVariables();
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

void __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "canEditTextForEffect:", WeakRetained);

}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentFullScreenTextEditorForEffect:insertingEffect:", v3, 1);

  return 1;
}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_7()
{
  return 1;
}

- (void)_axScaleUp:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("type"));

  if (v5 == 2)
  {
    v13 = v3;
    AXPerformSafeBlock();
    objc_msgSend(v13, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("effectEditor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7;
    v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x24BDF71E8];
    objc_msgSend(v13, "axElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    v11 = v13;
    AXPerformSafeBlock();

  }
}

void __36__AXCFXElementUtilities__axScaleUp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayEffectEditorForEffect:forMode:", v2, 1);

}

uint64_t __36__AXCFXElementUtilities__axScaleUp___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_scaleEffect:", 1.25);
}

void __36__AXCFXElementUtilities__axScaleUp___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "removeEffectEditor");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "vc");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeEffectEditorAnimated:", 0);
  }

}

- (void)_axScaleDown:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("type"));

  if (v5 == 2)
  {
    v13 = v3;
    AXPerformSafeBlock();
    objc_msgSend(v13, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("effectEditor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7;
    v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x24BDF71E8];
    objc_msgSend(v13, "axElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    v11 = v13;
    AXPerformSafeBlock();

  }
}

void __38__AXCFXElementUtilities__axScaleDown___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayEffectEditorForEffect:forMode:", v2, 1);

}

uint64_t __38__AXCFXElementUtilities__axScaleDown___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_scaleEffect:", 0.75);
}

void __38__AXCFXElementUtilities__axScaleDown___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "removeEffectEditor");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "vc");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeEffectEditorAnimated:", 0);
  }

}

- (void)_axRotateClockwise:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("type"));

  if (v5 == 2)
  {
    v13 = v3;
    AXPerformSafeBlock();
    objc_msgSend(v13, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("effectEditor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7;
    v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x24BDF71E8];
    objc_msgSend(v13, "axElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    v11 = v13;
    AXPerformSafeBlock();

  }
}

void __44__AXCFXElementUtilities__axRotateClockwise___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayEffectEditorForEffect:forMode:", v2, 1);

}

uint64_t __44__AXCFXElementUtilities__axRotateClockwise___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_rotateEffect:", 0.785398163);
}

void __44__AXCFXElementUtilities__axRotateClockwise___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "removeEffectEditor");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "vc");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeEffectEditorAnimated:", 0);
  }

}

- (void)_axRotateCounterClockwise:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("type"));

  if (v5 == 2)
  {
    v13 = v3;
    AXPerformSafeBlock();
    objc_msgSend(v13, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("effectEditor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7;
    v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x24BDF71E8];
    objc_msgSend(v13, "axElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    v11 = v13;
    AXPerformSafeBlock();

  }
}

void __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayEffectEditorForEffect:forMode:", v2, 1);

}

uint64_t __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_rotateEffect:", -0.785398163);
}

void __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "removeEffectEditor");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "vc");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeEffectEditorAnimated:", 0);
  }

}

- (void)_axRemoveEffect:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("type"));

  if (v5 == 2)
  {
    v9 = v3;
    AXPerformSafeBlock();
    objc_msgSend(v9, "vc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("effectEditor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    AXPerformSafeBlock();

  }
}

void __41__AXCFXElementUtilities__axRemoveEffect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayEffectEditorForEffect:forMode:", v2, 0);

}

uint64_t __41__AXCFXElementUtilities__axRemoveEffect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_removeEffect");
}

@end
