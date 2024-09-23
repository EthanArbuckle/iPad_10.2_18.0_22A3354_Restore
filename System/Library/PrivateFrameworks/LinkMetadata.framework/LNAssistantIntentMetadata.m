@implementation LNAssistantIntentMetadata

- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 impliedValues:(id)a6 availabilityAnnotations:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  LNAssistantIntentMetadata *v18;
  uint64_t v19;
  NSString *intentIdentifier;
  uint64_t v21;
  NSArray *phraseTemplates;
  uint64_t v23;
  NSDictionary *parameterValues;
  uint64_t v25;
  NSDictionary *impliedValues;
  uint64_t v27;
  NSDictionary *availabilityAnnotations;
  LNAssistantIntentMetadata *v29;
  void *v31;
  void *v32;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantIntentMetadata.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intentIdentifier"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantIntentMetadata.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phraseTemplates"));

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)LNAssistantIntentMetadata;
  v18 = -[LNAssistantIntentMetadata init](&v33, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    intentIdentifier = v18->_intentIdentifier;
    v18->_intentIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    phraseTemplates = v18->_phraseTemplates;
    v18->_phraseTemplates = (NSArray *)v21;

    v23 = objc_msgSend(v15, "copy");
    parameterValues = v18->_parameterValues;
    v18->_parameterValues = (NSDictionary *)v23;

    v25 = objc_msgSend(v16, "copy");
    impliedValues = v18->_impliedValues;
    v18->_impliedValues = (NSDictionary *)v25;

    v27 = objc_msgSend(v17, "copy");
    availabilityAnnotations = v18->_availabilityAnnotations;
    v18->_availabilityAnnotations = (NSDictionary *)v27;

    v29 = v18;
  }

  return v18;
}

- (LNAssistantIntentMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  LNAssistantIntentMetadata *v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("phraseTemplates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("parameterValues"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("impliedValues"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0C99E60];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("availabilityAnnotations"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[LNAssistantIntentMetadata initWithIntentIdentifier:phraseTemplates:parameterValues:impliedValues:availabilityAnnotations:]([LNAssistantIntentMetadata alloc], "initWithIntentIdentifier:phraseTemplates:parameterValues:impliedValues:availabilityAnnotations:", v5, v9, v14, v19, v24);
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[LNAssistantIntentMetadata intentIdentifier](self, "intentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intentIdentifier"));

  -[LNAssistantIntentMetadata phraseTemplates](self, "phraseTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phraseTemplates"));

  -[LNAssistantIntentMetadata parameterValues](self, "parameterValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parameterValues"));

  -[LNAssistantIntentMetadata impliedValues](self, "impliedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("impliedValues"));

  -[LNAssistantIntentMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("availabilityAnnotations"));

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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantIntentMetadata intentIdentifier](self, "intentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantIntentMetadata phraseTemplates](self, "phraseTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantIntentMetadata parameterValues](self, "parameterValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantIntentMetadata impliedValues](self, "impliedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantIntentMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, intentIdentifier: %@, phraseTemplates: %@, parameterValues: %@, impliedValues: %@, availabilityAnnotation: %@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[LNAssistantIntentMetadata intentIdentifier](self, "intentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAssistantIntentMetadata phraseTemplates](self, "phraseTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNAssistantIntentMetadata parameterValues](self, "parameterValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNAssistantIntentMetadata impliedValues](self, "impliedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[LNAssistantIntentMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  LNAssistantIntentMetadata *v4;
  LNAssistantIntentMetadata *v5;
  LNAssistantIntentMetadata *v6;
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
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;

  v4 = (LNAssistantIntentMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_44:

      goto LABEL_45;
    }
    -[LNAssistantIntentMetadata intentIdentifier](self, "intentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantIntentMetadata intentIdentifier](v6, "intentIdentifier");
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
        goto LABEL_42;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    -[LNAssistantIntentMetadata phraseTemplates](self, "phraseTemplates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantIntentMetadata phraseTemplates](v6, "phraseTemplates");
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
        goto LABEL_41;
      v21 = objc_msgSend(v14, "isEqualToArray:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    -[LNAssistantIntentMetadata parameterValues](self, "parameterValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantIntentMetadata parameterValues](v6, "parameterValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v40 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_40;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_41;
    }
    -[LNAssistantIntentMetadata impliedValues](self, "impliedValues", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantIntentMetadata impliedValues](v6, "impliedValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v38 = v29;
    v39 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v37;
        goto LABEL_38;
      }
      v30 = v29;
      v19 = v37;
      if (!v29)
      {
LABEL_38:

        goto LABEL_39;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v37;
LABEL_39:
        v25 = v38;
        v20 = v39;
LABEL_40:

        v20 = v40;
LABEL_41:

        goto LABEL_42;
      }
    }
    -[LNAssistantIntentMetadata availabilityAnnotations](self, "availabilityAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantIntentMetadata availabilityAnnotations](v6, "availabilityAnnotations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v35 = v34;
    if (v28 == v34)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v19 = v37;
        if (v34)
          LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v34);
        goto LABEL_36;
      }
    }
    v19 = v37;
LABEL_36:

    v30 = v35;
    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_45:

  return v12;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (NSArray)phraseTemplates
{
  return self->_phraseTemplates;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (NSDictionary)impliedValues
{
  return self->_impliedValues;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_impliedValues, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_phraseTemplates, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 availabilityAnnotations:(id)a6
{
  return -[LNAssistantIntentMetadata initWithIntentIdentifier:phraseTemplates:parameterValues:impliedValues:availabilityAnnotations:](self, "initWithIntentIdentifier:phraseTemplates:parameterValues:impliedValues:availabilityAnnotations:", a3, a4, a5, MEMORY[0x1E0C9AA70], a6);
}

@end
