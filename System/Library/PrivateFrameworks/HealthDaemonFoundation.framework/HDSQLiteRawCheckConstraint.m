@implementation HDSQLiteRawCheckConstraint

- (_QWORD)_initWithSQL:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HDSQLiteRawCheckConstraint;
    a1 = objc_msgSendSuper2(&v7, sel__init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

+ (id)checkConstraintWithSQL:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[HDSQLiteRawCheckConstraint _initWithSQL:]([HDSQLiteRawCheckConstraint alloc], v3);

  return v4;
}

- (id)SQLCheckConstraint
{
  return self->_rawSQL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSQL, 0);
}

@end
