void sub_100002C68(id a1)
{
  byte_1000083C0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_100002D2C(id a1)
{
  byte_1000083D0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_100002DF0(id a1)
{
  byte_1000083E0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_100002EB4(id a1)
{
  byte_1000083F0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
}

void sub_100003450(int a1, NSObject *a2)
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

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
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

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
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

id objc_msgSend_runTouchIDDiagnostic_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTouchIDDiagnostic:options:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}
