@implementation CPSMultilineLabel

- (CPSMultilineLabel)initWithFrame:(CGRect)a3
{
  uint64_t v3;
  CPSMultilineLabelConfig *currentConfiguration;
  UIColor *v5;
  UIColor *textColor;
  id v7;
  uint64_t v8;
  UIView *baselineView;
  UILayoutGuide *v10;
  UILayoutGuide *textLayoutGuide;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *baselineViewTopAnchor;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *baselineViewBottomAnchor;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *textLayoutGuideLeadingConstraint;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *textLayoutGuideTrailingConstraint;
  double v20;
  CPSMultilineLabel *v22;
  id v23;
  id v24;
  id v25;
  NSLayoutYAxisAnchor *v26;
  id v27;
  NSLayoutYAxisAnchor *v28;
  id v29;
  NSLayoutXAxisAnchor *v30;
  id v31;
  NSLayoutXAxisAnchor *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NSLayoutYAxisAnchor *v37;
  id v38;
  id v39;
  NSLayoutYAxisAnchor *v40;
  id v41;
  id v42;
  NSLayoutXAxisAnchor *v43;
  NSLayoutConstraint *v44;
  NSLayoutDimension *v45;
  objc_super v46;
  SEL v47;
  CPSMultilineLabel *v48;
  CGRect v49;
  _QWORD v50[9];

  v50[8] = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v47 = a2;
  v48 = 0;
  v46.receiver = self;
  v46.super_class = (Class)CPSMultilineLabel;
  v48 = -[CPSMultilineLabel initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v48, v48);
  if (v48)
  {
    v3 = objc_opt_new();
    currentConfiguration = v48->_currentConfiguration;
    v48->_currentConfiguration = (CPSMultilineLabelConfig *)v3;

    v23 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[CPSMultilineLabel setBackgroundColor:](v48, "setBackgroundColor:");

    v5 = (UIColor *)(id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    textColor = v48->_textColor;
    v48->_textColor = v5;

    v48->_minimumScaleFactor = 1.0;
    v48->_minimumFontSize = -1.79769313e308;
    v48->_lineSpacing = -1.79769313e308;
    v7 = objc_alloc(MEMORY[0x24BDF6F90]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    baselineView = v48->_baselineView;
    v48->_baselineView = (UIView *)v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v48->_baselineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSMultilineLabel addSubview:](v48, "addSubview:", v48->_baselineView);
    v24 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[UIView setBackgroundColor:](v48->_baselineView, "setBackgroundColor:");

    v10 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    textLayoutGuide = v48->_textLayoutGuide;
    v48->_textLayoutGuide = v10;

    -[CPSMultilineLabel addLayoutGuide:](v48, "addLayoutGuide:", v48->_textLayoutGuide);
    v26 = -[UIView topAnchor](v48->_baselineView, "topAnchor");
    v25 = (id)-[CPSMultilineLabel topAnchor](v48, "topAnchor");
    v12 = (NSLayoutConstraint *)(id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v26, "constraintEqualToAnchor:");
    baselineViewTopAnchor = v48->_baselineViewTopAnchor;
    v48->_baselineViewTopAnchor = v12;

    v28 = -[UIView bottomAnchor](v48->_baselineView, "bottomAnchor");
    v27 = (id)-[CPSMultilineLabel bottomAnchor](v48, "bottomAnchor");
    v14 = (NSLayoutConstraint *)(id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v28, "constraintEqualToAnchor:");
    baselineViewBottomAnchor = v48->_baselineViewBottomAnchor;
    v48->_baselineViewBottomAnchor = v14;

    v30 = -[UILayoutGuide leadingAnchor](v48->_textLayoutGuide, "leadingAnchor");
    v29 = (id)-[CPSMultilineLabel leadingAnchor](v48, "leadingAnchor");
    v16 = (NSLayoutConstraint *)(id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v30, "constraintEqualToAnchor:");
    textLayoutGuideLeadingConstraint = v48->_textLayoutGuideLeadingConstraint;
    v48->_textLayoutGuideLeadingConstraint = v16;

    v32 = -[UILayoutGuide trailingAnchor](v48->_textLayoutGuide, "trailingAnchor");
    v31 = (id)-[CPSMultilineLabel trailingAnchor](v48, "trailingAnchor");
    v18 = (NSLayoutConstraint *)(id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v32, "constraintEqualToAnchor:");
    textLayoutGuideTrailingConstraint = v48->_textLayoutGuideTrailingConstraint;
    v48->_textLayoutGuideTrailingConstraint = v18;

    v33 = (void *)MEMORY[0x24BDD1628];
    v50[0] = v48->_baselineViewTopAnchor;
    v50[1] = v48->_baselineViewBottomAnchor;
    v45 = -[UIView widthAnchor](v48->_baselineView, "widthAnchor");
    v44 = -[NSLayoutDimension constraintEqualToConstant:](v45, "constraintEqualToConstant:", 0.0);
    v50[2] = v44;
    v43 = -[UIView leadingAnchor](v48->_baselineView, "leadingAnchor");
    v42 = (id)-[CPSMultilineLabel leadingAnchor](v48, "leadingAnchor");
    v41 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v43, "constraintEqualToAnchor:");
    v50[3] = v41;
    v50[4] = v48->_textLayoutGuideLeadingConstraint;
    v50[5] = v48->_textLayoutGuideTrailingConstraint;
    v40 = -[UILayoutGuide topAnchor](v48->_textLayoutGuide, "topAnchor");
    v39 = (id)-[CPSMultilineLabel topAnchor](v48, "topAnchor");
    v38 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v40, "constraintEqualToAnchor:");
    v50[6] = v38;
    v37 = -[UILayoutGuide bottomAnchor](v48->_textLayoutGuide, "bottomAnchor");
    v36 = (id)-[CPSMultilineLabel bottomAnchor](v48, "bottomAnchor");
    v35 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v37, "constraintEqualToAnchor:");
    v50[7] = v35;
    v34 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 8);
    objc_msgSend(v33, "activateConstraints:");

    -[CPSMultilineLabel setContentHuggingPriority:forAxis:](v48, "setContentHuggingPriority:forAxis:", 1);
    LODWORD(v20) = 1148846080;
    -[CPSMultilineLabel setContentHuggingPriority:forAxis:](v48, "setContentHuggingPriority:forAxis:", 0, v20);
  }
  v22 = v48;
  objc_storeStrong((id *)&v48, 0);
  return v22;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;
  SEL v4;
  CPSMultilineLabel *v5;
  CGRect v6;

  v6 = a3;
  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSMultilineLabel;
  -[CPSMultilineLabel setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CPSMultilineLabel _updateLayout](v5, "_updateLayout");
}

- (void)drawRect:(CGRect)a3
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  void *v8;
  uint64_t v9;
  id v10;
  CPSMultilineLabelDelegate *v11;
  id v12;
  CPSMultilineLabelConfig *v13;
  int v14;
  CPSMultilineLabelConfig *v15;
  unint64_t v16;
  CPSMultilineLabelConfig *v17;
  CPSMultilineLabelConfig *v18;
  id v19;
  CPSMultilineLabelConfig *v20;
  id v21;
  id v22;
  CPSMultilineLabelConfig *v23;
  id v24;
  NSAttributedString *v25;
  CPSMultilineLabelConfig *v26;
  _BOOL4 v27;
  id v28;
  id v29;
  unint64_t v30;
  id v31;
  id v32;
  CGContextRef v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  CGContextRef v37;
  id v38;
  _BOOL4 v39;
  id location;
  id v41;
  int i;
  id v43;
  id v44[5];
  unint64_t Count;
  CFArrayRef Lines;
  const __CTFrame *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  CGContextRef CurrentContext;
  id v53;
  CGContextRef v54;
  SEL v55;
  CPSMultilineLabel *v56;
  CGRect v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CFRange v63;

  v62 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v56 = self;
  v55 = a2;
  v3 = -[CPSMultilineLabel text](self, "text");
  v39 = v3 != 0;

  if (v39)
  {
    v53 = -[CPSMultilineLabel attributedText](v56, "attributedText");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextClearRect(CurrentContext, v57);
    CGContextSaveGState(CurrentContext);
    if (-[CPSMultilineLabel debug](v56, "debug"))
    {
      v37 = CurrentContext;
      v38 = (id)objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v38), "CGColor"));

      CGContextFillRect(CurrentContext, v57);
    }
    v33 = CurrentContext;
    -[CPSMultilineLabel bounds](v56, "bounds");
    v48 = v4;
    v49 = v5;
    v50 = v6;
    v51 = v7;
    CGContextTranslateCTM(CurrentContext, 0.0, v7);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v47 = -[CPSMultilineLabel _textFrame:rect:](v56, "_textFrame:rect:", v53, v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
    Lines = CTFrameGetLines(v47);
    Count = CFArrayGetCount(Lines);
    v44[4] = &v9;
    v34 = (16 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x24BDAC7A8]();
    v35 = (char *)&v9 - v34;
    v44[3] = v8;
    v59 = 0;
    v58 = 0;
    v60 = 0;
    v61 = 0;
    v44[1] = 0;
    v44[2] = 0;
    v63.location = 0;
    v63.length = 0;
    CTFrameGetLineOrigins(v47, v63, (CGPoint *)((char *)&v9 - v34));
    v36 = 0x24BDBC000uLL;
    v44[0] = (id)objc_opt_new();
    v43 = (id)objc_opt_new();
    for (i = 0; i < Count; ++i)
    {
      v28 = v44[0];
      v30 = 0x24BDD1000uLL;
      v29 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v35[16 * i]);
      objc_msgSend(v28, "addObject:");

      v31 = v43;
      v32 = (id)objc_msgSend(*(id *)(v30 + 1760), "numberWithDouble:", *(double *)&v35[16 * i + 8]);
      objc_msgSend(v31, "addObject:");

    }
    -[CPSMultilineLabel setBaselineOffsets:](v56, "setBaselineOffsets:", v43);
    -[CPSMultilineLabel setLeadingOffsets:](v56, "setLeadingOffsets:", v44[0]);
    CTFrameDraw(v47, CurrentContext);
    CFRelease(v47);
    CGContextRestoreGState(CurrentContext);
    -[CPSMultilineLabel _updateBaselines](v56, "_updateBaselines");
    -[CPSMultilineLabel _updateLayoutGuideConstraints](v56, "_updateLayoutGuideConstraints");
    v15 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    v41 = (id)-[CPSMultilineLabelConfig copy](v15, "copy");

    v16 = Count;
    v17 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    -[CPSMultilineLabelConfig setLineCount:](v17, "setLineCount:", v16);

    location = (id)objc_msgSend(v53, "attributesAtIndex:effectiveRange:", 0, 0);
    v19 = (id)objc_msgSend(location, "objectForKeyedSubscript:", *MEMORY[0x24BDC4C28]);
    v18 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    -[CPSMultilineLabelConfig setFont:](v18, "setFont:", v19);

    v21 = (id)objc_msgSend(v53, "string");
    v20 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    -[CPSMultilineLabelConfig setText:](v20, "setText:", v21);

    v22 = v53;
    v23 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    -[CPSMultilineLabelConfig setAttributedText:](v23, "setAttributedText:", v22);

    v26 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    v25 = -[CPSMultilineLabelConfig attributedText](v26, "attributedText");
    v24 = (id)objc_msgSend(v41, "attributedText");
    v27 = -[NSAttributedString isEqualToAttributedString:](v25, "isEqualToAttributedString:");

    if (!v27)
    {
      -[CPSMultilineLabel invalidateIntrinsicContentSize](v56, "invalidateIntrinsicContentSize");
      -[CPSMultilineLabel setNeedsLayout](v56, "setNeedsLayout");
    }
    v12 = v41;
    v13 = -[CPSMultilineLabel currentConfiguration](v56, "currentConfiguration");
    v14 = objc_msgSend(v12, "isEqualToLabelConfig:");

    if ((v14 & 1) == 0)
    {
      v11 = -[CPSMultilineLabel delegate](v56, "delegate");
      -[CPSMultilineLabelDelegate labelDidUpdateCurrentConfig:](v11, "labelDidUpdateCurrentConfig:", v56);

    }
    v10 = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v41, v10);
    objc_storeStrong(&v43, v10);
    objc_storeStrong(v44, v10);
    objc_storeStrong(&v53, v10);
  }
  else
  {
    v54 = UIGraphicsGetCurrentContext();
    CGContextClearRect(v54, v57);
    CGContextRestoreGState(v54);
  }
}

- (void)setText:(id)a3
{
  uint64_t v3;
  NSString *text;
  id location[2];
  CPSMultilineLabel *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v6->_text, "isEqualToString:", location[0]))
  {
    v3 = objc_msgSend(location[0], "copy");
    text = v6->_text;
    v6->_text = (NSString *)v3;

    -[CPSMultilineLabel _updateLayout](v6, "_updateLayout");
  }
  objc_storeStrong(location, 0);
}

- (void)setTextColor:(id)a3
{
  id location[2];
  CPSMultilineLabel *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[UIColor isEqual:](v4->_textColor, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_textColor, location[0]);
    -[CPSMultilineLabel _updateLayout](v4, "_updateLayout");
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)effectiveNumberOfLines
{
  if (-[CPSMultilineLabel numberOfLines](self, "numberOfLines"))
    return -[CPSMultilineLabel numberOfLines](self, "numberOfLines");
  else
    return -1;
}

- (NSAttributedString)attributedText
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[CPSMultilineLabel bounds](self, "bounds");
  return (NSAttributedString *)-[CPSMultilineLabel _attributedTextForRect:](self, "_attributedTextForRect:", v2, v3, v4, v5);
}

- (void)setDebug:(BOOL)a3
{
  id v3;
  UIView *v4;
  UIView *v5;
  id v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  id v10;
  double *v11;
  id v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSLayoutYAxisAnchor *v21;
  UIView *v22;
  NSLayoutConstraint *v23;
  NSLayoutDimension *v24;
  UIView *v25;
  id v26;
  id v27;
  NSLayoutXAxisAnchor *v28;
  UIView *v29;
  id v30;
  id v31;
  NSLayoutXAxisAnchor *v32;
  UIView *v33;
  id v34;
  id v35;
  NSLayoutYAxisAnchor *v36;
  UIView *v37;
  NSLayoutConstraint *v38;
  NSLayoutDimension *v39;
  UIView *v40;
  id v41;
  id v42;
  NSLayoutXAxisAnchor *v43;
  UIView *v44;
  id v45;
  id v46;
  NSLayoutXAxisAnchor *v47;
  UIView *v48;
  _QWORD v50[9];

  v50[8] = *MEMORY[0x24BDAC8D0];
  if (self->_debug != a3)
  {
    self->_debug = a3;
    if (a3)
    {
      v3 = objc_alloc(MEMORY[0x24BDF6F90]);
      v11 = (double *)MEMORY[0x24BDBF090];
      v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[CPSMultilineLabel setDebugFirstBaselineView:](self, "setDebugFirstBaselineView:");

      v7 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v8 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      -[CPSMultilineLabel addSubview:](self, "addSubview:");

      v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
      v9 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
      -[CPSMultilineLabel setDebugLastBaselineView:](self, "setDebugLastBaselineView:");

      v13 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v14 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      -[CPSMultilineLabel addSubview:](self, "addSubview:");

      v16 = (id)objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v15 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

      -[CPSMultilineLabel setNeedsDisplay](self, "setNeedsDisplay");
      v17 = (void *)MEMORY[0x24BDD1628];
      v48 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      v47 = -[UIView leadingAnchor](v48, "leadingAnchor");
      v46 = (id)-[CPSMultilineLabel leadingAnchor](self, "leadingAnchor");
      v45 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v47, "constraintEqualToAnchor:constant:");
      v50[0] = v45;
      v44 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      v43 = -[UIView trailingAnchor](v44, "trailingAnchor");
      v42 = (id)-[CPSMultilineLabel centerXAnchor](self, "centerXAnchor");
      v41 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v43, "constraintEqualToAnchor:constant:");
      v50[1] = v41;
      v40 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      v39 = -[UIView heightAnchor](v40, "heightAnchor");
      v38 = -[NSLayoutDimension constraintEqualToConstant:](v39, "constraintEqualToConstant:");
      v50[2] = v38;
      v37 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      v36 = -[UIView topAnchor](v37, "topAnchor");
      v35 = -[CPSMultilineLabel firstBaselineAnchor](self, "firstBaselineAnchor");
      v34 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v36, "constraintEqualToAnchor:");
      v50[3] = v34;
      v33 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      v32 = -[UIView leadingAnchor](v33, "leadingAnchor");
      v31 = (id)-[CPSMultilineLabel centerXAnchor](self, "centerXAnchor");
      v30 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v32, "constraintEqualToAnchor:constant:", -5.0);
      v50[4] = v30;
      v29 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      v28 = -[UIView trailingAnchor](v29, "trailingAnchor");
      v27 = (id)-[CPSMultilineLabel trailingAnchor](self, "trailingAnchor");
      v26 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v28, "constraintEqualToAnchor:constant:", 5.0);
      v50[5] = v26;
      v25 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      v24 = -[UIView heightAnchor](v25, "heightAnchor");
      v23 = -[NSLayoutDimension constraintEqualToConstant:](v24, "constraintEqualToConstant:", 1.0);
      v50[6] = v23;
      v22 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      v21 = -[UIView topAnchor](v22, "topAnchor");
      v20 = -[CPSMultilineLabel lastBaselineAnchor](self, "lastBaselineAnchor");
      v19 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v21, "constraintEqualToAnchor:");
      v50[7] = v19;
      v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 8);
      objc_msgSend(v17, "activateConstraints:");

    }
    else
    {
      v4 = -[CPSMultilineLabel debugFirstBaselineView](self, "debugFirstBaselineView");
      -[UIView removeFromSuperview](v4, "removeFromSuperview");

      v5 = -[CPSMultilineLabel debugLastBaselineView](self, "debugLastBaselineView");
      -[UIView removeFromSuperview](v5, "removeFromSuperview");

      -[CPSMultilineLabel setDebugFirstBaselineView:](self, "setDebugFirstBaselineView:");
      -[CPSMultilineLabel setDebugLastBaselineView:](self, "setDebugLastBaselineView:", 0);
    }
  }
}

- (id)firstBaselineAnchor
{
  UIView *v3;
  NSLayoutYAxisAnchor *v4;

  v3 = -[CPSMultilineLabel baselineView](self, "baselineView");
  v4 = -[UIView topAnchor](v3, "topAnchor");

  return v4;
}

- (id)lastBaselineAnchor
{
  UIView *v3;
  NSLayoutYAxisAnchor *v4;

  v3 = -[CPSMultilineLabel baselineView](self, "baselineView");
  v4 = -[UIView bottomAnchor](v3, "bottomAnchor");

  return v4;
}

- (CGSize)intrinsicContentSize
{
  NSAttributedString *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  CPSMultilineLabel *v14;
  NSAttributedString *v15;
  CPSMultilineLabelConfig *v16;
  NSAttributedString *v17;
  NSString *v18;
  BOOL v19;
  char v20;
  id v21;
  NSAttributedString *v22;
  uint64_t v23;
  SEL v24;
  CPSMultilineLabel *v25;
  CGSize result;

  v25 = self;
  v24 = a2;
  v23 = 0;
  v23 = *MEMORY[0x24BDF7FB8];
  v18 = -[CPSMultilineLabel text](self, "text");
  v19 = -[NSString length](v18, "length") == 0;

  if (!v19)
  {
    v16 = -[CPSMultilineLabel currentConfiguration](v25, "currentConfiguration");
    v17 = -[CPSMultilineLabelConfig attributedText](v16, "attributedText");
    v20 = 0;
    if (v17)
    {
      v2 = v17;
    }
    else
    {
      -[CPSMultilineLabel bounds](v25, "bounds");
      CGRectMake();
      v21 = -[CPSMultilineLabel _attributedTextForRect:](v25, "_attributedTextForRect:", v3, v4, v5, v6);
      v20 = 1;
      v2 = (NSAttributedString *)v21;
    }
    v22 = v2;
    if ((v20 & 1) != 0)

    v14 = v25;
    v15 = v22;
    -[CPSMultilineLabel bounds](v25, "bounds");
    -[CPSMultilineLabel _heightForAttributedString:inRect:](v14, "_heightForAttributedString:inRect:", v15, v7, v8, v9, v10);
    v23 = v11;
    objc_storeStrong((id *)&v22, 0);
  }
  CGSizeMake_1();
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSMultilineLabel *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSMultilineLabel;
  -[CPSMultilineLabel traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSMultilineLabel setNeedsDisplay](v5, "setNeedsDisplay");
  -[CPSMultilineLabel setNeedsLayout](v5, "setNeedsLayout");
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  CPSMultilineLabelConfig *v2;
  NSLayoutConstraint *v3;
  NSLayoutConstraint *v4;

  v2 = -[CPSMultilineLabel currentConfiguration](self, "currentConfiguration");
  -[CPSMultilineLabelConfig setAttributedText:](v2, "setAttributedText:", 0);

  -[CPSMultilineLabel setNeedsDisplay](self, "setNeedsDisplay");
  -[CPSMultilineLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v3 = -[CPSMultilineLabel baselineViewTopAnchor](self, "baselineViewTopAnchor");
  -[NSLayoutConstraint setActive:](v3, "setActive:", 0);

  v4 = -[CPSMultilineLabel baselineViewBottomAnchor](self, "baselineViewBottomAnchor");
  -[NSLayoutConstraint setActive:](v4, "setActive:", 0);

}

- (void)_updateBaselines
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSLayoutConstraint *v6;
  id v7;
  NSArray *v8;
  NSLayoutConstraint *v9;
  double v10;
  double v11;
  NSLayoutConstraint *v12;
  id v13;
  NSArray *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSArray *v17;
  BOOL v18;

  v15 = -[CPSMultilineLabel baselineViewTopAnchor](self, "baselineViewTopAnchor");
  -[NSLayoutConstraint setActive:](v15, "setActive:", 1);

  v16 = -[CPSMultilineLabel baselineViewBottomAnchor](self, "baselineViewBottomAnchor");
  -[NSLayoutConstraint setActive:](v16, "setActive:", 1);

  v17 = -[CPSMultilineLabel baselineOffsets](self, "baselineOffsets");
  v18 = -[NSArray count](v17, "count") == 0;

  if (v18)
  {
    v9 = -[CPSMultilineLabel baselineViewTopAnchor](self, "baselineViewTopAnchor");
    -[NSLayoutConstraint setConstant:](v9, "setConstant:", 0.0);

  }
  else
  {
    -[CPSMultilineLabel bounds](self, "bounds");
    v10 = v2;
    v14 = -[CPSMultilineLabel baselineOffsets](self, "baselineOffsets");
    v13 = -[NSArray firstObject](v14, "firstObject");
    objc_msgSend(v13, "doubleValue");
    v11 = v10 - v3;
    v12 = -[CPSMultilineLabel baselineViewTopAnchor](self, "baselineViewTopAnchor");
    -[NSLayoutConstraint setConstant:](v12, "setConstant:", v11);

  }
  v8 = -[CPSMultilineLabel baselineOffsets](self, "baselineOffsets");
  v7 = -[NSArray lastObject](v8, "lastObject");
  objc_msgSend(v7, "doubleValue");
  v5 = -v4;
  v6 = -[CPSMultilineLabel baselineViewBottomAnchor](self, "baselineViewBottomAnchor");
  -[NSLayoutConstraint setConstant:](v6, "setConstant:", v5);

}

- (void)_updateLayoutGuideConstraints
{
  NSLayoutConstraint *v2;
  double v3;
  NSLayoutConstraint *v4;
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  int v16;
  int v17;
  uint64_t v18;
  SEL v19;
  CPSMultilineLabel *v20;
  CGRect v21;

  v20 = self;
  v19 = a2;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0x7FEFFFFFFFFFFFFFLL;
  v7 = -[CPSMultilineLabel leadingOffsets](self, "leadingOffsets");
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __50__CPSMultilineLabel__updateLayoutGuideConstraints__block_invoke;
  v12 = &unk_24E26F7F8;
  v13 = &v14;
  -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v8);

  v6 = v15[3];
  -[CPSMultilineLabel bounds](v20, "bounds");
  if (v6 > CGRectGetWidth(v21))
    v15[3] = 0.0;
  v5 = v15[3];
  v4 = -[CPSMultilineLabel textLayoutGuideLeadingConstraint](v20, "textLayoutGuideLeadingConstraint");
  -[NSLayoutConstraint setConstant:](v4, "setConstant:", v5);

  v3 = -v15[3];
  v2 = -[CPSMultilineLabel textLayoutGuideTrailingConstraint](v20, "textLayoutGuideTrailingConstraint");
  -[NSLayoutConstraint setConstant:](v2, "setConstant:", v3);

  _Block_object_dispose(&v14, 8);
}

void __50__CPSMultilineLabel__updateLayoutGuideConstraints__block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  double v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_msgSend(location[0], "doubleValue");
  *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = fmin(v4, v2);
  objc_storeStrong(location, 0);
}

- (id)_attributedTextForRect:(CGRect)a3
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  double v12;
  id v13;
  id v14;
  id v16;
  BOOL v17;
  UIFont *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  id v24[2];
  CPSMultilineLabel *v25;
  CGRect v26;

  v26 = a3;
  v25 = self;
  v24[1] = (id)a2;
  v24[0] = -[CPSMultilineLabel _attributedStringWithSize:](self, "_attributedStringWithSize:");
  -[CPSMultilineLabel _heightForAttributedString:inRect:](v25, "_heightForAttributedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  v23 = v3;
  -[CPSMultilineLabel _statsForString:inRect:](v25, "_statsForString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  v22 = v4;
  -[CPSMultilineLabel minimumScaleFactor](v25, "minimumScaleFactor");
  if (v5 >= 1.0)
  {
    -[CPSMultilineLabel minimumFontSize](v25, "minimumFontSize");
    if (v12 > -1.79769313e308
      && !-[CPSMultilineLabel _fitsInHeight:numberOfLines:rect:](v25, "_fitsInHeight:numberOfLines:rect:", v22, v23, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height))
    {
      -[CPSMultilineLabel minimumFontSize](v25, "minimumFontSize");
      v13 = -[CPSMultilineLabel _attributedStringWithSize:](v25, "_attributedStringWithSize:");
      v14 = v24[0];
      v24[0] = v13;

    }
  }
  else
  {
    v18 = -[CPSMultilineLabel font](v25, "font");
    -[UIFont pointSize](v18, "pointSize");
    v19 = v6;

    v21 = v19;
    -[CPSMultilineLabel minimumScaleFactor](v25, "minimumScaleFactor");
    v20 = v19 * v7;
    while (1)
    {
      v17 = 0;
      if (!-[CPSMultilineLabel _fitsInHeight:numberOfLines:rect:](v25, "_fitsInHeight:numberOfLines:rect:", v22, v23, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height))v17 = v21 >= v20;
      if (!v17)
        break;
      v21 = v21 - 0.100000001;
      v8 = -[CPSMultilineLabel _attributedStringWithSize:](v25, "_attributedStringWithSize:", v21);
      v9 = v24[0];
      v24[0] = v8;

      -[CPSMultilineLabel _heightForAttributedString:inRect:](v25, "_heightForAttributedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      v23 = v10;
      -[CPSMultilineLabel _statsForString:inRect:](v25, "_statsForString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      v22 = v11;
    }
  }
  v16 = -[CPSMultilineLabel _ellipsedString:inRect:](v25, "_ellipsedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  objc_storeStrong(v24, 0);
  return v16;
}

- (id)_attributedStringWithSize:(double)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id *v8;
  CTParagraphStyleSetting *v9;
  size_t v10;
  id v12;
  NSString *v13;
  id v14;
  id *v15;
  id v16;
  const __CTParagraphStyle *v17;
  id *v18;
  unint64_t v19;
  unint64_t v20;
  const CTParagraphStyleSetting *v21;
  uint64_t *v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD *v26;
  const char *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BOOL4 v32;
  uint64_t v33;
  UIFont *v34;
  CTFontRef CopyWithSymbolicTraits;
  const __CTFont *v36;
  UIColor *v37;
  int v38;
  _BOOL4 v39;
  CTParagraphStyleRef v40;
  __int128 v41;
  const void *v42;
  id v43;
  int i;
  uint64_t v45;
  id *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint64_t v49;
  _QWORD v50[3];
  char v51;
  id v52;
  CTTextAlignment v53;
  id location[2];
  id v55;
  double v56;
  SEL v57;
  CPSMultilineLabel *v58;
  CTParagraphStyleRef v59;
  CTFontRef v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v58 = self;
  v57 = a2;
  v56 = a3;
  v55 = (id)objc_opt_new();
  v33 = 0;
  v34 = -[CPSMultilineLabel font](v58, "font");
  v38 = 0;
  CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits((CTFontRef)v34, v56, 0, 0, 0);

  location[1] = CopyWithSymbolicTraits;
  v60 = CopyWithSymbolicTraits;
  v36 = CopyWithSymbolicTraits;
  objc_msgSend(v55, "setObject:forKeyedSubscript:");

  v37 = -[CPSMultilineLabel textColor](v58, "textColor");
  objc_msgSend(v55, "setObject:forKeyedSubscript:");

  location[0] = (id)objc_opt_new();
  v53 = NSTextAlignmentToCTTextAlignment((NSTextAlignment)-[CPSMultilineLabel textAlignment](v58, "textAlignment"));
  v51 = 0;
  v39 = 0;
  if (v53 == kCTTextAlignmentNatural)
  {
    v52 = (id)-[CPSMultilineLabel traitCollection](v58, "traitCollection");
    v51 = 1;
    v39 = objc_msgSend(v52, "layoutDirection") == 1;
  }
  v32 = v39;
  if ((v51 & 1) != 0)

  if (v32)
    v53 = kCTTextAlignmentRight;
  v50[0] = 0;
  v50[1] = 1;
  v50[2] = &v53;
  v30 = location[0];
  v31 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v50, "{CTParagraphStyleSetting=IQ^v}");
  objc_msgSend(v30, "addObject:");

  -[CPSMultilineLabel lineSpacing](v58, "lineSpacing");
  if (v3 > -1.79769313e308)
  {
    v22 = &v49;
    v49 = 0;
    -[CPSMultilineLabel lineSpacing](v58, "lineSpacing");
    v49 = v4;
    v48[0] = 14;
    v48[1] = 8;
    v48[2] = &v49;
    v26 = v47;
    v47[0] = 15;
    v47[1] = 8;
    v47[2] = &v49;
    v23 = location[0];
    v25 = 0x24BDD1000uLL;
    v27 = "{CTParagraphStyleSetting=IQ^v}";
    v24 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v48);
    objc_msgSend(v23, "addObject:");

    v28 = location[0];
    v29 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v47, "{CTParagraphStyleSetting=IQ^v}");
    objc_msgSend(v28, "addObject:");

  }
  if (objc_msgSend(location[0], "count"))
  {
    v46 = &v12;
    v20 = (24 * objc_msgSend(location[0], "count") + 15) & 0xFFFFFFFFFFFFFFF0;
    v5 = MEMORY[0x24BDAC7A8]();
    v21 = (const CTParagraphStyleSetting *)((char *)&v12 - v20);
    v45 = v5;
    for (i = 0; ; ++i)
    {
      v19 = i;
      v6 = objc_msgSend(location[0], "count");
      if (v19 >= v6)
        break;
      v7 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
      v18 = &v43;
      v43 = v7;
      v41 = 0uLL;
      v42 = 0;
      objc_msgSend(v7, "getValue:", &v41);
      v8 = v18;
      v9 = (CTParagraphStyleSetting *)&v21[i];
      *(_OWORD *)&v9->spec = v41;
      v9->value = v42;
      objc_storeStrong(v8, 0);
    }
    v40 = 0;
    v10 = objc_msgSend(location[0], "count");
    v40 = CTParagraphStyleCreate(v21, v10);
    v59 = v40;
    v17 = v40;
    objc_msgSend(v55, "setObject:forKeyedSubscript:");

  }
  v12 = objc_alloc(MEMORY[0x24BDD1688]);
  v13 = -[CPSMultilineLabel text](v58, "text");
  v15 = &v55;
  v14 = (id)objc_msgSend(v12, "initWithString:attributes:");

  v16 = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(v15, v16);
  return v14;
}

- (id)_ellipsedString:(id)a3 inRect:(CGRect)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23[3];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  __int128 v28;
  id location[2];
  CPSMultilineLabel *v30;
  CGRect v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;

  v31 = a4;
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *(_QWORD *)&v28 = -[CPSMultilineLabel _statsForString:inRect:](v30, "_statsForString:inRect:", location[0], v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  *((_QWORD *)&v28 + 1) = v4;
  if ((unint64_t)v28 < objc_msgSend(location[0], "length")
    || *((_QWORD *)&v28 + 1) > -[CPSMultilineLabel effectiveNumberOfLines](v30, "effectiveNumberOfLines"))
  {
    v26 = (char *)(objc_msgSend(location[0], "length") - v28);
    v18 = (id)objc_msgSend(location[0], "string");
    v17 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v5 = objc_msgSend(location[0], "length");
    v38 = v5 - (_QWORD)v26;
    v37 = v26;
    v39 = v5 - (_QWORD)v26;
    v40 = v26;
    v23[1] = (id)(v5 - (_QWORD)v26);
    v23[2] = v26;
    v24 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v17, 0, v5 - (_QWORD)v26, v26);
    v25 = v6;

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      v26 = 0;
    else
      v26 = (char *)(objc_msgSend(location[0], "length") - v24);
    v23[0] = 0;
    v22 = objc_msgSend(location[0], "length");
    while (1)
    {
      v16 = 1;
      if ((unint64_t)v28 >= v22)
        v16 = *((_QWORD *)&v28 + 1) > -[CPSMultilineLabel effectiveNumberOfLines](v30, "effectiveNumberOfLines");
      if (!v16)
        break;
      v7 = (void *)objc_msgSend(location[0], "mutableCopy");
      v8 = v23[0];
      v23[0] = v7;

      if (objc_msgSend(v23[0], "length") <= (unint64_t)v26)
      {
        v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24E271FF0);
        v27 = 1;
        goto LABEL_17;
      }
      v9 = objc_msgSend(v23[0], "length");
      v34 = v9 - (_QWORD)v26;
      v33 = v26;
      v35 = v9 - (_QWORD)v26;
      v36 = v26;
      objc_msgSend(v23[0], "replaceCharactersInRange:withString:", v9 - (_QWORD)v26, v26);
      v13 = (void *)objc_opt_class();
      v15 = (id)objc_msgSend(v23[0], "string");
      v14 = (id)objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("…"), &stru_24E271FF0);
      v20 = objc_msgSend(v13, "_rangeOfTrailingWhiteSpace:");
      v21 = v10;

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v23[0], "replaceCharactersInRange:withString:", v20, v21, &stru_24E271FF0);
      *(_QWORD *)&v19 = -[CPSMultilineLabel _statsForString:inRect:](v30, "_statsForString:inRect:", v23[0], v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
      *((_QWORD *)&v19 + 1) = v11;
      v28 = v19;
      v22 = objc_msgSend(v23[0], "length");
      ++v26;
    }
    v32 = v23[0];
    v27 = 1;
LABEL_17:
    objc_storeStrong(v23, 0);
  }
  else
  {
    v32 = location[0];
    v27 = 1;
  }
  objc_storeStrong(location, 0);
  return v32;
}

- (__CTFrame)_textFrame:(id)a3 rect:(CGRect)a4
{
  __CTFrame *Frame;
  CGPath *path;
  const __CTFramesetter *framesetter;
  id location[3];
  CGRect v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFRange v14;

  v9 = a4;
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)location[0]);
  path = CGPathCreateMutable();
  CGPathAddRect(path, 0, v9);
  v11 = 0;
  v10 = 0;
  v12 = 0;
  v13 = 0;
  v14.location = 0;
  v14.length = 0;
  Frame = CTFramesetterCreateFrame(framesetter, v14, path, 0);
  CFRelease(framesetter);
  CFRelease(path);
  objc_storeStrong(location, 0);
  return Frame;
}

- (BOOL)_fitsInHeight:(double)a3 numberOfLines:(unint64_t)a4 rect:(CGRect)a5
{
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  v9 = a3 <= a5.size.height;
  v8 = a4 <= -[CPSMultilineLabel effectiveNumberOfLines](self, "effectiveNumberOfLines");
  v7 = 0;
  if (-[CPSMultilineLabel prefersFewerLines](self, "prefersFewerLines"))
    v7 = a4 > 1;
  v6 = 0;
  if (v9)
  {
    v6 = 0;
    if (v8)
      return !v7;
  }
  return v6;
}

- (double)_heightForAttributedString:(id)a3 inRect:(CGRect)a4
{
  uint64_t v4;
  __int128 v7;
  const __CTFramesetter *framesetter;
  id location[3];
  CGRect v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFRange v16;

  v10 = a4;
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)location[0]);
    CGSizeMake_1();
    v7 = *MEMORY[0x24BDBF148];
    if (framesetter)
    {
      v13 = 0;
      v12 = 0;
      v14 = 0;
      v15 = 0;
      v16.location = 0;
      v16.length = 0;
      *((_QWORD *)&v7 + 1) = *(_QWORD *)&CTFramesetterSuggestFrameSizeWithConstraints(framesetter, v16, 0, *(CGSize *)&v4, 0).height;
      CFRelease(framesetter);
    }
    v11 = *((double *)&v7 + 1);
  }
  else
  {
    v11 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_statsForString:(id)a3 inRect:(CGRect)a4
{
  unint64_t v4;
  unint64_t v5;
  CFIndex Count;
  const __CFArray *theArray;
  CFIndex length;
  const __CTFrame *frame;
  id location[2];
  CPSMultilineLabel *v11;
  CGRect v12;
  CFIndex v13;
  CFIndex v14;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v12 = a4;
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  frame = -[CPSMultilineLabel _textFrame:rect:](v11, "_textFrame:rect:", location[0], v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  length = CTFrameGetVisibleStringRange(frame).length;
  theArray = CTFrameGetLines(frame);
  Count = CFArrayGetCount(theArray);
  CFRelease(frame);
  v13 = length;
  v14 = Count;
  objc_storeStrong(location, 0);
  v4 = v13;
  v5 = v14;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (_NSRange)_rangeOfTrailingWhiteSpace:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  size_t i;
  id v6[3];
  void *v7;
  int v8;
  size_t size;
  id location[3];
  __int128 v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _NSRange result;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = 0;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v11 = 0x7FFFFFFFFFFFFFFFuLL;
  size = objc_msgSend(location[0], "length");
  if (size)
  {
    v7 = malloc_type_calloc(2uLL, size, 0xD10AC1D9uLL);
    if (v7)
    {
      v13 = 0;
      v12 = size;
      v14 = 0;
      v15 = size;
      v6[1] = 0;
      v6[2] = (id)size;
      objc_msgSend(location[0], "getCharacters:range:", v7, 0, size);
      v6[0] = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      for (i = size - 1; (objc_msgSend(v6[0], "characterIsMember:", *((unsigned __int16 *)v7 + i)) & 1) != 0; --i)
      {
        if ((_QWORD)v11 == 0x7FFFFFFFFFFFFFFFLL)
          v11 = size;
        *(_QWORD *)&v11 = v11 - 1;
        ++*((_QWORD *)&v11 + 1);
      }
      free(v7);
      v8 = 1;
      objc_storeStrong(v6, 0);
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  v4 = *((_QWORD *)&v11 + 1);
  v3 = v11;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CPSMultilineLabelDelegate)delegate
{
  return (CPSMultilineLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (BOOL)prefersFewerLines
{
  return self->_prefersFewerLines;
}

- (void)setPrefersFewerLines:(BOOL)a3
{
  self->_prefersFewerLines = a3;
}

- (UILayoutGuide)textLayoutGuide
{
  return self->_textLayoutGuide;
}

- (CPSMultilineLabelConfig)currentConfiguration
{
  return self->_currentConfiguration;
}

- (BOOL)debug
{
  return self->_debug;
}

- (NSArray)baselineOffsets
{
  return self->_baselineOffsets;
}

- (void)setBaselineOffsets:(id)a3
{
  self->_baselineOffsets = (NSArray *)a3;
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
  objc_storeStrong((id *)&self->_baselineView, a3);
}

- (NSLayoutConstraint)baselineViewTopAnchor
{
  return self->_baselineViewTopAnchor;
}

- (void)setBaselineViewTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_baselineViewTopAnchor, a3);
}

- (NSLayoutConstraint)baselineViewBottomAnchor
{
  return self->_baselineViewBottomAnchor;
}

- (void)setBaselineViewBottomAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_baselineViewBottomAnchor, a3);
}

- (NSArray)leadingOffsets
{
  return self->_leadingOffsets;
}

- (void)setLeadingOffsets:(id)a3
{
  self->_leadingOffsets = (NSArray *)a3;
}

- (NSLayoutConstraint)textLayoutGuideLeadingConstraint
{
  return self->_textLayoutGuideLeadingConstraint;
}

- (void)setTextLayoutGuideLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutGuideLeadingConstraint, a3);
}

- (NSLayoutConstraint)textLayoutGuideTrailingConstraint
{
  return self->_textLayoutGuideTrailingConstraint;
}

- (void)setTextLayoutGuideTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutGuideTrailingConstraint, a3);
}

- (UIView)debugFirstBaselineView
{
  return self->_debugFirstBaselineView;
}

- (void)setDebugFirstBaselineView:(id)a3
{
  objc_storeStrong((id *)&self->_debugFirstBaselineView, a3);
}

- (UIView)debugLastBaselineView
{
  return self->_debugLastBaselineView;
}

- (void)setDebugLastBaselineView:(id)a3
{
  objc_storeStrong((id *)&self->_debugLastBaselineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLastBaselineView, 0);
  objc_storeStrong((id *)&self->_debugFirstBaselineView, 0);
  objc_storeStrong((id *)&self->_textLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_baselineViewBottomAnchor, 0);
  objc_storeStrong((id *)&self->_baselineViewTopAnchor, 0);
  objc_storeStrong((id *)&self->_baselineView, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
