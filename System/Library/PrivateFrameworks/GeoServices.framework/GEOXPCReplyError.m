@implementation GEOXPCReplyError

- (GEOXPCReplyError)initWithReplyObject:(id)a3 error:(id)a4 mode:(unint64_t)a5
{
  id v9;
  id v10;
  GEOXPCReplyError *v11;
  GEOXPCReplyError *v12;
  GEOXPCReplyError *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = 0;
  if (v10 && v9 && a5 != 2)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOXPCReplyError;
    v12 = -[GEOXPCReplyError init](&v15, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_flags = 2;
      objc_storeStrong((id *)&v12->_object, a3);
      objc_storeStrong((id *)&v13->_error, a4);
      v13->_mode = a5;
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (GEOXPCReplyError)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOXPCReplyError *v7;
  GEOXPCReplyError *v8;
  int64_t int64;
  GEOXPCReplyError *v10;
  GEOXPCReplyError *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSError *v15;
  const void *data;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSError *error;
  NSError *v24;
  NSError *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  BOOL v33;
  int v34;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  objc_super v51;
  _BYTE length[12];
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  NSError *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51.receiver = self;
  v51.super_class = (Class)GEOXPCReplyError;
  v7 = -[GEOXPCReplyError init](&v51, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_30;
  v7->_flags = 1;
  int64 = xpc_dictionary_get_int64(v6, "__em__");
  v8->_mode = int64;
  switch(int64)
  {
    case 2:
      goto LABEL_30;
    case 1:
      *(_QWORD *)length = 0;
      data = xpc_dictionary_get_data(v6, "__error", (size_t *)length);
      if (!data || !*(_QWORD *)length)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, *(_QWORD *)length, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3710];
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v21, v17, a4);
      v22 = objc_claimAutoreleasedReturnValue();
      error = v8->_error;
      v8->_error = (NSError *)v22;

      break;
    case 0:
      xpc_dictionary_get_value(v6, "userInfo");
      v10 = (GEOXPCReplyError *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
        goto LABEL_31;
      xpc_dictionary_get_value(v10, "err");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {

        goto LABEL_30;
      }
      v13 = (void *)v12;
      _geo_NSErrorFromXPCDictionaryRepresentationCopy();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v8->_error;
      v8->_error = (NSError *)v14;

      break;
  }
  v24 = v8->_error;
  if (!v24)
  {
LABEL_30:
    v11 = 0;
    goto LABEL_31;
  }
  v25 = v24;
  if (-[NSError code](v25, "code") == -3)
  {
    -[NSError domain](v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (v28)
    {
      -[NSError userInfo](v25, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("requestKind"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v30, "intValue");
      v32 = (v31 >> 8) & 0x7F;
      v33 = v32 > 0xB;
      v34 = (1 << v32) & 0xC05;
      if (v33 || v34 == 0 || v31 != 1)
      {
        -[NSError userInfo](v25, "userInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("details"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "count"))
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("maxRequests"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "unsignedIntValue");

          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("windowSize"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "unsignedIntValue");

          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("timeUntilReset"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "unsignedIntValue");

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tried to make more than %u requests in %u seconds, will reset in %u seconds"), v41, v43, v45);
          v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v46 = CFSTR("No details found");
        }
        -[NSError userInfo](v25, "userInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("requestKindString"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)length = 138412802;
          *(_QWORD *)&length[4] = v48;
          v53 = 2112;
          v54 = v46;
          v55 = 2112;
          v56 = v25;
          _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_FAULT, "Throttled \"%@\" request: %@ - %@", length, 0x20u);
        }

      }
    }
  }

  v11 = v8;
LABEL_31:

  return v11;
}

- (void)encodeToXPCDictionary:(id)a3
{
  NSError *error;
  int64_t mode;
  id v6;
  xpc_object_t empty;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t xdict;

  xdict = a3;
  if ((self->_flags & 2) != 0)
  {
    error = self->_error;
    if (error)
    {
      mode = self->_mode;
      if (mode != 2)
      {
        if (mode == 1)
        {
          v8 = (void *)MEMORY[0x1E0CB36F8];
          _geo_NSErrorXPCSafeRepresentationCopy(error);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = objc_retainAutorelease(v10);
          xpc_dictionary_set_data(xdict, "__error", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
        }
        else
        {
          if (mode)
          {
LABEL_9:
            xpc_dictionary_set_int64(xdict, "__em__", mode);
            goto LABEL_10;
          }
          _geo_NSErrorXPCDictionaryRepresentationCopy(error);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          empty = xpc_dictionary_create_empty();
          xpc_dictionary_set_value(empty, "err", v6);
          xpc_dictionary_set_value(xdict, "userInfo", empty);

        }
        mode = self->_mode;
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOXPCReplyError error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
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

- (void)send
{
  OS_xpc_object *object;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;

  if ((self->_flags & 2) != 0)
  {
    if (-[GEOXPCReplyError isValid](self, "isValid"))
    {
      object = self->_object;
      if (object)
      {
        if (self->_mode == 1)
          GEOEncodeModernXPCMessage(self, object);
        else
          -[GEOXPCReplyError encodeToXPCDictionary:](self, "encodeToXPCDictionary:", self->_object);
        xpc_dictionary_get_remote_connection(self->_object);
        v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = v4;
          xpc_connection_send_message(v4, self->_object);
          v4 = v5;
        }

      }
    }
  }
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end
