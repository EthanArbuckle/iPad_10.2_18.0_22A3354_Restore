@implementation AFSiriHomeAutomationRequestInfo

- (AFSiriHomeAutomationRequestInfo)initWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AFSiriHomeAutomationRequestInfo *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("identifier");
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSiriHomeAutomationRequestInfo initWithContext:](self, "initWithContext:", v7);
  return v8;
}

- (AFSiriHomeAutomationRequestInfo)initWithContext:(id)a3
{
  id v4;
  AFSiriHomeAutomationRequestInfo *v5;
  uint64_t v6;
  NSData *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriHomeAutomationRequestInfo;
  v5 = -[AFSiriHomeAutomationRequestInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (NSData *)v6;

  }
  return v5;
}

- (id)description
{
  return -[AFSiriHomeAutomationRequestInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSiriHomeAutomationRequestInfo;
  -[AFSiriHomeAutomationRequestInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {context = (%llu bytes)}"), v5, -[NSData length](self->_context, "length"));

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_context, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFSiriHomeAutomationRequestInfo *v4;
  NSData *v5;
  NSData *context;
  BOOL v7;

  v4 = (AFSiriHomeAutomationRequestInfo *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFSiriHomeAutomationRequestInfo context](v4, "context");
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      context = self->_context;
      v7 = context == v5 || -[NSData isEqual:](context, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFSiriHomeAutomationRequestInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFSiriHomeAutomationRequestInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriHomeAutomationRequestInfo::context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFSiriHomeAutomationRequestInfo initWithContext:](self, "initWithContext:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_context, CFSTR("AFSiriHomeAutomationRequestInfo::context"));
}

- (NSData)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFSiriHomeAutomationRequestInfoMutation *);
  _AFSiriHomeAutomationRequestInfoMutation *v5;
  void *v6;

  v4 = (void (**)(id, _AFSiriHomeAutomationRequestInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSiriHomeAutomationRequestInfoMutation initWithBaseModel:]([_AFSiriHomeAutomationRequestInfoMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_AFSiriHomeAutomationRequestInfoMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[AFSiriHomeAutomationRequestInfo copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _AFSiriHomeAutomationRequestInfoMutation *);
  _AFSiriHomeAutomationRequestInfoMutation *v4;
  void *v5;

  v3 = (void (**)(id, _AFSiriHomeAutomationRequestInfoMutation *))a3;
  v4 = objc_alloc_init(_AFSiriHomeAutomationRequestInfoMutation);
  if (v3)
    v3[2](v3, v4);
  -[_AFSiriHomeAutomationRequestInfoMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
