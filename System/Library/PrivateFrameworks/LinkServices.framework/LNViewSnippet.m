@implementation LNViewSnippet

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNViewSnippet *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNViewSnippet.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewData"));

  }
  v12 = -[LNViewSnippet _initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:](self, "_initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:", v9, v10, v11, 0, 0);

  return v12;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  LNViewSnippet *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[LNViewSnippet _initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:](self, "_initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:", v10, v9, v11, v8, 0);

  return v12;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5 snippetModelBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  LNViewSnippet *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[LNViewSnippet _initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:](self, "_initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:", v13, v12, v14, v11, v10);

  return v15;
}

- (id)_initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5 snippetModelData:(id)a6 snippetModelBundleIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  LNViewSnippet *v17;
  uint64_t v18;
  NSString *containerBundleIdentifier;
  uint64_t v20;
  NSString *targetBundleIdentifier;
  uint64_t v22;
  NSData *viewData;
  uint64_t v24;
  NSData *snippetModelData;
  uint64_t v26;
  NSString *snippetModelBundleIdentifier;
  LNViewSnippet *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)LNViewSnippet;
  v17 = -[LNViewSnippet init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    containerBundleIdentifier = v17->_containerBundleIdentifier;
    v17->_containerBundleIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    targetBundleIdentifier = v17->_targetBundleIdentifier;
    v17->_targetBundleIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    viewData = v17->_viewData;
    v17->_viewData = (NSData *)v22;

    v24 = objc_msgSend(v15, "copy");
    snippetModelData = v17->_snippetModelData;
    v17->_snippetModelData = (NSData *)v24;

    v26 = objc_msgSend(v16, "copy");
    snippetModelBundleIdentifier = v17->_snippetModelBundleIdentifier;
    v17->_snippetModelBundleIdentifier = (NSString *)v26;

    v28 = v17;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[LNViewSnippet containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNViewSnippet targetBundleIdentifier](self, "targetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNViewSnippet viewData](self, "viewData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNViewSnippet snippetModelData](self, "snippetModelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNViewSnippet snippetModelBundleIdentifier](self, "snippetModelBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "_initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:", v5, v6, v7, v8, v9);

  return v10;
}

- (LNViewSnippet)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  LNViewSnippet *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewData"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetModelData"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetModelBundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = (LNViewSnippet *)-[LNViewSnippet _initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:](self, "_initWithContainerBundleIdentifier:targetBundleIdentifier:viewData:snippetModelData:snippetModelBundleIdentifier:", v7, v8, v5, v6, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[LNViewSnippet containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("containerBundleIdentifier"));

  -[LNViewSnippet targetBundleIdentifier](self, "targetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("targetBundleIdentifier"));

  -[LNViewSnippet viewData](self, "viewData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("viewData"));

  -[LNViewSnippet snippetModelData](self, "snippetModelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("snippetModelData"));

  -[LNViewSnippet snippetModelBundleIdentifier](self, "snippetModelBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("snippetModelBundleIdentifier"));

}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (NSData)viewData
{
  return self->_viewData;
}

- (NSData)snippetModelData
{
  return self->_snippetModelData;
}

- (NSString)snippetModelBundleIdentifier
{
  return self->_snippetModelBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetModelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetModelData, 0);
  objc_storeStrong((id *)&self->_viewData, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
