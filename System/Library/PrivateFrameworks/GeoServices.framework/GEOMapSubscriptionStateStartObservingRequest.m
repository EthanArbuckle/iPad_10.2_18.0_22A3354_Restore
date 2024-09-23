@implementation GEOMapSubscriptionStateStartObservingRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOMapSubscriptionStateStartObservingRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.startObservingStateForSubscriptions"), a3, a4, a5);
}

- (GEOMapSubscriptionStateStartObservingRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionStateStartObservingRequest *v7;
  void *v8;
  size_t count;
  void *v10;
  size_t i;
  const char *string;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  size_t v17;
  void *v18;
  size_t j;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  GEOMapSubscriptionStateStartObservingRequest *v24;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapSubscriptionStateStartObservingRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v26, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_array(v6, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v13);

        }
      }
    }
    v14 = objc_msgSend(v10, "count");
    if (v14)
      v15 = (void *)objc_msgSend(v10, "copy");
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_identifiers, v15);
    if (v14)

    xpc_dictionary_get_array(v6, "pairedDeviceIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = xpc_array_get_count(v16);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      for (j = 0; j != v17; ++j)
      {
        v20 = xpc_array_get_string(v16, j);
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v21);

        }
      }
    }
    v22 = objc_msgSend(v18, "count");
    if (v22)
      v23 = (void *)objc_msgSend(v18, "copy");
    else
      v23 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_pairedDeviceIdentifiers, v23);
    if (v22)

    v7->_sendInitialUpdate = xpc_dictionary_get_BOOL(v6, "sendInitialUpdate");
    v24 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  xpc_object_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOMapSubscriptionStateStartObservingRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v28, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_identifiers, "count"))
  {
    v5 = xpc_array_create(0, 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = self->_identifiers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10)), "UTF8String");
          if (v11)
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v8);
    }

    if (xpc_array_get_count(v5))
      xpc_dictionary_set_value(v4, "identifiers", v5);

  }
  if (-[NSArray count](self->_pairedDeviceIdentifiers, "count"))
  {
    v12 = xpc_array_create(0, 0);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_pairedDeviceIdentifiers;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17));
          v19 = (const char *)objc_msgSend(v18, "UTF8String", (_QWORD)v20);
          if (v19)
            xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v19);
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v15);
    }

    if (xpc_array_get_count(v12))
      xpc_dictionary_set_value(v4, "pairedDeviceIdentifiers", v12);

  }
  xpc_dictionary_set_BOOL(v4, "sendInitialUpdate", self->_sendInitialUpdate);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSArray)pairedDeviceIdentifiers
{
  return self->_pairedDeviceIdentifiers;
}

- (void)setPairedDeviceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceIdentifiers, a3);
}

- (BOOL)sendInitialUpdate
{
  return self->_sendInitialUpdate;
}

- (void)setSendInitialUpdate:(BOOL)a3
{
  self->_sendInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
