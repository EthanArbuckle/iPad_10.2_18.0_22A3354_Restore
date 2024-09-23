@implementation NTKRichComplicationRectangularFullBaseView

- (NTKRichComplicationRectangularFullBaseView)init
{
  NTKRichComplicationRectangularFullBaseView *v2;
  NTKRichComplicationRectangularFullBaseView *v3;
  uint64_t v4;
  UIView *content;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationRectangularFullBaseView;
  v2 = -[NTKRichComplicationRectangularBaseView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKRichComplicationRectangularFullBaseView content](v2, "content");
    v4 = objc_claimAutoreleasedReturnValue();
    content = v3->_content;
    v3->_content = (UIView *)v4;

    -[NTKRichComplicationRectangularFullBaseView addSubview:](v3, "addSubview:", v3->_content);
  }
  return v3;
}

- (void)layoutSubviews
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationRectangularFullBaseView;
  -[NTKRichComplicationRectangularFullBaseView layoutSubviews](&v13, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_65);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_65);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_65);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_65, v3);
    _LayoutConstants___previousCLKDeviceVersion_65 = objc_msgSend(v3, "version");

    _LayoutConstants___constants_0_14 = NTKWhistlerLargeRectangularComplicationSize(v3);
    _LayoutConstants___constants_1_11 = v10;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _LayoutConstants___previousCLKDeviceVersion_65;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_65);
  v11 = *(double *)&_LayoutConstants___constants_0_14;
  v12 = *(double *)&_LayoutConstants___constants_1_11;

  -[UIView setFrame:](self->_content, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v11, v12);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

- (id)content
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
