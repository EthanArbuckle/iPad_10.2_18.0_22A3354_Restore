@implementation EMListUnsubscribePostValues

- (EMListUnsubscribePostValues)initWithURL:(id)a3 postContent:(id)a4
{
  id v6;
  id v7;
  EMListUnsubscribePostValues *v8;
  uint64_t v9;
  NSURL *oneClickURL;
  uint64_t v11;
  NSString *postContent;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMListUnsubscribePostValues;
  v8 = -[EMListUnsubscribePostValues init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    oneClickURL = v8->_oneClickURL;
    v8->_oneClickURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    postContent = v8->_postContent;
    v8->_postContent = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMListUnsubscribePostValues)initWithCoder:(id)a3
{
  id v4;
  EMListUnsubscribePostValues *v5;
  uint64_t v6;
  NSURL *oneClickURL;
  uint64_t v8;
  NSString *postContent;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMListUnsubscribePostValues;
  v5 = -[EMListUnsubscribePostValues init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_oneClickURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    oneClickURL = v5->_oneClickURL;
    v5->_oneClickURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_postContent"));
    v8 = objc_claimAutoreleasedReturnValue();
    postContent = v5->_postContent;
    v5->_postContent = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMListUnsubscribePostValues oneClickURL](self, "oneClickURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_oneClickURL"));

  -[EMListUnsubscribePostValues postContent](self, "postContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_postContent"));

}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = 17 * -[NSURL hash](self->_oneClickURL, "hash");
  return -[NSString hash](self->_postContent, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "oneClickURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      objc_msgSend(v4, "postContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      EFObjectsAreEqual();

    }
  }

  return 0;
}

- (NSURL)oneClickURL
{
  return self->_oneClickURL;
}

- (NSString)postContent
{
  return self->_postContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postContent, 0);
  objc_storeStrong((id *)&self->_oneClickURL, 0);
}

@end
