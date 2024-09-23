@implementation IDSGroupSessionBroadcastParameter

- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 serviceName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  IDSGroupSessionBroadcastParameter *v10;

  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IDSGroupSessionBroadcastParameter initWithGroupSessionID:salt:serviceName:](self, "initWithGroupSessionID:salt:serviceName:", v8, v9, v7);

  return v10;
}

- (IDSGroupSessionBroadcastParameter)initWithGroupSessionID:(id)a3 salt:(id)a4 serviceName:(id)a5
{
  id v8;
  id v9;
  IDSGroupSessionBroadcastParameter *v10;
  IDSGroupSessionBroadcastParameter *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  nw_endpoint_t host;
  OS_nw_endpoint *endpoint;
  nw_parameters_t v19;
  OS_nw_parameters *parameters;
  id v21;
  nw_endpoint_t v22;
  id v23;
  id v24;
  xpc_object_t v25;
  xpc_object_t v26;
  id v27;
  objc_super v29;
  unsigned __int8 md[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IDSGroupSessionBroadcastParameter;
  v10 = -[IDSGroupSessionBroadcastParameter init](&v29, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_groupSessionID, a3);
    objc_storeStrong((id *)&v11->_serviceName, a5);
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    memset(md, 170, 20);
    v13 = objc_retainAutorelease(v12);
    CC_SHA1((const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = *(unsigned __int16 *)objc_msgSend(v14, "bytes");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v16, "UTF8String"));
    endpoint = v11->_endpoint;
    v11->_endpoint = (OS_nw_endpoint *)host;

    v19 = nw_parameters_create();
    parameters = v11->_parameters;
    v11->_parameters = (OS_nw_parameters *)v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v15);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = nw_endpoint_create_host("::", (const char *)objc_msgSend(v21, "UTF8String"));

    v23 = objc_alloc_init(MEMORY[0x1E0D34D68]);
    objc_msgSend(v23, "setMultiplexer:", CFSTR("groupsession"));
    objc_msgSend(v23, "setSessionID:", v11->_groupSessionID);
    objc_msgSend(v23, "setParticipantID:", 0);
    objc_msgSend(v23, "setSalt:", v11->_salt);
    objc_msgSend(v23, "stringRepresentation");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    nw_parameters_set_account_id();

    MEMORY[0x19400FB34](v11->_parameters, v22);
    nw_parameters_set_indefinite();
    v25 = xpc_array_create(0, 0);
    v26 = xpc_array_create(0, 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v27, "UTF8String"));

    xpc_array_set_string(v26, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
    nw_parameters_set_data_mode();
    nw_parameters_set_required_netagent_classes();

  }
  return v11;
}

- (void)_requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_connection_t v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(id, nw_connection_t, void *);

  v10 = (void (**)(id, nw_connection_t, void *))a3;
  -[IDSGroupSessionBroadcastParameter endpoint](self, "endpoint");
  v4 = objc_claimAutoreleasedReturnValue();
  -[IDSGroupSessionBroadcastParameter parameters](self, "parameters");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = nw_connection_create(v4, v5);

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", CFSTR("Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket."), *MEMORY[0x1E0CB2D50], 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v9);

  }
  if (v10)
    v10[2](v10, v6, v7);

}

- (BOOL)isEqual:(id)a3
{
  IDSGroupSessionBroadcastParameter *v4;
  IDSGroupSessionBroadcastParameter *v5;
  NSString *groupSessionID;
  void *v7;
  NSData *salt;
  void *v9;
  NSString *serviceName;
  void *v11;
  char v12;

  v4 = (IDSGroupSessionBroadcastParameter *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      groupSessionID = self->_groupSessionID;
      -[IDSGroupSessionBroadcastParameter groupSessionID](v5, "groupSessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](groupSessionID, "isEqual:", v7))
      {
        salt = self->_salt;
        -[IDSGroupSessionBroadcastParameter salt](v5, "salt");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSData isEqual:](salt, "isEqual:", v9))
        {
          serviceName = self->_serviceName;
          -[IDSGroupSessionBroadcastParameter serviceName](v5, "serviceName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSString isEqual:](serviceName, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_groupSessionID, "hash");
  v4 = -[NSString hash](self->_serviceName, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_salt, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupSessionID;
  id v5;

  groupSessionID = self->_groupSessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupSessionID, CFSTR("groupSessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_salt, CFSTR("salt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));

}

- (IDSGroupSessionBroadcastParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  IDSGroupSessionBroadcastParameter *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IDSGroupSessionBroadcastParameter initWithGroupSessionID:salt:serviceName:](self, "initWithGroupSessionID:salt:serviceName:", v5, v6, v7);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSGroupSessionBroadcastParameter initWithGroupSessionID:salt:serviceName:]([IDSGroupSessionBroadcastParameter alloc], "initWithGroupSessionID:salt:serviceName:", self->_groupSessionID, self->_salt, self->_serviceName);
}

- (NSString)groupSessionID
{
  return self->_groupSessionID;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_groupSessionID, 0);
}

@end
