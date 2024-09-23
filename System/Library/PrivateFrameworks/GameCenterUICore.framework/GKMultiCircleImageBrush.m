@implementation GKMultiCircleImageBrush

- (CGSize)sizeForInput:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  BOOL v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1 || ((v5 = 57.0, *MEMORY[0x24BE3A2C0]) ? (v6 = _GKIsRemoteUIUsingPadIdiom == 0) : (v6 = 0), v6))
    v5 = 42.0;
  v7 = v5;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  BOOL v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a5;
  if ((unint64_t)objc_msgSend(v19, "count") < 2)
  {
    objc_msgSend(v19, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "drawInRect:", x, y, width, height);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 != 1 || (*MEMORY[0x24BE3A2C0] ? (v12 = _GKIsRemoteUIUsingPadIdiom == 0) : (v12 = 0), v12))
      v13 = 26.0;
    else
      v13 = 40.0;
    objc_msgSend(v19, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "drawInRect:", x, y, v13, v13);

    CGContextSaveGState(a4);
    v16 = (void *)MEMORY[0x24BDF6870];
    v20.origin.x = x + 16.0;
    v20.origin.y = y + 16.0;
    v20.size.width = v13;
    v20.size.height = v13;
    v21 = CGRectInset(v20, -2.0, -2.0);
    objc_msgSend(v16, "bezierPathWithOvalInRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineWidth:", 2.0);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "set");

    CGContextSetBlendMode(a4, kCGBlendModeClear);
    objc_msgSend(v14, "fill");
    CGContextRestoreGState(a4);
    objc_msgSend(v19, "objectAtIndex:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "drawInRect:", x + 16.0, y + 16.0, v13, v13);

  }
}

@end
