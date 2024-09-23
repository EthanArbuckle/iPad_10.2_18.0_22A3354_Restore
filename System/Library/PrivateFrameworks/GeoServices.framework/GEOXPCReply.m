@implementation GEOXPCReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_peerBundleId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (void)send
{
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostId;
  NSString *peerBundleId;
  NSString *serviceName;
  NSString *methodName;
  int v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((self->_flags & 2) != 0
    && -[GEOXPCReply conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF597F0)
    && -[GEOXPCReply isValid](self, "isValid"))
  {
    -[GEOXPCReply replyDictionary](self, "replyDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      GEOEncodeModernXPCMessage(self, v3);
      xpc_dictionary_get_remote_connection(v3);
      v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        xpc_connection_send_message(v4, v3);
        if (self->_signpostId != -1)
        {
          GEOGetGEODaemonLog();
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = v6;
          signpostId = self->_signpostId;
          if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
          {
            peerBundleId = self->_peerBundleId;
            serviceName = self->_serviceName;
            methodName = self->_methodName;
            v12 = 138412802;
            v13 = peerBundleId;
            v14 = 2112;
            v15 = serviceName;
            v16 = 2112;
            v17 = methodName;
            _os_signpost_emit_with_name_impl(&dword_1885A9000, v7, OS_SIGNPOST_INTERVAL_END, signpostId, "HandleRequest", "type=xpc_message,peer=%@,message=%@.%@", (uint8_t *)&v12, 0x20u);
          }

        }
      }

    }
  }
}

- (OS_xpc_object)replyDictionary
{
  if ((self->_flags & 2) != 0)
    return self->_object;
  else
    return (OS_xpc_object *)0;
}

- (NSError)error
{
  return self->_error;
}

- (void)encodeToXPCDictionary:(id)a3
{
  NSError *error;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  xpc_object_t xdict;

  xdict = a3;
  if ((self->_flags & 2) != 0)
  {
    error = self->_error;
    if (error)
    {
      v5 = (void *)MEMORY[0x1E0CB36F8];
      _geo_NSErrorXPCSafeRepresentationCopy(error);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_retainAutorelease(v7);
      xpc_dictionary_set_data(xdict, "__error", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

    }
  }

}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (GEOXPCReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOXPCReply *v7;
  id *p_isa;
  const void *data;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  GEOXPCReply *v39;
  size_t length;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GEOXPCReply;
  v7 = -[GEOXPCReply init](&v42, sel_init);
  p_isa = (id *)&v7->super.isa;
  if (!v7)
    goto LABEL_17;
  v7->_flags = 1;
  length = 0;
  data = xpc_dictionary_get_data(v6, "__error", &length);
  if (!data)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3710];
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v14, v10, a4);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = p_isa[3];
  p_isa[3] = (id)v15;

  v17 = p_isa[3];
  if (objc_msgSend(v17, "code") == -3)
  {
    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      objc_msgSend(v17, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("requestKind"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "intValue");
      v24 = (v23 >> 8) & 0x7F;
      if (v24 > 0xB || ((1 << v24) & 0xC05) == 0 || v23 != 1)
      {
        objc_msgSend(v17, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("details"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "count"))
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("maxRequests"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "unsignedIntValue");

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("windowSize"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "unsignedIntValue");

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("timeUntilReset"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "unsignedIntValue");

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tried to make more than %u requests in %u seconds, will reset in %u seconds"), v29, v31, v33);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = CFSTR("No details found");
        }
        objc_msgSend(v17, "userInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("requestKindString"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v36;
          v45 = 2112;
          v46 = v34;
          v47 = 2112;
          v48 = v17;
          _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_FAULT, "Throttled \"%@\" request: %@ - %@", buf, 0x20u);
        }

      }
    }
  }

  v38 = p_isa[3];
  if (v38)
LABEL_16:
    v39 = p_isa;
  else
LABEL_17:
    v39 = 0;

  return v39;
}

- (GEOXPCReply)initWithRequest:(id)a3
{
  xpc_object_t *v4;
  GEOXPCReply *v5;
  GEOXPCReply *v6;
  OS_xpc_object *reply;
  OS_xpc_object *object;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *peerBundleId;
  uint64_t v13;
  NSString *serviceName;
  uint64_t v15;
  NSString *methodName;
  objc_super v18;

  v4 = (xpc_object_t *)a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOXPCReply;
  v5 = -[GEOXPCReply init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_flags = 2;
    if (v4 && ((_BYTE)v4[1] & 2) != 0)
      reply = (OS_xpc_object *)xpc_dictionary_create_reply(v4[2]);
    else
      reply = 0;
    object = v6->_object;
    v6->_object = reply;

    v9 = -[xpc_object_t signpostId](v4, "signpostId");
    v6->_signpostId = v9;
    if (v9 != -1)
    {
      -[xpc_object_t peer](v4, "peer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      peerBundleId = v6->_peerBundleId;
      v6->_peerBundleId = (NSString *)v11;

      -[xpc_object_t service](v4, "service");
      v13 = objc_claimAutoreleasedReturnValue();
      serviceName = v6->_serviceName;
      v6->_serviceName = (NSString *)v13;

      -[xpc_object_t method](v4, "method");
      v15 = objc_claimAutoreleasedReturnValue();
      methodName = v6->_methodName;
      v6->_methodName = (NSString *)v15;

    }
  }

  return v6;
}

- (GEOXPCReply)init
{
  GEOXPCReply *result;

  result = (GEOXPCReply *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOXPCReply)initWithReplyObject:(id)a3
{
  id v5;
  GEOXPCReply *v6;
  GEOXPCReply *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOXPCReply;
  v6 = -[GEOXPCReply init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_flags = 2;
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {flags: 0x%x object: %@ error: %@}>"), v5, self, self->_flags, self->_object, self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (OS_xpc_object)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

@end
