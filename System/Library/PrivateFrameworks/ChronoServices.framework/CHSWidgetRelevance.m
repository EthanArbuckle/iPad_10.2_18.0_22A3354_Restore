@implementation CHSWidgetRelevance

- (CHSWidgetRelevance)initWithAttribute:(id)a3 intentReference:(id)a4
{
  id v7;
  id v8;
  CHSWidgetRelevance *v9;
  CHSWidgetRelevance *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetRelevance;
  v9 = -[CHSWidgetRelevance init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribute, a3);
    objc_storeStrong((id *)&v10->_intentReference, a4);
  }

  return v10;
}

- (LNRelevantContext)relevantContext
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CHSWidgetRelevanceAttribute context](self->_attribute, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (LNRelevantContext *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  CHSWidgetRelevanceAttribute *attribute;
  uint64_t v7;
  id v8;
  id v9;
  CHSIntentReference *intentReference;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  attribute = self->_attribute;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __30__CHSWidgetRelevance_isEqual___block_invoke;
  v19[3] = &unk_1E2A5A268;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", attribute, v19);
  intentReference = self->_intentReference;
  v14 = v7;
  v15 = 3221225472;
  v16 = __30__CHSWidgetRelevance_isEqual___block_invoke_2;
  v17 = &unk_1E2A5A268;
  v11 = v8;
  v18 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", intentReference, &v14);
  LOBYTE(v8) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)v8;
}

id __30__CHSWidgetRelevance_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __30__CHSWidgetRelevance_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_attribute);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_intentReference);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_attribute, CFSTR("attribute"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_intentReference, CFSTR("intentReference"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_attribute, CFSTR("attribute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentReference, CFSTR("intentReference"));

}

- (CHSWidgetRelevance)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRelevance *v5;
  void *v6;
  CHSWidgetRelevanceRelevantContextAttribute *v7;
  uint64_t v8;
  CHSIntentReference *intentReference;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRelevance;
  v5 = -[CHSWidgetRelevance init](&v11, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("relevantContext")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantContext"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CHSWidgetRelevanceRelevantContextAttribute initWithRelevantContext:]([CHSWidgetRelevanceRelevantContextAttribute alloc], "initWithRelevantContext:", v6);

    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribute"));
      v7 = (CHSWidgetRelevanceRelevantContextAttribute *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_attribute, v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentReference"));
    v8 = objc_claimAutoreleasedReturnValue();
    intentReference = v5->_intentReference;
    v5->_intentReference = (CHSIntentReference *)v8;

  }
  return v5;
}

- (CHSWidgetRelevanceAttribute)attribute
{
  return self->_attribute;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
}

@end
