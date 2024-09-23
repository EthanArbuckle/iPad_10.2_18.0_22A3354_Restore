@implementation EMAttachmentData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)attachmentWithURL:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:displayName:", v6, v7);

  return v8;
}

- (EMAttachmentData)initWithURL:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  EMAttachmentData *v9;
  EMAttachmentData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMAttachmentData;
  v9 = -[EMAttachmentData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> (%@, %@)"), objc_opt_class(), self, self->_url, self->_displayName);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_url, "hash");
  return 33 * v3 + -[NSString hash](self->_displayName, "hash") + 1089;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMAttachmentData url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_url"));

  -[EMAttachmentData displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_displayName"));

}

- (EMAttachmentData)initWithCoder:(id)a3
{
  id v4;
  EMAttachmentData *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *displayName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMAttachmentData;
  v5 = -[EMAttachmentData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

  }
  return v5;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  NSURL *url;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  url = self->_url;
  objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", self->_displayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (%@, %@)"), v4, self, url, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
