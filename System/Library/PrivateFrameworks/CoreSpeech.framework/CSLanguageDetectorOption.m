@implementation CSLanguageDetectorOption

- (id)languageDetectorRequestContext
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x1E0D1F148]);
  -[CSLanguageDetectorOption dictationLanguages](self, "dictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDictationLanguages:", v4);

  -[CSLanguageDetectorOption currentKeyboard](self, "currentKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentDictationLanguage:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSLanguageDetectorOption wasLanguageToggled](self, "wasLanguageToggled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWasLanguageToggled:", v6);

  -[CSLanguageDetectorOption multilingualKeyboardLanguages](self, "multilingualKeyboardLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMultilingualKeyboardLanguages:", v7);

  -[CSLanguageDetectorOption keyboardConvoLanguagePriors](self, "keyboardConvoLanguagePriors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardConvoLanguagePriors:", v8);

  -[CSLanguageDetectorOption keyboardGlobalLanguagePriors](self, "keyboardGlobalLanguagePriors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardGlobalLanguagePriors:", v9);

  -[CSLanguageDetectorOption previousMessageLanguage](self, "previousMessageLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviousMessageLanguage:", v10);

  -[CSLanguageDetectorOption globalLastKeyboardUsed](self, "globalLastKeyboardUsed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlobalLastKeyboardUsed:", v11);

  -[CSLanguageDetectorOption dictationLanguagePriors](self, "dictationLanguagePriors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDictationLanguagePriors:", v12);

  -[CSLanguageDetectorOption conversationalMessages](self, "conversationalMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecentMessages:", v13);

  return v3;
}

- (float)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(float)a3
{
  self->_samplingRate = a3;
}

- (NSSet)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_dictationLanguages, a3);
}

- (NSString)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)setCurrentKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyboard, a3);
}

- (BOOL)wasLanguageToggled
{
  return self->_wasLanguageToggled;
}

- (void)setWasLanguageToggled:(BOOL)a3
{
  self->_wasLanguageToggled = a3;
}

- (NSArray)multilingualKeyboardLanguages
{
  return self->_multilingualKeyboardLanguages;
}

- (void)setMultilingualKeyboardLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualKeyboardLanguages, a3);
}

- (NSDictionary)keyboardConvoLanguagePriors
{
  return self->_keyboardConvoLanguagePriors;
}

- (void)setKeyboardConvoLanguagePriors:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConvoLanguagePriors, a3);
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, a3);
}

- (NSString)previousMessageLanguage
{
  return self->_previousMessageLanguage;
}

- (void)setPreviousMessageLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_previousMessageLanguage, a3);
}

- (NSString)globalLastKeyboardUsed
{
  return self->_globalLastKeyboardUsed;
}

- (void)setGlobalLastKeyboardUsed:(id)a3
{
  objc_storeStrong((id *)&self->_globalLastKeyboardUsed, a3);
}

- (NSDictionary)dictationLanguagePriors
{
  return self->_dictationLanguagePriors;
}

- (void)setDictationLanguagePriors:(id)a3
{
  objc_storeStrong((id *)&self->_dictationLanguagePriors, a3);
}

- (NSArray)conversationalMessages
{
  return self->_conversationalMessages;
}

- (void)setConversationalMessages:(id)a3
{
  objc_storeStrong((id *)&self->_conversationalMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationalMessages, 0);
  objc_storeStrong((id *)&self->_dictationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_globalLastKeyboardUsed, 0);
  objc_storeStrong((id *)&self->_previousMessageLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConvoLanguagePriors, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_currentKeyboard, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
}

@end
