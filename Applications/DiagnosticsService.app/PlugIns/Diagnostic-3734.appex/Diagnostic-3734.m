BOOL sub_100001F04(id a1, id a2)
{
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (unint64_t)objc_msgSend(v2, "length") < 0x33;
  }
  else
  {
    v5 = objc_opt_class(NSNumber);
    v4 = (objc_opt_isKindOfClass(v2, v5) & 1) == 0 || (uint64_t)objc_msgSend(v2, "integerValue") > 0;
  }

  return v4;
}

BOOL sub_100002068(id a1, id a2)
{
  return (unint64_t)objc_msgSend(a2, "length") < 0x65;
}

void sub_1000024DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100002514(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v5 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("109"));

    if (v7)
      v8 = objc_msgSend(v3, "BOOLFromFieldAtIndex:", 7);
    else
      v8 = 0;
    v9 = objc_loadWeakRetained(a1 + 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userFriendlyAppNameForBundleID:", v10));

    if (v11 && (v8 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") + 1));
      objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v13, v11);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fields"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" ")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("210")))
    {
      v17 = objc_msgSend(a1[5], "containsObject:", v15);

      if ((v17 & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));

        if (v18)
        {
          if (!v11)
            goto LABEL_16;
        }
        else
        {

          v11 = CFSTR("System Process");
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "objectForKeyedSubscript:", v11));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "intValue") + 1));
        objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v20, v11);

        objc_msgSend(a1[5], "addObject:", v15);
      }
    }
    else
    {

    }
LABEL_16:

  }
  return v5;
}

void sub_100002738(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  signed int v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (*(double *)(a1 + 48) == 0.0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v7 = (int)(v8 / *(double *)(a1 + 48));
  }
  v9 = objc_msgSend(v6, "intValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  if (v9 <= (int)objc_msgSend(v10, "minCrashesToConsider"))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
    v12 = objc_msgSend(v11, "avgCrashesToConsider");

    if (v7 > v12)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  }

}

void sub_100002A40(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Bundle record not found for ID %@: %@", (uint8_t *)&v3, 0x16u);
}

id objc_msgSend__applyCrashTypesParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyCrashTypesParameter:");
}

id objc_msgSend__applyWhitelistParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyWhitelistParameter:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appNameForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appNameForBundleID:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_avgCrashesToConsider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avgCrashesToConsider");
}

id objc_msgSend_BOOLFromFieldAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLFromFieldAtIndex:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleRecordWithApplicationIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithApplicationIdentifier:error:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dk_arrayFromKey_types_maxLength_defaultValue_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateLogLinesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithBlock:");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_initWithLogIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogIDs:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestUserLog");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_logIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logIds");
}

id objc_msgSend_minCrashesToConsider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minCrashesToConsider");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parseLogsWithCollector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLogsWithCollector:");
}

id objc_msgSend_restoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreDate");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAvgCrashesToConsider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvgCrashesToConsider:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setLogIds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogIds:");
}

id objc_msgSend_setMinCrashesToConsider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinCrashesToConsider:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWhitelist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWhitelist:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_userFriendlyAppNameForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userFriendlyAppNameForBundleID:");
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelist");
}
