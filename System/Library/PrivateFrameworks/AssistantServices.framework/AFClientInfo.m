@implementation AFClientInfo

- (AFClientInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFClientInfoMutation *);
  AFClientInfo *v5;
  AFClientInfo *v6;
  _AFClientInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *processName;
  objc_super v12;

  v4 = (void (**)(id, _AFClientInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFClientInfo;
  v5 = -[AFClientInfo init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFClientInfoMutation initWithBase:]([_AFClientInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFClientInfoMutation isDirty](v7, "isDirty"))
    {
      v6->_processIdentifier = -[_AFClientInfoMutation getProcessIdentifier](v7, "getProcessIdentifier");
      -[_AFClientInfoMutation getProcessName](v7, "getProcessName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      processName = v6->_processName;
      v6->_processName = (NSString *)v9;

    }
  }

  return v6;
}

- (AFClientInfo)init
{
  return -[AFClientInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4
{
  id v6;
  id v7;
  AFClientInfo *v8;
  _QWORD v10[4];
  id v11;
  int v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AFClientInfo_initWithProcessIdentifier_processName___block_invoke;
  v10[3] = &unk_1E3A36D78;
  v12 = a3;
  v11 = v6;
  v7 = v6;
  v8 = -[AFClientInfo initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[AFClientInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFClientInfo;
  -[AFClientInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {processIdentifier = %d, processName = %@}"), v5, self->_processIdentifier, self->_processName);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_processName, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFClientInfo *v4;
  AFClientInfo *v5;
  int processIdentifier;
  NSString *v7;
  NSString *processName;
  BOOL v9;

  v4 = (AFClientInfo *)a3;
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
      processIdentifier = self->_processIdentifier;
      if (processIdentifier == -[AFClientInfo processIdentifier](v5, "processIdentifier"))
      {
        -[AFClientInfo processName](v5, "processName");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        processName = self->_processName;
        v9 = processName == v7 || -[NSString isEqual:](processName, "isEqual:", v7);

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

- (AFClientInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AFClientInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientInfo::processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientInfo::processName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFClientInfo initWithProcessIdentifier:processName:](self, "initWithProcessIdentifier:processName:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t processIdentifier;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  processIdentifier = self->_processIdentifier;
  v7 = a3;
  objc_msgSend(v4, "numberWithInt:", processIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFClientInfo::processIdentifier"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_processName, CFSTR("AFClientInfo::processName"));
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
}

void __54__AFClientInfo_initWithProcessIdentifier_processName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setProcessIdentifier:", v3);
  objc_msgSend(v4, "setProcessName:", *(_QWORD *)(a1 + 32));

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
  void (**v4)(id, _AFClientInfoMutation *);
  _AFClientInfoMutation *v5;
  AFClientInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *processName;

  v4 = (void (**)(id, _AFClientInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFClientInfoMutation initWithBase:]([_AFClientInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFClientInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFClientInfo);
      v6->_processIdentifier = -[_AFClientInfoMutation getProcessIdentifier](v5, "getProcessIdentifier");
      -[_AFClientInfoMutation getProcessName](v5, "getProcessName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      processName = v6->_processName;
      v6->_processName = (NSString *)v8;

    }
    else
    {
      v6 = (AFClientInfo *)-[AFClientInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFClientInfo *)-[AFClientInfo copy](self, "copy");
  }

  return v6;
}

@end
