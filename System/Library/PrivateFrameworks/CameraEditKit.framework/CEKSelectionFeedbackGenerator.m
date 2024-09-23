@implementation CEKSelectionFeedbackGenerator

- (CEKSelectionFeedbackGenerator)init
{
  CEKSelectionFeedbackGenerator *v3;
  SystemSoundID *v4;
  void *v5;
  const __CFURL *v6;
  void *v7;
  const __CFURL *v8;
  void *v9;
  const __CFURL *v10;
  void *v11;
  const __CFURL *v12;
  SystemSoundID *v13;
  SystemSoundID *v14;
  OSStatus SystemSoundID;
  SystemSoundID *v16;
  OSStatus v17;
  SystemSoundID *v18;
  OSStatus v19;
  CEKSelectionFeedbackGenerator *v20;
  const __CFURL *v22;
  const __CFURL *v23;
  objc_super v24;

  if (CEKHapticsAllowed_onceToken != -1)
    dispatch_once(&CEKHapticsAllowed_onceToken, &__block_literal_global_0);
  if (CEKHapticsAllowed_allowsHaptics)
  {
    v24.receiver = self;
    v24.super_class = (Class)CEKSelectionFeedbackGenerator;
    v3 = -[CEKSelectionFeedbackGenerator init](&v24, sel_init);
    v4 = (SystemSoundID *)v3;
    if (v3)
    {
      v3->_profile = 0;
      CEKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("CEKEndStopTick"), CFSTR("wav"));
      v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      CEKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("CEKFullStopTick"), CFSTR("wav"));
      v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      CEKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("CEKThirdStopTick"), CFSTR("wav"));
      v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      CEKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("CEKOverscrollStopTick"), CFSTR("wav"));
      v12 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      v13 = v4 + 2;
      v23 = v6;
      LODWORD(v6) = AudioServicesCreateSystemSoundID(v6, v4 + 2);
      v14 = v4 + 3;
      v22 = v8;
      SystemSoundID = AudioServicesCreateSystemSoundID(v8, v4 + 3);
      v16 = v4 + 4;
      v17 = AudioServicesCreateSystemSoundID(v10, v4 + 4);
      v18 = v4 + 5;
      v19 = AudioServicesCreateSystemSoundID(v12, v4 + 5);
      if ((_DWORD)v6 || SystemSoundID || v17 || v19)
      {
        AudioServicesDisposeSystemSoundID(*v13);
        *v13 = 0;
        AudioServicesDisposeSystemSoundID(*v14);
        *v14 = 0;
        AudioServicesDisposeSystemSoundID(*v16);
        *v16 = 0;
        AudioServicesDisposeSystemSoundID(*v18);
        *v18 = 0;
      }

    }
    self = v4;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  AudioServicesDisposeSystemSoundID(self->__endStopSoundID);
  self->__endStopSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__majorTickSoundID);
  self->__majorTickSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__minorTickSoundID);
  self->__minorTickSoundID = 0;
  AudioServicesDisposeSystemSoundID(self->__overscrollTickSoundID);
  self->__overscrollTickSoundID = 0;
  v3.receiver = self;
  v3.super_class = (Class)CEKSelectionFeedbackGenerator;
  -[CEKSelectionFeedbackGenerator dealloc](&v3, sel_dealloc);
}

- (void)prepareFeedback
{
  id v3;

  -[CEKSelectionFeedbackGenerator _updateFeedbackGeneratorIfNeeded](self, "_updateFeedbackGeneratorIfNeeded");
  -[CEKSelectionFeedbackGenerator _feedbackGenerator](self, "_feedbackGenerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

}

- (void)performFeedback
{
  id v3;

  -[CEKSelectionFeedbackGenerator _updateFeedbackGeneratorIfNeeded](self, "_updateFeedbackGeneratorIfNeeded");
  -[CEKSelectionFeedbackGenerator _feedbackGenerator](self, "_feedbackGenerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

}

- (void)setProfile:(int64_t)a3
{
  UISelectionFeedbackGenerator *feedbackGenerator;

  if (self->_profile != a3)
  {
    feedbackGenerator = self->__feedbackGenerator;
    self->_profile = a3;
    self->__feedbackGenerator = 0;

  }
}

- (void)playMinorTickSound
{
  AudioServicesPlaySystemSoundWithCompletion(-[CEKSelectionFeedbackGenerator _minorTickSoundID](self, "_minorTickSoundID"), 0);
}

- (void)playMajorTickSound
{
  AudioServicesPlaySystemSoundWithCompletion(-[CEKSelectionFeedbackGenerator _majorTickSoundID](self, "_majorTickSoundID"), 0);
}

- (void)playEndTickSound
{
  AudioServicesPlaySystemSoundWithCompletion(-[CEKSelectionFeedbackGenerator _endStopSoundID](self, "_endStopSoundID"), 0);
}

- (void)playOverscrollTickSound
{
  AudioServicesPlaySystemSoundWithCompletion(-[CEKSelectionFeedbackGenerator _overscrollTickSoundID](self, "_overscrollTickSoundID"), 0);
}

- (void)_updateFeedbackGeneratorIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  UISelectionFeedbackGenerator *v7;
  UISelectionFeedbackGenerator *feedbackGenerator;
  id v9;

  if (!self->__feedbackGenerator)
  {
    v3 = -[CEKSelectionFeedbackGenerator profile](self, "profile");
    if (v3 > 2)
      v4 = 0;
    else
      v4 = qword_1E70A4E18[v3];
    objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tweakedConfigurationForCaller:usage:", self, CFSTR("cameraEffectSelection"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFeedback:", v6);

    v7 = (UISelectionFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:", v9);
    feedbackGenerator = self->__feedbackGenerator;
    self->__feedbackGenerator = v7;

    -[UISelectionFeedbackGenerator _setOutputMode:](self->__feedbackGenerator, "_setOutputMode:", 5);
  }
}

- (int64_t)profile
{
  return self->_profile;
}

- (UISelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (unsigned)_endStopSoundID
{
  return self->__endStopSoundID;
}

- (unsigned)_majorTickSoundID
{
  return self->__majorTickSoundID;
}

- (unsigned)_minorTickSoundID
{
  return self->__minorTickSoundID;
}

- (unsigned)_overscrollTickSoundID
{
  return self->__overscrollTickSoundID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
}

@end
