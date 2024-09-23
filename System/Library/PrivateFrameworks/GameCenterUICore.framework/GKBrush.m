@implementation GKBrush

+ (id)brush
{
  return objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (CGSize)sizeForInput:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)scaleForInput:(id)a3
{
  if (scaleForInput__onceToken != -1)
    dispatch_once(&scaleForInput__onceToken, &__block_literal_global_1);
  return *(double *)&scaleForInput__defaultScale;
}

void __25__GKBrush_scaleForInput___block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  scaleForInput__defaultScale = v0;

}

- (id)drawnImageForSize:(CGSize)a3 opaque:(BOOL)a4 input:(id)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  double v10;
  GKImageContext *v11;
  CGContext *v12;
  void *v13;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[GKBrush scaleForInput:](self, "scaleForInput:", v9);
  v11 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", v5, width, height, v10);
  v12 = -[GKImageContext CGContext](v11, "CGContext");
  UIGraphicsPushContext(v12);
  -[GKBrush drawInRect:withContext:input:](self, "drawInRect:withContext:input:", v12, v9, 0.0, 0.0, width, height);

  UIGraphicsPopContext();
  -[GKImageContext image](v11, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
