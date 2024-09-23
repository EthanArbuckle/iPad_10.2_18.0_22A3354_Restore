@implementation _CDContextualChangeRegistration

- (NSString)locationManagerEffectiveBundleID
{
  return self->_locationManagerEffectiveBundleID;
}

- (id)callback
{
  return objc_getProperty(self, a2, 40, 1);
}

- (_CDContextualPredicate)predicate
{
  return self->_predicate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)informativeCallback
{
  return objc_getProperty(self, a2, 88, 1);
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (void)encodeWithCoder:(id)a3
{
  _CDContextualPredicate *dismissalPolicy;
  NSString *clientIdentifier;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  dismissalPolicy = self->_dismissalPolicy;
  if (dismissalPolicy)
    objc_msgSend(v6, "encodeObject:forKey:", dismissalPolicy, CFSTR("dismissal"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_deviceSet, CFSTR("deviceSet"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_deviceTypes, CFSTR("deviceTypes"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v6, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  if (self->_mustWake)
    objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("mustWake"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_qualityOfService, CFSTR("qualityOfService"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationManagerEffectiveBundleID, CFSTR("locationManagerEffectiveBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationManagerEffectiveBundlePath, CFSTR("locationManagerEffectiveBundlePath"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isMultiDeviceRegistration
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)mustWake
{
  return self->_mustWake;
}

- (unint64_t)deviceSet
{
  return self->_deviceSet;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_informativeCallback, 0);
  objc_storeStrong((id *)&self->_locationManagerEffectiveBundlePath, 0);
  objc_storeStrong((id *)&self->_locationManagerEffectiveBundleID, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_dismissalPolicy, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  _CDContextualChangeRegistration *v4;
  NSString *identifier;
  void *v6;
  char v7;

  v4 = (_CDContextualChangeRegistration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[_CDContextualChangeRegistration identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (_CDContextualChangeRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _CDContextualChangeRegistration *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v18;
  char v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dismissal")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissal"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_14;
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceSet"));
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceTypes"));
    if (v11 <= 1)
    {
      v13 = v12;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "containsValueForKey:", CFSTR("mustWake"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("qualityOfService")))
        v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qualityOfService"));
      else
        v14 = 9;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationManagerEffectiveBundleID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationManagerEffectiveBundlePath"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v18) = v14;
      LOBYTE(v18) = v19;
      v9 = (_CDContextualChangeRegistration *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v5, v7, v10, v11, v13, v20, v18, 0);
      -[_CDContextualChangeRegistration setLocationManagerEffectiveBundleID:](v9, "setLocationManagerEffectiveBundleID:", v15);
      -[_CDContextualChangeRegistration setLocationManagerEffectiveBundlePath:](v9, "setLocationManagerEffectiveBundlePath:", v16);

      goto LABEL_17;
    }
LABEL_14:
    v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (void)setLocationManagerEffectiveBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLocationManagerEffectiveBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 qualityOfService:(unsigned int)a10 informativeCallback:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _CDContextualChangeRegistration *v21;
  _CDContextualChangeRegistration *v22;
  uint64_t v23;
  id informativeCallback;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a11;
  v28.receiver = self;
  v28.super_class = (Class)_CDContextualChangeRegistration;
  v21 = -[_CDContextualChangeRegistration init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_predicate, a4);
    objc_storeStrong((id *)&v22->_dismissalPolicy, a5);
    v22->_deviceSet = a6;
    v22->_deviceTypes = a7;
    objc_storeStrong((id *)&v22->_clientIdentifier, a8);
    v22->_mustWake = a9;
    v22->_qualityOfService = a10;
    v23 = MEMORY[0x193FEDDDC](v20);
    informativeCallback = v22->_informativeCallback;
    v22->_informativeCallback = (id)v23;

    v22->_isDeserialized = v20 != 0;
  }

  return v22;
}

- (_CDContextualChangeRegistration)init
{

  return 0;
}

- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 callback:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _CDContextualChangeRegistration *v20;
  _CDContextualChangeRegistration *v21;
  uint64_t v22;
  id callback;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_CDContextualChangeRegistration;
  v20 = -[_CDContextualChangeRegistration init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_predicate, a4);
    objc_storeStrong((id *)&v21->_dismissalPolicy, a5);
    v21->_deviceSet = a6;
    v21->_deviceTypes = a7;
    objc_storeStrong((id *)&v21->_clientIdentifier, a8);
    v21->_mustWake = a9;
    v21->_qualityOfService = 9;
    v22 = MEMORY[0x193FEDDDC](v19);
    callback = v21->_callback;
    v21->_callback = (id)v22;

    v21->_isDeserialized = v19 != 0;
  }

  return v21;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 callback:(id)a8
{
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;

  if (a6 == 1)
    v14 = 0xFFFFLL;
  else
    v14 = 0;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOBYTE(v21) = a7;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:callback:", v18, v17, v16, a6, v14, 0, v21, v15);

  return v19;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 callback:(id)a9
{
  uint64_t v10;

  LODWORD(v10) = 9;
  return (id)objc_msgSend(a1, "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:", a3, a4, a5, a6, a7, a8, v10, a9);
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 qualityOfService:(unsigned int)a9 callback:(id)a10
{
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;

  if (a6 == 1)
    v17 = 0xFFFFLL;
  else
    v17 = 0;
  v18 = a10;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  HIDWORD(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v22, v21, v20, a6, v17, v19, v25, v18);

  return v23;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 callback:(id)a8
{
  return (id)objc_msgSend(a1, "registrationWithIdentifier:contextualPredicate:deviceTypes:clientIdentifier:mustWake:qualityOfService:callback:", a3, a4, a5, a6, a7, 9, a8);
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8 callback:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      HIDWORD(v20) = a8;
      LOBYTE(v20) = a7;
      a5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v15, v16, 0, 1, a5, v17, v20, v18);
    }
    else
    {
      a5 = 0;
    }
  }

  return (id)a5;
}

+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  LOBYTE(v13) = 1;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:callback:", v10, v9, 0, 0, 0, 0, v13, v8);

  return v11;
}

+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  HIDWORD(v16) = 9;
  LOBYTE(v16) = 1;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v13, v12, 0, 0, 0, v11, v16, v10);

  return v14;
}

+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  LOBYTE(v13) = 0;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:callback:", v10, v9, 0, 0, 0, 0, v13, v8);

  return v11;
}

+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  HIDWORD(v16) = 9;
  LOBYTE(v16) = 0;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v13, v12, 0, 0, 0, v11, v16, v10);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id informativeCallback;
  void *v5;
  NSString *identifier;
  _CDContextualPredicate *predicate;
  _CDContextualPredicate *dismissalPolicy;
  unint64_t deviceSet;
  unint64_t deviceTypes;
  NSString *clientIdentifier;
  void *v12;
  void *v13;
  uint64_t v15;

  informativeCallback = self->_informativeCallback;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  identifier = self->_identifier;
  predicate = self->_predicate;
  dismissalPolicy = self->_dismissalPolicy;
  deviceSet = self->_deviceSet;
  deviceTypes = self->_deviceTypes;
  clientIdentifier = self->_clientIdentifier;
  if (informativeCallback)
  {
    HIDWORD(v15) = self->_qualityOfService;
    LOBYTE(v15) = self->_mustWake;
    v12 = (void *)objc_msgSend(v5, "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", identifier, predicate, dismissalPolicy, deviceSet, deviceTypes, clientIdentifier, v15, self->_informativeCallback);
  }
  else
  {
    LOBYTE(v15) = self->_mustWake;
    v12 = (void *)objc_msgSend(v5, "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:callback:", identifier, predicate, dismissalPolicy, deviceSet, deviceTypes, clientIdentifier, v15, self->_callback);
  }
  v13 = v12;
  objc_msgSend(v12, "setLocationManagerEffectiveBundleID:", self->_locationManagerEffectiveBundleID);
  objc_msgSend(v13, "setLocationManagerEffectiveBundlePath:", self->_locationManagerEffectiveBundlePath);
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  if (self->_deviceSet)
    v3 = CFSTR("ANY DEVICE");
  else
    v3 = CFSTR("LOCAL ONLY");
  v4 = v3;
  v5 = &stru_1E26D6BC0;
  if (self->_callback)
    v6 = CFSTR(" LEGACY");
  else
    v6 = &stru_1E26D6BC0;
  v7 = v6;
  if (self->_clientIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), self->_clientIdentifier);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_CDContextualChangeRegistration%@ %p [%@]%@ (%@ / %X): %@>"), v7, self, self->_identifier, v5, v4, self->_deviceTypes, self->_predicate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (_CDContextualPredicate)dismissalPolicy
{
  return self->_dismissalPolicy;
}

- (void)setDismissalPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalPolicy, a3);
}

- (void)setDeviceSet:(unint64_t)a3
{
  self->_deviceSet = a3;
}

- (unint64_t)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void)setMustWake:(BOOL)a3
{
  self->_mustWake = a3;
}

- (BOOL)isDeserialized
{
  return self->_isDeserialized;
}

- (void)setIsDeserialized:(BOOL)a3
{
  self->_isDeserialized = a3;
}

- (NSString)locationManagerEffectiveBundlePath
{
  return self->_locationManagerEffectiveBundlePath;
}

- (void)setInformativeCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

@end
