@implementation BLSBacklightChangeEvent

- (BLSBacklightChangeEvent)initWithEventID:(unint64_t)a3 state:(int64_t)a4 previousState:(int64_t)a5 changeRequest:(id)a6
{
  id v11;
  BLSBacklightChangeEvent *v12;
  BLSBacklightChangeEvent *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BLSBacklightChangeEvent;
  v12 = -[BLSBacklightChangeEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_eventID = a3;
    v12->_state = a4;
    v12->_previousState = a5;
    objc_storeStrong((id *)&v12->_changeRequest, a6);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_eventID, CFSTR("id"));
  NSStringFromBLSBacklightState(self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("state"));

  NSStringFromBLSBacklightState(self->_previousState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("previousState"));

  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_changeRequest, CFSTR("request"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BLSBacklightChangeEvent *v11;
  id v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__BLSBacklightChangeEvent_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__BLSBacklightChangeEvent_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v2 != v3)
  {
    v4 = *(void **)(a1 + 40);
    NSStringFromBLSBacklightState(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v5, 0);

    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  v6 = *(void **)(a1 + 40);
  NSStringFromBLSBacklightState(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("->"));

  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v12, "explanation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightChangeSourceEvent(objc_msgSend(v12, "sourceEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, v10);

  v11 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_eventID);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", HIDWORD(self->_eventID));
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_state);
  v7 = (id)objc_msgSend(v3, "appendInteger:", self->_previousState);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_changeRequest);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  BLSBacklightChangeEvent *v4;
  BLSBacklightChangeEvent *v5;
  unint64_t eventID;
  int64_t state;
  int64_t previousState;
  BLSBacklightChangeRequest *changeRequest;
  void *v10;
  char v11;

  v4 = (BLSBacklightChangeEvent *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      eventID = self->_eventID;
      if (eventID == -[BLSBacklightChangeEvent eventID](v5, "eventID")
        && (state = self->_state, state == -[BLSBacklightChangeEvent state](v5, "state"))
        && (previousState = self->_previousState,
            previousState == -[BLSBacklightChangeEvent previousState](v5, "previousState")))
      {
        changeRequest = self->_changeRequest;
        -[BLSBacklightChangeEvent changeRequest](v5, "changeRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[BLSBacklightChangeRequest isEqual:](changeRequest, "isEqual:", v10);

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

- (BLSBacklightChangeEvent)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int64_t int64;
  int64_t v10;
  int64_t v11;
  void *v12;
  BLSBacklightChangeRequest *v13;
  NSObject *v14;
  BLSBacklightChangeEvent *v15;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("id"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("state"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("previousState"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("request"), "UTF8String");
  int64 = xpc_dictionary_get_int64(v4, v5);
  v10 = xpc_dictionary_get_int64(v4, v6);
  v11 = xpc_dictionary_get_int64(v4, v7);
  xpc_dictionary_get_dictionary(v4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[BLSBacklightChangeRequest initWithXPCDictionary:]([BLSBacklightChangeRequest alloc], "initWithXPCDictionary:", v12);
  }
  else
  {
    bls_backlight_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BLSBacklightChangeEvent initWithXPCDictionary:].cold.1((uint64_t)v4, v14);

    v13 = 0;
  }
  v15 = -[BLSBacklightChangeEvent initWithEventID:state:previousState:changeRequest:](self, "initWithEventID:state:previousState:changeRequest:", int64, v10, v11, v13);

  return v15;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  xpc_object_t value;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("id"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("state"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("previousState"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("request"), "UTF8String");
  xpc_dictionary_set_int64(v4, v5, self->_eventID);
  xpc_dictionary_set_int64(v4, v6, self->_state);
  xpc_dictionary_set_int64(v4, v7, self->_previousState);
  value = xpc_dictionary_create(0, 0, 0);
  -[BLSBacklightChangeRequest encodeWithXPCDictionary:](self->_changeRequest, "encodeWithXPCDictionary:", value);
  xpc_dictionary_set_value(v4, v8, value);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BLSBacklightChangeEvent *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("id"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("previousState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BLSBacklightChangeEvent initWithEventID:state:previousState:changeRequest:](self, "initWithEventID:state:previousState:changeRequest:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t eventID;
  id v5;

  eventID = self->_eventID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", eventID, CFSTR("id"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_previousState, CFSTR("previousState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeRequest, CFSTR("request"));

}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (BLSBacklightChangeRequest)changeRequest
{
  return self->_changeRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequest, 0);
}

- (void)initWithXPCDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "change request missing from encoding: %@", (uint8_t *)&v2, 0xCu);
}

@end
