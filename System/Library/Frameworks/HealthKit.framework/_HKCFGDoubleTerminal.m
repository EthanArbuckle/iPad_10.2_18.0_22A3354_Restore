@implementation _HKCFGDoubleTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  int v6;
  uint64_t (**condition)(double);
  double v9;

  v9 = 0.0;
  v6 = objc_msgSend(a4, "scanDouble:", &v9);
  if (v6)
  {
    condition = (uint64_t (**)(double))self->_condition;
    if (!condition || (v6 = condition[2](v9)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_label
{
  return CFSTR("<d>");
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (id)characterSet
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("+-."));
  return v2;
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_condition, 0);
}

@end
