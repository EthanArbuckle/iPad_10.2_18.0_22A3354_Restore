@implementation ML3DatabaseColumn

- (ML3DatabaseColumn)initWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6
{
  id v10;
  id v11;
  ML3DatabaseColumn *v12;
  uint64_t v13;
  NSString *name;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ML3DatabaseColumn;
  v12 = -[ML3DatabaseColumn init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_datatype = a4;
    v12->_columnConstraints = a5;
    objc_storeStrong(&v12->_defaultValue, a6);
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, name = '%@'>"), objc_opt_class(), self, self->_name);
}

- (id)_columnDefinitionSQL
{
  id v4;
  unint64_t columnConstraints;
  id defaultValue;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  columnConstraints = self->_columnConstraints;
  if ((columnConstraints & 1) == 0)
  {
    if ((columnConstraints & 0x10) == 0)
      goto LABEL_3;
    goto LABEL_24;
  }
  v11 = (void *)objc_msgSend(CFSTR("PRIMARY KEY"), "mutableCopy");
  v12 = v11;
  v13 = self->_columnConstraints;
  if ((v13 & 2) != 0)
  {
    v14 = CFSTR(" ASC");
  }
  else
  {
    if ((v13 & 4) == 0)
      goto LABEL_21;
    v14 = CFSTR(" DESC");
  }
  objc_msgSend(v11, "appendString:", v14);
  v13 = self->_columnConstraints;
LABEL_21:
  if ((v13 & 8) != 0)
    objc_msgSend(v12, "appendString:", CFSTR(" AUTOINCREMENT"));
  objc_msgSend(v4, "addObject:", v12);

  columnConstraints = self->_columnConstraints;
  if ((columnConstraints & 0x10) == 0)
  {
LABEL_3:
    if ((columnConstraints & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
LABEL_24:
  objc_msgSend(v4, "addObject:", CFSTR("NOT NULL"));
  if ((self->_columnConstraints & 0x20) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", CFSTR("UNIQUE"));
LABEL_5:
  defaultValue = self->_defaultValue;
  if (defaultValue)
  {
    objc_msgSend(defaultValue, "ml_stringValueForSQL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseColumn.m"), 79, CFSTR("Unsupported default value type %@"), self->_defaultValue);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DEFAULT %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v9 = self->_datatype - 1;
  if (v9 > 4)
    v10 = 0;
  else
    v10 = *((_QWORD *)&off_1E5B5C388 + v9);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), self->_name, v10, v15);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_name, v10, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)datatype
{
  return self->_datatype;
}

- (unint64_t)columnConstraints
{
  return self->_columnConstraints;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)columnWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a6;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:datatype:constraints:defaultValue:", v10, a4, a5, v9);

  return v11;
}

@end
