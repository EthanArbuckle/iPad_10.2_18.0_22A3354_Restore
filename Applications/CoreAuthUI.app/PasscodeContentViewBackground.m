@implementation PasscodeContentViewBackground

- (void)applyBackgroundForStyle:(id)a3 toView:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  PasscodeBackdropView *v12;
  PasscodeBackdropView *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[PasscodeContentViewBackground _removePreviousBackgroundFromView:](self, "_removePreviousBackgroundFromView:", v6);
  if (objc_msgSend(v19, "backgroundStyle") == (id)1)
  {
    v7 = 2020;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[Passcode currentPasscode](Passcode, "currentPasscode"));
    if (objc_msgSend(v8, "isComplex"))
      v7 = 2029;
    else
      v7 = 2020;

  }
  v9 = objc_msgSend(v19, "rawValue");
  if (v9 == (id)1)
    v10 = v7;
  else
    v10 = 2030;
  switch((unint64_t)objc_msgSend(v19, "backgroundStyle"))
  {
    case 0uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", v10));
      v12 = (PasscodeBackdropView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "combinedTintColor"));
      v13 = v12;
      v14 = 1.0;
      goto LABEL_13;
    case 1uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", v10, 100));
      objc_msgSend(v11, "setStackingLevel:", _UIBackdropViewSettingsStackingLevelHigh);
      if (v9 == (id)1)
        v17 = 1;
      else
        v17 = 2;
      objc_msgSend(v11, "setRenderingHint:", v17);
      v13 = -[PasscodeBackdropView initWithSettings:]([PasscodeBackdropView alloc], "initWithSettings:", v11);
      -[PasscodeBackdropView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
      -[PasscodeBackdropView setConfiguration:](v13, "setConfiguration:", 1);
      -[PasscodeBackdropView setAlpha:](v13, "setAlpha:", 1.0);
      objc_msgSend(v6, "addSubview:", v13);
      objc_msgSend(v6, "sendSubviewToBack:", v13);
      v15 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_20;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", v10));
      v12 = (PasscodeBackdropView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "combinedTintColor"));
      v13 = v12;
      v14 = 0.75;
LABEL_13:
      v15 = objc_claimAutoreleasedReturnValue(-[PasscodeBackdropView colorWithAlphaComponent:](v12, "colorWithAlphaComponent:", v14));
LABEL_20:
      v18 = (void *)v15;
      objc_msgSend(v6, "setBackgroundColor:", v15);

      goto LABEL_23;
    case 3uLL:
      if (v9 == (id)1)
        v16 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9, 0.9, 0.9, 1.0));
      else
        v16 = objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
      v11 = (void *)v16;
      objc_msgSend(v6, "setBackgroundColor:", v16);
LABEL_23:

      break;
    default:
      break;
  }

}

- (void)_removePreviousBackgroundFromView:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews", 0));
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class(PasscodeBackdropView, v4)))
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v5, "removeFromSuperview");
}

@end
