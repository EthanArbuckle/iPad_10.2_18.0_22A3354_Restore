@implementation SGMSqliteErrors

- (SGMSqliteErrors)init
{
  SGMSqliteErrors *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  PETScalarEventTracker *tracker;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SGMSqliteErrors;
  v2 = -[SGMSqliteErrors init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ErrorCode"), 0, 7000, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D80F38]);
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("SqliteErrors"), v5, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 errorCode:(unint64_t)a4
{
  PETScalarEventTracker *tracker;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  tracker = self->_tracker;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v7, a3);

}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
