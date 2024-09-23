@implementation MLParameterDescription

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MLParameterDescription key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[MLParameterDescription defaultValue](self, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("defaultValue"));

  -[MLParameterDescription numericConstraint](self, "numericConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("numericConstraint"));

}

- (MLParameterDescription)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  MLParameterDescription *v15;
  id v17;
  id v18;
  id v19;
  _QWORD v20[16];

  v20[15] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v20[5] = objc_opt_class();
  v20[6] = objc_opt_class();
  v20[7] = objc_opt_class();
  v20[8] = objc_opt_class();
  v20[9] = objc_opt_class();
  v20[10] = objc_opt_class();
  v20[11] = objc_opt_class();
  v20[12] = objc_opt_class();
  v20[13] = objc_opt_class();
  v20[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  v19 = 0;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("key"), &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v18 = v10;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("defaultValue"), &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  v17 = v12;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("numericConstraint"), &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  +[MLParameterDescription parameterDescriptionForKey:defaultValue:numericConstraint:](MLParameterDescription, "parameterDescriptionForKey:defaultValue:numericConstraint:", v9, v11, v13);
  v15 = (MLParameterDescription *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MLParameterDescription key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\nparameterKey: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MLParameterDescription defaultValue](self, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\ndefaultValue: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  -[MLParameterDescription numericConstraint](self, "numericConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[MLParameterDescription numericConstraint](self, "numericConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("\nnumericConstraint: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v13);

  }
  return v3;
}

- (MLParameterKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (MLNumericConstraint)numericConstraint
{
  return self->_numericConstraint;
}

- (void)setNumericConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_numericConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericConstraint, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)parameterDescriptionForKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5
{
  id v7;
  id v8;
  id v9;
  MLParameterDescription *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MLParameterDescription);
  -[MLParameterDescription setKey:](v10, "setKey:", v9);

  -[MLParameterDescription setDefaultValue:](v10, "setDefaultValue:", v8);
  -[MLParameterDescription setNumericConstraint:](v10, "setNumericConstraint:", v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parameterDescriptionForKey:(id)a3 int64ParameterSpec:(const void *)a4
{
  id v5;
  int v6;
  CoreML::Specification::protobuf_DataStructures_2eproto *inited;
  void *v8;
  uint64_t i;
  uint64_t *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = *((_DWORD *)a4 + 9);
  if (v6 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*((_QWORD *)a4 + 3) + 16));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_DWORD *)a4 + 9) == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*((_QWORD *)a4 + 3) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &unk_1E3DA2620;
    }
    goto LABEL_18;
  }
  if (v6 != 11 || *(int *)(*((_QWORD *)a4 + 3) + 16) < 1)
  {
    v14 = &unk_1E3DA2620;
    v8 = &unk_1E3DA2608;
LABEL_18:
    +[MLNumericConstraint numericConstraintWithMinNumber:maxNumber:](MLNumericConstraint, "numericConstraintWithMinNumber:maxNumber:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)objc_claimAutoreleasedReturnValue();
  v8 = inited;
  for (i = 0; ; ++i)
  {
    if (*((_DWORD *)a4 + 9) == 11)
    {
      v10 = (uint64_t *)*((_QWORD *)a4 + 3);
    }
    else
    {
      inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
      v10 = &CoreML::Specification::_Int64Set_default_instance_;
    }
    if (i >= *((int *)v10 + 4))
      break;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    if (*((_DWORD *)a4 + 9) == 11)
    {
      v12 = (uint64_t *)*((_QWORD *)a4 + 3);
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
      v12 = &CoreML::Specification::_Int64Set_default_instance_;
    }
    objc_msgSend(v11, "numberWithLongLong:", *(_QWORD *)(v12[3] + 8 * i + 8));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
  +[MLNumericConstraint numericConstraintWithEnumeratedNumbers:](MLNumericConstraint, "numericConstraintWithEnumeratedNumbers:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)a4 + 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterDescription parameterDescriptionForKey:defaultValue:numericConstraint:](MLParameterDescription, "parameterDescriptionForKey:defaultValue:numericConstraint:", v5, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)parameterDescriptionForKey:(id)a3 doubleParameterSpec:(const void *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (*((_DWORD *)a4 + 9) == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*((_QWORD *)a4 + 3) + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_DWORD *)a4 + 9) == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*((_QWORD *)a4 + 3) + 24));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &unk_1E3DA1D88;
    }
  }
  else
  {
    v7 = &unk_1E3DA1D88;
    v6 = &unk_1E3DA1D78;
  }
  +[MLNumericConstraint numericConstraintWithMinNumber:maxNumber:](MLNumericConstraint, "numericConstraintWithMinNumber:maxNumber:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)a4 + 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterDescription parameterDescriptionForKey:defaultValue:numericConstraint:](MLParameterDescription, "parameterDescriptionForKey:defaultValue:numericConstraint:", v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)parameterDescriptionForKey:(id)a3 stringParameterSpec:(const void *)a4
{
  id v5;
  uint64_t *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (uint64_t *)*((_QWORD *)a4 + 2);
  if (*((char *)v6 + 23) < 0)
    v6 = (uint64_t *)*v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterDescription parameterDescriptionForKey:defaultValue:numericConstraint:](MLParameterDescription, "parameterDescriptionForKey:defaultValue:numericConstraint:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)parameterDescriptionForKey:(id)a3 BOOLParameterSpec:(const void *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)a4 + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterDescription parameterDescriptionForKey:defaultValue:numericConstraint:](MLParameterDescription, "parameterDescriptionForKey:defaultValue:numericConstraint:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
