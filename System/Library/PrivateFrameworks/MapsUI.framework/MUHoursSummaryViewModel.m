@implementation MUHoursSummaryViewModel

- (MUHoursSummaryViewModel)init
{
  MUHoursSummaryViewModel *v2;
  uint64_t v3;
  UIColor *openStateColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUHoursSummaryViewModel;
  v2 = -[MUHoursSummaryViewModel init](&v6, sel_init);
  if (v2)
  {
    +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
    v3 = objc_claimAutoreleasedReturnValue();
    openStateColor = v2->_openStateColor;
    v2->_openStateColor = (UIColor *)v3;

  }
  return v2;
}

- (id)buildDefaultPlacecardHoursString
{
  MUPlaceHoursFormatter *v2;
  void *v3;

  v2 = -[MUPlaceHoursFormatter initWithHoursString:AMPMSymbols:]([MUPlaceHoursFormatter alloc], "initWithHoursString:AMPMSymbols:", self->_hoursText, self->_AMPMSymbols);
  -[MUPlaceHoursFormatter buildDefaultPlacecardHoursString](v2, "buildDefaultPlacecardHoursString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)hoursText
{
  return self->_hoursText;
}

- (void)setHoursText:(id)a3
{
  objc_storeStrong((id *)&self->_hoursText, a3);
}

- (NSString)openStateText
{
  return self->_openStateText;
}

- (void)setOpenStateText:(id)a3
{
  objc_storeStrong((id *)&self->_openStateText, a3);
}

- (UIColor)openStateColor
{
  return self->_openStateColor;
}

- (void)setOpenStateColor:(id)a3
{
  objc_storeStrong((id *)&self->_openStateColor, a3);
}

- (NSArray)AMPMSymbols
{
  return self->_AMPMSymbols;
}

- (void)setAMPMSymbols:(id)a3
{
  objc_storeStrong((id *)&self->_AMPMSymbols, a3);
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (void)setHideChevron:(BOOL)a3
{
  self->_hideChevron = a3;
}

- (BOOL)isServiceHours
{
  return self->_serviceHours;
}

- (void)setServiceHours:(BOOL)a3
{
  self->_serviceHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMSymbols, 0);
  objc_storeStrong((id *)&self->_openStateColor, 0);
  objc_storeStrong((id *)&self->_openStateText, 0);
  objc_storeStrong((id *)&self->_hoursText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
