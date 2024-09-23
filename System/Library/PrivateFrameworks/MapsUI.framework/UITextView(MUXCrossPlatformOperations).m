@implementation UITextView(MUXCrossPlatformOperations)

+ (id)_mapsui_defaultTextView
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setEditable:", 0);
  objc_msgSend(v1, "setScrollEnabled:", 0);
  objc_msgSend(v1, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

  objc_msgSend(v1, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineFragmentPadding:", 0.0);

  return v1;
}

@end
