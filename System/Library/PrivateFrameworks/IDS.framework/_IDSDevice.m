@implementation _IDSDevice

- (_IDSDevice)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  _IDSDevice *v10;
  _IDSDevice *v11;
  _IDSDevice *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  id v22;
  void *v23;
  uint64_t v24;
  IDSEndpointCapabilities *capabilities;
  void *v26;
  uint64_t v27;
  NSDictionary *info;
  void *v30;
  id v31;
  id v32;
  objc_super v33;

  v5 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F955C();

  }
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSDevice](IDSLogging, "IDSDevice");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907E8578((uint64_t)self, v9);

    v10 = 0;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)_IDSDevice;
    v11 = -[_IDSDevice init](&v33, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_info, a3);
      -[_IDSDevice uniqueIDOverride](v12, "uniqueIDOverride");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "length"))
      {
        -[_IDSDevice uniqueID](v12, "uniqueID");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x1E0D346E8], v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_retainAutorelease(v15);
        objc_msgSend(v17, "UTF8String");
        if (qword_1ECDD6620 != -1)
          dispatch_once(&qword_1ECDD6620, &unk_1E2C5FD10);
        v30 = v16;
        v31 = v13;
        v32 = v17;
        v18 = v16;
        im_notify_register_dispatch();

      }
      v12->_nearby = 0;
      v12->_connected = 0;
      v12->_immutableCloudConnected = 0;
      v12->_cloudConnected = 0;
      v19 = *MEMORY[0x1E0D34640];
      -[NSDictionary objectForKey:](v12->_info, "objectForKey:", *MEMORY[0x1E0D34640]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v22 = objc_alloc(MEMORY[0x1E0D34D28]);
      if ((isKindOfClass & 1) != 0)
        v23 = v20;
      else
        v23 = (void *)MEMORY[0x1E0C9AA70];
      v24 = objc_msgSend(v22, "initWithCapabilitiesMap:", v23);
      capabilities = v12->_capabilities;
      v12->_capabilities = (IDSEndpointCapabilities *)v24;

      v26 = (void *)-[NSDictionary mutableCopy](v12->_info, "mutableCopy");
      objc_msgSend(v26, "removeObjectForKey:", v19);
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v26);
      info = v12->_info;
      v12->_info = (NSDictionary *)v27;

    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_nearbyToken);
  v3.receiver = self;
  v3.super_class = (Class)_IDSDevice;
  -[_IDSDevice dealloc](&v3, sel_dealloc);
}

- (NSString)uniqueID
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F95E8();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_stringForKey:", *MEMORY[0x1E0D34AD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)uniqueIDOverride
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9674();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34660]);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)productBuildVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9700();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)productName
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F978C();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)productVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9818();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)modelIdentifier
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F98A4();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34658]);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9930();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346A8]);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)service
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F99BC();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346D0]);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)fullDescription
{
  void *v3;
  int v4;
  NSObject *v5;
  objc_class *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9A48();

  }
  v35 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice name](self, "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice modelIdentifier](self, "modelIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice uniqueID](self, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice uniqueIDOverride](self, "uniqueIDOverride");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice pushToken](self, "pushToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice service](self, "service");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice identities](self, "identities");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice linkedUserURIs](self, "linkedUserURIs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice nsuuid](self, "nsuuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[_IDSDevice relationship](self, "relationship");
  if (-[_IDSDevice supportsSMSRelay](self, "supportsSMSRelay"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v25 = v7;
  if (-[_IDSDevice supportsMMSRelay](self, "supportsMMSRelay"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v24 = v8;
  if (-[_IDSDevice supportsPhoneCalls](self, "supportsPhoneCalls"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v23 = v9;
  -[_IDSDevice deviceColor](self, "deviceColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice enclosureColor](self, "enclosureColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_IDSDevice locallyPresent](self, "locallyPresent"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v21 = v11;
  if (-[_IDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v20 = v12;
  if (-[_IDSDevice isNearby](self, "isNearby"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[_IDSDevice isConnected](self, "isConnected"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[_IDSDevice isCloudConnected](self, "isCloudConnected"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[_IDSDevice isActive](self, "isActive"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (-[_IDSDevice isLocallyPaired](self, "isLocallyPaired"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  -[_IDSDevice productBuildVersion](self, "productBuildVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("[%@ %p:   Name: %@   Model: %@   UniqueID: %@   UniqueID Override: %@   Push Token: %@   Service: %@   Handles: %@   linkedUserURIs: %@   nsuuid: %@   relationship: %lu   supportsSMSRelay: %@   supportsMMSRelay: %@   supportsPhoneCalls: %@   deviceColor: %@   enclosureColor: %@  local: %@   defaultPairedDevice: %@   isNearby: %@  isConnected: %@  isCloudConnected: %@  isActive: %@  isLocallyPaired: %@  build: %@   pairing protocol: %lu   min compatibility version: %lu   max compatibility version: %lu]"), v34, self, v39, v38, v33, v31, v30, v29, v28, v37, v27, v26, v25, v24, v23, v22,
    v10,
    v21,
    v20,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    -[_IDSDevice pairingProtocolVersion](self, "pairingProtocolVersion"),
    -[_IDSDevice minCompatibilityVersion](self, "minCompatibilityVersion"),
    -[_IDSDevice maxCompatibilityVersion](self, "maxCompatibilityVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)description
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  objc_class *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  int64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  __CFString *v39;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9AD4();

  }
  v6 = -[_IDSDevice isLocallyPaired](self, "isLocallyPaired");
  v34 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[_IDSDevice name](self, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice modelIdentifier](self, "modelIdentifier");
  v37 = v6;
  v38 = (void *)v8;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v39 = CFSTR("all 0s");
    v28 = CFSTR("YES");
  }
  else
  {
    -[_IDSDevice uniqueID](self, "uniqueID");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("NO");
  }
  -[_IDSDevice uniqueIDOverride](self, "uniqueIDOverride");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice pushToken](self, "pushToken");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice service](self, "service");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice nsuuid](self, "nsuuid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_IDSDevice relationship](self, "relationship");
  if (-[_IDSDevice supportsSMSRelay](self, "supportsSMSRelay"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v26 = v9;
  if (-[_IDSDevice supportsMMSRelay](self, "supportsMMSRelay"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v25 = v10;
  if (-[_IDSDevice supportsPhoneCalls](self, "supportsPhoneCalls"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v24 = v11;
  -[_IDSDevice deviceColor](self, "deviceColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice enclosureColor](self, "enclosureColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_IDSDevice locallyPresent](self, "locallyPresent"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v22 = v13;
  if (-[_IDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[_IDSDevice isNearby](self, "isNearby"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[_IDSDevice isConnected](self, "isConnected"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (-[_IDSDevice isActive](self, "isActive"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (-[_IDSDevice isHSATrusted](self, "isHSATrusted"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  -[_IDSDevice productBuildVersion](self, "productBuildVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("[%@ %p:   Name: %@    Model: %@   UniqueID: %@   UniqueID Override: %@   Push Token: %@   Service: %@   nsuuid: %@   relationship: %lu    supportsSMSRelay: %@   supportsMMSRelay: %@   supportsPhoneCalls: %@   deviceColor: %@   enclosureColor: %@  local: %@   defaultPairedDevice: %@   isNearby: %@  isConnected: %@  isActive: %@  isLocallyPaired: %@  isHSATrusted: %@  build: %@   pairing protocol: %lu   min compatibility version: %lu   max compatibility version: %lu]"), v38, self, v36, v35, v39, v32, v31, v30, v29, v27, v26, v25, v24, v12, v23, v22,
    v14,
    v15,
    v16,
    v17,
    v28,
    v18,
    v19,
    -[_IDSDevice pairingProtocolVersion](self, "pairingProtocolVersion"),
    -[_IDSDevice minCompatibilityVersion](self, "minCompatibilityVersion"),
    -[_IDSDevice maxCompatibilityVersion](self, "maxCompatibilityVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  return v20;
}

- (id)compactDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_IDSDevice uniqueIDOverride](self, "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDevice pushToken](self, "pushToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("NO");
  if (-[_IDSDevice isNearby](self, "isNearby"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[_IDSDevice isConnected](self, "isConnected"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[_IDSDevice isActive](self, "isActive"))
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%p uid: %@, tok: %@, near: %@, conn: %@, active: %@, rel: %lu]"), self, v4, v5, v7, v8, v6, -[_IDSDevice relationship](self, "relationship"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isNearby
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9B60();

  }
  return self->_nearby;
}

- (BOOL)isConnected
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9BEC();

  }
  return self->_connected;
}

- (BOOL)isCloudConnected
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9C78();

  }
  return self->_immutableCloudConnected;
}

- (BOOL)locallyPresent
{
  void *v2;
  int v3;
  NSObject *v4;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assertQueueIsCurrent");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1907F9D04();

  }
  return 1;
}

- (BOOL)isDefaultPairedDevice
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9D90();

  }
  return -[_IDSDevice isActive](self, "isActive");
}

- (BOOL)isLocallyPaired
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9E1C();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34648]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isActive
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9EA8();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34678]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (int64_t)relationship
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int64_t v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9F34();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "integerValue") == 1)
    v7 = 2;
  else
    v7 = 1;

  return v7;
}

- (NSDate)lastActivityDate
{
  return 0;
}

- (unint64_t)pairingProtocolVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F9FC0();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (unint64_t)minCompatibilityVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA04C();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34698]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (unint64_t)maxCompatibilityVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA0D8();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34690]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (unint64_t)serviceMinCompatibilityVersion
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA164();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (NSArray)linkedUserURIs
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA1F0();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34688]);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setNSUUID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  _IDSDevice *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FA27C();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Client request to set uuid %@ on device %@", (uint8_t *)&v13, 0x16u);
  }

  if (-[_IDSDevice supportsiCloudPairing](self, "supportsiCloudPairing"))
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSDevice uniqueID](self, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSDevice service](self, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setNSUUID:onDeviceWithUniqueID:forService:](v9, "setNSUUID:onDeviceWithUniqueID:forService:", v10, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "  => Device doesn't support it, ignoring", (uint8_t *)&v13, 2u);
    }
  }

}

- (NSUUID)nsuuid
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA308();

  }
  if (-[_IDSDevice supportsHandoff](self, "supportsHandoff")
    && (v6 = *MEMORY[0x1E0D346A0],
        -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346A0]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[NSDictionary objectForKey:](self->_info, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  }
  else
  {
    v10 = 0;
  }
  return (NSUUID *)v10;
}

- (NSUUID)stableBluetoothIdentifier
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA394();

  }
  v6 = *MEMORY[0x1E0D346D8];
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346D8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[NSDictionary objectForKey:](self->_info, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  }
  else
  {
    v10 = 0;
  }
  return (NSUUID *)v10;
}

- (BOOL)supportsiCloudPairing
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA420();

  }
  if (-[_IDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"))
    return 0;
  if (-[_IDSDevice supportsTethering](self, "supportsTethering"))
    return 1;
  return -[_IDSDevice supportsHandoff](self, "supportsHandoff");
}

- (BOOL)supportsTethering
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA4AC();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)supportsHandoff
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA538();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)supportsApplePay
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA5C4();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)supportsSMSRelay
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA650();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)supportsMMSRelay
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA6DC();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)supportsPhoneCalls
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA768();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34AB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (int64_t)deviceType
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int64_t v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA7F4();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[_IDSDevice productName](self, "productName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = IDSDeviceTypeFromProductName();

  }
  return v9;
}

- (NSString)deviceColor
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA880();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)enclosureColor
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA90C();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34A80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isHSATrusted
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FA998();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34680]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (NSData)pushToken
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FAA24();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D346C8]);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)identities
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FAAB0();

  }
  -[NSDictionary objectForKey:](self->_info, "objectForKey:", *MEMORY[0x1E0D34668]);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_addIdentity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  NSDictionary **p_info;
  NSDictionary *info;
  NSDictionary *v19;
  NSDictionary *v20;
  NSDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FAB3C();

  }
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("uri"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_IDSDevice identities](self, "identities", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "objectForKey:", CFSTR("uri"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToIgnoringCase:", v8);

        if ((v15 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v11)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      -[_IDSDevice identities](self, "identities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v16, "mutableCopy");

      if (v9)
      {
        objc_msgSend(v9, "addObject:", v4);
        info = self->_info;
        p_info = &self->_info;
        v19 = (NSDictionary *)-[NSDictionary mutableCopy](info, "mutableCopy");
        -[NSDictionary setObject:forKey:](v19, "setObject:forKey:", v9, *MEMORY[0x1E0D34668]);
      }
      else
      {
        v20 = self->_info;
        p_info = &self->_info;
        v19 = (NSDictionary *)-[NSDictionary mutableCopy](v20, "mutableCopy");
        -[NSDictionary removeObjectForKey:](v19, "removeObjectForKey:", *MEMORY[0x1E0D34668]);
      }
      v21 = *p_info;
      *p_info = v19;

    }
  }

}

- (BOOL)isTinker
{
  return ((unint64_t)-[_IDSDevice relationship](self, "relationship") >> 1) & 1;
}

- (void)_nearbyStateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[_IDSDevice isTinker](self, "isTinker"))
  {
    -[CUTWeakReference object](self->_account, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSDevice service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Nearby triggering nearbyDevicesChanged on account %p %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(v3, "_internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callNearbyDevicesChanged");

  }
}

- (void)_connectedStateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[_IDSDevice isTinker](self, "isTinker"))
  {
    -[CUTWeakReference object](self->_account, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSDevice service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Connected triggering connectedDevicesChanged on account %p %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(v3, "_internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callConnectedDevicesChanged");

  }
}

- (void)_cloudConnectedStateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[_IDSDevice isTinker](self, "isTinker"))
  {
    -[CUTWeakReference object](self->_account, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSDevice service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Cloud connected triggering cloudConnectedDevicesChanged on service %p %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(v3, "_internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callCloudConnectedDevicesChanged");

  }
}

- (void)_stateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[_IDSDevice isTinker](self, "isTinker"))
  {
    -[CUTWeakReference object](self->_serviceReference, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSDevice service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSDevice compactDescription](self, "compactDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = v3;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "State change triggering linkedDevicesChanged on service %p %@ for device: %@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(v3, "_internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_callLinkedDevicesChanged");

  }
}

- (void)_setAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  CUTWeakReference *v8;
  CUTWeakReference *account;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FABC8();

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v4);
    v8 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    self->_account = v8;

  }
}

- (void)_setService:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  CUTWeakReference *v8;
  CUTWeakReference *serviceReference;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FAC54();

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v4);
    v8 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    serviceReference = self->_serviceReference;
    self->_serviceReference = v8;

  }
}

- (IDSEndpointCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_serviceReference, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
