@implementation DNDSSyncSettings

- (DNDSSyncSettings)initWithPairSyncEnabled:(BOOL)a3 cloudSyncEnabled:(BOOL)a4
{
  DNDSSyncSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSSyncSettings;
  result = -[DNDSSyncSettings init](&v7, sel_init);
  if (result)
  {
    result->_pairSyncEnabled = a3;
    result->_cloudSyncEnabled = a4;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[DNDSSyncSettings isPairSyncEnabled](self, "isPairSyncEnabled");
  v4 = -[DNDSSyncSettings isCloudSyncEnabled](self, "isCloudSyncEnabled");
  v5 = 2;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSSyncSettings *v4;
  DNDSSyncSettings *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (DNDSSyncSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDSSyncSettings isPairSyncEnabled](self, "isPairSyncEnabled");
      if (v6 == -[DNDSSyncSettings isPairSyncEnabled](v5, "isPairSyncEnabled"))
      {
        v8 = -[DNDSSyncSettings isCloudSyncEnabled](self, "isCloudSyncEnabled");
        v7 = v8 ^ -[DNDSSyncSettings isCloudSyncEnabled](v5, "isCloudSyncEnabled") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[DNDSSyncSettings isPairSyncEnabled](self, "isPairSyncEnabled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[DNDSSyncSettings isCloudSyncEnabled](self, "isCloudSyncEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; pairSyncEnabled: %@; cloudSyncEnabled: %@>"),
               v4,
               self,
               v5,
               v6);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSSyncSettings initWithPairSyncEnabled:cloudSyncEnabled:]([DNDSMutableSyncSettings alloc], "initWithPairSyncEnabled:cloudSyncEnabled:", -[DNDSSyncSettings isPairSyncEnabled](self, "isPairSyncEnabled"), -[DNDSSyncSettings isCloudSyncEnabled](self, "isCloudSyncEnabled"));
}

- (BOOL)isPairSyncEnabled
{
  return self->_pairSyncEnabled;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

@end
