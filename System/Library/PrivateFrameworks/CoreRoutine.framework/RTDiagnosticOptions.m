@implementation RTDiagnosticOptions

+ (id)RTDiagnosticOptionsMaskToString:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v5, "addObject:", CFSTR("Location Workout Studies"));
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v4, "addObject:", CFSTR("CoreRoutine"));
  if ((v3 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 4) != 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", CFSTR("Location Monitoring Studies"));
LABEL_5:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RTDiagnosticOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOptionsMask_);
}

- (RTDiagnosticOptions)initWithOptionsMask:(unint64_t)a3
{
  RTDiagnosticOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTDiagnosticOptions;
  result = -[RTDiagnosticOptions init](&v5, sel_init);
  if (result)
    result->_optionsMask = a3;
  return result;
}

- (BOOL)hasMask:(unint64_t)a3
{
  return (-[RTDiagnosticOptions optionsMask](self, "optionsMask") & a3) != 0;
}

- (void)setMask:(unint64_t)a3
{
  -[RTDiagnosticOptions setOptionsMask:](self, "setOptionsMask:", -[RTDiagnosticOptions optionsMask](self, "optionsMask") | a3);
}

- (void)clearMask
{
  -[RTDiagnosticOptions setOptionsMask:](self, "setOptionsMask:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTDiagnosticOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  RTDiagnosticOptions *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionsMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[RTDiagnosticOptions initWithOptionsMask:](self, "initWithOptionsMask:", objc_msgSend(v5, "unsignedIntegerValue"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t optionsMask;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  optionsMask = self->_optionsMask;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", optionsMask);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("optionsMask"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "RTDiagnosticOptionsMaskToString:", -[RTDiagnosticOptions optionsMask](self, "optionsMask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("optionsMask, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(unint64_t)a3
{
  self->_optionsMask = a3;
}

@end
