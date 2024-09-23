@implementation AVTCoreModelGroup

- (AVTCoreModelGroup)initWithName:(id)a3 symbolNames:(id)a4 previewMode:(id)a5 categories:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVTCoreModelGroup *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSArray *categories;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTCoreModelGroup;
  v14 = -[AVTCoreModelGroup init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_symbolNames, a4);
    objc_storeStrong((id *)&v14->_previewMode, a5);
    v17 = objc_msgSend(v13, "copy");
    categories = v14->_categories;
    v14->_categories = (NSArray *)v17;

  }
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelGroup;
  -[AVTCoreModelGroup description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@\n"), v5);

  -[AVTCoreModelGroup symbolNames](self, "symbolNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" symbols:%@\n"), v7);

  -[AVTCoreModelGroup previewMode](self, "previewMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" previewMode:%@\n"), v8);

  -[AVTCoreModelGroup categories](self, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avt_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" categories: %@\n"), v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)symbolNames
{
  return self->_symbolNames;
}

- (NSArray)categories
{
  return self->_categories;
}

- (AVTEditingPreviewMode)previewMode
{
  return self->_previewMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewMode, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
