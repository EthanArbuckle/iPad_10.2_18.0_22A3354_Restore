@implementation GEOMapSubscriptionsFetchRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionsFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.fetchSubscriptions"), a3, a4, a5);
}

- (GEOMapSubscriptionsFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionsFetchRequest *v7;
  void *v8;
  size_t count;
  void *v10;
  size_t i;
  const char *string;
  void *v13;
  uint64_t v14;
  void *v15;
  GEOMapSubscriptionsFetchRequest *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapSubscriptionsFetchRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_array(v6, "identifiersFilter");
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
      v15 = 0;
    objc_storeStrong((id *)&v7->_identifiersFilter, v15);
    if (v14)

    v7->_fetchExpired = xpc_dictionary_get_BOOL(v6, "fetchExpired");
    v16 = v7;
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
  id v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapSubscriptionsFetchRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v17, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_identifiersFilter, "count"))
  {
    v5 = xpc_array_create(0, 0);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_identifiersFilter;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v12 = (const char *)objc_msgSend(v11, "UTF8String", (_QWORD)v13);
          if (v12)
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

    if (xpc_array_get_count(v5))
      xpc_dictionary_set_value(v4, "identifiersFilter", v5);

  }
  xpc_dictionary_set_BOOL(v4, "fetchExpired", self->_fetchExpired);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSArray)identifiersFilter
{
  return self->_identifiersFilter;
}

- (void)setIdentifiersFilter:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersFilter, a3);
}

- (BOOL)fetchExpired
{
  return self->_fetchExpired;
}

- (void)setFetchExpired:(BOOL)a3
{
  self->_fetchExpired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersFilter, 0);
}

@end
