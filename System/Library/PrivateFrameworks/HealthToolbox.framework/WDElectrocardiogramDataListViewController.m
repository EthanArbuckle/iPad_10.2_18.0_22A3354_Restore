@implementation WDElectrocardiogramDataListViewController

- (WDElectrocardiogramDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6 mode:(int64_t)a7
{
  WDElectrocardiogramDataListViewController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDElectrocardiogramDataListViewController;
  result = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](&v9, sel_initWithDisplayType_profile_dataProvider_usingInsetStyling_, a3, a4, a5, a6);
  if (result)
    result->_mode = a7;
  return result;
}

- (BOOL)isEditEnabled
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramDataListViewController;
  v3 = -[WDDataListViewController isEditEnabled](&v5, sel_isEditEnabled);
  if (v3)
    LOBYTE(v3) = self->_mode == 0;
  return v3;
}

@end
