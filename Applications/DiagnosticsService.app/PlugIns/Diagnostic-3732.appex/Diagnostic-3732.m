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

void sub_100003560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000035B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000035C0(uint64_t a1)
{

}

id sub_1000035C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((v4 & 1) == 0)
  {
    v5 = objc_msgSend(objc_alloc((Class)DSUsageLogLine), "initWithLogLine:", v3);
    if ((int)objc_msgSend(v5, "standbyTime") >= 1 && (int)objc_msgSend(v5, "usageTime") <= 1209599)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    if (!objc_msgSend(v5, "isOnPower"))
      goto LABEL_14;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(v6 + 40))
    {
      v7 = objc_msgSend(v5, "usageTime");
      if (v7 <= (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "usageTime"))
      {
LABEL_10:
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (*(_QWORD *)(v8 + 40))
        {
          v9 = objc_msgSend(v5, "standbyTime");
          if (v9 <= (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "standbyTime"))
            goto LABEL_14;
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        objc_storeStrong((id *)(v8 + 40), v5);
LABEL_14:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
        objc_msgSend(v10, "timeIntervalSinceNow");
        v12 = v11;

        if (v12 >= 300.0)
        {
          if (objc_msgSend(v5, "isReset"))
          {
            v13 = *(_QWORD *)(a1 + 64);
LABEL_19:
            objc_storeStrong((id *)(*(_QWORD *)(v13 + 8) + 40), v5);
            goto LABEL_20;
          }
          if (objc_msgSend(v5, "isOnPower"))
          {
            v13 = *(_QWORD *)(a1 + 72);
            goto LABEL_19;
          }
        }
LABEL_20:

        goto LABEL_21;
      }
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    objc_storeStrong((id *)(v6 + 40), v5);
    goto LABEL_10;
  }
LABEL_21:

  return v4;
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevel");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
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

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isOnPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOnPower");
}

id objc_msgSend_isReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReset");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_parseLogsWithCollector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLogsWithCollector:");
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

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_standbyTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standbyTime");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_usageTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageTime");
}
