@implementation GEOXPCMessage

- (GEOXPCMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOXPCMessage *v7;
  GEOXPCMessage *v8;
  GEOXPCMessage *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOXPCMessage;
  v7 = -[GEOXPCMessage init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_object, a3);
    v9 = v8;
  }

  return v8;
}

+ (NSString)messageName
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)canDecodeFromXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint8_t v9[16];

  v4 = a3;
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EDF59540) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]", v9, 2u);
    }
    goto LABEL_8;
  }
  if (!v4 || MEMORY[0x18D765A14](v4) != MEMORY[0x1E0C812F8])
  {
LABEL_8:
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

LABEL_5:
  return v7;
}

+ (id)decodeFromXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EDF59540) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v6, "message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "messageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
    {
      xpc_dictionary_get_value(v6, "__msg");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 || (xpc_dictionary_get_value(v6, "userInfo"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithXPCDictionary:error:", v10, a4);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v14;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Can not parse message as %@: \"%@\", (uint8_t *)&v16, 0x16u);

      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v16) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]", (uint8_t *)&v16, 2u);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)send:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v4 = a3;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    v10 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Assertion failed: connection != ((void *)0)";
    v8 = (uint8_t *)&v10;
LABEL_9:
    _os_log_fault_impl(&dword_1885A9000, v6, OS_LOG_TYPE_FAULT, v7, v8, 2u);
    goto LABEL_4;
  }
  if ((-[GEOXPCMessage conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF59540) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    v9 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]";
    v8 = (uint8_t *)&v9;
    goto LABEL_9;
  }
  -[GEOXPCMessage _prepareMessage](self, "_prepareMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:", v5);

LABEL_4:
}

- (BOOL)sendSync:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  __int16 v18;
  __int16 v19;

  v6 = a3;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_16:
      v10 = 0;
      goto LABEL_12;
    }
    v19 = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: connection != ((void *)0)";
    v17 = (uint8_t *)&v19;
LABEL_18:
    _os_log_fault_impl(&dword_1885A9000, v15, OS_LOG_TYPE_FAULT, v16, v17, 2u);
    goto LABEL_16;
  }
  if ((-[GEOXPCMessage conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF59540) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v18 = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]";
    v17 = (uint8_t *)&v18;
    goto LABEL_18;
  }
  -[GEOXPCMessage _prepareMessage](self, "_prepareMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessageWithReplySync:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOXPCErrorFromReply(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unexpected response"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v13;

    v10 = 1;
    if (a4 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a4 = v9;
    }
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }

LABEL_12:
  return v10;
}

- (id)_prepareMessage
{
  xpc_object_t v3;
  id v4;

  if (-[GEOXPCMessage conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF59540)
    && -[GEOXPCMessage isValid](self, "isValid"))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    GEOEncodeModernXPCMessage(self, v3);
    objc_msgSend((id)objc_opt_class(), "messageName");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "message", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {messageName: %@ object: %@}>"), v5, self, v6, self->_object);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
