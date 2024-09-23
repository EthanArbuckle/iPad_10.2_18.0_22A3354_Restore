@implementation UIImage(NTKRoundedCornerOverlayView)

+ (uint64_t)newImageForScreenCorner:()NTKRoundedCornerOverlayView screenScale:cornerRadius:
{
  double v8;
  void *v9;
  void *v10;
  CGContext *CurrentContext;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  CGSize v17;

  v8 = ceil(a2 * 1.528665 * a1) / a1;
  v17.width = v8 + 0.5;
  v17.height = v8 + 0.5;
  UIGraphicsBeginImageContextWithOptions(v17, 0, a1);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, v8 + 0.5, v8 + 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fill");

  CurrentContext = UIGraphicsGetCurrentContext();
  switch(a5)
  {
    case 1:
      v12 = -0.5;
      goto LABEL_4;
    case 2:
      v12 = -0.5 - v8;
LABEL_4:
      v13 = -0.5;
      goto LABEL_7;
    case 4:
      v12 = -0.5;
      v13 = -0.5 - v8;
      goto LABEL_7;
    case 8:
      v12 = -0.5 - v8;
      v13 = -0.5 - v8;
LABEL_7:
      CGContextTranslateCTM(CurrentContext, v12, v13);
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 1.0, 1.0, v8 + v8, v8 + v8, a2 + -1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineWidth:", 1.0);
  objc_msgSend(v14, "fillWithBlendMode:alpha:", 16, 1.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v15;
}

@end
