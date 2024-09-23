@implementation ISHintedRect

- (void)addHintedRect:(CGRect)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  objc_super v8;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ISHintedRect;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);

}

- (CGRect)hintedRectForSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[ISHintedRect hintedRectForSize:options:](self, "hintedRectForSize:options:", -[ISHintedValue options](self, "options"), a3.width, a3.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)hintedRectForSize:(CGSize)a3 options:(unint64_t)a4
{
  char v4;
  double height;
  double width;
  int64_t v8;
  void *v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectValue");
  x = v10;
  y = v12;
  v15 = v14;
  v17 = v16;
  if ((v4 & 1) != 0)
  {
    if (-[ISHintedValue sizeOutsideHintedRange:](self, "sizeOutsideHintedRange:", width, height))
    {
      -[ISHintedValue scaleFactorForSize:](self, "scaleFactorForSize:", width, height);
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeScale(&v43, v18, v18);
      v42 = v43;
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = v15;
      v44.size.height = v17;
      v45 = CGRectApplyAffineTransform(v44, &v42);
      x = v45.origin.x;
      y = v45.origin.y;
      v15 = v45.size.width;
      v17 = v45.size.height;
    }
    else
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      v20 = v19;
      -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v8 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rectValue");
      x = v22 + (x - v22) * v20;
      y = v23 + (y - v23) * v20;
      v15 = v24 + (v15 - v24) * v20;
      v17 = v25 + (v17 - v25) * v20;

    }
  }
  v26 = round(x);
  v27 = round(y);
  v28 = round(v15);
  v29 = round(v17);
  if ((v4 & 2) == 0)
  {
    v29 = v17;
    v28 = v15;
    v27 = y;
    v26 = x;
  }
  v30 = round(x + x) * 0.5;
  v31 = round(y + y) * 0.5;
  v32 = round(v15 + v15) * 0.5;
  v33 = round(v17 + v17);
  if ((v4 & 4) != 0)
    v34 = v33 * 0.5;
  else
    v34 = v29;
  if ((v4 & 4) != 0)
    v35 = v32;
  else
    v35 = v28;
  if ((v4 & 4) != 0)
    v36 = v31;
  else
    v36 = v27;
  if ((v4 & 4) != 0)
    v37 = v30;
  else
    v37 = v26;

  v38 = v37;
  v39 = v36;
  v40 = v35;
  v41 = v34;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

@end
