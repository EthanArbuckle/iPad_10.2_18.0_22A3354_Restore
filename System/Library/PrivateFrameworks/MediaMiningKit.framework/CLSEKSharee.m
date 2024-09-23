@implementation CLSEKSharee

- (CLSEKSharee)initWithEKSharee:(id)a3
{
  id v4;
  CLSEKSharee *v5;
  uint64_t v6;
  NSString *emailAddress;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEKSharee;
  v5 = -[CLSEKSharee init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "emailAddress");
    v6 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (CLSEKSharee)initWithCoder:(id)a3
{
  id v4;
  CLSEKSharee *v5;
  uint64_t v6;
  NSString *emailAddress;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEKSharee;
  v5 = -[CLSEKSharee init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_isCurrentUserForSharing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentUserForSharing"));
    v5->_isCurrentUserForScheduling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentUserForScheduling"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *emailAddress;
  id v5;

  emailAddress = self->_emailAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", emailAddress, CFSTR("emailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentUserForSharing, CFSTR("isCurrentUserForSharing"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentUserForScheduling, CFSTR("isCurrentUserForScheduling"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_emailAddress, "hash");
  return (17 * -[NSString hash](self->_name, "hash")) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  CLSEKSharee *v4;
  CLSEKSharee *v5;
  NSString *emailAddress;
  NSString *name;
  char v8;

  v4 = (CLSEKSharee *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      emailAddress = self->_emailAddress;
      if (emailAddress == v5->_emailAddress || -[NSString isEqualToString:](emailAddress, "isEqualToString:"))
      {
        name = self->_name;
        if (name == v5->_name)
          v8 = 1;
        else
          v8 = -[NSString isEqualToString:](name, "isEqualToString:");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isCurrentUserForSharing
{
  return self->_isCurrentUserForSharing;
}

- (BOOL)isCurrentUserForScheduling
{
  return self->_isCurrentUserForScheduling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
