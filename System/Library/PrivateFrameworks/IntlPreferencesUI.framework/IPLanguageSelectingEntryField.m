@implementation IPLanguageSelectingEntryField

- (void)setLanguage:(id)a3
{
  __CFString *v4;
  NSString *language;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("no")) & 1) != 0)
    v4 = CFSTR("nb");
  else
    v4 = (__CFString *)v6;
  language = self->_language;
  self->_language = &v4->isa;

}

- (id)_additionalTextInputLocales
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEA0];
  -[IPLanguageSelectingEntryField language](self, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textInputMode
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPLanguageSelectingEntryField language](self, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeLastUsedForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
}

@end
