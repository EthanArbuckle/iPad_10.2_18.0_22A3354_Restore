@implementation EFSQLFunction

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

+ (id)likely:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("likely"), v5);

  return v6;
}

+ (id)ifNull:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("ifnull"), v8);

  return v9;
}

- (EFSQLFunction)initWithName:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  EFSQLFunction *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSArray *arguments;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLFunction;
  v8 = -[EFSQLFunction init](&v14, sel_init);
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

+ (id)unlikely:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("unlikely"), v5);

  return v6;
}

+ (id)abs:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("abs"), v5);

  return v6;
}

+ (id)char:(id)a3
{
  id v3;
  EFSQLFunction *v4;

  v3 = a3;
  v4 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("char"), v3);

  return v4;
}

+ (id)coalesce:(id)a3
{
  id v5;
  EFSQLFunction *v6;
  void *v8;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLFunction.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expressions.count >= 2"));

  }
  v6 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("coalesce"), v5);

  return v6;
}

+ (id)glob:(id)a3 expression:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("glob"), v8);

  return v9;
}

+ (id)hex:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("hex"), v5);

  return v6;
}

+ (id)inStr:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("instr"), v8);

  return v9;
}

+ (id)length:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("length"), v5);

  return v6;
}

+ (id)like:(id)a3 expression:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("like"), v8);

  return v9;
}

+ (id)like:(id)a3 expression:(id)a4 escape:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  id v8;
  _EFSQLCharacterExpression *v9;
  EFSQLFunction *v10;
  void *v11;
  EFSQLFunction *v12;
  _QWORD v14[4];

  v5 = a5;
  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[_EFSQLCharacterExpression initWithCharacter:]([_EFSQLCharacterExpression alloc], "initWithCharacter:", v5);
  v10 = [EFSQLFunction alloc];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EFSQLFunction initWithName:arguments:](v10, "initWithName:arguments:", CFSTR("like"), v11);

  return v12;
}

+ (id)lower:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("lower"), v5);

  return v6;
}

+ (id)ltrim:(id)a3 pattern:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("ltrim"), v8);

  return v9;
}

+ (id)max:(id)a3
{
  id v5;
  EFSQLFunction *v6;
  void *v8;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLFunction.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expressions.count >= 2"));

  }
  v6 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("max"), v5);

  return v6;
}

+ (id)min:(id)a3
{
  id v5;
  EFSQLFunction *v6;
  void *v8;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLFunction.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expressions.count >= 2"));

  }
  v6 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("min"), v5);

  return v6;
}

+ (id)nullIf:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("nullif"), v8);

  return v9;
}

+ (id)replace:(id)a3 pattern:(id)a4 replacement:(id)a5
{
  id v7;
  id v8;
  id v9;
  EFSQLFunction *v10;
  void *v11;
  EFSQLFunction *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [EFSQLFunction alloc];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EFSQLFunction initWithName:arguments:](v10, "initWithName:arguments:", CFSTR("replace"), v11);

  return v12;
}

+ (id)round:(id)a3 digits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  EFSQLFunction *v10;
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
  v10 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("round"), v8);

  return v10;
}

+ (id)rtrim:(id)a3 pattern:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("rtrim"), v8);

  return v9;
}

+ (id)substr:(id)a3 index:(id)a4 length:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  EFSQLFunction *v13;
  _QWORD v15[2];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v16[0] = v7;
    v16[1] = v8;
    v16[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15[0] = v7;
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v13 = -[EFSQLFunction initWithName:arguments:]([EFSQLFunction alloc], "initWithName:arguments:", CFSTR("substr"), v11);

  return v13;
}

+ (id)trim:(id)a3 pattern:(id)a4
{
  id v5;
  id v6;
  EFSQLFunction *v7;
  void *v8;
  EFSQLFunction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [EFSQLFunction alloc];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EFSQLFunction initWithName:arguments:](v7, "initWithName:arguments:", CFSTR("trim"), v8);

  return v9;
}

+ (id)typeOf:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("typeof"), v5);

  return v6;
}

+ (id)upper:(id)a3
{
  id v3;
  EFSQLFunction *v4;
  void *v5;
  EFSQLFunction *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [EFSQLFunction alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLFunction initWithName:arguments:](v4, "initWithName:arguments:", CFSTR("upper"), v5);

  return v6;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLFunction ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
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
