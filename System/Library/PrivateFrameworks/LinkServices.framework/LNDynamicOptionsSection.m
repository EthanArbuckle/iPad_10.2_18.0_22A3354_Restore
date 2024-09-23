@implementation LNDynamicOptionsSection

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNDynamicOptionsSection options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("options"));

  -[LNDynamicOptionsSection title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[LNDynamicOptionsSection subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  -[LNDynamicOptionsSection image](self, "image");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("image"));

}

- (LNDeferredLocalizedString)title
{
  return self->_title;
}

- (LNDeferredLocalizedString)subtitle
{
  return self->_subtitle;
}

- (NSArray)options
{
  return self->_options;
}

- (LNImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNDynamicOptionsSection *v15;
  uint64_t v16;
  NSArray *options;
  uint64_t v18;
  LNDeferredLocalizedString *title;
  uint64_t v20;
  LNDeferredLocalizedString *subtitle;
  uint64_t v22;
  LNImage *image;
  LNDynamicOptionsSection *v24;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicOptionsResult.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v27.receiver = self;
  v27.super_class = (Class)LNDynamicOptionsSection;
  v15 = -[LNDynamicOptionsSection init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    options = v15->_options;
    v15->_options = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    title = v15->_title;
    v15->_title = (LNDeferredLocalizedString *)v18;

    v20 = objc_msgSend(v13, "copy");
    subtitle = v15->_subtitle;
    v15->_subtitle = (LNDeferredLocalizedString *)v20;

    v22 = objc_msgSend(v14, "copy");
    image = v15->_image;
    v15->_image = (LNImage *)v22;

    v24 = v15;
  }

  return v15;
}

- (LNDynamicOptionsSection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNDynamicOptionsSection *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[LNDynamicOptionsSection initWithOptions:title:subtitle:image:](self, "initWithOptions:title:subtitle:image:", v8, v9, v10, v11);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  LNDynamicOptionsSection *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicOptionsResult.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v9 = -[LNDynamicOptionsSection initWithOptions:title:subtitle:image:](self, "initWithOptions:title:subtitle:image:", v7, v8, 0, 0);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsSection title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsSection options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p titleKey=%@, optionsCount=%lu>"), v5, self, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
