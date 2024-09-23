@implementation CLKUITimeView

- (CLKUITimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v7;
  id v8;
  CLKUITimeView *v9;
  CLKUITimeView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UITraitChangeRegistration *traitChangeRegistration;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLKUITimeView;
  v9 = -[CLKUITimeView init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_clockTimer, a4);
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v12, sel_traitCollectionDidChange_previousTraitCollection_);
    v13 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v10->_traitChangeRegistration;
    v10->_traitChangeRegistration = (UITraitChangeRegistration *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CLKUITimeView unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_traitChangeRegistration);
  v3.receiver = self;
  v3.super_class = (Class)CLKUITimeView;
  -[CLKUITimeView dealloc](&v3, sel_dealloc);
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CLKUITimeViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CLKUITimeViewDelegate)delegate
{
  return (CLKUITimeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (CLKClockTimer)clockTimer
{
  return self->_clockTimer;
}

- (void)setClockTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clockTimer, a3);
}

- (double)dialInset
{
  return self->_dialInset;
}

- (void)setDialInset:(double)a3
{
  self->_dialInset = a3;
}

- (CGAffineTransform)aodTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].d;
  return self;
}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_aodTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_aodTransform.c = v4;
  *(_OWORD *)&self->_aodTransform.tx = v3;
}

- (UIEdgeInsets)paddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paddingInsets.top;
  left = self->_paddingInsets.left;
  bottom = self->_paddingInsets.bottom;
  right = self->_paddingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPaddingInsets:(UIEdgeInsets)a3
{
  self->_paddingInsets = a3;
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_clockTimer, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
}

@end
