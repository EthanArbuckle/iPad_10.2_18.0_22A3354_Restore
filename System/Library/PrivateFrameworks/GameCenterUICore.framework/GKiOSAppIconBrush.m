@implementation GKiOSAppIconBrush

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  id v13;
  CGImage *v14;
  id v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  CGContextSaveGState(a4);
  UIGraphicsPushContext(a4);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, height * 0.225);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addClip");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  v13 = objc_retainAutorelease(v12);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGContextDrawImage(a4, v16, v14);
  UIGraphicsPopContext();
  CGContextRestoreGState(a4);

}

@end
