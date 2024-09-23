@implementation UIFont(UIFont_JFXAdditions)

+ (id)jfx_fontWithName:()UIFont_JFXAdditions
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = a3;
  objc_msgSend(v3, "systemFontSize");
  v6 = v5;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR(".")))
    objc_msgSend(MEMORY[0x24BDF6A70], "pv_fontWithName:size:transform:", v4, 0, v6);
  else
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
