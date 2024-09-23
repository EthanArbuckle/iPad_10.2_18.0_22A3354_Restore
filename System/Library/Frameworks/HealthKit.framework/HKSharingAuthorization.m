@implementation HKSharingAuthorization

- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3 displayName:(id)a4 displaySubtitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSharingAuthorization *v11;
  uint64_t v12;
  NSString *authorizationIdentifier;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSString *displaySubtitle;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSharingAuthorization;
  v11 = -[HKSharingAuthorization init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    authorizationIdentifier = v11->_authorizationIdentifier;
    v11->_authorizationIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    displaySubtitle = v11->_displaySubtitle;
    v11->_displaySubtitle = (NSString *)v16;

  }
  return v11;
}

- (HKSharingAuthorization)initWithAuthorizationIdentifier:(id)a3
{
  return -[HKSharingAuthorization initWithAuthorizationIdentifier:displayName:displaySubtitle:](self, "initWithAuthorizationIdentifier:displayName:displaySubtitle:", a3, 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@ %@>"), v5, self, self->_authorizationIdentifier, self->_displayName, self->_displaySubtitle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_authorizationIdentifier, "hash");
  v4 = -[NSString hash](self->_displayName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_displaySubtitle, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *authorizationIdentifier;
  NSString *v6;
  NSString *displayName;
  NSString *v8;
  NSString *displaySubtitle;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  authorizationIdentifier = self->_authorizationIdentifier;
  v6 = (NSString *)v4[1];
  if (authorizationIdentifier != v6
    && (!v6 || !-[NSString isEqual:](authorizationIdentifier, "isEqual:")))
  {
    goto LABEL_11;
  }
  displayName = self->_displayName;
  v8 = (NSString *)v4[2];
  if (displayName != v8 && (!v8 || !-[NSString isEqual:](displayName, "isEqual:")))
    goto LABEL_11;
  displaySubtitle = self->_displaySubtitle;
  v10 = (NSString *)v4[3];
  if (displaySubtitle == v10)
  {
    v11 = 1;
    goto LABEL_12;
  }
  if (v10)
    v11 = -[NSString isEqual:](displaySubtitle, "isEqual:");
  else
LABEL_11:
    v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authorizationIdentifier;
  id v5;

  authorizationIdentifier = self->_authorizationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authorizationIdentifier, CFSTR("AuthorizationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("DisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displaySubtitle, CFSTR("DisplaySubtitle"));

}

- (HKSharingAuthorization)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKSharingAuthorization *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AuthorizationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplaySubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKSharingAuthorization initWithAuthorizationIdentifier:displayName:displaySubtitle:](self, "initWithAuthorizationIdentifier:displayName:displaySubtitle:", v5, v6, v7);
  return v8;
}

- (NSString)authorizationIdentifier
{
  return self->_authorizationIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifier, 0);
}

@end
