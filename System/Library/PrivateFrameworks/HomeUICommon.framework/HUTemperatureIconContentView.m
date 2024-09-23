@implementation HUTemperatureIconContentView

- (HUTemperatureIconContentView)initWithFrame:(CGRect)a3
{
  HUTemperatureIconContentView *v3;
  HUTemperatureIconContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTemperatureIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUTemperatureIconContentView setContentMode:](v3, "setContentMode:", 3);
    -[HUTemperatureIconContentView setOpaque:](v4, "setOpaque:", 0);
    -[HUIconContentView setAspectRatio:](v4, "setAspectRatio:", 1.0);
    -[HUTemperatureIconContentView setLastFontFittingSize:](v4, "setLastFontFittingSize:", 0);
    -[HUTemperatureIconContentView setLastFontFittedWidth:](v4, "setLastFontFittedWidth:", 0.0);
    -[HUTemperatureIconContentView setLastFontFittedText:](v4, "setLastFontFittedText:", 0);
  }
  return v4;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUTemperatureIconContentView;
  -[HUIconContentView updateWithIconDescriptor:displayStyle:animated:](&v12, sel_updateWithIconDescriptor_displayStyle_animated_, v8, a4, v5);
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
    -[HUTemperatureIconContentView setNeedsDisplay](self, "setNeedsDisplay");
  else
    NSLog(CFSTR("No temperature icon descriptor"));

}

- (BOOL)shouldFlipForRTL
{
  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTemperatureIconContentView;
  -[HUTemperatureIconContentView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUTemperatureIconContentView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double width;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGContext *CurrentContext;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  id v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  CGContext *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  _QWORD v72[3];
  _QWORD v73[3];
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  _QWORD v79[3];

  width = a3.size.width;
  v79[1] = *MEMORY[0x24BDAC8D0];
  -[HUIconContentView iconDescriptor](self, "iconDescriptor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "targetHeatingCoolingMode");

  if (v6)
  {
    -[HUIconContentView iconDescriptor](self, "iconDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "heatingCoolingMode");

    switch(v8)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 1:
        objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 2:
        objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      default:
        v10 = 0;
        break;
    }
  }
  else
  {
    if (-[HUIconContentView displayStyle](self, "displayStyle") != 1)
    {
      -[HUTemperatureIconContentView tintColor](self, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v9;
  }
  v11 = 1;
LABEL_12:
  v12 = (void *)MEMORY[0x24BDF6870];
  -[HUTemperatureIconContentView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[HUTemperatureIconContentView bounds](self, "bounds");
  objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v14, v16, v18, v20, v21 * 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");
  objc_msgSend(v22, "fill");
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if ((v11 & 1) == 0)
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceOut);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  objc_msgSend(v25, "setAlignment:", 1);
  objc_msgSend(v25, "setAllowsDefaultTighteningForTruncation:", 1);
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "formattedTemperature");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    HFLocalizedString();
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  v70 = v10;
  v71 = v30;
  if (!self)
  {
    v35 = 0;
    goto LABEL_36;
  }
  -[HUTemperatureIconContentView lastFontFittingSize](self, "lastFontFittingSize");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31 && (-[HUTemperatureIconContentView lastFontFittedWidth](self, "lastFontFittedWidth"), v32 == width))
  {
    -[HUTemperatureIconContentView lastFontFittedText](self, "lastFontFittedText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", v71);

    if (v34)
    {
      -[HUTemperatureIconContentView lastFontFittingSize](self, "lastFontFittingSize");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
  }
  else
  {

  }
  v69 = v25;
  v66 = CurrentContext;
  -[HUTemperatureIconContentView bounds](self, "bounds");
  v37 = v36 * 0.03125;
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 13.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "fontDescriptor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUFontUtilities fontDescriptorWithMonospacedDigitsForFontDescriptor:](HUFontUtilities, "fontDescriptorWithMonospacedDigitsForFontDescriptor:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v39;
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v39, 13.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_fontScaledByScaleFactor:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = width * 0.75;
  v43 = v41;
  v44 = v71;
  objc_msgSend(v43, "fontDescriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x24BDF65F8];
  v78 = *MEMORY[0x24BDF65F8];
  v79[0] = v43;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sizeWithAttributes:", v47);
  v49 = v48;

  if (v49 <= width * 0.75)
  {
    v35 = v43;
  }
  else
  {
    objc_msgSend(v43, "pointSize");
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v45, floor(v42 / v49 * v50 + v42 / v49 * v50) * 0.5);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v76 = v46;
    v77 = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeWithAttributes:", v51);
    v53 = v52;

    if (v53 <= v42)
      v54 = 1.0;
    else
      v54 = -1.0;
    while (1)
    {
      v55 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(v35, "pointSize");
      objc_msgSend(v55, "fontWithDescriptor:size:", v45, v56 + v54 * 0.5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v46;
      v75 = v57;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sizeWithAttributes:", v58);
      v60 = v59;

      if (v53 > v42 && v60 < v42)
        break;
      if (v54 > 0.0 && v60 > v42)
        goto LABEL_34;

      v35 = v57;
    }
    v61 = v57;

    v35 = v61;
LABEL_34:

  }
  CurrentContext = v66;

  -[HUTemperatureIconContentView setLastFontFittingSize:](self, "setLastFontFittingSize:", v35);
  -[HUTemperatureIconContentView setLastFontFittedWidth:](self, "setLastFontFittedWidth:", width);
  -[HUTemperatureIconContentView setLastFontFittedText:](self, "setLastFontFittedText:", v44);

  v25 = v69;
LABEL_36:

  v62 = *MEMORY[0x24BDF65F8];
  v73[0] = v35;
  v63 = *MEMORY[0x24BDF6600];
  v72[0] = v62;
  v72[1] = v63;
  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = *MEMORY[0x24BDF6628];
  v73[1] = v64;
  v73[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTemperatureIconContentView bounds](self, "bounds");
  objc_msgSend(v35, "lineHeight");
  -[HUTemperatureIconContentView center](self, "center");
  -[HUTemperatureIconContentView center](self, "center");
  UIRectCenteredAboutPoint();
  objc_msgSend(v71, "drawWithRect:options:attributes:context:", 1, v65, 0);

  CGContextRestoreGState(CurrentContext);
}

- (UIFont)lastFontFittingSize
{
  return self->_lastFontFittingSize;
}

- (void)setLastFontFittingSize:(id)a3
{
  objc_storeStrong((id *)&self->_lastFontFittingSize, a3);
}

- (double)lastFontFittedWidth
{
  return self->_lastFontFittedWidth;
}

- (void)setLastFontFittedWidth:(double)a3
{
  self->_lastFontFittedWidth = a3;
}

- (NSString)lastFontFittedText
{
  return self->_lastFontFittedText;
}

- (void)setLastFontFittedText:(id)a3
{
  objc_storeStrong((id *)&self->_lastFontFittedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFontFittedText, 0);
  objc_storeStrong((id *)&self->_lastFontFittingSize, 0);
}

@end
