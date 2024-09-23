void sub_100001C74(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  objc_msgSend(v3, "runDelay");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "runDiagnostic", 0, 1));
  objc_msgSend(*(id *)(a1 + 32), "setRunTimer:", v2);

}

void sub_100001DF0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[TouchIDManager runTouchIDDiagnostic:options:](TouchIDManager, "runTouchIDDiagnostic:options:", 2, &__NSDictionary0__struct));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("testStatus")));
  objc_msgSend(v2, "addObject:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusCode"));
  if (objc_msgSend(v5, "integerValue") != (id)900)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusCode"));
    if (objc_msgSend(v7, "integerValue") == (id)-901)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
      v10 = objc_msgSend(v9, "integerValue");

      if (v10 == (id)-2)
        goto LABEL_7;
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("testStatus")));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v5, "setStatusCode:", v4);
    }
  }

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setRunCount:", objc_msgSend(*(id *)(a1 + 32), "runCount") + 1);
  v11 = objc_msgSend(*(id *)(a1 + 32), "runCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v13 = objc_msgSend(v12, "numberOfRuns");

  if (v11 == v13)
    objc_msgSend(*(id *)(a1 + 32), "finish");

}

void sub_100002718(id a1)
{
  byte_100008B48 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_1000027DC(id a1)
{
  byte_100008B58 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_1000028A0(id a1)
{
  byte_100008B68 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_100002964(id a1)
{
  byte_100008B78 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
}

void sub_1000029E8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BiometricKit diagnostic encountered unexpected error code: %d", (uint8_t *)v2, 8u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_biometricKitClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "biometricKitClass:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_convertDictionary_toJSON_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertDictionary:toJSON:");
}

id objc_msgSend_convertKey_toJSON_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertKey:toJSON:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_diagnostics_withOptions_passed_withDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnostics:withOptions:passed:withDetails:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finish");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBiometricKitFrameworkAvailable");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoreRepairFrameworkAvailable");
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldAccessoryFrameworkAvailable");
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldFrameworkAvailable");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberOfRuns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRuns");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_runCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runCount");
}

id objc_msgSend_runDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runDelay");
}

id objc_msgSend_runTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTimer");
}

id objc_msgSend_runTouchIDDiagnostic_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTouchIDDiagnostic:options:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setNumberOfRuns_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfRuns:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRunCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunCount:");
}

id objc_msgSend_setRunDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunDelay:");
}

id objc_msgSend_setRunTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunTimer:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}
