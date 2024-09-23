@implementation HKEmergencyCardTableItem

- (id)initInEditMode:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardTableItem;
  result = -[HKEmergencyCardTableItem init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 9) = a3;
  return result;
}

- (HKEmergencyCardTableItem)init
{
  return (HKEmergencyCardTableItem *)-[HKEmergencyCardTableItem initInEditMode:](self, "initInEditMode:", 0);
}

- (id)title
{
  return 0;
}

- (UIEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 16.0;
  if (self->_isInEditMode)
    v2 = 46.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()
    && -[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    return *MEMORY[0x1E0DC53D8];
  }
  else
  {
    return 44.0 + 24.0;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)titleForHeader
{
  return 0;
}

- (id)titleForFooter
{
  return 0;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  return 0;
}

- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4
{
  return -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:disabled:](self, "_dequeueNoValueCellInTableView:withTitle:disabled:", a3, a4, 0);
}

- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4 disabled:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", 0x1E9C5D948);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addValueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  return v7;
}

- (_HKMedicalIDData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)profileFirstName
{
  return self->_profileFirstName;
}

- (void)setProfileFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIViewController)owningViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_owningViewController);
}

- (void)setOwningViewController:(id)a3
{
  objc_storeWeak((id *)&self->_owningViewController, a3);
}

- (BOOL)isSecondaryProfile
{
  return self->_isSecondaryProfile;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  self->_isSecondaryProfile = a3;
}

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (BOOL)shouldShowHints
{
  return self->_shouldShowHints;
}

- (void)setShouldShowHints:(BOOL)a3
{
  self->_shouldShowHints = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningViewController);
  objc_storeStrong((id *)&self->_profileFirstName, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)hasPresentableData
{
  void *v2;
  void *v3;
  BOOL v4;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

@end
