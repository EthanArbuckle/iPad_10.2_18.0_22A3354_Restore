@implementation LNQueryRequestOptions

- (LNQueryRequestOptions)init
{
  LNQueryRequestOptions *v2;
  LNQueryRequestOptions *v3;
  LNQueryRequestOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNQueryRequestOptions;
  v2 = -[LNQueryRequestOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNQueryRequestOptions exportConfiguration](self, "exportConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("exportConfiguration"));

}

- (LNQueryRequestOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNQueryRequestOptions *v6;
  LNQueryRequestOptions *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exportConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNQueryRequestOptions init](self, "init");
  v7 = v6;
  if (v6)
    -[LNQueryRequestOptions setExportConfiguration:](v6, "setExportConfiguration:", v5);

  return v7;
}

- (unint64_t)hash
{
  return -[LNExportedContentConfiguration hash](self->_exportConfiguration, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNQueryRequestOptions *v4;
  LNQueryRequestOptions *v5;
  LNQueryRequestOptions *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNQueryRequestOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNQueryRequestOptions exportConfiguration](self, "exportConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNQueryRequestOptions exportConfiguration](v6, "exportConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (LNExportedContentConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (void)setExportConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
