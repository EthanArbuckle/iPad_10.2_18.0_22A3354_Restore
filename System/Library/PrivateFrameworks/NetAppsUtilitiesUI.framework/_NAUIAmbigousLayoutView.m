@implementation _NAUIAmbigousLayoutView

+ (void)installOnView:(id)a3 forVariable:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _NAUIAmbigousLayoutView *v27;
  _NAUIAmbigousLayoutView *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "valueForKey:", CFSTR("_boundsWidthVariable"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v14 = CFSTR(".Width");
  }
  else
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("_boundsHeightVariable"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
    {
      v14 = CFSTR(".Height");
    }
    else
    {
      objc_msgSend(v7, "valueForKey:", CFSTR("_minXVariable"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v6)
      {
        v14 = CFSTR(".minX");
      }
      else
      {
        objc_msgSend(v7, "valueForKey:", CFSTR("_minYVariable"));
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v6)
        {
          v14 = CFSTR(".minY");
        }
        else
        {
          objc_msgSend(v7, "valueForKey:", CFSTR("_contentWidthVariable"));
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v6)
          {
            v14 = CFSTR(".contentWidth");
          }
          else
          {
            objc_msgSend(v7, "valueForKey:", CFSTR("_contentHeightVariable"));
            v13 = (id)objc_claimAutoreleasedReturnValue();

            if (v13 == v6)
              v14 = CFSTR(".contentHeight");
            else
              v14 = 0;
          }
        }
      }
    }
  }

  v15 = v14;
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".Width")) & 1) != 0
    || -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".contentWidth")))
  {
    objc_msgSend(v7, "frame");
    v17 = v16;
    v18 = 0.0;
    v19 = -11.0;
    v20 = 10.0;
  }
  else
  {
    v18 = *MEMORY[0x24BDBF090];
    v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".Height")) & 1) != 0
    || -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".contentHeight")))
  {
    objc_msgSend(v7, "frame");
    if (v21 == 0.0)
    {
      objc_msgSend(v7, "bounds");
      v18 = v22 + 1.0;
    }
    else
    {
      v18 = -11.0;
    }
    objc_msgSend(v7, "bounds");
    v20 = v23;
    v19 = 0.0;
    v17 = 10.0;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".minX")))
  {
    objc_msgSend(v7, "bounds");
    v20 = v24;
    v19 = 0.0;
    v17 = 1.0;
    v18 = 0.0;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".minY")))
  {
    objc_msgSend(v7, "bounds");
    v17 = v25;
    v19 = 0.0;
    v20 = 1.0;
    v18 = 0.0;
  }
  if (_showAutolayoutIssues)
    objc_msgSend(v7, "exerciseAmbiguityInLayout");
  objc_getAssociatedObject(v7, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[_NAUIAmbigousLayoutView installOnView:forVariable:].cold.1((uint64_t)v7, (uint64_t)v6);
    v27 = -[_NAUIAmbigousLayoutView initWithFrame:]([_NAUIAmbigousLayoutView alloc], "initWithFrame:", v18, v19, v17, v20);
    v28 = v27;
    if (_showAutolayoutIssues)
    {
      -[_NAUIAmbigousLayoutView setOpaque:](v27, "setOpaque:", 0);
      objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NAUIAmbigousLayoutView setTintColor:](v28, "setTintColor:", v29);

      objc_msgSend(v7, "addSubview:", v28);
      objc_msgSend(v7, "setClipsToBounds:", 0);
    }
    objc_setAssociatedObject(v7, v15, v28, (void *)1);

  }
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  double Width;
  double Height;
  uint64_t v8;
  CGFloat MidX;
  double v13;
  CGFloat v14;
  CGFloat MidY;
  double v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[_NAUIAmbigousLayoutView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  -[_NAUIAmbigousLayoutView bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[_NAUIAmbigousLayoutView bounds](self, "bounds");
  Height = CGRectGetHeight(v19);
  -[_NAUIAmbigousLayoutView bounds](self, "bounds");
  if (Width <= Height)
  {
    v26.size.width = CGRectGetWidth(*(CGRect *)&v8);
    MidY = 0.0;
    v16 = 1.0;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.height = 1.0;
    CGContextFillRect(CurrentContext, v26);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v17 = CGRectGetMaxY(v27) + -1.0;
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v29.size.width = CGRectGetWidth(v28);
    v29.origin.x = 0.0;
    v29.size.height = 1.0;
    v29.origin.y = v17;
    CGContextFillRect(CurrentContext, v29);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    MidX = CGRectGetMidX(v30);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v13 = CGRectGetHeight(v31);
  }
  else
  {
    v20.size.height = CGRectGetHeight(*(CGRect *)&v8);
    MidX = 0.0;
    v13 = 1.0;
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = 1.0;
    CGContextFillRect(CurrentContext, v20);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v14 = CGRectGetMaxX(v21) + -1.0;
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v23.size.height = CGRectGetHeight(v22);
    v23.origin.y = 0.0;
    v23.size.width = 1.0;
    v23.origin.x = v14;
    CGContextFillRect(CurrentContext, v23);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    MidY = CGRectGetMidY(v24);
    -[_NAUIAmbigousLayoutView bounds](self, "bounds");
    v16 = CGRectGetWidth(v25);
  }
  v32.origin.x = MidX;
  v32.origin.y = MidY;
  v32.size.width = v16;
  v32.size.height = v13;
  CGContextFillRect(CurrentContext, v32);
}

+ (void)installOnView:(uint64_t)a1 forVariable:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_216CED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AMBIGUOUS LAYOUT: %@ - %@", (uint8_t *)&v2, 0x16u);
}

@end
