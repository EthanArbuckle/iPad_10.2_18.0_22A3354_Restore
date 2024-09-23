@implementation CSFAudioRecordDeviceInfo

- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6
{
  return -[CSFAudioRecordDeviceInfo initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:](self, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:", a3, a4, a5, a6, 0);
}

- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6 remoteDeviceUIDString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CSFAudioRecordDeviceInfo *v16;
  uint64_t v17;
  NSString *route;
  uint64_t v19;
  NSUUID *remoteDeviceUID;
  uint64_t v21;
  NSString *remoteDeviceProductIdentifier;
  uint64_t v23;
  NSString *remoteDeviceUIDString;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CSFAudioRecordDeviceInfo;
  v16 = -[CSFAudioRecordDeviceInfo init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    route = v16->_route;
    v16->_route = (NSString *)v17;

    v16->_isRemoteDevice = a4;
    v19 = objc_msgSend(v13, "copy");
    remoteDeviceUID = v16->_remoteDeviceUID;
    v16->_remoteDeviceUID = (NSUUID *)v19;

    v21 = objc_msgSend(v14, "copy");
    remoteDeviceProductIdentifier = v16->_remoteDeviceProductIdentifier;
    v16->_remoteDeviceProductIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    remoteDeviceUIDString = v16->_remoteDeviceUIDString;
    v16->_remoteDeviceUIDString = (NSString *)v23;

  }
  return v16;
}

- (CSFAudioRecordDeviceInfo)initWithXPCObject:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CSFAudioRecordDeviceInfo *v11;

  v4 = a3;
  v5 = xpc_dictionary_get_BOOL(v4, (const char *)kXPCEncodeKeyIsRemoteDevice);
  xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRoute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRoute));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceUID));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);

  }
  xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceUIDString);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceUIDString));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[CSFAudioRecordDeviceInfo initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:](self, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:", v6, v5, v7, v9, v10);

  return v11;
}

- (id)xpcObject
{
  xpc_object_t v3;
  NSString *route;
  NSUUID *remoteDeviceUID;
  const char *v6;
  id v7;
  NSString *remoteDeviceProductIdentifier;
  NSString *remoteDeviceUIDString;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = (char *)kXPCEncodeKeyIsRemoteDevice;
  values = xpc_BOOL_create(self->_isRemoteDevice);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  route = self->_route;
  if (route)
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRoute, -[NSString UTF8String](route, "UTF8String"));
  remoteDeviceUID = self->_remoteDeviceUID;
  if (remoteDeviceUID)
  {
    v6 = (const char *)kXPCEncodeKeyRemoteDeviceUID;
    -[NSUUID UUIDString](remoteDeviceUID, "UUIDString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, v6, (const char *)objc_msgSend(v7, "UTF8String"));

  }
  remoteDeviceProductIdentifier = self->_remoteDeviceProductIdentifier;
  if (remoteDeviceProductIdentifier)
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier, -[NSString UTF8String](remoteDeviceProductIdentifier, "UTF8String"));
  remoteDeviceUIDString = self->_remoteDeviceUIDString;
  if (remoteDeviceUIDString)
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRemoteDeviceUIDString, -[NSString UTF8String](remoteDeviceUIDString, "UTF8String"));

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)CSFAudioRecordDeviceInfo;
  -[CSFAudioRecordDeviceInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {route = %@, isRemoteDevice = %d, remoteDeviceUID = %@, remoteDeviceProductIdentifier = %@, remoteDeviceUIDString = %@}"), v4, self->_route, self->_isRemoteDevice, self->_remoteDeviceUID, self->_remoteDeviceProductIdentifier, self->_remoteDeviceUIDString);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *route;
  void *v5;
  id v6;

  route = self->_route;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", route, CFSTR("route"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteDevice);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("isRemoteDevice"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteDeviceUID, CFSTR("remoteDeviceUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteDeviceProductIdentifier, CFSTR("remoteDeviceProductIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_remoteDeviceUIDString, CFSTR("remoteDeviceUIDString"));

}

- (CSFAudioRecordDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CSFAudioRecordDeviceInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRemoteDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceProductIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceUIDString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CSFAudioRecordDeviceInfo initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:](self, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:", v5, v7, v8, v9, v10);
  return v11;
}

- (CSFAudioRecordDeviceInfo)initWithAVVCRecordDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CSFAudioRecordDeviceInfo *v10;

  v4 = a3;
  objc_msgSend(v4, "recordRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isRemoteDevice");
  objc_msgSend(v4, "remoteDeviceUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProductIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDeviceUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CSFAudioRecordDeviceInfo initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:](self, "initWithRoute:isRemoteDevice:remoteDeviceUID:remoteDeviceProductIdentifier:remoteDeviceUIDString:", v5, v6, v7, v8, v9);
  return v10;
}

- (NSString)route
{
  return self->_route;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSUUID)remoteDeviceUID
{
  return self->_remoteDeviceUID;
}

- (NSString)remoteDeviceProductIdentifier
{
  return self->_remoteDeviceProductIdentifier;
}

- (NSString)remoteDeviceUIDString
{
  return self->_remoteDeviceUIDString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceUIDString, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProductIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteDeviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
