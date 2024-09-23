@implementation MROutputDeviceConfiguration

- (MROutputDeviceConfiguration)initWithSessionID:(id)a3 presentingAppBundleID:(id)a4 surface:(unint64_t)a5
{
  id v9;
  id v10;
  MROutputDeviceConfiguration *v11;
  MROutputDeviceConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MROutputDeviceConfiguration;
  v11 = -[MROutputDeviceConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionID, a3);
    objc_storeStrong((id *)&v12->_presentingAppBundleID, a4);
    v12->_surface = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ | %@ | %@ | %lu"), v5, self->_sessionID, self->_presentingAppBundleID, self->_surface);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MROutputDeviceConfiguration *v4;
  MROutputDeviceConfiguration *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  char v12;
  char v13;

  v4 = (MROutputDeviceConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MROutputDeviceConfiguration sessionID](v5, "sessionID");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_sessionID)
        v8 = 1;
      else
        v8 = -[NSString isEqual:](v6, "isEqual:");

      -[MROutputDeviceConfiguration presentingAppBundleID](v5, "presentingAppBundleID");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_presentingAppBundleID)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v10, "isEqual:");
      v13 = v8 & v12;

      if (-[MROutputDeviceConfiguration surface](v5, "surface") == self->_surface)
        v9 = v13;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionID;
  id v5;

  sessionID = self->_sessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentingAppBundleID, CFSTR("presentingAppBundleID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_surface, CFSTR("surface"));

}

- (MROutputDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  MROutputDeviceConfiguration *v5;
  uint64_t v6;
  NSString *sessionID;
  uint64_t v8;
  NSString *presentingAppBundleID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MROutputDeviceConfiguration;
  v5 = -[MROutputDeviceConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingAppBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    presentingAppBundleID = v5->_presentingAppBundleID;
    v5->_presentingAppBundleID = (NSString *)v8;

    v5->_surface = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("surface"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MROutputDeviceConfiguration initWithSessionID:presentingAppBundleID:surface:]([MROutputDeviceConfiguration alloc], "initWithSessionID:presentingAppBundleID:surface:", self->_sessionID, self->_presentingAppBundleID, self->_surface);
}

- (unint64_t)surface
{
  return self->_surface;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
