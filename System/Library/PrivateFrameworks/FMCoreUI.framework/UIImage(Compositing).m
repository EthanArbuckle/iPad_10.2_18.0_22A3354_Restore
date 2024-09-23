@implementation UIImage(Compositing)

+ (id)blankImageOfSize:()Compositing
{
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (blankImageOfSize__onceToken != -1)
    dispatch_once(&blankImageOfSize__onceToken, &__block_literal_global_0);
  objc_msgSend((id)blankImageOfSize__blankImageCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", a3, a4);
    objc_msgSend(v10, "imageWithActions:", &__block_literal_global_4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)blankImageOfSize__blankImageCache, "setObject:forKey:", v9, v8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImage+Compositing.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("retValue != nil"));

    }
  }

  return v9;
}

- (uint64_t)compositeImage:()Compositing
{
  return objc_msgSend(a1, "compositeImage:blendMode:alpha:", a3, 0, 1.0);
}

- (id)compositeImage:()Compositing blendMode:alpha:
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGContext *CurrentContext;
  void *v16;
  CGSize v18;

  v8 = a4;
  objc_msgSend(a1, "size");
  v10 = v9;
  objc_msgSend(a1, "size");
  v12 = v11;
  objc_msgSend(a1, "scale");
  v14 = v13;
  v18.width = v10;
  v18.height = v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetAllowsAntialiasing(CurrentContext, 1);
  CGContextSetShouldAntialias(CurrentContext, 1);
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v10, v12);
  objc_msgSend(v8, "drawInRect:blendMode:alpha:", a5, 0.0, 0.0, v10, v12, a2);

  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v16;
}

@end
