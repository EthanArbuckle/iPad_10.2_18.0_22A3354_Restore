@implementation MBMessage

+ (id)_allowedClasses
{
  if (_allowedClasses_onceToken != -1)
    dispatch_once(&_allowedClasses_onceToken, &__block_literal_global_11);
  return (id)_allowedClasses_sAllowedClasses;
}

void __28__MBMessage__allowedClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v31 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14,
    v13,
    v12,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_opt_class(),
    0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_allowedClasses_sAllowedClasses;
  _allowedClasses_sAllowedClasses = v10;

}

- (id)_initWithXPCObject:(id)a3
{
  id v5;
  MBMessage *v6;
  MBMessage *v7;
  const void *data;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *messageInfo;
  NSMutableDictionary *v14;
  NSMutableDictionary *replyInfo;
  const void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  id v22;
  size_t length;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MBMessage;
  v6 = -[MBMessage init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcObject, a3);
    length = 0;
    data = xpc_dictionary_get_data(v7->_xpcObject, "messageInfo", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
      objc_msgSend((id)objc_opt_class(), "_allowedClasses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x1E0CB2CD0]);
      v12 = objc_claimAutoreleasedReturnValue();
      messageInfo = v7->_messageInfo;
      v7->_messageInfo = (NSMutableDictionary *)v12;

      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      replyInfo = v7->_replyInfo;
      v7->_replyInfo = v14;
    }
    else
    {
      v16 = xpc_dictionary_get_data(v7->_xpcObject, "replyInfo", &length);
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("invalid xpc object"), 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v22);
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v16, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
      objc_msgSend((id)objc_opt_class(), "_allowedClasses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v17, *MEMORY[0x1E0CB2CD0]);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v7->_replyInfo;
      v7->_replyInfo = (NSMutableDictionary *)v18;

      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      replyInfo = v7->_messageInfo;
      v7->_messageInfo = v20;
    }

  }
  return v7;
}

+ (id)messageWithName:(id)a3 arguments:(id)a4 personaIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  MBMessage *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MBMessage initWithName:arguments:]([MBMessage alloc], "initWithName:arguments:", v9, v8);

  if (v7)
  {
    -[MBMessage messageInfo](v10, "messageInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("personaIdentifier"));

  }
  return v10;
}

+ (id)messageWithName:(id)a3 arguments:(id)a4
{
  id v5;
  id v6;
  MBMessage *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MBMessage initWithName:arguments:]([MBMessage alloc], "initWithName:arguments:", v6, v5);

  return v7;
}

- (MBMessage)initWithName:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  MBMessage *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *messageInfo;
  NSMutableDictionary *v14;
  NSMutableDictionary *replyInfo;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBConnection.m"), 303, CFSTR("must provide a name"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MBMessage;
  v9 = -[MBMessage init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11 = (void *)objc_msgSend(v7, "copy");
    v12 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, CFSTR("name"), 0);
    messageInfo = v9->_messageInfo;
    v9->_messageInfo = (NSMutableDictionary *)v12;

    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_messageInfo, "setObject:forKeyedSubscript:", v8, CFSTR("arguments"));
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    replyInfo = v9->_replyInfo;
    v9->_replyInfo = v14;

  }
  return v9;
}

- (NSString)name
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_messageInfo, "objectForKeyedSubscript:", CFSTR("name"));
}

- (NSArray)arguments
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->_messageInfo, "objectForKeyedSubscript:", CFSTR("arguments"));
}

- (NSString)personaIdentifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_messageInfo, "objectForKeyedSubscript:", CFSTR("personaIdentifier"));
}

- (NSError)error
{
  return (NSError *)-[NSMutableDictionary objectForKeyedSubscript:](self->_messageInfo, "objectForKeyedSubscript:", CFSTR("error"));
}

- (void)setError:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageInfo, "setObject:forKeyedSubscript:", a3, CFSTR("error"));
}

- (void)archiver:(id)a3 didEncodeObject:(id)a4
{
  id v4;
  objc_class *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  if (MBIsInternalInstall())
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CKRecordID"));

    if (v7)
    {
      MBGetDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_FAULT, "Improper error sanitizing: CKRecordID leaked", (uint8_t *)&v15, 2u);
        _MBLog(CFSTR("FAULT"), (uint64_t)"Improper error sanitizing: CKRecordID leaked", v9, v10, v11, v12, v13, v14, v15);
      }

    }
  }

}

- (void)sendReply
{
  void *v3;
  _xpc_connection_s *v4;
  xpc_object_t reply;
  void *v6;
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MBMessage replyError](self, "replyError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_remote_connection(self->_xpcObject);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(self->_xpcObject);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "encodeObject:forKey:", self->_replyInfo, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v6, "finishEncoding");
  objc_msgSend(v6, "encodedData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = xpc_data_create((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  xpc_dictionary_set_value(reply, "replyInfo", v8);
  if (v3)
  {
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[MBMessage name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_DEFAULT, "Sending reply for \"%{public}@\": %@", buf, 0x16u);

      -[MBMessage name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Sending reply for \"%{public}@\": %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    }
  }
  xpc_connection_send_message(v4, reply);

}

- (void)setReply:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replyInfo, "setObject:forKeyedSubscript:", a3, CFSTR("info"));
}

- (NSSecureCoding)reply
{
  return (NSSecureCoding *)-[NSMutableDictionary objectForKeyedSubscript:](self->_replyInfo, "objectForKeyedSubscript:", CFSTR("info"));
}

- (void)setReplyError:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replyInfo, "setObject:forKeyedSubscript:", a3, CFSTR("error"));
}

- (NSError)replyError
{
  return (NSError *)-[NSMutableDictionary objectForKeyedSubscript:](self->_replyInfo, "objectForKeyedSubscript:", CFSTR("error"));
}

- (id)_xpcObject
{
  OS_xpc_object *xpcObject;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  NSMutableDictionary *messageInfo;
  void *v7;
  id v8;
  id v9;
  xpc_object_t v10;
  id v12;

  xpcObject = self->_xpcObject;
  if (!xpcObject)
  {
    v4 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    v5 = self->_xpcObject;
    self->_xpcObject = v4;

    messageInfo = self->_messageInfo;
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", messageInfo, 1, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (!v7)
      -[MBMessage _xpcObject].cold.1((uint64_t *)&self->_messageInfo, (uint64_t)v8);
    v9 = objc_retainAutorelease(v7);
    v10 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    xpc_dictionary_set_value(self->_xpcObject, "messageInfo", v10);

    xpcObject = self->_xpcObject;
  }
  return xpcObject;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MBMessage;
  -[MBMessage description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_messageInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (MBConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (void)setXpcObject:(id)a3
{
  objc_storeStrong((id *)&self->_xpcObject, a3);
}

- (NSMutableDictionary)messageInfo
{
  return self->_messageInfo;
}

- (void)setMessageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_messageInfo, a3);
}

- (NSMutableDictionary)replyInfo
{
  return self->_replyInfo;
}

- (void)setReplyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_replyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyInfo, 0);
  objc_storeStrong((id *)&self->_messageInfo, 0);
  objc_storeStrong((id *)&self->_xpcObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_xpcObject
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MBGetDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *a1;
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = a2;
    _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_ERROR, "Failed to archive the message (%@): %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to archive the message (%@): %@", v6, v7, v8, v9, v10, v11, *a1);
  }

  __assert_rtn("-[MBMessage _xpcObject]", "MBConnection.m", 382, "0");
}

@end
