@implementation DNDRequestDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("clientIdentifier"));

  -[DNDRequestDetails auditUUID](self, "auditUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("auditUUID"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[DNDRequestDetails timestamp](self, "timestamp"), CFSTR("timestamp"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDRequestDetails auditUUID](self, "auditUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSUUID)auditUUID
{
  return self->_auditUUID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditUUID, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (DNDRequestDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DNDRequestDetails *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestamp"));

  v8 = -[DNDRequestDetails initWithClientIdentifier:auditUUID:timestamp:](self, "initWithClientIdentifier:auditUUID:timestamp:", v5, v6, v7);
  return v8;
}

+ (id)detailsRepresentingNowWithClientIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClientIdentifier:auditUUID:timestamp:", v5, v6, mach_absolute_time());

  return v7;
}

- (DNDRequestDetails)initWithClientIdentifier:(id)a3 auditUUID:(id)a4 timestamp:(unint64_t)a5
{
  id v8;
  id v9;
  DNDRequestDetails *v10;
  uint64_t v11;
  NSString *clientIdentifier;
  uint64_t v13;
  NSUUID *auditUUID;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDRequestDetails;
  v10 = -[DNDRequestDetails init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    auditUUID = v10->_auditUUID;
    v10->_auditUUID = (NSUUID *)v13;

    v10->_timestamp = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (unint64_t)((double)-[DNDRequestDetails timestamp](self, "timestamp") * 1000.0);
  -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[DNDRequestDetails auditUUID](self, "auditUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDRequestDetails *v7;
  DNDRequestDetails *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (DNDRequestDetails *)a3;
  if (self == v7)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDRequestDetails clientIdentifier](v8, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        -[DNDRequestDetails clientIdentifier](v8, "clientIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v4 = (void *)v12;
        -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDRequestDetails clientIdentifier](v8, "clientIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v5))
        {
          v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      -[DNDRequestDetails auditUUID](self, "auditUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDRequestDetails auditUUID](v8, "auditUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
        goto LABEL_16;
      -[DNDRequestDetails auditUUID](self, "auditUUID");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        v14 = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      -[DNDRequestDetails auditUUID](v8, "auditUUID");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v14 = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      -[DNDRequestDetails auditUUID](self, "auditUUID");
      v19 = objc_claimAutoreleasedReturnValue();
      -[DNDRequestDetails auditUUID](v8, "auditUUID");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v21 = (void *)v19;
      v4 = (void *)v20;
      if (objc_msgSend(v21, "isEqual:", v20))
      {
LABEL_16:
        v22 = -[DNDRequestDetails timestamp](self, "timestamp");
        v14 = v22 == -[DNDRequestDetails timestamp](v8, "timestamp");
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          v4 = v28;
          v5 = v26;
          if (v9 != v10)
            goto LABEL_26;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        v14 = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_29:

  return v14;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDRequestDetails clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDRequestDetails auditUUID](self, "auditUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: '%@'; auditUUID: %@; timestamp: %llu>"),
    v4,
    self,
    v5,
    v6,
    -[DNDRequestDetails timestamp](self, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
