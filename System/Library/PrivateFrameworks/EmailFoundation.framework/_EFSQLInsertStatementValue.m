@implementation _EFSQLInsertStatementValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressables, 0);
  objc_storeStrong((id *)&self->_bindables, 0);
  objc_storeStrong((id *)&self->_requiredColumns, 0);
}

- (_QWORD)initWithRequiredColumns:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_EFSQLInsertStatementValue;
    v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      v6 = objc_opt_new();
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_opt_new();
      v9 = (void *)a1[3];
      a1[3] = v8;

    }
  }

  return a1;
}

@end
