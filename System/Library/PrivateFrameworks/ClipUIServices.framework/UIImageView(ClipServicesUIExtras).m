@implementation UIImageView(ClipServicesUIExtras)

+ (id)cps_imageViewWithImage:()ClipServicesUIExtras tintColor:backgroundColor:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([a1 alloc], "initWithImage:", v10);

  objc_msgSend(v11, "setBackgroundColor:", v8);
  objc_msgSend(v11, "setClipsToBounds:", 1);
  objc_msgSend(v11, "setContentMode:", 2);
  objc_msgSend(v11, "setTintColor:", v9);

  return v11;
}

@end
