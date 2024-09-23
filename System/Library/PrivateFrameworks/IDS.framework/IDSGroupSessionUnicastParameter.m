@implementation IDSGroupSessionUnicastParameter

- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 dataMode:(int64_t)a6 connectionIndex:(unint64_t)a7
{
  void *v12;
  id v13;
  void *v14;
  IDSGroupSessionUnicastParameter *v15;

  v12 = (void *)MEMORY[0x1E0C99D50];
  v13 = a3;
  objc_msgSend(v12, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IDSGroupSessionUnicastParameter initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:](self, "initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:", v13, a4, a5, v14, a6, a7);

  return v15;
}

- (IDSGroupSessionUnicastParameter)initWithGroupSessionID:(id)a3 localParticipantID:(unint64_t)a4 remoteParticipantID:(unint64_t)a5 salt:(id)a6 dataMode:(int64_t)a7 connectionIndex:(unint64_t)a8
{
  id v15;
  id v16;
  IDSGroupSessionUnicastParameter *v17;
  IDSGroupSessionUnicastParameter *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned __int16 v23;
  __int16 v24;
  __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  id v28;
  nw_endpoint_t host;
  OS_nw_endpoint *endpoint;
  nw_parameters_t v31;
  OS_nw_parameters *parameters;
  id v33;
  nw_endpoint_t v34;
  id v35;
  id v36;
  xpc_object_t v37;
  xpc_object_t v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v43;
  NSObject *options;
  void *v45;
  IDSGroupSessionUnicastParameter *v46;
  NSObject *v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v49.receiver = self;
  v49.super_class = (Class)IDSGroupSessionUnicastParameter;
  v17 = -[IDSGroupSessionUnicastParameter init](&v49, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_groupSessionID, a3);
    v18->_localParticipantID = a4;
    v18->_remoteParticipantID = a5;
    objc_storeStrong((id *)&v18->_salt, a6);
    v18->_connectionIndex = a8;
    v18->_dataMode = a7;
    v18->_socket = -1;
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
      v21 = v15;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v20;
      v52 = 2112;
      v53 = v22;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Creating IDSGroupSessionUnicastParameter with local id %@ and remote id %@", buf, 0x16u);

      v15 = v21;
    }

    switch(a7)
    {
      case 0:
        v23 = a8 - 25536;
        v24 = -20536;
        goto LABEL_12;
      case 1:
        v25 = 30000;
        goto LABEL_10;
      case 2:
        v23 = a8 - 15536;
        v24 = -10536;
        goto LABEL_12;
      case 3:
        v23 = a8 - 23536;
        v24 = -18536;
        goto LABEL_12;
      case 4:
        v25 = 32000;
LABEL_10:
        v23 = a8 + v25;
        v26 = v23;
        goto LABEL_13;
      case 5:
        v23 = a8 - 13536;
        v24 = -8536;
LABEL_12:
        v26 = a8 + v24;
LABEL_13:
        if (a4 <= a5)
          v27 = v23;
        else
          v27 = v26;
        if (a4 <= a5)
          v23 = v26;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v23);
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v28, "UTF8String"));
        endpoint = v18->_endpoint;
        v18->_endpoint = (OS_nw_endpoint *)host;

        v31 = nw_parameters_create();
        parameters = v18->_parameters;
        v18->_parameters = (OS_nw_parameters *)v31;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v27);
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = nw_endpoint_create_host("::", (const char *)objc_msgSend(v33, "UTF8String"));

        v35 = objc_alloc_init(MEMORY[0x1E0D34D68]);
        objc_msgSend(v35, "setMultiplexer:", CFSTR("groupsession"));
        objc_msgSend(v35, "setSessionID:", v18->_groupSessionID);
        objc_msgSend(v35, "setParticipantID:", v18->_remoteParticipantID);
        objc_msgSend(v35, "setSalt:", v18->_salt);
        objc_msgSend(v35, "stringRepresentation");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v36, "UTF8String");
        nw_parameters_set_account_id();

        MEMORY[0x19400FB34](v18->_parameters, v34);
        nw_parameters_set_indefinite();
        v37 = xpc_array_create(0, 0);
        v38 = xpc_array_create(0, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_array_set_string(v37, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v39, "UTF8String"));

        xpc_array_set_string(v38, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
        if ((unint64_t)a7 <= 5)
        {
          if (((1 << a7) & 9) == 0 && ((1 << a7) & 0x12) == 0)
          {
            v40 = nw_parameters_copy_default_protocol_stack((nw_parameters_t)v18->_parameters);
            v48 = v34;
            v41 = v16;
            v42 = v15;
            v43 = sub_1906F3D78();
            options = nw_framer_create_options(v43);
            nw_protocol_stack_prepend_application_protocol(v40, options);

            v15 = v42;
            v16 = v41;
            v34 = v48;

          }
          nw_parameters_set_data_mode();
          nw_parameters_set_required_netagent_classes();
          if ((unint64_t)(a7 - 3) <= 2)
          {
            IDSRealTimeContext();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            nw_parameters_set_context();

          }
          goto LABEL_25;
        }

LABEL_28:
        v46 = 0;
        break;
      default:
        goto LABEL_28;
    }
  }
  else
  {
LABEL_25:
    v46 = v18;
  }

  return v46;
}

- (IDSGroupSessionUnicastParameter)initWithConnectedSocket:(int)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5
{
  IDSGroupSessionUnicastParameter *v8;
  IDSGroupSessionUnicastParameter *v9;
  NSString *groupSessionID;
  OS_nw_endpoint *endpoint;
  OS_nw_parameters *parameters;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IDSGroupSessionUnicastParameter;
  v8 = -[IDSGroupSessionUnicastParameter init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    groupSessionID = v8->_groupSessionID;
    v8->_groupSessionID = 0;

    *(_OWORD *)&v9->_localParticipantID = xmmword_19080A6D0;
    v9->_connectionIndex = a5;
    v9->_dataMode = a4;
    v9->_socket = a3;
    endpoint = v9->_endpoint;
    v9->_endpoint = 0;

    parameters = v9->_parameters;
    v9->_parameters = 0;

  }
  return v9;
}

- (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__requestNWConnectionforIDSGroupSessionUnicastParameter_);
}

- (void)_requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_connection_t v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(id, nw_connection_t, void *);

  v10 = (void (**)(id, nw_connection_t, void *))a3;
  if (-[IDSGroupSessionUnicastParameter socket](self, "socket") < 1)
  {
    -[IDSGroupSessionUnicastParameter endpoint](self, "endpoint");
    v4 = objc_claimAutoreleasedReturnValue();
    -[IDSGroupSessionUnicastParameter parameters](self, "parameters");
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
  else
  {
    -[IDSGroupSessionUnicastParameter _setUpNWConnectionforTesting:](self, "_setUpNWConnectionforTesting:", v10);
  }

}

- (void)_setUpNWConnectionforTesting:(id)a3
{
  void *v4;
  void *v5;
  NSObject *secure_tcp;
  NSObject *v7;
  NSObject *v8;
  NSObject *options;
  id v10;
  void *v11;
  void (**v12)(id, void *, void *);

  v12 = (void (**)(id, void *, void *))a3;
  if (-[IDSGroupSessionUnicastParameter dataMode](self, "dataMode")
    && -[IDSGroupSessionUnicastParameter dataMode](self, "dataMode") != 1)
  {
    if (-[IDSGroupSessionUnicastParameter dataMode](self, "dataMode") == 2)
    {
      secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
      v7 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      v8 = sub_1906F3D78();
      options = nw_framer_create_options(v8);
      nw_protocol_stack_prepend_application_protocol(v7, options);

      -[IDSGroupSessionUnicastParameter socket](self, "socket");
      v4 = (void *)nw_connection_create_with_connected_socket_and_parameters();

      if (v4)
        goto LABEL_4;
    }
  }
  else
  {
    -[IDSGroupSessionUnicastParameter socket](self, "socket");
    v4 = (void *)nw_connection_create_with_connected_socket();
    if (v4)
    {
LABEL_4:
      v5 = 0;
      goto LABEL_8;
    }
  }
  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", CFSTR("Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket."), *MEMORY[0x1E0CB2D50], 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v11);

  v4 = 0;
LABEL_8:
  if (v12)
    v12[2](v12, v4, v5);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupSessionID;
  id v5;

  groupSessionID = self->_groupSessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupSessionID, CFSTR("groupSessionID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_localParticipantID, CFSTR("localParticipantID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_remoteParticipantID, CFSTR("remoteParticipantID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_salt, CFSTR("salt"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_connectionIndex, CFSTR("connectionIndex"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_dataMode), CFSTR("dataMode"));

}

- (IDSGroupSessionUnicastParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  IDSGroupSessionUnicastParameter *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("localParticipantID"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("remoteParticipantID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("connectionIndex"));
  v10 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataMode"));

  v11 = -[IDSGroupSessionUnicastParameter initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:](self, "initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:", v5, v6, v7, v8, v10, v9);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  IDSGroupSessionUnicastParameter *v4;
  IDSGroupSessionUnicastParameter *v5;
  NSString *groupSessionID;
  void *v7;
  unint64_t localParticipantID;
  unint64_t remoteParticipantID;
  unint64_t connectionIndex;
  int64_t dataMode;
  BOOL v12;

  v4 = (IDSGroupSessionUnicastParameter *)a3;
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
      -[IDSGroupSessionUnicastParameter groupSessionID](v5, "groupSessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](groupSessionID, "isEqual:", v7)
        && (localParticipantID = self->_localParticipantID,
            localParticipantID == -[IDSGroupSessionUnicastParameter localParticipantID](v5, "localParticipantID"))
        && (remoteParticipantID = self->_remoteParticipantID,
            remoteParticipantID == -[IDSGroupSessionUnicastParameter remoteParticipantID](v5, "remoteParticipantID"))
        && (connectionIndex = self->_connectionIndex,
            connectionIndex == -[IDSGroupSessionUnicastParameter connectionIndex](v5, "connectionIndex")))
      {
        dataMode = self->_dataMode;
        v12 = dataMode == -[IDSGroupSessionUnicastParameter dataMode](v5, "dataMode");
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
  NSData *salt;
  unint64_t v5;

  v3 = self->_dataMode + 32 * (-[NSString hash](self->_groupSessionID, "hash") + 31);
  salt = self->_salt;
  v5 = self->_remoteParticipantID + 32 * (self->_localParticipantID + 32 * (self->_connectionIndex + 32 * v3));
  return -[NSData hash](salt, "hash") + 32 * v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSGroupSessionUnicastParameter initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:]([IDSGroupSessionUnicastParameter alloc], "initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:", self->_groupSessionID, self->_localParticipantID, self->_remoteParticipantID, self->_salt, self->_dataMode, self->_connectionIndex);
}

- (NSString)groupSessionID
{
  return self->_groupSessionID;
}

- (unint64_t)localParticipantID
{
  return self->_localParticipantID;
}

- (unint64_t)remoteParticipantID
{
  return self->_remoteParticipantID;
}

- (NSData)salt
{
  return self->_salt;
}

- (unint64_t)connectionIndex
{
  return self->_connectionIndex;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_groupSessionID, 0);
}

@end
