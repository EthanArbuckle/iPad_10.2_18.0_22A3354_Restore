@implementation GKComposedImageBrush

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKComposedImageBrush;
  v4 = -[GKThemeBrush copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[GKComposedImageBrush maskImage](self, "maskImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskImage:", v5);

  -[GKComposedImageBrush backgroundImage](self, "backgroundImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundImage:", v6);

  -[GKComposedImageBrush overlayImage](self, "overlayImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayImage:", v7);

  -[GKComposedImageBrush maskInsets](self, "maskInsets");
  objc_msgSend(v4, "setMaskInsets:");
  return v4;
}

- (CGSize)sizeForInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[GKComposedImageBrush maskImage](self, "maskImage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (self.maskImage != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKComposedImageBrush sizeForInput:]", objc_msgSend(v8, "UTF8String"), 413);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  -[GKComposedImageBrush maskImage](self, "maskImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)scaleForInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[GKComposedImageBrush maskImage](self, "maskImage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (self.maskImage != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKComposedImageBrush scaleForInput:]", objc_msgSend(v8, "UTF8String"), 419);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  -[GKComposedImageBrush maskImage](self, "maskImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  return v12;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CGImage *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGImage *v25;
  CGImage *v26;
  objc_class *v27;
  const char *Name;
  CGImage *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = a5;
  -[GKComposedImageBrush backgroundImage](self, "backgroundImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposedImageBrush maskImage](self, "maskImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposedImageBrush overlayImage](self, "overlayImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v30;
  else
    v14 = 0;
  v15 = v14;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  if (v11)
  {
    v16 = (CGImage *)objc_msgSend(objc_retainAutorelease(v11), "CGImage");
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    CGContextDrawImage(a4, v31, v16);
  }
  if (v15)
  {
    -[GKComposedImageBrush maskInsets](self, "maskInsets");
    v18 = x + v17;
    v20 = y + v19;
    v22 = width - (v17 + v21);
    v24 = height - (v19 + v23);
    CGContextSaveGState(a4);
    v25 = (CGImage *)objc_msgSend(objc_retainAutorelease(v12), "CGImage");
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    CGContextClipToMask(a4, v32, v25);
    v26 = (CGImage *)objc_msgSend(objc_retainAutorelease(v15), "CGImage");
    v33.origin.x = v18;
    v33.origin.y = v20;
    v33.size.width = v22;
    v33.size.height = v24;
    CGContextDrawImage(a4, v33, v26);
    CGContextRestoreGState(a4);
    if (annotateOnceToken != -1)
      dispatch_once(&annotateOnceToken, &__block_literal_global_155);
    if (shouldAnnotateImageUsage)
    {
      v27 = (objc_class *)objc_opt_class();
      Name = class_getName(v27);
      _annotateDrawInRectWithContextAndInput((uint64_t)Name, a4, v30, v18, v20, v22, v24);
    }
  }
  if (v13)
  {
    v29 = (CGImage *)objc_msgSend(objc_retainAutorelease(v13), "CGImage");
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    CGContextDrawImage(a4, v34, v29);
  }
  CGContextRestoreGState(a4);

}

void __53__GKComposedImageBrush_drawInRect_withContext_input___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldAnnotateImageUsage = objc_msgSend(v0, "shouldAnnotateImageUsage");

}

- (UIImage)maskImage
{
  return self->_maskImage;
}

- (void)setMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_maskImage, a3);
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (void)setOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_overlayImage, a3);
}

- (UIEdgeInsets)maskInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_maskInsets.top;
  left = self->_maskInsets.left;
  bottom = self->_maskInsets.bottom;
  right = self->_maskInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMaskInsets:(UIEdgeInsets)a3
{
  self->_maskInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
}

@end
