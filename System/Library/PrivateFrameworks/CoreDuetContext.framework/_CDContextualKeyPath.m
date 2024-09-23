@implementation _CDContextualKeyPath

- (unint64_t)hash
{
  return -[NSString hash](self->_key, "hash") ^ -(uint64_t)self->_isUserCentric;
}

- (id)description
{
  const __CFString *v3;
  NSString *deviceID;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v9;

  if (self->_isUserCentric)
    v3 = CFSTR("/user");
  else
    v3 = CFSTR("/device");
  deviceID = self->_deviceID;
  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceID) = -[NSString isEqualToString:](deviceID, "isEqualToString:", v6);

  if ((deviceID & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v3, self->_key, v9);
  }
  else
  {
    v7 = (const __CFString *)self->_deviceID;
    if (!v7)
      v7 = CFSTR("ANY");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ (device %@)"), v3, self->_key, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  _CDContextualKeyPath *v4;
  _CDContextualKeyPath *v5;
  _CDContextualKeyPath *v6;
  char v7;
  NSString *key;
  void *v9;

  v4 = (_CDContextualKeyPath *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_isUserCentric)
      {
        if (-[_CDContextualKeyPath isUserCentric](v5, "isUserCentric"))
          goto LABEL_10;
        if (self->_isUserCentric)
        {
LABEL_7:
          v7 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }
      if (-[_CDContextualKeyPath isUserCentric](v6, "isUserCentric"))
        goto LABEL_7;
LABEL_10:
      key = self->_key;
      -[_CDContextualKeyPath key](v6, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqual:](key, "isEqual:", v9);

      goto LABEL_11;
    }
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isUserCentric
{
  return self->_isUserCentric;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (_CDContextualKeyPath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _CDContextualKeyPath *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("userCentric"))
      && (v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userCentric")),
          objc_msgSend(v4, "containsValueForKey:", CFSTR("ephemeral"))))
    {
      v8 = (_CDContextualKeyPath *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v5, v6, v7, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ephemeral")));
      -[_CDContextualKeyPath setSensitiveContents:](v8, "setSensitiveContents:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sensitiveContents")));
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKey:forDeviceID:isUserCentric:isEphemeral:", self->_key, self->_deviceID, self->_isUserCentric, self->_isEphemeral);
  objc_msgSend(v4, "setSensitiveContents:", self->_sensitiveContents);
  return v4;
}

- (_CDContextualKeyPath)initWithKey:(id)a3 forDeviceID:(id)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6
{
  id v11;
  id v12;
  _CDContextualKeyPath *v13;
  _CDContextualKeyPath *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_CDContextualKeyPath;
  v13 = -[_CDContextualKeyPath init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v14->_deviceID, a4);
    v14->_isUserCentric = a5;
    v14->_isEphemeral = a6;
  }

  return v14;
}

- (void)setSensitiveContents:(BOOL)a3
{
  self->_sensitiveContents = a3;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceID, CFSTR("deviceID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUserCentric, CFSTR("userCentric"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEphemeral, CFSTR("ephemeral"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sensitiveContents, CFSTR("sensitiveContents"));

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  NSString *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_key;
  else
    v4 = 0;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

- (BOOL)sensitiveContents
{
  return self->_sensitiveContents;
}

+ (_CDContextualKeyPath)keyPathWithKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v3, v6, 0, 0);

  return (_CDContextualKeyPath *)v7;
}

+ (id)ephemeralKeyPathWithKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v3, v6, 0, 1);

  return v7;
}

- (_CDContextualKeyPath)init
{

  return 0;
}

- (_CDContextualKeyPath)initWithKey:(id)a3 forDevice:(unint64_t)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6
{

  return 0;
}

+ (_CDContextualKeyPath)keyPathWithKey:(id)a3 isUserCentric:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v5, v8, v4, 0);

  return (_CDContextualKeyPath *)v9;
}

+ (id)remotekeyPathForKeyPath:(id)a3 forDevice:(unint64_t)a4
{
  return (id)objc_msgSend(a3, "copy");
}

+ (id)remoteKeyPathForKeyPath:(id)a3 forDeviceID:(id)a4
{
  id v5;
  id v6;
  _CDContextualKeyPath *v7;
  _CDContextualKeyPath *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isUserCentric"))
  {
    v7 = (_CDContextualKeyPath *)objc_msgSend(v5, "copy");
  }
  else
  {
    v8 = [_CDContextualKeyPath alloc];
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_CDContextualKeyPath initWithKey:forDeviceID:isUserCentric:isEphemeral:](v8, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v9, v6, objc_msgSend(v5, "isUserCentric"), objc_msgSend(v5, "isEphemeral"));

  }
  return v7;
}

- (BOOL)isMultiDeviceKeyPath
{
  if (isMultiDeviceKeyPath_initialized != -1)
    dispatch_once(&isMultiDeviceKeyPath_initialized, &__block_literal_global_10);
  return objc_msgSend((id)isMultiDeviceKeyPath_whitelist, "containsObject:", self);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIsUserCentric:(BOOL)a3
{
  self->_isUserCentric = a3;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_isEphemeral = a3;
}

@end
