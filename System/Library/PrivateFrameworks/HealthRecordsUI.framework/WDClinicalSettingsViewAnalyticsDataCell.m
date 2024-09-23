@implementation WDClinicalSettingsViewAnalyticsDataCell

- (WDClinicalSettingsViewAnalyticsDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalSettingsViewAnalyticsDataCell *v4;
  WDClinicalSettingsViewAnalyticsDataCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalSettingsViewAnalyticsDataCell;
  v4 = -[WDClinicalSettingsViewAnalyticsDataCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDClinicalSettingsViewAnalyticsDataCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v5;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (void)setViewControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_viewControllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClass, 0);
}

@end
