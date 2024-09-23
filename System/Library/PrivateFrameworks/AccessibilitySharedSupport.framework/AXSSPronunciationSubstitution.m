@implementation AXSSPronunciationSubstitution

- (BOOL)isEqualToSubstitution:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSSPronunciationSubstitution originalString](self, "originalString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (void)setReplacementString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phonemes
{
  return self->_phonemes;
}

- (void)setPhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)voiceIds
{
  return self->_voiceIds;
}

- (void)setVoiceIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_replacementRange.length;
  location = self->_replacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (BOOL)appliesToAllApps
{
  return self->_appliesToAllApps;
}

- (void)setAppliesToAllApps:(BOOL)a3
{
  self->_appliesToAllApps = a3;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isUserSubstitution
{
  return self->_isUserSubstitution;
}

- (void)setIsUserSubstitution:(BOOL)a3
{
  self->_isUserSubstitution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_voiceIds, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_replacementString, 0);
  objc_storeStrong((id *)&self->_originalString, 0);
}

@end
