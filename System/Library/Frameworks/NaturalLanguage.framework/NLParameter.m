@implementation NLParameter

+ (id)parameterWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:minimumValue:maximumValue:", v10, a4, a5, a6);

  return v11;
}

- (NLParameter)initWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6
{
  id v10;
  NLParameter *v11;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLParameter;
  v11 = -[NLParameter init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_parameterType = a4;
    v11->_minimumValue = a5;
    v11->_maximumValue = a6;
  }

  return v11;
}

- (id)_shortDescription
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = -[NLParameter parameterType](self, "parameterType");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NLParameter name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameter minimumValue](self, "minimumValue");
  v7 = v6;
  -[NLParameter maximumValue](self, "maximumValue");
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/integral(%lld - %lld)"), v5, (uint64_t)v7, (uint64_t)v8);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/continuous(%.3g - %.3g)"), v5, *(_QWORD *)&v7, *(_QWORD *)&v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NLParameter;
  -[NLParameter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameter _shortDescription](self, "_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  unint64_t v9;

  -[NLParameter name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ (-[NLParameter parameterType](self, "parameterType") << 16);
  -[NLParameter minimumValue](self, "minimumValue");
  v7 = v5 ^ (uint64_t)(v6 * 1000.0);
  -[NLParameter maximumValue](self, "maximumValue");
  v9 = v7 ^ (uint64_t)(v8 * 1000.0);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NLParameter *v4;
  NLParameter *v5;
  void *v6;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = (NLParameter *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_10;
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[NLParameter name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameter name](v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    v8 = -[NLParameter parameterType](self, "parameterType");
    if (v8 == -[NLParameter parameterType](v5, "parameterType"))
    {
      -[NLParameter minimumValue](self, "minimumValue");
      v10 = v9;
      -[NLParameter minimumValue](v5, "minimumValue");
      if (v10 == v11)
      {
        -[NLParameter maximumValue](self, "maximumValue");
        v14 = v13;
        -[NLParameter maximumValue](v5, "maximumValue");
        v16 = v15;

        if (v14 != v16)
          goto LABEL_8;
LABEL_10:
        v12 = 1;
        goto LABEL_11;
      }
    }
  }

LABEL_8:
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLParameter requires keyed coding"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  -[NLParameter name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("NLName"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[NLParameter parameterType](self, "parameterType"), CFSTR("NLParameterType"));
  -[NLParameter minimumValue](self, "minimumValue");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("NLMinimumValue"));
  -[NLParameter maximumValue](self, "maximumValue");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("NLMaximumValue"));

}

- (NLParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  NLParameter *v10;
  id v12;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLParameter requires keyed coding"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLParameterType"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NLMinimumValue"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NLMaximumValue"));
  v10 = -[NLParameter initWithName:type:minimumValue:maximumValue:](self, "initWithName:type:minimumValue:maximumValue:", v5, v6, v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = -[NLParameter parameterType](self, "parameterType");
  v4 = CFSTR("Integral");
  if (!v3)
    v4 = CFSTR("Continuous");
  v13[0] = CFSTR("Name");
  v5 = v4;
  -[NLParameter name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = v5;
  v13[1] = CFSTR("ParameterType");
  v13[2] = CFSTR("MinimumValue");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NLParameter minimumValue](self, "minimumValue");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("MaximumValue");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[NLParameter maximumValue](self, "maximumValue");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  NLParameter *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  objc_msgSend(v7, "objectForKey:", CFSTR("Name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ParameterType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MinimumValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MaximumValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v4 = (NLParameter *)0x1E0CB3000;
    objc_opt_class();
    v12 = 1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((objc_msgSend(v9, "isEqualToString:", CFSTR("Continuous")) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", CFSTR("Integral"))))
        {
          if (v10)
          {
            v4 = (NLParameter *)0x1E0CB3000;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v11)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("Continuous")) ^ 1;
                  objc_msgSend(v10, "doubleValue");
                  v15 = v14;
                  objc_msgSend(v11, "doubleValue");
                  self = -[NLParameter initWithName:type:minimumValue:maximumValue:](self, "initWithName:type:minimumValue:maximumValue:", v8, v13, v15, v16);
                  v12 = 0;
                  v4 = self;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v12 = 1;
  }

  if (v12)
  {
LABEL_15:
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("Invalid parameter bundle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v4 = 0;
  }

  return v4;
}

- (id)_hyperTuneDictionary
{
  int64_t v3;
  void **v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v3 = -[NLParameter parameterType](self, "parameterType");
  v4 = (void **)MEMORY[0x1E0D50548];
  if (v3)
    v4 = (void **)MEMORY[0x1E0D50550];
  v5 = *v4;
  v16[0] = *MEMORY[0x1E0D50540];
  v6 = v5;
  -[NLParameter name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D50558];
  v17[0] = v7;
  v17[1] = v6;
  v9 = *MEMORY[0x1E0D50538];
  v16[1] = v8;
  v16[2] = v9;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[NLParameter minimumValue](self, "minimumValue");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E0D50530];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[NLParameter maximumValue](self, "maximumValue");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = *MEMORY[0x1E0D50528];
  v17[3] = v13;
  v17[4] = &unk_1E4A47C78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)parameterType
{
  return self->_parameterType;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
