@implementation UILabel

- (CGRect)imageGlyphBoundingFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  -[UILabel bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _defaultAttributes](self, "_defaultAttributes"));
  objc_msgSend(v3, "boundingRectWithSize:options:attributes:context:", 8, v8, 0, v5, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[UILabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
  v18 = v17 - v12 - v16;
  v19 = v10;
  v20 = v14;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

@end
