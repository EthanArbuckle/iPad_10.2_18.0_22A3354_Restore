@implementation UIImageView(INUICrossPlatform)

+ (id)_inui_imageViewWithImage:()INUICrossPlatform
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA658];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  return v5;
}

@end
