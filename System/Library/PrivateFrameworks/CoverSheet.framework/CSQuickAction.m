@implementation CSQuickAction

- (NSString)actionIdentifier
{
  return 0;
}

- (NSString)accessibilityIdentifier
{
  return 0;
}

- (NSString)statisticsIdentifier
{
  return 0;
}

- (NSString)accessoryTitleKey
{
  return 0;
}

- (NSString)symbolName
{
  return (NSString *)CFSTR("questionmark.app");
}

- (id)symbolConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 3, 2, 18.0);
}

- (double)symbolScaleValue
{
  return 0.368;
}

- (UIColor)symbolOnColor
{
  return 0;
}

- (BOOL)supportsSelection
{
  return 0;
}

- (BOOL)isSelected
{
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  id v4;

  -[CSQuickAction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isSelectedDidChangeForAction:", self);

}

- (NSString)selectedSymbolName
{
  return (NSString *)CFSTR("questionmark.app.fill");
}

- (BOOL)showsButton
{
  return 1;
}

- (BOOL)allowsInteraction
{
  return 1;
}

- (NSString)unavailableSymbolName
{
  return (NSString *)CFSTR("questionmark.square.dashed");
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (CSQuickActionDelegate)delegate
{
  return (CSQuickActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
