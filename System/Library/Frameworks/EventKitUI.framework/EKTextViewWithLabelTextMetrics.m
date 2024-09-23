@implementation EKTextViewWithLabelTextMetrics

- (EKTextViewWithLabelTextMetrics)initWithFrame:(CGRect)a3
{
  EKTextViewWithLabelTextMetrics *v3;
  EKTextViewWithLabelTextMetrics *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKTextViewWithLabelTextMetrics;
  v3 = -[EKTextViewWithLabelTextMetrics initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[EKTextViewWithLabelTextMetrics textLayoutManager](v3, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLimitsLayoutForSuspiciousContents:", 1);

    -[EKTextViewWithLabelTextMetrics setDataDetectorTypes:](v4, "setDataDetectorTypes:", 0);
    -[EKTextViewWithLabelTextMetrics setEditable:](v4, "setEditable:", 0);
    -[EKTextViewWithLabelTextMetrics setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[EKTextViewWithLabelTextMetrics setLineBreakMode:](v4, "setLineBreakMode:", 4);
    -[EKTextViewWithLabelTextMetrics setTextContainerInset:](v4, "setTextContainerInset:", 4.0, 0.0, 8.0, 0.0);
    -[EKTextViewWithLabelTextMetrics textContainer](v4, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  }
  return v4;
}

- (void)setURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKTextViewWithLabelTextMetrics setText:](self, "setText:", v4);

}

- (int64_t)numberOfLines
{
  return 0;
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height;
  double width;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[EKTextViewWithLabelTextMetrics text](self, "text", a4, a3.origin.x, a3.origin.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTextViewWithLabelTextMetrics font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v10, -[EKTextViewWithLabelTextMetrics lineBreakMode](self, "lineBreakMode"), width, height);
  v12 = v11;
  v14 = v13;

  v15 = round(v12);
  v16 = round(v14);
  v17 = v7;
  v18 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)lineBreakMode
{
  return self->lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->lineBreakMode = a3;
}

@end
