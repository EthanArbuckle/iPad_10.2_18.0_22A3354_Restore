@implementation DSApp

+ (BOOL)skipTCCCheck:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DSLocationAlways")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DSLocationWhenInUse")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DSHealth")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DSLocalNetwork")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DSContacts"));
  }

  return v4;
}

+ (BOOL)appHasNoPermissions:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "permissionsGranted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "locationAuthorization") == 0;

  return v5;
}

+ (BOOL)app:(id)a3 hasPermissionAcceptingAnyLocationAuthorization:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationAlways")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationWhenInUse")))
  {
    v7 = objc_msgSend(v5, "hasLocationAccess");
  }
  else
  {
    objc_msgSend(v5, "permissionsGranted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v6);

  }
  return v7;
}

+ (BOOL)app:(id)a3 hasPermission:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  char v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationAlways")))
  {
    v7 = objc_msgSend(v5, "locationAuthorization") == 2;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("DSLocationWhenInUse")))
    {
      objc_msgSend(v5, "permissionsGranted");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "containsObject:", v6);

      goto LABEL_9;
    }
    v7 = objc_msgSend(v5, "locationAuthorization") == 1;
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  _BOOL4 v9;
  NSString *displayName;
  int64_t v12;

  v4 = a3;
  +[DSUtilities tccServices](DSUtilities, "tccServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[DSApp app:hasPermission:](DSApp, "app:hasPermission:", self, v8);
      if (v9 != +[DSApp app:hasPermission:](DSApp, "app:hasPermission:", v4, v8))
        break;

      v6 = v7;
      if (objc_msgSend(v5, "count") <= (unint64_t)v7++)
        goto LABEL_5;
    }
    if (+[DSApp app:hasPermission:](DSApp, "app:hasPermission:", self, v8))
      v12 = -1;
    else
      v12 = 1;
  }
  else
  {
LABEL_5:
    displayName = self->_displayName;
    objc_msgSend(v4, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString localizedStandardCompare:](displayName, "localizedStandardCompare:", v8);
  }

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString mutableCopyWithZone:](self->_displayName, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString mutableCopyWithZone:](self->_appID, "mutableCopyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSMutableSet mutableCopyWithZone:](self->_permissionsGranted, "mutableCopyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_locationAuthorization;
  return v5;
}

- (BOOL)hasLocationAccess
{
  return self->_locationAuthorization - 1 < 2;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableSet)permissionsGranted
{
  return self->_permissionsGranted;
}

- (void)setPermissionsGranted:(id)a3
{
  objc_storeStrong((id *)&self->_permissionsGranted, a3);
}

- (unint64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(unint64_t)a3
{
  self->_locationAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionsGranted, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
