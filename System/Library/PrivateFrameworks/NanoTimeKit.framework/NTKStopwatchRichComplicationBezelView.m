@implementation NTKStopwatchRichComplicationBezelView

- (NTKStopwatchRichComplicationBezelView)init
{
  NTKStopwatchRichComplicationBezelView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBezelView;
  v2 = -[NTKRichComplicationBezelBaseTextView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKStopwatchRichComplicationBezelView setBackgroundColor:](v2, "setBackgroundColor:", v3);

  }
  return v2;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4;
  CLKUIColoringLabel *v5;
  uint64_t v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  double v15;
  void *v16;
  CLKUIColoringLabel *textLabel;
  CLKUIColoringLabel *v18;
  CLKUIColoringLabel *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  v5 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E6BCA6E0);
  -[CLKUIColoringLabel setInTimeTravel:](v5, "setInTimeTravel:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke;
  v23[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v24, &location);
  -[CLKUIColoringLabel setNowProvider:](v5, "setNowProvider:", v23);
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke_2;
  v21[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v22, &location);
  -[CLKUIColoringLabel setNeedsResizeHandler:](v5, "setNeedsResizeHandler:", v21);
  -[CLKUIColoringLabel setUppercase:](v5, "setUppercase:", 1);
  -[CLKUIColoringLabel setFont:](v5, "setFont:", v4);
  -[CDRichComplicationView device](self, "device");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_53);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_53);
  if (!WeakRetained)
    goto LABEL_5;
  v9 = WeakRetained;
  v10 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_53);
  if (v10 != v7)
  {

LABEL_5:
    v13 = objc_storeWeak(&_LayoutConstants___cachedDevice_53, v7);
    _LayoutConstants___previousCLKDeviceVersion_53 = objc_msgSend(v7, "version");

    ___LayoutConstants_block_invoke_51(v14, (uint64_t)v7);
    goto LABEL_6;
  }
  v11 = objc_msgSend(v7, "version");
  v12 = _LayoutConstants___previousCLKDeviceVersion_53;

  if (v11 != v12)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_53);
  v15 = *(double *)&_LayoutConstants___constants_0_10;

  -[CLKUIColoringLabel setMaxWidth:](v5, "setMaxWidth:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v5, "setTextColor:", v16);

  textLabel = self->_textLabel;
  self->_textLabel = v5;
  v18 = v5;

  v19 = self->_textLabel;
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

id __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x1E0C944A0];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_textLabel, "editingDidEnd");
}

- (void)_updateTextProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CDRichComplicationTemplateView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NTKStopwatchBezelComplicationMetadataTimeTextProviderKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel textProvider](self->_textLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", objc_msgSend(v5, "paused"));

  -[CLKUIColoringLabel setTextProvider:](self->_textLabel, "setTextProvider:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
