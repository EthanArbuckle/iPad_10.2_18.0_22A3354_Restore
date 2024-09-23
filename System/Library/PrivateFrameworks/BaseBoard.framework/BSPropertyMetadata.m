@implementation BSPropertyMetadata

- (void)setClassType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setDefaultValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (BOOL)isNumber
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    return !v1 || v1 == objc_opt_class();
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  id defaultValue;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_name;
    v7 = self->_defaultKey;
    defaultValue = self->_defaultValue;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    defaultValue = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name=%@, defaultKey=%@, defaultValue=%@>"), v5, self, v6, v7, defaultValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_defaultKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_setterName, 0);
  objc_storeStrong((id *)&self->_getterName, 0);
  objc_storeStrong((id *)&self->_classType, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
}

@end
