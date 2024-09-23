@implementation EFSQLAggregateFunction

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;
  NSString *name;
  NSArray *arguments;
  NSString *v7;
  NSArray *v8;
  id v9;

  v4 = a3;
  name = self->_name;
  arguments = self->_arguments;
  v9 = v4;
  v7 = name;
  v8 = arguments;
  objc_msgSend(v9, "appendString:", v7);
  objc_msgSend(v9, "appendString:", CFSTR("("));
  -[NSArray ef_renderSQLExpressionInto:](v8, "ef_renderSQLExpressionInto:", v9);
  objc_msgSend(v9, "appendString:", CFSTR(")"));

}

+ (id)countDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "count:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)count:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  v6 = -[EFSQLAggregateFunction initWithName:arguments:]([EFSQLAggregateFunction alloc], "initWithName:arguments:", CFSTR("count"), v5);

  return v6;
}

- (EFSQLAggregateFunction)initWithName:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  EFSQLAggregateFunction *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSArray *arguments;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLAggregateFunction;
  v8 = -[EFSQLAggregateFunction init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    arguments = v8->_arguments;
    v8->_arguments = (NSArray *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)avg:(id)a3
{
  id v3;
  EFSQLAggregateFunction *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLAggregateFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("avg"), v5);

  return v6;
}

+ (id)avgDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "avg:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)groupConcat:(id)a3 separator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  EFSQLAggregateFunction *v10;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v13[0] = v5;
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = -[EFSQLAggregateFunction initWithName:arguments:]([EFSQLAggregateFunction alloc], "initWithName:arguments:", CFSTR("group_concat"), v8);

  return v10;
}

+ (id)max:(id)a3
{
  id v3;
  EFSQLAggregateFunction *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLAggregateFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("max"), v5);

  return v6;
}

+ (id)maxDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "max:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)min:(id)a3
{
  id v3;
  EFSQLAggregateFunction *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLAggregateFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("min"), v5);

  return v6;
}

+ (id)minDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "min:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sum:(id)a3
{
  id v3;
  EFSQLAggregateFunction *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLAggregateFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("sum"), v5);

  return v6;
}

+ (id)sumDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "sum:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)total:(id)a3
{
  id v3;
  EFSQLAggregateFunction *v4;
  void *v5;
  EFSQLAggregateFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLAggregateFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("total"), v5);

  return v6;
}

+ (id)totalDistinct:(id)a3
{
  id v4;
  _EFSQLDistinctExpression *v5;
  void *v6;

  v4 = a3;
  v5 = -[_EFSQLDistinctExpression initWithExpression:]([_EFSQLDistinctExpression alloc], "initWithExpression:", v4);
  objc_msgSend(a1, "total:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLAggregateFunction ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)arguments
{
  return self->_arguments;
}

@end
