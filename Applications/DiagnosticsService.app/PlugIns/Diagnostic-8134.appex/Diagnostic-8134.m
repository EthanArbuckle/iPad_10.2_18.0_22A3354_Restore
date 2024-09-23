uint64_t sub_1000047E4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  double v40;
  double v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    goto LABEL_27;
  v5 = ELSSubDefaultQueueEntryType;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryType));
  if (!v6)
    goto LABEL_26;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    goto LABEL_26;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ELSWhitelist findEntryForParameterName:](ELSWhitelist, "findEntryForParameterName:", v6));

  if (!v8)
    goto LABEL_26;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", ELSParameterPayload));
  if (v6)
  {
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
      goto LABEL_26;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "parameterPayloads"));
    if (!v10
      || (v11 = (void *)v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "parameterPayloads")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys")),
          v14 = objc_msgSend(v13, "containsObject:", v6),
          v13,
          v12,
          v11,
          (v14 & 1) == 0))
    {
LABEL_26:

LABEL_27:
      v38 = 0;
      goto LABEL_28;
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryExecuteAfterDuration));
  if (v15)
  {
    v16 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
    {
      objc_msgSend(v15, "doubleValue");
      if (v40 < 0.0 || (objc_msgSend(v15, "doubleValue"), v41 > 2419200.0))
      {

        goto LABEL_27;
      }
    }
  }

  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryRetry));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v18, v19);

    if ((isKindOfClass & 1) == 0)
      goto LABEL_27;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ELSWhitelist findEntryForParameterName:](ELSWhitelist, "findEntryForParameterName:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryPlatform));
  if (v23)
  {
    v24 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
    {

      goto LABEL_27;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(",")));
  v26 = v25;
  if (v25 && objc_msgSend(v25, "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v28)
    {
      v29 = v28;
      v42 = v26;
      v43 = v23;
      v30 = *(_QWORD *)v45;
      while (2)
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet", v42, v43, (_QWORD)v44));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByTrimmingCharactersInSet:", v33));

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "platformAvailability"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lowercaseString"));
          v37 = objc_msgSend(v35, "containsObject:", v36);

          if (!v37)
          {
            v38 = 0;
            goto LABEL_35;
          }
          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v29)
          continue;
        break;
      }
      v38 = 1;
LABEL_35:
      v26 = v42;
      v23 = v43;
    }
    else
    {
      v38 = 1;
    }

  }
  else
  {
    v38 = 1;
  }

LABEL_28:
  return v38;
}

BOOL sub_100004BEC(id a1, id a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v2 = a2;
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", ELSSubDefaultConsentHandleEntryHandle));
    v6 = 0;
    if (v4)
    {
      v5 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
        v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_100004EC8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v3 = objc_msgSend(v2, "command");

  switch((unint64_t)v3)
  {
    case 0uLL:
      v6 = *(void **)(a1 + 32);
      v7 = 1;
      goto LABEL_4;
    case 1uLL:
      v6 = *(void **)(a1 + 32);
      v7 = 0;
LABEL_4:
      v8 = 0;
      goto LABEL_8;
    case 2uLL:
      v6 = *(void **)(a1 + 32);
      v7 = 0;
      goto LABEL_7;
    case 3uLL:
      v6 = *(void **)(a1 + 32);
      v7 = 1;
LABEL_7:
      v8 = 1;
LABEL_8:
      objc_msgSend(v6, "enrollWithFlush:commit:", v7, v8);
      break;
    case 4uLL:
      objc_msgSend(*(id *)(a1 + 32), "unenroll", v4, v5);
      break;
    default:
      return;
  }
}

void sub_1000052DC(id a1, ELSSnapshot *a2)
{
  -[ELSSnapshot setStatus:](a2, "setStatus:", 6);
}

id sub_1000052E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithStatusCode:metadata:", &off_1000084B8, 0);
}

void sub_100005940(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
    v5 = objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
    objc_msgSend(v13, "setQueue:", v6);

  }
  else
  {
    objc_msgSend(v13, "setQueue:", *(_QWORD *)(a1 + 32));
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "aggregateMetadata"));
    objc_msgSend(v13, "setMetadata:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "followUpOptions"));
    objc_msgSend(v13, "setFollowUpOptions:", v9);

    objc_msgSend(v13, "setStatus:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputs"));
    objc_msgSend(v13, "setRetriesRemaining:", objc_msgSend(v10, "retries"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "consentHandles"));
    objc_msgSend(v13, "setConsentHandles:", v12);

  }
  else
  {
    objc_msgSend(v13, "setStatus:", 1);
  }

}

void sub_100005AB8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "metadata"));
  objc_msgSend(v2, "finishWithStatusCode:metadata:", &off_1000084B8, v3);

}

void sub_100006088(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000060AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Enhanced logging already running, cannot enroll", v2, v3, v4, v5, v6);
  sub_100006098();
}

void sub_1000060D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Enhanced logging not already running, cannot unenroll", v2, v3, v4, v5, v6);
  sub_100006098();
}

void sub_100006104(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Enhanced logging already queued for: %@", (uint8_t *)&v4, 0xCu);

}

void sub_100006198()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Attempted to commit an empty queue to enhanced logging state", v2, v3, v4, v5, v6);
  sub_100006098();
}

void sub_1000061C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Could not open Apple Account Store", v2, v3, v4, v5, v6);
  sub_100006098();
}

void sub_1000061F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Could not find primary Apple Account", v2, v3, v4, v5, v6);
  sub_100006098();
}

void sub_10000621C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A0();
  sub_100006088((void *)&_mh_execute_header, v0, v1, "Could not find primary Apple Account username", v2, v3, v4, v5, v6);
  sub_100006098();
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_addAppleAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAppleAccount:");
}

id objc_msgSend_addDeviceSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDeviceSerialNumber:");
}

id objc_msgSend_addDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDeviceType:");
}

id objc_msgSend_addEnrollmentTicketNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEnrollmentTicketNumber:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPayload:");
}

id objc_msgSend_addServerSuppliedMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addServerSuppliedMetadata:");
}

id objc_msgSend_aggregateMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregateMetadata");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "command");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_consentHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consentHandles");
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

id objc_msgSend_createQueueEntryInputDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createQueueEntryInputDictionary:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dk_arrayFromKey_types_maxLength_defaultValue_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:");
}

id objc_msgSend_dk_dictionaryFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_dictionaryFromKey_limitedToKeys_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromKey:limitedToKeys:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_findEntryForParameterName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findEntryForParameterName:");
}

id objc_msgSend_finishWithStatusCode_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithStatusCode:metadata:");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_followUpOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "followUpOptions");
}

id objc_msgSend_formatNewQueueEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatNewQueueEntries:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithType_typeName_parameters_executeAfterDuration_retry_platform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:typeName:parameters:executeAfterDuration:retry:platform:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameterPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameterPayloads");
}

id objc_msgSend_platformAvailability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformAvailability");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_refreshWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshWithCompletion:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_retries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retries");
}

id objc_msgSend_retry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retry");
}

id objc_msgSend_setCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommand:");
}

id objc_msgSend_setConsentHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConsentHandles:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFollowUpOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFollowUpOptions:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParameterPayloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParameterPayloads:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRetries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetries:");
}

id objc_msgSend_setRetriesRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetriesRemaining:");
}

id objc_msgSend_setSpecificationPayloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecificationPayloads:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshot");
}

id objc_msgSend_specificationPayloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specificationPayloads");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_transactionWithBlock_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionWithBlock:completion:");
}

id objc_msgSend_updateEnhancedLoggingStateWithNewQueueEntries_commit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEnhancedLoggingStateWithNewQueueEntries:commit:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}
