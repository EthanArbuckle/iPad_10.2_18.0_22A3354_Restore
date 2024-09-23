@implementation ISIconDecoration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIconDecoration)init
{
  ISIconDecoration *v2;
  ISIconDecoration *v3;
  NSString *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISIconDecoration;
  v2 = -[ISIconDecoration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1E5801B98;
    v2->_identifierKind = 0;

    v3->_position = 0;
    v3->_mode = 0;
  }
  return v3;
}

- (ISIconDecoration)initWithType:(id)a3
{
  id v4;
  ISIconDecoration *v5;
  ISIconDecoration *v6;
  uint64_t v7;
  NSString *identifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  v5 = -[ISIconDecoration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_identifierKind = 2;
    v7 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_position = 0;
    v6->_mode = 0;
  }

  return v6;
}

- (ISIconDecoration)initWithKind:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  ISIconDecoration *v7;
  ISIconDecoration *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISIconDecoration;
  v7 = -[ISIconDecoration init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifierKind = a3;
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_position = 0;
    v8->_mode = 0;
  }

  return v8;
}

- (ISIconDecoration)initWithBundleIdentifier:(id)a3
{
  id v4;
  ISIconDecoration *v5;
  ISIconDecoration *v6;
  uint64_t v7;
  NSString *identifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  v5 = -[ISIconDecoration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_identifierKind = 1;
    v7 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_position = 0;
    v6->_mode = 0;
  }

  return v6;
}

- (ISIconDecoration)initWithResourceURL:(id)a3
{
  id v5;
  ISIconDecoration *v6;
  ISIconDecoration *v7;
  NSString *identifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  v6 = -[ISIconDecoration init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_identifierKind = 3;
    objc_storeStrong((id *)&v6->_resourceURL, a3);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)CFSTR("com.apple.icon-decoration.folderbadge");

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ISIconDecoration *v4;

  v4 = objc_alloc_init(ISIconDecoration);
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  v4->_identifierKind = self->_identifierKind;
  v4->_mode = self->_mode;
  v4->_position = self->_position;
  objc_storeStrong((id *)&v4->_resourceURL, self->_resourceURL);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifierKind;
  id v5;
  id v6;

  identifierKind = self->_identifierKind;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", identifierKind, CFSTR("_identifierKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_position, CFSTR("_position"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("_mode"));
  -[NSURL absoluteString](self->_resourceURL, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_resourceURL"));

}

- (ISIconDecoration)initWithCoder:(id)a3
{
  id v4;
  ISIconDecoration *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  NSURL *resourceURL;

  v4 = a3;
  v5 = -[ISIconDecoration init](self, "init");
  if (v5)
  {
    v5->_identifierKind = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_identifierKind"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E5801B98;
    objc_storeStrong((id *)&v5->_identifier, v8);

    v5->_position = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_position"));
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_mode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resourceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      resourceURL = v5->_resourceURL;
      v5->_resourceURL = (NSURL *)v10;

    }
  }

  return v5;
}

- (NSUUID)uuid
{
  void *v3;
  NSURL *resourceURL;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld-%ld-%ld"), self->_identifier, self->_identifierKind, self->_position, self->_mode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  resourceURL = self->_resourceURL;
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (resourceURL)
  {
    v14[0] = v6;
    v8 = (void *)MEMORY[0x1E0CB3A28];
    -[NSURL absoluteString](self->_resourceURL, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_IF_UUIDWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_IF_UUIDByXORingUUIDs:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return (NSUUID *)v7;
}

- (NSString)description
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_identifierKind - 1;
  if (v2 > 2)
  {
    v3 = &stru_1E5801B98;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E5801458[v2], *(Class *)((char *)&self->super.isa + qword_1AA9771D8[v2]));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)resourceFingerprint
{
  unint64_t identifierKind;
  CFURLRef v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  identifierKind = self->_identifierKind;
  if (identifierKind == 3)
  {
    v18 = (void *)MEMORY[0x1E0CB3A28];
    -[NSURL absoluteString](self->_resourceURL, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_IF_UUIDWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    return v20;
  }
  else if (identifierKind == 2)
  {
    v3 = UTTypeCopyDeclaringBundleURL((CFStringRef)self->_identifier);
    -[__CFURL absoluteString](v3, "absoluteString");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = &stru_1E5801B98;
    v21 = v6;
    v7 = _UTTypeCopyIconName();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E5801B98;
    v22 = v9;
    v10 = _UTTypeCopyGlyphName();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E5801B98;
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v13, "componentsJoinedByString:", &stru_1E5801B98, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_IF_UUIDWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (ISScalableCompositorResource)compositorResource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_identifierKind == 2)
  {
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", self->_identifier);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iconResourceBundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iconDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISResourceProvider resourceWithBundleURL:iconDictionary:options:](ISResourceProvider, "resourceWithBundleURL:iconDictionary:options:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (ISScalableCompositorResource *)v5;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSURL)resourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)identifierKind
{
  return self->_identifierKind;
}

- (NSUUID)resourceToken
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

- (id)imageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = a3;
  -[ISIconDecoration compositorResource](self, "compositorResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "scale");
  v11 = v10;

  objc_msgSend(v5, "imageForSize:scale:", v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
