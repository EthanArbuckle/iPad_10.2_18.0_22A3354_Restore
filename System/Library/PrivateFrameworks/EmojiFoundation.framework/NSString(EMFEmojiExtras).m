@implementation NSString(EMFEmojiExtras)

- (BOOL)_containsEmoji
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "_emojiCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_isSingleEmoji
{
  return CEMStringIsSingleEmoji() != 0;
}

- (void)_enumerateEmojiTokensInRange:()EMFEmojiExtras block:
{
  id v5;
  void *v6;
  id v7;

  v5 = a5;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    CEMEnumerateEmojiTokensInStringWithBlock();

  }
}

@end
