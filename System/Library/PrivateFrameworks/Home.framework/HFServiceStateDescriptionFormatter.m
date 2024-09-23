@implementation HFServiceStateDescriptionFormatter

- (void)setDescriptionContext:(unint64_t)a3
{
  self->_descriptionContext = a3;
}

- (id)stringForObjectValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "stateClassIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("HFServiceDescription.%@, State:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HFServiceStateDescriptionFormatter descriptionContext](self, "descriptionContext");
  if (v9 == 1)
    v10 = CFSTR("Control");
  else
    v10 = 0;
  v11 = v10;
  if (v9 != 1
    || (objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(", Context:%@"), CFSTR("Control")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        _HFLocalizedStringWithDefaultValue(v12, 0, 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    _HFLocalizedStringWithDefaultValue(v8, v8, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (unint64_t)descriptionContext
{
  return self->_descriptionContext;
}

@end
