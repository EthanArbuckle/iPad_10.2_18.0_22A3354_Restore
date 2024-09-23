@implementation NEAOVPNException

- (NEAOVPNException)initWithCoder:(id)a3
{
  id v4;
  NEAOVPNException *v5;
  uint64_t v6;
  NSString *serviceName;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *limitToProtocols;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NEAOVPNException;
  v5 = -[NEAOVPNException init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("LimitToProtocols"));
    v13 = objc_claimAutoreleasedReturnValue();
    limitToProtocols = v5->_limitToProtocols;
    v5->_limitToProtocols = (NSArray *)v13;

    v5->_action = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Action"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NEAOVPNException serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("ServiceName"));

  -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("BundleIdentifier"));

  -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("LimitToProtocols"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[NEAOVPNException action](self, "action"), CFSTR("Action"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEAOVPNException *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[NEAOVPNException init](+[NEAOVPNException allocWithZone:](NEAOVPNException, "allocWithZone:", a3), "init");
  -[NEAOVPNException serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException setServiceName:](v4, "setServiceName:", v5);

  -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

  -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException setLimitToProtocols:](v4, "setLimitToProtocols:", v7);

  -[NEAOVPNException setAction:](v4, "setAction:", -[NEAOVPNException action](self, "action"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  char v12;

  v4 = a3;
  -[NEAOVPNException serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_8;
  -[NEAOVPNException serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("AirPrint")))
    goto LABEL_7;
  -[NEAOVPNException serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("VoiceMail")))
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  -[NEAOVPNException serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CellularServices")))
  {

    goto LABEL_6;
  }
  -[NEAOVPNException serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DeviceCommunication"));

  if ((v12 & 1) == 0)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid service name for service exception"), v4);
    v9 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v9 = 1;
LABEL_9:
  if (-[NEAOVPNException action](self, "action") != 1 && -[NEAOVPNException action](self, "action") != 2)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid action for service exception"), v4);
    v9 = 0;
  }

  return v9;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEAOVPNException serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("service-name"), v5, a4);

  -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("bundle-identifier"), v5, a4);

  -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("limit-to-protocols"), v5, a4);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEAOVPNException action](self, "action"), CFSTR("action"), v5, a4);
  return v7;
}

- (BOOL)isLimitedToUDP
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NEAOVPNException limitToProtocols](self, "limitToProtocols", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", CFSTR("UDP")) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)limitToProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLimitToProtocols:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitToProtocols, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
