@implementation CNPropertyPhoneNumberEditingCell

- (CNPropertyPhoneNumberEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyPhoneNumberEditingCell *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPhoneNumberEditingCell;
  v4 = -[CNPropertyEditingCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[CNPropertySimpleEditingCell textField](v4, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentsIsSingleValue:", 1);

  -[CNPropertySimpleEditingCell textField](v4, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextSuggestionDelegate:", v4);

  return v4;
}

- ($2F1B37ED1B693547D8B5125E586513E6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  _QWORD v16[2];
  $2F1B37ED1B693547D8B5125E586513E6 result;

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("tel:")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("tel:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByRemovingPercentEncoding");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_previousValue, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPhoneNumberEditingCell setPreviousValue:](self, "setPreviousValue:", v12);

    v13 = -[CNPropertyPhoneNumberEditingCell previousValue](self, "previousValue");
  }
  else
  {
    v13 = 0;
  }

  v14 = v13;
  v15 = 0;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (NSArray)previousValue
{
  return self->_previousValue;
}

- (void)setPreviousValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousValue, 0);
}

@end
