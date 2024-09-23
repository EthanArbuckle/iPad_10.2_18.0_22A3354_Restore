@implementation _UIKeyboardArbiterSceneFocusRequest

- (_UIKeyboardArbiterSceneFocusRequest)initWithShouldStealKeyboardOnSuccess:(BOOL)a3
{
  _UIKeyboardArbiterSceneFocusRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterSceneFocusRequest;
  result = -[_UIKeyboardArbiterSceneFocusRequest init](&v5, sel_init);
  if (result)
    result->_shouldStealKeyboardOnSuccess = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _UIKeyboardArbiterSceneFocusRequest *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = v8 == self || v8->_shouldStealKeyboardOnSuccess == self->_shouldStealKeyboardOnSuccess;
  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE38388], "descriptionForRootObject:", self);
}

- (BOOL)shouldStealKeyboardOnSuccess
{
  return self->_shouldStealKeyboardOnSuccess;
}

- (void)setShouldStealKeyboardOnSuccess:(BOOL)a3
{
  self->_shouldStealKeyboardOnSuccess = a3;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIKeyboardArbiterSceneFocusRequest *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65___UIKeyboardArbiterSceneFocusRequest_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_24DAA00C0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

@end
