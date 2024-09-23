const __CFString *sub_23F08DF00(unint64_t a1)
{
  if (a1 > 2)
    return &stru_250F901F0;
  else
    return off_250F8F518[a1];
}

void sub_23F08E044(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], a2, (uint64_t)CFSTR("^[a-z]{2,3}([_-][A-Z][a-z]{3})?$"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254343B40;
  qword_254343B40 = v2;

}

void sub_23F08E1B4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)qword_254343B50;
  qword_254343B50 = (uint64_t)v0;

}

void sub_23F08E294(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], a2, (uint64_t)CFSTR("^(([A-Z]{2})|([0-9]{3})|([A-Z][a-z]{3}))$"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254343B70;
  qword_254343B70 = v2;

}

void sub_23F08E404()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)qword_254343B60;
  qword_254343B60 = (uint64_t)v0;

}

void sub_23F08E5D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  objc_msgSend_q_flushRecentActions(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_analyzer(*(void **)(a1 + 32), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateAnalytics(v10, v11, v12, v13, v14);

  objc_msgSend_analyzer(*(void **)(a1 + 32), v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v19, v20, v21, v22, v23);

  objc_msgSend_serverDelegate(*(void **)(a1 + 32), v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    objc_msgSend_serverDelegate(*(void **)(a1 + 32), v30, v31, v32, v33);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_didEndEnumeratingAnalytics(v38, v34, v35, v36, v37);

  }
}

void sub_23F08E73C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend_analyzer(*(void **)(a1 + 32), a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardTrialParameters_(v9, v6, v5, v7, v8);

}

void sub_23F08EC78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13)
{
  uint64_t v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  if (a2 == 1)
  {
    v14 = objc_begin_catch(exception_object);
    sub_23F0975CC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v20 = *(void **)(v13 + 8);
      objc_msgSend_server(v20, v16, v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v14, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a9) = 134218498;
      *(_QWORD *)((char *)&a9 + 4) = v20;
      WORD6(a9) = 2048;
      *(_QWORD *)((char *)&a9 + 14) = v21;
      a12 = 2112;
      a13 = (uint64_t)v26;
      _os_log_fault_impl(&dword_23F08C000, v15, OS_LOG_TYPE_FAULT, "flushAndSetLastAction called didAction on xpc client 0x%lx with server 0x%lx and failed with %@", (uint8_t *)&a9, 0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x23F08EC34);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_23F08F424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F08F534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F08F900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F08FE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F090004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0900F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0901E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0902D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0903C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0904B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F090728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F090D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F090E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F0910A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F091340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F091448(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend_setDictationBeganCount_(v7, a2, 1, a4, a5);
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend_setMultiModalDictationBeganCount_(*(void **)(a1 + 32), v8, 1, v9, v10);
  }
  else
  {
    objc_msgSend_setModelessUsedAtLeastOnceCount_(v7, a2, 1, a4, a5);
  }
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 40), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 32), v9, v10);
}

uint64_t sub_23F091570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_mergeOrConsumeAction_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_23F091C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_23F091C4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_23F091C5C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_23F091C70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_23F091C7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_23F091CCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23F091CDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_23F092614()
{
  NSObject *v0;
  uint8_t v1[16];

  sub_23F09763C();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F08C000, v0, OS_LOG_TYPE_INFO, "Feedback completed", v1, 2u);
  }

}

void sub_23F092798()
{
  NSObject *v0;
  uint8_t v1[16];

  sub_23F09763C();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F08C000, v0, OS_LOG_TYPE_INFO, ".presented completed", v1, 2u);
  }

}

void sub_23F0927FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_23F092888(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_23F092E94(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

id sub_23F092F10(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_23F094500(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isEqual;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a2;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v5, v11, (uint64_t)v10, v12, v13);

  if ((isEqual & 1) == 0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v35 = objc_msgSend_sessionActionsEnumFromSource_(IATextInputActionsUtils, v15, a3, v16, v17);
    v20 = v33[3];
    if (v20 == 1)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = sub_23F094640;
      v27[3] = &unk_250F8F868;
      v22 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      v30 = a3;
      v31 = v21;
      v23 = *(_QWORD *)(a1 + 32);
      v29 = &v32;
      v27[4] = v23;
      v28 = v22;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v24, (uint64_t)v27, v25, v26);

    }
    else
    {
      objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 40), v18, MEMORY[0x24BDBD1C8], v20, v19);
    }
    _Block_object_dispose(&v32, 8);
  }

}

void sub_23F094628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F094640(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char isEqual;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  v5 = (void *)MEMORY[0x24BDBCEF8];
  v6 = a2;
  objc_msgSend_null(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v6, v12, (uint64_t)v11, v13, v14);

  if ((isEqual & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_sessionActionsEnumFromSource_type_(IATextInputActionsUtils, v16, *(_QWORD *)(a1 + 56), a3, v17);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v21 == 1)
    {
      objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v18, v19, 1, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("IASTextInputActionsAnalyzer.m"), 567, CFSTR("Received sessionActions of NotYetKnown despite providing action type"));

      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 40), v18, MEMORY[0x24BDBD1C8], v21, v20);
  }
}

void sub_23F094748(uint64_t a1, void *a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;

  v5 = a2;
  v9 = v5;
  if (a3)
  {
    v26 = v5;
    v10 = objc_msgSend_BOOLValue(v5, v5, v6, v7, v8);
    v9 = (char *)v26;
    if (v10)
    {
      objc_msgSend_sessionActionsString(*(void **)(a1 + 32), v26, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForSessionActionsEnum_(IATextInputActionsUtils, v15, a3, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v14, v19, (uint64_t)v18, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSessionActionsString_(*(void **)(a1 + 32), v23, (uint64_t)v22, v24, v25);

      v9 = (char *)v26;
    }
  }

}

void sub_23F094AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23F094AD4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_23F094AE4(uint64_t a1)
{

}

void sub_23F094AEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18[2];
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend_computeSessionActionsStringOnSession_(v6, v8, (uint64_t)v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_23F094BDC;
  v19[3] = &unk_250F8F958;
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v5;
  v12 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v18 = *(_OWORD *)(a1 + 40);
  v21 = v11;
  v23 = v12;
  v13 = v18[0];
  v22 = *(_OWORD *)v18;
  v14 = v11;
  v18[0] = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v15, (uint64_t)v19, v16, v17);

}

void sub_23F094BDC(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char isEqual;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v22 = a2;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v22, v10, (uint64_t)v9, v11, v12);

  if ((isEqual & 1) == 0)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_23F094CD4;
    v23[3] = &unk_250F8F930;
    v14 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v14;
    v28 = a3;
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 72);
    v25 = v15;
    v27 = v16;
    v21 = *(_OWORD *)(a1 + 56);
    v17 = (id)v21;
    v26 = v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v22, v18, (uint64_t)v23, v19, v20);

  }
}

void sub_23F094CD4(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char isEqual;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v24 = a2;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v24, v10, (uint64_t)v9, v11, v12);

  if ((isEqual & 1) == 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_23F094DD0;
    v25[3] = &unk_250F8F908;
    v14 = *(void **)(a1 + 40);
    v25[4] = *(_QWORD *)(a1 + 32);
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 80);
    v26 = v15;
    v30 = v16;
    v31 = a3;
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 72);
    v27 = v17;
    v29 = v18;
    v23 = *(_OWORD *)(a1 + 56);
    v19 = (id)v23;
    v28 = v23;
    objc_msgSend_enumerateObjectsUsingBlock_(v24, v20, (uint64_t)v25, v21, v22);

  }
}

void sub_23F094DD0(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char isEqual;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;

  v22 = a2;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v22, v10, (uint64_t)v9, v11, v12);

  if ((isEqual & 1) == 0)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_23F094ED0;
    v23[3] = &unk_250F8F8E0;
    v14 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v14;
    v28 = a3;
    v29 = *(_OWORD *)(a1 + 80);
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 72);
    v25 = v15;
    v27 = v16;
    v21 = *(_OWORD *)(a1 + 56);
    v17 = (id)v21;
    v26 = v21;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v18, (uint64_t)v23, v19, v20);

  }
}

void sub_23F094ED0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t isEmojiSearchSetInFlagOptions;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isMarkedTextSetInFlagOptions;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t HasOnlyPrimaryInput;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t HasDictation;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  id v210;
  void *v211;
  __CFString *v212;
  uint64_t v213;
  _QWORD v214[27];
  _QWORD v215[29];

  v215[27] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend_isAllZeroes(v6, v7, v8, v9, v10) & 1) == 0)
  {
    v210 = v5;
    objc_msgSend_componentsSeparatedByString_(v5, v11, (uint64_t)CFSTR("≡"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cleanIdForPublishing_(*(void **)(a1 + 32), v15, *(_QWORD *)(a1 + 40), v16, v17);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    isEmojiSearchSetInFlagOptions = objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v18, *(_QWORD *)(a1 + 80), v19, v20);
    isMarkedTextSetInFlagOptions = objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v22, *(_QWORD *)(a1 + 80), v23, v24);
    v202 = objc_alloc(MEMORY[0x24BDBCED8]);
    v214[0] = 0x250F913D0;
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v26, *(_QWORD *)(a1 + 88), v27, v28);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v215[0] = v207;
    v214[1] = 0x250F913F0;
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v29, *(_QWORD *)(a1 + 96), v30, v31);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v215[1] = v206;
    v214[2] = 0x250F91410;
    v32 = (void *)MEMORY[0x24BDD16E0];
    v37 = objc_msgSend_netCharacters(v6, v33, v34, v35, v36);
    objc_msgSend_numberWithLong_(v32, v38, v37, v39, v40);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v215[2] = v205;
    v214[3] = 0x250F91430;
    v41 = (void *)MEMORY[0x24BDD16E0];
    v46 = objc_msgSend_userRemovedCharacters(v6, v42, v43, v44, v45);
    objc_msgSend_numberWithLong_(v41, v47, v46, v48, v49);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v215[3] = v204;
    v214[4] = 0x250F91450;
    v50 = (void *)MEMORY[0x24BDD16E0];
    v55 = objc_msgSend_netEmojiCharacters(v6, v51, v52, v53, v54);
    objc_msgSend_numberWithLong_(v50, v56, v55, v57, v58);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v215[4] = v203;
    v214[5] = 0x250F91470;
    v59 = (void *)MEMORY[0x24BDD16E0];
    v64 = objc_msgSend_userRemovedEmojiCharacters(v6, v60, v61, v62, v63);
    objc_msgSend_numberWithLong_(v59, v65, v64, v66, v67);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v215[5] = v201;
    v214[6] = 0x250F91490;
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v68, isEmojiSearchSetInFlagOptions, v69, v70);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v215[6] = v200;
    v214[7] = 0x250F914B0;
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v71, isMarkedTextSetInFlagOptions, v72, v73);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v215[7] = v199;
    v214[8] = 0x250F914D0;
    v74 = (void *)MEMORY[0x24BDD16E0];
    v209 = v6;
    v79 = objc_msgSend_inputActions(v6, v75, v76, v77, v78);
    objc_msgSend_numberWithLong_(v74, v80, v79, v81, v82);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v215[8] = v198;
    v214[9] = 0x250F91650;
    v83 = (void *)MEMORY[0x24BDD16E0];
    v87 = objc_msgSend_log10WholeNumberForUnsignedInt_(IATextInputActionsUtils, v84, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v85, v86);
    objc_msgSend_numberWithUnsignedLong_(v83, v88, v87, v89, v90);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v215[9] = v197;
    v214[10] = 0x250F91670;
    v91 = (void *)MEMORY[0x24BDD16E0];
    v95 = objc_msgSend_log10WholeNumberForUnsignedInt_(IATextInputActionsUtils, v92, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v93, v94);
    objc_msgSend_numberWithUnsignedLong_(v91, v96, v95, v97, v98);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v215[10] = v196;
    v214[11] = 0x250F91690;
    v99 = (void *)MEMORY[0x24BDD16E0];
    v103 = objc_msgSend_log10IntegerForInt_(IATextInputActionsUtils, v100, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v101, v102);
    objc_msgSend_numberWithUnsignedLong_(v99, v104, v103, v105, v106);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v215[11] = v195;
    v214[12] = 0x250F916B0;
    v110 = *(_QWORD *)(a1 + 32);
    v111 = *(_QWORD *)(v110 + 64);
    if (v111 + *(_QWORD *)(v110 + 72))
      v112 = MEMORY[0x24BDBD1C8];
    else
      v112 = MEMORY[0x24BDBD1C0];
    v215[12] = v112;
    v214[13] = 0x250F916D0;
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v107, v111, v108, v109);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v215[13] = v194;
    v214[14] = 0x250F916F0;
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v113, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v114, v115);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v215[14] = v193;
    v214[15] = 0x250F914F0;
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v116, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16), v117, v118);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v215[15] = v192;
    v214[16] = 0x250F91510;
    objc_msgSend_sessionActionsString(*(void **)(a1 + 48), v119, v120, v121, v122);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v215[16] = v191;
    v214[17] = 0x250F91530;
    v123 = (void *)MEMORY[0x24BDD16E0];
    HasOnlyPrimaryInput = objc_msgSend_sessionHasOnlyPrimaryInput(*(void **)(a1 + 48), v124, v125, v126, v127);
    objc_msgSend_numberWithBool_(v123, v129, HasOnlyPrimaryInput, v130, v131);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v215[17] = v190;
    v214[18] = 0x250F91550;
    v132 = (void *)MEMORY[0x24BDD16E0];
    HasDictation = objc_msgSend_sessionHasDictation(*(void **)(a1 + 48), v133, v134, v135, v136);
    objc_msgSend_numberWithBool_(v132, v138, HasDictation, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v215[18] = v141;
    v214[19] = 0x250F91250;
    objc_msgSend_objectAtIndexedSubscript_(v14, v142, 0, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v215[19] = v145;
    v214[20] = 0x250F91270;
    objc_msgSend_objectAtIndexedSubscript_(v14, v146, 1, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v215[20] = v149;
    v214[21] = 0x250F91570;
    objc_msgSend_objectAtIndexedSubscript_(v14, v150, 2, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v215[21] = v153;
    v214[22] = 0x250F91590;
    objc_msgSend_objectAtIndexedSubscript_(v14, v154, 3, v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v215[22] = v157;
    v214[23] = 0x250F915B0;
    objc_msgSend_objectAtIndexedSubscript_(v14, v158, 4, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v215[23] = v161;
    v214[24] = 0x250F915D0;
    v208 = v14;
    objc_msgSend_objectAtIndexedSubscript_(v14, v162, 5, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v215[24] = v165;
    v215[25] = v211;
    v214[25] = 0x250F915F0;
    v214[26] = 0x250F91610;
    v215[26] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v166, (uint64_t)v215, (uint64_t)v214, 27);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_msgSend_initWithDictionary_(v202, v168, (uint64_t)v167, v169, v170);

    objc_msgSend_keyboardTrialParameters(*(void **)(a1 + 32), v172, v173, v174, v175);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    if (v176)
    {
      objc_msgSend_keyboardTrialParameters(*(void **)(a1 + 32), v177, v178, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v171, v182, (uint64_t)v181, v183, v184);

    }
    v185 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v185)
    {
      v212 = CFSTR("errors");
      v213 = v185;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v177, (uint64_t)&v213, (uint64_t)&v212, 1);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v171, v187, (uint64_t)v186, v188, v189);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    v6 = v209;
    v5 = v210;
  }

}

void sub_23F095768(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_23F096614(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;

  objc_msgSend_punctuationCharacterSet(MEMORY[0x24BDD14A8], a2, a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_254343B80;
  qword_254343B80 = v5;

}

void sub_23F096700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23F096718(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void sub_23F096838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23F09685C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) += a4;
  return result;
}

void sub_23F09722C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id sub_23F09723C()
{
  if (qword_254343B90 != -1)
    dispatch_once(&qword_254343B90, &unk_250F8F9F8);
  return (id)qword_254343B88;
}

void sub_23F09727C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.server", "IATextInputActions");
  v1 = (void *)qword_254343B88;
  qword_254343B88 = (uint64_t)v0;

}

id sub_23F0972AC()
{
  if (qword_256DFC2E8 != -1)
    dispatch_once(&qword_256DFC2E8, &unk_250F8FA18);
  return (id)qword_256DFC2E0;
}

void sub_23F0972EC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.server", "IASTextInputUserPreference");
  v1 = (void *)qword_256DFC2E0;
  qword_256DFC2E0 = (uint64_t)v0;

}

void sub_23F097398(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

id sub_23F097414(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_23F09755C()
{
  if (qword_254343B98 != -1)
    dispatch_once(&qword_254343B98, &unk_250F8F2B8);
  return (id)qword_254343BA0;
}

void sub_23F09759C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.client", "IAXPCClient");
  v1 = (void *)qword_254343BA0;
  qword_254343BA0 = (uint64_t)v0;

}

id sub_23F0975CC()
{
  if (qword_254343BA8 != -1)
    dispatch_once(&qword_254343BA8, &unk_250F8FA38);
  return (id)qword_254343BB0;
}

void sub_23F09760C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.client", "IATextInputActions");
  v1 = (void *)qword_254343BB0;
  qword_254343BB0 = (uint64_t)v0;

}

id sub_23F09763C()
{
  if (qword_254343B28 != -1)
    dispatch_once(&qword_254343B28, &unk_250F8FA58);
  return (id)qword_254343B30;
}

void sub_23F09767C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.client", "IASignalAnalytics");
  v1 = (void *)qword_254343B30;
  qword_254343B30 = (uint64_t)v0;

}

id sub_23F0976AC()
{
  if (qword_256DFC2F8 != -1)
    dispatch_once(&qword_256DFC2F8, &unk_250F8F1F8);
  return (id)qword_256DFC2F0;
}

void sub_23F0976EC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.client", "IATextInputUserPreferenceAnalytics");
  v1 = (void *)qword_256DFC2F0;
  qword_256DFC2F0 = (uint64_t)v0;

}

void sub_23F097810(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

id sub_23F097888(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_23F098068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_23F0980A8()
{
  NSObject *v0;

  sub_23F09755C();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_23F0A030C();

}

void sub_23F0980F0()
{
  NSObject *v0;

  sub_23F09755C();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_23F0A0370();

}

void sub_23F098138(uint64_t a1, void *a2)
{
  id v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  sub_23F09755C();
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    sub_23F0A03D4(v2, v3, v4, v5, v6);

}

void sub_23F098378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F098398(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sub_23F09755C();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_23F08C000, v2, OS_LOG_TYPE_INFO, "invalidateConnection successfully invalidated 0x%lx", (uint8_t *)&v4, 0xCu);
  }

}

void sub_23F098488(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_23F0984D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_23F09A040(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@=%@"), a4, a5, a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);

}

void sub_23F09C430()
{
  void *v0;

  v0 = (void *)qword_256DFC300;
  qword_256DFC300 = (uint64_t)&unk_250F99828;

}

uint64_t sub_23F09C450()
{
  uint64_t v0;

  v0 = sub_23F0A0574();
  sub_23F09EFDC(v0, qword_256DFC318);
  sub_23F09E8B8(v0, (uint64_t)qword_256DFC318);
  return sub_23F0A0568();
}

id sub_23F09C534()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_23F0A0580();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23F09C588(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  v6 = sub_23F0A058C();
  v7 = (uint64_t *)(a1 + *a4);
  *v7 = v6;
  v7[1] = v8;
  return swift_bridgeObjectRelease();
}

id sub_23F09C5C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  objc_super v14;

  *(_QWORD *)(v6 + OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain) = a1;
  *(_QWORD *)(v6 + OBJC_IVAR___IAFeedbackServiceSwiftBridge_action) = a2;
  v7 = 1701736270;
  if (a4)
    v8 = a3;
  else
    v8 = 1701736270;
  if (a4)
    v9 = a4;
  else
    v9 = 0xE400000000000000;
  v10 = (uint64_t *)(v6 + OBJC_IVAR___IAFeedbackServiceSwiftBridge_originalContent);
  *v10 = v8;
  v10[1] = v9;
  if (a6)
  {
    v7 = a5;
    v11 = a6;
  }
  else
  {
    v11 = 0xE400000000000000;
  }
  v12 = (uint64_t *)(v6 + OBJC_IVAR___IAFeedbackServiceSwiftBridge_generatedContent);
  *v12 = v7;
  v12[1] = v11;
  v14.super_class = (Class)IAFeedbackServiceSwiftBridge;
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_23F09C6E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  return swift_task_switch();
}

uint64_t sub_23F09C6F8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unsigned int *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  void (*v44)(uint64_t, _QWORD *, uint64_t);
  void (*v45)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  id v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(_QWORD *, uint64_t);
  id *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *type;
  uint64_t v66;

  if (qword_256DFC310 != -1)
    swift_once();
  v1 = *(void **)(v0 + 72);
  v2 = sub_23F0A0574();
  *(_QWORD *)(v0 + 80) = sub_23F09E8B8(v2, (uint64_t)qword_256DFC318);
  v3 = v1;
  v4 = sub_23F0A055C();
  v5 = sub_23F0A05D4();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 72);
  v8 = &selRef_hasPrefix_;
  v61 = (id *)(v0 + 72);
  if (v6)
  {
    v9 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    v66 = v63;
    *(_DWORD *)v9 = 136315651;
    *(_QWORD *)(v0 + 40) = objc_msgSend(v7, sel_featureDomain);
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    v10 = sub_23F0A0598();
    *(_QWORD *)(v0 + 48) = sub_23F09E8D0(v10, v11, &v66);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2085;
    v12 = objc_msgSend(v7, sel_originalContent);
    v13 = sub_23F0A058C();
    v15 = v14;

    *(_QWORD *)(v0 + 56) = sub_23F09E8D0(v13, v15, &v66);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 22) = 2085;
    v16 = objc_msgSend(v7, sel_generatedContent);
    v17 = sub_23F0A058C();
    v19 = v18;

    v20 = v17;
    v8 = &selRef_hasPrefix_;
    *(_QWORD *)(v0 + 64) = sub_23F09E8D0(v20, v19, &v66);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23F08C000, v4, v5, "reportPresented with domain '%s', input '%{sensitive}s', output '%{sensitive}s'", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v63, -1, -1);
    MEMORY[0x2426646B0](v9, -1, -1);
  }
  else
  {

  }
  v21 = *(void **)(v0 + 72);
  v22 = sub_23F0A0544();
  *(_QWORD *)(v0 + 88) = v22;
  v23 = *(_QWORD **)(v22 - 8);
  *(_QWORD *)(v0 + 96) = v23;
  v24 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v24;
  v25 = objc_msgSend(v21, v8[311]);
  v26 = sub_23F0A058C();
  v28 = v27;

  *v24 = v26;
  v24[1] = v28;
  v29 = *MEMORY[0x24BE31188];
  type = v23;
  v30 = (void (*)(_QWORD *, uint64_t, uint64_t))v23[13];
  v30(v24, v29, v22);
  v31 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v31;
  v32 = objc_msgSend(v21, sel_generatedContent);
  v33 = sub_23F0A058C();
  v35 = v34;

  *v31 = v33;
  v31[1] = v35;
  v64 = v31;
  v30(v31, v29, v22);
  v36 = sub_23F0A052C();
  *(_QWORD *)(v0 + 120) = v36;
  v37 = *(_QWORD *)(v36 - 8);
  *(_QWORD *)(v0 + 128) = v37;
  v38 = swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v38;
  v39 = objc_msgSend(v21, sel_featureDomain);
  if (!v39)
  {
    v40 = (unsigned int *)MEMORY[0x24BE30FF0];
    goto LABEL_10;
  }
  if (v39 == (id)1)
  {
    v40 = (unsigned int *)MEMORY[0x24BE30FE0];
LABEL_10:
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v38, *v40, v36);
    v62 = sub_23F0A0520();
    *(_QWORD *)(v0 + 144) = v62;
    v41 = *(_QWORD *)(v62 - 8);
    *(_QWORD *)(v0 + 152) = v41;
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v42;
    swift_task_alloc();
    (*(void (**)(void))(v37 + 16))();
    sub_23F09E354(&qword_256DFC290);
    v43 = swift_task_alloc();
    v44 = (void (*)(uint64_t, _QWORD *, uint64_t))type[2];
    v44(v43, v24, v22);
    v45 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))type[7];
    v45(v43, 0, 1, v22);
    v46 = swift_task_alloc();
    v44(v46, v64, v22);
    v45(v46, 0, 1, v22);
    v47 = objc_allocWithZone((Class)sub_23F0A0550());
    v48 = sub_23F0A0538();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *v42 = v48;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v41 + 104))(v42, *MEMORY[0x24BE30F08], v62);
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v49;
    *v49 = v0;
    v49[1] = sub_23F09CE54;
    return sub_23F0A0514();
  }
  v51 = *v61;
  v52 = sub_23F0A055C();
  v53 = sub_23F0A05E0();
  v54 = os_log_type_enabled(v52, v53);
  v55 = *v61;
  if (v54)
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    v66 = v57;
    *(_DWORD *)v56 = 136315138;
    *(_QWORD *)(v0 + 16) = objc_msgSend(v55, (SEL)&selRef_didDeleteBackwardCount_withType_ + 6);
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    v58 = sub_23F0A0598();
    *(_QWORD *)(v0 + 24) = sub_23F09E8D0(v58, v59, &v66);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23F08C000, v52, v53, "Unexpected feature domain: %s.", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v57, -1, -1);
    MEMORY[0x2426646B0](v56, -1, -1);

  }
  else
  {

  }
  v60 = (void (*)(_QWORD *, uint64_t))type[1];
  v60(v31, v22);
  v60(v24, v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09CE54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23F09CEB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v4, v6);
  v8(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09CF68()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 176);
  v2 = v1;
  v3 = v1;
  v4 = sub_23F0A055C();
  v5 = sub_23F0A05E0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 176);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v10;
    sub_23F0A05EC();
    *v8 = v10;

    _os_log_impl(&dword_23F08C000, v4, v5, "Unexpected error: %@.", v7, 0xCu);
    sub_23F09E354(&qword_256DFC298);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v8, -1, -1);
    MEMORY[0x2426646B0](v7, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 176);

  }
  v11 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 128);
  v15 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v18(v14, v16);
  v18(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09D270(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_23F09F16C;
  v5[9] = v4;
  return swift_task_switch();
}

uint64_t sub_23F09D2E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = v0;
  return swift_task_switch();
}

uint64_t sub_23F09D300()
{
  uint64_t v0;
  void *v1;
  id *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  char **v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id *v44;
  uint64_t v45;
  unsigned int *v46;
  id v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD *, uint64_t);
  void (*v52)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  id v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  id v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  void (*v76)(_QWORD *, uint64_t);
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  os_log_type_t typea;
  os_log_type_t type[8];
  os_log_t log;
  uint64_t v88;

  if (qword_256DFC310 != -1)
    swift_once();
  v2 = (id *)(v0 + 104);
  v1 = *(void **)(v0 + 104);
  v3 = sub_23F0A0574();
  *(_QWORD *)(v0 + 112) = sub_23F09E8B8(v3, (uint64_t)qword_256DFC318);
  v4 = v1;
  v5 = sub_23F0A055C();
  v6 = sub_23F0A05D4();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 104);
  v9 = &selRef_hasPrefix_;
  if (v7)
  {
    typea = v6;
    v10 = swift_slowAlloc();
    v83 = swift_slowAlloc();
    v88 = v83;
    *(_DWORD *)v10 = 136315907;
    *(_QWORD *)(v0 + 56) = objc_msgSend(v8, sel_featureDomain);
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    v11 = sub_23F0A0598();
    *(_QWORD *)(v0 + 64) = sub_23F09E8D0(v11, v12, &v88);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    *(_QWORD *)(v0 + 72) = objc_msgSend(v8, sel_action);
    type metadata accessor for IAFBKSEvaluationAction(0);
    v13 = sub_23F0A0598();
    *(_QWORD *)(v0 + 80) = sub_23F09E8D0(v13, v14, &v88);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 22) = 2085;
    v15 = objc_msgSend(v8, sel_originalContent);
    v16 = sub_23F0A058C();
    v18 = v17;

    *(_QWORD *)(v0 + 88) = sub_23F09E8D0(v16, v18, &v88);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 32) = 2085;
    v19 = objc_msgSend(v8, sel_generatedContent);
    v20 = sub_23F0A058C();
    v22 = v21;

    *(_QWORD *)(v0 + 96) = sub_23F09E8D0(v20, v22, &v88);
    sub_23F0A05EC();
    v9 = &selRef_hasPrefix_;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23F08C000, v5, typea, "launchFeedback with domain '%s', action '%s', input '%{sensitive}s', output '%{sensitive}s'", (uint8_t *)v10, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v83, -1, -1);
    MEMORY[0x2426646B0](v10, -1, -1);
  }
  else
  {

  }
  v23 = *(void **)(v0 + 104);
  v24 = sub_23F0A0544();
  *(_QWORD *)(v0 + 120) = v24;
  v25 = *(_QWORD **)(v24 - 8);
  *(_QWORD *)(v0 + 128) = v25;
  v26 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v26;
  v27 = objc_msgSend(v23, v9[311]);
  v28 = sub_23F0A058C();
  v30 = v29;

  *v26 = v28;
  v26[1] = v30;
  v31 = *MEMORY[0x24BE31188];
  v84 = v25;
  *(_QWORD *)type = v26;
  v32 = (void (*)(_QWORD *, uint64_t, uint64_t))v25[13];
  v32(v26, v31, v24);
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v33;
  v34 = objc_msgSend(v23, sel_generatedContent);
  v35 = sub_23F0A058C();
  v37 = v36;

  *v33 = v35;
  v33[1] = v37;
  v82 = v33;
  v32(v33, v31, v24);
  v38 = sub_23F0A052C();
  *(_QWORD *)(v0 + 152) = v38;
  v39 = *(_QWORD *)(v38 - 8);
  *(_QWORD *)(v0 + 160) = v39;
  log = (os_log_t)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = log;
  v40 = sub_23F0A04FC();
  *(_QWORD *)(v0 + 176) = v40;
  v41 = *(_QWORD *)(v40 - 8);
  *(_QWORD *)(v0 + 184) = v41;
  v42 = swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v42;
  v43 = objc_msgSend(v23, sel_featureDomain);
  if (v43)
  {
    if (v43 != (id)1)
    {
      v58 = *v2;
      v59 = sub_23F0A055C();
      v60 = sub_23F0A05E0();
      v61 = os_log_type_enabled(v59, v60);
      v62 = *v2;
      if (v61)
      {
        v63 = (uint8_t *)swift_slowAlloc();
        v64 = swift_slowAlloc();
        v88 = v64;
        *(_DWORD *)v63 = 136315138;
        *(_QWORD *)(v0 + 16) = objc_msgSend(v62, sel_featureDomain);
        type metadata accessor for IAFBKSInteractionFeatureDomain(0);
        v65 = sub_23F0A0598();
        *(_QWORD *)(v0 + 24) = sub_23F09E8D0(v65, v66, &v88);
        sub_23F0A05EC();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_23F08C000, v59, v60, "Unexpected feature domain: %s.", v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2426646B0](v64, -1, -1);
        MEMORY[0x2426646B0](v63, -1, -1);

      }
      else
      {

      }
      v76 = (void (*)(_QWORD *, uint64_t))v84[1];
      v76(v82, v24);
      v77 = *(_QWORD **)type;
      v78 = v24;
      goto LABEL_20;
    }
    v80 = v24;
    v44 = (id *)(v0 + 104);
    v45 = v42;
    v46 = (unsigned int *)MEMORY[0x24BE30FE0];
  }
  else
  {
    v80 = v24;
    v44 = (id *)(v0 + 104);
    v45 = v42;
    v46 = (unsigned int *)MEMORY[0x24BE30FF0];
  }
  v47 = *v44;
  (*(void (**)(os_log_t, _QWORD, uint64_t))(v39 + 104))(log, *v46, v38);
  v48 = (char *)objc_msgSend(v47, sel_action);
  if ((unint64_t)(v48 - 1) < 3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v41 + 104))(v45, **((unsigned int **)&unk_250F8FFF8 + (_QWORD)(v48 - 1)), v40);
    v81 = sub_23F0A0520();
    *(_QWORD *)(v0 + 200) = v81;
    v79 = *(_QWORD *)(v81 - 8);
    *(_QWORD *)(v0 + 208) = v79;
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v49;
    swift_task_alloc();
    (*(void (**)(void))(v39 + 16))();
    sub_23F09E354(&qword_256DFC290);
    v50 = swift_task_alloc();
    v51 = (void (*)(uint64_t, _QWORD *, uint64_t))v84[2];
    v51(v50, *(_QWORD **)type, v80);
    v52 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v84[7];
    v52(v50, 0, 1, v80);
    v53 = swift_task_alloc();
    v51(v53, v82, v80);
    v52(v53, 0, 1, v80);
    v54 = objc_allocWithZone((Class)sub_23F0A0550());
    v55 = sub_23F0A0538();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    *v49 = v55;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v79 + 104))(v49, *MEMORY[0x24BE30F08], v81);
    v56 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v56;
    *v56 = v0;
    v56[1] = sub_23F09DD04;
    return sub_23F0A0508();
  }
  v67 = *v44;
  v68 = sub_23F0A055C();
  v69 = sub_23F0A05E0();
  v70 = os_log_type_enabled(v68, v69);
  v71 = *v44;
  if (v70)
  {
    v72 = (uint8_t *)swift_slowAlloc();
    v73 = swift_slowAlloc();
    v88 = v73;
    *(_DWORD *)v72 = 136315138;
    *(_QWORD *)(v0 + 32) = objc_msgSend(v71, sel_action);
    type metadata accessor for IAFBKSEvaluationAction(0);
    v74 = sub_23F0A0598();
    *(_QWORD *)(v0 + 40) = sub_23F09E8D0(v74, v75, &v88);
    sub_23F0A05EC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23F08C000, v68, v69, "Unexpected action: %s.", v72, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v73, -1, -1);
    MEMORY[0x2426646B0](v72, -1, -1);

  }
  else
  {

  }
  (*(void (**)(os_log_t, uint64_t))(v39 + 8))(log, v38);
  v76 = (void (*)(_QWORD *, uint64_t))v84[1];
  v76(v82, v80);
  v77 = *(_QWORD **)type;
  v78 = v80;
LABEL_20:
  v76(v77, v78);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09DD04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23F09DD68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 136);
  v8 = *(_QWORD *)(v0 + 120);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v9(v11, v8);
  v9(v12, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09DE48()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v1 = *(void **)(v0 + 232);
  v2 = v1;
  v3 = v1;
  v4 = sub_23F0A055C();
  v5 = sub_23F0A05E0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 232);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v10;
    sub_23F0A05EC();
    *v8 = v10;

    _os_log_impl(&dword_23F08C000, v4, v5, "Unexpected error: %@.", v7, 0xCu);
    sub_23F09E354(&qword_256DFC298);
    swift_arrayDestroy();
    MEMORY[0x2426646B0](v8, -1, -1);
    MEMORY[0x2426646B0](v7, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 232);

  }
  v11 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 160);
  v14 = *(_QWORD *)(v0 + 168);
  v16 = *(_QWORD *)(v0 + 152);
  v17 = *(_QWORD *)(v0 + 128);
  v21 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 136);
  v18 = *(_QWORD *)(v0 + 120);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v19(v21, v18);
  v19(v22, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23F09E180(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_23F09E1F8;
  v5[13] = v4;
  return swift_task_switch();
}

uint64_t sub_23F09E1F8()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

void __swiftcall IAFeedbackServiceSwiftBridge.init()(IAFeedbackServiceSwiftBridge *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void IAFeedbackServiceSwiftBridge.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for IAFeedbackServiceSwiftBridge()
{
  unint64_t result;

  result = qword_256DFC330;
  if (!qword_256DFC330)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DFC330);
  }
  return result;
}

uint64_t sub_23F09E354(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242664674]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23F09E398()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23F09F168;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256DFC248 + dword_256DFC248))(v2, v3);
}

uint64_t sub_23F09E3FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23F09F168;
  return v6();
}

uint64_t sub_23F09E454()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23F09F168;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256DFC258 + dword_256DFC258))(v2, v3, v4);
}

uint64_t sub_23F09E4CC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23F09F168;
  return v7();
}

uint64_t sub_23F09E524(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23F09F168;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256DFC268 + dword_256DFC268))(a1, v4, v5, v6);
}

uint64_t sub_23F09E5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23F0A05C8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23F0A05BC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23F09E6EC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23F0A05B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23F09E6EC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F09E354(&qword_256DFC240);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23F09E72C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23F09E790;
  return v6(a1);
}

uint64_t sub_23F09E790()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23F09E7DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23F09E800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23F09E870;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256DFC278 + dword_256DFC278))(a1, v4);
}

uint64_t sub_23F09E870()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23F09E8B8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23F09E8D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23F09E9A0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23F09EF9C((uint64_t)v12, *a3);
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
      sub_23F09EF9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23F09EF7C((uint64_t)v12);
  return v7;
}

uint64_t sub_23F09E9A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23F0A05F8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23F09EB58(a5, a6);
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
  v8 = sub_23F0A0610();
  if (!v8)
  {
    sub_23F0A061C();
    __break(1u);
LABEL_17:
    result = sub_23F0A0628();
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

uint64_t sub_23F09EB58(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23F09EBEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23F09EDC4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23F09EDC4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23F09EBEC(uint64_t a1, unint64_t a2)
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
      v3 = sub_23F09ED60(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23F0A0604();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23F0A061C();
      __break(1u);
LABEL_10:
      v2 = sub_23F0A05A4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23F0A0628();
    __break(1u);
LABEL_14:
    result = sub_23F0A061C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23F09ED60(uint64_t a1, uint64_t a2)
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
  sub_23F09E354(&qword_256DFC2A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23F09EDC4(char a1, int64_t a2, char a3, char *a4)
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
    sub_23F09E354(&qword_256DFC2A0);
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
  result = sub_23F0A0628();
  __break(1u);
  return result;
}

void type metadata accessor for IAFBKSInteractionFeatureDomain(uint64_t a1)
{
  sub_23F09EF38(a1, &qword_256DFC2D8);
}

void type metadata accessor for IAFBKSEvaluationAction(uint64_t a1)
{
  sub_23F09EF38(a1, &qword_256DFC2D0);
}

void sub_23F09EF38(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23F09EF7C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23F09EF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_23F09EFDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23F09F020()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_23F09F04C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23F09F168;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256DFC2A8 + dword_256DFC2A8))(v2, v3);
}

uint64_t sub_23F09F0B8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23F09F0E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23F09E870;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256DFC268 + dword_256DFC268))(a1, v4, v5, v6);
}

void sub_23F09F170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091CCC(&dword_23F08C000, v0, v1, "IATextInputActionsAnalytics analyticsDelegate is nil", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F19C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = 134218243;
  v9 = objc_msgSend_flagOptions(a1, a2, a3, a4, a5);
  v10 = 2113;
  v11 = a1;
  sub_23F091C7C(&dword_23F08C000, a2, v7, "[IATextInputActionsAnalytics] mergeOrConsumeAction: Unacceptable flagOptions value of %lu set for new action:%{private}@", (uint8_t *)&v8);
  sub_23F091CE8();
}

void sub_23F09F224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didSessionBegin", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didSessionEnd", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F27C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didOther", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F2A8()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  sub_23F091CF4();
  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_description(v1, (const char *)v1, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F091C90();
  sub_23F091C7C(&dword_23F08C000, v0, v6, "[IATextInputActionsAnalytics] didInsertText: selectedTextBefore:%{sensitive}@ withInputMode:%{private}@ called with nil text", v7);

  sub_23F091CBC();
}

void sub_23F09F330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091CCC(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didDeleteBackwardText: called with nil text", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F35C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138739971;
  v4 = a1;
  sub_23F091CDC(&dword_23F08C000, a2, a3, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@", (uint8_t *)&v3);
  sub_23F091CB4();
}

void sub_23F09F3C4()
{
  NSObject *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  sub_23F091CF4();
  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F091C90();
  sub_23F091C70(&dword_23F08C000, v0, v5, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@ withType:'%{private}@'", v6);

  sub_23F091CBC();
}

void sub_23F09F454(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringForType_(IATextInputActionsUtils, a2, a1, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F091C90();
  sub_23F091C70(&dword_23F08C000, a3, v7, "[IATextInputActionsAnalytics] didDeleteBackwardCount:%lu withType:'%{private}@'", v8);

  sub_23F091CBC();
}

void sub_23F09F4E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didCopy", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didCut", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didPaste", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F56C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didUndo", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didRedo", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F5C4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138740227;
  v4 = a1;
  v5 = 2117;
  v6 = 0;
  sub_23F091C7C(&dword_23F08C000, a2, a3, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil replacement", (uint8_t *)&v3);
  sub_23F091CB4();
}

void sub_23F09F638()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_23F091C34();
  sub_23F091C7C(&dword_23F08C000, v0, (uint64_t)v0, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed empty text", v1);
  sub_23F091CB4();
}

void sub_23F09F6A0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138740227;
  v4 = 0;
  v5 = 2117;
  v6 = a1;
  sub_23F091C7C(&dword_23F08C000, a2, a3, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil text", (uint8_t *)&v3);
  sub_23F091CB4();
}

void sub_23F09F714()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didCandidateBarReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F774()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didCalloutBarReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F7D4()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didAutocorrectReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F834()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didAutocorrectTapOnCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F894()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didInlineCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F8F4()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didInlineCompletionTapOnCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F954()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F091C34();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didRevisionBubbleReplacementForText:%{sensitive}@ withText:%{sensitive}@");
  sub_23F091CB4();
}

void sub_23F09F9B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didRevisionBubbleTap", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09F9E0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringForReplaceWithCandidateType_(IATextInputActionsUtils, a2, a1, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138477827;
  v9 = v6;
  sub_23F091CDC(&dword_23F08C000, a2, v7, "[IATextInputActionsAnalytics] didReplaceWithCandidate:'%{private}@'", (uint8_t *)&v8);

  sub_23F091CE8();
}

void sub_23F09FA70()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_23F091C34();
  sub_23F091C7C(&dword_23F08C000, v0, (uint64_t)v0, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil replacement", v1);
  sub_23F091CB4();
}

void sub_23F09FAD8()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_23F091C34();
  sub_23F091C7C(&dword_23F08C000, v0, (uint64_t)v0, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ had disallowed empty text", v1);
  sub_23F091CB4();
}

void sub_23F09FB40()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_23F091C34();
  sub_23F091C7C(&dword_23F08C000, v0, (uint64_t)v0, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ marked text incorrectly set", v1);
  sub_23F091CB4();
}

void sub_23F09FBA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didDictationBegin", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FBD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didDictationEnd", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FC00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didInsertionKeyPress", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FC2C()
{
  NSObject *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  sub_23F091CF4();
  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F091C90();
  sub_23F091C70(&dword_23F08C000, v0, v5, "[IATextInputActionsAnalytics] didInsertionKeyPressOfKey:%{sensitive}@ withType:%{private}@", v6);

  sub_23F091CBC();
}

void sub_23F09FCBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IATextInputActionsAnalytics] didDeletionKeyPress", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FCE8()
{
  NSObject *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  sub_23F091CF4();
  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F091C90();
  sub_23F091C70(&dword_23F08C000, v0, v5, "[IATextInputActionsAnalytics] didDeletionKeyPressOfKey:%{sensitive}@ withType:%{private}@", v6);

  sub_23F091CBC();
}

void sub_23F09FD78(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_description(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F0927FC(&dword_23F08C000, v6, v7, "Malformed payload: %{sensitive}@", v8, v9, v10, v11, 3u);

  sub_23F091CE8();
}

void sub_23F09FDF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Initialized analyzer", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FE20()
{
  uint64_t v0;
  os_log_t v1;

  sub_23F095750();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new array for key \"%{private}@\" with capacity %lu");
  sub_23F091CB4();
}

void sub_23F09FE80()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F095750();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new array for key %lu with capacity %lu", v2, v3);
  sub_23F091CB4();
}

void sub_23F09FEE0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_count(a1, a2, a3, a4, a5);
  sub_23F095768(&dword_23F08C000, v5, v6, "Attempt to access index %lu, which is out of bounds for array with capacity %lu", v7, v8, v9, v10, 0);
}

void sub_23F09FF68()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F095750();
  sub_23F091C5C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new dictionary for key %lu with capacity %lu", v2, v3);
  sub_23F091CB4();
}

void sub_23F09FFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091CCC(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Received nil input mode unique key", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F09FFF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Cached keyboardTrialParameters", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Initial deletion latch", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A004C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend_analyzerSessionId(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(a2, v12, v13, v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F095768(&dword_23F08C000, v16, v17, "[%{private}@]nil inputMode passed to [IASTextInputActionsAnalyzer consumeAction:] in action '%{private}@'", v18, v19, v20, v21, 3u);

}

void sub_23F0A010C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Reset analyzer", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091CCC(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] eventHandler nil", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0164()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F091C4C(&dword_23F08C000, v0, v1, "[IASTextInputActionsAnalyzer] Enumerating TextInputActions...", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0190()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "didAction called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A01BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "didSessionBeginWithSessionMetadata called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A01E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "didSessionEndWithSessionMetadata called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0214()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "getDateWithReply called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "logMessage called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A026C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F091CA8();
  sub_23F09722C(&dword_23F08C000, v0, v1, "reportStatus called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
  sub_23F091C88();
}

void sub_23F0A0298(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_23F08C000, a2, OS_LOG_TYPE_ERROR, "No supported preferences for platform to report for requested userPreference %lu", (uint8_t *)&v2, 0xCu);
}

void sub_23F0A030C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F098488(*MEMORY[0x24BDAC8D0]);
  sub_23F0984B0();
  sub_23F0984D0(&dword_23F08C000, v0, v1, "Interrupted 0x%lx _connection 0x%lx _server 0x%lx", v2, v3, v4, v5, v6);
}

void sub_23F0A0370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23F098488(*MEMORY[0x24BDAC8D0]);
  sub_23F0984B0();
  sub_23F0984D0(&dword_23F08C000, v0, v1, "Invalidated 0x%lx _connection 0x%lx _server 0x%lx", v2, v3, v4, v5, v6);
}

void sub_23F0A03D4(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedFailureReason(a1, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 138478083;
  v14 = v7;
  v15 = 2113;
  v16 = v12;
  _os_log_error_impl(&dword_23F08C000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Error on remote object proxy: %{private}@ %{private}@", (uint8_t *)&v13, 0x16u);

}

void sub_23F0A0494(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23F091CCC(&dword_23F08C000, a1, a3, "reportStateForUserPreference: is deprecated!", a5, a6, a7, a8, 0);
}

void sub_23F0A04C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23F091CCC(&dword_23F08C000, a1, a3, "reportStateForUserPreferences: is deprecated!", a5, a6, a7, a8, 0);
}

uint64_t sub_23F0A04FC()
{
  return MEMORY[0x24BE30EC0]();
}

uint64_t sub_23F0A0508()
{
  return MEMORY[0x24BE30F20]();
}

uint64_t sub_23F0A0514()
{
  return MEMORY[0x24BE30F48]();
}

uint64_t sub_23F0A0520()
{
  return MEMORY[0x24BE30F70]();
}

uint64_t sub_23F0A052C()
{
  return MEMORY[0x24BE31070]();
}

uint64_t sub_23F0A0538()
{
  return MEMORY[0x24BE31098]();
}

uint64_t sub_23F0A0544()
{
  return MEMORY[0x24BE311C8]();
}

uint64_t sub_23F0A0550()
{
  return MEMORY[0x24BE31200]();
}

uint64_t sub_23F0A055C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23F0A0568()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23F0A0574()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23F0A0580()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23F0A058C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23F0A0598()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23F0A05A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23F0A05B0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23F0A05BC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23F0A05C8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23F0A05D4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23F0A05E0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23F0A05EC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23F0A05F8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23F0A0604()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23F0A0610()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23F0A061C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23F0A0628()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

