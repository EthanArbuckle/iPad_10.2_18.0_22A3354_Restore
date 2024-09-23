@implementation UIButton(CarPlaySupport)

- (void)cps_setBackgroundColor:()CarPlaySupport forState:
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  UIImage *v9;
  CGContextRef CurrentContext;
  CGRect rect;
  uint64_t v12;
  id location[2];
  id v14;
  CGSize v15;

  v14 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v12 = a4;
  CGRectMake_9();
  rect.origin.x = v4;
  rect.origin.y = v5;
  rect.size.width = v6;
  rect.size.height = v7;
  v15.width = v6;
  v15.height = v7;
  UIGraphicsBeginImageContext(v15);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(location[0]), "CGColor"));
  CGContextFillRect(CurrentContext, rect);
  v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  objc_msgSend(v14, "setBackgroundImage:forState:", v9, v12);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

@end
