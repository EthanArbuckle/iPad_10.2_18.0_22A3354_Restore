@implementation NTKUpNextHeaderView

- (NTKUpNextHeaderView)initWithFrame:(CGRect)a3
{
  NTKUpNextHeaderView *v3;
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
  double v16;
  id v17;
  uint64_t v18;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v20;
  void *v21;
  CLKUIColoringLabel *v22;
  void *v23;
  CLKUIColoringLabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  objc_super v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)NTKUpNextHeaderView;
  v3 = -[NTKUpNextHeaderView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_23);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_23);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_23);
      if (v8 == v5)
      {
        v9 = objc_msgSend(v5, "version");
        v10 = _LayoutConstants___previousCLKDeviceVersion_23;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_23);
          v13 = *(double *)&_LayoutConstants_constants_0_3;
          v14 = *(double *)&_LayoutConstants_constants_1_3;
          v15 = *(double *)&_LayoutConstants_constants_2_3;
          v16 = *(double *)&_LayoutConstants_constants_3_2;

          v17 = objc_alloc((Class)off_1E6BCA6E0);
          v18 = objc_msgSend(v17, "initWithFrame:options:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          label = v3->_label;
          v3->_label = (CLKUIColoringLabel *)v18;

          v20 = v3->_label;
          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1448]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setFont:](v20, "setFont:", v21);

          v22 = v3->_label;
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setTextColor:](v22, "setTextColor:", v23);

          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v24 = v3->_label;
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setBackgroundColor:](v24, "setBackgroundColor:", v25);

          -[CLKUIColoringLabel setTextAlignment:](v3->_label, "setTextAlignment:", 0);
          -[NTKUpNextHeaderView addSubview:](v3, "addSubview:", v3->_label);
          -[CLKUIColoringLabel leadingAnchor](v3->_label, "leadingAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextHeaderView leadingAnchor](v3, "leadingAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "constraintEqualToAnchor:constant:", v26, v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v27;
          -[CLKUIColoringLabel trailingAnchor](v3->_label, "trailingAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextHeaderView trailingAnchor](v3, "trailingAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v16 * -1.5);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38[1] = v30;
          -[CLKUIColoringLabel lastBaselineAnchor](v3->_label, "lastBaselineAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextHeaderView bottomAnchor](v3, "bottomAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v14);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38[2] = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v34);
          return v3;
        }
      }
      else
      {

      }
    }
    v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_23, v5);
    _LayoutConstants___previousCLKDeviceVersion_23 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_20(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v3;
}

- (void)setTextProvider:(id)a3
{
  CLKTextProvider *v4;
  CLKTextProvider *textProvider;

  v4 = (CLKTextProvider *)objc_msgSend(a3, "copy");
  textProvider = self->_textProvider;
  self->_textProvider = v4;

  -[CLKUIColoringLabel setTextProvider:](self->_label, "setTextProvider:", self->_textProvider);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
