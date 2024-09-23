void sub_100004594(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000045A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000049DC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10));

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));
      objc_msgSend(v9, "addEntriesFromDictionary:", v5);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v10);
    }
  }

}

void sub_100005734(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-")));
  if ((unint64_t)objc_msgSend(v7, "count") > 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", (char *)objc_msgSend(v10, "length") + 1));
    objc_msgSend(a1[4], "addObject:", v10);
    objc_msgSend(a1[5], "addObject:", v11);
    objc_msgSend(a1[6], "addObject:", v6);

  }
  else
  {
    v8 = handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100005D28((uint64_t)v5, v9);

  }
}

void sub_100005830(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v3 = a2;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Result %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("statusCode")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v7, "setStatusCode:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v9, "setData:", v8);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_1000059E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045B8();
  sub_100004594((void *)&_mh_execute_header, v0, v1, "updateProperties invalid", v2, v3, v4, v5, v6);
  sub_1000045B0();
}

void sub_100005A10(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = objc_msgSend(*a1, "count");
  v5 = 134217984;
  v6 = v3;
  sub_1000045A4((void *)&_mh_execute_header, a2, v4, "partSPC count %lu", (uint8_t *)&v5);
  sub_1000045C4();
}

void sub_100005A8C(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v4 = 134217984;
  v5 = objc_msgSend(a1, "length");
  sub_1000045A4((void *)&_mh_execute_header, a2, v3, "partSPC is too short, length = %lu", (uint8_t *)&v4);
  sub_1000045C4();
}

void sub_100005B04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045B8();
  sub_100004594((void *)&_mh_execute_header, v0, v1, "FDR Sealing URL is invalid", v2, v3, v4, v5, v6);
  sub_1000045B0();
}

void sub_100005B30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045B8();
  sub_100004594((void *)&_mh_execute_header, v0, v1, "FDR DS URL is invalid", v2, v3, v4, v5, v6);
  sub_1000045B0();
}

void sub_100005B5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045B8();
  sub_100004594((void *)&_mh_execute_header, v0, v1, "FDR Trust Object URL is invalid", v2, v3, v4, v5, v6);
  sub_1000045B0();
}

void sub_100005B88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045B8();
  sub_100004594((void *)&_mh_execute_header, v0, v1, "FDR CA URL is invalid", v2, v3, v4, v5, v6);
  sub_1000045B0();
}

void sub_100005BB4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1000045A4((void *)&_mh_execute_header, a2, a3, "Failed to match Property:%@", (uint8_t *)&v3);
}

void sub_100005C20(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("PrCL");
  sub_1000045A4((void *)&_mh_execute_header, a1, a3, "Property:%@ not a string", (uint8_t *)&v3);
}

void sub_100005C98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004594((void *)&_mh_execute_header, a1, a3, "Invalid patch info, failed to decode patch info data", a5, a6, a7, a8, 0);
  sub_1000045B0();
}

void sub_100005CC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004594((void *)&_mh_execute_header, a1, a3, "Failed to patch items", a5, a6, a7, a8, 0);
  sub_1000045B0();
}

void sub_100005CF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004594((void *)&_mh_execute_header, a1, a3, "Not in diagnostics mode", a5, a6, a7, a8, 0);
  sub_1000045B0();
}

void sub_100005D28(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid key: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_FDRCAURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FDRCAURL");
}

id objc_msgSend_FDRDSURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FDRDSURL");
}

id objc_msgSend_FDRSealingURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FDRSealingURL");
}

id objc_msgSend_KBBSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "KBBSerialNumber");
}

id objc_msgSend_KGBSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "KGBSerialNumber");
}

id objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSArrayFromKey:types:maxLength:defaultValue:failed:");
}

id objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSDictionaryFromKey:defaultValue:failed:");
}

id objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_NSStringFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSStringFromKey:defaultValue:failed:");
}

id objc_msgSend_NSStringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSStringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_SOCKSHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SOCKSHost");
}

id objc_msgSend_SOCKSPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SOCKSPort");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allowSelfService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowSelfService");
}

id objc_msgSend_allowUsedPart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUsedPart");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayMaxDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayMaxDuration");
}

id objc_msgSend_doSeal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doSeal");
}

id objc_msgSend_enableProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableProxy");
}

id objc_msgSend_enableStagedSeal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableStagedSeal");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_ignoreStagedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreStagedData");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPattern:options:error:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_keyBlob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyBlob");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parsePatchItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parsePatchItems");
}

id objc_msgSend_partSPC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partSPC");
}

id objc_msgSend_patchItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchItems");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_seal_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seal:withReply:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_skipStageEAN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipStageEAN");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_timeoutPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutPeriod");
}

id objc_msgSend_trustObjectURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustObjectURL");
}

id objc_msgSend_updateProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProperties");
}

id objc_msgSend_validateUpdateProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateUpdateProperties:");
}
