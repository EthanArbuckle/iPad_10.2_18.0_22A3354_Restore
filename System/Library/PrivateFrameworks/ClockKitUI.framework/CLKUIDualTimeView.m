@implementation CLKUIDualTimeView

- (CLKUIDualTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6;
  id v7;
  CLKUIDualTimeView *v8;
  CLKUIAnalogTimeView *v9;
  CLKUIAnalogTimeView *analogTimeView;
  CLKUIDigitalClockView *v11;
  CLKUIDigitalClockView *digitalTimeView;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKUIDualTimeView;
  v8 = -[CLKUITimeView initWithDevice:clockTimer:](&v14, sel_initWithDevice_clockTimer_, v6, v7);
  if (v8)
  {
    v9 = -[CLKUIAnalogTimeView initWithDevice:clockTimer:]([CLKUIAnalogTimeView alloc], "initWithDevice:clockTimer:", v6, v7);
    analogTimeView = v8->_analogTimeView;
    v8->_analogTimeView = v9;

    -[CLKUIDualTimeView addSubview:](v8, "addSubview:", v8->_analogTimeView);
    v11 = -[CLKUIDigitalClockView initWithDevice:clockTimer:]([CLKUIDigitalClockView alloc], "initWithDevice:clockTimer:", v6, v7);
    digitalTimeView = v8->_digitalTimeView;
    v8->_digitalTimeView = v11;

    -[CLKUIDualTimeView addSubview:](v8, "addSubview:", v8->_digitalTimeView);
  }

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIDualTimeView;
  -[CLKUIDualTimeView layoutSubviews](&v3, sel_layoutSubviews);
  -[CLKUIDualTimeView bounds](self, "bounds");
  -[CLKUIAnalogTimeView setFrame:](self->_analogTimeView, "setFrame:");
  -[CLKUIDualTimeView bounds](self, "bounds");
  -[CLKUIDigitalClockView setFrame:](self->_digitalTimeView, "setFrame:");
  -[CLKUITimeView dialInset](self, "dialInset");
  -[CLKUITimeView setDialInset:](self->_analogTimeView, "setDialInset:");
  -[CLKUITimeView dialInset](self, "dialInset");
  -[CLKUITimeView setDialInset:](self->_digitalTimeView, "setDialInset:");
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  _BOOL8 v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLKUIDualTimeView;
  v4 = a3;
  -[CLKUITimeView setConfiguration:](&v11, sel_setConfiguration_, v4);
  objc_msgSend(v4, "analogConfiguration", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogTimeView setConfiguration:](self->_analogTimeView, "setConfiguration:", v5);

  objc_msgSend(v4, "digitalConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIDigitalClockView setConfiguration:](self->_digitalTimeView, "setConfiguration:", v6);

  v7 = objc_msgSend(v4, "timeStyle");
  v8 = v7 == 0;
  v9 = v7 == 0;
  v10 = !v8;
  -[CLKUIAnalogTimeView setHidden:](self->_analogTimeView, "setHidden:", v10);
  -[CLKUIDigitalClockView setHidden:](self->_digitalTimeView, "setHidden:", v9);
  -[CLKUIAnalogTimeView setState:](self->_analogTimeView, "setState:", v10);
  -[CLKUIDigitalClockView setState:](self->_digitalTimeView, "setState:", v9);
}

- (void)setState:(unint64_t)a3
{
  int v5;
  CLKUIAnalogTimeView *analogTimeView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKUIDualTimeView;
  -[CLKUITimeView setState:](&v7, sel_setState_);
  if (a3 == 1)
  {
    -[CLKUIAnalogTimeView setState:](self->_analogTimeView, "setState:", 1);
  }
  else
  {
    if (a3)
      return;
    v5 = -[CLKUIAnalogTimeView isHidden](self->_analogTimeView, "isHidden");
    analogTimeView = self->_analogTimeView;
    if (v5)
    {
      -[CLKUIAnalogTimeView setState:](analogTimeView, "setState:", 1);
      a3 = 0;
    }
    else
    {
      -[CLKUIAnalogTimeView setState:](analogTimeView, "setState:", 0);
      a3 = 1;
    }
  }
  -[CLKUIDigitalClockView setState:](self->_digitalTimeView, "setState:", a3);
}

- (void)setOverrideDate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKUIDualTimeView;
  v4 = a3;
  -[CLKUITimeView setOverrideDate:](&v5, sel_setOverrideDate_, v4);
  -[CLKUIAnalogTimeView setOverrideDate:](self->_analogTimeView, "setOverrideDate:", v4, v5.receiver, v5.super_class);
  -[CLKUIDigitalClockView setOverrideDate:](self->_digitalTimeView, "setOverrideDate:", v4);

}

- (void)setTimeColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKUIDualTimeView;
  v4 = a3;
  -[CLKUITimeView setTimeColor:](&v5, sel_setTimeColor_, v4);
  -[CLKUITimeView setTimeColor:](self->_analogTimeView, "setTimeColor:", v4, v5.receiver, v5.super_class);
  -[CLKUITimeView setTimeColor:](self->_digitalTimeView, "setTimeColor:", v4);

}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIDualTimeView;
  v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  -[CLKUITimeView setAodTransform:](&v9, sel_setAodTransform_, v8);
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[CLKUIDualTimeView setTransform:](self, "setTransform:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalTimeView, 0);
  objc_storeStrong((id *)&self->_analogTimeView, 0);
}

@end
