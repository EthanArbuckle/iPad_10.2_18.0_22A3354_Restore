@implementation HUTemperatureTextContentView

- (HUTemperatureTextContentView)initWithFrame:(CGRect)a3
{
  HUTemperatureTextContentView *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureTextContentView;
  v3 = -[HUIconContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[HUTemperatureTextContentView setTemperatureLabel:](v3, "setTemperatureLabel:", v4);

    -[HUTemperatureTextContentView temperatureLabel](v3, "temperatureLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTemperatureTextContentView addSubview:](v3, "addSubview:", v5);

  }
  return v3;
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
  v12.super_class = (Class)HUTemperatureTextContentView;
  -[HUIconContentView updateWithIconDescriptor:displayStyle:animated:](&v12, sel_updateWithIconDescriptor_displayStyle_animated_, v8, a4, v5);
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    -[HUTemperatureTextContentView configureLabel](self, "configureLabel");
    -[HUTemperatureTextContentView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    NSLog(CFSTR("No temperature icon descriptor"));
  }

}

- (void)configureLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "targetHeatingCoolingMode");

  if (v4)
  {
    -[HUIconContentView iconDescriptor](self, "iconDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "heatingCoolingMode");

    switch(v6)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 1:
        objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        objc_msgSend(MEMORY[0x24BDF6950], "systemCyanColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      default:
        v21 = 0;
        break;
    }
  }
  else
  {
    if (-[HUIconContentView displayStyle](self, "displayStyle") == 1)
      objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    else
      -[HUTemperatureTextContentView tintColor](self, "tintColor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v21 = (id)v7;
  }
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedTemperature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    HFLocalizedString();
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 22.0, *MEMORY[0x24BDF7868]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v13);

  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v21);

  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMinimumScaleFactor:", 0.2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUTemperatureTextContentView;
  -[HUTemperatureTextContentView layoutSubviews](&v12, sel_layoutSubviews);
  -[HUTemperatureTextContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUTemperatureTextContentView temperatureLabel](self, "temperatureLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[HUTemperatureTextContentView setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
}

@end
