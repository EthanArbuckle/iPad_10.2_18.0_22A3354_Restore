@implementation AFSharedConfidenceScore

- (AFSharedConfidenceScore)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSharedConfidenceScoreMutation *);
  AFSharedConfidenceScore *v5;
  AFSharedConfidenceScore *v6;
  _AFSharedConfidenceScoreMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *sharedUserId;
  objc_super v12;

  v4 = (void (**)(id, _AFSharedConfidenceScoreMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSharedConfidenceScore;
  v5 = -[AFSharedConfidenceScore init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSharedConfidenceScoreMutation initWithBase:]([_AFSharedConfidenceScoreMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSharedConfidenceScoreMutation isDirty](v7, "isDirty"))
    {
      -[_AFSharedConfidenceScoreMutation getSharedUserId](v7, "getSharedUserId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      v6->_confidenceScore = -[_AFSharedConfidenceScoreMutation getConfidenceScore](v7, "getConfidenceScore");
    }

  }
  return v6;
}

- (AFSharedConfidenceScore)init
{
  return -[AFSharedConfidenceScore initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSharedConfidenceScore)initWithSharedUserId:(id)a3 confidenceScore:(unint64_t)a4
{
  id v6;
  id v7;
  AFSharedConfidenceScore *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AFSharedConfidenceScore_initWithSharedUserId_confidenceScore___block_invoke;
  v10[3] = &unk_1E3A34FE8;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = -[AFSharedConfidenceScore initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (NSString)description
{
  return (NSString *)-[AFSharedConfidenceScore _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSharedConfidenceScore;
  -[AFSharedConfidenceScore description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sharedUserId = %@, confidenceScore = %llu}"), v5, self->_sharedUserId, self->_confidenceScore);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_sharedUserId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidenceScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFSharedConfidenceScore *v4;
  AFSharedConfidenceScore *v5;
  unint64_t confidenceScore;
  NSString *v7;
  NSString *sharedUserId;
  BOOL v9;

  v4 = (AFSharedConfidenceScore *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      confidenceScore = self->_confidenceScore;
      if (confidenceScore == -[AFSharedConfidenceScore confidenceScore](v5, "confidenceScore"))
      {
        -[AFSharedConfidenceScore sharedUserId](v5, "sharedUserId");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        sharedUserId = self->_sharedUserId;
        v9 = sharedUserId == v7 || -[NSString isEqual:](sharedUserId, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFSharedConfidenceScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFSharedConfidenceScore *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedConfidenceScore::sharedUserId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedConfidenceScore::confidenceScore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = -[AFSharedConfidenceScore initWithSharedUserId:confidenceScore:](self, "initWithSharedUserId:confidenceScore:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharedUserId;
  id v5;
  id v6;

  sharedUserId = self->_sharedUserId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharedUserId, CFSTR("AFSharedConfidenceScore::sharedUserId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidenceScore);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFSharedConfidenceScore::confidenceScore"));

}

- (AFSharedConfidenceScore)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFSharedConfidenceScore *v7;
  void *v8;
  id v9;
  uint64_t v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("sharedUserId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("confidenceScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    self = -[AFSharedConfidenceScore initWithSharedUserId:confidenceScore:](self, "initWithSharedUserId:confidenceScore:", v6, v10);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *sharedUserId;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  sharedUserId = self->_sharedUserId;
  if (sharedUserId)
    objc_msgSend(v3, "setObject:forKey:", sharedUserId, CFSTR("sharedUserId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidenceScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("confidenceScore"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (unint64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
}

void __64__AFSharedConfidenceScore_initWithSharedUserId_confidenceScore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSharedUserId:", v3);
  objc_msgSend(v4, "setConfidenceScore:", *(_QWORD *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFSharedConfidenceScoreMutation *);
  _AFSharedConfidenceScoreMutation *v5;
  AFSharedConfidenceScore *v6;
  void *v7;
  uint64_t v8;
  NSString *sharedUserId;

  v4 = (void (**)(id, _AFSharedConfidenceScoreMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSharedConfidenceScoreMutation initWithBase:]([_AFSharedConfidenceScoreMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSharedConfidenceScoreMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSharedConfidenceScore);
      -[_AFSharedConfidenceScoreMutation getSharedUserId](v5, "getSharedUserId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      v6->_confidenceScore = -[_AFSharedConfidenceScoreMutation getConfidenceScore](v5, "getConfidenceScore");
    }
    else
    {
      v6 = (AFSharedConfidenceScore *)-[AFSharedConfidenceScore copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSharedConfidenceScore *)-[AFSharedConfidenceScore copy](self, "copy");
  }

  return v6;
}

@end
