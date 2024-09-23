@implementation AFCallSiteInfo

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

- (AFCallSiteInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFCallSiteInfoMutation *);
  AFCallSiteInfo *v5;
  AFCallSiteInfo *v6;
  _AFCallSiteInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *imagePath;
  void *v11;
  uint64_t v12;
  NSString *symbolName;
  objc_super v15;

  v4 = (void (**)(id, _AFCallSiteInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFCallSiteInfo;
  v5 = -[AFCallSiteInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFCallSiteInfoMutation initWithBase:]([_AFCallSiteInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFCallSiteInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFCallSiteInfoMutation getImagePath](v7, "getImagePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      imagePath = v6->_imagePath;
      v6->_imagePath = (NSString *)v9;

      -[_AFCallSiteInfoMutation getSymbolName](v7, "getSymbolName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      symbolName = v6->_symbolName;
      v6->_symbolName = (NSString *)v12;

    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

- (AFCallSiteInfo)init
{
  return -[AFCallSiteInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFCallSiteInfo)initWithImagePath:(id)a3 symbolName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFCallSiteInfo *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__AFCallSiteInfo_initWithImagePath_symbolName___block_invoke;
  v12[3] = &unk_1E3A33CF8;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFCallSiteInfo initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (NSString)description
{
  return (NSString *)-[AFCallSiteInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFCallSiteInfo;
  -[AFCallSiteInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {imagePath = %@, symbolName = %@}"), v5, self->_imagePath, self->_symbolName);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_imagePath, "hash");
  return -[NSString hash](self->_symbolName, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFCallSiteInfo *v4;
  AFCallSiteInfo *v5;
  NSString *v6;
  NSString *imagePath;
  NSString *v8;
  NSString *symbolName;
  BOOL v10;

  v4 = (AFCallSiteInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFCallSiteInfo imagePath](v5, "imagePath");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      imagePath = self->_imagePath;
      if (imagePath == v6 || -[NSString isEqual:](imagePath, "isEqual:", v6))
      {
        -[AFCallSiteInfo symbolName](v5, "symbolName");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        symbolName = self->_symbolName;
        v10 = symbolName == v8 || -[NSString isEqual:](symbolName, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFCallSiteInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFCallSiteInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCallSiteInfo::imagePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCallSiteInfo::symbolName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFCallSiteInfo initWithImagePath:symbolName:](self, "initWithImagePath:symbolName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *imagePath;
  id v5;

  imagePath = self->_imagePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imagePath, CFSTR("AFCallSiteInfo::imagePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbolName, CFSTR("AFCallSiteInfo::symbolName"));

}

- (AFCallSiteInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFCallSiteInfo *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("imagePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("symbolName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    self = -[AFCallSiteInfo initWithImagePath:symbolName:](self, "initWithImagePath:symbolName:", v6, v9);
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
  NSString *imagePath;
  NSString *symbolName;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  imagePath = self->_imagePath;
  if (imagePath)
    objc_msgSend(v3, "setObject:forKey:", imagePath, CFSTR("imagePath"));
  symbolName = self->_symbolName;
  if (symbolName)
    objc_msgSend(v4, "setObject:forKey:", symbolName, CFSTR("symbolName"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

void __47__AFCallSiteInfo_initWithImagePath_symbolName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFCallSiteInfoMutation *);
  _AFCallSiteInfoMutation *v5;
  AFCallSiteInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *imagePath;
  void *v10;
  uint64_t v11;
  NSString *symbolName;

  v4 = (void (**)(id, _AFCallSiteInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFCallSiteInfoMutation initWithBase:]([_AFCallSiteInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFCallSiteInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFCallSiteInfo);
      -[_AFCallSiteInfoMutation getImagePath](v5, "getImagePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      imagePath = v6->_imagePath;
      v6->_imagePath = (NSString *)v8;

      -[_AFCallSiteInfoMutation getSymbolName](v5, "getSymbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      symbolName = v6->_symbolName;
      v6->_symbolName = (NSString *)v11;

    }
    else
    {
      v6 = (AFCallSiteInfo *)-[AFCallSiteInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFCallSiteInfo *)-[AFCallSiteInfo copy](self, "copy");
  }

  return v6;
}

@end
