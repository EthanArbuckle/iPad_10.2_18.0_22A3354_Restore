@implementation CSFieldSpecification

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)attribute
{
  return self->_attribute;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)token
{
  return self->_token;
}

- (id)dictionaryFormat
{
  __int128 v2;
  _QWORD v4[3];
  __int128 v5;
  NSString *token;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_attribute;
  v4[0] = CFSTR("ATTRIBUTE");
  v4[1] = CFSTR("STATUS");
  v5 = v2;
  v4[2] = CFSTR("TOKEN");
  token = self->_token;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CSFieldSpecification)initWithDisplayName:(id)a3 attribute:(id)a4 status:(id)a5 token:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CSFieldSpecification *v15;
  CSFieldSpecification *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSFieldSpecification;
  v15 = -[CSFieldSpecification init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    objc_storeStrong((id *)&v16->_attribute, a4);
    objc_storeStrong((id *)&v16->_status, a5);
    objc_storeStrong((id *)&v16->_token, a6);
  }

  return v16;
}

- (CSFieldSpecification)initWithCoder:(id)a3
{
  id v4;
  CSFieldSpecification *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *attribute;
  uint64_t v10;
  NSString *status;
  uint64_t v12;
  NSString *token;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFieldSpecification;
  v5 = -[CSFieldSpecification init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribute"));
    v8 = objc_claimAutoreleasedReturnValue();
    attribute = v5->_attribute;
    v5->_attribute = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v10 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v12 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attribute, CFSTR("attribute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
