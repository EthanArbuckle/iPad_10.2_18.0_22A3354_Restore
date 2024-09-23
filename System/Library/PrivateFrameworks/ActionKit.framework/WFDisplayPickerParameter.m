@implementation WFDisplayPickerParameter

- (WFDisplayPickerParameter)initWithDefinition:(id)a3
{
  WFDisplayPickerParameter *v3;
  WFDisplayPickerParameter *v4;
  WFDisplayPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFDisplayPickerParameter;
  v3 = -[WFDisplayPickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (NSArray)displays
{
  NSArray *displays;

  displays = self->_displays;
  if (!displays)
  {
    self->_displays = (NSArray *)MEMORY[0x24BDBD1A8];
    displays = self->_displays;
  }
  return displays;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  return 0;
}

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  return 0;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  return 0;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displays, 0);
}

@end
