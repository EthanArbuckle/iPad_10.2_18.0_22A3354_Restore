@implementation MIOParameterDescription

- (MIOParameterDescription)initWithKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5
{
  id v8;
  id v9;
  id v10;
  MIOParameterDescription *v11;
  uint64_t v12;
  NSString *key;
  uint64_t v14;
  MIONumericConstraint *numericConstraint;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MIOParameterDescription;
  v11 = -[MIOParameterDescription init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    key = v11->_key;
    v11->_key = (NSString *)v12;

    objc_storeStrong(&v11->_defaultValue, a4);
    v14 = objc_msgSend(v10, "copy");
    numericConstraint = v11->_numericConstraint;
    v11->_numericConstraint = (MIONumericConstraint *)v14;

  }
  return v11;
}

- (MIOParameterDescription)initWithKey:(id)a3 doubleParameter:(const void *)a4
{
  id v6;
  void *v7;
  CoreML::Specification::DoubleRange *v8;
  CoreML::Specification::DoubleRange *v9;
  void *v10;
  uint64_t *v11;
  MIONumericConstraint *v12;
  void *v13;
  MIOParameterDescription *v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)a4 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)a4 + 9) == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*((_QWORD *)a4 + 3) + 16));
    v8 = (CoreML::Specification::DoubleRange *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    if (*((_DWORD *)a4 + 9) == 10)
      v11 = (uint64_t *)*((_QWORD *)a4 + 3);
    else
      v11 = CoreML::Specification::DoubleRange::default_instance(v8);
    objc_msgSend(v10, "numberWithDouble:", *((double *)v11 + 3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MIONumericConstraint initWithMinimum:maximum:]([MIONumericConstraint alloc], "initWithMinimum:maximum:", v9, v13);

  }
  else
  {
    v12 = 0;
  }
  v14 = -[MIOParameterDescription initWithKey:defaultValue:numericConstraint:](self, "initWithKey:defaultValue:numericConstraint:", v6, v7, v12);

  return v14;
}

- (MIOParameterDescription)initWithKey:(id)a3 int64Parameter:(const void *)a4
{
  id v6;
  void *v7;
  int v8;
  CoreML::Specification::Int64Range *v9;
  CoreML::Specification::Int64Set *v10;
  void *v11;
  uint64_t *v12;
  CoreML::Specification::Int64Set *v13;
  uint64_t *v14;
  MIONumericConstraint *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  MIOParameterDescription *v21;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)a4 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *((_DWORD *)a4 + 9);
  if (v8 == 11)
  {
    v13 = (CoreML::Specification::Int64Set *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = v13;
    if (*((_DWORD *)a4 + 9) == 11)
      v14 = (uint64_t *)*((_QWORD *)a4 + 3);
    else
      v14 = CoreML::Specification::Int64Set::default_instance(v13);
    v17 = v14[3];
    if (v17)
      v18 = (_QWORD *)(v17 + 8);
    else
      v18 = 0;
    if (v17)
      v19 = v17 + 8 + 8 * *((int *)v14 + 4);
    else
      v19 = 0;
    while (v18 != (_QWORD *)v19)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreML::Specification::Int64Set addObject:](v10, "addObject:", v20);

      ++v18;
    }
    v15 = -[MIONumericConstraint initWithEnumeratedNumbers:]([MIONumericConstraint alloc], "initWithEnumeratedNumbers:", v10);
    goto LABEL_20;
  }
  if (v8 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*((_QWORD *)a4 + 3) + 16));
    v9 = (CoreML::Specification::Int64Range *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    if (*((_DWORD *)a4 + 9) == 10)
      v12 = (uint64_t *)*((_QWORD *)a4 + 3);
    else
      v12 = CoreML::Specification::Int64Range::default_instance(v9);
    objc_msgSend(v11, "numberWithLongLong:", v12[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MIONumericConstraint initWithMinimum:maximum:]([MIONumericConstraint alloc], "initWithMinimum:maximum:", v10, v16);

LABEL_20:
    goto LABEL_21;
  }
  v15 = 0;
LABEL_21:
  v21 = -[MIOParameterDescription initWithKey:defaultValue:numericConstraint:](self, "initWithKey:defaultValue:numericConstraint:", v6, v7, v15);

  return v21;
}

- (MIOParameterDescription)initWithKey:(id)a3 BOOLParameter:(const void *)a4
{
  id v6;
  void *v7;
  MIOParameterDescription *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)a4 + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MIOParameterDescription initWithKey:defaultValue:numericConstraint:](self, "initWithKey:defaultValue:numericConstraint:", v6, v7, 0);

  return v8;
}

- (MIOParameterDescription)initWithKey:(id)a3 stringParameter:(const void *)a4
{
  id v6;
  uint64_t *v7;
  void *v8;
  MIOParameterDescription *v9;

  v6 = a3;
  v7 = (uint64_t *)*((_QWORD *)a4 + 2);
  if (*((char *)v7 + 23) < 0)
    v7 = (uint64_t *)*v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MIOParameterDescription initWithKey:defaultValue:numericConstraint:](self, "initWithKey:defaultValue:numericConstraint:", v6, v8, 0);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIOParameterDescription key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOParameterDescription defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOParameterDescription numericConstraint](self, "numericConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MIOParameterDescription { key: %@, defaultValue: %@, numericConstraint: %@ }"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MIOParameterDescription *v4;
  MIOParameterDescription *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (MIOParameterDescription *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOParameterDescription key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOParameterDescription key](v5, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        -[MIOParameterDescription defaultValue](self, "defaultValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOParameterDescription defaultValue](v5, "defaultValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          -[MIOParameterDescription numericConstraint](self, "numericConstraint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {

          }
          else
          {
            -[MIOParameterDescription numericConstraint](v5, "numericConstraint");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
LABEL_11:
              v13 = 1;
LABEL_13:

              goto LABEL_14;
            }
          }
          -[MIOParameterDescription numericConstraint](self, "numericConstraint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIOParameterDescription numericConstraint](v5, "numericConstraint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) != 0)
            goto LABEL_11;
        }
      }
      v13 = 0;
      goto LABEL_13;
    }
    v13 = 0;
  }
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[MIOParameterDescription defaultValue](self, "defaultValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EFE30580);

  if (v4)
  {
    -[MIOParameterDescription defaultValue](self, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }
  -[MIOParameterDescription key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[MIOParameterDescription numericConstraint](self, "numericConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ v6 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (MIONumericConstraint)numericConstraint
{
  return self->_numericConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericConstraint, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
