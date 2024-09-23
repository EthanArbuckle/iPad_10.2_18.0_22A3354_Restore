void sub_21A213404(uint64_t a1, const char *a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  void *v9;
  id WeakRetained;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void (**v22)(id, _QWORD);

  v8 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v8 >= 2)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Received unexpected N: %ld responses from XPC."), a6, a7, a3, a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CreateDiagnosticReport();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend__removeBox_(WeakRetained, v11, *(_QWORD *)(a1 + 32), v12, v13, v14, v15);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
  v22 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v22[2](v22, 0);

}

void sub_21A214120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_21A21441C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A2180CC(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_handleCompletionOfRequest_(WeakRetained, v2, *(_QWORD *)(a1 + 32), v3, v4, v5, v6);

}

void sub_21A218108()
{
  APControllerRequesterCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(APControllerRequesterCoordinator);
  v1 = (void *)qword_253D8AFC8;
  qword_253D8AFC8 = (uint64_t)v0;

}

void sub_21A218130()
{
  APRequestCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(APRequestCoordinator);
  v1 = (void *)qword_253D8AEB8;
  qword_253D8AEB8 = (uint64_t)v0;

}

void sub_21A21AA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21A21AA80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A21AA90(uint64_t a1)
{

}

void sub_21A21AA98(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;

  v5 = a2;
  objc_msgSend_identifier(v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend_isEqual_(v12, v13, *(_QWORD *)(a1 + 32), v14, v15, v16, v17);

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v5;

}

uint64_t sub_21A21AC60(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_21A21AD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21A21AD8C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A21AD9C(uint64_t a1)
{

}

void sub_21A21ADA4(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a4, (uint64_t)CFSTR("Received error from proxyURL. %@"), a6, a7, a1, a2, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();

}

void sub_21A21ADF0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21A21AE00(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a4, (uint64_t)CFSTR("Received error from proxyURL. %@"), a6, a7, a1, a2, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();

}

void sub_21A21B2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A21B2D8(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend_handleCompletionOfRequest_(WeakRetained, v3, *(_QWORD *)(a1 + 32), v4, v5, v6, v7);

}

void sub_21A21C5D4()
{
  void *v0;

  v0 = (void *)qword_253D8AE90;
  qword_253D8AE90 = (uint64_t)CFSTR("adprivacyd");

}

void sub_21A21C62C()
{
  void *v0;

  v0 = (void *)qword_253D8AEA0;
  qword_253D8AEA0 = (uint64_t)CFSTR("1");

}

void sub_21A21C8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A21C8D4(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_BOOLValue(a2, v5, v6, v7, v8, v10, v11);
  }
  else
  {
    APLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v9;
      v13 = v15;
      _os_log_impl(&dword_21A211000, v12, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'disablePromotedContentDaemonSubsequentAdsFetch' value from the bag. Error: %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_21A21CA98(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13 = v6;
  if (!a2 || v6)
  {
    APLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v13;
      v17 = v19;
      _os_log_impl(&dword_21A211000, v16, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'disablePromotedContentDaemonSubsequentAdsFetch' value from the bag. Error: %{public}@", (uint8_t *)&v18, 0x16u);

    }
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend_BOOLValue(a2, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(_QWORD, uint64_t, void *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14, v13, v15);

}

void sub_21A21CC64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v12 = a4;
  if (a2)
    objc_msgSend_BOOLValue(a2, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_21A21CEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21A21CF04(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A21CF14(uint64_t a1)
{

}

void sub_21A21CF1C(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a4, (uint64_t)CFSTR("Received error from proxyURL. %@"), a6, a7, a1, a2, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();

}

void sub_21A21CF68(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21A21D0B0(double a1, double a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a4, (uint64_t)CFSTR("Received error during prewarming. %@"), a6, a7, a1, a2, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash();

}

void sub_21A21D20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A21D230(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void (**v20)(id, id, id);

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend__removeBox_(WeakRetained, v9, *(_QWORD *)(a1 + 32), v10, v11, v12, v13);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v14, v15, v16, v17, v18, v19);
  v20 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v20[2](v20, v7, v6);

}

void sub_21A21D380(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21A21D39C(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void (**v17)(id, id);

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend__removeBox_(WeakRetained, v6, *(_QWORD *)(a1 + 32), v7, v8, v9, v10);

  objc_msgSend_completionHandler(*(void **)(a1 + 32), v11, v12, v13, v14, v15, v16);
  v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v17[2](v17, v4);

}

void sub_21A21E730(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  APLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v5;
      v9 = "Received error from signatureForData. %{public}@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_21A211000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    v9 = "Received response from signatureForData.";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
}

void sub_21A21E928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21A21E940(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A21E950(uint64_t a1)
{

}

void sub_21A21E958(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  APLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_21A211000, v3, OS_LOG_TYPE_ERROR, "Received error from signatureForData. %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_21A21EA04(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    APLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21A211000, v7, OS_LOG_TYPE_ERROR, "Received error from signatureForData. %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void sub_21A21EB9C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  APLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v5;
      v9 = "Received error from signatureForData. %{public}@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_21A211000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    v9 = "Received response from signatureForData.";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
}

void type metadata accessor for APMetricPurposeType(uint64_t a1)
{
  sub_21A21EE08(a1, &qword_2550CFEC0);
}

void type metadata accessor for APMetricOptions(uint64_t a1)
{
  sub_21A21EE08(a1, &qword_2550CFEC8);
}

void sub_21A21EE08(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21A21EE4C()
{
  sub_21A224258();
  sub_21A224264();
  return sub_21A224270();
}

uint64_t sub_21A21EE90()
{
  return sub_21A224264();
}

uint64_t sub_21A21EEB8()
{
  sub_21A224258();
  sub_21A224264();
  return sub_21A224270();
}

_QWORD *sub_21A21EEF8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21A21EF08(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_21A21EF18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550CFED0;
  if (!qword_2550CFED0)
  {
    type metadata accessor for APMetricPurposeType(255);
    result = MEMORY[0x22073D9B4](&unk_21A226724, v1);
    atomic_store(result, (unint64_t *)&qword_2550CFED0);
  }
  return result;
}

BOOL sub_21A21EF60(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t EventSource.init(bundleID:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v19;
  uint64_t v20;

  v20 = a2;
  type metadata accessor for EventSource();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (uint64_t *)((char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_21A224150();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - v10;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v19 - v10, a1, v5);
  sub_21A224144();
  sub_21A21F1F8();
  v12 = sub_21A224180();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  if ((v12 & 1) != 0)
  {
    v13(v11, v5);
    v13(a1, v5);
    v14 = 978;
  }
  else
  {
    sub_21A22412C();
    v15 = sub_21A224180();
    v13(v9, v5);
    if ((v15 & 1) != 0)
    {
      v13(v11, v5);
      v13(a1, v5);
      v14 = 976;
    }
    else
    {
      sub_21A224114();
      v16 = sub_21A224180();
      v13(v9, v5);
      if ((v16 & 1) != 0)
      {
        v13(v11, v5);
        v13(a1, v5);
        v14 = 975;
      }
      else
      {
        sub_21A224138();
        v17 = sub_21A224180();
        v13(v9, v5);
        v13(v11, v5);
        if ((v17 & 1) == 0)
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v20, a1, v5);
          return swift_storeEnumTagMultiPayload();
        }
        v13(a1, v5);
        v14 = 977;
      }
    }
  }
  *v4 = v14;
  swift_storeEnumTagMultiPayload();
  return sub_21A21F240((uint64_t)v4, v20);
}

unint64_t sub_21A21F1F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550CFF40;
  if (!qword_2550CFF40)
  {
    v1 = sub_21A224150();
    result = MEMORY[0x22073D9B4](MEMORY[0x24BDFD430], v1);
    atomic_store(result, (unint64_t *)&qword_2550CFF40);
  }
  return result;
}

uint64_t sub_21A21F240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t EventCapsule.event.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t EventCapsule.purpose.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 28));
}

uint64_t EventCapsule.options.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 32));
}

uint64_t EventCapsule.init(event:purpose:options:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a5, a1, a4);
  result = type metadata accessor for EventCapsule(0, a4, v9, v10);
  *(_QWORD *)(a5 + *(int *)(result + 28)) = a2;
  *(_QWORD *)(a5 + *(int *)(result + 32)) = a3;
  return result;
}

uint64_t type metadata accessor for EventCapsule(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A21FA54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EventCapsule);
}

BOOL static EventCapsule<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((sub_21A224180() & 1) != 0
    && (v8 = type metadata accessor for EventCapsule(0, a3, v6, v7),
        *(_QWORD *)(a1 + *(int *)(v8 + 28)) == *(_QWORD *)(a2 + *(int *)(v8 + 28))))
  {
    return *(_QWORD *)(a1 + *(int *)(v8 + 32)) == *(_QWORD *)(a2 + *(int *)(v8 + 32));
  }
  else
  {
    return 0;
  }
}

BOOL sub_21A21F394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static EventCapsule<A>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16));
}

uint64_t EventCapsule.debugDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_21A2241F8();
  sub_21A224198();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  sub_21A22418C();
  sub_21A224198();
  swift_bridgeObjectRelease();
  sub_21A224198();
  v9 = *(_QWORD *)(v1 + *(int *)(a1 + 28));
  sub_21A224240();
  sub_21A224198();
  swift_bridgeObjectRelease();
  sub_21A224198();
  v9 = *(_QWORD *)(v1 + *(int *)(a1 + 32));
  type metadata accessor for APMetricOptions(0);
  sub_21A22421C();
  return v10;
}

uint64_t dispatch thunk of EventPipeline.deliverEvent(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_21A21F52C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21A21F534()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21A21F5B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v10 = *v11;
    *(_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_21A21F678(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_21A21F688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21A21F6F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21A21F760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21A21F7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21A21F838(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_21A21F8B0 + 4 * byte_21A226790[v8]))();
}

void sub_21A21F908(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_21A21F9F8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_21A21FA00(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x21A21FA08);
}

void sub_21A21FA24()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_21A21FA2C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_21A21FA34(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x21A21FA3CLL);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_21A21FA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22073D978](a1, v6, a5);
}

void static EventSourceID.appStore.getter(_QWORD *a1@<X8>)
{
  *a1 = 978;
}

void static EventSourceID.news.getter(_QWORD *a1@<X8>)
{
  *a1 = 976;
}

void static EventSourceID.promotedContentDaemon.getter(_QWORD *a1@<X8>)
{
  *a1 = 975;
}

void static EventSourceID.stocks.getter(_QWORD *a1@<X8>)
{
  *a1 = 977;
}

const char *EventCollectionFeatureFlags.domain.getter()
{
  return "PromotedContent";
}

const char *EventCollectionFeatureFlags.feature.getter()
{
  return "NextGenerationEventCollection";
}

uint64_t static EventCollectionFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t EventCollectionFeatureFlags.hash(into:)()
{
  return sub_21A224264();
}

uint64_t EventCollectionFeatureFlags.hashValue.getter()
{
  sub_21A224258();
  sub_21A224264();
  return sub_21A224270();
}

uint64_t sub_21A21FB44()
{
  return 1;
}

uint64_t sub_21A21FB4C()
{
  sub_21A224258();
  sub_21A224264();
  return sub_21A224270();
}

uint64_t sub_21A21FB8C()
{
  return sub_21A224264();
}

uint64_t sub_21A21FBB0()
{
  sub_21A224258();
  sub_21A224264();
  return sub_21A224270();
}

unint64_t sub_21A21FBF0()
{
  unint64_t result;

  result = qword_2550CFF48;
  if (!qword_2550CFF48)
  {
    result = MEMORY[0x22073D9B4](&protocol conformance descriptor for EventCollectionFeatureFlags, &type metadata for EventCollectionFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2550CFF48);
  }
  return result;
}

const char *sub_21A21FC34()
{
  return "PromotedContent";
}

const char *sub_21A21FC48()
{
  return "NextGenerationEventCollection";
}

uint64_t getEnumTagSinglePayload for EventCollectionFeatureFlags(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for EventCollectionFeatureFlags(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_21A21FCF4 + 4 * byte_21A226860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21A21FD14 + 4 * byte_21A226865[v4]))();
}

_BYTE *sub_21A21FCF4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21A21FD14(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21A21FD1C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21A21FD24(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21A21FD2C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21A21FD34(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21A21FD40()
{
  return 0;
}

ValueMetadata *type metadata accessor for EventCollectionFeatureFlags()
{
  return &type metadata for EventCollectionFeatureFlags;
}

uint64_t Handle.primary.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.secondary.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

AdPlatformsCommon::Handle __swiftcall Handle.init(_:)(Swift::String a1)
{
  uint64_t v1;
  AdPlatformsCommon::Handle result;

  *(Swift::String *)v1 = a1;
  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 24) = 1;
  result.primary = a1;
  return result;
}

AdPlatformsCommon::Handle __swiftcall Handle.init(primary:secondary:)(Swift::String primary, Swift::Int_optional secondary)
{
  uint64_t v2;
  AdPlatformsCommon::Handle result;

  *(Swift::String *)v2 = primary;
  *(_QWORD *)(v2 + 16) = secondary.value;
  *(_BYTE *)(v2 + 24) = secondary.is_nil;
  result.primary = primary;
  result.secondary = secondary;
  return result;
}

uint64_t _s17AdPlatformsCommon6HandleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  BOOL v6;
  char v7;
  uint64_t result;
  char v9;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v6 || (v7 = sub_21A22424C(), result = 0, (v7 & 1) != 0))
  {
    if ((v3 & 1) != 0)
    {
      if ((v5 & 1) == 0)
        return 0;
    }
    else
    {
      if (v2 == v4)
        v9 = v5;
      else
        v9 = 1;
      if ((v9 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Handle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Handle()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 initializeWithTake for Handle(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Handle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Handle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Handle()
{
  return &type metadata for Handle;
}

uint64_t TracingEventPipe.__allocating_init(source:connecting:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_21A220080(a3, v6 + 32);
  return v6;
}

uint64_t TracingEventPipe.init(source:connecting:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  sub_21A220080(a3, v3 + 32);
  return v3;
}

uint64_t sub_21A220080(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21A220098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = v4;
  v7 = type metadata accessor for EventCapsule(0, *(_QWORD *)(*v4 + 80), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - v11;
  v13 = sub_21A224174();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A22415C();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17(v12, a1, v7);
  swift_retain();
  v18 = sub_21A224168();
  v19 = sub_21A2241B0();
  v38 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v36 = v14;
    v21 = v20;
    v34 = swift_slowAlloc();
    v41 = v34;
    *(_DWORD *)v21 = 136446466;
    v37 = a1;
    v35 = v13;
    v33 = v18;
    v22 = v5[2];
    v23 = v5[3];
    swift_bridgeObjectRetain();
    v40 = sub_21A220418(v22, v23, &v41);
    sub_21A2241E0();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    v17(v39, (uint64_t)v12, v7);
    v24 = sub_21A22418C();
    v40 = sub_21A220418(v24, v25, &v41);
    a1 = v37;
    sub_21A2241E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    v26 = v33;
    _os_log_impl(&dword_21A211000, v33, (os_log_type_t)v38, "%{public}s: delivering event %{public}s", (uint8_t *)v21, 0x16u);
    v27 = v34;
    swift_arrayDestroy();
    MEMORY[0x22073DA20](v27, -1, -1);
    MEMORY[0x22073DA20](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v35);
  }
  else
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  v28 = v5 + 4;
  v29 = v5[7];
  v30 = v5[8];
  sub_21A2203F4(v28, v29);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(a1, v29, v30);
}

uint64_t TracingEventPipe.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21A220AD0(v0 + 32);
  return v0;
}

uint64_t TracingEventPipe.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21A220AD0(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t sub_21A2203D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A220098(a1, a2, a3, a4);
}

_QWORD *sub_21A2203F4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21A220418(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21A2204E8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21A220AF0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21A220AF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_21A220AD0((uint64_t)v12);
  return v7;
}

uint64_t sub_21A2204E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21A2241EC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21A2206A0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_21A224210();
  if (!v8)
  {
    sub_21A224228();
    __break(1u);
LABEL_17:
    result = sub_21A224234();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21A2206A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21A220734(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21A22090C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21A22090C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21A220734(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21A2208A8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21A224204();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21A224228();
      __break(1u);
LABEL_10:
      v2 = sub_21A2241A4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21A224234();
    __break(1u);
LABEL_14:
    result = sub_21A224228();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21A2208A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_21A220B2C(&qword_2550CFFE8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21A22090C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_21A220B2C(&qword_2550CFFE8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21A224234();
  __break(1u);
  return result;
}

uint64_t sub_21A220A5C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TracingEventPipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A21FA54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TracingEventPipe);
}

uint64_t method lookup function for TracingEventPipe()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TracingEventPipe.__allocating_init(source:connecting:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TracingEventPipe.deliverEvent(in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_21A220AD0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21A220AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21A220B2C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22073D99C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t ClientEvent.handle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t ClientEvent.order.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t ClientEvent.trace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 28), a1, &qword_2550CFFF0);
}

uint64_t type metadata accessor for ClientEvent()
{
  uint64_t result;

  result = qword_253D8AD80;
  if (!qword_253D8AD80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ClientEvent.branch.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 32), a1, &qword_2550CFFF8);
}

uint64_t ClientEvent.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 36), a1, &qword_2550CFFF8);
}

uint64_t ClientEvent.relay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 40), a1, &qword_2550D0000);
}

uint64_t ClientEvent.properties.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 44), a1, &qword_2550D0000);
}

uint64_t ClientEvent.internalProperties.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ClientEvent();
  return sub_21A220D38(v1 + *(int *)(v3 + 48), a1, qword_2550D0008);
}

uint64_t sub_21A220D38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_21A220B2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t ClientEvent.init(kind:handle:order:trace:branch:environment:relay:properties:internalProperties:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  __int128 v16;
  uint64_t v17;
  char v18;
  int *v19;

  v16 = *a2;
  v17 = *((_QWORD *)a2 + 2);
  v18 = *((_BYTE *)a2 + 24);
  *(_QWORD *)a9 = a1;
  *(_OWORD *)(a9 + 8) = v16;
  *(_QWORD *)(a9 + 24) = v17;
  *(_BYTE *)(a9 + 32) = v18;
  *(_QWORD *)(a9 + 40) = a3;
  v19 = (int *)type metadata accessor for ClientEvent();
  sub_21A220E84(a4, a9 + v19[7], &qword_2550CFFF0);
  sub_21A220E84(a5, a9 + v19[8], &qword_2550CFFF8);
  sub_21A220E84(a6, a9 + v19[9], &qword_2550CFFF8);
  sub_21A220E84(a7, a9 + v19[10], &qword_2550D0000);
  sub_21A220E84(a8, a9 + v19[11], &qword_2550D0000);
  return sub_21A220E84(a10, a9 + v19[12], qword_2550D0008);
}

uint64_t sub_21A220E84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_21A220B2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ClientEvent.filteringKind.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t _s17AdPlatformsCommon11ClientEventV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  char *v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int (*v100)(uint64_t, uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char v119;
  void (*v120)(char *, uint64_t);
  char v121;
  char v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;

  v4 = sub_21A220B2C(&qword_253D8AD30);
  v5 = *(_QWORD *)(v4 - 8);
  v131 = v4;
  v132 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v125 = (char *)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A220B2C(&qword_2550CFFF8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v124 = (uint64_t)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v126 = (uint64_t)&v123 - v10;
  v130 = sub_21A220B2C(&qword_2550D0038);
  v11 = MEMORY[0x24BDAC7A8](v130);
  v127 = (uint64_t)&v123 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v133 = (uint64_t)&v123 - v13;
  v135 = sub_21A224108();
  v137 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v128 = (char *)&v123 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21A220B2C(&qword_2550CFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v129 = (uint64_t)&v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_21A220B2C(&qword_2550D0040);
  MEMORY[0x24BDAC7A8](v134);
  v138 = (uint64_t)&v123 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = (int *)type metadata accessor for ClientEvent();
  v18 = MEMORY[0x24BDAC7A8](v136);
  v139 = (char *)&v123 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v144 = (uint64_t)&v123 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v143 = (char *)&v123 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v142 = (char *)&v123 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v141 = (uint64_t)&v123 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v140 = (uint64_t)&v123 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v145 = (uint64_t)&v123 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v146 = (uint64_t)&v123 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v147 = (uint64_t)&v123 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v148 = (uint64_t)&v123 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v123 - v39;
  v41 = MEMORY[0x24BDAC7A8](v38);
  v149 = (uint64_t)&v123 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v45 = (char *)&v123 - v44;
  v46 = MEMORY[0x24BDAC7A8](v43);
  v48 = (char *)&v123 - v47;
  v49 = MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&v123 - v50;
  MEMORY[0x24BDAC7A8](v49);
  v53 = (char *)&v123 - v52;
  v54 = *a1;
  v55 = *a2;
  v56 = (uint64_t)a1;
  sub_21A2235BC((uint64_t)a1, (uint64_t)&v123 - v52);
  v57 = (uint64_t)a2;
  sub_21A2235BC((uint64_t)a2, (uint64_t)v51);
  if (v54 != v55)
    goto LABEL_7;
  v58 = *((_QWORD *)v53 + 3);
  v59 = v53[32];
  v60 = *((_QWORD *)v51 + 3);
  v61 = v51[32];
  if (*((_QWORD *)v53 + 1) != *((_QWORD *)v51 + 1) || *((_QWORD *)v53 + 2) != *((_QWORD *)v51 + 2))
  {
    v123 = v40;
    v62 = v60;
    v63 = sub_21A22424C();
    v60 = v62;
    v40 = v123;
    if ((v63 & 1) == 0)
      goto LABEL_7;
  }
  if ((v59 & 1) != 0)
  {
    if (!v61)
    {
LABEL_7:
      sub_21A223600((uint64_t)v51);
      sub_21A223600((uint64_t)v53);
      sub_21A2235BC(v56, (uint64_t)v48);
      v64 = v57;
      sub_21A2235BC(v57, (uint64_t)v45);
      sub_21A223600((uint64_t)v45);
      sub_21A223600((uint64_t)v48);
      v65 = v149;
      sub_21A2235BC(v56, v149);
      sub_21A2235BC(v64, (uint64_t)v40);
LABEL_8:
      sub_21A223600((uint64_t)v40);
      sub_21A223600(v65);
      v66 = (uint64_t)v139;
      v68 = v145;
      v67 = v146;
      v70 = v147;
      v69 = v148;
LABEL_9:
      sub_21A2235BC(v56, v69);
      sub_21A2235BC(v64, v70);
LABEL_10:
      sub_21A223600(v70);
      sub_21A223600(v69);
LABEL_11:
      sub_21A2235BC(v56, v67);
      sub_21A2235BC(v64, v68);
LABEL_12:
      sub_21A223600(v68);
      sub_21A223600(v67);
      v72 = (uint64_t)v142;
      v71 = (uint64_t)v143;
      v74 = v140;
      v73 = v141;
LABEL_13:
      sub_21A2235BC(v56, v74);
      sub_21A2235BC(v64, v73);
LABEL_14:
      sub_21A223600(v73);
      sub_21A223600(v74);
      sub_21A2235BC(v56, v72);
      sub_21A2235BC(v64, v71);
LABEL_15:
      sub_21A223600(v71);
      sub_21A223600(v72);
      v75 = v144;
      sub_21A2235BC(v56, v144);
      sub_21A2235BC(v64, v66);
      goto LABEL_16;
    }
  }
  else
  {
    if (v58 == v60)
      v78 = v61;
    else
      v78 = 1;
    if ((v78 & 1) != 0)
      goto LABEL_7;
  }
  sub_21A223600((uint64_t)v51);
  sub_21A223600((uint64_t)v53);
  sub_21A2235BC(v56, (uint64_t)v48);
  v64 = v57;
  sub_21A2235BC(v57, (uint64_t)v45);
  v79 = *((_QWORD *)v48 + 5);
  sub_21A223600((uint64_t)v48);
  v80 = *((_QWORD *)v45 + 5);
  sub_21A223600((uint64_t)v45);
  v65 = v149;
  sub_21A2235BC(v56, v149);
  sub_21A2235BC(v64, (uint64_t)v40);
  if (v79 != v80)
    goto LABEL_8;
  v81 = v136[7];
  v82 = (uint64_t)&v40[v81];
  v83 = v138;
  v84 = v138 + *(int *)(v134 + 48);
  sub_21A220D38(v65 + v81, v138, &qword_2550CFFF0);
  sub_21A220D38(v82, v84, &qword_2550CFFF0);
  v85 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 48);
  v86 = v135;
  if (v85(v83, 1, v135) == 1)
  {
    sub_21A223600((uint64_t)v40);
    sub_21A223600(v65);
    v87 = v85(v84, 1, v86);
    v68 = v145;
    v67 = v146;
    v88 = v133;
    v70 = v147;
    if (v87 == 1)
    {
      sub_21A223688(v138, &qword_2550CFFF0);
      v69 = v148;
      sub_21A2235BC(v56, v148);
      sub_21A2235BC(v64, v70);
      v66 = (uint64_t)v139;
      goto LABEL_30;
    }
LABEL_28:
    sub_21A223688(v138, &qword_2550D0040);
    v66 = (uint64_t)v139;
    v69 = v148;
    goto LABEL_9;
  }
  v89 = v129;
  sub_21A220D38(v83, v129, &qword_2550CFFF0);
  v90 = v85(v84, 1, v86);
  v68 = v145;
  v70 = v147;
  if (v90 == 1)
  {
    sub_21A223600((uint64_t)v40);
    sub_21A223600(v149);
    (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v89, v86);
    v67 = v146;
    goto LABEL_28;
  }
  v91 = v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v137 + 32))(v128, v84, v86);
  sub_21A2236C4();
  LODWORD(v134) = sub_21A224180();
  v92 = v83;
  v93 = *(void (**)(char *, uint64_t))(v137 + 8);
  v93(v91, v86);
  sub_21A223600((uint64_t)v40);
  sub_21A223600(v149);
  v93((char *)v89, v86);
  sub_21A223688(v92, &qword_2550CFFF0);
  v69 = v148;
  sub_21A2235BC(v56, v148);
  sub_21A2235BC(v64, v70);
  v66 = (uint64_t)v139;
  v67 = v146;
  v88 = v133;
  if ((v134 & 1) == 0)
    goto LABEL_10;
LABEL_30:
  v94 = v136[8];
  v95 = v69 + v94;
  v96 = v70 + v94;
  v97 = v88 + *(int *)(v130 + 48);
  v98 = v70;
  sub_21A220D38(v95, v88, &qword_2550CFFF8);
  sub_21A220D38(v96, v97, &qword_2550CFFF8);
  v99 = v131;
  v100 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48);
  if (v100(v88, 1, v131) == 1)
  {
    sub_21A223600(v98);
    sub_21A223600(v148);
    if (v100(v97, 1, v99) == 1)
    {
      sub_21A223688(v88, &qword_2550CFFF8);
      sub_21A2235BC(v56, v67);
      sub_21A2235BC(v64, v68);
      goto LABEL_37;
    }
LABEL_35:
    sub_21A223688(v88, &qword_2550D0038);
    goto LABEL_11;
  }
  v101 = v126;
  sub_21A220D38(v88, v126, &qword_2550CFFF8);
  if (v100(v97, 1, v99) == 1)
  {
    sub_21A223600(v147);
    sub_21A223600(v148);
    (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v101, v99);
    goto LABEL_35;
  }
  v102 = v132;
  v103 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v125, v97, v99);
  sub_21A22363C();
  v104 = sub_21A224180();
  v105 = *(void (**)(char *, uint64_t))(v102 + 8);
  v105(v103, v99);
  sub_21A223600(v147);
  sub_21A223600(v148);
  v105((char *)v101, v99);
  v67 = v146;
  sub_21A223688(v133, &qword_2550CFFF8);
  sub_21A2235BC(v56, v67);
  sub_21A2235BC(v64, v68);
  if ((v104 & 1) == 0)
    goto LABEL_12;
LABEL_37:
  v106 = v136[9];
  v107 = v67 + v106;
  v108 = v68 + v106;
  v109 = v67;
  v110 = v127;
  v111 = v127 + *(int *)(v130 + 48);
  sub_21A220D38(v107, v127, &qword_2550CFFF8);
  v112 = v108;
  v113 = v131;
  sub_21A220D38(v112, v111, &qword_2550CFFF8);
  if (v100(v110, 1, v113) == 1)
  {
    sub_21A223600(v68);
    sub_21A223600(v109);
    v114 = v100(v111, 1, v113);
    v72 = (uint64_t)v142;
    v71 = (uint64_t)v143;
    v74 = v140;
    v73 = v141;
    if (v114 == 1)
    {
      sub_21A223688(v127, &qword_2550CFFF8);
      sub_21A2235BC(v56, v74);
      sub_21A2235BC(v64, v73);
      goto LABEL_44;
    }
LABEL_42:
    sub_21A223688(v127, &qword_2550D0038);
    goto LABEL_13;
  }
  v115 = v124;
  sub_21A220D38(v110, v124, &qword_2550CFFF8);
  if (v100(v111, 1, v113) == 1)
  {
    sub_21A223600(v145);
    sub_21A223600(v146);
    (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v115, v113);
    v72 = (uint64_t)v142;
    v71 = (uint64_t)v143;
    v74 = v140;
    v73 = v141;
    goto LABEL_42;
  }
  v116 = v110;
  v117 = v132;
  v118 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v125, v111, v113);
  sub_21A22363C();
  v119 = sub_21A224180();
  v120 = *(void (**)(char *, uint64_t))(v117 + 8);
  v120(v118, v113);
  sub_21A223600(v145);
  sub_21A223600(v146);
  v120((char *)v115, v113);
  sub_21A223688(v116, &qword_2550CFFF8);
  v74 = v140;
  sub_21A2235BC(v56, v140);
  v73 = v141;
  sub_21A2235BC(v64, v141);
  v72 = (uint64_t)v142;
  v71 = (uint64_t)v143;
  if ((v119 & 1) == 0)
    goto LABEL_14;
LABEL_44:
  v121 = sub_21A2241C8();
  sub_21A223600(v73);
  sub_21A223600(v74);
  sub_21A2235BC(v56, v72);
  sub_21A2235BC(v64, v71);
  if ((v121 & 1) == 0)
    goto LABEL_15;
  v122 = sub_21A2241C8();
  sub_21A223600(v71);
  sub_21A223600(v72);
  v75 = v144;
  sub_21A2235BC(v56, v144);
  sub_21A2235BC(v64, v66);
  if ((v122 & 1) != 0)
  {
    v76 = sub_21A2241BC();
    goto LABEL_17;
  }
LABEL_16:
  v76 = 0;
LABEL_17:
  sub_21A223600(v66);
  sub_21A223600(v75);
  return v76 & 1;
}

uint64_t sub_21A221B8C()
{
  return MEMORY[0x24BEE1778];
}

_QWORD *initializeBufferWithCopyOfBuffer for ClientEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v8 = a3[7];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    *(_QWORD *)(a1 + 40) = a2[5];
    v11 = sub_21A224108();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = sub_21A220B2C(&qword_2550CFFF0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    v19 = sub_21A220B2C(&qword_253D8AD30);
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    if (v21(v18, 1, v19))
    {
      v22 = sub_21A220B2C(&qword_2550CFFF8);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    v23 = a3[9];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    if (v21((char *)a2 + v23, 1, v19))
    {
      v26 = sub_21A220B2C(&qword_2550CFFF8);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v25, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
    }
    v27 = a3[10];
    v28 = (char *)v4 + v27;
    v29 = (char *)a2 + v27;
    v30 = sub_21A220B2C(&qword_253D8AD58);
    v31 = *(_QWORD *)(v30 - 8);
    v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    if (v32(v29, 1, v30))
    {
      v33 = sub_21A220B2C(&qword_2550D0000);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    v34 = a3[11];
    v35 = (char *)v4 + v34;
    v36 = (char *)a2 + v34;
    if (v32((char *)a2 + v34, 1, v30))
    {
      v37 = sub_21A220B2C(&qword_2550D0000);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v35, v36, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v35, 0, 1, v30);
    }
    v38 = a3[12];
    v39 = (char *)v4 + v38;
    v40 = (char *)a2 + v38;
    v41 = sub_21A220B2C(&qword_253D8AD40);
    v42 = *(_QWORD *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      v43 = sub_21A220B2C(qword_2550D0008);
      memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v40, v41);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
  }
  return v4;
}

uint64_t destroy for ClientEvent(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_21A224108();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[8];
  v8 = sub_21A220B2C(&qword_253D8AD30);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = a1 + a2[9];
  if (!v10(v11, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  v12 = a1 + a2[10];
  v13 = sub_21A220B2C(&qword_253D8AD58);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (!v15(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v16 = a1 + a2[11];
  if (!v15(v16, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
  v17 = a1 + a2[12];
  v18 = sub_21A220B2C(&qword_253D8AD40);
  v19 = *(_QWORD *)(v18 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  return result;
}

uint64_t initializeWithCopy for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(const void *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_21A224108();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = sub_21A220B2C(&qword_2550CFFF0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_21A220B2C(&qword_253D8AD30);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[9];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    v24 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v22, v23, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = a3[10];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = sub_21A220B2C(&qword_253D8AD58);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48);
  if (v30(v27, 1, v28))
  {
    v31 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v32 = a3[11];
  v33 = (void *)(a1 + v32);
  v34 = (const void *)(a2 + v32);
  if (v30((const void *)(a2 + v32), 1, v28))
  {
    v35 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v33, v34, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v28);
  }
  v36 = a3[12];
  v37 = (void *)(a1 + v36);
  v38 = (const void *)(a2 + v36);
  v39 = sub_21A220B2C(&qword_253D8AD40);
  v40 = *(_QWORD *)(v39 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    v41 = sub_21A220B2C(qword_2550D0008);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  return a1;
}

uint64_t assignWithCopy for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(void *, uint64_t, uint64_t);
  int v52;
  int v53;
  uint64_t v54;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_21A224108();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = sub_21A220B2C(&qword_2550CFFF0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = a3[8];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_21A220B2C(&qword_253D8AD30);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_12:
    v24 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_13:
  v25 = a3[9];
  v26 = (void *)(a1 + v25);
  v27 = (void *)(a2 + v25);
  v28 = v21((void *)(a1 + v25), 1, v19);
  v29 = v21(v27, 1, v19);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v26, v27, v19);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v26, v19);
LABEL_18:
    v30 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v26, v27, v19);
LABEL_19:
  v31 = a3[10];
  v32 = (void *)(a1 + v31);
  v33 = (void *)(a2 + v31);
  v34 = sub_21A220B2C(&qword_253D8AD58);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v35 + 8))(v32, v34);
LABEL_24:
    v39 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v32, v33, v34);
LABEL_25:
  v40 = a3[11];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(a2 + v40);
  v43 = v36((void *)(a1 + v40), 1, v34);
  v44 = v36(v42, 1, v34);
  if (v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v41, v42, v34);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v41, 0, 1, v34);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v44)
  {
    (*(void (**)(void *, uint64_t))(v35 + 8))(v41, v34);
LABEL_30:
    v45 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v41, v42, v34);
LABEL_31:
  v46 = a3[12];
  v47 = (void *)(a1 + v46);
  v48 = (void *)(a2 + v46);
  v49 = sub_21A220B2C(&qword_253D8AD40);
  v50 = *(_QWORD *)(v49 - 8);
  v51 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v50 + 48);
  v52 = v51(v47, 1, v49);
  v53 = v51(v48, 1, v49);
  if (!v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v50 + 24))(v47, v48, v49);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v47, v49);
    goto LABEL_36;
  }
  if (v53)
  {
LABEL_36:
    v54 = sub_21A220B2C(qword_2550D0008);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v50 + 16))(v47, v48, v49);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
  return a1;
}

uint64_t initializeWithTake for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(const void *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(const void *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 17) = *(_OWORD *)(a2 + 17);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_21A224108();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_21A220B2C(&qword_2550CFFF0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[8];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = sub_21A220B2C(&qword_253D8AD30);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    v18 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v19 = a3[9];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  if (v17((const void *)(a2 + v19), 1, v15))
  {
    v22 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v20, v21, v15);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  v23 = a3[10];
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  v26 = sub_21A220B2C(&qword_253D8AD58);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v25, 1, v26))
  {
    v29 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 32))(v24, v25, v26);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  v30 = a3[11];
  v31 = (void *)(a1 + v30);
  v32 = (const void *)(a2 + v30);
  if (v28((const void *)(a2 + v30), 1, v26))
  {
    v33 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 32))(v31, v32, v26);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
  }
  v34 = a3[12];
  v35 = (void *)(a1 + v34);
  v36 = (const void *)(a2 + v34);
  v37 = sub_21A220B2C(&qword_253D8AD40);
  v38 = *(_QWORD *)(v37 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
  {
    v39 = sub_21A220B2C(qword_2550D0008);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v38 + 32))(v35, v36, v37);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  return a1;
}

uint64_t assignWithTake for ClientEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(void *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(void *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_21A224108();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = sub_21A220B2C(&qword_2550CFFF0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[8];
  v16 = (void *)(a1 + v15);
  v17 = (void *)(a2 + v15);
  v18 = sub_21A220B2C(&qword_253D8AD30);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_13:
  v24 = a3[9];
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = v20((void *)(a1 + v24), 1, v18);
  v28 = v20(v26, 1, v18);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v25, v26, v18);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v25, v18);
LABEL_18:
    v29 = sub_21A220B2C(&qword_2550CFFF8);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v25, v26, v18);
LABEL_19:
  v30 = a3[10];
  v31 = (void *)(a1 + v30);
  v32 = (void *)(a2 + v30);
  v33 = sub_21A220B2C(&qword_253D8AD58);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  v36 = v35(v31, 1, v33);
  v37 = v35(v32, 1, v33);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 32))(v31, v32, v33);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v34 + 8))(v31, v33);
LABEL_24:
    v38 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 40))(v31, v32, v33);
LABEL_25:
  v39 = a3[11];
  v40 = (void *)(a1 + v39);
  v41 = (void *)(a2 + v39);
  v42 = v35((void *)(a1 + v39), 1, v33);
  v43 = v35(v41, 1, v33);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 32))(v40, v41, v33);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v40, 0, 1, v33);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v43)
  {
    (*(void (**)(void *, uint64_t))(v34 + 8))(v40, v33);
LABEL_30:
    v44 = sub_21A220B2C(&qword_2550D0000);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 40))(v40, v41, v33);
LABEL_31:
  v45 = a3[12];
  v46 = (void *)(a1 + v45);
  v47 = (void *)(a2 + v45);
  v48 = sub_21A220B2C(&qword_253D8AD40);
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v49 + 48);
  v51 = v50(v46, 1, v48);
  v52 = v50(v47, 1, v48);
  if (!v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v49 + 40))(v46, v47, v48);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v49 + 8))(v46, v48);
    goto LABEL_36;
  }
  if (v52)
  {
LABEL_36:
    v53 = sub_21A220B2C(qword_2550D0008);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v49 + 32))(v46, v47, v48);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A2231D8(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A220B2C(&qword_2550CFFF0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[7];
    }
    else
    {
      v12 = sub_21A220B2C(&qword_2550CFFF8);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[8];
      }
      else
      {
        v13 = sub_21A220B2C(&qword_2550D0000);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[10];
        }
        else
        {
          v10 = sub_21A220B2C(qword_2550D0008);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a3[12];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ClientEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A2232DC(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = sub_21A220B2C(&qword_2550CFFF0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[7];
    }
    else
    {
      v12 = sub_21A220B2C(&qword_2550CFFF8);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[8];
      }
      else
      {
        v13 = sub_21A220B2C(&qword_2550D0000);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[10];
        }
        else
        {
          v10 = sub_21A220B2C(qword_2550D0008);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a4[12];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_21A2233D0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_21A2234D8();
  if (v0 <= 0x3F)
  {
    sub_21A223570(319, &qword_253D8AD38, &qword_253D8AD30);
    if (v1 <= 0x3F)
    {
      sub_21A223570(319, (unint64_t *)&unk_253D8AD60, &qword_253D8AD58);
      if (v2 <= 0x3F)
      {
        sub_21A223570(319, (unint64_t *)&unk_253D8AD48, &qword_253D8AD40);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_21A2234D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D8AD70)
  {
    sub_21A224108();
    v0 = sub_21A2241D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D8AD70);
  }
}

uint64_t sub_21A22352C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22073D9A8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_21A223570(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_21A22352C(a3);
    v4 = sub_21A2241D4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_21A2235BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClientEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A223600(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ClientEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21A22363C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550D0048;
  if (!qword_2550D0048)
  {
    v1 = sub_21A22352C(&qword_253D8AD30);
    result = MEMORY[0x22073D9B4](MEMORY[0x24BDFD390], v1);
    atomic_store(result, (unint64_t *)&qword_2550D0048);
  }
  return result;
}

uint64_t sub_21A223688(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21A220B2C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21A2236C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550D0050;
  if (!qword_2550D0050)
  {
    v1 = sub_21A224108();
    result = MEMORY[0x22073D9B4](MEMORY[0x24BDFD3C8], v1);
    atomic_store(result, (unint64_t *)&qword_2550D0050);
  }
  return result;
}

uint64_t EventSource.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  uint64_t v13;
  unint64_t v14;

  v1 = v0;
  v2 = sub_21A224150();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for EventSource();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21A223AF8(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
    v13 = 0;
    v14 = 0xE000000000000000;
    sub_21A224198();
    sub_21A22421C();
    sub_21A224198();
    v9 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v10 = *v8;
    v13 = 0;
    v14 = 0xE000000000000000;
    sub_21A224198();
    v12[1] = v10;
    sub_21A22421C();
    sub_21A224198();
    return v13;
  }
  return v9;
}

uint64_t _s17AdPlatformsCommon11EventSourceO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v4 = sub_21A224150();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EventSource();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v22 - v12);
  v14 = sub_21A220B2C(qword_2550D0108);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_21A223AF8(a1, (uint64_t)v17);
  sub_21A223AF8(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_21A223AF8((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v19 = *v13 == *(_QWORD *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_21A223F68((uint64_t)v17);
    v19 = 0;
    return v19 & 1;
  }
  sub_21A223AF8((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  v19 = sub_21A224120();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_21A223D64((uint64_t)v17);
  return v19 & 1;
}

uint64_t type metadata accessor for EventSource()
{
  uint64_t result;

  result = qword_2550D00D0;
  if (!qword_2550D00D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A223AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21A224150();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for EventSource(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_21A224150();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for EventSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21A224150();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for EventSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21A223D64((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21A224150();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21A223D64(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EventSource();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for EventSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21A224150();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for EventSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21A223D64((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21A224150();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for EventSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21A223EE4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21A223EF4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A224150();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_21A223F68(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A220B2C(qword_2550D0108);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

AdPlatformsCommon::EventSourceID __swiftcall EventSourceID.init(integerLiteral:)(AdPlatformsCommon::EventSourceID integerLiteral)
{
  AdPlatformsCommon::EventSourceID *v1;

  v1->value = integerLiteral.value;
  return integerLiteral;
}

BOOL static EventSourceID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t EventSourceID.value.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *sub_21A223FCC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t EventSourceID.debugDescription.getter()
{
  return sub_21A224240();
}

uint64_t sub_21A224018()
{
  return MEMORY[0x24BEE17E8];
}

uint64_t sub_21A224024()
{
  return sub_21A224240();
}

ValueMetadata *type metadata accessor for EventSourceID()
{
  return &type metadata for EventSourceID;
}

uint64_t DeadEndPipe.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeadEndPipe.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t DeadEndPipe.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DeadEndPipe.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21A2240A8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DeadEndPipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A21FA54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DeadEndPipe);
}

uint64_t method lookup function for DeadEndPipe()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeadEndPipe.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DeadEndPipe.deliverEvent(in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_21A224108()
{
  return MEMORY[0x24BDFD3B8]();
}

uint64_t sub_21A224114()
{
  return MEMORY[0x24BDFD3F8]();
}

uint64_t sub_21A224120()
{
  return MEMORY[0x24BDFD400]();
}

uint64_t sub_21A22412C()
{
  return MEMORY[0x24BDFD408]();
}

uint64_t sub_21A224138()
{
  return MEMORY[0x24BDFD410]();
}

uint64_t sub_21A224144()
{
  return MEMORY[0x24BDFD418]();
}

uint64_t sub_21A224150()
{
  return MEMORY[0x24BDFD420]();
}

uint64_t sub_21A22415C()
{
  return MEMORY[0x24BDFD438]();
}

uint64_t sub_21A224168()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21A224174()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21A224180()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21A22418C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_21A224198()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21A2241A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21A2241B0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21A2241BC()
{
  return MEMORY[0x24BDFD440]();
}

uint64_t sub_21A2241C8()
{
  return MEMORY[0x24BDFD448]();
}

uint64_t sub_21A2241D4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21A2241E0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21A2241EC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21A2241F8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21A224204()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21A224210()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21A22421C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21A224228()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21A224234()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21A224240()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21A22424C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21A224258()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A224264()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A224270()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x24BDFD468]();
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x24BDFD470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

