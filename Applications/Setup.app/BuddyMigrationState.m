@implementation BuddyMigrationState

- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4 persistDate:(id)a5
{
  id v7;
  BuddyMigrationState *v8;
  BuddyMigrationState *v9;
  objc_super v11;
  id obj;
  unint64_t v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  obj = 0;
  objc_storeStrong(&obj, a5);
  v7 = v15;
  v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyMigrationState;
  v8 = -[BuddyMigrationState init](&v11, "init");
  v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
  {
    objc_storeStrong((id *)v15 + 1, location[0]);
    *((_QWORD *)v15 + 2) = v13;
    objc_storeStrong((id *)v15 + 3, obj);
  }
  v9 = (BuddyMigrationState *)v15;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4
{
  id v5;
  BuddyMigrationState *v6;
  id location[2];
  id v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v9 = 0;
  v9 = objc_msgSend(v5, "initWithProductBuild:intent:persistDate:", location[0], a4, 0, a4);
  objc_storeStrong(&v9, v9);
  v6 = (BuddyMigrationState *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v6;
}

+ (id)loadFromPreferences:(id)a3
{
  uint64_t v3;
  uint64_t isKindOfClass;
  BuddyMigrationState *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id v10;
  os_log_t v12;
  uint8_t buf[7];
  char v14;
  os_log_t oslog;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[3];
  uint8_t v22[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = objc_msgSend(location[0], "objectForKey:includeCache:", CFSTR("showMigrationOnLaunch"), 0);
  v19 = 0;
  v3 = objc_opt_class(NSDictionary);
  isKindOfClass = objc_opt_isKindOfClass(v20, v3);
  if ((isKindOfClass & 1) != 0)
  {
    v18 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("productBuild"));
    v17 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("intent"));
    v16 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("persistDate"));
    v5 = -[BuddyMigrationState initWithProductBuild:intent:persistDate:]([BuddyMigrationState alloc], "initWithProductBuild:intent:persistDate:", v18, objc_msgSend(v17, "unsignedIntegerValue"), v16);
    v6 = v19;
    v19 = v5;

    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  if (!v19)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(isKindOfClass);
    v14 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v7 = oslog;
      v8 = v14;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Missing or corrupt data when restoring migration state!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v12 = (os_log_t)(id)_BYLoggingFacility(v9);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_100039500((uint64_t)v22, (uint64_t)v20);
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", v22, 0xCu);
    }
    objc_storeStrong((id *)&v12, 0);
  }
  v10 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  id v3;
  BOOL v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "objectForKey:", CFSTR("showMigrationOnLaunch"));
  v4 = v3 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  NSString *v3;
  NSString *v4;
  NSNumber *v5;
  id v6;
  id location[2];
  BuddyMigrationState *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = -[BuddyMigrationState productBuild](v8, "productBuild");

  if (v3)
  {
    v4 = -[BuddyMigrationState productBuild](v8, "productBuild");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("productBuild"));

  }
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BuddyMigrationState intent](v8, "intent"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("intent"));

  objc_msgSend(location[0], "setObject:forKey:persistImmediately:", v6, CFSTR("showMigrationOnLaunch"), 1);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (void)removeFromPreferences:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "removeObjectForKey:onlyFromMemory:", CFSTR("showMigrationOnLaunch"), 0);
  objc_storeStrong(location, 0);
}

- (id)description
{
  uint64_t v2;
  NSString *v3;
  NSString *v4;

  v2 = objc_opt_class(self);
  v3 = -[BuddyMigrationState productBuild](self, "productBuild");
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ : %p> Build: %@ Intent: %ld"), v2, self, v3, -[BuddyMigrationState intent](self, "intent"), a2);

  return v4;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductBuild:(id)a3
{
  objc_storeStrong((id *)&self->_productBuild, a3);
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (NSDate)persistDate
{
  return self->_persistDate;
}

- (void)setPersistDate:(id)a3
{
  objc_storeStrong((id *)&self->_persistDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistDate, 0);
  objc_storeStrong((id *)&self->_productBuild, 0);
}

@end
