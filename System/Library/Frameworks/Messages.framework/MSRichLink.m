@implementation MSRichLink

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSRichLink)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSRichLink;
  return -[MSRichLink init](&v3, sel_init);
}

- (MSRichLink)initWithURL:(id)a3
{
  id v5;
  MSRichLink *v6;
  MSRichLink *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSRichLink;
  v6 = -[MSRichLink init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URL, a3);

  return v7;
}

- (MSRichLink)initWithCoder:(id)a3
{
  id v4;
  MSRichLink *v5;
  uint64_t v6;
  LPLinkMetadata *linkMetadata;
  uint64_t v8;
  NSURL *URL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSRichLink;
  v5 = -[MSRichLink init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    linkMetadata = v5->_linkMetadata;
    v5->_linkMetadata = (LPLinkMetadata *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  LPLinkMetadata *linkMetadata;
  id v5;

  linkMetadata = self->_linkMetadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", linkMetadata, CFSTR("linkMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL, CFSTR("URL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MSRichLink *v4;
  void *v5;
  void *v6;

  v4 = -[MSRichLink init](+[MSRichLink allocWithZone:](MSRichLink, "allocWithZone:", a3), "init");
  v5 = (void *)-[NSURL copy](self->_URL, "copy");
  -[MSRichLink setURL:](v4, "setURL:", v5);

  v6 = (void *)-[LPLinkMetadata copy](self->_linkMetadata, "copy");
  -[MSRichLink set_linkMetadata:](v4, "set_linkMetadata:", v6);

  return v4;
}

- (LPLinkMetadata)_linkMetadata
{
  return self->_linkMetadata;
}

- (void)set_linkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
