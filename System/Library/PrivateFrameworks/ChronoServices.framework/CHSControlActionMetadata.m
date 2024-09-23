@implementation CHSControlActionMetadata

- (CHSControlActionMetadata)init
{
  return -[CHSControlActionMetadata initWithIntentType:](self, "initWithIntentType:", 0);
}

- (CHSControlActionMetadata)initWithIntentType:(id)a3
{
  id v4;
  CHSControlActionMetadata *v5;
  uint64_t v6;
  NSString *intentType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSControlActionMetadata;
  v5 = -[CHSControlActionMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    intentType = v5->_intentType;
    v5->_intentType = (NSString *)v6;

  }
  return v5;
}

- (id)_initWithMetadata:(id)a3
{
  id v4;
  CHSControlActionMetadata *v5;
  CHSControlActionMetadata *v6;

  v4 = a3;
  v5 = -[CHSControlActionMetadata initWithIntentType:](self, "initWithIntentType:", *((_QWORD *)v4 + 1));
  v6 = v5;
  if (v5)
  {
    v5->_isLauncher = *((_BYTE *)v4 + 16);
    v5->_isCameraCapture = *((_BYTE *)v4 + 17);
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[CHSControlActionMetadata descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  CHSControlActionMetadata *v4;
  CHSControlActionMetadata *v5;
  char v6;

  v4 = (CHSControlActionMetadata *)a3;
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
      if (BSEqualStrings() && BSEqualBools())
        v6 = BSEqualBools();
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
  return -[NSString hash](self->_intentType, "hash") + 19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentType, CFSTR("intentType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLauncher, CFSTR("isLauncher"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCameraCapture, CFSTR("isCameraCapture"));

}

- (CHSControlActionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CHSControlActionMetadata *v6;
  CHSControlActionMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[CHSControlActionMetadata initWithIntentType:](self, "initWithIntentType:", v5);
    if (v6)
    {
      v6->_isLauncher = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLauncher"));
      v6->_isCameraCapture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCameraCapture"));
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSControlActionMetadata succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  CHSControlActionMetadata *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CHSControlActionMetadata_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

id __54__CHSControlActionMetadata_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("intentType"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("isLauncher"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 17), CFSTR("isCameraCapture"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSControlActionMetadata descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[CHSControlActionMetadata succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)intentType
{
  return self->_intentType;
}

- (BOOL)isLauncher
{
  return self->_isLauncher;
}

- (BOOL)isCameraCapture
{
  return self->_isCameraCapture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentType, 0);
}

@end
