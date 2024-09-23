@implementation BSActionResponse

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSActionResponse encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");

}

- (BSActionResponse)initWithXPCDictionary:(id)a3
{
  void *v4;
  BSActionResponse *v5;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSActionResponse initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)_setAuditToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)dealloc
{
  objc_super v3;

  -[BSSettings setDescriptionProvider:](self->_info, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BSActionResponse;
  -[BSActionResponse dealloc](&v3, sel_dealloc);
}

+ (id)responseForErrorCode:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = CFSTR("BSErrorCodeDescription");
  NSStringFromBSActionErrorCode(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BSActionErrorDomain"), a2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSActionResponse responseForError:](BSActionResponse, "responseForError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)responseForError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", 0, v4);

  return v5;
}

- (id)_initWithInfo:(void *)a3 error:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BSActionResponse;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_msgSend(a1[1], "setDescriptionProvider:", a1);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BSActionResponse)initWithInfo:(id)a3 error:(id)a4
{
  return (BSActionResponse *)-[BSActionResponse _initWithInfo:error:]((id *)&self->super.isa, a3, a4);
}

- (BSSettings)info
{
  return self->_info;
}

- (BSActionResponse)init
{
  return -[BSActionResponse initWithInfo:error:](self, "initWithInfo:error:", 0, 0);
}

+ (id)response
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", 0, 0);
}

+ (BSActionResponse)responseWithInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", v4, 0);

  return (BSActionResponse *)v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 0;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_info, CFSTR("info"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (BSActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BSActionResponse *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSActionResponse *)-[BSActionResponse _initWithInfo:error:]((id *)&self->super.isa, v5, v6);

  return v7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_info);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BSActionResponse *v4;
  BSActionResponse *v5;
  uint64_t v6;
  BOOL v7;
  BSSettings *info;
  NSError *error;

  v4 = (BSActionResponse *)a3;
  v5 = v4;
  v7 = 1;
  if (self != v4)
  {
    if (!v4
      || (v6 = objc_opt_class(), v6 != objc_opt_class())
      || (info = self->_info, info != v5->_info) && !-[BSSettings isEqual:](info, "isEqual:")
      || (error = self->_error, error != v5->_error) && !-[NSError isEqual:](error, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)-[BSActionResponse descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSActionResponse succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSActionResponse descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  BSSettings *info;
  id v7;
  _QWORD v9[4];
  id v10;
  BSActionResponse *v11;

  v4 = a3;
  -[BSActionResponse succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  if (info && !-[BSSettings isEmpty](info, "isEmpty"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__BSActionResponse_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E1EBE700;
    v10 = v5;
    v11 = self;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  }
  else
  {
    v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  }

  return v5;
}

id __58__BSActionResponse_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("info"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("error"), 1);
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

@end
