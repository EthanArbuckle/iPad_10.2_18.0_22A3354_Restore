@implementation MUContactLabeledValue

- (NSString)titleString
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_type - 1;
  if (v2 > 2)
  {
    v3 = &stru_1E2E05448;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E2E03628[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)valueString
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  __CFString *String;
  char v12;
  void *v13;

  -[CNLabeledValue value](self->_labeledValue, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CNLabeledValue value](self->_labeledValue, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const void *)CFPhoneNumberCreate();

    if (v10)
    {
      String = (__CFString *)CFPhoneNumberCreateString();
      CFRelease(v10);
    }
    else
    {
      String = &stru_1E2E05448;
    }
LABEL_9:

    return (NSString *)String;
  }
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    if (self->_type != 3)
    {
      -[CNLabeledValue value](self->_labeledValue, "value");
      String = (__CFString *)objc_claimAutoreleasedReturnValue();
      return (NSString *)String;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[CNLabeledValue value](self->_labeledValue, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_mapkit_shortenedURLStringForFullURLString:", v7);
    String = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  String = &stru_1E2E05448;
  return (NSString *)String;
}

- (id)glyphName
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 2)
    return &stru_1E2E05448;
  else
    return off_1E2E03640[v2];
}

- (MUContactLabeledValue)initWithContactLabeledValue:(id)a3 type:(int64_t)a4
{
  id v7;
  MUContactLabeledValue *v8;
  MUContactLabeledValue *v9;
  uint64_t v10;
  NSString *symbolName;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUContactLabeledValue;
  v8 = -[MUContactLabeledValue init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_labeledValue, a3);
    -[MUContactLabeledValue glyphName](v9, "glyphName");
    v10 = objc_claimAutoreleasedReturnValue();
    symbolName = v9->_symbolName;
    v9->_symbolName = (NSString *)v10;

  }
  return v9;
}

- (int)analyticsTarget
{
  unint64_t type;

  type = self->_type;
  if (type > 3)
    return 0;
  else
    return dword_191F067A0[type];
}

- (int64_t)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(int64_t)a3
{
  self->_actionVariant = a3;
}

- (NSString)alternativeTitleString
{
  return self->_alternativeTitleString;
}

- (void)setAlternativeTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTitleString, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (int)analyticAction
{
  return self->_analyticAction;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)emphasizeValueString
{
  return self->_emphasizeValueString;
}

- (void)setEmphasizeValueString:(BOOL)a3
{
  self->_emphasizeValueString = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end
