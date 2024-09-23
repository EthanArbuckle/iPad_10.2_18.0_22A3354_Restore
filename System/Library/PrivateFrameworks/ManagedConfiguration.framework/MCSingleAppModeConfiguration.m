@implementation MCSingleAppModeConfiguration

- (id)serializedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowSpellCheck](self, "allowSpellCheck"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allowSpellCheck"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowDefinitionLookup](self, "allowDefinitionLookup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("allowDefinitionLookup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowSelectedTextSharing](self, "allowSelectedTextSharing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("allowSelectedTextSharing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowAutoCorrection](self, "allowAutoCorrection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("allowAutoCorrection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowPredictiveKeyboard](self, "allowPredictiveKeyboard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("allowPredictiveKeyboard"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowKeyboardShortcuts](self, "allowKeyboardShortcuts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("allowKeyboardShortcuts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowActivityContinuation](self, "allowActivityContinuation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("allowActivityContinuation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowDictation](self, "allowDictation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("allowDictation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowScreenShot](self, "allowScreenShot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("allowScreenShot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowSmartPunctuation](self, "allowSmartPunctuation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("allowSmartPunctuation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowAccessibilitySpeech](self, "allowAccessibilitySpeech"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("allowAccessibilitySpeech"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowPasswordAutoFill](self, "allowPasswordAutoFill"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("allowPasswordAutoFill"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowContinuousPathKeyboard](self, "allowContinuousPathKeyboard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("allowContinuousPathKeyboard"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowTranslationLookup](self, "allowTranslationLookup"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("allowTranslationLookup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCSingleAppModeConfiguration allowQuickNote](self, "allowQuickNote"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("allowQuickNote"));

  return v3;
}

- (BOOL)allowSmartPuncutation
{
  return self->_allowSmartPunctuation;
}

- (void)setAllowSmartPuncutation:(BOOL)a3
{
  self->_allowSmartPunctuation = a3;
}

- (BOOL)allowSpellCheck
{
  return self->_allowSpellCheck;
}

- (void)setAllowSpellCheck:(BOOL)a3
{
  self->_allowSpellCheck = a3;
}

- (BOOL)allowDefinitionLookup
{
  return self->_allowDefinitionLookup;
}

- (void)setAllowDefinitionLookup:(BOOL)a3
{
  self->_allowDefinitionLookup = a3;
}

- (BOOL)allowSelectedTextSharing
{
  return self->_allowSelectedTextSharing;
}

- (void)setAllowSelectedTextSharing:(BOOL)a3
{
  self->_allowSelectedTextSharing = a3;
}

- (BOOL)allowAutoCorrection
{
  return self->_allowAutoCorrection;
}

- (void)setAllowAutoCorrection:(BOOL)a3
{
  self->_allowAutoCorrection = a3;
}

- (BOOL)allowPredictiveKeyboard
{
  return self->_allowPredictiveKeyboard;
}

- (void)setAllowPredictiveKeyboard:(BOOL)a3
{
  self->_allowPredictiveKeyboard = a3;
}

- (BOOL)allowKeyboardShortcuts
{
  return self->_allowKeyboardShortcuts;
}

- (void)setAllowKeyboardShortcuts:(BOOL)a3
{
  self->_allowKeyboardShortcuts = a3;
}

- (BOOL)allowActivityContinuation
{
  return self->_allowActivityContinuation;
}

- (void)setAllowActivityContinuation:(BOOL)a3
{
  self->_allowActivityContinuation = a3;
}

- (BOOL)allowDictation
{
  return self->_allowDictation;
}

- (void)setAllowDictation:(BOOL)a3
{
  self->_allowDictation = a3;
}

- (BOOL)allowScreenShot
{
  return self->_allowScreenShot;
}

- (void)setAllowScreenShot:(BOOL)a3
{
  self->_allowScreenShot = a3;
}

- (BOOL)allowSmartPunctuation
{
  return self->_allowSmartPunctuation;
}

- (void)setAllowSmartPunctuation:(BOOL)a3
{
  self->_allowSmartPunctuation = a3;
}

- (BOOL)allowAccessibilitySpeech
{
  return self->_allowAccessibilitySpeech;
}

- (void)setAllowAccessibilitySpeech:(BOOL)a3
{
  self->_allowAccessibilitySpeech = a3;
}

- (BOOL)allowPasswordAutoFill
{
  return self->_allowPasswordAutoFill;
}

- (void)setAllowPasswordAutoFill:(BOOL)a3
{
  self->_allowPasswordAutoFill = a3;
}

- (BOOL)allowContinuousPathKeyboard
{
  return self->_allowContinuousPathKeyboard;
}

- (void)setAllowContinuousPathKeyboard:(BOOL)a3
{
  self->_allowContinuousPathKeyboard = a3;
}

- (BOOL)allowTranslationLookup
{
  return self->_allowTranslationLookup;
}

- (void)setAllowTranslationLookup:(BOOL)a3
{
  self->_allowTranslationLookup = a3;
}

- (BOOL)allowQuickNote
{
  return self->_allowQuickNote;
}

- (void)setAllowQuickNote:(BOOL)a3
{
  self->_allowQuickNote = a3;
}

@end
