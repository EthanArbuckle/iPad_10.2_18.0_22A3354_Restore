@implementation GKSupportedTransport

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_6 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_6, &__block_literal_global_34);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_6;
}

void __47__GKSupportedTransport_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("name");
  v2[1] = CFSTR("version");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_6;
  secureCodedPropertyKeys_sSecureCodedKeys_6 = v0;

}

- (GKSupportedTransport)initWithVersionNumber:(id)a3
{
  id v4;
  GKSupportedTransport *v5;
  uint64_t v6;
  int64_t v7;
  NSString *name;
  const __CFString *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKSupportedTransport;
  v5 = -[GKSupportedTransport init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "integerValue");
    v7 = v6;
    switch(v6)
    {
      case 2:
        name = v5->_name;
        v9 = CFSTR("FastSync");
        goto LABEL_8;
      case 1:
        name = v5->_name;
        v9 = CFSTR("Viceroy");
        goto LABEL_8;
      case 0:
        name = v5->_name;
        v9 = CFSTR("Undefined");
LABEL_8:
        v5->_name = &v9->isa;

        v5->_version = v7;
        break;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSupportedTransport name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = objc_msgSend(v5, "version");
      v9 = v8 == -[GKSupportedTransport version](self, "version");
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

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[GKSupportedTransport version](self, "version");
  -[GKSupportedTransport name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
