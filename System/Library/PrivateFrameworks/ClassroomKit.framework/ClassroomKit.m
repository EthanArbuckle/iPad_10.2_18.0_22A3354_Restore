id _CRKLogASM()
{
  if (_CRKLogASM_onceToken_1 != -1)
    dispatch_once(&_CRKLogASM_onceToken_1, &__block_literal_global_2);
  return (id)_CRKLogASM_logObj_1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_218C9F554(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x218C9F3ECLL);
  }
  _Unwind_Resume(exception_object);
}

id _CRKLogASM_0()
{
  if (_CRKLogASM_onceToken_2 != -1)
    dispatch_once(&_CRKLogASM_onceToken_2, &__block_literal_global_4);
  return (id)_CRKLogASM_logObj_2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t CRKLogAddStateHandler(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v8;
  id v9;

  v8 = a2;
  v9 = a3;
  v4 = v8;
  v5 = v9;
  v6 = os_state_add_handler();

  return v6;
}

id _CRKLogGeneral()
{
  if (_CRKLogGeneral_onceToken != -1)
    dispatch_once(&_CRKLogGeneral_onceToken, &__block_literal_global_5);
  return (id)_CRKLogGeneral_logObj;
}

void CRTLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  NSObject *v12;
  FILE **v13;
  FILE *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  _CRKLogGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }

  v13 = (FILE **)MEMORY[0x24BDAC8E8];
  v14 = (FILE *)*MEMORY[0x24BDAC8E8];
  v15 = objc_retainAutorelease(v11);
  fprintf(v14, "%s\n", (const char *)objc_msgSend(v15, "UTF8String"));
  fflush(*v13);

}

void CRTLogError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  id v20;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  _CRKLogGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    CRTLogError_cold_1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = (FILE *)*MEMORY[0x24BDAC8D8];
  v20 = objc_retainAutorelease(v11);
  fprintf(v19, "%s\n", (const char *)objc_msgSend(v20, "UTF8String"));

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _CRKLogASM_1()
{
  if (_CRKLogASM_onceToken_3 != -1)
    dispatch_once(&_CRKLogASM_onceToken_3, &__block_literal_global_6);
  return (id)_CRKLogASM_logObj_3;
}

id _CRKLogASM_2()
{
  if (_CRKLogASM_onceToken_4 != -1)
    dispatch_once(&_CRKLogASM_onceToken_4, &__block_literal_global_7);
  return (id)_CRKLogASM_logObj_4;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id _CRKLogASM_3()
{
  if (_CRKLogASM_onceToken_5 != -1)
    dispatch_once(&_CRKLogASM_onceToken_5, &__block_literal_global_8);
  return (id)_CRKLogASM_logObj_5;
}

void sub_218CA3F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_0()
{
  if (_CRKLogGeneral_onceToken_0 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_0, &__block_literal_global_9);
  return (id)_CRKLogGeneral_logObj_0;
}

void sub_218CA5000(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_218CA5020(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x218CA4FB8);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __crk_tokenized_properties_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogASM_4()
{
  if (_CRKLogASM_onceToken_6 != -1)
    dispatch_once(&_CRKLogASM_onceToken_6, &__block_literal_global_10);
  return (id)_CRKLogASM_logObj_6;
}

uint64_t CRKIsClassroomBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  CRKAllClassroomBundleIdentifiers();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3;
}

id CRKAllClassroomBundleIdentifiers()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("com.apple.classroom");
  v1[1] = CFSTR("com.apple.macos.classroom");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __crk_tokenized_properties_block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogBluetooth()
{
  if (_CRKLogBluetooth_onceToken != -1)
    dispatch_once(&_CRKLogBluetooth_onceToken, &__block_literal_global_12);
  return (id)_CRKLogBluetooth_logObj;
}

id _CRKLogASM_5()
{
  if (_CRKLogASM_onceToken_7 != -1)
    dispatch_once(&_CRKLogASM_onceToken_7, &__block_literal_global_235);
  return (id)_CRKLogASM_logObj_7;
}

id _CRKLogASM_6()
{
  if (_CRKLogASM_onceToken_8 != -1)
    dispatch_once(&_CRKLogASM_onceToken_8, &__block_literal_global_14);
  return (id)_CRKLogASM_logObj_8;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id JSONStringRepresentation(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  if (a3)
    v3 = a2 | 2;
  else
    v3 = a2;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a1, v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    if (_CRKLogGeneral_onceToken_1 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_1, &__block_literal_global_15);
    v6 = (void *)_CRKLogGeneral_logObj_1;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_1, OS_LOG_TYPE_ERROR))
      JSONStringRepresentation_cold_1(v6, v5);
  }
  if (objc_msgSend(v4, "length"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  else
    v7 = 0;

  return v7;
}

void sub_218CB271C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CB2C28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void __crk_tokenized_properties_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

double CRKRectFromDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("x"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "doubleValue");
  return v6;
}

id CRKDictionaryFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];
  CGRect v16;
  CGRect v17;

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  v14[2] = CFSTR("width");
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetWidth(v16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  v14[3] = CFSTR("height");
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetHeight(v17));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

unint64_t CRKRectHash(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  unint64_t v8;
  CGRect v10;

  v8 = (unint64_t)a1 ^ (unint64_t)a2 ^ (unint64_t)CGRectGetWidth(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return v8 ^ (unint64_t)CGRectGetHeight(v10);
}

id _CRKLogGeneral_1()
{
  if (_CRKLogGeneral_onceToken_5 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_5, &__block_literal_global_101);
  return (id)_CRKLogGeneral_logObj_5;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t CRKIsSimulator()
{
  return 0;
}

uint64_t CRKIsiOS()
{
  return 1;
}

uint64_t CRKIsOSX()
{
  return 0;
}

void __crk_tokenized_properties_block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogASM_7()
{
  if (_CRKLogASM_onceToken_13 != -1)
    dispatch_once(&_CRKLogASM_onceToken_13, &__block_literal_global_33);
  return (id)_CRKLogASM_logObj_13;
}

id _CRKLogSettings()
{
  if (_CRKLogSettings_onceToken != -1)
    dispatch_once(&_CRKLogSettings_onceToken, &__block_literal_global_281);
  return (id)_CRKLogSettings_logObj;
}

id _CRKLogGeneral_2()
{
  if (_CRKLogGeneral_onceToken_7 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_7, &__block_literal_global_284);
  return (id)_CRKLogGeneral_logObj_7;
}

id _CRKLogASM_8()
{
  if (_CRKLogASM_onceToken_14 != -1)
    dispatch_once(&_CRKLogASM_onceToken_14, &__block_literal_global_35);
  return (id)_CRKLogASM_logObj_14;
}

void __crk_tokenized_properties_block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogASM_9()
{
  if (_CRKLogASM_onceToken_15 != -1)
    dispatch_once(&_CRKLogASM_onceToken_15, &__block_literal_global_36);
  return (id)_CRKLogASM_logObj_15;
}

void __crk_tokenized_properties_block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void sub_218CCB2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CCC56C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_3()
{
  if (_CRKLogGeneral_onceToken_9 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_9, &__block_literal_global_57);
  return (id)_CRKLogGeneral_logObj_9;
}

void __crk_tokenized_properties_block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogBluetooth_0()
{
  if (_CRKLogBluetooth_onceToken_0 != -1)
    dispatch_once(&_CRKLogBluetooth_onceToken_0, &__block_literal_global_40);
  return (id)_CRKLogBluetooth_logObj_0;
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id extractErrorFromChange(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  v4 = 0;
  switch(objc_msgSend(v3, "status"))
  {
    case 0:
    case 1:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSError * _Nullable extractErrorFromChange(AVOutputContextDestinationChange * _Nonnull __strong, NSString * _Nullable __strong)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CRKConcreteOutputDevice.m"), 71, CFSTR("Should never receve this route setting status %ld"), objc_msgSend(v3, "status"));
      goto LABEL_4;
    case 2:
      break;
    case 3:
      v7 = 1;
      goto LABEL_9;
    case 4:
      if (a2)
        v7 = 129;
      else
        v7 = 128;
LABEL_9:
      CRKErrorWithCodeAndUserInfo(v7, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSError * _Nullable extractErrorFromChange(AVOutputContextDestinationChange * _Nonnull __strong, NSString * _Nullable __strong)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CRKConcreteOutputDevice.m"), 86, CFSTR("Encountered unexpected change"), v9);
LABEL_4:

      v4 = 0;
      break;
  }

  return v4;
}

id _CRKLogASM_10()
{
  if (_CRKLogASM_onceToken_16 != -1)
    dispatch_once(&_CRKLogASM_onceToken_16, &__block_literal_global_86);
  return (id)_CRKLogASM_logObj_16;
}

id CRKLocalizedSwiftString(void *a1)
{
  return CRKLocalizedSwiftStringFromTable(a1, CFSTR("Localizable"));
}

id CRKLocalizedSwiftStringFromTable(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24D9CB490, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_218CD2968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CD512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogSession()
{
  if (_CRKLogSession_onceToken != -1)
    dispatch_once(&_CRKLogSession_onceToken, &__block_literal_global_233);
  return (id)_CRKLogSession_logObj;
}

void sub_218CD9458(void *a1, int a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = objc_begin_catch(a1);
  if (a2 == 2)
  {
    v4 = v3;
    _CRKLogGeneral_4();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CRKMDMIdentityProvider identity].cold.2((uint64_t)v4, v5);

    objc_end_catch();
    JUMPOUT(0x218CD9418);
  }
  JUMPOUT(0x218CD941CLL);
}

id _CRKLogGeneral_4()
{
  if (_CRKLogGeneral_onceToken_12 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_12, &__block_literal_global_50);
  return (id)_CRKLogGeneral_logObj_12;
}

void sub_218CD9948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CDA4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CDA65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogASM_11()
{
  if (_CRKLogASM_onceToken_18 != -1)
    dispatch_once(&_CRKLogASM_onceToken_18, &__block_literal_global_53);
  return (id)_CRKLogASM_logObj_18;
}

void sub_218CDCBC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CRKLogASM_12()
{
  if (_CRKLogASM_onceToken_19 != -1)
    dispatch_once(&_CRKLogASM_onceToken_19, &__block_literal_global_87);
  return (id)_CRKLogASM_logObj_19;
}

id _CRKLogBluetooth_1()
{
  if (_CRKLogBluetooth_onceToken_2 != -1)
    dispatch_once(&_CRKLogBluetooth_onceToken_2, &__block_literal_global_56);
  return (id)_CRKLogBluetooth_logObj_2;
}

void sub_218CE0408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t CRKBoolCompare(int a1, int a2)
{
  uint64_t v2;

  v2 = 1;
  if (!a1)
    v2 = -1;
  if (a1 != a2)
    return v2;
  else
    return 0;
}

uint64_t CRKIntegerCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 1;
  if (a1 <= a2)
    v2 = -1;
  if (a1 == a2)
    return 0;
  else
    return v2;
}

id _CRKLogGeneral_5()
{
  if (_CRKLogGeneral_onceToken_16 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_16, &__block_literal_global_58);
  return (id)_CRKLogGeneral_logObj_16;
}

void __crk_tokenized_properties_block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void sub_218CE6AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_6()
{
  if (_CRKLogGeneral_onceToken_17 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_17, &__block_literal_global_116);
  return (id)_CRKLogGeneral_logObj_17;
}

void sub_218CE6F54(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_218CEA53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

id _CRKLogOperation()
{
  if (_CRKLogOperation_onceToken != -1)
    dispatch_once(&_CRKLogOperation_onceToken, &__block_literal_global_60);
  return (id)_CRKLogOperation_logObj;
}

uint64_t CRKApplicationInfoServiceXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25502F178);
}

id _identityFunction_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

void sub_218CF2FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_7()
{
  if (_CRKLogGeneral_onceToken_22 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_22, &__block_literal_global_101_0);
  return (id)_CRKLogGeneral_logObj_22;
}

void sub_218CF3218(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_218CF34BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CF4828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218CF4990(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id _CRKLogSettings_0()
{
  if (_CRKLogSettings_onceToken_0 != -1)
    dispatch_once(&_CRKLogSettings_onceToken_0, &__block_literal_global_69);
  return (id)_CRKLogSettings_logObj_0;
}

id _CRKLogOperation_0()
{
  if (_CRKLogOperation_onceToken_0 != -1)
    dispatch_once(&_CRKLogOperation_onceToken_0, &__block_literal_global_153);
  return (id)_CRKLogOperation_logObj_0;
}

id _CRKLogGeneral_8()
{
  if (_CRKLogGeneral_onceToken_23 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_23, &__block_literal_global_156);
  return (id)_CRKLogGeneral_logObj_23;
}

id _CRKLogOperation_1()
{
  if (_CRKLogOperation_onceToken_1 != -1)
    dispatch_once(&_CRKLogOperation_onceToken_1, &__block_literal_global_218);
  return (id)_CRKLogOperation_logObj_1;
}

id _CRKLogGeneral_9()
{
  if (_CRKLogGeneral_onceToken_24 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_24, &__block_literal_global_221);
  return (id)_CRKLogGeneral_logObj_24;
}

id _CRKLogASM_13()
{
  if (_CRKLogASM_onceToken_20 != -1)
    dispatch_once(&_CRKLogASM_onceToken_20, &__block_literal_global_73);
  return (id)_CRKLogASM_logObj_20;
}

void sub_218CFB780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogASM_14()
{
  if (_CRKLogASM_onceToken_21 != -1)
    dispatch_once(&_CRKLogASM_onceToken_21, &__block_literal_global_74);
  return (id)_CRKLogASM_logObj_21;
}

void sub_218CFC830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CRKInternetDateFetchingXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255035D60);
}

id _CRKLogASM_15()
{
  if (_CRKLogASM_onceToken_22 != -1)
    dispatch_once(&_CRKLogASM_onceToken_22, &__block_literal_global_77);
  return (id)_CRKLogASM_logObj_22;
}

void sub_218CFDFA4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_218CFEBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id _CRKLogGeneral_10()
{
  if (_CRKLogGeneral_onceToken_27 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_27, &__block_literal_global_29_0);
  return (id)_CRKLogGeneral_logObj_27;
}

id _CRKLogGeneral_11()
{
  if (_CRKLogGeneral_onceToken_28 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_28, &__block_literal_global_81);
  return (id)_CRKLogGeneral_logObj_28;
}

void __crk_tokenized_properties_block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

uint64_t notificationDidFireCFunction(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a2, "notificationDidFire:", a5);
}

id _CRKLogBluetooth_2()
{
  if (_CRKLogBluetooth_onceToken_3 != -1)
    dispatch_once(&_CRKLogBluetooth_onceToken_3, &__block_literal_global_271);
  return (id)_CRKLogBluetooth_logObj_3;
}

id _CRKLogASM_16()
{
  if (_CRKLogASM_onceToken_23 != -1)
    dispatch_once(&_CRKLogASM_onceToken_23, &__block_literal_global_76);
  return (id)_CRKLogASM_logObj_23;
}

id _CRKLogSession_0()
{
  if (_CRKLogSession_onceToken_0 != -1)
    dispatch_once(&_CRKLogSession_onceToken_0, &__block_literal_global_85);
  return (id)_CRKLogSession_logObj_0;
}

void sub_218D07824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id _CRKLogGeneral_12()
{
  if (_CRKLogGeneral_onceToken_29 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_29, &__block_literal_global_86);
  return (id)_CRKLogGeneral_logObj_29;
}

void sub_218D08F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id _CRKLogASM_17()
{
  if (_CRKLogASM_onceToken_24 != -1)
    dispatch_once(&_CRKLogASM_onceToken_24, &__block_literal_global_87);
  return (id)_CRKLogASM_logObj_24;
}

void __crk_tokenized_properties_block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void __crk_tokenized_properties_block_invoke_16(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

id _CRKLogGeneral_13()
{
  if (_CRKLogGeneral_onceToken_30 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_30, &__block_literal_global_90);
  return (id)_CRKLogGeneral_logObj_30;
}

const __CFString *NSStringFromCRKBookType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("UNKNOWN");
  else
    return off_24D9C9F10[a1];
}

const __CFString *CRKStringForConfigurationType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return off_24D9CA010[a1];
}

id CRKFoundationClasses()
{
  if (CRKFoundationClasses_onceToken != -1)
    dispatch_once(&CRKFoundationClasses_onceToken, &__block_literal_global_91);
  return (id)CRKFoundationClasses_result;
}

id _CRKLogASM_18()
{
  if (_CRKLogASM_onceToken_27 != -1)
    dispatch_once(&_CRKLogASM_onceToken_27, &__block_literal_global_93);
  return (id)_CRKLogASM_logObj_27;
}

uint64_t CRKBooksServiceXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25501C128);
}

uint64_t CRKStudentDaemonXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255029010);
}

void sub_218D11A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_14()
{
  if (_CRKLogGeneral_onceToken_31 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_31, &__block_literal_global_96);
  return (id)_CRKLogGeneral_logObj_31;
}

id _CRKLogASM_19()
{
  if (_CRKLogASM_onceToken_28 != -1)
    dispatch_once(&_CRKLogASM_onceToken_28, &__block_literal_global_97);
  return (id)_CRKLogASM_logObj_28;
}

const __CFString *NSStringFromCRKIDSAccountStateSummary(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("UNKNOWN-ThisIsABug");
  else
    return off_24D9CA220[a1];
}

void __crk_tokenized_properties_block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void sub_218D15F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218D16024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218D1656C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BOMCopierDidGenerateFatalError(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  soft_BOMCopierUserData(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorFromBOMCopierStatus:message:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _CRKLogOperation_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    _BOMCopierDidGenerateFatalError_cold_1((uint64_t)v3, v6, v7);

  objc_msgSend(v3, "setStashedError:", v6);
}

void _BOMCopierDidGenerateFatalFileError(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  soft_BOMCopierUserData(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogOperation_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_218C99000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered FATAL file error for path %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v5, "setStashedError:", v6);

}

uint64_t _BOMCopierDidGenerateFileError(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  soft_BOMCopierUserData(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogOperation_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verboseDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_218C99000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered file error for path %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v5, "setStashedError:", v6);

  return 2;
}

uint64_t _BOMCopierDidGenerateFileConflictError(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  soft_BOMCopierUserData(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogOperation_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "%{public}@: Encountered file conflict for path %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &v15);
  v9 = v15;

  if ((v8 & 1) != 0)
  {
    v10 = 3;
  }
  else
  {
    objc_msgSend(v3, "setStashedError:", v9);
    _CRKLogOperation_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "verboseDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v3;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_error_impl(&dword_218C99000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to resolve file conflict by deleting existing file at path %{public}@. Error: %{public}@", buf, 0x20u);

    }
    v10 = 2;
  }

  return v10;
}

uint64_t BomLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!BomLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D9CA258;
    v3 = 0;
    BomLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BomLibraryCore_frameworkLibrary)
    BomLibrary_cold_1(&v1);
  return BomLibraryCore_frameworkLibrary;
}

uint64_t soft_BOMCopierUserData(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getBOMCopierUserDataSymbolLoc_ptr;
  v8 = getBOMCopierUserDataSymbolLoc_ptr;
  if (!getBOMCopierUserDataSymbolLoc_ptr)
  {
    v3 = (void *)BomLibrary();
    v2 = dlsym(v3, "BOMCopierUserData");
    v6[3] = (uint64_t)v2;
    getBOMCopierUserDataSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft_BOMCopierUserData_cold_1();
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void sub_218D1704C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id _CRKLogOperation_2()
{
  if (_CRKLogOperation_onceToken_2 != -1)
    dispatch_once(&_CRKLogOperation_onceToken_2, &__block_literal_global_99);
  return (id)_CRKLogOperation_logObj_2;
}

char *OUTLINED_FUNCTION_0_8()
{
  return dlerror();
}

uint64_t CRKScreenshotServiceXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550323A8);
}

id _CRKLogGeneral_15()
{
  if (_CRKLogGeneral_onceToken_33 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_33, &__block_literal_global_101);
  return (id)_CRKLogGeneral_logObj_33;
}

void __crk_tokenized_properties_block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a2;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);
}

void sub_218D19CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218D1BDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_218D1BF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_16()
{
  if (_CRKLogGeneral_onceToken_36 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_36, &__block_literal_global_105);
  return (id)_CRKLogGeneral_logObj_36;
}

void sub_218D1CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_218D1D060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_17()
{
  if (_CRKLogGeneral_onceToken_37 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_37, &__block_literal_global_106);
  return (id)_CRKLogGeneral_logObj_37;
}

id _CRKLogGeneral_18()
{
  if (_CRKLogGeneral_onceToken_38 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_38, &__block_literal_global_110);
  return (id)_CRKLogGeneral_logObj_38;
}

void sub_218D2856C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

id CRKErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  const __CFString *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t kk;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t mm;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  const __CFString *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t nn;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  const __CFString *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i1;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i2;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  const __CFString *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t i3;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  const __CFString *v155;
  void *v156;
  id v157;
  uint64_t v158;
  void *v159;
  uint64_t v161;
  _QWORD v162[4];
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  uint64_t v229;

  v229 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (CRKErrorWithCodeAndUserInfo_onceToken != -1)
    dispatch_once(&CRKErrorWithCodeAndUserInfo_onceToken, &__block_literal_global_112);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSDescriptionKey")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
LABEL_5:
    v7 = v3;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v10 = v3;
    switch(a1)
    {
      case 1:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("An unknown error occurred.");
        goto LABEL_247;
      case 2:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("A parameter was invalid.");
        goto LABEL_247;
      case 3:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The maximum number of retries has been exceeded.");
        goto LABEL_247;
      case 4:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device could not be found.");
        goto LABEL_247;
      case 5:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The provided item cannot be modified.");
        goto LABEL_247;
      case 6:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The instructor is out of range.");
        goto LABEL_247;
      case 7:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The configuration could not be written.");
        goto LABEL_247;
      case 8:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The resource credential could not be retrieved.");
        goto LABEL_247;
      case 9:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Failed to create user notification (error code %@)."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v212 = 0u;
        v213 = 0u;
        v214 = 0u;
        v215 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v212, v228, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v213;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v213 != v15)
                objc_enumerationMutation(v9);
              v17 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCRKCFUserNotificationErrorCodeKey"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), 0, v20);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v21;
              if (v21)
                v23 = (const __CFString *)v21;
              else
                v23 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v17);

            }
            v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v212, v228, 16);
          }
          while (v14);
        }

        v3 = v10;
        goto LABEL_231;
      case 10:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to create run loop source.");
        goto LABEL_247;
      case 11:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to create certificate.");
        goto LABEL_247;
      case 12:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("“%@” not found."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v208 = 0u;
        v209 = 0u;
        v210 = 0u;
        v211 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v208, v227, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v209;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v209 != v26)
                objc_enumerationMutation(v9);
              v28 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * j);
              objc_msgSend(v9, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKItemNameErrorKey"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v31);
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v32;
              if (v32)
                v34 = (const __CFString *)v32;
              else
                v34 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, v28);

              v3 = v10;
            }
            v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v208, v227, 16);
          }
          while (v25);
        }
        goto LABEL_230;
      case 13:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("No app handling URL “%@” was found."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v204 = 0u;
        v205 = 0u;
        v206 = 0u;
        v207 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v204, v226, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v205;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v205 != v37)
                objc_enumerationMutation(v9);
              v39 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * k);
              objc_msgSend(v9, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKURLStringErrorKey"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), 0, v42);
              v43 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v43;
              if (v43)
                v45 = (const __CFString *)v43;
              else
                v45 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, v39);

              v3 = v10;
            }
            v36 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v204, v226, 16);
          }
          while (v36);
        }
        goto LABEL_230;
      case 14:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("“%@” is an invalid session identifier."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v200 = 0u;
        v201 = 0u;
        v202 = 0u;
        v203 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v200, v225, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v201;
          do
          {
            for (m = 0; m != v47; ++m)
            {
              if (*(_QWORD *)v201 != v48)
                objc_enumerationMutation(v9);
              v50 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * m);
              objc_msgSend(v9, "objectForKeyedSubscript:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKSessionIdentifierStringErrorKey"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringWithValidatedFormat:validFormatSpecifiers:error:", v51, CFSTR("%@"), 0, v53);
              v54 = objc_claimAutoreleasedReturnValue();
              v55 = (void *)v54;
              if (v54)
                v56 = (const __CFString *)v54;
              else
                v56 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v56, v50);

              v3 = v10;
            }
            v47 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v200, v225, 16);
          }
          while (v47);
        }
        goto LABEL_230;
      case 15:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Session “%@” is not active."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v196 = 0u;
        v197 = 0u;
        v198 = 0u;
        v199 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v196, v224, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v197;
          do
          {
            for (n = 0; n != v58; ++n)
            {
              if (*(_QWORD *)v197 != v59)
                objc_enumerationMutation(v9);
              v61 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * n);
              objc_msgSend(v9, "objectForKeyedSubscript:", v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKSessionIdentifierStringErrorKey"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "stringWithValidatedFormat:validFormatSpecifiers:error:", v62, CFSTR("%@"), 0, v64);
              v65 = objc_claimAutoreleasedReturnValue();
              v66 = (void *)v65;
              if (v65)
                v67 = (const __CFString *)v65;
              else
                v67 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v67, v61);

              v3 = v10;
            }
            v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v196, v224, 16);
          }
          while (v58);
        }
        goto LABEL_230;
      case 16:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("No enrollment record found.");
        goto LABEL_247;
      case 17:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Identity certificate not available.");
        goto LABEL_247;
      case 18:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user declined to receive the item.");
        goto LABEL_247;
      case 19:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("File path “%@” is invalid."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v192, v223, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v193;
          do
          {
            for (ii = 0; ii != v69; ++ii)
            {
              if (*(_QWORD *)v193 != v70)
                objc_enumerationMutation(v9);
              v72 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * ii);
              objc_msgSend(v9, "objectForKeyedSubscript:", v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKFilePathErrorKey"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "stringWithValidatedFormat:validFormatSpecifiers:error:", v73, CFSTR("%@"), 0, v75);
              v76 = objc_claimAutoreleasedReturnValue();
              v77 = (void *)v76;
              if (v76)
                v78 = (const __CFString *)v76;
              else
                v78 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v78, v72);

              v3 = v10;
            }
            v69 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v192, v223, 16);
          }
          while (v69);
        }
        goto LABEL_230;
      case 20:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to add certificate to keychain.");
        goto LABEL_247;
      case 21:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("VoiceOver is enabled.");
        goto LABEL_247;
      case 22:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The resource is invalid.");
        goto LABEL_247;
      case 23:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The security level of the user's account is not HSA2.");
        goto LABEL_247;
      case 24:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user's account is not eligible for the requested feature.");
        goto LABEL_247;
      case 25:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Could not present a UI alert.");
        goto LABEL_247;
      case 26:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The workspace failed to open the URL.");
        goto LABEL_247;
      case 27:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to add a new Classroom identity to the keychain.");
        goto LABEL_247;
      case 28:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to remove a Classroom identity from the keychain.");
        goto LABEL_247;
      case 29:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Multiple errors exist in the underlying error.");
        goto LABEL_247;
      case 30:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to enroll in course.");
        goto LABEL_247;
      case 31:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The attempted action is unsupported in the simulator.");
        goto LABEL_247;
      case 32:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The operation timed out.");
        goto LABEL_247;
      case 33:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The certificate is temporally invalid.");
        goto LABEL_247;
      case 34:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The common name of the certificate is malformed.");
        goto LABEL_247;
      case 35:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("There are no Apple Accounts.");
        goto LABEL_247;
      case 36:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user identifier contained in the certificate does not match the expected user identifier.");
        goto LABEL_247;
      case 37:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Property “%@” was never retrieved."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v188 = 0u;
        v189 = 0u;
        v190 = 0u;
        v191 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v188, v222, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v189;
          do
          {
            for (jj = 0; jj != v80; ++jj)
            {
              if (*(_QWORD *)v189 != v81)
                objc_enumerationMutation(v9);
              v83 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * jj);
              objc_msgSend(v9, "objectForKeyedSubscript:", v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKPropertyNameErrorKey"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringWithValidatedFormat:validFormatSpecifiers:error:", v84, CFSTR("%@"), 0, v86);
              v87 = objc_claimAutoreleasedReturnValue();
              v88 = (void *)v87;
              if (v87)
                v89 = (const __CFString *)v87;
              else
                v89 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v89, v83);

              v3 = v10;
            }
            v80 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v188, v222, 16);
          }
          while (v80);
        }
        goto LABEL_230;
      case 38:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The instructor is quarantined and not permitted to perform this operation.");
        goto LABEL_247;
      case 39:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("A required primitive subsystem is missing.");
        goto LABEL_247;
      case 40:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The public key could not be extracted.");
        goto LABEL_247;
      case 41:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user canceled the credential renewal attempt.");
        goto LABEL_247;
      case 42:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The credential renewal attempt failed.");
        goto LABEL_247;
      case 43:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Credential renewal has been rate limited.");
        goto LABEL_247;
      case 44:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The account needs more time to process the results of the sign-in.");
        goto LABEL_247;
      case 45:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The status for the IDS ID is unknown. Message sending may or may not succeed.");
        goto LABEL_247;
      case 46:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The status for the IDS ID is invalid. Message sending will not succeed.");
        goto LABEL_247;
      case 47:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The requested action is already in progress.");
        goto LABEL_247;
      case 48:
      case 49:
      case 50:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
        goto LABEL_5;
      case 51:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Partial error from iCloud");
        goto LABEL_247;
      case 52:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Zone does not exist for iCloud operation");
        goto LABEL_247;
      case 53:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Requested item is not found on iCloud");
        goto LABEL_247;
      case 54:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("User not signed into iCloud");
        goto LABEL_247;
      case 55:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("iCloud server unreachable");
        goto LABEL_247;
      case 56:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("This should never happen, error handling must be updated");
        goto LABEL_247;
      case 57:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Releasing resources before they are uploaded to iCloud");
        goto LABEL_247;
      case 58:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("App is too far out of date to interact with iCloud server");
        goto LABEL_247;
      case 59:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Small hiccup on iCloud server, try the operation again");
        goto LABEL_247;
      case 60:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The syncing manager is failing to handle this error");
        goto LABEL_247;
      case 61:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The task is too large for a single iCloud transaction. Divide work in half and try again");
        goto LABEL_247;
      case 62:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Nonrecoverable iCloud syncing failure");
        goto LABEL_247;
      case 63:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("iCloud record modification race");
        goto LABEL_247;
      case 64:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Server token is out of date. Pull update from iCloud");
        goto LABEL_247;
      case 65:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Could not establish a push connection for iCloud container");
        goto LABEL_247;
      case 66:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Could not make the requested engine transition from the current state");
        goto LABEL_247;
      case 67:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Application could not be made visible.");
        goto LABEL_247;
      case 101:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The instructor extension could not be found.");
        goto LABEL_247;
      case 102:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device's screen is off.");
        goto LABEL_247;
      case 103:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("BTLE not available on this device.");
        goto LABEL_247;
      case 104:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("A user with the identifier (%@) could not be found."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v168 = 0u;
        v169 = 0u;
        v170 = 0u;
        v171 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v168, v217, 16);
        if (v90)
        {
          v91 = v90;
          v92 = *(_QWORD *)v169;
          do
          {
            for (kk = 0; kk != v91; ++kk)
            {
              if (*(_QWORD *)v169 != v92)
                objc_enumerationMutation(v9);
              v94 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * kk);
              objc_msgSend(v9, "objectForKeyedSubscript:", v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKInvalidIdentifierErrorKey"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "stringWithValidatedFormat:validFormatSpecifiers:error:", v95, CFSTR("%@"), 0, v97);
              v98 = objc_claimAutoreleasedReturnValue();
              v99 = (void *)v98;
              if (v98)
                v100 = (const __CFString *)v98;
              else
                v100 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v100, v94);

              v3 = v10;
            }
            v91 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v168, v217, 16);
          }
          while (v91);
        }
        goto LABEL_230;
      case 105:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("An error occured while trying to save the user.");
        goto LABEL_247;
      case 106:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("A user is not logged in.");
        goto LABEL_247;
      case 107:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device is locked.");
        goto LABEL_247;
      case 108:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Feature is restricted by profile.");
        goto LABEL_247;
      case 109:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("An error occurred when obtaining permission to perform the request.");
        goto LABEL_247;
      case 110:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user denied permission to perform the request.");
        goto LABEL_247;
      case 111:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Feature “%@” is not modifiable."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v164 = 0u;
        v165 = 0u;
        v166 = 0u;
        v167 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v164, v216, 16);
        if (v101)
        {
          v102 = v101;
          v103 = *(_QWORD *)v165;
          do
          {
            for (mm = 0; mm != v102; ++mm)
            {
              if (*(_QWORD *)v165 != v103)
                objc_enumerationMutation(v9);
              v105 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * mm);
              objc_msgSend(v9, "objectForKeyedSubscript:", v105);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKFeatureErrorKey"));
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "stringWithValidatedFormat:validFormatSpecifiers:error:", v106, CFSTR("%@"), 0, v108);
              v109 = objc_claimAutoreleasedReturnValue();
              v110 = (void *)v109;
              if (v109)
                v111 = (const __CFString *)v109;
              else
                v111 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v111, v105);

              v3 = v10;
            }
            v102 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v164, v216, 16);
          }
          while (v102);
        }
        goto LABEL_230;
      case 112:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The operation is not implemented on the current platform");
        goto LABEL_247;
      case 113:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Unable to fetch today's date.");
        goto LABEL_247;
      case 114:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The student daemon is not available on this platform.");
        goto LABEL_247;
      case 115:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user is unable to open the item");
        goto LABEL_247;
      case 116:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device's screen saver is active");
        goto LABEL_247;
      case 117:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The course mascot and color have already been set for this class session");
        goto LABEL_247;
      case 118:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to set metadata for the course");
        goto LABEL_247;
      case 119:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to pause media");
        goto LABEL_247;
      case 120:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to take screenshot");
        goto LABEL_247;
      case 121:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Failed to wake screen");
        goto LABEL_247;
      case 122:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("The app “%@” is not installed."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v184 = 0u;
        v185 = 0u;
        v186 = 0u;
        v187 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v184, v221, 16);
        if (v112)
        {
          v113 = v112;
          v114 = *(_QWORD *)v185;
          do
          {
            for (nn = 0; nn != v113; ++nn)
            {
              if (*(_QWORD *)v185 != v114)
                objc_enumerationMutation(v9);
              v116 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * nn);
              objc_msgSend(v9, "objectForKeyedSubscript:", v116);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKBundleIdentifierErrorKey"));
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "stringWithValidatedFormat:validFormatSpecifiers:error:", v117, CFSTR("%@"), 0, v119);
              v120 = objc_claimAutoreleasedReturnValue();
              v121 = (void *)v120;
              if (v120)
                v122 = (const __CFString *)v120;
              else
                v122 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v122, v116);

              v3 = v10;
            }
            v113 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v184, v221, 16);
          }
          while (v113);
        }
        goto LABEL_230;
      case 123:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("The provided app “%@” could not be opened."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v183 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v180, v220, 16);
        if (v123)
        {
          v124 = v123;
          v125 = *(_QWORD *)v181;
          do
          {
            for (i1 = 0; i1 != v124; ++i1)
            {
              if (*(_QWORD *)v181 != v125)
                objc_enumerationMutation(v9);
              v127 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * i1);
              objc_msgSend(v9, "objectForKeyedSubscript:", v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKBundleIdentifierErrorKey"));
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "stringWithValidatedFormat:validFormatSpecifiers:error:", v128, CFSTR("%@"), 0, v130);
              v131 = objc_claimAutoreleasedReturnValue();
              v132 = (void *)v131;
              if (v131)
                v133 = (const __CFString *)v131;
              else
                v133 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v133, v127);

              v3 = v10;
            }
            v124 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v180, v220, 16);
          }
          while (v124);
        }
        goto LABEL_230;
      case 124:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("The provided URL “%@” could not be opened."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v176 = 0u;
        v177 = 0u;
        v178 = 0u;
        v179 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v176, v219, 16);
        if (v134)
        {
          v135 = v134;
          v136 = *(_QWORD *)v177;
          do
          {
            for (i2 = 0; i2 != v135; ++i2)
            {
              if (*(_QWORD *)v177 != v136)
                objc_enumerationMutation(v9);
              v138 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * i2);
              objc_msgSend(v9, "objectForKeyedSubscript:", v138);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v140 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKURLStringErrorKey"));
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "stringWithValidatedFormat:validFormatSpecifiers:error:", v139, CFSTR("%@"), 0, v141);
              v142 = objc_claimAutoreleasedReturnValue();
              v143 = (void *)v142;
              if (v142)
                v144 = (const __CFString *)v142;
              else
                v144 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v144, v138);

              v3 = v10;
            }
            v135 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v176, v219, 16);
          }
          while (v135);
        }
        goto LABEL_230;
      case 125:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The volume could not be set.");
        goto LABEL_247;
      case 126:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Canceling Single App Mode timed out.");
        goto LABEL_247;
      case 127:
        v161 = a1;
        v8 = (void *)objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", CFSTR("Single App Mode could not be initiated for the provided bundle identifier “%@”."), &stru_24D9CB490, CFSTR("CRKErrors"));
        v172 = 0u;
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v145 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v218, 16);
        if (v145)
        {
          v146 = v145;
          v147 = *(_QWORD *)v173;
          do
          {
            for (i3 = 0; i3 != v146; ++i3)
            {
              if (*(_QWORD *)v173 != v147)
                objc_enumerationMutation(v9);
              v149 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i3);
              objc_msgSend(v9, "objectForKeyedSubscript:", v149);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v151 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCRKBundleIdentifierErrorKey"));
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v151, "stringWithValidatedFormat:validFormatSpecifiers:error:", v150, CFSTR("%@"), 0, v152);
              v153 = objc_claimAutoreleasedReturnValue();
              v154 = (void *)v153;
              if (v153)
                v155 = (const __CFString *)v153;
              else
                v155 = CFSTR("FORMAT SPECIFIER ERROR");
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v155, v149);

              v3 = v10;
            }
            v146 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v218, 16);
          }
          while (v146);
        }
LABEL_230:

LABEL_231:
        a1 = v161;
        goto LABEL_248;
      case 128:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("A password is required to AirPlay to the requested route.");
        goto LABEL_247;
      case 129:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The supplied password for the AirPlay route was incorrect.");
        goto LABEL_247;
      case 130:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The user initated a disconnect of the management session.");
        goto LABEL_247;
      case 131:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device has been idle for the maximum allowable time.");
        goto LABEL_247;
      case 150:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("ClassKit did not report a known current user for the device");
        goto LABEL_247;
      case 151:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Could not find location with required permissions.");
        goto LABEL_247;
      case 152:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Found several objects matching given object ID.");
        goto LABEL_247;
      case 153:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The same user was requested to be both added to, and removed from, the course.");
        goto LABEL_247;
      case 154:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The connection to the server failed.");
        goto LABEL_247;
      case 155:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("There are too many users to perform the requested operation.");
        goto LABEL_247;
      case 156:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("Your device is not connected to the Internet.");
        goto LABEL_247;
      case 201:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The device is already enrolled.");
        goto LABEL_247;
      case 202:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The student is not enrolled in the course.");
        goto LABEL_247;
      case 203:
        v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        v12 = CFSTR("The instructor is not known or not trusted.");
        goto LABEL_247;
      default:
        if (a1 == 300)
        {
          v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
          v12 = CFSTR("The AirPlay route is out of range.");
        }
        else
        {
          if (a1 != 350)
            goto LABEL_5;
          v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
          v12 = CFSTR("There is no active instructor certificate to vend.");
        }
LABEL_247:
        objc_msgSend(v11, "cat_localizedStringsForKey:value:table:", v12, &stru_24D9CB490, CFSTR("CRKErrors"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
LABEL_248:
        v7 = v3;
        if (v8)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          v162[0] = MEMORY[0x24BDAC760];
          v162[1] = 3221225472;
          v162[2] = __CRKErrorWithCodeAndUserInfo_block_invoke_2;
          v162[3] = &unk_24D9CA870;
          v163 = v156;
          v157 = v156;
          objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v162);
          v158 = objc_msgSend(v157, "copy");

          v7 = (id)v158;
        }
        break;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ClassroomKit.error"), a1, v7);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  return v159;
}

id _CRKLogGeneral_19()
{
  if (_CRKLogGeneral_onceToken_40 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_40, &__block_literal_global_113);
  return (id)_CRKLogGeneral_logObj_40;
}

void sub_218D2C0C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_218D2D454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218D2D6D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_20()
{
  if (_CRKLogGeneral_onceToken_41 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_41, &__block_literal_global_88);
  return (id)_CRKLogGeneral_logObj_41;
}

id _CRKLogGeneral_21()
{
  if (_CRKLogGeneral_onceToken_44 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_44, &__block_literal_global_119);
  return (id)_CRKLogGeneral_logObj_44;
}

void sub_218D38220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218D39410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_218D39AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_22()
{
  if (_CRKLogGeneral_onceToken_47 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_47, &__block_literal_global_122);
  return (id)_CRKLogGeneral_logObj_47;
}

void CRTLogError_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

void JSONStringRepresentation_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Error encoding JSON data: %@", (uint8_t *)&v5, 0xCu);

}

void _BOMCopierDidGenerateFatalError_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Encountered FATAL error: %{public}@", (uint8_t *)&v6, 0x16u);

}

void BomLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *BomLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CRKUnzipOperation.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_BOMCopierUserData_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *soft_BOMCopierUserData(BOMCopier)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CRKUnzipOperation.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0_8());

  __break(1u);
}

uint64_t CATErrorWithCodeAndUserInfo()
{
  return MEMORY[0x24BE2C4B0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x24BDBBAB8](bundle, functionName);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return MEMORY[0x24BDBBAF0](bundle);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x24BDBC4A0](alloc, host, *(_QWORD *)&port, readStream, writeStream);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE060](c, red, green, blue, alpha);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE9A0](dict, key, value);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA08](url);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEA60](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x24BDBEC08](retstr, page, *(_QWORD *)&box, *(_QWORD *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDBED40](string);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x24BE4F980]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x24BE4F9B0]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
  MEMORY[0x24BDD8748](*(_QWORD *)&theAssertion);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

uint64_t NSStringFromCLSASMPrivilegeType()
{
  return MEMORY[0x24BDB8538]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBLockDevice()
{
  return MEMORY[0x24BEB0B88]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t SBSUndimScreen()
{
  return MEMORY[0x24BEB0D98]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x24BDE8830]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x24BDE8938]();
}

uint64_t SecCertificateGetSignatureHashAlgorithm()
{
  return MEMORY[0x24BDE8940]();
}

uint64_t SecCertificateIsCA()
{
  return MEMORY[0x24BDE8958]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x24BDE8978]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x24BDE89F0](*(_QWORD *)&status, reserved);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return MEMORY[0x24BDE8B60](parameters, publicKey, privateKey);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x24BDE8B70](key);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_errno()
{
  return MEMORY[0x24BEDA428]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_disk_entry_from_file()
{
  return MEMORY[0x24BEDA480]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x24BEDA488]();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return MEMORY[0x24BEDA498]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x24BEDA660]();
}

uint64_t archive_write_set_options()
{
  return MEMORY[0x24BEDA668]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x24BDAE2B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x24BDAE8A8](*(_QWORD *)&a1.s_addr);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x24BDE0E30](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

uint64_t nw_interface_copy_local_address_for_remote_address()
{
  return MEMORY[0x24BDE1368]();
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x24BDE1808](path, enumerate_block);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A20](*(_QWORD *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x24BEDCF98](name);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_registerProtocol(Protocol *proto)
{
  MEMORY[0x24BEDD178](proto);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
  MEMORY[0x24BEDD4C0](proto, addition);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x24BEDD4F0](p);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x24BDAFDE8](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

