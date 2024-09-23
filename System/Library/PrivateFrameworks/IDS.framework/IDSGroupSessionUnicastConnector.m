@implementation IDSGroupSessionUnicastConnector

- (IDSGroupSessionUnicastConnector)initWithGroupSessionID:(id)a3 participantID:(unint64_t)a4 dataMode:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  IDSGroupSessionUnicastConnector *v11;

  v8 = (void *)MEMORY[0x1E0C99D50];
  v9 = a3;
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IDSGroupSessionUnicastConnector initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:](self, "initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:", v9, a4, v10, a5);

  return v11;
}

- (IDSGroupSessionUnicastConnector)initWithGroupSessionIDAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 dataMode:(int64_t)a6
{
  id v10;
  id v11;
  IDSGroupSessionUnicastConnector *v12;
  uint64_t v13;
  NSString *groupSessionIDAlias;
  uint64_t v15;
  NSData *salt;
  id connectionReadyCallback;
  OS_nw_connection *cachedConnection;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSGroupSessionUnicastConnector;
  v12 = -[IDSGroupSessionUnicastConnector init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    groupSessionIDAlias = v12->_groupSessionIDAlias;
    v12->_groupSessionIDAlias = (NSString *)v13;

    v12->_participantIDAlias = a4;
    v15 = objc_msgSend(v11, "copy");
    salt = v12->_salt;
    v12->_salt = (NSData *)v15;

    connectionReadyCallback = v12->_connectionReadyCallback;
    v12->_dataMode = a6;
    v12->_connectionReadyCallback = 0;

    cachedConnection = v12->_cachedConnection;
    v12->_cachedConnection = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("IDSGroupSessionUnicastConnector", v19);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v20;

  }
  return v12;
}

- (id)createDataBlobFrom:(id)a3 port:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  unint64_t participantIDAlias;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *groupSessionIDAlias;
  NSData *salt;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  participantIDAlias = self->_participantIDAlias;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%llu"), participantIDAlias);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  groupSessionIDAlias = self->_groupSessionIDAlias;
  salt = self->_salt;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dataMode);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("psk"), v12, CFSTR("listeningPort"), groupSessionIDAlias, CFSTR("groupSessionIDAlias"), v9, CFSTR("participantIDAlias"), salt, CFSTR("salt"), v15, CFSTR("dataMode"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "createDataBlobFrom: encoded %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)extractDictionaryFromDataBlobFrom:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v11, v5, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "extractDictionaryFromDataBlobFrom: decoded %@", buf, 0xCu);
    }

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("psk"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length") == 32;

    if (!v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", CFSTR("PreSharedKey has Unexpected size."), *MEMORY[0x1E0CB2D50], 0);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v17);

      v12 = 0;
    }
  }

  return v12;
}

- (void)requestDataBlob:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  id v8;
  unint64_t dataMode;
  NSObject *v10;
  NSObject *v11;
  NSObject *options;
  void *v13;
  id v14;
  id v15;
  void *v16;
  const __SecRandom *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  nw_protocol_stack_t v22;
  nw_protocol_options_t v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  xpc_object_t v34;
  xpc_object_t v35;
  void *v36;
  _QWORD v37[5];
  _QWORD handler[4];
  NSObject *v39;
  IDSGroupSessionUnicastConnector *v40;
  id v41;
  id v42;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = nw_parameters_create();
  v6 = xpc_array_create(0, 0);
  v7 = xpc_array_create(0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v8, "UTF8String"));

  xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
  nw_parameters_set_required_netagent_classes();
  dataMode = self->_dataMode;
  if (dataMode > 5)
  {
    v31 = objc_alloc(MEMORY[0x1E0C99D80]);
    v32 = (void *)objc_msgSend(v31, "initWithObjectsAndKeys:", CFSTR("Unknown parameter"), *MEMORY[0x1E0CB2D50], 0);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v32);
    v4[2](v4, 0, v33);

  }
  else
  {
    if (((1 << dataMode) & 9) == 0 && ((1 << dataMode) & 0x12) == 0)
    {
      v10 = nw_parameters_copy_default_protocol_stack(v5);
      v11 = sub_1906F3D78();
      options = nw_framer_create_options(v11);
      nw_protocol_stack_prepend_application_protocol(v10, options);

      dataMode = self->_dataMode;
    }
    if (dataMode - 3 <= 2)
    {
      IDSRealTimeContext();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_context();

    }
    nw_parameters_set_data_mode();
    v14 = objc_alloc_init(MEMORY[0x1E0D34D68]);
    objc_msgSend(v14, "setMultiplexer:", CFSTR("groupsession"));
    objc_msgSend(v14, "setSessionID:", self->_groupSessionIDAlias);
    objc_msgSend(v14, "setSalt:", self->_salt);
    objc_msgSend(v14, "stringRepresentation");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "UTF8String");
    nw_parameters_set_account_id();

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    v18 = objc_retainAutorelease(v16);
    if (SecRandomCopyBytes(v17, 0x20uLL, (void *)objc_msgSend(v18, "mutableBytes")))
    {
      v19 = objc_alloc(MEMORY[0x1E0C99D80]);
      v20 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", CFSTR("Unable to create PSK."), *MEMORY[0x1E0CB2D50], 0);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v20);
      v4[2](v4, 0, v21);

    }
    else
    {
      v35 = v6;
      v22 = nw_parameters_copy_default_protocol_stack(v5);
      v36 = v4;
      v23 = nw_tls_create_options();
      v34 = v7;
      v24 = v23;
      v25 = objc_retainAutorelease(v18);
      v26 = dispatch_data_create((const void *)objc_msgSend(v25, "bytes"), 0x20uLL, 0, 0);
      v27 = dispatch_data_create("IDSToolTestOnlyPSKIdentity", 0x1AuLL, 0, 0);
      sec_protocol_options_add_pre_shared_key(v24, v26, v27);

      nw_protocol_stack_append_application_protocol();
      v28 = nw_listener_create_with_port("0", v5);
      nw_listener_set_queue(v28, (dispatch_queue_t)self->_queue);
      v29 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_19076932C;
      handler[3] = &unk_1E2C631D0;
      v39 = v28;
      v40 = self;
      v41 = v25;
      v42 = v36;
      v30 = v28;
      nw_listener_set_state_changed_handler(v30, handler);
      v37[0] = v29;
      v37[1] = 3221225472;
      v37[2] = sub_19076950C;
      v37[3] = &unk_1E2C631F8;
      v37[4] = self;
      nw_listener_set_new_connection_handler(v30, v37);
      nw_listener_start(v30);

      v7 = v34;
      v4 = (void (**)(id, _QWORD, void *))v36;

      v6 = v35;
    }

  }
}

- (void)listenForIncomingConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907695E8;
  v7[3] = &unk_1E2C60820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *options;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *host;
  id v29;
  nw_endpoint_t v30;
  nw_protocol_stack_t v31;
  nw_protocol_options_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  nw_connection_t v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  unsigned __int16 v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, id))a4;
  v55 = 0;
  +[IDSGroupSessionUnicastConnector extractDictionaryFromDataBlobFrom:error:](IDSGroupSessionUnicastConnector, "extractDictionaryFromDataBlobFrom:error:", a3, &v55);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v55;
  if (v7)
    v5[2](v5, 0, v7);
  v51 = v5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupSessionIDAlias"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("participantIDAlias"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("salt"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("psk"));
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("listeningPort"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v12, "integerValue");

  v13 = nw_parameters_create();
  v14 = xpc_array_create(0, 0);
  v15 = xpc_array_create(0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_array_set_string(v14, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v16, "UTF8String"));

  xpc_array_set_string(v15, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
  v49 = v15;
  v50 = v14;
  nw_parameters_set_required_netagent_classes();
  if (v11 > 5)
  {
    v42 = objc_alloc(MEMORY[0x1E0C99D80]);
    v23 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", CFSTR("Unknown parameter"), *MEMORY[0x1E0CB2D50], 0);
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v23);
    v37 = (void (**)(_QWORD, _QWORD, _QWORD))v51;
    (*((void (**)(id, _QWORD, void *))v51 + 2))(v51, 0, v41);
  }
  else
  {
    if (((1 << v11) & 9) != 0)
    {
      v17 = v53;
    }
    else
    {
      v17 = v53;
      if (((1 << v11) & 0x12) == 0)
      {
        v18 = nw_parameters_copy_default_protocol_stack(v13);
        v19 = sub_1906F3D78();
        v20 = v9;
        options = nw_framer_create_options(v19);
        nw_protocol_stack_prepend_application_protocol(v18, options);

        v9 = v20;
      }
    }
    if (v11 - 3 <= 2)
    {
      IDSRealTimeContext();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_context();

    }
    v46 = v7;
    v47 = v6;
    nw_parameters_set_data_mode();
    v23 = objc_alloc_init(MEMORY[0x1E0D34D68]);
    objc_msgSend(v23, "setMultiplexer:", CFSTR("groupsession"));
    v45 = v8;
    objc_msgSend(v23, "setSessionID:", v8);
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v9);
    v54 = 0;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scanUnsignedLongLong:", &v54);
    objc_msgSend(v23, "setParticipantID:", v54);
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v23, "participantID");
      *(_DWORD *)buf = 134218242;
      v57 = v25;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "requestNWConnectionWithDataBlob: decoded participantIDAlias %llu from %@", buf, 0x16u);
    }
    v44 = v9;

    objc_msgSend(v23, "setSalt:", v17);
    objc_msgSend(v23, "stringRepresentation");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "UTF8String");
    nw_parameters_set_account_id();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v48);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v27, "UTF8String"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v48 + 1);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = nw_endpoint_create_host("::", (const char *)objc_msgSend(v29, "UTF8String"));

    MEMORY[0x19400FB34](v13, v30);
    v31 = nw_parameters_copy_default_protocol_stack(v13);
    v32 = nw_tls_create_options();
    v33 = v32;
    v34 = dispatch_data_create((const void *)objc_msgSend(objc_retainAutorelease(v52), "bytes"), 0x20uLL, 0, 0);
    v35 = dispatch_data_create("IDSToolTestOnlyPSKIdentity", 0x1AuLL, 0, 0);
    sec_protocol_options_add_pre_shared_key(v33, v34, v35);

    nw_protocol_stack_append_application_protocol();
    v36 = nw_connection_create(host, v13);
    v37 = (void (**)(_QWORD, _QWORD, _QWORD))v51;
    (*((void (**)(id, nw_connection_t, _QWORD))v51 + 2))(v51, v36, 0);
    v38 = 0;
    if (!v36)
    {
      v39 = objc_alloc(MEMORY[0x1E0C99D80]);
      v40 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", CFSTR("Unable to create nw_connection. The failure was caused due to invalid parameters or not being able to extract the address from the socket."), *MEMORY[0x1E0CB2D50], 0);
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v40);

      v37 = (void (**)(_QWORD, _QWORD, _QWORD))v51;
    }
    ((void (**)(_QWORD, nw_connection_t, void *))v37)[2](v37, v36, v38);

    v7 = v46;
    v6 = v47;
    v9 = v44;
    v8 = v45;
    v41 = v43;
  }

}

+ (void)requestNWConnectionToVirtualParticipant:(unint64_t)a3 forSession:(id)a4 completionHandler:(id)a5
{
  id v7;
  NSObject *quic_stream;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *host;
  nw_endpoint_t v17;
  nw_connection_t v18;
  void *v19;
  id v20;
  void *v21;
  void (**v22)(id, nw_connection_t, void *);

  v22 = (void (**)(id, nw_connection_t, void *))a5;
  v7 = a4;
  quic_stream = nw_parameters_create_quic_stream();
  v9 = xpc_array_create(0, 0);
  v10 = xpc_array_create(0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_array_set_string(v9, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v11, "UTF8String"));

  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
  nw_parameters_set_required_netagent_classes();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("groupsession:%@:ids:%@:L"), v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "UTF8String");
  nw_parameters_set_account_id();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 3030);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v15, "UTF8String"));

  v17 = nw_endpoint_create_host("::", "0");
  MEMORY[0x19400FB34](quic_stream, v17);
  v18 = nw_connection_create(host, quic_stream);
  v19 = 0;
  if (!v18)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v21 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", CFSTR("Unable to create connection to the virtual participant."), *MEMORY[0x1E0CB2D50], 0);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 42, v21);

  }
  if (v22)
    v22[2](v22, v18, v19);

}

- (BOOL)isEqual:(id)a3
{
  IDSGroupSessionUnicastConnector *v4;
  IDSGroupSessionUnicastConnector *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v4 = (IDSGroupSessionUnicastConnector *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[IDSGroupSessionUnicastConnector groupSessionIDAlias](v5, "groupSessionIDAlias");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSGroupSessionUnicastConnector groupSessionIDAlias](self, "groupSessionIDAlias");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (v9 = -[IDSGroupSessionUnicastConnector participantIDAlias](v5, "participantIDAlias"),
            v9 == -[IDSGroupSessionUnicastConnector participantIDAlias](self, "participantIDAlias")))
      {
        v10 = -[IDSGroupSessionUnicastConnector dataMode](v5, "dataMode");
        v11 = v10 == -[IDSGroupSessionUnicastConnector dataMode](self, "dataMode");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[IDSGroupSessionUnicastConnector groupSessionIDAlias](self, "groupSessionIDAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IDSGroupSessionUnicastConnector salt](self, "salt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[IDSGroupSessionUnicastConnector participantIDAlias](self, "participantIDAlias");
  v8 = v6 ^ (-[IDSGroupSessionUnicastConnector dataMode](self, "dataMode") + v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupSessionIDAlias;
  id v5;

  groupSessionIDAlias = self->_groupSessionIDAlias;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupSessionIDAlias, CFSTR("groupSessionIDAlias"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_participantIDAlias, CFSTR("participantIDAlias"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_salt, CFSTR("salt"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_dataMode), CFSTR("dataMode"));

}

- (IDSGroupSessionUnicastConnector)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  IDSGroupSessionUnicastConnector *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupSessionIDAlias"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("participantIDAlias"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataMode"));

  v9 = -[IDSGroupSessionUnicastConnector initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:](self, "initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:", v5, v6, v7, v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSGroupSessionUnicastConnector initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:]([IDSGroupSessionUnicastConnector alloc], "initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:", self->_groupSessionIDAlias, self->_participantIDAlias, self->_salt, self->_dataMode);
}

- (NSString)groupSessionIDAlias
{
  return self->_groupSessionIDAlias;
}

- (unint64_t)participantIDAlias
{
  return self->_participantIDAlias;
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (id)connectionReadyCallback
{
  return self->_connectionReadyCallback;
}

- (void)setConnectionReadyCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_nw_connection)cachedConnection
{
  return self->_cachedConnection;
}

- (void)setCachedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_connectionReadyCallback, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_groupSessionIDAlias, 0);
}

@end
