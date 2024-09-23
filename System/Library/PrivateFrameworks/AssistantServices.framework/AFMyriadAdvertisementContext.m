@implementation AFMyriadAdvertisementContext

- (AFMyriadAdvertisementContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMyriadAdvertisementContextMutation *);
  AFMyriadAdvertisementContext *v5;
  AFMyriadAdvertisementContext *v6;
  _AFMyriadAdvertisementContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSData *contextData;
  double v11;
  objc_super v13;

  v4 = (void (**)(id, _AFMyriadAdvertisementContextMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)AFMyriadAdvertisementContext;
  v5 = -[AFMyriadAdvertisementContext init](&v13, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMyriadAdvertisementContextMutation initWithBase:]([_AFMyriadAdvertisementContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMyriadAdvertisementContextMutation isDirty](v7, "isDirty"))
    {
      v6->_generation = -[_AFMyriadAdvertisementContextMutation getGeneration](v7, "getGeneration");
      -[_AFMyriadAdvertisementContextMutation getContextData](v7, "getContextData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v9;

      -[_AFMyriadAdvertisementContextMutation getContextFetchDelay](v7, "getContextFetchDelay");
      v6->_contextFetchDelay = v11;
    }

  }
  return v6;
}

- (AFMyriadAdvertisementContext)init
{
  return -[AFMyriadAdvertisementContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMyriadAdvertisementContext)initWithGeneration:(unint64_t)a3 contextData:(id)a4 contextFetchDelay:(double)a5
{
  id v8;
  id v9;
  AFMyriadAdvertisementContext *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  double v15;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__AFMyriadAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke;
  v12[3] = &unk_1E3A2F940;
  v13 = v8;
  v14 = a3;
  v15 = a5;
  v9 = v8;
  v10 = -[AFMyriadAdvertisementContext initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFMyriadAdvertisementContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadAdvertisementContext;
  -[AFMyriadAdvertisementContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {generation = %llu, contextData = (%llu bytes), contextFetchDelay = %f}"), v5, self->_generation, -[NSData length](self->_contextData, "length"), *(_QWORD *)&self->_contextFetchDelay);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_generation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSData hash](self->_contextData, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contextFetchDelay);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AFMyriadAdvertisementContext *v4;
  AFMyriadAdvertisementContext *v5;
  unint64_t generation;
  double contextFetchDelay;
  double v8;
  BOOL v9;
  NSData *v11;
  NSData *contextData;

  v4 = (AFMyriadAdvertisementContext *)a3;
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
      generation = self->_generation;
      if (generation == -[AFMyriadAdvertisementContext generation](v5, "generation")
        && (contextFetchDelay = self->_contextFetchDelay,
            -[AFMyriadAdvertisementContext contextFetchDelay](v5, "contextFetchDelay"),
            contextFetchDelay == v8))
      {
        -[AFMyriadAdvertisementContext contextData](v5, "contextData");
        v11 = (NSData *)objc_claimAutoreleasedReturnValue();
        contextData = self->_contextData;
        v9 = contextData == v11 || -[NSData isEqual:](contextData, "isEqual:", v11);

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

- (AFMyriadAdvertisementContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  AFMyriadAdvertisementContext *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadAdvertisementContext::generation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadAdvertisementContext::contextData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadAdvertisementContext::contextFetchDelay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = -[AFMyriadAdvertisementContext initWithGeneration:contextData:contextFetchDelay:](self, "initWithGeneration:contextData:contextFetchDelay:", v6, v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t generation;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  generation = self->_generation;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", generation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFMyriadAdvertisementContext::generation"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_contextData, CFSTR("AFMyriadAdvertisementContext::contextData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contextFetchDelay);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFMyriadAdvertisementContext::contextFetchDelay"));

}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (double)contextFetchDelay
{
  return self->_contextFetchDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
}

void __81__AFMyriadAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setGeneration:", v3);
  objc_msgSend(v4, "setContextData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setContextFetchDelay:", *(double *)(a1 + 48));

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
  void (**v4)(id, _AFMyriadAdvertisementContextMutation *);
  _AFMyriadAdvertisementContextMutation *v5;
  AFMyriadAdvertisementContext *v6;
  void *v7;
  uint64_t v8;
  NSData *contextData;
  double v10;

  v4 = (void (**)(id, _AFMyriadAdvertisementContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMyriadAdvertisementContextMutation initWithBase:]([_AFMyriadAdvertisementContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMyriadAdvertisementContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMyriadAdvertisementContext);
      v6->_generation = -[_AFMyriadAdvertisementContextMutation getGeneration](v5, "getGeneration");
      -[_AFMyriadAdvertisementContextMutation getContextData](v5, "getContextData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v8;

      -[_AFMyriadAdvertisementContextMutation getContextFetchDelay](v5, "getContextFetchDelay");
      v6->_contextFetchDelay = v10;
    }
    else
    {
      v6 = (AFMyriadAdvertisementContext *)-[AFMyriadAdvertisementContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMyriadAdvertisementContext *)-[AFMyriadAdvertisementContext copy](self, "copy");
  }

  return v6;
}

@end
