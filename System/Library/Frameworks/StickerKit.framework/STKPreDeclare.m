@implementation STKPreDeclare

+ (void)clearActiveKBForwardingInputDelegateAndResign:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearForwardingInputDelegateAndResign:", v3);

}

+ (void)setRestoresToEmojiInputMode
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRestoresToEmojiInputMode");

  }
}

+ (void)setAccessibilityName:(id)a3 forUISticker:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAccessibilityName:", v6);

}

+ (void)setSearchText:(id)a3 forUISticker:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSearchText:", v6);

}

+ (id)createEmojiStrikeWithImage:(CGImage *)a3 metadata:(id)a4
{
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_initWithImage_imageProperties_);
  v7 = objc_alloc(MEMORY[0x24BDC4C00]);
  if (v6)
    v8 = objc_msgSend(v7, "initWithImage:imageProperties:", a3, v5);
  else
    v8 = objc_msgSend(v7, "initWithImage:alignmentInset:", a3, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v9 = (void *)v8;

  return v9;
}

@end
