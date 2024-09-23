@implementation CNFRegEditablePhoneTableCell

- (CNFRegEditablePhoneTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNFRegEditablePhoneTableCell *v4;
  CNFRegEditablePhoneTableCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegEditablePhoneTableCell;
  v4 = -[CNFRegEditablePhoneTableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(-[PSEditableTableCell textField](v4, "textField"), "setTextSuggestionDelegate:", v4);
    objc_msgSend((id)objc_msgSend(-[PSEditableTableCell textField](v5, "textField"), "textInputTraits"), "setContentsIsSingleValue:", 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(-[PSEditableTableCell textField](self, "textField"), "setTextSuggestionDelegate:", 0);

  self->_previousValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEditablePhoneTableCell;
  -[CNFRegEditableTableCell dealloc](&v3, sel_dealloc);
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  NSString *v7;
  SEL v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNFRegEditablePhoneTableCell;
  -[CNFRegEditableTableCell setValueChangedTarget:action:specifier:](&v10, sel_setValueChangedTarget_action_specifier_, a3, a4);
  v7 = (NSString *)objc_msgSend(a5, "propertyForKey:", CFSTR("cnf-phoneFieldCountryCodeSelector"));
  if (v7)
  {
    v8 = NSSelectorFromString(v7);
    if (v8)
    {
      v9 = v8;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->_countryCodeSelector = v9;
    }
  }
}

- (id)countryCode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75698]);
  if (!v3 || !self->_countryCodeSelector || (v4 = (void *)objc_msgSend(v3, "performSelector:")) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  }
  return (id)objc_msgSend(v4, "lowercaseString");
}

- ($DD3A1F8A2207B362078E6A88C433B5B6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  void *v5;
  uint64_t v6;
  NSString *previousValue;
  void *v8;
  unint64_t v9;
  $DD3A1F8A2207B362078E6A88C433B5B6 result;

  -[CNFRegEditablePhoneTableCell countryCode](self, "countryCode");
  v5 = (void *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
    previousValue = self->_previousValue;
    self->_previousValue = (NSString *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  v8 = (void *)v6;
  v9 = 0;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

@end
