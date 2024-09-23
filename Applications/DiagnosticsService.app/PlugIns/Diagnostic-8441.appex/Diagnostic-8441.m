void sub_1000037D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session getAssesment failed with error %@.", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    v11 = v10;
    v12 = &off_100004120;
LABEL_5:
    objc_msgSend(v10, "setStatusCode:", v12);
    v13 = 1;
    goto LABEL_10;
  }
  v14 = DiagnosticLogHandleForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session returns no assesment.", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    v11 = v10;
    v12 = &off_100004138;
    goto LABEL_5;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session getAssesment successful.", buf, 2u);
  }

  v19 = CFSTR("ArmandValidationObject");
  v20 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v18, "setData:", v17);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v11, "setStatusCode:", &off_100004150);
  v13 = 0;
LABEL_10:

  objc_msgSend(*(id *)(a1 + 40), "provideFeedbackOnPayloadOutcome:", v13);
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);

}

void sub_100003A54(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cancelling [%@]", (uint8_t *)&v4, 0xCu);

}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_getAssessment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAssessment:");
}

id objc_msgSend_initWithServiceIdentifier_forDSIDType_andLocationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_provideFeedbackOnPayloadOutcome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideFeedbackOnPayloadOutcome:");
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
