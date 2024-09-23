@implementation CTPlanSignUpDetails

- (CTPlanSignUpDetails)initWithSignUpUrl:(id)a3 signUpUrlType:(id)a4
{
  id v6;
  id v7;
  CTPlanSignUpDetails *v8;
  uint64_t v9;
  NSString *signUpUrl;
  uint64_t v11;
  NSString *signUpUrlType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTPlanSignUpDetails;
  v8 = -[CTPlanSignUpDetails init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    signUpUrl = v8->_signUpUrl;
    v8->_signUpUrl = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    signUpUrlType = v8->_signUpUrlType;
    v8->_signUpUrlType = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPlanSignUpDetails signUpUrl](self, "signUpUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" signUpUrl=%@"), v4);

  -[CTPlanSignUpDetails signUpUrlType](self, "signUpUrlType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" signUpUrlType=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTPlanSignUpDetails *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTPlanSignUpDetails *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTPlanSignUpDetails signUpUrl](self, "signUpUrl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanSignUpDetails signUpUrl](v6, "signUpUrl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTPlanSignUpDetails signUpUrl](self, "signUpUrl"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTPlanSignUpDetails signUpUrl](v6, "signUpUrl"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        -[CTPlanSignUpDetails signUpUrlType](self, "signUpUrlType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanSignUpDetails signUpUrlType](v6, "signUpUrlType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTPlanSignUpDetails signUpUrlType](self, "signUpUrlType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTPlanSignUpDetails signUpUrlType](v6, "signUpUrlType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanSignUpDetails)initWithCoder:(id)a3
{
  id v4;
  CTPlanSignUpDetails *v5;
  uint64_t v6;
  NSString *signUpUrl;
  uint64_t v8;
  NSString *signUpUrlType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPlanSignUpDetails;
  v5 = -[CTPlanSignUpDetails init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signUpUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
    signUpUrl = v5->_signUpUrl;
    v5->_signUpUrl = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signUpUrlType"));
    v8 = objc_claimAutoreleasedReturnValue();
    signUpUrlType = v5->_signUpUrlType;
    v5->_signUpUrlType = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *signUpUrl;
  id v5;

  signUpUrl = self->_signUpUrl;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", signUpUrl, CFSTR("signUpUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signUpUrlType, CFSTR("signUpUrlType"));

}

- (NSString)signUpUrl
{
  return self->_signUpUrl;
}

- (void)setSignUpUrl:(id)a3
{
  objc_storeStrong((id *)&self->_signUpUrl, a3);
}

- (NSString)signUpUrlType
{
  return self->_signUpUrlType;
}

- (void)setSignUpUrlType:(id)a3
{
  objc_storeStrong((id *)&self->_signUpUrlType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signUpUrlType, 0);
  objc_storeStrong((id *)&self->_signUpUrl, 0);
}

@end
