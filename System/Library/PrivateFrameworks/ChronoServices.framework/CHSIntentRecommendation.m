@implementation CHSIntentRecommendation

- (CHSIntentRecommendation)initWithIntentReference:(id)a3 localizedDescription:(id)a4
{
  id v7;
  id v8;
  CHSIntentRecommendation *v9;
  CHSIntentRecommendation *v10;
  uint64_t v11;
  NSString *localizedDescription;
  CHSIntentRecommendation *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)CHSIntentRecommendation;
    v9 = -[CHSIntentRecommendation init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_intentReference, a3);
      v11 = objc_msgSend(v8, "copy");
      localizedDescription = v10->_localizedDescription;
      v10->_localizedDescription = (NSString *)v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)intent
{
  return -[CHSIntentReference intent](self->_intentReference, "intent");
}

- (BOOL)_isSchemaSeparated
{
  return -[CHSIntentReference _isSchemaSeparated](self->_intentReference, "_isSchemaSeparated");
}

- (id)_copyFillingInSchema:(id)a3
{
  CHSIntentReference *v4;
  CHSIntentRecommendation *v5;
  CHSIntentRecommendation *v6;

  v4 = -[CHSIntentReference _copyFillingInSchema:](self->_intentReference, "_copyFillingInSchema:", a3);
  if (v4 == self->_intentReference)
    v5 = self;
  else
    v5 = -[CHSIntentRecommendation initWithIntentReference:localizedDescription:]([CHSIntentRecommendation alloc], "initWithIntentReference:localizedDescription:", v4, self->_localizedDescription);
  v6 = v5;

  return v6;
}

- (id)_copyWithoutSchemaDataIfNecessary
{
  CHSIntentReference *v3;
  CHSIntentRecommendation *v4;
  CHSIntentRecommendation *v5;

  v3 = -[CHSIntentReference _copyWithoutSchemaDataIfNecessary](self->_intentReference, "_copyWithoutSchemaDataIfNecessary");
  if (v3 == self->_intentReference)
    v4 = self;
  else
    v4 = -[CHSIntentRecommendation initWithIntentReference:localizedDescription:]([CHSIntentRecommendation alloc], "initWithIntentReference:localizedDescription:", v3, self->_localizedDescription);
  v5 = v4;

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  CHSIntentRecommendation *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __38__CHSIntentRecommendation_description__block_invoke;
  v11 = &unk_1E2A5A290;
  v4 = v3;
  v12 = v4;
  v13 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

uint64_t __38__CHSIntentRecommendation_description__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("intentReference"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("description"), 1);
}

- (BOOL)isEqual:(id)a3
{
  CHSIntentRecommendation *v4;
  CHSIntentRecommendation *v5;
  BOOL v6;

  v4 = (CHSIntentRecommendation *)a3;
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
        v6 = -[CHSIntentReference isEqual:](self->_intentReference, "isEqual:", v5->_intentReference);
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

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CHSIntentReference hash](self->_intentReference, "hash");
  return -[NSString hash](self->_localizedDescription, "hash") * v3 + 23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentReference, CFSTR("intent2"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedDescription, CFSTR("desc"));

}

- (CHSIntentRecommendation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  CHSIntentRecommendation *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("intent2")))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("intent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v11 = v10;
    }
    v12 = v11;
LABEL_9:
    v6 = -[CHSIntentReference _initWithIntentInMemoryOnly:]([CHSIntentReference alloc], "_initWithIntentInMemoryOnly:", v12);

    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent2"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v13 = 0;
  if (v6 && v5)
  {
    self = -[CHSIntentRecommendation initWithIntentReference:localizedDescription:](self, "initWithIntentReference:localizedDescription:", v6, v5);
    v13 = self;
  }

  return v13;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentReference, CFSTR("intent2"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedDescription, CFSTR("desc"));

}

- (CHSIntentRecommendation)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  CHSIntentRecommendation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("desc"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[CHSIntentRecommendation initWithIntentReference:localizedDescription:](self, "initWithIntentReference:localizedDescription:", v5, v6);
    v9 = self;
  }

  return v9;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
}

@end
