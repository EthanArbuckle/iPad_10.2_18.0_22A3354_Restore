@implementation CBLanguageComposite

- (NSDictionary)languageStrings
{
  return self->_languageStrings;
}

- (void)setLanguageStrings:(id)a3
{
  objc_storeStrong((id *)&self->_languageStrings, a3);
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (void)setLanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_languageCodes, a3);
}

- (BOOL)showLocalizedLanguageName
{
  return self->_showLocalizedLanguageName;
}

- (void)setShowLocalizedLanguageName:(BOOL)a3
{
  self->_showLocalizedLanguageName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
}

@end
