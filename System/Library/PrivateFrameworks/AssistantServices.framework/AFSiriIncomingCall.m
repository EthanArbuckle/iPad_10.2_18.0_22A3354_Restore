@implementation AFSiriIncomingCall

- (AFSiriIncomingCall)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init with no parameters is not supported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  return -[AFSiriIncomingCall initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:](self, "initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:", a3, a4, a5, 0, a7, a8);
}

- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AFSiriIncomingCall *v20;
  uint64_t v21;
  NSString *callUUID;
  uint64_t v23;
  NSString *callProviderIdentifier;
  uint64_t v25;
  NSString *callProviderBundleID;
  uint64_t v27;
  NSArray *callerContactIdentifiers;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v30.receiver = self;
  v30.super_class = (Class)AFSiriIncomingCall;
  v20 = -[AFSiriIncomingCall init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    callUUID = v20->_callUUID;
    v20->_callUUID = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    callProviderIdentifier = v20->_callProviderIdentifier;
    v20->_callProviderIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    callProviderBundleID = v20->_callProviderBundleID;
    v20->_callProviderBundleID = (NSString *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v18, 1);
    callerContactIdentifiers = v20->_callerContactIdentifiers;
    v20->_callerContactIdentifiers = (NSArray *)v27;

    objc_storeStrong((id *)&v20->_handle, a7);
    v20->_isVideo = a8;
    v20->_isCallerIDBlocked = a9;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AFSiriIncomingCall callUUID](self, "callUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("callUUID"));

  -[AFSiriIncomingCall callProviderIdentifier](self, "callProviderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("callProviderIdentifier"));

  -[AFSiriIncomingCall callProviderBundleID](self, "callProviderBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("callProviderBundleID"));

  -[AFSiriIncomingCall callerContactIdentifiers](self, "callerContactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("callerContactIdentifiers"));

  -[AFSiriIncomingCall handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("handle"));

  objc_msgSend(v9, "encodeBool:forKey:", -[AFSiriIncomingCall isVideo](self, "isVideo"), CFSTR("isVideo"));
  objc_msgSend(v9, "encodeBool:forKey:", -[AFSiriIncomingCall isCallerIDBlocked](self, "isCallerIDBlocked"), CFSTR("isCallerIDBlocked"));

}

- (AFSiriIncomingCall)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id TUHandleClass;
  void *v13;
  uint64_t v14;
  AFSiriIncomingCall *v15;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callProviderIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callProviderBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("callerContactIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  TUHandleClass = getTUHandleClass();
  if (TUHandleClass)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", TUHandleClass, CFSTR("handle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVideo"));
  LOBYTE(v17) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCallerIDBlocked"));
  v15 = -[AFSiriIncomingCall initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:](self, "initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:", v5, v6, v7, v11, v13, v14, v17, v18[0]);

  return v15;
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (NSString)callProviderIdentifier
{
  return self->_callProviderIdentifier;
}

- (NSString)callProviderBundleID
{
  return self->_callProviderBundleID;
}

- (NSArray)callerContactIdentifiers
{
  return self->_callerContactIdentifiers;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isCallerIDBlocked
{
  return self->_isCallerIDBlocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_callerContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_callProviderBundleID, 0);
  objc_storeStrong((id *)&self->_callProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
