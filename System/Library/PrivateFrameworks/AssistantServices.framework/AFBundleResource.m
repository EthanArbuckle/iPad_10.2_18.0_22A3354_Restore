@implementation AFBundleResource

- (AFBundleResource)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBundleResourceMutation *);
  AFBundleResource *v5;
  AFBundleResource *v6;
  _AFBundleResourceMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  uint64_t v12;
  NSString *extension;
  objc_super v15;

  v4 = (void (**)(id, _AFBundleResourceMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFBundleResource;
  v5 = -[AFBundleResource init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBundleResourceMutation initWithBase:]([_AFBundleResourceMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBundleResourceMutation isDirty](v7, "isDirty"))
    {
      -[_AFBundleResourceMutation getName](v7, "getName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v9;

      -[_AFBundleResourceMutation getExtension](v7, "getExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      extension = v6->_extension;
      v6->_extension = (NSString *)v12;

    }
  }

  return v6;
}

- (AFBundleResource)init
{
  return -[AFBundleResource initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBundleResource)initWithName:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFBundleResource *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__AFBundleResource_initWithName_extension___block_invoke;
  v12[3] = &unk_1E3A34548;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFBundleResource initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFBundleResource _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFBundleResource;
  -[AFBundleResource description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {name = %@, extension = %@}"), v5, self->_name, self->_extension);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_extension, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFBundleResource *v4;
  AFBundleResource *v5;
  NSString *v6;
  NSString *name;
  NSString *v8;
  NSString *extension;
  BOOL v10;

  v4 = (AFBundleResource *)a3;
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
      -[AFBundleResource name](v5, "name");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      if (name == v6 || -[NSString isEqual:](name, "isEqual:", v6))
      {
        -[AFBundleResource extension](v5, "extension");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        extension = self->_extension;
        v10 = extension == v8 || -[NSString isEqual:](extension, "isEqual:", v8);

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

- (AFBundleResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFBundleResource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBundleResource::name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBundleResource::extension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFBundleResource initWithName:extension:](self, "initWithName:extension:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("AFBundleResource::name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extension, CFSTR("AFBundleResource::extension"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __43__AFBundleResource_initWithName_extension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setName:", v3);
  objc_msgSend(v4, "setExtension:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFBundleResourceMutation *);
  _AFBundleResourceMutation *v5;
  AFBundleResource *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  uint64_t v11;
  NSString *extension;

  v4 = (void (**)(id, _AFBundleResourceMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBundleResourceMutation initWithBase:]([_AFBundleResourceMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBundleResourceMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBundleResource);
      -[_AFBundleResourceMutation getName](v5, "getName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v8;

      -[_AFBundleResourceMutation getExtension](v5, "getExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      extension = v6->_extension;
      v6->_extension = (NSString *)v11;

    }
    else
    {
      v6 = (AFBundleResource *)-[AFBundleResource copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBundleResource *)-[AFBundleResource copy](self, "copy");
  }

  return v6;
}

@end
