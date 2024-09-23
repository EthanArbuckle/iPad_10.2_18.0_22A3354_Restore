@implementation CHMathResultWithContext

- (CHMathResultWithContext)initWithResult:(id)a3 declaredVariables:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHMathResultWithContext *v13;
  uint64_t v14;
  CHTokenizedMathResult *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CHMathResultWithContext;
  v13 = -[CHMathResultWithContext init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    v15 = v13->_result;
    v13->_result = (CHTokenizedMathResult *)v14;

    objc_storeStrong((id *)&v13->_declaredVariables, a4);
  }

  return v13;
}

- (CHTokenizedMathResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
