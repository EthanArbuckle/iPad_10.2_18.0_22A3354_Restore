@implementation ComponentBatteryBase

- (id)generatePowerSourceData
{
  id v2;
  int v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v28;
  _QWORD v29[3];
  _QWORD v30[3];
  uint8_t buf[4];
  int v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v33[0] = CFSTR("serviceBatteryWarning");
  v33[1] = CFSTR("serviceBatteryFlags");
  v34[0] = &off_1000B2BA8;
  v34[1] = &off_1000B2BA8;
  v33[2] = CFSTR("maximumCapacityPercent");
  v34[2] = &off_1000B2BA8;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
  v28 = 0;
  v3 = IOPSCopyPowerSourcesByTypePrecise(1, &v28);
  v4 = v28;
  if (!v3 && v28)
  {
    if (objc_msgSend(v28, "count"))
    {
      v29[0] = CFSTR("serviceBatteryWarning");
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v6 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Battery Service State")));
      v7 = (void *)v6;
      if (v6)
        v8 = (_UNKNOWN **)v6;
      else
        v8 = &off_1000B2BA8;
      v30[0] = v8;
      v29[1] = CFSTR("serviceBatteryFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Battery Service Flags")));
      v11 = (void *)v10;
      if (v10)
        v12 = (_UNKNOWN **)v10;
      else
        v12 = &off_1000B2BA8;
      v30[1] = v12;
      v29[2] = CFSTR("maximumCapacityPercent");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Maximum Capacity Percent")));
      v15 = (void *)v14;
      if (v14)
        v16 = (_UNKNOWN **)v14;
      else
        v16 = &off_1000B2BA8;
      v30[2] = v16;
      v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));

      v2 = (id)v17;
    }
    else
    {
      v21 = DiagnosticLogHandleForCategory(6);
      v5 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "IOPS query failed, cannot gather power source information in ComponentBatteryInternalBase", buf, 2u);
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("calibration0")));

    if (v23)
    {
      if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v23))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v2));
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("calibration0"));
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v24));

LABEL_26:
        goto LABEL_27;
      }
      v25 = DiagnosticLogHandleForCategory(6);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Not adding data for the \"calibration0\" key because it is not a JSON serializable object", buf, 2u);
      }

    }
    v20 = v2;
    goto LABEL_26;
  }
  v18 = DiagnosticLogHandleForCategory(6);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v3;
    _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Could not retrieve power sources info. Error code: %03X", buf, 8u);
  }

  v2 = v2;
  v20 = v2;
LABEL_27:

  return v20;
}

@end
