@implementation IDSOffGridContactInfo

- (IDSOffGridContactInfo)initWithURI:(id)a3 type:(int64_t)a4
{
  id v7;
  IDSOffGridContactInfo *v8;
  IDSOffGridContactInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSOffGridContactInfo;
  v8 = -[IDSOffGridContactInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uri, a3);
    v9->_type = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSOffGridContactInfo uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSOffGridContactInfo %p>: uri %@ type %ld"), self, v4, -[IDSOffGridContactInfo type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  IDSURI *uri;
  id v5;

  uri = self->_uri;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uri, CFSTR("uri"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (IDSOffGridContactInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  IDSOffGridContactInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  v7 = -[IDSOffGridContactInfo initWithURI:type:]([IDSOffGridContactInfo alloc], "initWithURI:type:", v5, v6);
  return v7;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
