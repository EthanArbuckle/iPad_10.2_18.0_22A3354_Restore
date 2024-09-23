@implementation GEOPlaceByIdentifiersRequest

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)setResultProvider:(int)a3
{
  self->_resultProvider = a3;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (int)resultProvider
{
  return self->_resultProvider;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[GEOPlaceByIdentifiersRequest requestUUID](self, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOPlaceByIdentifiersRequest identifiers](self, "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOPlaceByIdentifiersRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceByIdentifiersRequest *v7;
  const uint8_t *uuid;
  uint64_t v9;
  NSUUID *requestUUID;
  const void *data;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *identifiers;
  GEOPlaceByIdentifiersRequest *v19;
  size_t length;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOPlaceByIdentifiersRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v22, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;

    }
    length = 0;
    data = xpc_dictionary_get_data(v6, "identifiers", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3710];
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v16, v12, a4);
      v17 = objc_claimAutoreleasedReturnValue();
      identifiers = v7->_identifiers;
      v7->_identifiers = (NSArray *)v17;

    }
    v7->_resultProvider = xpc_dictionary_get_int64(v6, "resultProvider");
    v7->_options = xpc_dictionary_get_int64(v6, "options");
    v19 = v7;
  }

  return v7;
}

- (GEOPlaceByIdentifiersRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("placedata.requestMUIDs"), a3, a4, a5);
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSUUID *requestUUID;
  id v6;
  objc_super v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceByIdentifiersRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(_QWORD *)uuid = 0;
    v9 = 0;
    -[NSUUID getUUIDBytes:](requestUUID, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  if (-[NSArray count](self->_identifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_identifiers, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "identifiers", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  xpc_dictionary_set_int64(v4, "resultProvider", self->_resultProvider);
  xpc_dictionary_set_int64(v4, "options", self->_options);

}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

@end
