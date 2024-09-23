@implementation AXEmojiConversionCandidateElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return self->_candidateString;
}

- (id)candidateEmojiArray
{
  void *v2;
  void *v3;
  void *v4;

  -[AXEmojiConversionCandidateElement candidateEmojiList](self, "candidateEmojiList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("emojiTokenArray"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("string"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("emoji.replace.with.single"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("emoji.replace.with.multiple"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  uint64_t v4;
  CKMessageEntryTextViewAccessibility *textView;

  -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  textView = self->_textView;
  if (v4 == 1)
  {
    -[CKMessageEntryTextViewAccessibility _axReplaceEmojiWithElement:](textView, "_axReplaceEmojiWithElement:", self);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self->_textView);
  }
  else
  {
    -[CKMessageEntryTextViewAccessibility _axShowOverlayWithEmojiElement:](textView, "_axShowOverlayWithEmojiElement:", self);
  }
  return 1;
}

- (id)currentEmoji
{
  unint64_t currentIndex;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  currentIndex = self->_currentIndex;
  -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (currentIndex >= v5)
  {
    v7 = 0;
  }
  else
  {
    -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", self->_currentIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)selectEmoji:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[AXEmojiConversionCandidateElement candidateEmojiArray](self, "candidateEmojiArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    self->_currentIndex = v6;
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (CKMessageEntryTextViewAccessibility)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSString)candidateString
{
  return self->_candidateString;
}

- (void)setCandidateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_NSRange)candidateRange
{
  _NSRange *p_candidateRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_candidateRange = &self->_candidateRange;
  location = self->_candidateRange.location;
  length = p_candidateRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCandidateRange:(_NSRange)a3
{
  self->_candidateRange = a3;
}

- (id)candidateEmojiList
{
  return self->_candidateEmojiList;
}

- (void)setCandidateEmojiList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)conversionLanguage
{
  return self->_conversionLanguage;
}

- (void)setConversionLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionLanguage, 0);
  objc_storeStrong(&self->_candidateEmojiList, 0);
  objc_storeStrong((id *)&self->_candidateString, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
