@implementation CNNameListBuilderBlockDelegate

- (BOOL)builder:(id)a3 isValidLengthOfString:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v5 = a4;
  -[CNNameListBuilderBlockDelegate lengthValidationBlock](self, "lengthValidationBlock");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v5);

  return v7;
}

- (id)builder:(id)a3 nameAtIndex:(int64_t)a4
{
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  -[CNNameListBuilderBlockDelegate nameProviderBlock](self, "nameProviderBlock", a3);
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)countOfNames
{
  return self->_countOfNames;
}

- (void)setCountOfNames:(int64_t)a3
{
  self->_countOfNames = a3;
}

- (id)nameProviderBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNameProviderBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)lengthValidationBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLengthValidationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lengthValidationBlock, 0);
  objc_storeStrong(&self->_nameProviderBlock, 0);
}

@end
