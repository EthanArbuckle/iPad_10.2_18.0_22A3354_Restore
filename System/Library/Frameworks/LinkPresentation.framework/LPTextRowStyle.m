@implementation LPTextRowStyle

- (LPTextRowStyle)initWithPlatform:(int64_t)a3 fontScalingFactor:(double)a4
{
  LPTextRowStyle *v6;
  LPTextViewStyle *v7;
  LPTextViewStyle *leading;
  LPTextViewStyle *v9;
  LPTextViewStyle *trailing;
  LPTextRowStyle *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LPTextRowStyle;
  v6 = -[LPTextRowStyle init](&v13, sel_init);
  if (v6)
  {
    v7 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a4);
    leading = v6->_leading;
    v6->_leading = v7;

    -[LPTextViewStyle setTextAlignment:](v6->_leading, "setTextAlignment:", 0);
    v9 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a4);
    trailing = v6->_trailing;
    v6->_trailing = v9;

    -[LPTextViewStyle setTextAlignment:](v6->_trailing, "setTextAlignment:", 1);
    v6->_balancingMode = 0;
    v11 = v6;
  }

  return v6;
}

- (id)left
{
  if (appIsLTR())
    -[LPTextRowStyle leading](self, "leading");
  else
    -[LPTextRowStyle trailing](self, "trailing");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)right
{
  if (appIsLTR())
    -[LPTextRowStyle trailing](self, "trailing");
  else
    -[LPTextRowStyle leading](self, "leading");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyToAllTextViewStyles:(id)a3
{
  void (**v4)(id, LPTextViewStyle *);

  v4 = (void (**)(id, LPTextViewStyle *))a3;
  v4[2](v4, self->_leading);
  v4[2](v4, self->_trailing);

}

- (LPTextViewStyle)leading
{
  return self->_leading;
}

- (LPTextViewStyle)trailing
{
  return self->_trailing;
}

- (int64_t)balancingMode
{
  return self->_balancingMode;
}

- (void)setBalancingMode:(int64_t)a3
{
  self->_balancingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_leading, 0);
}

@end
