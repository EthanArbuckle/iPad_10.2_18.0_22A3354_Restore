@implementation DOCTagPickerPanelAppearance

- (DOCTagPickerPanelAppearance)initWithTopMargin:(double)a3 bottomMargin:(double)a4 maxHeight:(double)a5
{
  DOCTagPickerPanelAppearance *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCTagPickerPanelAppearance;
  result = -[DOCTagPickerPanelAppearance init](&v9, sel_init);
  if (result)
  {
    result->_topMargin = a3;
    result->_bottomMargin = a4;
    result->_maxHeight = a5;
  }
  return result;
}

- (double)maxHeight
{
  double maxHeight;
  NSObject **v4;
  NSObject *v5;
  int v7;
  DOCTagPickerPanelAppearance *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  maxHeight = self->_maxHeight;
  if (maxHeight == -12341234.0)
  {
    v4 = (NSObject **)MEMORY[0x24BE2DF90];
    v5 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    maxHeight = 1000.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_21EA4C000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Attempt to use metric (%@.maxHeight) that should never be used in this context", (uint8_t *)&v7, 0xCu);
    }
  }
  return maxHeight;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

@end
