@implementation UIView(ISCommonUI)

- (id)allSubviews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "allSubviews");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (void)performOnAllSubviews:()ISCommonUI
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v4[2](v4, a1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "performOnAllSubviews:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (uint64_t)centerHorizontallyInSuperview
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a1, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  objc_msgSend(a1, "frame");
  v12 = floor((v10 - v11) * 0.5);

  return objc_msgSend(a1, "setFrame:", v12, v3, v5, v7);
}

- (uint64_t)centerVerticallyInSuperview
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a1, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  objc_msgSend(a1, "frame");
  v12 = floor((v10 - v11) * 0.5);

  return objc_msgSend(a1, "setFrame:", v3, v12, v5, v7);
}

- (id)debugHighlight
{
  return objc_getAssociatedObject(a1, CurrentDebugHighlightKey);
}

- (void)setRandomDebugHighlight
{
  double v2;
  float v3;
  double v4;
  float v5;
  id v6;

  v2 = (float)((float)arc4random() * 0.0039062);
  v3 = (double)(arc4random() & 0x7F) * 0.00390625;
  v4 = (float)(v3 + 0.5);
  v5 = (double)(arc4random() & 0x7F) * 0.00390625;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v2, v4, (float)(v5 + 0.5), 1.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDebugHighlight:", v6);

}

- (void)setDebugHighlight:()ISCommonUI
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;

  v4 = a3;
  if (v4)
  {
    v27 = 1.0;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;

    objc_msgSend(a1, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, PreviousBackgroundColorKey, v8, (void *)0x301);

    v9 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(a1, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithCGColor:", objc_msgSend(v10, "borderColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, PreviousBorderColorKey, v11, (void *)0x301);

    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "borderWidth");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &PreviousBorderWidthKey, v14, (void *)0x301);

    objc_setAssociatedObject(a1, CurrentDebugHighlightKey, v4, (void *)0x301);
    if ((objc_msgSend(v4, "getRed:green:blue:alpha:", 0, 0, 0, &v27) & 1) == 0
      && (objc_msgSend(v4, "getWhite:alpha:", 0, &v27) & 1) == 0)
    {
      objc_msgSend(v4, "getHue:saturation:brightness:alpha:", 0, 0, 0, &v27);
    }
    objc_msgSend(v4, "colorWithAlphaComponent:", v27 * 0.25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v15);

    v16 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    objc_msgSend(a1, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderColor:", v16);

    objc_msgSend(a1, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderWidth:", 1.0 / v7);

  }
  else
  {
    objc_getAssociatedObject(a1, PreviousBackgroundColorKey);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v19);

    objc_getAssociatedObject(a1, PreviousBorderColorKey);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "CGColor");
    objc_msgSend(a1, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderColor:", v21);

    objc_getAssociatedObject(a1, &PreviousBorderWidthKey);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(a1, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderWidth:", v25);

    objc_setAssociatedObject(a1, PreviousBackgroundColorKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, PreviousBorderColorKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, &PreviousBorderWidthKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, CurrentDebugHighlightKey, 0, (void *)0x301);
  }

}

- (id)generateImage
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  char v6;
  CGContextRef CurrentContext;
  void *v8;
  void *v9;
  CGSize v11;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v6 = objc_msgSend(a1, "isOpaque");
  v11.width = v3;
  v11.height = v5;
  UIGraphicsBeginImageContextWithOptions(v11, v6, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderInContext:", CurrentContext);

  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v9;
}

- (id)addConstraintsToFillSuperview
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(a1, "translatesAutoresizingMaskIntoConstraints") & 1) != 0
    || (objc_msgSend(a1, "superview"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, !v2))
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    _NSDictionaryOfVariableBindings(CFSTR("self"), a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[self]|"), 0, 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[self]|"), 0, 0, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    objc_msgSend(a1, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v4);

    v8 = (void *)objc_msgSend(v4, "copy");
  }
  return v8;
}

- (id)addConstraintsToSetSize:()ISCommonUI
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "translatesAutoresizingMaskIntoConstraints") & 1) != 0
    || (objc_msgSend(a1, "superview"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    v15 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    _NSDictionaryOfVariableBindings(CFSTR("self"), a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("width");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("height");
    v18[0] = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[self(height)]"), 0, v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[self(width)]"), 0, v10, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

    objc_msgSend(a1, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addConstraints:", v11);

    v15 = (void *)objc_msgSend(v11, "copy");
  }
  return v15;
}

@end
