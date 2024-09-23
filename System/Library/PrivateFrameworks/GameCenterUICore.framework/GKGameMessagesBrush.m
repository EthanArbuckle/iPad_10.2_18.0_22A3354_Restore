@implementation GKGameMessagesBrush

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  id v11;
  id v12;
  CGImage *v13;
  id v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a5;
  CGContextSaveGState(a4);
  UIGraphicsPushContext(a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v14;
  else
    v10 = 0;
  v11 = v10;
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  v12 = objc_retainAutorelease(v11);
  v13 = (CGImage *)objc_msgSend(v12, "CGImage");

  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextDrawImage(a4, v15, v13);
  UIGraphicsPopContext();
  CGContextRestoreGState(a4);

}

@end
