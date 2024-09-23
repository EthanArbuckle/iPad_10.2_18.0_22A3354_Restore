void sub_1000030E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003138(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003148(uint64_t a1)
{

}

id sub_100003150(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  _QWORD v32[5];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("101"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formatterWithType:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v9));

      v32[0] = v10;
      v31[0] = CFSTR("timestamp");
      v31[1] = CFSTR("thermalLevel");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "integerFromFieldAtIndex:", 3)));
      v32[1] = v11;
      v31[2] = CFSTR("thermalPressureLevel");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "integerFromFieldAtIndex:", 4)));
      v32[2] = v12;
      v31[3] = CFSTR("coldPressureLevel");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "integerFromFieldAtIndex:", 5)));
      v32[3] = v13;
      v31[4] = CFSTR("lowTempCPUPerformanceCap");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "integerFromFieldAtIndex:", 6)));
      v32[4] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 5));

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc((Class)DSThermalLogLine), "initWithLogLine:", v3);
      v16 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      objc_msgSend(v10, "maxTemp");
      if (v16 >= v17)
        v17 = v16;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v17;
      if (objc_msgSend(v10, "isTrapEvent"))
      {
        if (objc_msgSend(v10, "isTrapEntry"))
        {
          v18 = *(void **)(a1 + 32);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reason"));
          objc_msgSend(v18, "addTemperatureWarningWithReason:toDictionary:", v19, *(_QWORD *)(a1 + 48));

          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          if (*(_QWORD *)(v20 + 40))
          {
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 2;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
            objc_msgSend(v21, "setStatusCode:", &off_100004368);

            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          }
          v22 = v10;
          v23 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v22;
        }
        else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                             + 40), "date"));
          objc_msgSend(v24, "timeIntervalSinceDate:", v25);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = (int)(v26
                                                                            + (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                             + 24));

          v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v23 = *(void **)(v27 + 40);
          *(_QWORD *)(v27 + 40) = 0;
        }
        else
        {
          v28 = *(void **)(a1 + 32);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reason"));
          objc_msgSend(v28, "addTemperatureWarningWithReason:toDictionary:", v29, *(_QWORD *)(a1 + 48));

          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 2;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
          objc_msgSend(v23, "setStatusCode:", &off_100004368);
        }

      }
    }

  }
  return v4;
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTemperatureWarningWithReason_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTemperatureWarningWithReason:toDictionary:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateLogLinesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithBlock:");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_initWithLogIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogIDs:");
}

id objc_msgSend_initWithLogLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogLine:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerFromFieldAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerFromFieldAtIndex:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTrapEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrapEntry");
}

id objc_msgSend_isTrapEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrapEvent");
}

id objc_msgSend_maxTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxTemp");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
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

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
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

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}
