@implementation HUDayOfWeekButton

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)HUDayOfWeekButton;
  -[HUDayOfWeekButton layoutSubviews](&v5, sel_layoutSubviews);
  -[HUDayOfWeekButton bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[HUDayOfWeekButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (NSString)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(id)a3
{
  objc_storeStrong((id *)&self->_dayOfWeek, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeek, 0);
}

@end
