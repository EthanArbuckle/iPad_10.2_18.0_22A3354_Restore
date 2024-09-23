@implementation CFXFeedbackController

- (CFXFeedbackController)initWithShutterButton:(id)a3
{
  id v5;
  CFXFeedbackController *v6;
  CFXFeedbackController *v7;

  v5 = a3;
  v6 = -[CFXFeedbackController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shutterButton, a3);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", v7, sel_shutterButtonDown_, 1);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", v7, sel_shutterButtonUp_, 64);
    -[CFXFeedbackController setFeedbackToPerform:](v7, "setFeedbackToPerform:", -[CFXFeedbackController shutterButtonFeedbackForCurrentConfiguration](v7, "shutterButtonFeedbackForCurrentConfiguration"));
    -[CFXFeedbackController prepareButtonFeedback:](v7, "prepareButtonFeedback:", -[CFXFeedbackController feedbackToPerform](v7, "feedbackToPerform"));
  }

  return v7;
}

- (void)shutterButtonDown:(id)a3
{
  -[CFXFeedbackController setFeedbackToPerform:](self, "setFeedbackToPerform:", -[CFXFeedbackController shutterButtonFeedbackForCurrentConfiguration](self, "shutterButtonFeedbackForCurrentConfiguration", a3));
  -[CFXFeedbackController performPressButtonFeedback:](self, "performPressButtonFeedback:", -[CFXFeedbackController feedbackToPerform](self, "feedbackToPerform"));
}

- (void)shutterButtonUp:(id)a3
{
  -[CFXFeedbackController performReleaseButtonFeedback:](self, "performReleaseButtonFeedback:", -[CFXFeedbackController feedbackToPerform](self, "feedbackToPerform", a3));
  -[CFXFeedbackController setFeedbackToPerform:](self, "setFeedbackToPerform:", -[CFXFeedbackController shutterButtonFeedbackForCurrentConfiguration](self, "shutterButtonFeedbackForCurrentConfiguration"));
  -[CFXFeedbackController prepareButtonFeedback:](self, "prepareButtonFeedback:", -[CFXFeedbackController feedbackToPerform](self, "feedbackToPerform"));
}

- (unint64_t)shutterButtonFeedbackForCurrentConfiguration
{
  void *v2;
  uint64_t v3;

  -[CFXFeedbackController shutterButton](self, "shutterButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode");

  if (v3 == 6)
    return 2;
  else
    return v3 == 1;
}

- (CFXFeedbackController)init
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIButtonFeedbackGenerator *v9;
  _UIButtonFeedbackGenerator *shutterButtonMomentaryFeedbackGenerator;
  void *v11;
  void *v12;
  _UIButtonFeedbackGenerator *v13;
  _UIButtonFeedbackGenerator *shutterButtonLatchingOnFeedbackGenerator;
  void *v15;
  void *v16;
  _UIButtonFeedbackGenerator *v17;
  _UIButtonFeedbackGenerator *shutterButtonLatchingOffFeedbackGenerator;
  NSMutableSet *v19;
  NSMutableSet *activePairedFeedbackGenerators;
  CFXFeedbackController *v21;
  objc_super v23;

  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowHaptics");

  if (v4
    && (v23.receiver = self,
        v23.super_class = (Class)CFXFeedbackController,
        (self = -[CFXFeedbackController init](&v23, sel_init)) != 0))
  {
    objc_msgSend(MEMORY[0x24BDF7098], "feedbackWithDictionaryRepresentation:", &unk_24EE9C5F8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF7098], "feedbackWithDictionaryRepresentation:", &unk_24EE9C648);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF7048], "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tweakedConfigurationForCaller:usage:", self, CFSTR("shutterButtonMomentary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setInteractionStartedFeedback:", v5);
    objc_msgSend(v8, "setInteractionEndedFeedback:", v5);
    v9 = (_UIButtonFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7040]), "initWithConfiguration:", v8);
    shutterButtonMomentaryFeedbackGenerator = self->__shutterButtonMomentaryFeedbackGenerator;
    self->__shutterButtonMomentaryFeedbackGenerator = v9;

    -[_UIButtonFeedbackGenerator _setOutputMode:](self->__shutterButtonMomentaryFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x24BDF7048], "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tweakedConfigurationForCaller:usage:", self, CFSTR("shutterButtonLatchingOn"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setInteractionStartedFeedback:", v5);
    objc_msgSend(v12, "setInteractionEndedFeedback:", v6);
    v13 = (_UIButtonFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7040]), "initWithConfiguration:", v12);
    shutterButtonLatchingOnFeedbackGenerator = self->__shutterButtonLatchingOnFeedbackGenerator;
    self->__shutterButtonLatchingOnFeedbackGenerator = v13;

    -[_UIButtonFeedbackGenerator _setOutputMode:](self->__shutterButtonLatchingOnFeedbackGenerator, "_setOutputMode:", 5);
    objc_msgSend(MEMORY[0x24BDF7048], "defaultConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tweakedConfigurationForCaller:usage:", self, CFSTR("shutterButtonLatchingOff"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setInteractionStartedFeedback:", v6);
    objc_msgSend(v16, "setInteractionEndedFeedback:", v5);
    v17 = (_UIButtonFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7040]), "initWithConfiguration:", v16);
    shutterButtonLatchingOffFeedbackGenerator = self->__shutterButtonLatchingOffFeedbackGenerator;
    self->__shutterButtonLatchingOffFeedbackGenerator = v17;

    -[_UIButtonFeedbackGenerator _setOutputMode:](self->__shutterButtonLatchingOffFeedbackGenerator, "_setOutputMode:", 5);
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activePairedFeedbackGenerators = self->__activePairedFeedbackGenerators;
    self->__activePairedFeedbackGenerators = v19;

    self = self;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)prepareButtonFeedback:(unint64_t)a3
{
  id v3;

  -[CFXFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

}

- (void)performPressButtonFeedback:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;

  -[CFXFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFeedbackController _activePairedFeedbackGenerators](self, "_activePairedFeedbackGenerators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
  {
    CFXLog_DebugFeedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CFXFeedbackController performPressButtonFeedback:].cold.1(self, a3);

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

  -[CFXFeedbackController _feedbackGeneratorForPairedFeedback:](self, "_feedbackGeneratorForPairedFeedback:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFeedbackController _activePairedFeedbackGenerators](self, "_activePairedFeedbackGenerators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v5))
  {
    objc_msgSend(v5, "userInteractionEnded");
    objc_msgSend(v6, "removeObject:", v5);
  }
  else
  {
    CFXLog_DebugFeedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CFXFeedbackController performReleaseButtonFeedback:].cold.1(self, a3);

  }
}

- (id)_feedbackGeneratorForPairedFeedback:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[CFXFeedbackController _shutterButtonLatchingOffFeedbackGenerator](self, "_shutterButtonLatchingOffFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[CFXFeedbackController _shutterButtonLatchingOnFeedbackGenerator](self, "_shutterButtonLatchingOnFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[CFXFeedbackController _shutterButtonMomentaryFeedbackGenerator](self, "_shutterButtonMomentaryFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_debugStringForPairedFeedback:(unint64_t)a3
{
  if (a3 > 2)
    return &stru_24EE5C428;
  else
    return off_24EE5B250[a3];
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

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (unint64_t)feedbackToPerform
{
  return self->_feedbackToPerform;
}

- (void)setFeedbackToPerform:(unint64_t)a3
{
  self->_feedbackToPerform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->__activePairedFeedbackGenerators, 0);
  objc_storeStrong((id *)&self->__shutterButtonMomentaryFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOffFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__shutterButtonLatchingOnFeedbackGenerator, 0);
}

- (void)performPressButtonFeedback:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "_debugStringForPairedFeedback:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Mismatched paired pressed feedback calls for %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)performReleaseButtonFeedback:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "_debugStringForPairedFeedback:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Mismatched paired released feedback calls for %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

@end
