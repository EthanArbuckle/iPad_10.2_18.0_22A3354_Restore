@implementation UIResponder(TextAlignment)

- (uint64_t)mf_textAlignmentForActiveInputLanguage
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "textInputMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryLanguage");
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryLanguage");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = 2 * (objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", v3) != 0);

  return v7;
}

@end
