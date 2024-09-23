@implementation TUIPredictionView_TFExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIPredictionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (TUIPredictionView_TFExtras)initWithFrame:(CGRect)a3
{
  TUIPredictionView_TFExtras *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionView_TFExtras;
  v3 = -[TUIPredictionView_TFExtras initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && _AXSQuickTypePredictionFeedbackEnabled())
    -[TUIPredictionView_TFExtras speakTypingLoadAccessibilityInformation](v3, "speakTypingLoadAccessibilityInformation");
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TUIPredictionView_TFExtras;
  -[TUIPredictionView_TFExtras layoutSubviews](&v14, sel_layoutSubviews);
  if (_AXSQuickTypePredictionFeedbackEnabled())
    -[TUIPredictionView_TFExtras speakTypingLoadAccessibilityInformation](self, "speakTypingLoadAccessibilityInformation");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUIPredictionView_TFExtras gestureRecognizers](self, "gestureRecognizers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "_accessibilityBoolValueForKey:", CFSTR("SpeakCell")))
        {
          -[TUIPredictionView_TFExtras frame](self, "frame");
          objc_msgSend(v8, "setAllowableMovement:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

- (void)speakTypingLoadAccessibilityInformation
{
  double v3;
  id v4;

  if ((-[TUIPredictionView_TFExtras _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("accessibilityLongPressGestureRecognizerEnabled")) & 1) == 0)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__handleAXLongPress_);
    objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("SpeakCell"));
    -[TUIPredictionView_TFExtras frame](self, "frame");
    objc_msgSend(v4, "setAllowableMovement:", v3);
    -[TUIPredictionView_TFExtras addGestureRecognizer:](self, "addGestureRecognizer:", v4);
    -[TUIPredictionView_TFExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("accessibilityLongPressGestureRecognizerEnabled"));

  }
}

- (void)_handleAXLongPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  TUIPredictionView_TFExtras *v20;
  uint64_t v21;
  _QWORD v22[6];

  v4 = a3;
  -[TUIPredictionView_TFExtras safeArrayForKey:](self, "safeArrayForKey:", CFSTR("allVisibleCells"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", self);
  v10 = v9;
  v12 = v11;
  if (objc_msgSend(v4, "state") == 1)
  {
    v13 = -[TUIPredictionView_TFExtras _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:", v10, v12);
LABEL_6:
    -[TUIPredictionView_TFExtras _accessibilitySetIntegerValue:forKey:](self, "_accessibilitySetIntegerValue:forKey:", v13, CFSTR("accessibilityCurrentIndex"));
    if (v13 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionView_TFExtras _speakLabelAtCell:forCurrentInputMode:](self, "_speakLabelAtCell:forCurrentInputMode:", v14, v8);

    }
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    v13 = -[TUIPredictionView_TFExtras _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:", v10, v12);
    if (v13 == -[TUIPredictionView_TFExtras _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("accessibilityCurrentIndex")))goto LABEL_13;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke;
    v22[3] = &unk_24FED6788;
    v22[4] = self;
    v22[5] = v13;
    soft_AXPerformSafeBlock_0(v22);
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    v15 = -[TUIPredictionView_TFExtras safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedIndex"));
    v16 = objc_msgSend(v5, "count");
    if ((v15 & 0x8000000000000000) == 0 && v15 < v16)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_2;
      v18[3] = &unk_24FED67B0;
      v20 = self;
      v21 = v15;
      v19 = v5;
      soft_AXPerformSafeBlock_0(v18);

    }
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_3;
    v17[3] = &unk_24FED6218;
    v17[4] = self;
    soft_AXPerformSafeBlock_0(v17);
  }
LABEL_13:

}

- (void)_speakLabelAtCell:(id)a3 forCurrentInputMode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (_AXSQuickTypePredictionFeedbackEnabled())
  {
    objc_msgSend(v9, "safeValueForKey:", CFSTR("morphingLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getSpeakTypingServicesClass_0(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notifySpeakServicesToFeedbackQuickTypePrediction:forCurrentInputMode:", v7, v5);

  }
}

@end
