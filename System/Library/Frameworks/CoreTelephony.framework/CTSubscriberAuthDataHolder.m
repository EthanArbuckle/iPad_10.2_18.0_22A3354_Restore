@implementation CTSubscriberAuthDataHolder

- (CTSubscriberAuthDataHolder)initWithData:(id)a3
{
  id v5;
  CTSubscriberAuthDataHolder *v6;
  CTSubscriberAuthDataHolder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAuthDataHolder;
  v6 = -[CTSubscriberAuthDataHolder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dict, a3);

  return v7;
}

- (id)data
{
  return self->_dict;
}

- (BOOL)isEqual:(id)a3
{
  CTSubscriberAuthDataHolder *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTSubscriberAuthDataHolder *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSubscriberAuthDataHolder dict](self, "dict");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSubscriberAuthDataHolder dict](v4, "dict");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTSubscriberAuthDataHolder dict](self, "dict");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSubscriberAuthDataHolder dict](v4, "dict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSubscriberAuthDataHolder)initWithCoder:(id)a3
{
  id v4;
  CTSubscriberAuthDataHolder *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *dict;

  v4 = a3;
  v5 = -[CTSubscriberAuthDataHolder initWithData:](self, "initWithData:", 0);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dict"));
    v10 = objc_claimAutoreleasedReturnValue();
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dict, CFSTR("dict"));
}

- (NSDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
  objc_storeStrong((id *)&self->_dict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
