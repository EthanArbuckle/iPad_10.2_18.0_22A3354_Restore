BOOL sub_100001F48(id a1, id a2)
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

BOOL sub_1000020B0(id a1, id a2)
{
  id v2;
  uint64_t v3;
  BOOL v4;

  v2 = a2;
  v3 = objc_opt_class(NSString);
  v4 = (objc_opt_isKindOfClass(v2, v3) & 1) == 0 || (unint64_t)objc_msgSend(v2, "length") < 0x101;

  return v4;
}

void sub_1000021C4(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _UNKNOWN **v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8[0] = &off_100004448;
  v8[1] = &off_100004460;
  v9[0] = CFSTR("eventDate");
  v9[1] = CFSTR("eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, CFSTR("AnyLogLine"));

  v6 = &off_100004478;
  v7 = CFSTR("uuidReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v3, CFSTR("210"));

  v4 = objc_msgSend(v1, "copy");
  v5 = (void *)qword_100008938;
  qword_100008938 = (uint64_t)v4;

}

void sub_1000026B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000026DC(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v5 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fields"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" ")));

    if ((objc_msgSend(a1[4], "containsObject:", v7) & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "inputs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logIds"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
        if (!v12 || objc_msgSend(a1[5], "passesFilter:", v12))
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "processLine:", v3));
          objc_msgSend(a1[6], "addObject:", v13);
          objc_msgSend(a1[4], "addObject:", v7);

          v12 = (void *)v13;
        }

      }
    }

  }
  return v5;
}

id objc_msgSend__applyAppBundleFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyAppBundleFilters:");
}

id objc_msgSend__applylogLineTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applylogLineTypes:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_applicationFilters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationFilters");
}

id objc_msgSend_applicationPredicates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationPredicates");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultLogLineLabelMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultLogLineLabelMap");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromKey_types_maxLength_defaultValue_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:");
}

id objc_msgSend_dk_dictionaryFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:");
}

id objc_msgSend_enumerateLogLinesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithBlock:");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
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

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_logIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logIds");
}

id objc_msgSend_logLineLabelForIndex_andLogLineType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logLineLabelForIndex:andLogLineType:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parseLogsWithCollector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLogsWithCollector:");
}

id objc_msgSend_passesFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passesFilter:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_processLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processLine:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resultLabelFilters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultLabelFilters");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setApplicationFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationFilters:");
}

id objc_msgSend_setApplicationPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationPredicates:");
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

id objc_msgSend_setLogIds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogIds:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setResultLabelFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultLabelFilters:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}
