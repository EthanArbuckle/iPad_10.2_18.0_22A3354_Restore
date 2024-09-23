@implementation HMBSQLStatementQueryPlanTuple

- (HMBSQLStatementQueryPlanTuple)initWithRow:(id)a3
{
  id v4;
  HMBSQLStatementQueryPlanTuple *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *detail;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBSQLStatementQueryPlanTuple;
  v5 = -[HMBSQLStatementQueryPlanTuple init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_row = objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_parent = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectAtIndex:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;

  }
  return v5;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMBSQLStatementQueryPlanTuple row](self, "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Row"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMBSQLStatementQueryPlanTuple parent](self, "parent", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Parent"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBSQLStatementQueryPlanTuple detail](self, "detail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Detail"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)row
{
  return self->_row;
}

- (int)parent
{
  return self->_parent;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
