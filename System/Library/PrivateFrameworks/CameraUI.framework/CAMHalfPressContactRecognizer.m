@implementation CAMHalfPressContactRecognizer

- (CAMHalfPressContactRecognizer)init
{
  CAMHalfPressContactRecognizer *v2;
  void *v3;
  double v4;
  float v5;
  float v6;
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
  void *v17;
  void *v18;
  uint64_t v19;
  _UIButtonFeedbackGenerator *halfPressFeedbackGenerator;
  NSMutableSet *v21;
  NSMutableSet *activePairedFeedbackGenerators;
  objc_super v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  const __CFString *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)CAMHalfPressContactRecognizer;
  v2 = -[CAMHalfPressContactRecognizer init](&v24, sel_init);
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("systemOverlay.halfPressHapticVolume"), CFSTR("com.apple.camera"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "floatValue");
      v4 = fmax(fmin(v5, 1.0), 0.0);
      v6 = v4;
    }
    else
    {
      v6 = 0.38;
    }
    v7 = (void *)MEMORY[0x1E0DC4100];
    v31[0] = CFSTR("type");
    v31[1] = CFSTR("eventType");
    v32[0] = CFSTR("custom");
    v32[1] = &unk_1EA3B14E0;
    v31[2] = CFSTR("hapticParameters");
    v29 = CFSTR("volume");
    *(float *)&v4 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedbackWithDictionaryRepresentation:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC4100];
    v27[0] = CFSTR("type");
    v27[1] = CFSTR("eventType");
    v28[0] = CFSTR("custom");
    v28[1] = &unk_1EA3B14E0;
    v27[2] = CFSTR("hapticParameters");
    v25 = CFSTR("volume");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "feedbackWithDictionaryRepresentation:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC4058], "defaultConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tweakedConfigurationForCaller:usage:", v2, CFSTR("cameraOverlayHalfPress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setInteractionStartedFeedback:", v11);
    objc_msgSend(v18, "setInteractionEndedFeedback:", v16);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4050]), "initWithConfiguration:", v18);
    halfPressFeedbackGenerator = v2->__halfPressFeedbackGenerator;
    v2->__halfPressFeedbackGenerator = (_UIButtonFeedbackGenerator *)v19;

    -[_UIButtonFeedbackGenerator _setOutputMode:](v2->__halfPressFeedbackGenerator, "_setOutputMode:", 5);
    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activePairedFeedbackGenerators = v2->__activePairedFeedbackGenerators;
    v2->__activePairedFeedbackGenerators = v21;

    v2->_enabled = 1;
  }
  return v2;
}

- (void)reset
{
  -[CAMHalfPressContactRecognizer _setHalfPressTimestamp:](self, "_setHalfPressTimestamp:", 0.0);
  -[CAMHalfPressContactRecognizer _setAccumulatedDeltaSinceLastHalfPress:](self, "_setAccumulatedDeltaSinceLastHalfPress:", 0.0);
  -[CAMHalfPressContactRecognizer _setLastPressWasDoubleHalfPress:](self, "_setLastPressWasDoubleHalfPress:", 0);
  -[CAMHalfPressContactRecognizer _setHalfPressIncurredFullPress:](self, "_setHalfPressIncurredFullPress:", 0);
}

- (void)contactBegan:(id)a3 action:(id)a4
{
  id v5;

  if (-[CAMHalfPressContactRecognizer enabled](self, "enabled", a3, a4))
  {
    -[CAMHalfPressContactRecognizer _halfPressFeedbackGenerator](self, "_halfPressFeedbackGenerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepare");

  }
}

- (void)contactUpdated:(id)a3 action:(id)a4 filteredPosition:(double)a5 filteredDelta:(double)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  _BOOL4 v22;
  _BOOL4 v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  _BOOL4 v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  NSObject *v36;
  double v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint8_t *v42;
  void *v43;
  CFIndex AppIntegerValue;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  float v52;
  double v53;
  void *v54;
  void *v55;
  __int16 v56;
  uint8_t v57[16];
  uint8_t v58[2];
  unsigned __int8 v59;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  if (-[CAMHalfPressContactRecognizer enabled](self, "enabled"))
  {
    -[CAMHalfPressContactRecognizer _halfPressFeedbackGenerator](self, "_halfPressFeedbackGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMHalfPressContactRecognizer _activePairedFeedbackGenerators](self, "_activePairedFeedbackGenerators");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v10;
    if (objc_msgSend(v12, "allowHalfPressSimulation"))
    {
      v13 = objc_msgSend(v9, "_button");

      if (v13 == 2)
      {
        if ((objc_msgSend(v11, "containsObject:", v10) & 1) != 0)
        {
          v14 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "CAMHalfPressContactRecognizer is trying start a haptic that was previously started", buf, 2u);
          }

        }
        else
        {
          objc_msgSend(v10, "userInteractionStarted");
          objc_msgSend(v11, "addObject:", v10);
        }
        v15 = 1;
LABEL_12:
        v16 = v11;
        -[CAMHalfPressContactRecognizer _halfPressTimestamp](self, "_halfPressTimestamp");
        if (v17 != 0.0)
        {
          objc_msgSend(v8, "positionDelta");
          CEKExpandNormalizedContactPoint();
          v19 = fabs(v18);
          -[CAMHalfPressContactRecognizer _accumulatedDeltaSinceLastHalfPress](self, "_accumulatedDeltaSinceLastHalfPress");
          -[CAMHalfPressContactRecognizer _setAccumulatedDeltaSinceLastHalfPress:](self, "_setAccumulatedDeltaSinceLastHalfPress:", v20 + v19);
        }
        v21 = objc_msgSend(v9, "_stagePhase");
        v22 = (v21 & 7) == 0 && v21 < 3;
        v23 = (v21 & 7) == 2 && v21 < 3;
        v24 = objc_msgSend(v9, "_stage");
        v25 = objc_msgSend(v9, "_numberOfStages");
        v26 = objc_msgSend(v8, "isTouching");
        if (v25 > 1)
        {
          if (v24 <= 3)
          {
            if (v24 == 3)
            {
              v27 = 3;
            }
            else if (v24 <= 1)
            {
              if (v24 == 1)
                v27 = 1;
              else
                v27 = v26;
            }
            else
            {
              v27 = 2;
            }
          }
          else
          {
            v27 = 4;
          }
        }
        else
        {
          v27 = 4 * (v24 != 0);
        }
        v28 = v27 == 2 && v22;
        if (v27 != 4)
          v22 = 0;
        objc_msgSend(v9, "_timestamp");
        v30 = v29;
        if (v22)
        {
          -[CAMHalfPressContactRecognizer _setHalfPressIncurredFullPress:](self, "_setHalfPressIncurredFullPress:", 1);
          -[CAMHalfPressContactRecognizer _setHalfPressTimestamp:](self, "_setHalfPressTimestamp:", 0.0);
          -[CAMHalfPressContactRecognizer _setAccumulatedDeltaSinceLastHalfPress:](self, "_setAccumulatedDeltaSinceLastHalfPress:", 0.0);
          -[CAMHalfPressContactRecognizer delegate](self, "delegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "halfPressContactRecognizerSingleHalfPressDidCancel:timestamp:", self, v30);

          v32 = v16;
          v33 = v55;
          goto LABEL_66;
        }
        v34 = v27 == 2 && v23;
        if ((v15 | v34) != 1)
        {
          if (v28)
          {
            v32 = v16;
            v35 = v16;
            v33 = v55;
            if ((objc_msgSend(v35, "containsObject:", v55) & 1) != 0)
            {
              v36 = os_log_create("com.apple.camera.overlay", "Angel");
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v57 = 0;
                _os_log_impl(&dword_1DB760000, v36, OS_LOG_TYPE_DEFAULT, "CAMHalfPressContactRecognizer is trying start a haptic that was previously started", v57, 2u);
              }

            }
            else
            {
              objc_msgSend(v55, "userInteractionStarted");
              objc_msgSend(v32, "addObject:", v55);
            }
            -[CAMHalfPressContactRecognizer delegate](self, "delegate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "halfPressContactRecognizerSingleHalfPressDidBegin:timestamp:", self, v30);

            goto LABEL_66;
          }
          v32 = v16;
          v33 = v55;
          if (v21 < 3)
          {
LABEL_66:

            goto LABEL_67;
          }
          -[CAMHalfPressContactRecognizer delegate](self, "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "halfPressContactRecognizerSingleHalfPressDidCancel:timestamp:", self, v30);

          if (objc_msgSend(v32, "containsObject:", v55))
          {
            objc_msgSend(v55, "userInteractionCancelled");
            goto LABEL_55;
          }
          v40 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v56 = 0;
            v41 = "CAMHalfPressContactRecognizer is trying cancel a haptic that wasn't started";
            v42 = (uint8_t *)&v56;
            goto LABEL_61;
          }
LABEL_62:

          goto LABEL_63;
        }
        if (-[CAMHalfPressContactRecognizer _halfPressIncurredFullPress](self, "_halfPressIncurredFullPress"))
        {
          -[CAMHalfPressContactRecognizer _setHalfPressIncurredFullPress:](self, "_setHalfPressIncurredFullPress:", 0);
        }
        else
        {
          -[CAMHalfPressContactRecognizer _halfPressTimestamp](self, "_halfPressTimestamp");
          if (v37 != 0.0
            && !-[CAMHalfPressContactRecognizer _lastPressWasDoubleHalfPress](self, "_lastPressWasDoubleHalfPress"))
          {
            AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.menuToggleMaxIntervalMilliseconds"), CFSTR("com.apple.camera"), 0);
            if (AppIntegerValue <= 0)
              v45 = 450.0;
            else
              v45 = (double)AppIntegerValue;
            -[CAMHalfPressContactRecognizer _halfPressTimestamp](self, "_halfPressTimestamp");
            v47 = v30 * 1000.0 - v46 * 1000.0;
            v59 = 0;
            +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("systemOverlay.maxAllowedDoubleHalfPressDelta"), CFSTR("com.apple.camera"), &v59);
            v49 = v48;
            v50 = v59;
            -[CAMHalfPressContactRecognizer _accumulatedDeltaSinceLastHalfPress](self, "_accumulatedDeltaSinceLastHalfPress");
            if (v47 > v45)
              goto LABEL_78;
            v52 = v49;
            v53 = v52;
            if (!v50)
              v53 = 4.0;
            if (v51 >= v53)
            {
LABEL_78:
              -[CAMHalfPressContactRecognizer _setHalfPressTimestamp:](self, "_setHalfPressTimestamp:", v30);
              -[CAMHalfPressContactRecognizer delegate](self, "delegate");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "halfPressContactRecognizerSingleHalfPressDidEnd:timestamp:", self, v30);
            }
            else
            {
              -[CAMHalfPressContactRecognizer _setHalfPressTimestamp:](self, "_setHalfPressTimestamp:", v30);
              -[CAMHalfPressContactRecognizer _setLastPressWasDoubleHalfPress:](self, "_setLastPressWasDoubleHalfPress:", 1);
              -[CAMHalfPressContactRecognizer delegate](self, "delegate");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "halfPressContactRecognizerDoubleHalfPressDidEnd:timestamp:", self, v30);
            }
            v32 = v16;

LABEL_53:
            v33 = v55;
            if (objc_msgSend(v32, "containsObject:", v55))
            {
              objc_msgSend(v55, "userInteractionEnded");
LABEL_55:
              objc_msgSend(v32, "removeObject:", v33);
LABEL_63:
              -[CAMHalfPressContactRecognizer _setAccumulatedDeltaSinceLastHalfPress:](self, "_setAccumulatedDeltaSinceLastHalfPress:", 0.0);
              goto LABEL_66;
            }
            v40 = os_log_create("com.apple.camera.overlay", "Angel");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v58 = 0;
              v41 = "CAMHalfPressContactRecognizer is trying end a haptic that wasn't started";
              v42 = v58;
LABEL_61:
              _os_log_impl(&dword_1DB760000, v40, OS_LOG_TYPE_DEFAULT, v41, v42, 2u);
              goto LABEL_62;
            }
            goto LABEL_62;
          }
          -[CAMHalfPressContactRecognizer _setHalfPressTimestamp:](self, "_setHalfPressTimestamp:", v30);
          -[CAMHalfPressContactRecognizer _setLastPressWasDoubleHalfPress:](self, "_setLastPressWasDoubleHalfPress:", 0);
          -[CAMHalfPressContactRecognizer delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "halfPressContactRecognizerSingleHalfPressDidEnd:timestamp:", self, v30);

        }
        v32 = v16;
        goto LABEL_53;
      }
    }
    else
    {

    }
    v15 = 0;
    goto LABEL_12;
  }
LABEL_67:

}

- (CAMHalfPressContactRecognizerDelegate)delegate
{
  return (CAMHalfPressContactRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (_UIButtonFeedbackGenerator)_halfPressFeedbackGenerator
{
  return self->__halfPressFeedbackGenerator;
}

- (double)_halfPressTimestamp
{
  return self->__halfPressTimestamp;
}

- (void)_setHalfPressTimestamp:(double)a3
{
  self->__halfPressTimestamp = a3;
}

- (double)_accumulatedDeltaSinceLastHalfPress
{
  return self->__accumulatedDeltaSinceLastHalfPress;
}

- (void)_setAccumulatedDeltaSinceLastHalfPress:(double)a3
{
  self->__accumulatedDeltaSinceLastHalfPress = a3;
}

- (BOOL)_lastPressWasDoubleHalfPress
{
  return self->__lastPressWasDoubleHalfPress;
}

- (void)_setLastPressWasDoubleHalfPress:(BOOL)a3
{
  self->__lastPressWasDoubleHalfPress = a3;
}

- (BOOL)_halfPressIncurredFullPress
{
  return self->__halfPressIncurredFullPress;
}

- (void)_setHalfPressIncurredFullPress:(BOOL)a3
{
  self->__halfPressIncurredFullPress = a3;
}

- (NSMutableSet)_activePairedFeedbackGenerators
{
  return self->__activePairedFeedbackGenerators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__halfPressFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
