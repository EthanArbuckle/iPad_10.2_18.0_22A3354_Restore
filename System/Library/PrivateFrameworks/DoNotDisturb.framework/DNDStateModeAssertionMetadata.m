@implementation DNDStateModeAssertionMetadata

- (DNDStateModeAssertionMetadata)initWithClientIdentifier:(id)a3 modeIdentifier:(id)a4 lifetimeType:(unint64_t)a5 activeDateInterval:(id)a6 userVisibleEndDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DNDStateModeAssertionMetadata *v16;
  uint64_t v17;
  NSString *clientIdentifier;
  uint64_t v19;
  NSString *modeIdentifier;
  uint64_t v21;
  NSDateInterval *activeDateInterval;
  uint64_t v23;
  NSDate *userVisibleEndDate;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DNDStateModeAssertionMetadata;
  v16 = -[DNDStateModeAssertionMetadata init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    modeIdentifier = v16->_modeIdentifier;
    v16->_modeIdentifier = (NSString *)v19;

    v16->_lifetimeType = a5;
    v21 = objc_msgSend(v14, "copy");
    activeDateInterval = v16->_activeDateInterval;
    v16->_activeDateInterval = (NSDateInterval *)v21;

    v23 = objc_msgSend(v15, "copy");
    userVisibleEndDate = v16->_userVisibleEndDate;
    v16->_userVisibleEndDate = (NSDate *)v23;

  }
  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[DNDStateModeAssertionMetadata lifetimeType](self, "lifetimeType");
  -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDStateModeAssertionMetadata *v5;
  DNDStateModeAssertionMetadata *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v5 = (DNDStateModeAssertionMetadata *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDStateModeAssertionMetadata clientIdentifier](v6, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_52;
        }
        v3 = (void *)v9;
        -[DNDStateModeAssertionMetadata clientIdentifier](v6, "clientIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDStateModeAssertionMetadata clientIdentifier](v6, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
      }
      -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDStateModeAssertionMetadata modeIdentifier](v6, "modeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_39;
        v17 = (void *)v16;
        -[DNDStateModeAssertionMetadata modeIdentifier](v6, "modeIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {

          goto LABEL_39;
        }
        v46 = v17;
        v47 = (void *)v18;
        -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDStateModeAssertionMetadata modeIdentifier](v6, "modeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
        {

LABEL_38:
          goto LABEL_39;
        }
        v45 = v20;
        v48 = v19;
      }
      v21 = -[DNDStateModeAssertionMetadata lifetimeType](self, "lifetimeType");
      if (v21 != -[DNDStateModeAssertionMetadata lifetimeType](v6, "lifetimeType"))
      {
        v13 = 0;
LABEL_46:
        if (v14 != v15)
        {

        }
LABEL_49:
        v11 = v50;
        v10 = v51;
        v12 = v49;
        if (v7 != v8)
          goto LABEL_50;
LABEL_52:

        goto LABEL_53;
      }
      -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDStateModeAssertionMetadata activeDateInterval](v6, "activeDateInterval");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v22 == (void *)v23)
      {
        v43 = v22;
        v44 = (void *)v23;
        goto LABEL_28;
      }
      -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {

        v19 = v48;
        if (v14 == v15)
          goto LABEL_39;
        goto LABEL_37;
      }
      v42 = (void *)v25;
      v43 = v22;
      v44 = v24;
      -[DNDStateModeAssertionMetadata activeDateInterval](v6, "activeDateInterval");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v48;
      if (v26)
      {
        v41 = v26;
        -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDStateModeAssertionMetadata activeDateInterval](v6, "activeDateInterval");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "isEqual:", v28) & 1) != 0)
        {
          v38 = v28;
          v39 = v27;
LABEL_28:
          -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDStateModeAssertionMetadata userVisibleEndDate](v6, "userVisibleEndDate");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v29 == (void *)v30)
          {

            v13 = 1;
          }
          else
          {
            v40 = (void *)v30;
            -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v37 = (void *)v31;
              -[DNDStateModeAssertionMetadata userVisibleEndDate](v6, "userVisibleEndDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
              {
                v36 = v32;
                -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDStateModeAssertionMetadata userVisibleEndDate](v6, "userVisibleEndDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v35, "isEqual:", v33);

                v32 = v36;
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
          if (v43 != v44)
          {

          }
          goto LABEL_46;
        }

        v26 = v41;
        v19 = v48;
      }

      if (v14 != v15)
      {
LABEL_37:

        goto LABEL_38;
      }
LABEL_39:

      v13 = 0;
      goto LABEL_49;
    }
    v13 = 0;
  }
LABEL_53:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromModeAssertionLifetimeType(-[DNDStateModeAssertionMetadata lifetimeType](self, "lifetimeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: '%@'; modeIdentifier: '%@'; lifetimeType: %@; activeDateInterval: %@; userVisibleEndDate: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDStateModeAssertionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  DNDStateModeAssertionMetadata *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lifetimeType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeDateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVisibleEndDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDStateModeAssertionMetadata initWithClientIdentifier:modeIdentifier:lifetimeType:activeDateInterval:userVisibleEndDate:](self, "initWithClientIdentifier:modeIdentifier:lifetimeType:activeDateInterval:userVisibleEndDate:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DNDStateModeAssertionMetadata clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientIdentifier"));

  -[DNDStateModeAssertionMetadata modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modeIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDStateModeAssertionMetadata lifetimeType](self, "lifetimeType"), CFSTR("lifetimeType"));
  -[DNDStateModeAssertionMetadata activeDateInterval](self, "activeDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeDateInterval"));

  -[DNDStateModeAssertionMetadata userVisibleEndDate](self, "userVisibleEndDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("userVisibleEndDate"));

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (unint64_t)lifetimeType
{
  return self->_lifetimeType;
}

- (NSDateInterval)activeDateInterval
{
  return self->_activeDateInterval;
}

- (NSDate)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_activeDateInterval, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
