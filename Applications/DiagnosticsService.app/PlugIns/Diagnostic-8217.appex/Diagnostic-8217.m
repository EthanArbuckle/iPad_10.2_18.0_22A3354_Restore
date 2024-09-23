id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

void sub_100002CCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100002CD8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100002CCC((void *)&_mh_execute_header, a2, a3, "Encountered error: %@.", (uint8_t *)&v3);
}

void sub_100002D44(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v6 = 138412290;
  v7 = v4;
  sub_100002CCC((void *)&_mh_execute_header, a2, v5, "Unrecognized camera sync group of type %@", (uint8_t *)&v6);

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

id objc_msgSend_auxiliaryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auxiliaryData");
}

id objc_msgSend_availableDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableDiagnostics");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
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

id objc_msgSend_defaultLab(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultLab");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findRequestedHardwareDiagnostic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findRequestedHardwareDiagnostic:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_processResultsForReport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processResultsForReport:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_runRequestedHardwareDiagnostic_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRequestedHardwareDiagnostic:error:");
}

id objc_msgSend_runWithParameters_host_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithParameters:host:error:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
