@implementation BMSubscriptionEvent

- (BMSubscriptionEvent)initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BMSubscriptionEvent *v15;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "bm_bootSessionUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BMSubscriptionEvent _initWithClient:identifier:useCase:starting:bootUUID:](self, "_initWithClient:identifier:useCase:starting:bootUUID:", v13, v12, v11, v6, v14);

  return v15;
}

- (id)_initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6 bootUUID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSubscriptionEvent *v17;
  BMSubscriptionEvent *v18;
  void *v19;
  uint64_t v20;
  NSString *uniqueIdentifier;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMSubscriptionEvent;
  v17 = -[BMSubscriptionEvent init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_dataVersion = 1;
    objc_storeStrong((id *)&v17->_client, a3);
    objc_storeStrong((id *)&v18->_identifier, a4);
    -[NSString stringByAppendingString:](v18->_client, "stringByAppendingString:", CFSTR(":"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", v14);
    v20 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v18->_uniqueIdentifier;
    v18->_uniqueIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v18->_useCase, a5);
    v18->_starting = a6;
    objc_storeStrong((id *)&v18->_bootUUID, a7);
  }

  return v18;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_starting)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: client=%@, identifier=%@, useCase=%@, starting=%@>"), v4, *(_OWORD *)&self->_client, self->_useCase, v5);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_client, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_useCase, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BMSubscriptionEvent *v4;
  BMSubscriptionEvent *v5;
  NSString *client;
  NSString *identifier;
  NSString *useCase;
  char v9;

  v4 = (BMSubscriptionEvent *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      client = self->_client;
      if ((client == v5->_client || -[NSString isEqual:](client, "isEqual:"))
        && ((identifier = self->_identifier, identifier == v5->_identifier)
         || -[NSString isEqual:](identifier, "isEqual:")))
      {
        useCase = self->_useCase;
        if (useCase == v5->_useCase)
          v9 = 1;
        else
          v9 = -[NSString isEqual:](useCase, "isEqual:");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)jsonDictionary
{
  NSString *client;
  void *v4;
  NSString *identifier;
  void *v6;
  NSString *useCase;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("client");
  client = self->_client;
  v4 = client;
  if (!client)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v4;
  v14[1] = CFSTR("identifier");
  identifier = self->_identifier;
  v6 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("useCase");
  useCase = self->_useCase;
  v8 = useCase;
  if (!useCase)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = MEMORY[0x1E0C9AAB0];
  if (!self->_starting)
    v9 = MEMORY[0x1E0C9AAA0];
  v15[2] = v8;
  v15[3] = v9;
  v14[3] = CFSTR("starting");
  v14[4] = CFSTR("bootUUID");
  -[NSUUID UUIDString](self->_bootUUID, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (useCase)
  {
    if (identifier)
      goto LABEL_15;
LABEL_18:

    if (client)
      return v12;
LABEL_19:

    return v12;
  }

  if (!identifier)
    goto LABEL_18;
LABEL_15:
  if (!client)
    goto LABEL_19;
  return v12;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
    v8 = (void *)v7;
    if (v7)
      *(_DWORD *)(v7 + 16) = 1;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMSubscriptionEvent eventWithData:dataVersion:].cold.1(a4, v9);

    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSubscriptionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSubscriptionEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BMSubscriptionEvent *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPBSubscriptionEvent bootUUID]((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[BMPBSubscriptionEvent bootUUID]((uint64_t)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

    }
    -[BMPBSubscriptionEvent client]((uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMPBSubscriptionEvent identifier]((uint64_t)v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMPBSubscriptionEvent useCase]((uint64_t)v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = (BMSubscriptionEvent *)-[BMSubscriptionEvent _initWithClient:identifier:useCase:starting:bootUUID:](self, "_initWithClient:identifier:useCase:starting:bootUUID:", v9, v10, v11, -[BMPBSubscriptionEvent starting]((_BOOL8)v5), v6);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BMSubscriptionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSubscriptionEvent *v5;
  BMSubscriptionEvent *v6;

  v4 = a3;
  v5 = -[BMPBSubscriptionEvent initWithData:]([BMPBSubscriptionEvent alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[BMSubscriptionEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPBSubscriptionEvent setStarting:]((uint64_t)v3, self->_starting);
  -[BMPBSubscriptionEvent setClient:]((uint64_t)v3, self->_client);
  -[BMPBSubscriptionEvent setIdentifier:]((uint64_t)v3, self->_identifier);
  -[BMPBSubscriptionEvent setUseCase:]((uint64_t)v3, self->_useCase);
  -[NSUUID UUIDString](self->_bootUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSubscriptionEvent setBootUUID:]((uint64_t)v3, v4);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMSubscriptionEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend((id)objc_opt_class(), "latestDataVersion"), CFSTR("dver"));

}

- (BMSubscriptionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BMSubscriptionEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dver")), HIDWORD(v6)))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "eventWithData:dataVersion:", v5, v6);
    v7 = (BMSubscriptionEvent *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)client
{
  return self->_client;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSUUID)bootUUID
{
  return self->_bootUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootUUID, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Unable to decode BMSubscriptionEvent with dataVersion %u", (uint8_t *)v2, 8u);
}

@end
