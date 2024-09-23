@implementation AKAvailability

- (AKAvailability)initWithPublishedStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AKAvailability *v7;

  v4 = a3;
  objc_msgSend(v4, "statusPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invitationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = -[AKAvailability initWithStatusPayload:invitationPayload:](self, "initWithStatusPayload:invitationPayload:", v5, v6);
    self = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)statusPublishRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAvailability _payloadDictionary](self, "_payloadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1090]), "initWithDictionary:", v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1098]), "initWithStatusPayload:", v3);

  return v4;
}

- (id)_payloadDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AKAvailability isAvailable](self, "isAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("a"));

  -[AKAvailability activityIdentifierString](self, "activityIdentifierString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("i"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (AKAvailability)initWithStatusPayload:(id)a3 invitationPayload:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  AKAvailabilityInvitation *v13;
  AKAvailabilityInvitation *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  const char *v20;
  _BOOL8 v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  AKAvailability *v30;
  AKAvailability *v32;
  NSObject *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "payloadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "availabilityKit_BOOLForKey:defaultValue:", CFSTR("a"), 1);
  objc_msgSend(v7, "availabilityKit_stringForKey:", CFSTR("i"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  +[AKAvailability logger](AKAvailability, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_215D0C000, v11, OS_LOG_TYPE_DEFAULT, "Availability payload has an activity identifier %@, looking at invitation to see if they may be available or unavailable to me for this activity", buf, 0xCu);
    }

    if (v6)
    {
      v13 = -[AKAvailabilityInvitation initWithStatusKitInvitationPayload:]([AKAvailabilityInvitation alloc], "initWithStatusKitInvitationPayload:", v6);
      v14 = v13;
      if (!v13)
      {
        +[AKAvailability logger](AKAvailability, "logger");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215D0C000, v22, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users invitation payload is not a well formed AKAvailabilityInvitation", buf, 2u);
        }
        v19 = v8;
        goto LABEL_37;
      }
      -[AKAvailabilityInvitation availableDuringActivityIdentifiers](v13, "availableDuringActivityIdentifiers");
      v15 = objc_claimAutoreleasedReturnValue();
      v33 = v15;
      if (-[NSObject count](v15, "count"))
      {
        v16 = -[NSObject containsObject:](v15, "containsObject:", v9);
        +[AKAvailability logger](AKAvailability, "logger");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            v36 = 2112;
            v37 = v15;
            _os_log_impl(&dword_215D0C000, v17, OS_LOG_TYPE_DEFAULT, "Overriding personalizedAvailability, users active activity identifier %@ is on my list of invited availableDuringActivityIdentifiers: %@", buf, 0x16u);
          }
          v19 = 1;
          goto LABEL_26;
        }
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          v35 = v9;
          v36 = 2112;
          v37 = v15;
          v23 = "Not overriding personalizedAvailability, users active activity identifier %@ is not on my list of invite"
                "d availableDuringActivityIdentifiers: %@";
          v24 = v17;
          v25 = 22;
          goto LABEL_24;
        }
      }
      else
      {
        +[AKAvailability logger](AKAvailability, "logger");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v23 = "Not overriding personalizedAvailability, users has not invited me to be available to them during any act"
                "ivity identifiers";
          v24 = v17;
          v25 = 2;
LABEL_24:
          _os_log_impl(&dword_215D0C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
        }
      }
      v19 = v8;
LABEL_26:

      -[AKAvailabilityInvitation unavailableDuringActivityIdentifiers](v14, "unavailableDuringActivityIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v32 = self;
        v27 = objc_msgSend(v26, "containsObject:", v9);
        +[AKAvailability logger](AKAvailability, "logger");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v29)
          {
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            v36 = 2112;
            v37 = v33;
            _os_log_impl(&dword_215D0C000, v28, OS_LOG_TYPE_DEFAULT, "Overriding personalizedAvailability, users active activity identifier %@ is on my list of invited unavailableDuringActivityIdentifiers: %@", buf, 0x16u);
          }
          v19 = 0;
        }
        else if (v29)
        {
          *(_DWORD *)buf = 138412546;
          v35 = v9;
          v36 = 2112;
          v37 = v33;
          _os_log_impl(&dword_215D0C000, v28, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users active activity identifier %@ is not on my list of invited unavailableDuringActivityIdentifiers: %@", buf, 0x16u);
        }
        self = v32;
      }
      else
      {
        +[AKAvailability logger](AKAvailability, "logger");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215D0C000, v28, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users has not invited me to be unavailable to them during any activity identifiers", buf, 2u);
        }
      }

      v22 = v33;
LABEL_37:

      v21 = v19 != 0;
      goto LABEL_38;
    }
    +[AKAvailability logger](AKAvailability, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "Not overriding personalizedAvailability, users has not provided an invitation payload";
      goto LABEL_15;
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    v20 = "Not overriding personalizedAvailability, users has not provided an activity identifier for their active activity";
LABEL_15:
    _os_log_impl(&dword_215D0C000, v11, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
  }

  v21 = v8;
LABEL_38:
  v30 = -[AKAvailability _initWithAvailable:activityIdentifierString:personalizedAvailability:](self, "_initWithAvailable:activityIdentifierString:personalizedAvailability:", v8, v9, v21);

  return v30;
}

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger__logger;
}

void __35__AKAvailability_StatusKit__logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "AKAvailability");
  v1 = (void *)logger__logger;
  logger__logger = (uint64_t)v0;

}

- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4
{
  id v7;
  AKAvailability *v8;
  AKAvailability *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAvailability;
  v8 = -[AKAvailability init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_available = a3;
    objc_storeStrong((id *)&v8->_activityIdentifierString, a4);
  }

  return v9;
}

- (id)_initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4 personalizedAvailability:(BOOL)a5
{
  id result;

  result = -[AKAvailability initWithAvailable:activityIdentifierString:](self, "initWithAvailable:activityIdentifierString:", a3, a4);
  if (result)
    *((_BYTE *)result + 9) = a5;
  return result;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (NSString)activityIdentifierString
{
  return self->_activityIdentifierString;
}

- (BOOL)personalizedAvailability
{
  return self->_personalizedAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifierString, 0);
}

- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifier:(id)a4
{
  _BOOL8 v4;
  void *v6;
  AKAvailability *v7;

  v4 = a3;
  objc_msgSend(a4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AKAvailability initWithAvailable:activityIdentifierString:](self, "initWithAvailable:activityIdentifierString:", v4, v6);

  return v7;
}

- (NSUUID)activityIdentifier
{
  void *v2;

  if (self->_activityIdentifierString)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", self->_activityIdentifierString);
  else
    v2 = 0;
  return (NSUUID *)v2;
}

@end
