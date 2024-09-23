@implementation MUAddMissingDataLabeledValue

- (NSString)titleString
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_type - 2;
  if (v2 > 2)
  {
    v3 = &stru_1E2E05448;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E2E03658[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)valueString
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_type - 2;
  if (v2 > 2)
  {
    v3 = &stru_1E2E05448;
  }
  else
  {
    _MULocalizedStringFromThisBundle(off_1E2E03670[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (MUAddMissingDataLabeledValue)initWithType:(int64_t)a3
{
  MUAddMissingDataLabeledValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUAddMissingDataLabeledValue;
  result = -[MUAddMissingDataLabeledValue init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (int)analyticsTarget
{
  return 0;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
}

- (id)analyticsButtonValue
{
  int64_t v2;
  uint64_t v3;

  v2 = -[MUAddMissingDataLabeledValue type](self, "type");
  if ((unint64_t)(v2 - 2) > 2)
    v3 = 0;
  else
    v3 = dword_191F067B0[v2 - 2];
  return (id)objc_msgSend(MEMORY[0x1E0D27458], "moduleButtonForType:", v3);
}

@end
