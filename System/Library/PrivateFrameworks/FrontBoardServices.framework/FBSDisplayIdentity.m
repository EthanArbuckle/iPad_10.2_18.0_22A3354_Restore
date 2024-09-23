@implementation FBSDisplayIdentity

- (FBSDisplayIdentity)rootIdentity
{
  if (self->_rootIdentity)
    self = self->_rootIdentity;
  return self;
}

- (BOOL)isExternal
{
  return self->_external;
}

- (BOOL)isCarDisplay
{
  return self->_type == 3;
}

- (BOOL)expectsSecureRendering
{
  return self->_secure;
}

- (BOOL)isMainDisplay
{
  return self->_type == 0;
}

- (BOOL)isMainRootDisplay
{
  _BOOL4 v3;

  v3 = -[FBSDisplayIdentity isRootIdentity](self, "isRootIdentity");
  if (v3)
    LOBYTE(v3) = -[FBSDisplayIdentity isMainDisplay](self, "isMainDisplay");
  return v3;
}

- (BOOL)isRootIdentity
{
  return self->_rootIdentity == 0;
}

- (unint64_t)hash
{
  int64_t type;
  unint64_t v4;
  NSString *uniqueIdentifier;

  type = self->_type;
  v4 = self->_secure + 67 * type;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v4 = -[NSString hash](uniqueIdentifier, "hash") + 67 * v4;
    type = self->_type;
  }
  if (type)
  {
    v4 = self->_connectionSeed + 67 * (self->_displayID + 67 * v4);
    if (type == 1)
      return self->_pid + 67 * v4;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentity, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  FBSDisplayIdentity *v4;
  BOOL v5;

  v4 = (FBSDisplayIdentity *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_type == v4->_type
      && self->_mainLike == v4->_mainLike
      && self->_displayID == v4->_displayID
      && self->_connectionSeed == v4->_connectionSeed
      && self->_pid == v4->_pid
      && self->_external == v4->_external
      && BSEqualObjects()
      && self->_secure == v4->_secure;
  }

  return v5;
}

- (FBSDisplayIdentity)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  int64_t value;
  FBSDisplayIdentity *v9;
  void *v10;
  void *v11;
  int64_t v12;
  _BOOL8 v13;
  uint64_t uint64;
  uint64_t v15;
  int64_t int64;
  uint64_t v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  FBSDisplayIdentity *v26;
  int64_t v27;
  void *v28;

  v4 = a3;
  if (v4)
  {
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("type"), "UTF8String"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = (objc_class *)MEMORY[0x1E0C81328];
    if (v5 && object_getClass(v5) == v7)
      value = xpc_int64_get_value(v6);
    else
      value = -1;
    xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("connectionType"), "UTF8String"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && object_getClass(v10) == v7)
      v12 = xpc_int64_get_value(v11);
    else
      v12 = -1;
    v27 = v12;
    v28 = v6;
    v25 = value;
    v26 = self;
    if (value)
    {
      v13 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("mainLike"), "UTF8String"));
      uint64 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("displayID"), "UTF8String"));
      v15 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("connectionSeed"), "UTF8String"));
      if (value == 1)
        int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("pid"), "UTF8String"));
      else
        int64 = 0;
      v17 = v13;
    }
    else
    {
      v15 = 0;
      int64 = 0;
      v17 = 1;
      uint64 = 1;
    }
    v18 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("external"), "UTF8String"));
    objc_msgSend(CFSTR("uniqueID"), "UTF8String");
    BSDeserializeStringFromXPCDictionaryWithKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("secure"), "UTF8String"));
    objc_msgSend(CFSTR("root"), "UTF8String");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = v20;
    LOBYTE(v23) = v18;
    v9 = (FBSDisplayIdentity *)-[FBSDisplayIdentity _initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:](v26, "_initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:", v25, v17, uint64, v27, v15, int64, v23, v19, v24, v21);

  }
  else
  {
    LOBYTE(v24) = 0;
    LOBYTE(v23) = 0;
    v9 = (FBSDisplayIdentity *)-[FBSDisplayIdentity _initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:](self, "_initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:", -1, 0, 0, -1, 0, 0, v23, 0, v24, 0);
  }

  return v9;
}

- (id)_initWithType:(int64_t)a3 UIKitMainLike:(BOOL)a4 displayID:(unsigned int)a5 connectionType:(int64_t)a6 connectionSeed:(unsigned int)a7 pid:(int)a8 external:(BOOL)a9 uniqueIdentifier:(id)a10 secure:(BOOL)a11 root:(id)a12
{
  id v18;
  id v19;
  uint64_t v20;
  FBSDisplayIdentity *v21;
  FBSDisplayIdentity *v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  NSString *uniqueIdentifier;
  void *v28;
  objc_super v31;

  v18 = a10;
  v19 = a12;
  v20 = objc_opt_class();
  if (v20 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FBSDisplay.m"), 41, CFSTR("this class cannot be subclassed"));

  }
  v31.receiver = self;
  v31.super_class = (Class)FBSDisplayIdentity;
  v21 = -[FBSDisplayIdentity init](&v31, sel_init);
  v22 = v21;
  if (v21)
  {
    v23 = 0;
    v21->_displayID = a5;
    v21->_type = a3;
    v21->_connectionType = a6;
    if (a3 && a3 != 7)
      v23 = a7;
    v21->_mainLike = a4;
    v24 = a8 & ~(a8 >> 31);
    if (a3 != 1)
      v24 = 0;
    v21->_connectionSeed = v23;
    v21->_pid = v24;
    v21->_external = a9;
    v25 = objc_msgSend(v18, "copy");
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v25;

    v22->_secure = a11;
    objc_storeStrong((id *)&v22->_rootIdentity, a12);
  }

  return v22;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t type;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  FBSDisplayTypeDescription(self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (!type)
  {
    if (self->_external)
    {
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("-External"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    type = self->_type;
    goto LABEL_11;
  }
  if (self->_mainLike)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".main"));
    v6 = objc_claimAutoreleasedReturnValue();

    type = self->_type;
    v4 = (void *)v6;
  }
  if (type == 1)
  {
    if (self->_pid >= 1)
    {
      objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("(%i)"), self->_pid);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;

      v4 = v8;
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  if (type)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("[%u-%u]"), self->_displayID, self->_connectionSeed);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  if (self->_secure)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("+Secure"));
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("+<%@>"), self->_uniqueIdentifier);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }
  return (NSString *)v4;
}

- (BOOL)isCarInstrumentsDisplay
{
  return self->_type == 6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    xpc_dictionary_set_int64(v4, (const char *)objc_msgSend(CFSTR("type"), "UTF8String"), self->_type);
    xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("connectionType"), "UTF8String"), self->_connectionType);
    if (self->_type)
    {
      if (self->_mainLike)
        xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("mainLike"), "UTF8String"), 1);
      xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("displayID"), "UTF8String"), self->_displayID);
      xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("connectionSeed"), "UTF8String"), self->_connectionSeed);
      if (self->_type == 1 && self->_pid >= 1)
        xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("pid"), "UTF8String"), self->_pid);
    }
    if (self->_external)
      xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("external"), "UTF8String"), 1);
    if (self->_uniqueIdentifier)
    {
      objc_msgSend(CFSTR("uniqueID"), "UTF8String");
      BSSerializeStringToXPCDictionaryWithKey();
    }
    if (self->_secure)
      xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("secure"), "UTF8String"), 1);
    v4 = xdict;
    if (self->_rootIdentity)
    {
      objc_msgSend(CFSTR("root"), "UTF8String");
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
      v4 = xdict;
    }
  }

}

- (FBSDisplayIdentity)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSDisplayIdentity *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSDisplayIdentity *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSDisplay.m");
    v17 = 1024;
    v18 = 27;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSDisplayIdentity *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unsigned)connectionSeed
{
  return self->_connectionSeed;
}

- (BOOL)isAirPlayDisplay
{
  return self->_type == 1;
}

- (BOOL)isRestrictedAirPlayDisplay
{
  return self->_type == 1 && self->_pid > 0;
}

- (BOOL)isiPodOnlyDisplay
{
  return self->_type == 4;
}

- (BOOL)isMusicOnlyDisplay
{
  return self->_type == 5;
}

- (BOOL)isContinuityDisplay
{
  return self->_type == 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  FBSDisplayIdentity *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  FBSDisplayIdentity *v19;

  v4 = a3;
  v19 = self;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  else
    v5 = -1;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("connectionType")))
  {
    v18 = -1;
    if (v5)
      goto LABEL_6;
LABEL_9:
    v8 = 0;
    v9 = 0;
    v6 = 1;
    v7 = 1;
    goto LABEL_13;
  }
  v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionType"));
  if (!v5)
    goto LABEL_9;
LABEL_6:
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mainLike"));
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("displayID"));
  if (v5 == 7)
  {
    v8 = 0;
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("connectionSeed"));
  if (v5 != 1)
    goto LABEL_12;
  v9 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
LABEL_13:
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("external"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secure"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("root"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = v12;
  LOBYTE(v16) = v10;
  v14 = -[FBSDisplayIdentity _initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:](v19, "_initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:", v5, v6, v7, v18, v8, v9, v16, v11, v17, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *uniqueIdentifier;
  void *v6;
  FBSDisplayIdentity *rootIdentity;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_connectionType, CFSTR("connectionType"));
  if (self->_type)
  {
    v4 = v8;
    if (self->_mainLike)
    {
      objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("mainLike"));
      v4 = v8;
    }
    objc_msgSend(v4, "encodeInt32:forKey:", self->_displayID, CFSTR("displayID"));
    objc_msgSend(v8, "encodeInt32:forKey:", self->_connectionSeed, CFSTR("connectionSeed"));
    if (self->_type == 1 && self->_pid >= 1)
      objc_msgSend(v8, "encodeInt32:forKey:");
  }
  if (self->_external)
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("external"));
  uniqueIdentifier = self->_uniqueIdentifier;
  v6 = v8;
  if (uniqueIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", uniqueIdentifier, CFSTR("uniqueID"));
    v6 = v8;
  }
  if (self->_secure)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("secure"));
    v6 = v8;
  }
  rootIdentity = self->_rootIdentity;
  if (rootIdentity)
  {
    objc_msgSend(v8, "encodeObject:forKey:", rootIdentity, CFSTR("root"));
    v6 = v8;
  }

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FBSDisplayIdentity description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isUIKitMainLike
{
  return self->_mainLike;
}

@end
