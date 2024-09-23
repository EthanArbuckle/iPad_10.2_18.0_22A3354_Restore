@implementation SFAutoFillInputView

id __83___SFAutoFillInputView_initWithHostString_credentialSource_suggestion_customTitle___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.314, 0.333, 0.36, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
