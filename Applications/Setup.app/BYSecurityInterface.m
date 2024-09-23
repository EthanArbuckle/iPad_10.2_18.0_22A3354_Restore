@implementation BYSecurityInterface

+ (id)sharedInterface
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EECD0;
  location = 0;
  objc_storeStrong(&location, &stru_100284590);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EECC8;
}

- (int)keychainSyncStatus
{
  int Status;
  uint64_t v3;
  NSString *v4;
  char v6;
  NSString *v7;
  char v8;
  id v9;
  os_log_t oslog;
  id obj;
  int v12;
  id location[2];
  BYSecurityInterface *v14;
  int v15;
  uint8_t buf[24];

  v14 = self;
  location[1] = (id)a2;
  if (-[BYSecurityInterface simulating](self, "simulating"))
  {
    if (-[BYSecurityInterface simulateInCircle](v14, "simulateInCircle"))
      return 2;
    else
      return 1;
  }
  else
  {
    location[0] = 0;
    v12 = 0;
    obj = 0;
    Status = PSKeychainSyncGetStatus(&obj);
    objc_storeStrong(location, obj);
    v12 = Status;
    if (location[0])
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v3);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        v6 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v4 = (NSString *)location[0];
        }
        else if (location[0])
        {
          v9 = objc_msgSend(location[0], "domain");
          v8 = 1;
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v9, objc_msgSend(location[0], "code"));
          v7 = v4;
          v6 = 1;
        }
        else
        {
          v4 = 0;
        }
        sub_100039500((uint64_t)buf, (uint64_t)v4);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "PSKeychainSyncGetStatus error %{public}@", buf, 0xCu);
        if ((v6 & 1) != 0)

        if ((v8 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v15 = v12;
    objc_storeStrong(location, 0);
  }
  return v15;
}

- (BOOL)getKeychainSyncCircleExists:(BOOL *)a3 inCircle:(BOOL *)a4 error:(id *)a5
{
  if (!-[BYSecurityInterface simulating](self, "simulating"))
    return PSKeychainSyncGetCircleMembershipStatus(a3, a4, a5) & 1;
  if (a3)
    *a3 = -[BYSecurityInterface simulateCircleExists](self, "simulateCircleExists");
  if (a4)
    *a4 = -[BYSecurityInterface simulateInCircle](self, "simulateInCircle");
  return 1;
}

- (id)primaryAccountDSID
{
  id v2;
  id v3;
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  location[0] = objc_msgSend(v2, "aa_primaryAppleAccount");

  v5 = objc_msgSend(location[0], "aa_personID");
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)isHSA2EnabledForPrimaryAccount
{
  id v2;
  BOOL v3;

  v2 = objc_msgSend(sub_1001C531C(), "sharedInstance", a2, self);
  v3 = objc_msgSend(v2, "primaryAccountSecurityLevel") == (id)4;

  return v3;
}

- (BOOL)isICDPEnabledForPrimaryAccount
{
  id v2;
  id v3;
  id location;
  id v6[2];
  BYSecurityInterface *v7;
  char v8;

  v7 = self;
  v6[1] = (id)a2;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v6[0] = objc_msgSend(v2, "aa_primaryAppleAccount");

  v3 = objc_msgSend(v6[0], "accountProperties");
  location = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));

  if (location)
    v8 = -[BYSecurityInterface isICDPEnabledForDSID:](v7, "isICDPEnabledForDSID:", location);
  else
    v8 = 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v8 & 1;
}

- (BOOL)isICDPEnabledForDSID:(id)a3
{
  id location[2];
  BYSecurityInterface *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BYSecurityInterface simulating](v5, "simulating"))
    v6 = 0;
  else
    v6 = objc_msgSend(sub_1001C531C(), "isICDPEnabledForDSID:", location[0]) & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isManateeAvailable
{
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSString *v5;
  char v6;
  char v8;
  NSString *v9;
  char v10;
  id v11;
  os_log_t oslog;
  id obj;
  char v14;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  v14 = 0;
  v2 = objc_alloc_init((Class)sub_1001C5770());
  obj = 0;
  v3 = objc_msgSend(v2, "isManateeAvailable:", &obj);
  objc_storeStrong(location, obj);

  v14 = v3 & 1;
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v10 = 0;
      v8 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v11 = objc_msgSend(location[0], "domain");
        v10 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v11, objc_msgSend(location[0], "code"));
        v9 = v5;
        v8 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100038C28((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to fetch manatee availability %@", buf, 0xCu);
      if ((v8 & 1) != 0)

      if ((v10 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v6 = v14;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)simulating
{
  return self->_simulating;
}

- (void)setSimulating:(BOOL)a3
{
  self->_simulating = a3;
}

- (BOOL)simulateCircleExists
{
  return self->_simulateCircleExists;
}

- (void)setSimulateCircleExists:(BOOL)a3
{
  self->_simulateCircleExists = a3;
}

- (BOOL)simulateInCircle
{
  return self->_simulateInCircle;
}

- (void)setSimulateInCircle:(BOOL)a3
{
  self->_simulateInCircle = a3;
}

@end
