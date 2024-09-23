@implementation CHSWidgetRateLimitPolicy

- (CHSWidgetRateLimitPolicy)initWithIdentifier:(id)a3 rateLimits:(id)a4
{
  id v7;
  id v8;
  CHSWidgetRateLimitPolicy *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSSet *rateLimits;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetRateLimitPolicy.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetRateLimitPolicy.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rateLimits count] > 0"));

  }
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetRateLimitPolicy;
  v9 = -[CHSWidgetRateLimitPolicy init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    rateLimits = v9->_rateLimits;
    v9->_rateLimits = (NSSet *)v12;

  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSSet count](self->_rateLimits, "count") + 13 * v3;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetRateLimitPolicy *v4;
  CHSWidgetRateLimitPolicy *v5;
  char v6;

  v4 = (CHSWidgetRateLimitPolicy *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualObjects())
        v6 = BSEqualObjects();
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSWidgetRateLimitPolicy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CHSWidgetRateLimitPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __57__CHSWidgetRateLimitPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("identifier"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("rateLimits"));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  -[NSSet allObjects](self->_rateLimits, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("rateLimits"));

}

- (CHSWidgetRateLimitPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CHSWidgetRateLimitPolicy *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("rateLimits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CHSWidgetRateLimitPolicy initWithIdentifier:rateLimits:](self, "initWithIdentifier:rateLimits:", v5, v10);

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)rateLimits
{
  return self->_rateLimits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimits, 0);
  objc_storeStrong((id *)&self->rateLimits, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
