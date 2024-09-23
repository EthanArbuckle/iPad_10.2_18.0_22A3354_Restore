@implementation MSMessageRichLinkLayout

- (MSMessageRichLinkLayout)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unavailable. Please use -initWithAlternateLayout: instead."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MSMessageRichLinkLayout)initWithLinkMetadata:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  MSMessageRichLinkLayout *v8;
  id v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("A linkMetadata is required for MSMessageRichLinkLayout"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)MSMessageRichLinkLayout;
  v7 = -[MSMessageLayout _init](&v11, sel__init);
  v8 = (MSMessageRichLinkLayout *)v7;
  if (v7)
    objc_storeStrong(v7 + 11, a3);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_linkMetadata, CFSTR("linkMetadata"));
}

- (MSMessageRichLinkLayout)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MSMessageRichLinkLayout *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MSMessageRichLinkLayout initWithLinkMetadata:](self, "initWithLinkMetadata:", v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MSMessageRichLinkLayout *v4;
  void *v5;
  MSMessageRichLinkLayout *v6;

  v4 = [MSMessageRichLinkLayout alloc];
  -[MSMessageRichLinkLayout linkMetadata](self, "linkMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSMessageRichLinkLayout initWithLinkMetadata:](v4, "initWithLinkMetadata:", v5);

  return v6;
}

- (id)_sanitizedCopy
{
  MSMessageRichLinkLayout *v3;
  void *v4;
  MSMessageRichLinkLayout *v5;

  v3 = [MSMessageRichLinkLayout alloc];
  -[MSMessageRichLinkLayout linkMetadata](self, "linkMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MSMessageRichLinkLayout initWithLinkMetadata:](v3, "initWithLinkMetadata:", v4);

  return v5;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
