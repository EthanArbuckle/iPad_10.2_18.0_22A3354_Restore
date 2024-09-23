@implementation CAMFeedbackController

- (CAMFeedbackController)init
{
  CAMFeedbackController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UISelectionFeedbackGenerator *modeSelectionFeedbackGenerator;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _UIButtonFeedbackGenerator *shutterButtonMomentaryFeedbackGenerator;
  void *v14;
  void *v15;
  uint64_t v16;
  _UIButtonFeedbackGenerator *shutterButtonLatchingOnFeedbackGenerator;
  void *v18;
  void *v19;
  uint64_t v20;
  _UIButtonFeedbackGenerator *shutterButtonLatchingOffFeedbackGenerator;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UISelectionFeedbackGenerator *burstCountFeedbackGenerator;
  NSMutableSet *v27;
  NSMutableSet *activePairedFeedbackGenerators;
  CAMFeedbackController *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CAMFeedbackController;
  v2 = -[CAMFeedbackController init](&v31, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tweakedConfigurationForCaller:usage:", v2, CFSTR("modeSelection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setMinimumInterval:", 0.01);
    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1EA3B2CA0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFeedback:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:", v4);
    modeSelectionFeedbackGenerator = v2->__modeSelectionFeedbackGenerator;
    v2->__modeSelectionFeedbackGenerator = (UISelectionFeedbackGenerator *)v6;

    -[UISelectionFeedbackGenerator _setOutputMode:](v2->__modeSelectionFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1EA3B2CF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1EA3B2D40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC4058], "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tweakedConfigurationForCaller:usage:", v2, CFSTR("shutterButtonMomentary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setInteractionStartedFeedback:", v8);
    objc_msgSend(v11, "setInteractionEndedFeedback:", v8);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4050]), "initWithConfiguration:", v11);
    shutterButtonMomentaryFeedbackGenerator = v2->__shutterButtonMomentaryFeedbackGenerator;
    v2->__shutterButtonMomentaryFeedbackGenerator = (_UIButtonFeedbackGenerator *)v12;

    -[_UIButtonFeedbackGenerator _setOutputMode:](v2->__shutterButtonMomentaryFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x1E0DC4058], "defaultConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tweakedConfigurationForCaller:usage:", v2, CFSTR("shutterButtonLatchingOn"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setInteractionStartedFeedback:", v8);
    objc_msgSend(v15, "setInteractionEndedFeedback:", v9);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4050]), "initWithConfiguration:", v15);
    shutterButtonLatchingOnFeedbackGenerator = v2->__shutterButtonLatchingOnFeedbackGenerator;
    v2->__shutterButtonLatchingOnFeedbackGenerator = (_UIButtonFeedbackGenerator *)v16;

    -[_UIButtonFeedbackGenerator _setOutputMode:](v2->__shutterButtonLatchingOnFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x1E0DC4058], "defaultConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tweakedConfigurationForCaller:usage:", v2, CFSTR("shutterButtonLatchingOff"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setInteractionStartedFeedback:", v9);
    objc_msgSend(v19, "setInteractionEndedFeedback:", v8);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4050]), "initWithConfiguration:", v19);
    shutterButtonLatchingOffFeedbackGenerator = v2->__shutterButtonLatchingOffFeedbackGenerator;
    v2->__shutterButtonLatchingOffFeedbackGenerator = (_UIButtonFeedbackGenerator *)v20;

    -[_UIButtonFeedbackGenerator _setOutputMode:](v2->__shutterButtonLatchingOffFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tweakedConfigurationForCaller:usage:", v2, CFSTR("burstCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setMinimumInterval:", 0.005);
    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1EA3B2D90);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFeedback:", v24);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:", v23);
    burstCountFeedbackGenerator = v2->__burstCountFeedbackGenerator;
    v2->__burstCountFeedbackGenerator = (UISelectionFeedbackGenerator *)v25;

    -[UISelectionFeedbackGenerator _setOutputMode:](v2->__burstCountFeedbackGenerator, "_setOutputMode:", 5);
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activePairedFeedbackGenerators = v2->__activePairedFeedbackGenerators;
    v2->__activePairedFeedbackGenerators = v27;

    v29 = v2;
  }

  return v2;
}

- (void)prepareDiscreteFeedback:(unint64_t)a3
{
  id v3;

  -[CAMFeedbackController _feedbackGeneratorForDiscreteFeedback:](self, "_feedbackGeneratorForDiscreteFeedback:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

}

- (void)performDiscreteFeedback:(unint64_t)a3
{
  id v3;

  -[CAMFeedbackController _feedbackGeneratorForDiscreteFeedback:](self, "_feedbackGeneratorForDiscreteFeedback:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

}

- (void)prepareButtonFeedback:(unint64_t)a3
{
  id v3;

  -[CAMFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

}

- (void)performPressButtonFeedback:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CAMFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFeedbackController _activePairedFeedbackGenerators](self, "_activePairedFeedbackGenerators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMFeedbackController _debugStringForPairedFeedback:](self, "_debugStringForPairedFeedback:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Mismatched paired pressed feedback calls for %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v5, "userInteractionStarted");
    objc_msgSend(v6, "addObject:", v5);
  }

}

- (void)performReleaseButtonFeedback:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CAMFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFeedbackController _activePairedFeedbackGenerators](self, "_activePairedFeedbackGenerators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v5))
  {
    objc_msgSend(v5, "userInteractionEnded");
    objc_msgSend(v6, "removeObject:", v5);
  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMFeedbackController _debugStringForPairedFeedback:](self, "_debugStringForPairedFeedback:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Mismatched paired released feedback calls for %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (id)_feedbackGeneratorForDiscreteFeedback:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[CAMFeedbackController _burstCountFeedbackGenerator](self, "_burstCountFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[CAMFeedbackController _modeSelectionFeedbackGenerator](self, "_modeSelectionFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[CAMFeedbackController _shutterButtonLatchingOffFeedbackGenerator](self, "_shutterButtonLatchingOffFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[CAMFeedbackController _shutterButtonLatchingOnFeedbackGenerator](self, "_shutterButtonLatchingOnFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[CAMFeedbackController _shutterButtonMomentaryFeedbackGenerator](self, "_shutterButtonMomentaryFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_debugStringForPairedFeedback:(unint64_t)a3
{
  if (a3 > 2)
    return &stru_1EA3325A0;
  else
    return off_1EA328AF8[a3];
}

- (UISelectionFeedbackGenerator)_modeSelectionFeedbackGenerator
{
  return self->__modeSelectionFeedbackGenerator;
}

- (UISelectionFeedbackGenerator)_burstCountFeedbackGenerator
{
  return self->__burstCountFeedbackGenerator;
}

- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOnFeedbackGenerator
{
  return self->__shutterButtonLatchingOnFeedbackGenerator;
}

- (_UIButtonFeedbackGenerator)_shutterButtonLatchingOffFeedbackGenerator
{
  return self->__shutterButtonLatchingOffFeedbackGenerator;
}

- (_UIButtonFeedbackGenerator)_shutterButtonMomentaryFeedbackGenerator
{
  return self->__shutterButtonMomentaryFeedbackGenerator;
}

- (NSMutableSet)_activePairedFeedbackGenerators
{
  return self->__activePairedFeedbackGenerators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__shutterButtonMomentaryFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOffFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOnFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__burstCountFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__modeSelectionFeedbackGenerator, 0);
}

@end
