@implementation _DKBatteryMonitor

- (void)_handleBatteryNotification
{
  void *v3;
  id v4;

  v4 = (id)os_transaction_create();
  v3 = (void *)MEMORY[0x219A29278]();
  -[_DKBatteryMonitor _queue_handleNotification](self, "_queue_handleNotification");
  objc_autoreleasePoolPop(v3);

}

- (void)batteryStateChangeHandler
{
  double v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  BMSource *source;
  void *v9;
  id v10;

  -[_DKBatteryMonitor getBatteryProperties](self, "getBatteryProperties");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKBatteryMonitor batteryPercentageFromPowerSourceDictionary:](self, "batteryPercentageFromPowerSourceDictionary:");
  v4 = v3;
  if (v3 != -1.0)
  {
    v5 = -[_DKBatteryMonitor fullyChargedFromPowerSourceDictionary:](self, "fullyChargedFromPowerSourceDictionary:", v10);
    -[_DKBatteryMonitor updateBatteryStateDictionary:currentBatteryPercentage:](self, "updateBatteryStateDictionary:currentBatteryPercentage:", v10, v4);
    if (vabdd_f64(self->_previousPercentage, v4) >= 1.0 || self->_previouslyFullyCharged != v5)
    {
      v6 = (void *)objc_opt_class();
      objc_msgSend(v6, "setCurrentBatteryPercentage:", v4);
      objc_msgSend(v6, "_eventWithBatteryPercentage:isFullyCharged:", v5, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v7, 1);

      source = self->_source;
      objc_msgSend((id)objc_opt_class(), "_BMEventWithBatteryPercentage:isFullyCharged:", v5, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMSource sendEvent:](source, "sendEvent:", v9);

      self->_previousPercentage = v4;
      self->_previouslyFullyCharged = v5;
      -[_DKBatteryMonitor postImminentShutdownNotification:](self, "postImminentShutdownNotification:", v4);
    }
  }

}

- (id)getBatteryProperties
{
  io_registry_entry_t powerService;
  kern_return_t v3;
  int v4;
  NSObject *v5;
  void *v6;
  CFMutableDictionaryRef properties;

  powerService = self->_powerService;
  if (!powerService)
    return MEMORY[0x24BDBD1B8];
  properties = 0;
  v3 = IORegistryEntryCreateCFProperties(powerService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DKBatteryMonitor getBatteryProperties].cold.1(v4, v5);
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    v5 = properties;
    v6 = (void *)-[__CFDictionary copy](properties, "copy");
  }

  return v6;
}

- (BOOL)fullyChargedFromPowerSourceDictionary:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FullyCharged"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)fullyCharged:(id)a3 differsFrom:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "BOOLValue");
  v6 = objc_msgSend(v5, "BOOLValue");

  return a3 ^ v6;
}

- (BOOL)newBatteryState:(id)a3 differsSignificantlyFromState:(id)a4 currentBatteryPercentage:(double)a5 previousBatteryPercentage:(double)a6
{
  unint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = (void *)v11;
  if (v10 | v11)
  {
    v13 = 1;
    if (v10 && v11)
    {
      v48 = -[_DKBatteryMonitor percentage:differsFrom:](self, "percentage:differsFrom:", a5, a6);
      objc_msgSend(MEMORY[0x24BE1B180], "batteryTemperatureKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryTemperatureKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[_DKBatteryMonitor temperature:differsFrom:](self, "temperature:differsFrom:", v15, v17);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryVoltageKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryVoltageKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[_DKBatteryMonitor voltage:differsFrom:](self, "voltage:differsFrom:", v19, v21);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryFullyChargedKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryFullyChargedKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_DKBatteryMonitor fullyCharged:differsFrom:](self, "fullyCharged:differsFrom:", v23, v25);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryIsChargingKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryIsChargingKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[_DKBatteryMonitor isCharging:differsFrom:](self, "isCharging:differsFrom:", v27, v29);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = -[_DKBatteryMonitor externalConnected:differsFrom:](self, "externalConnected:differsFrom:", v31, v33);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = -[_DKBatteryMonitor externalConnected:differsFrom:](self, "externalConnected:differsFrom:", v35, v37);

      objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterTypeKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterTypeKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[_DKBatteryMonitor adapterType:differsFrom:](self, "adapterType:differsFrom:", v39, v41);

      v13 = (v48 || v47 || v46 || v45) | v44 | v27 | v32 | v42;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)externalConnected:(id)a3 differsFrom:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "BOOLValue");
  v6 = objc_msgSend(v5, "BOOLValue");

  return a3 ^ v6;
}

- (void)updateBatteryStateDictionary:(id)a3 currentBatteryPercentage:(double)a4
{
  _DKBatteryMonitor *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary **p_previousBatteryState;
  NSDictionary *previousBatteryState;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  NSDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSDictionary *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSDictionary *v60;
  void *v61;
  void *v62;
  void *context;
  id v64;

  v64 = a3;
  v6 = self;
  v7 = objc_sync_enter(v6);
  context = (void *)MEMORY[0x219A29278](v7);
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryPercentageKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

  }
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("Voltage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryVoltageKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("Temperature"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryTemperatureKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AppleRawExternalConnected"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("FullyCharged"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryFullyChargedKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v22);

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("IsCharging"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryIsChargingKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v24);

  p_previousBatteryState = &v6->_previousBatteryState;
  previousBatteryState = v6->_previousBatteryState;
  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](previousBatteryState, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28
    && (objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", v29),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "isEqual:", v28),
        v30,
        v29,
        (v31 & 1) != 0))
  {
    v32 = *p_previousBatteryState;
    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedChangeDateKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedChangeDateKey");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, v35);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedChangeDateKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, v34);
  }

  v36 = *p_previousBatteryState;
  objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38
    && (objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", v39),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        v41 = objc_msgSend(v40, "isEqual:", v38),
        v40,
        v39,
        (v41 & 1) != 0))
  {
    v42 = *p_previousBatteryState;
    objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedChangeDateKey");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedChangeDateKey");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v44, v45);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedChangeDateKey");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, v44);
  }

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("BatteryInstalled"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "batteryPercentageKey");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24DA70F98, v47);

    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v48);

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedChangeDateKey");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v49, v50);

    objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedKey");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v51);

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "batteryRawExternalConnectedChangeDateKey");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v52, v53);

    objc_msgSend(MEMORY[0x24BE1B180], "batteryFullyChargedKey");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v54);

  }
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AdapterDetails"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("FamilyCode"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterTypeKey");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v56, v57);

  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("IsWireless"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterIsWirelessKey");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v58, v59);

  if (-[_DKBatteryMonitor newBatteryState:differsSignificantlyFromState:currentBatteryPercentage:previousBatteryPercentage:](v6, "newBatteryState:differsSignificantlyFromState:currentBatteryPercentage:previousBatteryPercentage:", v10, *p_previousBatteryState, a4, v6->_previousPercentage))
  {
    objc_storeStrong((id *)&v6->_previousBatteryState, v10);
    v60 = *p_previousBatteryState;
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, v62);

  }
  objc_autoreleasePoolPop(context);
  objc_sync_exit(v6);

}

- (BOOL)temperature:(id)a3 differsFrom:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 1;
    if (v5 && v6)
    {
      if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend((id)v5, "integerValue") + 0x51EB851EB851EB8, 2) > 0x28F5C28F5C28F5CuLL
        || __ROR8__(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * objc_msgSend(v7, "integerValue"), 2) <= 0x28F5C28F5C28F5CuLL)
      {
        objc_msgSend((id)v5, "doubleValue");
        v10 = v9;
        objc_msgSend(v7, "doubleValue");
        v12 = v10 - v11;
        if (v12 < 0.0)
          v12 = -v12;
        v8 = v12 >= 50.0;
      }
      else
      {
        v8 = 1;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)percentage:(double)a3 differsFrom:(double)a4
{
  double v4;

  v4 = a3 - a4;
  if (v4 < 0.0)
    v4 = -v4;
  return v4 >= 1.0;
}

- (BOOL)isCharging:(id)a3 differsFrom:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "BOOLValue");
  v6 = objc_msgSend(v5, "BOOLValue");

  return a3 ^ v6;
}

- (double)batteryPercentageFromPowerSourceDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxCapacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6 * 100.0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxCapacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v7 / v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_DKBatteryMonitor batteryPercentageFromPowerSourceDictionary:].cold.1((uint64_t)v3, v11, v12);

    v10 = -1.0;
  }

  return v10;
}

- (BOOL)adapterType:(id)a3 differsFrom:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return v6 != v7;
}

- (BOOL)voltage:(id)a3 differsFrom:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 1;
    if (v5 && v6)
    {
      if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend((id)v5, "integerValue") + 0x51EB851EB851EB8, 1) > 0x51EB851EB851EB8uLL
        || __ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend(v7, "integerValue") + 0x51EB851EB851EB8, 1) <= 0x51EB851EB851EB8uLL)
      {
        v9 = objc_msgSend((id)v5, "integerValue");
        v10 = objc_msgSend(v7, "integerValue");
        v11 = v9 - v10;
        if (v9 - v10 < 0)
          v11 = v10 - v9;
        v8 = v11 > 0x63;
      }
      else
      {
        v8 = 1;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKBatteryMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKBatteryMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("BatteryLevel");
}

+ (id)entitlements
{
  return 0;
}

+ (void)setCurrentBatteryPercentage:(double)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

+ (id)_eventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B038], "withBatteryPercentage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE1B068], "fullyCharged");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceBatteryPercentageStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventWithStream:startDate:endDate:value:metadata:", v10, v11, v12, v5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_BMEventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x24BE0C328]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithBatteryPercentage:fullyCharged:", v7, v8);

  return v9;
}

- (void)start
{
  OUTLINED_FUNCTION_1_1(&dword_219056000, a1, a3, "Unable to get power sources", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

- (void)completeStart
{
  int v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v4 = a1;
  v8 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a1 == 256)
  {
    v5 = CFSTR("unable to get power service or notify port");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, a3, "Unable to register for battery notifications: %@", (uint8_t *)&v6);
  if (v4 != 256)

}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKBatteryMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKBatteryMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  io_object_t batteryNotification;
  IONotificationPort *notifyPort;
  io_object_t powerService;

  batteryNotification = self->_batteryNotification;
  if (batteryNotification)
    IOObjectRelease(batteryNotification);
  notifyPort = self->_notifyPort;
  if (notifyPort)
    IONotificationPortDestroy(notifyPort);
  powerService = self->_powerService;
  if (powerService)
    IOObjectRelease(powerService);
}

- (void)postImminentShutdownNotification:(double)a3
{
  if ((double)self->_immediateShutdownThreshold <= a3 || (IOPSDrawingUnlimitedPower() & 1) != 0)
  {
    postImminentShutdownNotification__posted = 0;
  }
  else if ((postImminentShutdownNotification__posted & 1) == 0)
  {
    postImminentShutdownNotification__posted = 1;
    notify_post("com.apple.DuetHeuristic-BM.shutdowsoon");
  }
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->_hasInternalBattery)
  {
    v3 = (void *)MEMORY[0x219A29278]();
    -[_DKBatteryMonitor getBatteryProperties](self, "getBatteryProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKBatteryMonitor batteryPercentageFromPowerSourceDictionary:](self, "batteryPercentageFromPowerSourceDictionary:", v4);
    v6 = v5;
    if (v5 != -1.0)
    {
      -[_DKBatteryMonitor updateBatteryStateDictionary:currentBatteryPercentage:](self, "updateBatteryStateDictionary:currentBatteryPercentage:", v4, v5);
      +[_DKBatteryMonitor setCurrentBatteryPercentage:](_DKBatteryMonitor, "setCurrentBatteryPercentage:", v6);
      -[_DKBatteryMonitor postImminentShutdownNotification:](self, "postImminentShutdownNotification:", v6);
      self->_previousPercentage = v6;
    }

    objc_autoreleasePoolPop(v3);
  }
}

- (double)currentBatteryPercentage
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;

  v2 = IOPSGetPercentRemaining();
  if (!(_DWORD)v2)
    return (double)0;
  v3 = v2;
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_DKBatteryMonitor currentBatteryPercentage].cold.1(v3, v4);

  return -1.0;
}

- (int)immediateShutdownThreshold
{
  return self->_immediateShutdownThreshold;
}

- (void)setImmediateShutdownThreshold:(int)a3
{
  self->_immediateShutdownThreshold = a3;
}

- (BOOL)hasInternalBattery
{
  return self->_hasInternalBattery;
}

- (void)setHasInternalBattery:(BOOL)a3
{
  self->_hasInternalBattery = a3;
}

- (NSDictionary)previousBatteryState
{
  return self->_previousBatteryState;
}

- (void)setPreviousBatteryState:(id)a3
{
  objc_storeStrong((id *)&self->_previousBatteryState, a3);
}

- (double)previousPercentage
{
  return self->_previousPercentage;
}

- (void)setPreviousPercentage:(double)a3
{
  self->_previousPercentage = a3;
}

- (BOOL)previouslyFullyCharged
{
  return self->_previouslyFullyCharged;
}

- (void)setPreviouslyFullyCharged:(BOOL)a3
{
  self->_previouslyFullyCharged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBatteryState, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)getBatteryProperties
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "Unable to get battery properties: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_1();
}

- (void)currentBatteryPercentage
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, v4, "Unable to get valid battery level: %@", (uint8_t *)&v5);

}

- (void)batteryPercentageFromPowerSourceDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, a3, "Unable to get valid battery level. %@", (uint8_t *)&v3);
}

@end
