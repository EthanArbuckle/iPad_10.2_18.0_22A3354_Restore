@implementation EKUICalendarListContentConfiguration

- (id)makeContentView
{
  EKUICalendarListViewHeaderContentView *v3;

  v3 = objc_alloc_init(EKUICalendarListViewHeaderContentView);
  -[EKUICalendarListViewHeaderContentView setConfiguration:](v3, "setConfiguration:", self);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUICalendarListContentConfiguration;
  return -[EKUICalendarListContentConfiguration copy](&v4, sel_copy, a3);
}

- (NSString)mainText
{
  return self->_mainText;
}

- (void)setMainText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)mainTextAbbr
{
  return self->_mainTextAbbr;
}

- (void)setMainTextAbbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)altCalendarText
{
  return self->_altCalendarText;
}

- (void)setAltCalendarText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)weekNumberText
{
  return self->_weekNumberText;
}

- (void)setWeekNumberText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)mainTextColor
{
  return self->_mainTextColor;
}

- (void)setMainTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_mainTextColor, a3);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_mainTextColor, 0);
  objc_storeStrong((id *)&self->_weekNumberText, 0);
  objc_storeStrong((id *)&self->_altCalendarText, 0);
  objc_storeStrong((id *)&self->_mainTextAbbr, 0);
  objc_storeStrong((id *)&self->_mainText, 0);
}

@end
