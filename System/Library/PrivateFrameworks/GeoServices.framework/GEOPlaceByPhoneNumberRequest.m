@implementation GEOPlaceByPhoneNumberRequest

- (unint64_t)reply
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSUUID *requestUUID;
  xpc_object_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  const char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  unsigned __int8 v19[128];
  unsigned __int8 uuid[8];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPlaceByPhoneNumberRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v18, sel_encodeToXPCDictionary_, v4);
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(_QWORD *)uuid = 0;
    v21 = 0;
    -[NSUUID getUUIDBytes:](requestUUID, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  if (-[NSArray count](self->_phoneNumbers, "count"))
  {
    v6 = xpc_array_create(0, 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_phoneNumbers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v13 = (const char *)objc_msgSend(v12, "UTF8String", (_QWORD)v14);
          if (v13)
            xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, v13);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

    if (xpc_array_get_count(v6))
      xpc_dictionary_set_value(v4, "phs", v6);

  }
  xpc_dictionary_set_BOOL(v4, "cell", self->_allowCellular);

}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOPlaceByPhoneNumberRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceByPhoneNumberRequest *v7;
  const uint8_t *uuid;
  uint64_t v9;
  NSUUID *requestUUID;
  void *v11;
  size_t count;
  void *v13;
  size_t i;
  const char *string;
  void *v16;
  uint64_t v17;
  void *v18;
  GEOPlaceByPhoneNumberRequest *v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPlaceByPhoneNumberRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v21, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;

    }
    xpc_dictionary_get_array(v6, "phs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v11, i);
        if (string)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v16);

        }
      }
    }
    v17 = objc_msgSend(v13, "count");
    if (v17)
      v18 = (void *)objc_msgSend(v13, "copy");
    else
      v18 = 0;
    objc_storeStrong((id *)&v7->_phoneNumbers, v18);
    if (v17)

    v7->_allowCellular = xpc_dictionary_get_BOOL(v6, "cell");
    v19 = v7;
  }

  return v7;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (void)setAllowCellular:(BOOL)a3
{
  self->_allowCellular = a3;
}

- (GEOPlaceByPhoneNumberRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("placedata.requestPhoneNumbers"), a3, a4, a5);
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[GEOPlaceByPhoneNumberRequest requestUUID](self, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOPlaceByPhoneNumberRequest phoneNumbers](self, "phoneNumbers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (BOOL)allowCellular
{
  return self->_allowCellular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
