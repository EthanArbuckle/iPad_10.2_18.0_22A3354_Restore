@implementation GridVisualizationView

- (GridVisualizationView)initWithFrame:(CGRect)a3
{
  GridVisualizationView *v3;
  GridVisualizationView *v4;
  GridVisualizationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GridVisualizationView;
  v3 = -[GridVisualizationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[GridVisualizationView setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 1);
    v5 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[5];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41[3] = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  CGContextClearRect(CurrentContext, v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v9 = vcvtpd_s64_f64(CGRectGetMinX(v43) / 100.0);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v10 = vcvtmd_s64_f64(CGRectGetMaxX(v44) / 100.0);
  objc_msgSend(v8, "setStroke");
  v34 = v9;
  v32 = v10;
  if (v9 <= v10)
  {
    v11 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      objc_msgSend(v12, "moveToPoint:", (double)v11 * 100.0, CGRectGetMinY(v45));
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      objc_msgSend(v12, "addLineToPoint:", (double)v11 * 100.0, CGRectGetMaxY(v46));
      objc_msgSend(v12, "stroke");

      ++v11;
    }
    while (v10 + 1 != v11);
  }
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v13 = vcvtpd_s64_f64(CGRectGetMinY(v47) / 100.0);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v14 = vcvtmd_s64_f64(CGRectGetMaxY(v48) / 100.0);
  objc_msgSend(v36, "setStroke");
  v33 = v13;
  v31 = v14;
  if (v13 <= v14)
  {
    v15 = v13;
    do
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      objc_msgSend(v16, "moveToPoint:", CGRectGetMinX(v49), (double)v15 * 100.0);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v50), (double)v15 * 100.0);
      objc_msgSend(v16, "stroke");

      ++v15;
    }
    while (v14 + 1 != v15);
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1440]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(v18, "setShadowBlurRadius:", 1.0);
  objc_msgSend(v18, "setShadowOffset:", 1.0, 1.0);
  if (v34 <= v32)
  {
    v19 = *MEMORY[0x1E0DC1140];
    v20 = *MEMORY[0x1E0DC1138];
    v21 = *MEMORY[0x1E0DC1198];
    v22 = 0x1E0CB3000uLL;
    v35 = v8;
    do
    {
      if (v33 <= v31)
      {
        v23 = v33;
        v24 = (double)v34 * 100.0;
        do
        {
          v25 = (double)v23 * 100.0;
          v40[0] = v19;
          v40[1] = v20;
          v41[0] = v8;
          v41[1] = v17;
          v40[2] = v21;
          v41[2] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v22 + 2368), "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "drawAtPoint:withAttributes:", v37, v24 + 2.0, v25 + -12.0 + -2.0);

          v38[0] = v19;
          v38[1] = v20;
          v39[0] = v36;
          v39[1] = v17;
          v38[2] = v21;
          v39[2] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sizeWithAttributes:", v27);
          objc_msgSend(v28, "drawAtPoint:withAttributes:", v27, v24 - v29 + -2.0, v25 + 2.0);

          v22 = 0x1E0CB3000;
          v8 = v35;
          ++v23;
        }
        while (v31 + 1 != v23);
      }
    }
    while (v34++ != v32);
  }

}

@end
