@implementation DNDSIDSRecordID

- (DNDSIDSRecordID)initWithIdentifier:(id)a3 zone:(id)a4
{
  id v6;
  id v7;
  DNDSIDSRecordID *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *zone;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSIDSRecordID;
  v8 = -[DNDSIDSRecordID init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    zone = v8->_zone;
    v8->_zone = (NSString *)v11;

  }
  return v8;
}

- (id)_initWithRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DNDSIDSRecordID *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DNDSIDSRecordID initWithIdentifier:zone:](self, "initWithIdentifier:zone:", v5, v6);
  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_zone, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSIDSRecordID *v4;
  DNDSIDSRecordID *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (DNDSIDSRecordID *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSIDSRecordID identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSRecordID identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSIDSRecordID identifier](self, "identifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        -[DNDSIDSRecordID identifier](v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[DNDSIDSRecordID identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSIDSRecordID identifier](v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDSIDSRecordID zone](self, "zone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSRecordID zone](v5, "zone");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDSIDSRecordID zone](self, "zone");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDSIDSRecordID zone](v5, "zone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDSIDSRecordID zone](self, "zone");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSRecordID zone](v5, "zone");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_24;
      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSIDSRecordID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSRecordID zone](self, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; zone: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("zone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:zone:", v6, v7);
  return v8;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  NSString *zone;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("identifier");
  v5[1] = CFSTR("zone");
  zone = self->_zone;
  v6[0] = self->_identifier;
  v6[1] = zone;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
