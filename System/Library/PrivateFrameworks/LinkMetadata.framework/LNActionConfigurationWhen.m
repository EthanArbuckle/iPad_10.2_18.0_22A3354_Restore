@implementation LNActionConfigurationWhen

- (LNActionConfigurationWhen)initWithCondition:(id)a3 when:(id)a4 otherwise:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNActionConfigurationWhen *v12;
  uint64_t v13;
  LNActionConfigurationCondition *condition;
  uint64_t v15;
  LNActionConfiguration *when;
  uint64_t v17;
  LNActionConfiguration *otherwise;
  LNActionConfigurationWhen *v19;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfigurationWhen.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("when"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNActionConfigurationWhen;
  v12 = -[LNActionConfigurationWhen init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    condition = v12->_condition;
    v12->_condition = (LNActionConfigurationCondition *)v13;

    v15 = objc_msgSend(v10, "copy");
    when = v12->_when;
    v12->_when = (LNActionConfiguration *)v15;

    v17 = objc_msgSend(v11, "copy");
    otherwise = v12->_otherwise;
    v12->_otherwise = (LNActionConfiguration *)v17;

    v19 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationWhen condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationWhen when](self, "when");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationWhen otherwise](self, "otherwise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, condition: %@, when: %@, otherwise: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LNActionConfigurationWhen)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNActionConfigurationWhen *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("condition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("when"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherwise"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[LNActionConfigurationWhen initWithCondition:when:otherwise:](self, "initWithCondition:when:otherwise:", v5, v6, v7);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNActionConfigurationWhen condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("condition"));

  -[LNActionConfigurationWhen when](self, "when");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("when"));

  -[LNActionConfigurationWhen otherwise](self, "otherwise");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("otherwise"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNActionConfigurationWhen when](self, "when");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionConfigurationWhen otherwise](self, "otherwise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNActionConfigurationWhen *v4;
  LNActionConfigurationWhen *v5;
  LNActionConfigurationWhen *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNActionConfigurationWhen *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNActionConfigurationWhen condition](self, "condition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationWhen condition](v6, "condition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNActionConfigurationWhen when](self, "when");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationWhen when](v6, "when");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNActionConfigurationWhen otherwise](self, "otherwise");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationWhen otherwise](v6, "otherwise");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (LNActionConfigurationCondition)condition
{
  return self->_condition;
}

- (LNActionConfiguration)when
{
  return self->_when;
}

- (LNActionConfiguration)otherwise
{
  return self->_otherwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherwise, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
