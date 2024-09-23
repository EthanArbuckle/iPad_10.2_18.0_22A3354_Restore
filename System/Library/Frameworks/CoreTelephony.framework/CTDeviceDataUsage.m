@implementation CTDeviceDataUsage

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CTDeviceDataUsage periods](self, "periods"))
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v4 + 1;
      v7 = -[CTDeviceDataUsage periods](self, "periods");
      -[CTDeviceDataUsage totalDataUsedForPeriod:](self, "totalDataUsedForPeriod:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(", period %lu of %lu total usage = %@"), v6, v7, v8);

      v4 = v5;
    }
    while (-[CTDeviceDataUsage periods](self, "periods") > v5++);
  }
  -[CTDeviceDataUsage apps](self, "apps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", apps = %lu"), objc_msgSend(v10, "count"));

  -[CTDeviceDataUsage uninstalledApps](self, "uninstalledApps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uninstalled apps = %lu"), objc_msgSend(v11, "count"));

  -[CTDeviceDataUsage proxiedOnlyApps](self, "proxiedOnlyApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", proxied only apps = %lu"), objc_msgSend(v12, "count"));

  -[CTDeviceDataUsage systemServices](self, "systemServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", system services = %lu"), objc_msgSend(v13, "count"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)dataUsage:(id)a3 forPeriod:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  CTAppDataUsage *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  if (-[CTDeviceDataUsage periods](self, "periods") <= a4)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = [CTAppDataUsage alloc];
          objc_msgSend(v13, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "used");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CTAppDataUsage init:withDisplayName:andUsage:](v14, "init:withDisplayName:andUsage:", v12, v15, v17);
          objc_msgSend(v26, "addObject:", v18);

          v19 = CTLogClient();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "displayName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "used");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v33 = v12;
            v34 = 2112;
            v35 = v20;
            v36 = 2112;
            v37 = v22;
            _os_log_debug_impl(&dword_18425C000, v19, OS_LOG_TYPE_DEBUG, "AppUsage bundle %@ with display name %@ used %@", buf, 0x20u);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v9);
    }

    v23 = (void *)objc_msgSend(v26, "copy");
    v6 = v25;
  }

  return v23;
}

- (id)appDataUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage dataUsage:forPeriod:](self, "dataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uninstalledAppDataUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage uninstalledApps](self, "uninstalledApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage dataUsage:forPeriod:](self, "dataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)proxiedOnlyAppDataUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage proxiedOnlyApps](self, "proxiedOnlyApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage dataUsage:forPeriod:](self, "dataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)systemServiceDataUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage systemServices](self, "systemServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage dataUsage:forPeriod:](self, "dataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalDataUsage:(id)a3 forPeriod:(unint64_t)a4
{
  id v6;
  CTDataUsed *v7;
  CTDataUsage *v8;
  CTDataUsage *v9;
  CTDataUsed *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CTDeviceDataUsage periods](self, "periods") <= a4)
  {
    v10 = 0;
  }
  else
  {
    v7 = [CTDataUsed alloc];
    v8 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
    v9 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
    v10 = -[CTDataUsed initWithUsage:proxied:](v7, "initWithUsage:proxied:", v8, v9);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "allValues", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "used");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTDataUsed addUsage:](v10, "addUsage:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  return v10;
}

- (id)totalDataUsedForPeriod:(unint64_t)a3
{
  CTDataUsed *v5;
  CTDataUsage *v6;
  CTDataUsage *v7;
  CTDataUsed *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  NSMutableDictionary *apps;
  __int128 v23;
  NSMutableDictionary *systemServices;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[CTDeviceDataUsage periods](self, "periods") <= a3)
  {
    v8 = 0;
  }
  else
  {
    v5 = [CTDataUsed alloc];
    v6 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
    v7 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
    v8 = -[CTDataUsed initWithUsage:proxied:](v5, "initWithUsage:proxied:", v6, v7);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    apps = self->_apps;
    v23 = *(_OWORD *)&self->_uninstalledApps;
    systemServices = self->_systemServices;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &apps, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          -[CTDeviceDataUsage totalDataUsage:forPeriod:](self, "totalDataUsage:forPeriod:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTDataUsed addUsage:](v8, "addUsage:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v11);
    }

    -[CTDeviceDataUsage wifiAssist](self, "wifiAssist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTDataUsed addNativeUsage:](v8, "addNativeUsage:", v16);

  }
  return v8;
}

- (id)totalAppDataUsedForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage totalDataUsage:forPeriod:](self, "totalDataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalUninstalledAppDataUsedForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage uninstalledApps](self, "uninstalledApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage totalDataUsage:forPeriod:](self, "totalDataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalProxiedOnlyAppDataUsedForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage proxiedOnlyApps](self, "proxiedOnlyApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage totalDataUsage:forPeriod:](self, "totalDataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalSystemServiceDataUsedForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CTDeviceDataUsage systemServices](self, "systemServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceDataUsage totalDataUsage:forPeriod:](self, "totalDataUsage:forPeriod:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalWifiAssistUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[CTDeviceDataUsage periods](self, "periods") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[CTDeviceDataUsage wifiAssist](self, "wifiAssist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = -[CTDeviceDataUsage periods](self, "periods");
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CTDeviceDataUsage apps](self, "apps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithDictionary:copyItems:", v6, 1);
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CTDeviceDataUsage uninstalledApps](self, "uninstalledApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "initWithDictionary:copyItems:", v10, 1);
  v12 = (void *)v4[3];
  v4[3] = v11;

  v13 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CTDeviceDataUsage proxiedOnlyApps](self, "proxiedOnlyApps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "initWithDictionary:copyItems:", v14, 1);
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CTDeviceDataUsage systemServices](self, "systemServices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "initWithDictionary:copyItems:", v18, 1);
  v20 = (void *)v4[5];
  v4[5] = v19;

  v21 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CTDeviceDataUsage wifiAssist](self, "wifiAssist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "initWithArray:copyItems:", v22, 1);
  v24 = (void *)v4[6];
  v4[6] = v23;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTDeviceDataUsage periods](self, "periods"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("periodsKey"));

  -[CTDeviceDataUsage apps](self, "apps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("appsKey"));

  -[CTDeviceDataUsage uninstalledApps](self, "uninstalledApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("uninstalledAppsKey"));

  -[CTDeviceDataUsage proxiedOnlyApps](self, "proxiedOnlyApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("proxiedOnlyAppsKey"));

  -[CTDeviceDataUsage systemServices](self, "systemServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("systemServicesKey"));

  -[CTDeviceDataUsage wifiAssist](self, "wifiAssist");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("wifiAssistKey"));

}

- (CTDeviceDataUsage)initWithCoder:(id)a3
{
  id v4;
  CTDeviceDataUsage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *apps;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *uninstalledApps;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *proxiedOnlyApps;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *systemServices;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *wifiAssist;
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CTDeviceDataUsage;
  v5 = -[CTDeviceDataUsage init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("periodsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_periods = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("appsKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("uninstalledAppsKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    uninstalledApps = v5->_uninstalledApps;
    v5->_uninstalledApps = (NSMutableDictionary *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("proxiedOnlyAppsKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    proxiedOnlyApps = v5->_proxiedOnlyApps;
    v5->_proxiedOnlyApps = (NSMutableDictionary *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("systemServicesKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    systemServices = v5->_systemServices;
    v5->_systemServices = (NSMutableDictionary *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("wifiAssistKey"));
    v30 = objc_claimAutoreleasedReturnValue();
    wifiAssist = v5->_wifiAssist;
    v5->_wifiAssist = (NSArray *)v30;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)periods
{
  return self->_periods;
}

- (void)setPeriods:(unint64_t)a3
{
  self->_periods = a3;
}

- (NSMutableDictionary)apps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)uninstalledApps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUninstalledApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)proxiedOnlyApps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProxiedOnlyApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)systemServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)wifiAssist
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWifiAssist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAssist, 0);
  objc_storeStrong((id *)&self->_systemServices, 0);
  objc_storeStrong((id *)&self->_proxiedOnlyApps, 0);
  objc_storeStrong((id *)&self->_uninstalledApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
