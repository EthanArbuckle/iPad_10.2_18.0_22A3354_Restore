@implementation EMMessageHeaders

- (EMMessageHeaders)initWithHeaders:(id)a3
{
  id v4;
  EMMessageHeaders *v5;
  uint64_t v6;
  NSDictionary *headers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageHeaders;
  v5 = -[EMMessageHeaders init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v6;

  }
  return v5;
}

- (NSArray)headerKeys
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSDictionary allKeys](self->_headers, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)headersForKey:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)firstHeaderForKey:(id)a3
{
  void *v3;
  void *v4;

  -[EMMessageHeaders headersForKey:](self, "headersForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageHeaders)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  EMMessageHeaders *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_headers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[EMMessageHeaders initWithHeaders:](self, "initWithHeaders:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMMessageHeaders headers](self, "headers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_headers"));

}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
