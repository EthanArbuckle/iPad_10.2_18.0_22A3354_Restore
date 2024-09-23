@implementation NTKUpNextAccessoryView

- (NTKUpNextAccessoryView)initWithFrame:(CGRect)a3
{
  NTKUpNextAccessoryView *v3;
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)NTKUpNextAccessoryView;
  v3 = -[NTKUpNextAccessoryView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_29);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_29);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_29);
      if (v8 == v5)
      {
        v9 = objc_msgSend(v5, "version");
        v10 = _LayoutConstants___previousCLKDeviceVersion_29;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_29);
          v13 = *(double *)&_LayoutConstants_constants_0_6;
          v14 = *(double *)&_LayoutConstants_constants_1_6;
          v15 = *(double *)&_LayoutConstants_constants_2_6;

          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v13, *MEMORY[0x1E0DC1438]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc((Class)off_1E6BCA6E0);
          v18 = objc_msgSend(v17, "initWithFrame:options:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          label = v3->_label;
          v3->_label = (CLKUIColoringLabel *)v18;

          v39 = v16;
          -[CLKUIColoringLabel setFont:](v3->_label, "setFont:", v16);
          v20 = v3->_label;
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setTextColor:](v20, "setTextColor:", v21);

          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[CLKUIColoringLabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 4);
          -[CLKUIColoringLabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
          -[CLKUIColoringLabel setNowProvider:](v3->_label, "setNowProvider:", &__block_literal_global_81);
          LODWORD(v22) = 1148846080;
          -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 0, v22);
          LODWORD(v23) = 1148846080;
          -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 1, v23);
          LODWORD(v24) = 1148846080;
          -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 1, v24);
          LODWORD(v25) = 1148846080;
          -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 0, v25);
          -[NTKUpNextAccessoryView layer](v3, "layer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setCornerRadius:", v14);

          -[NTKUpNextAccessoryView layer](v3, "layer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

          -[NTKUpNextAccessoryView addSubview:](v3, "addSubview:", v3->_label);
          -[CLKUIColoringLabel leadingAnchor](v3->_label, "leadingAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextAccessoryView leadingAnchor](v3, "leadingAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, v15);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v41;
          -[CLKUIColoringLabel trailingAnchor](v3->_label, "trailingAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextAccessoryView trailingAnchor](v3, "trailingAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "constraintEqualToAnchor:constant:", v28, -v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = v29;
          -[CLKUIColoringLabel firstBaselineAnchor](v3->_label, "firstBaselineAnchor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextAccessoryView bottomAnchor](v3, "bottomAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -v15);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v45[2] = v32;
          -[NTKUpNextAccessoryView topAnchor](v3, "topAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel firstBaselineAnchor](v3->_label, "firstBaselineAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "capHeight");
          objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -(v15 + v35));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v45[3] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
          return v3;
        }
      }
      else
      {

      }
    }
    v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_29, v5);
    _LayoutConstants___previousCLKDeviceVersion_29 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_26(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v3;
}

uint64_t __40__NTKUpNextAccessoryView_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)configureWithDescription:(id)a3
{
  REAccessoryDescription **p_accessoryDescription;
  CLKUIColoringLabel *label;
  void *v7;
  void *v8;
  id v9;

  p_accessoryDescription = &self->_accessoryDescription;
  v9 = a3;
  if ((-[REAccessoryDescription isEqual:](*p_accessoryDescription, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryDescription, a3);
    -[CLKUIColoringLabel setText:](self->_label, "setText:", 0);
    label = self->_label;
    -[REAccessoryDescription textProvider](*p_accessoryDescription, "textProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v7);

    -[REAccessoryDescription backgroundColor](*p_accessoryDescription, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextAccessoryView setBackgroundColor:](self, "setBackgroundColor:", v8);

  }
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)setTextColor:(id)a3
{
  -[CLKUIColoringLabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
}

@end
