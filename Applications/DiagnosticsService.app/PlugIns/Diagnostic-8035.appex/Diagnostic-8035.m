void sub_100002724(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  const __CFString *v26;
  NSMutableArray *v27;
  _BYTE v28[128];

  v25 = 0;
  v20 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameras"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
        break;
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("position")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calibrateCameraType:position:statusCode:", v8, objc_msgSend(v9, "integerValue"), &v25));

      if (v10)
        -[NSMutableArray addObject:](v20, "addObject:", v10);
      v11 = v25;

      if (v11)
        break;
      if (v3 == (id)++v5)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "statusCode"));
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != (id)-900)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v25));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    objc_msgSend(v16, "setStatusCode:", v15);

    v26 = CFSTR("results");
    v27 = v20;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    objc_msgSend(v18, "setData:", v17);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);

}

void sub_100002DD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_100002EBC(id a1, id a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("position")));

  if (!v3)
    goto LABEL_8;
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    goto LABEL_8;
  v6 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x50 && v4)
  {
    v7 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0 && (unint64_t)objc_msgSend(v4, "integerValue") <= 2)
    {
      v6 = (uint64_t)objc_msgSend(v4, "integerValue") >= 0;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

void sub_10000301C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ not found on this device.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

void sub_10000307C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ results were nil on a supported APS diagnostic device.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

void sub_1000030DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ results did not have a result value.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

void sub_10000313C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ results did not have a status code value.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

void sub_10000319C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ calibration failed with unknown error.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

void sub_1000031FC()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100002DF0();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%@ calibration failed with %ld.", v2, 0x16u);
  sub_100002DE8();
}

void sub_100003278()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100002DF0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Results: %@", v1, 0xCu);
  sub_100002DE8();
}

void sub_1000032E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002DF0();
  sub_100002DD8((void *)&_mh_execute_header, v0, v1, "%@ APS not supported on this device.", v2, v3, v4, v5, v6);
  sub_100002DE8();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_calibrateCameraType_position_statusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calibrateCameraType:position:statusCode:");
}

id objc_msgSend_cameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameras");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultDeviceWithDeviceType_mediaType_position_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDeviceWithDeviceType:mediaType:position:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:");
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

id objc_msgSend_isDiagnosticsTestSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiagnosticsTestSupported:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_runDiagnosticsWithTestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runDiagnosticsWithTestType:");
}

id objc_msgSend_setCameras_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameras:");
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

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}
