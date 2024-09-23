@implementation DMFProfilePayload

- (DMFProfilePayload)initWithType:(id)a3 identifier:(id)a4 payloadVersion:(int64_t)a5 displayName:(id)a6 organization:(id)a7 payloadDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  DMFProfilePayload *v19;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *displayName;
  uint64_t v26;
  NSString *organization;
  uint64_t v28;
  NSString *payloadDescription;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)DMFProfilePayload;
  v19 = -[DMFProfilePayload init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    type = v19->_type;
    v19->_type = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v22;

    v19->_payloadVersion = a5;
    v24 = objc_msgSend(v16, "copy");
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    organization = v19->_organization;
    v19->_organization = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    payloadDescription = v19->_payloadDescription;
    v19->_payloadDescription = (NSString *)v28;

  }
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFProfilePayload type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfilePayload identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMFProfilePayload payloadVersion](self, "payloadVersion");
  -[DMFProfilePayload displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfilePayload organization](self, "organization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfilePayload payloadDescription](self, "payloadDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithType:identifier:payloadVersion:displayName:organization:payloadDescription:", v5, v6, v7, v8, v9, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProfilePayload)initWithCoder:(id)a3
{
  id v4;
  DMFProfilePayload *v5;
  void *v6;
  uint64_t v7;
  NSString *type;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *displayName;
  void *v16;
  uint64_t v17;
  NSString *organization;
  void *v19;
  uint64_t v20;
  NSString *payloadDescription;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DMFProfilePayload;
  v5 = -[DMFProfilePayload init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("type"));
    v7 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_payloadVersion = objc_msgSend(v12, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("displayName"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("organization"));
    v17 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("payloadDescription"));
    v20 = objc_claimAutoreleasedReturnValue();
    payloadDescription = v5->_payloadDescription;
    v5->_payloadDescription = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[DMFProfilePayload type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[DMFProfilePayload identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DMFProfilePayload payloadVersion](self, "payloadVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("payloadVersion"));

  -[DMFProfilePayload displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("displayName"));

  -[DMFProfilePayload organization](self, "organization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("organization"));

  -[DMFProfilePayload payloadDescription](self, "payloadDescription");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("payloadDescription"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  -[DMFProfilePayload type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMFProfilePayload identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[DMFProfilePayload payloadVersion](self, "payloadVersion");
  -[DMFProfilePayload displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  -[DMFProfilePayload organization](self, "organization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[DMFProfilePayload payloadDescription](self, "payloadDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  DMFProfilePayload *v4;
  DMFProfilePayload *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;

  v4 = (DMFProfilePayload *)a3;
  if (self == v4)
  {
    v27 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFProfilePayload type](self, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFProfilePayload type](v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v27 = 0;
      }
      else
      {
        -[DMFProfilePayload identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFProfilePayload identifier](v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if ((!(v13 | v14)
           || (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, v15))
          && (v16 = -[DMFProfilePayload payloadVersion](self, "payloadVersion"),
              v16 == -[DMFProfilePayload payloadVersion](v5, "payloadVersion")))
        {
          -[DMFProfilePayload displayName](self, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMFProfilePayload displayName](v5, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v20 = v18;
          if (v19 | v20
            && (v21 = objc_msgSend((id)v19, "isEqual:", v20), (id)v20, (id)v19, !v21))
          {
            v27 = 0;
          }
          else
          {
            v31 = v20;
            -[DMFProfilePayload organization](self, "organization");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DMFProfilePayload organization](v5, "organization");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v22;
            v32 = v23;
            if (v24 | v32
              && (v29 = objc_msgSend((id)v24, "isEqual:", v32), (id)v32, (id)v24, !v29))
            {
              v27 = 0;
            }
            else
            {
              -[DMFProfilePayload payloadDescription](self, "payloadDescription", v19);
              v25 = objc_claimAutoreleasedReturnValue();
              -[DMFProfilePayload payloadDescription](v5, "payloadDescription");
              v26 = objc_claimAutoreleasedReturnValue();
              if (v25 | v26)
                v27 = objc_msgSend((id)v25, "isEqual:", v26);
              else
                v27 = 1;

              v19 = v30;
            }

            v20 = v31;
          }

        }
        else
        {
          v27 = 0;
        }

      }
    }
    else
    {
      v27 = 0;
    }
  }

  return v27;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DMFProfilePayload identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfilePayload type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfilePayload displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, type = %@, displayName = %@ }>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
