@implementation ComponentBatteryInternalBase

- (BOOL)isPresent
{
  void *v2;
  BOOL valid;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase serialNumber](self, "serialNumber"));
  valid = isValidSerialNumber(v2);

  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase getGasGaugeData](self, "getGasGaugeData"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  -[ComponentBatteryInternalBase addRawRaDataToDictionary:](self, "addRawRaDataToDictionary:", v4);
  if (-[ComponentBatteryInternalBase hasSMC](self, "hasSMC"))
  {
    -[ComponentBatteryInternalBase addCycleCountHistoryToDictionary:](self, "addCycleCountHistoryToDictionary:", v4);
    -[ComponentBatteryInternalBase addHeatMapToDictionary:](self, "addHeatMapToDictionary:", v4);
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SMC not found, skipping heat map and cycle count history.", v16, 2u);
    }

  }
  -[ComponentBatteryInternalBase addInductiveChargingParametersToDictionary:](self, "addInductiveChargingParametersToDictionary:", v4);
  -[ComponentBatteryInternalBase addDateOfManufactureAndFirstUseToDictionary:](self, "addDateOfManufactureAndFirstUseToDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase isBatteryCharging](self, "isBatteryCharging"));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
    -[ComponentBatteryInternalBase addWirelessChargingModeToDictionary:](self, "addWirelessChargingModeToDictionary:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase isBatteryCharging](self, "isBatteryCharging"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("isBatteryCharging"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase batteryLevel](self, "batteryLevel"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("currentBatteryLevel"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase isPowerConnected](self, "isPowerConnected"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("isExternalPowerConnected"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase upoCount](self, "upoCount"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("upoCount"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase kioskMode](self, "kioskMode"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("kioskMode"));

}

- (void)addWirelessChargingModeToDictionary:(id)a3
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = IOPSCopyExternalPowerAdapterDetails();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("IsWireless")));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue")));
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("isChargingWireless"));

    }
  }

}

- (id)batteryLevel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)MGCopyAnswer(CFSTR("BatteryCurrentCapacity"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));
  v4 = stringOrNull(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)isBatteryCharging
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("BatteryIsCharging"), 0);
  v3 = numberOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)isPowerConnected
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("ExternalPowerSourceConnected"), 0);
  v3 = numberOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)addDateOfManufactureAndFirstUseToDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  CFArrayRef v7;
  void *v8;
  CFDictionaryRef v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[8];
  CFTypeRef blob;

  v3 = a3;
  blob = 0;
  if (IOPSCopyPowerSourcesByTypePrecise(1, &blob))
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v6 = "Failed to retrieve power sources info.";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v30, 2u);
    }
  }
  else
  {
    if (!blob)
    {
      v28 = DiagnosticLogHandleForCategory(6);
      v5 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)v30 = 0;
      v6 = "Power sources info is empty.";
      goto LABEL_4;
    }
    v7 = IOPSCopyPowerSourcesList(blob);
    v5 = v7;
    if (v7 && -[__CFArray count](v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0));
      v9 = IOPSGetPowerSourceDescription(v5, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);

      if (v10)
      {
        v11 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("Date of first use")));
        if (!v11 || (v12 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v11, v12) & 1) == 0))
        {
          v13 = DiagnosticLogHandleForCategory(6);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to retrieve battery date of first use.", v30, 2u);
          }

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("Date of manufacture")));
        if (!v15 || (v16 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
        {
          v17 = DiagnosticLogHandleForCategory(6);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to retrieve battery date of manufacture.", v30, 2u);
          }

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "formatterWithType:", 0));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v15));
        v22 = stringOrNull(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("dateOfManufacture"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v11));
        v25 = stringOrNull(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("dateOfFirstUse"));

        CFRelease(blob);
      }
      else
      {
        v29 = DiagnosticLogHandleForCategory(6);
        v11 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v30 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve power source description.", v30, 2u);
        }
      }

    }
    else
    {
      v27 = DiagnosticLogHandleForCategory(6);
      v10 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve power sources list.", v30, 2u);
      }
    }

  }
LABEL_28:

}

- (id)upoCount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _pmuNodeProperties](self, "_pmuNodeProperties"));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IOPMUBootUPOCounter")));
  else
    v4 = 0;
  v5 = numberOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)fbsn
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  size_t v7;
  void *v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _chargerNodeProperties](self, "_chargerNodeProperties"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("battery-factory-id")));
    if (v4
      && (v5 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      && (v6 = objc_retainAutorelease(v4),
          v7 = strnlen((const char *)objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length")),
          v7 < (unint64_t)objc_msgSend(v6, "length")))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v6), "bytes"), 1));
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
  v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)serialNumber
{
  id v2;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F958;
  block[3] = &unk_100080A38;
  block[4] = self;
  if (qword_1000BA048 != -1)
    dispatch_once(&qword_1000BA048, block);
  v2 = stringOrNull((void *)qword_1000BA040);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)kioskMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _powerSourceNodeProperties](self, "_powerSourceNodeProperties"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("KioskMode")));
    v5 = v4;
    if (v4)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KioskModeMode")));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)addRawRaDataToDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _powerSourceNodeProperties](self, "_powerSourceNodeProperties"));
  v6 = v5;
  if (v5
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BatteryData"))),
        v7,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BatteryData")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LifetimeData")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LifetimeData")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Raw")));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Raw")));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 0));

      }
      else
      {
        v13 = &stru_10009EB48;
      }

    }
    else
    {
      v13 = &stru_10009EB48;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RaTableRaw")));

    if (v15)
    {
      v14 = objc_opt_new(NSMutableArray);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RaTableRaw"), 0));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20), "base64EncodedStringWithOptions:", 0));
            if (v21)
              -[NSMutableArray addObject:](v14, "addObject:", v21);

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v18);
      }

    }
    else
    {
      v14 = (NSMutableArray *)&__NSArray0__struct;
    }

  }
  else
  {
    v13 = &stru_10009EB48;
    v14 = (NSMutableArray *)&__NSArray0__struct;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("lifetimeDataRaw"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("rawRaData"));

}

- (id)getGasGaugeData
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _powerSourceNodeProperties](self, "_powerSourceNodeProperties"));
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NominalChargeCapacity")));
    if (v6)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("nominalChargeCapacity"));
    v19 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BatteryData"), v6));
    v8 = v7;
    if (v7)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v14 = CFSTR("fullChargeCapacity");
            if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MaxCapacity")) & 1) == 0)
            {
              v14 = CFSTR("cycleCount");
              if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CycleCount")) & 1) == 0)
              {
                v14 = CFSTR("designCapacity");
                if (!objc_msgSend(v13, "isEqualToString:", CFSTR("DesignCapacity")))
                  continue;
              }
            }
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));
            objc_msgSend(v3, "setValue:forKey:", v15, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }
    }
    v16 = objc_msgSend(v3, "copy");

    v5 = v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)generateMaxMinAvgCapacity
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;

  v3 = PLQueryRegistered(32, CFSTR("BatteryQueryForCapacity"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = DiagnosticLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BatteryQueryForCapacity: %@", buf, 0xCu);
    }

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullChargeCapacityMax")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase integerNumberWithNumber:](self, "integerNumberWithNumber:", v7));
    v16[0] = v8;
    v15[1] = CFSTR("fullChargeCapacityMin");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase integerNumberWithNumber:](self, "integerNumberWithNumber:", v9));
    v16[1] = v10;
    v15[2] = CFSTR("fullChargeCapacityAvg");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase integerNumberWithNumber:](self, "integerNumberWithNumber:", v11));
    v16[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForCapacity returned nil", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)generateTemperatureData
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;

  v2 = PLQueryRegistered(32, CFSTR("BatteryQueryForTemperature"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BatteryQueryForTemperature: %@", buf, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TemperatureMax"), CFSTR("temperatureMax")));
    v7 = numberOrNull(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v18[0] = v8;
    v17[1] = CFSTR("temperatureMin");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TemperatureMin")));
    v10 = numberOrNull(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18[1] = v11;
    v17[2] = CFSTR("temperatureAvg");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TemperatureAvg")));
    v13 = numberOrNull(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v18[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForTemperature returned nil", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)generateMitigationState
{
  uint32_t v2;
  uint32_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint32_t state;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int out_token;
  uint64_t state64;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  uint32_t v18;

  state64 = 0;
  out_token = 0;
  v2 = notify_register_check("com.apple.thermalmonitor.ageAwareMitigationState", &out_token);
  if (v2)
  {
    v3 = v2;
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v3;
      v6 = "notify_register_check failed in ComponentBatteryInternalBase: %d";
LABEL_9:
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, v6, buf, 8u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  state = notify_get_state(out_token, &state64);
  if (state)
  {
    v8 = state;
    v9 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v8;
      v6 = "notify_get_state failed in ComponentBatteryInternalBase: %d";
      goto LABEL_9;
    }
LABEL_6:

  }
  v15 = CFSTR("perfMitigationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", state64));
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  return v11;
}

- (id)generateUPOStepper
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;

  v2 = PLQueryRegistered(32, CFSTR("BatteryQueryForUPOStepper"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BatteryQueryForUPOStepper: %@", buf, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State")));
    if (!v6 || (v7 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
    {
      v8 = DiagnosticLogHandleForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil or unexpected class for state array", buf, 2u);
      }

      v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v6 = v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Metrics")));
    if (v11 && (v12 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      if (!objc_msgSend(v11, "count"))
      {
LABEL_22:
        v28[1] = v11;
        v29 = CFSTR("upoStepper");
        v27[0] = CFSTR("state");
        v27[1] = CFSTR("metrics");
        v28[0] = v6;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
        v30 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));

        goto LABEL_26;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formatterWithType:", 0));

      v15 = objc_msgSend(v11, "mutableCopy");
      if (objc_msgSend(v15, "count"))
      {
        v16 = 0;
        do
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v16));
          v18 = objc_msgSend(v17, "mutableCopy");

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BatteryShutdownTimestamp")));
          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BatteryShutdownTimestamp")));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v20));
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("BatteryShutdownTimestamp"));

          }
          objc_msgSend(v15, "setObject:atIndexedSubscript:", v18, v16);

          ++v16;
        }
        while ((unint64_t)objc_msgSend(v15, "count") > v16);
      }

      v11 = v14;
    }
    else
    {
      v22 = DiagnosticLogHandleForCategory(6);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil or unexpected class for metrics array", buf, 2u);
      }

      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }

    v11 = v15;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil", buf, 2u);
  }
  v25 = 0;
LABEL_26:

  return v25;
}

- (id)generateBatteryConfig
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;

  v3 = PLQueryRegistered(32, CFSTR("BatteryQueryForConfig"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = DiagnosticLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BatteryQueryForConfig: %@", buf, 0xCu);
    }

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryConfig")));
    if (v7
      && (v8 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      && -[NSObject count](v7, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v7, "lastObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInDictionary:](self, "_encodeDataInDictionary:", v9));

      if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v10))
      {
        v11 = DiagnosticLogHandleForCategory(6);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Battery config is still not serializable, omitting.", buf, 2u);
        }

        v13 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v10 = (void *)v13;
      }
    }
    else
    {
      v14 = DiagnosticLogHandleForCategory(6);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForConfig returned nil, unexpected class, or zero count for config array", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataReady"), CFSTR("batteryConfigDataReady")));
    v17 = v16;
    if (!v16)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v20[1] = CFSTR("batteryConfig");
    v21[0] = v17;
    v21[1] = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    if (!v16)

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForConfig returned nil", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (id)integerNumberWithNumber:(id)a3
{
  id v3;
  uint64_t v4;
  _UNKNOWN **v5;

  v3 = a3;
  if (v3 && (v4 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue")));
  else
    v5 = &off_1000B2908;

  return v5;
}

- (id)_stringToSInt16Array:(id)a3 separatedByString:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "integerValue", (_QWORD)v13)));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasSMC
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_service_t v4;

  v2 = IOServiceMatching("AppleSMC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  v4 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v4 != 0;
}

- (void)addCycleCountHistoryToDictionary:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  NSObject *v8;
  int v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char isKindOfClass;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  intptr_t (*v34)(uint64_t, uint64_t);
  void *v35;
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  uint64_t v45;

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100021280;
  v42 = sub_100021290;
  v43 = 0;
  v5 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(21, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v32 = _NSConcreteStackBlock;
  v33 = 3221225472;
  v34 = sub_100021298;
  v35 = &unk_100080A60;
  v37 = &v38;
  v8 = v5;
  v36 = v8;
  v9 = IOPMCopyCycleCountData(v7, &v32);

  v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "IOPM cycle count history query timed out";
      v14 = v12;
      v15 = 2;
LABEL_16:
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    }
  }
  else if (v9)
  {
    v16 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v9;
      v13 = "Fetching cycle count data resulted in error: 0x%0x";
      v14 = v12;
      v15 = 8;
      goto LABEL_16;
    }
  }
  else
  {
    v17 = DiagnosticLogHandleForCategory(6);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v39[5];
      *(_DWORD *)buf = 138412290;
      v45 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cycle count data: %@", buf, 0xCu);
    }

    v20 = (void *)v39[5];
    if (v20
      && (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("batteryCycleCountData"), v32, v33, v34, v35))) != 0&& (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v39[5], "objectForKeyedSubscript:", CFSTR("batteryCycleCountData"))), v23 = objc_opt_class(NSDictionary), isKindOfClass = objc_opt_isKindOfClass(v22, v23), v22, v21, (isKindOfClass & 1) != 0))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v39[5], "objectForKeyedSubscript:", CFSTR("batteryCycleCountData")));
      v12 = objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInDictionary:](self, "_encodeDataInDictionary:", v25));

      if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v12))
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("cycleCountHistory"));
      }
      else
      {
        v28 = DiagnosticLogHandleForCategory(6);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = v39[5];
          *(_DWORD *)buf = 138412290;
          v45 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Could not serialize cycle count data: %@", buf, 0xCu);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("cycleCountHistory"));

      }
    }
    else
    {
      v26 = DiagnosticLogHandleForCategory(6);
      v12 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v27 = v39[5];
        *(_DWORD *)buf = 138412290;
        v45 = v27;
        v13 = "Cycle count data not found or not in the right format: %@.";
        v14 = v12;
        v15 = 12;
        goto LABEL_16;
      }
    }
  }

  _Block_object_dispose(&v38, 8);
}

- (void)addHeatMapToDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  id v12;
  dispatch_queue_global_t global_queue;
  void *v14;
  NSObject *v15;
  int v16;
  dispatch_time_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char isKindOfClass;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  _QWORD v57[3];
  _QWORD v58[3];

  v3 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_100021280;
  v50 = sub_100021290;
  v51 = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("heatMap"));
  v38 = (void *)v4;
  v37 = v3;
  v57[0] = &off_1000B2920;
  v57[1] = &off_1000B2938;
  v58[0] = CFSTR("wired");
  v58[1] = CFSTR("wireless");
  v57[2] = &off_1000B2950;
  v58[2] = CFSTR("discharging");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 3));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v43;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));
        v11 = dispatch_semaphore_create(0);
        v12 = objc_msgSend(v9, "integerValue");
        global_queue = dispatch_get_global_queue(21, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100021868;
        v39[3] = &unk_100080A60;
        v41 = &v46;
        v15 = v11;
        v40 = v15;
        v16 = IOPMCopyBatteryHeatMap(v12, v14, v39);

        v17 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v15, v17))
        {
          v18 = DiagnosticLogHandleForCategory(6);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 138412290;
          v53 = v10;
          v20 = v19;
          v21 = "IOPM heat map query timed out for: %@";
LABEL_9:
          v22 = 12;
LABEL_13:
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
          goto LABEL_22;
        }
        if (v16)
        {
          v23 = DiagnosticLogHandleForCategory(6);
          v19 = objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 138412546;
          v53 = v10;
          v54 = 1024;
          LODWORD(v55) = v16;
          v20 = v19;
          v21 = "Fetching heat map resulted in error [%@]: 0x%0x";
          v22 = 18;
          goto LABEL_13;
        }
        v24 = DiagnosticLogHandleForCategory(6);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)v47[5];
          *(_DWORD *)buf = 138412290;
          v53 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Heat map data: %@", buf, 0xCu);
        }

        v27 = (void *)v47[5];
        if (v27
          && (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("batteryHeatMapData")))) != 0
          && (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v47[5], "objectForKeyedSubscript:", CFSTR("batteryHeatMapData"))),
              v30 = objc_opt_class(NSDictionary),
              isKindOfClass = objc_opt_isKindOfClass(v29, v30),
              v29,
              v28,
              (isKindOfClass & 1) != 0))
        {
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v47[5], "objectForKeyedSubscript:", CFSTR("batteryHeatMapData")));
          if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v19))
          {
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v19, v10);
          }
          else
          {
            v33 = DiagnosticLogHandleForCategory(6);
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = v47[5];
              *(_DWORD *)buf = 138412546;
              v53 = v10;
              v54 = 2112;
              v55 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Could not serialize heat map [%@]: %@", buf, 0x16u);
            }

          }
        }
        else
        {
          v32 = DiagnosticLogHandleForCategory(6);
          v19 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v10;
            v20 = v19;
            v21 = "Heat map not found [%@].";
            goto LABEL_9;
          }
        }
LABEL_22:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v36 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      v6 = v36;
    }
    while (v36);
  }

  _Block_object_dispose(&v46, 8);
}

- (void)addInductiveChargingParametersToDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _powerSourceNodeProperties](self, "_powerSourceNodeProperties"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InductiveChargingParameters")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InductiveChargingParameters")));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("inductiveChargingParameters"));

    }
  }

}

- (id)_encodeDataInDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = objc_msgSend(a3, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInObject:](self, "_encodeDataInObject:", v11));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (id)_encodeDataInArray:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInObject:](self, "_encodeDataInObject:", v7));
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, v6);

      ++v6;
    }
    while ((unint64_t)objc_msgSend(v4, "count") > v6);
  }
  v9 = objc_msgSend(v5, "copy");

  return v9;
}

- (id)_encodeDataInObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v13;
  id v14;

  v4 = a3;
  v5 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Encoding raw data object: \"%@\", (uint8_t *)&v13, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
    goto LABEL_9;
  }
  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInDictionary:](self, "_encodeDataInDictionary:", v4));
LABEL_9:
    v11 = (void *)v8;

    v4 = v11;
    return v4;
  }
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _encodeDataInArray:](self, "_encodeDataInArray:", v4));
    goto LABEL_9;
  }
  return v4;
}

- (id)_powerSourceNodeProperties
{
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;

  v6 = CFSTR("IOProviderClass");
  v7 = CFSTR("IOPMPowerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _nodePropertiesForServiceMatching:extraKey:](self, "_nodePropertiesForServiceMatching:extraKey:", v3, CFSTR("InductiveChargingParameters")));

  return v4;
}

- (id)_chargerNodeProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = CFSTR("IONameMatch");
  v10[1] = CFSTR("IOProviderClass");
  v11[0] = CFSTR("charger");
  v11[1] = CFSTR("IOPlatformDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v4 = objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _nodePropertiesForServiceMatching:extraKey:](self, "_nodePropertiesForServiceMatching:extraKey:", v3, 0));
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v8[0] = CFSTR("IONameMatch");
    v8[1] = CFSTR("IOProviderClass");
    v9[0] = CFSTR("smc-charger");
    v9[1] = CFSTR("AppleSMCInterface");
    v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase _nodePropertiesForServiceMatching:extraKey:](self, "_nodePropertiesForServiceMatching:extraKey:", v6, 0));
    v3 = (void *)v6;
  }

  return v5;
}

- (id)_pmuNodeProperties
{
  return -[ComponentBatteryInternalBase _nodePropertiesForServiceMatching:extraKey:](self, "_nodePropertiesForServiceMatching:extraKey:", &off_1000B2CF0, 0);
}

- (id)_nodePropertiesForServiceMatching:(id)a3 extraKey:(id)a4
{
  id v5;
  __CFString *v6;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  io_registry_entry_t v9;
  kern_return_t v10;
  void *CFProperty;
  CFTypeID v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  CFMutableDictionaryRef v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  void *v26;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = (const __CFDictionary *)v5;
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if (MatchingService)
  {
    v9 = MatchingService;
    properties = 0;
    v10 = IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
    if (v6)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v9, v6, 0, 0);
      IOObjectRelease(v9);
      if (CFProperty)
      {
        v12 = CFGetTypeID(CFProperty);
        if (v12 != CFDictionaryGetTypeID())
        {
          CFRelease(CFProperty);
          CFProperty = 0;
        }
        v13 = 1;
        if (!v10)
          goto LABEL_16;
LABEL_12:
        v17 = DiagnosticLogHandleForCategory(6);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[ERROR] Could not create properties", buf, 2u);
        }

        v16 = 0;
        goto LABEL_26;
      }
      v13 = 0;
      if (v10)
        goto LABEL_12;
    }
    else
    {
      IOObjectRelease(v9);
      v13 = 0;
      CFProperty = 0;
      if (v10)
        goto LABEL_12;
    }
LABEL_16:
    v16 = properties;
    v19 = v13 ^ 1;
    if (!v6)
      v19 = 1;
    if ((v19 & 1) != 0)
    {
      if (!v6)
        v13 = 1;
      if ((v13 & 1) == 0)
      {
        v20 = DiagnosticLogHandleForCategory(6);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[ERROR] Could not get extra property %@", buf, 0xCu);
        }

      }
    }
    else
    {
      -[__CFDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", CFProperty, v6);
    }
LABEL_26:

    goto LABEL_27;
  }
  v14 = DiagnosticLogHandleForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[ERROR] Could not find the service matched by: %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_27:
  v22 = -[__CFDictionary copy](v16, "copy");

  return v22;
}

- (BOOL)isTrusted
{
  void *v2;
  BOOL v3;
  char v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("isTrusted"), 0, &stru_100080A10));
  v5 = 0;
  objc_msgSend(v2, "getBytes:length:", &v5, 1);
  v3 = v5 != 0;

  return v3;
}

- (BOOL)authPassed
{
  void *v2;
  BOOL v3;
  char v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("AuthPassed"), 0, &stru_100080A10));
  v5 = 0;
  objc_msgSend(v2, "getBytes:length:", &v5, 1);
  v3 = v5 != 0;

  return v3;
}

- (id)fdrValidationStatus
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("FdrValidationStatus"), 0, &stru_100080A10));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;
  v4 = stringOrNull(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end
