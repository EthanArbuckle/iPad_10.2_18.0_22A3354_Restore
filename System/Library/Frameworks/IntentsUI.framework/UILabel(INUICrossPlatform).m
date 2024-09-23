@implementation UILabel(INUICrossPlatform)

+ (id)_inui_labelWithText:()INUICrossPlatform
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA700];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_inui_setText:", v4);

  return v5;
}

@end
