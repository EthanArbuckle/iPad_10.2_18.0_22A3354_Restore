uint64_t FBKSIsInternalInstall()
{
  if (FBKSIsInternalInstall_onceToken != -1)
    dispatch_once(&FBKSIsInternalInstall_onceToken, &__block_literal_global);
  return FBKSIsInternalInstall__isInternal;
}

uint64_t FBKSEnvironmentFromString(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("stagingDev")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("staging")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("development")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("demo")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *FBKSStringFromEnvironment(int a1)
{
  uint64_t v1;

  v1 = a1 - 1;
  if (v1 > 3)
    return CFSTR("production");
  else
    return off_250C5F518[v1];
}

id _FBKSNilIfNSNull(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x24BDBCEF8];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v2)
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

id Log()
{
  if (Log_onceToken1 != -1)
    dispatch_once(&Log_onceToken1, &__block_literal_global_0);
  return (id)Log_handle;
}

void sub_23B43907C(_Unwind_Exception *a1, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    Log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.1();

    objc_end_catch();
    JUMPOUT(0x23B43902CLL);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t FBKSIsValidErrorResponse(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char isKindOfClass;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("errors"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

id FBKSErrorForDict(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("code"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("message"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    if (v3 && v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v3, "integerValue");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v5;
        else
          v8 = &stru_250C613A8;
        v9 = (void *)MEMORY[0x24BDD1540];
        v12 = CFSTR("message");
        v13[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FeedbackService"), v7, v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t FBKSErrorContainsSP2ErrorCode(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FBKSSeedPortalErrorsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("FBKSAggregatedErrorsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "code") == a2)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_20;
        }
      }
LABEL_21:
      v17 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    if (!v7)
    {
      v17 = 0;
      goto LABEL_23;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
LABEL_14:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v8);
        if ((FBKSErrorContainsSP2ErrorCode(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), a2) & 1) != 0)
          goto LABEL_21;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v14)
            goto LABEL_14;
          break;
        }
      }
    }
  }
LABEL_20:
  v17 = 0;
LABEL_22:

LABEL_23:
  return v17;
}

id FBKSError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FBKSError() with stringError == nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("InvalidParameterException"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BDD0BA0];
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FeedbackService"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_23B43A45C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FBKSLog()
{
  if (FBKSLog_onceToken != -1)
    dispatch_once(&FBKSLog_onceToken, &__block_literal_global_1);
  return (id)FBKSLog_handle;
}

id FBKSSP2Log()
{
  if (FBKSSP2Log_onceToken != -1)
    dispatch_once(&FBKSSP2Log_onceToken, &__block_literal_global_2);
  return (id)FBKSSP2Log_handle;
}

uint64_t FBKSHasInternalDiagnostics()
{
  if (FBKSHasInternalDiagnostics_onceToken != -1)
    dispatch_once(&FBKSHasInternalDiagnostics_onceToken, &__block_literal_global_4);
  return FBKSHasInternalDiagnostics__isInternal;
}

uint64_t FBKSHasInternalUI()
{
  if (FBKSHasInternalUI_onceToken != -1)
    dispatch_once(&FBKSHasInternalUI_onceToken, &__block_literal_global_5);
  return FBKSHasInternalUI__isInternal;
}

id Log_0()
{
  if (Log_onceToken[0] != -1)
    dispatch_once(Log_onceToken, &__block_literal_global_2);
  return (id)Log_handle_0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

Swift::String __swiftcall FBKSLocalizedString(key:)(Swift::String key)
{
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  type metadata accessor for AClassInFBKS();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = sub_23B4832FC();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t type metadata accessor for AClassInFBKS()
{
  return objc_opt_self();
}

uint64_t sub_23B43BB14()
{
  return swift_deallocClassInstance();
}

void sub_23B43BB24(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23B43BB2C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for CFError()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256A1A548)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256A1A548);
  }
}

uint64_t User.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t User.isUnauthenticated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t User.loggedInDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for User() + 24);
  v4 = sub_23B483380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for User()
{
  uint64_t result;

  result = qword_256A1A558;
  if (!qword_256A1A558)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t User.sessionExpiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for User() + 28);
  v4 = sub_23B483380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

BOOL User.hasExpiredSession.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_23B483380();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B483374();
  type metadata accessor for User();
  sub_23B43BD14();
  v4 = sub_23B48341C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (v4 & 1) == 0;
}

unint64_t sub_23B43BD14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A1A550;
  if (!qword_256A1A550)
  {
    v1 = sub_23B483380();
    result = MEMORY[0x23B8651F0](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_256A1A550);
  }
  return result;
}

uint64_t User.description.getter()
{
  sub_23B483608();
  swift_bridgeObjectRelease();
  sub_23B4837AC();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B483488();
  swift_bridgeObjectRelease();
  return 0x69202D2072657355;
}

_QWORD *initializeBufferWithCopyOfBuffer for User(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v7 = *(int *)(a3 + 24);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = sub_23B483380();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v11((uint64_t)v4 + *(int *)(a3 + 28), (uint64_t)a2 + *(int *)(a3 + 28), v10);
  }
  return v4;
}

uint64_t destroy for User(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23B483380();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 28), v5);
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23B483380();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23B483380();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23B483380();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23B483380();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for User()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B43C1E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 8);
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = sub_23B483380();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for User()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B43C270(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 8) = a2 + 1;
  }
  else
  {
    v7 = sub_23B483380();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23B43C2E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B483380();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23B43C360()
{
  uint64_t v0;

  v0 = sub_23B4833E0();
  __swift_allocate_value_buffer(v0, qword_256A1A568);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A1A568);
  return sub_23B4833D4();
}

id sub_23B43C3DC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DaemonAdminConnection()), sel_init);
  qword_256A1BC60 = (uint64_t)result;
  return result;
}

id sub_23B43C450()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin);
  }
  else
  {
    swift_getObjectType();
    v4 = sub_23B43C4BC(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23B43C4BC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t aBlock;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  void (*v21)();
  uint64_t v22;

  if (qword_256A1A4A8 != -1)
    swift_once();
  v2 = sub_23B4833E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A1A568);
  v3 = sub_23B4833C8();
  v4 = sub_23B4835A8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_23B43C788();
    sub_23B44BBC0(v7, v8, &aBlock);
    sub_23B4835D8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v3, v4, "%s: Setting up connection admin daemon connection", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v6, -1, -1);
    MEMORY[0x23B86528C](v5, -1, -1);
  }

  v9 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v10 = (void *)sub_23B483428();
  v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FeedbackDaemonAdminInterface()), sel_init);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  objc_msgSend(v11, sel_setExportedObject_, a1);
  v21 = sub_23B43C7F4;
  v22 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor;
  v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  v21 = sub_23B43C810;
  v22 = 0;
  aBlock = v13;
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor_3;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v11, sel_resume);
  return v11;
}

uint64_t sub_23B43C788()
{
  objc_class *ObjCClassFromMetadata;
  NSString *v1;
  uint64_t v2;

  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v1 = NSStringFromClass(ObjCClassFromMetadata);
  v2 = sub_23B483434();

  return v2;
}

id FeedbackDaemonAdminInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_23B43C7F4()
{
  sub_23B43C82C(0x800000023B48D320, "Connection to daemon interrupted from admin service");
}

void sub_23B43C810()
{
  sub_23B43C82C(0x800000023B48D2E0, "Connection to daemon invalidated from admin service");
}

void sub_23B43C82C(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23B484E90;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 32) = 0xD000000000000033;
  *(_QWORD *)(v4 + 40) = a1;
  sub_23B48383C();
  swift_bridgeObjectRelease();
  if (qword_256A1A4A8 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1A568);
  oslog = sub_23B4833C8();
  v6 = sub_23B4835A8();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B433000, oslog, v6, a2, v7, 2u);
    MEMORY[0x23B86528C](v7, -1, -1);
  }

}

uint64_t sub_23B43C960(uint64_t a1, uint64_t a2)
{
  return sub_23B43C9A8(a1, a2, (uint64_t)&unk_250C5F830, (uint64_t)sub_23B43D0A0, (uint64_t)&block_descriptor_14, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
}

uint64_t sub_23B43C984(uint64_t a1, uint64_t a2)
{
  return sub_23B43C9A8(a1, a2, (uint64_t)&unk_250C5F808, (uint64_t)sub_23B43D0D4, (uint64_t)&block_descriptor_8, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
}

uint64_t sub_23B43C9A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  _QWORD aBlock[6];

  v11 = sub_23B43C450();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  aBlock[4] = a4;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B450F3C;
  aBlock[3] = a5;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v11, *a6, v13);
  _Block_release(v13);

  sub_23B4835FC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5C8);
  if (swift_dynamicCast())
    return v16;
  else
    return 0;
}

void sub_23B43CAD0(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23B484E90;
  sub_23B483608();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_23B483800();
  sub_23B483488();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 32) = 0xD00000000000001DLL;
  *(_QWORD *)(v3 + 40) = 0x800000023B48D3A0;
  sub_23B48383C();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_23B483308();
  a2();

}

id sub_23B43CBE8()
{
  return sub_23B43CFBC(type metadata accessor for DaemonAdminConnection);
}

uint64_t FeedbackDaemonAdminInterface.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for FeedbackDaemonAdminInterface();
  objc_msgSend(objc_msgSendSuper2(&v6, sel_init), sel_setProtocol_, &unk_256A2EEA0);
  sub_23B43CF58(0, &qword_256A1A580);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23B484EA0;
  v2 = sub_23B43CF58(0, &qword_256A1A590);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A598);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_23B43CF58(0, &qword_256A1A5A0);
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5A8);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_23B43CF58(0, &qword_256A1A5B0);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5B8);
  *(_QWORD *)(v1 + 96) = v4;
  MEMORY[0x23B864974](v1);
  result = sub_23B483554();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FeedbackDaemonAdminInterface()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8651D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23B43CF58(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id FeedbackDaemonAdminInterface.__deallocating_deinit()
{
  return sub_23B43CFBC(type metadata accessor for FeedbackDaemonAdminInterface);
}

id sub_23B43CFBC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for DaemonAdminConnection()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t sub_23B43D07C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23B43D0A0(uint64_t a1)
{
  uint64_t v1;

  sub_23B43CAD0(a1, *(void (**)(void))(v1 + 16));
}

uint64_t Failure.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

FeedbackService::Failure __swiftcall Failure.init(message:)(FeedbackService::Failure message)
{
  FeedbackService::Failure *v1;

  *v1 = message;
  return message;
}

_QWORD *initializeBufferWithCopyOfBuffer for Failure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Failure()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Failure(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for Failure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Failure(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Failure(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Failure()
{
  return &type metadata for Failure;
}

uint64_t FBKSForm.asJSON.getter()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  type metadata accessor for FBKSForm();
  sub_23B43EFCC(&qword_256A1A5F0, (uint64_t)&protocol conformance descriptor for FBKSForm);
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t FBKSForm.asFBAURLScheme(isSurvey:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t i;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t *v52;
  void (*v53)(uint64_t *, _QWORD);
  unint64_t *v54;
  unint64_t v55;
  char v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t *v60;
  uint64_t (*v61)(uint64_t *, _QWORD);
  unint64_t *v62;
  unint64_t v63;
  char v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  int64_t v79;
  uint64_t v80;
  int64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;

  v2 = v1;
  v76 = a1;
  v87 = sub_23B483278();
  v3 = *(_QWORD *)(v87 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v91 = (char *)&v72 - v6;
  v7 = sub_23B483260();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_23B4832CC();
  v74 = *(_QWORD *)(v75 - 8);
  v11 = MEMORY[0x24BDAC7A8](v75);
  v73 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v72 - v13;
  sub_23B4832C0();
  sub_23B4832A8();
  sub_23B4832B4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A600);
  v85 = *(_QWORD *)(v3 + 72);
  v86 = v3;
  v15 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23B484E90;
  v84 = v15;
  v16 = (uint64_t *)(v2 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  v17 = v16[1];
  v93 = *v16;
  v94 = v17;
  swift_bridgeObjectRetain();
  sub_23B483254();
  sub_23B43ED10();
  sub_23B4835F0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  sub_23B48326C();
  swift_bridgeObjectRelease();
  v88 = v14;
  sub_23B483290();
  v18 = (uint64_t *)(v2 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  swift_beginAccess();
  v19 = *v18;
  v20 = *(_QWORD *)(*v18 + 64);
  v78 = *v18 + 64;
  v21 = 1 << *(_BYTE *)(v19 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v79 = (unint64_t)(v21 + 63) >> 6;
  v80 = v19;
  result = swift_bridgeObjectRetain();
  v25 = 0;
  if (v23)
    goto LABEL_7;
LABEL_8:
  while (2)
  {
    v29 = v25 + 1;
    if (!__OFADD__(v25, 1))
    {
      if (v29 < v79)
      {
        v30 = *(_QWORD *)(v78 + 8 * v29);
        v31 = v25 + 1;
        if (v30)
          goto LABEL_21;
        v31 = v25 + 2;
        if (v25 + 2 >= v79)
          goto LABEL_58;
        v30 = *(_QWORD *)(v78 + 8 * v31);
        if (v30)
          goto LABEL_21;
        v31 = v25 + 3;
        if (v25 + 3 >= v79)
          goto LABEL_58;
        v30 = *(_QWORD *)(v78 + 8 * v31);
        if (v30)
        {
LABEL_21:
          v27 = (v30 - 1) & v30;
          v81 = v31;
          for (i = __clz(__rbit64(v30)) + (v31 << 6); ; i = v26 | (v25 << 6))
          {
            v82 = v27;
            v33 = (uint64_t *)(*(_QWORD *)(v80 + 48) + 16 * i);
            v35 = *v33;
            v34 = v33[1];
            v36 = *(_QWORD *)(*(_QWORD *)(v80 + 56) + 8 * i);
            v37 = *(_QWORD *)(v36 + 16);
            v89 = *v33;
            v90 = v34;
            if (v37)
            {
              sub_23B43ED54(v35, v34);
              swift_bridgeObjectRetain();
              v38 = (uint64_t *)(v36 + 40);
              v39 = MEMORY[0x24BEE4AF8];
              do
              {
                v44 = *(v38 - 1);
                v43 = *v38;
                v45 = HIBYTE(*v38) & 0xF;
                if ((*v38 & 0x2000000000000000) == 0)
                  v45 = v44 & 0xFFFFFFFFFFFFLL;
                if (v45)
                {
                  swift_bridgeObjectRetain();
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  v93 = v39;
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  {
                    sub_23B43E2C0(0, *(_QWORD *)(v39 + 16) + 1, 1);
                    v39 = v93;
                  }
                  v41 = *(_QWORD *)(v39 + 16);
                  v40 = *(_QWORD *)(v39 + 24);
                  if (v41 >= v40 >> 1)
                  {
                    sub_23B43E2C0(v40 > 1, v41 + 1, 1);
                    v39 = v93;
                  }
                  *(_QWORD *)(v39 + 16) = v41 + 1;
                  v42 = v39 + 16 * v41;
                  *(_QWORD *)(v42 + 32) = v44;
                  *(_QWORD *)(v42 + 40) = v43;
                }
                v38 += 2;
                --v37;
              }
              while (v37);
              swift_bridgeObjectRelease();
              v35 = v89;
              v47 = v90;
            }
            else
            {
              v47 = v34;
              sub_23B43ED54(v35, v34);
              v39 = MEMORY[0x24BEE4AF8];
            }
            v48 = *(_QWORD *)(v39 + 16);
            v83 = 8 * v47;
            if (v48 > 1)
              break;
            if (!v48)
              goto LABEL_5;
            swift_bridgeObjectRetain();
            swift_release();
            if (qword_256A1A4B8 != -1)
              swift_once();
            v93 = 0x6E6F697473657571;
            v94 = 0xE90000000000005BLL;
            v59 = v90;
            sub_23B43ED54(v35, v90);
            sub_23B483488();
            swift_bridgeObjectRelease();
            sub_23B43ED68(v35, v59);
            sub_23B483488();
            v61 = (uint64_t (*)(uint64_t *, _QWORD))sub_23B483284();
            if (!*v60)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = v61(&v93, 0);
              goto LABEL_6;
            }
            v62 = v60;
            sub_23B48326C();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v63 = *v62;
            v64 = swift_isUniquelyReferenced_nonNull_native();
            *v62 = v63;
            v23 = v82;
            if ((v64 & 1) == 0)
            {
              v63 = sub_23B43DFAC(0, *(_QWORD *)(v63 + 16) + 1, 1, v63);
              *v62 = v63;
            }
            v66 = *(_QWORD *)(v63 + 16);
            v65 = *(_QWORD *)(v63 + 24);
            if (v66 >= v65 >> 1)
            {
              v63 = sub_23B43DFAC(v65 > 1, v66 + 1, 1, v63);
              *v62 = v63;
            }
            v25 = v81;
            *(_QWORD *)(v63 + 16) = v66 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v63 + v84 + v66 * v85, v77, v87);
            result = v61(&v93, 0);
            if (!v23)
              goto LABEL_8;
LABEL_7:
            v26 = __clz(__rbit64(v23));
            v27 = (v23 - 1) & v23;
            v81 = v25;
          }
          v49 = 0;
          v50 = v39 + 40;
          do
          {
            v51 = qword_256A1A4C0;
            swift_bridgeObjectRetain();
            if (v51 != -1)
              swift_once();
            v92 = v49;
            v93 = 0x6E6F697473657571;
            v94 = 0xEA00000000005B73;
            sub_23B4837AC();
            sub_23B483488();
            swift_bridgeObjectRelease();
            sub_23B483488();
            sub_23B43ED54(v35, v90);
            sub_23B483488();
            swift_bridgeObjectRelease();
            sub_23B483488();
            v53 = (void (*)(uint64_t *, _QWORD))sub_23B483284();
            if (*v52)
            {
              v54 = v52;
              sub_23B48326C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v55 = *v54;
              v56 = swift_isUniquelyReferenced_nonNull_native();
              *v54 = v55;
              if ((v56 & 1) == 0)
              {
                v55 = sub_23B43DFAC(0, *(_QWORD *)(v55 + 16) + 1, 1, v55);
                *v54 = v55;
              }
              v58 = *(_QWORD *)(v55 + 16);
              v57 = *(_QWORD *)(v55 + 24);
              if (v58 >= v57 >> 1)
              {
                v55 = sub_23B43DFAC(v57 > 1, v58 + 1, 1, v55);
                *v54 = v55;
              }
              *(_QWORD *)(v55 + 16) = v58 + 1;
              (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v55 + v84 + v58 * v85, v91, v87);
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            v53(&v93, 0);
            ++v49;
            v50 += 16;
            v35 = v89;
          }
          while (v48 != v49);
LABEL_5:
          swift_release();
          result = sub_23B43ED68(v35, v90);
LABEL_6:
          v25 = v81;
          v23 = v82;
          if (!v82)
            continue;
          goto LABEL_7;
        }
        v32 = v25 + 4;
        if (v25 + 4 < v79)
        {
          v30 = *(_QWORD *)(v78 + 8 * v32);
          if (v30)
          {
            v31 = v25 + 4;
            goto LABEL_21;
          }
          while (1)
          {
            v31 = v32 + 1;
            if (__OFADD__(v32, 1))
              goto LABEL_60;
            if (v31 >= v79)
              break;
            v30 = *(_QWORD *)(v78 + 8 * v31);
            ++v32;
            if (v30)
              goto LABEL_21;
          }
        }
      }
LABEL_58:
      swift_release();
      v67 = v74;
      v68 = v73;
      v69 = v88;
      v70 = v75;
      (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v73, v88, v75);
      sub_23B48329C();
      v71 = *(void (**)(char *, uint64_t))(v67 + 8);
      v71(v68, v70);
      return ((uint64_t (*)(char *, uint64_t))v71)(v69, v70);
    }
    break;
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

void sub_23B43DF60()
{
  qword_256A1A5D0 = 0x6E6F697473657571;
  *(_QWORD *)algn_256A1A5D8 = 0xE800000000000000;
}

void sub_23B43DF84()
{
  qword_256A1A5E0 = 0x6E6F697473657571;
  *(_QWORD *)algn_256A1A5E8 = 0xE900000000000073;
}

uint64_t sub_23B43DFAC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A600);
  v10 = *(_QWORD *)(sub_23B483278() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23B48365C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_23B483278() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23B43EDC0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_23B43E1B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A618);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23B43EED8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B43E2C0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B43E314(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B43E2DC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B43E47C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B43E2F8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B43E5F4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B43E314(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A618);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

uint64_t sub_23B43E47C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A620);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

uint64_t sub_23B43E5F4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

uint64_t _s15FeedbackService8FBKSFormC12setQuestions13nsMutableDictySo19NSMutableDictionaryC_tF_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  char v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];
  _OWORD v21[4];
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  v0 = sub_23B48356C();
  swift_retain();
  sub_23B483578();
  sub_23B43F00C((uint64_t)v21, (uint64_t)&v22);
  if (!v23)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return swift_release_n();
  }
  v1 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    sub_23B43F054(&v24, v21);
    sub_23B43F054(&v22, v20);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_4;
    sub_23B43F084((uint64_t)v21, (uint64_t)v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A638);
    if ((swift_dynamicCast() & 1) != 0)
      break;
    swift_bridgeObjectRelease();
LABEL_4:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_5:
    sub_23B483578();
    sub_23B43F00C((uint64_t)v21, (uint64_t)&v22);
    if (!v23)
      goto LABEL_20;
  }
  v2 = v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v20[0] = v1;
  v5 = sub_23B475F0C(v18, v19);
  v6 = v1[2];
  v7 = (v4 & 1) == 0;
  v8 = v6 + v7;
  if (!__OFADD__(v6, v7))
  {
    v9 = v4;
    if (v1[3] >= v8)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v1 = *(_QWORD **)&v20[0];
        if ((v4 & 1) == 0)
          goto LABEL_17;
      }
      else
      {
        sub_23B476A64();
        v1 = *(_QWORD **)&v20[0];
        if ((v9 & 1) == 0)
          goto LABEL_17;
      }
    }
    else
    {
      sub_23B476010(v8, isUniquelyReferenced_nonNull_native);
      v10 = sub_23B475F0C(v18, v19);
      if ((v9 & 1) != (v11 & 1))
        goto LABEL_23;
      v5 = v10;
      v1 = *(_QWORD **)&v20[0];
      if ((v9 & 1) == 0)
      {
LABEL_17:
        v1[(v5 >> 6) + 8] |= 1 << v5;
        v13 = (uint64_t *)(v1[6] + 16 * v5);
        *v13 = v18;
        v13[1] = v19;
        *(_QWORD *)(v1[7] + 8 * v5) = v18;
        v14 = v1[2];
        v15 = __OFADD__(v14, 1);
        v16 = v14 + 1;
        if (v15)
          goto LABEL_22;
        v1[2] = v16;
        swift_bridgeObjectRetain();
        goto LABEL_19;
      }
    }
    v12 = v1[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v12 + 8 * v5) = v18;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
    v0 = v2;
    goto LABEL_5;
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  result = sub_23B4837F4();
  __break(1u);
  return result;
}

uint64_t _s15FeedbackService8FBKSFormC8fromJSON4dataACSg10Foundation4DataV_tFZ_0()
{
  uint64_t v1;

  sub_23B4833E0();
  MEMORY[0x24BDAC7A8]();
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  type metadata accessor for FBKSForm();
  sub_23B43EFCC(&qword_256A1A628, (uint64_t)&protocol conformance descriptor for FBKSForm);
  sub_23B4831E8();
  swift_release();
  return v1;
}

unint64_t sub_23B43ED10()
{
  unint64_t result;

  result = qword_256A1A608;
  if (!qword_256A1A608)
  {
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256A1A608);
  }
  return result;
}

uint64_t sub_23B43ED54(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23B43ED68(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23B43ED7C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_23B43EDC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_23B483278() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

uint64_t sub_23B43EED8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

uint64_t sub_23B43EFCC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FBKSForm();
    result = MEMORY[0x23B8651F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B43F00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23B43F054(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23B43F084(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23B43F114()
{
  sub_23B483608();
  swift_bridgeObjectRelease();
  sub_23B483488();
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

unint64_t FBKSEvaluation.EvaluationError.description.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t static FBKSEvaluation.EvaluationError.== infix(_:_:)()
{
  return 1;
}

uint64_t FBKSEvaluation.EvaluationError.hash(into:)()
{
  return sub_23B483854();
}

uint64_t FBKSEvaluation.EvaluationError.hashValue.getter()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B43F238()
{
  return 1;
}

uint64_t sub_23B43F244()
{
  return sub_23B483854();
}

unint64_t sub_23B43F26C()
{
  return 0xD00000000000001ALL;
}

uint64_t static FBKSEvaluation.Subject.ID(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23B4833B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  type metadata accessor for FBKSEvaluation.Subject(0);
  return swift_storeEnumTagMultiPayload();
}

id static FBKSEvaluation.Subject.evaluatedFeature(_:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for FBKSEvaluation.Subject(0);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t FBKSEvaluation.Subject.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[2];

  v1 = v0;
  v2 = sub_23B4833B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (void **)((char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B440FEC(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = *v8;
    strcpy((char *)v13, "interaction: ");
    HIWORD(v13[1]) = -4864;
    v10 = objc_msgSend(v9, sel_description);
    sub_23B483434();

    sub_23B483488();
    swift_bridgeObjectRelease();
    return v13[0];
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v3 + 32))(v5, v8, v2);
    v13[0] = 540697705;
    v13[1] = 0xE400000000000000;
    sub_23B44646C(&qword_256A1A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23B4837AC();
    sub_23B483488();
    swift_bridgeObjectRelease();
    v11 = v13[0];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v11;
}

void FBKSEvaluation.Subject.evaluationID.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (void **)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B440FEC(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = *v6;
    v8 = (uint64_t)*v6 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
    swift_beginAccess();
    sub_23B448908(v8, a1, &qword_256A1A650);

  }
  else
  {
    v9 = sub_23B4833B0();
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, void **, uint64_t))(v10 + 32))(a1, v6, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
}

void FBKSEvaluation.Subject.presented(_:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  uint64_t v14;

  v3 = v2;
  v6 = sub_23B4833B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (void **)((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B440FEC(v3, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = *v12;
    sub_23B45BDE8(a1, a2);

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v7 + 32))(v9, v12, v6);
    _s15FeedbackService12FBKSDonationC9presented12evaluationID10completiony10Foundation4UUIDV_ys5Error_pSgctFZ_0((uint64_t)v9, a1, a2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t FBKSEvaluation.Subject.presented()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_23B4833B0();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = type metadata accessor for FBKSEvaluation.Subject(0);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B43F784()
{
  uint64_t *v0;
  int EnumCaseMultiPayload;
  uint64_t *v2;
  _QWORD *v3;
  _QWORD *v5;

  sub_23B440FEC(v0[2], v0[7]);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v2 = (uint64_t *)v0[7];
  if (EnumCaseMultiPayload == 1)
  {
    v0[10] = *v2;
    v3 = (_QWORD *)swift_task_alloc();
    v0[11] = (uint64_t)v3;
    *v3 = v0;
    v3[1] = sub_23B43F904;
    return sub_23B45C294();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v0[4] + 32))(v0[5], v2, v0[3]);
    type metadata accessor for FBKSDonation();
    v5 = (_QWORD *)swift_task_alloc();
    v0[8] = (uint64_t)v5;
    *v5 = v0;
    v5[1] = sub_23B43F850;
    return static FBKSDonation.presented(evaluationID:)(v0[5]);
  }
}

uint64_t sub_23B43F850()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B43F8B4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B43F904()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B43F968()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B43F9B0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B43FA00()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void FBKSEvaluation.Subject.evaluate(action:formResponse:completion:)(char *a1, uint64_t *a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  _BYTE *v18;
  uint64_t *v19;
  id v20;
  id v21;
  objc_super v22;

  v5 = v4;
  v10 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = *a2;
  v15 = a2[1];
  v16 = a2[2];
  sub_23B440FEC(v5, (uint64_t)v12);
  v17 = (objc_class *)type metadata accessor for FBKSEvaluation(0);
  v18 = objc_allocWithZone(v17);
  sub_23B440FEC((uint64_t)v12, (uint64_t)&v18[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
  v18[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = v13;
  v19 = (uint64_t *)&v18[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
  *v19 = v14;
  v19[1] = v15;
  v19[2] = v16;
  sub_23B445D10(v14, v15);
  v22.receiver = v18;
  v22.super_class = v17;
  v20 = objc_msgSendSuper2(&v22, sel_init);
  sub_23B445D40((uint64_t)v12);
  swift_retain();
  v21 = v20;
  sub_23B445D7C(v21, a3, a4, v21);
  swift_release();

}

id FBKSEvaluation.__allocating_init(subject:action:formResponse:)(uint64_t a1, _BYTE *a2, __int128 *a3)
{
  objc_class *v3;
  _BYTE *v7;
  uint64_t v8;
  char *v9;
  id v10;
  __int128 v12;
  objc_super v13;

  v7 = objc_allocWithZone(v3);
  LOBYTE(a2) = *a2;
  v12 = *a3;
  v8 = *((_QWORD *)a3 + 2);
  sub_23B440FEC(a1, (uint64_t)&v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
  v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = (_BYTE)a2;
  v9 = &v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
  *(_OWORD *)v9 = v12;
  *((_QWORD *)v9 + 2) = v8;
  v13.receiver = v7;
  v13.super_class = v3;
  v10 = objc_msgSendSuper2(&v13, sel_init);
  sub_23B445D40(a1);
  return v10;
}

void sub_23B43FC44(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (id *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B448908(a1, (uint64_t)v9, &qword_256A1A758);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = *v9;
    v11 = *v9;
    a2(v10, 1);

  }
  else
  {
    sub_23B448B30((uint64_t)v9, &qword_256A1A758);
    a2(a4, 0);
  }
}

uint64_t FBKSEvaluation.Subject.evaluate(action:formResponse:)(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;

  *(_QWORD *)(v3 + 32) = v2;
  v6 = sub_23B4833B0();
  *(_QWORD *)(v3 + 40) = v6;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  type metadata accessor for FBKSEvaluation.Subject(0);
  *(_QWORD *)(v3 + 64) = swift_task_alloc();
  *(_BYTE *)(v3 + 120) = *a1;
  *(_OWORD *)(v3 + 72) = *(_OWORD *)a2;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(a2 + 16);
  return swift_task_switch();
}

uint64_t sub_23B43FDDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  _BYTE *v7;
  uint64_t *v8;
  id v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_BYTE *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  sub_23B440FEC(*(_QWORD *)(v0 + 32), v5);
  v6 = (objc_class *)type metadata accessor for FBKSEvaluation(0);
  v7 = objc_allocWithZone(v6);
  sub_23B440FEC(v5, (uint64_t)&v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
  v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = v3;
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
  *v8 = v4;
  v8[1] = v1;
  v8[2] = v2;
  sub_23B445D10(v4, v1);
  *(_QWORD *)(v0 + 16) = v7;
  *(_QWORD *)(v0 + 24) = v6;
  v9 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  *(_QWORD *)(v0 + 96) = v9;
  sub_23B445D40(v5);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v10;
  *v10 = v0;
  v10[1] = sub_23B43FEEC;
  v10[8] = *(_QWORD *)(v0 + 56);
  v10[9] = v9;
  return swift_task_switch();
}

uint64_t sub_23B43FEEC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B43FF50()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_23B43FFA4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FBKSEvaluation.Subject.represents(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned int (*v22)(void **, uint64_t, uint64_t);
  void *v23;
  char v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  void *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;

  v2 = type metadata accessor for FBKSEvaluation.Subject(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (void **)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (void **)((char *)&v32 - v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (void **)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  v14 = sub_23B4833B0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v32 - v19;
  v32 = a1;
  v21 = a1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448908(v21, (uint64_t)v13, &qword_256A1A650);
  v22 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v15 + 48);
  if (v22((void **)v13, 1, v14) != 1)
  {
    v25 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v25(v20, v13, v14);
    sub_23B440FEC(v33, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = v20;
      v27 = *v7;
      v28 = (uint64_t)*v7 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
      swift_beginAccess();
      sub_23B448908(v28, (uint64_t)v11, &qword_256A1A650);
      if (v22(v11, 1, v14) == 1)
      {
        sub_23B448B30((uint64_t)v11, &qword_256A1A650);
        sub_23B446384();
        v24 = sub_23B4835C0();

        (*(void (**)(char *, uint64_t))(v15 + 8))(v26, v14);
        return v24 & 1;
      }

      v20 = v26;
    }
    else
    {
      v11 = v7;
    }
    v25(v18, (char *)v11, v14);
    v29 = v20;
    v24 = sub_23B483398();
    v30 = *(void (**)(char *, uint64_t))(v15 + 8);
    v30(v18, v14);
    v30(v29, v14);
    return v24 & 1;
  }
  sub_23B448B30((uint64_t)v13, &qword_256A1A650);
  sub_23B440FEC(v33, (uint64_t)v5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = *v5;
    sub_23B446384();
    v24 = sub_23B4835C0();

  }
  else
  {
    sub_23B445D40((uint64_t)v5);
    v24 = 0;
  }
  return v24 & 1;
}

uint64_t sub_23B440310(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7463617265746E69;
  else
    return 25705;
}

uint64_t sub_23B44034C()
{
  char *v0;

  return sub_23B440310(*v0);
}

uint64_t sub_23B440354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B4467AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B440378()
{
  return 0;
}

void sub_23B440384(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23B440390()
{
  sub_23B4463E4();
  return sub_23B48389C();
}

uint64_t sub_23B4403B8()
{
  sub_23B4463E4();
  return sub_23B4838A8();
}

uint64_t sub_23B4403E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B446898(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_23B44040C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23B440418()
{
  sub_23B4464AC();
  return sub_23B48389C();
}

uint64_t sub_23B440440()
{
  sub_23B4464AC();
  return sub_23B4838A8();
}

uint64_t sub_23B440468()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B4404A8()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B4404E4()
{
  sub_23B446428();
  return sub_23B48389C();
}

uint64_t sub_23B44050C()
{
  sub_23B446428();
  return sub_23B4838A8();
}

void FBKSEvaluation.Subject.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  char *v15;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  char v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A678);
  v28 = *(_QWORD *)(v2 - 8);
  v29 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v26 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A680);
  v24 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23B4833B0();
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (void **)((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A688);
  v11 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4463E4();
  sub_23B483890();
  sub_23B440FEC(v30, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = *v10;
    v34 = 1;
    sub_23B446428();
    v15 = v26;
    v16 = v31;
    sub_23B483740();
    v32 = v14;
    type metadata accessor for FBKSInteraction();
    sub_23B44646C(&qword_256A1A6A0, (uint64_t (*)(uint64_t))type metadata accessor for FBKSInteraction, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    v17 = v29;
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v17);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v16);

  }
  else
  {
    v18 = v23;
    v19 = v25;
    (*(void (**)(char *, void **, uint64_t))(v23 + 32))(v7, v10, v25);
    v33 = 0;
    sub_23B4464AC();
    v20 = v31;
    sub_23B483740();
    sub_23B44646C(&qword_256A1A6B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    v21 = v27;
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v21);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  }
}

uint64_t FBKSEvaluation.Subject.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;

  v48 = a2;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6B8);
  v44 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v47 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6C0);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6C8);
  v45 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for FBKSEvaluation.Subject(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v38 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v38 - v16;
  v18 = a1[3];
  v49 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_23B4463E4();
  v19 = v50;
  sub_23B483884();
  if (v19)
    goto LABEL_7;
  v39 = v17;
  v40 = v15;
  v38 = v12;
  v21 = v46;
  v20 = v47;
  v50 = v9;
  v22 = v48;
  v23 = sub_23B483734();
  v24 = v8;
  if (*(_QWORD *)(v23 + 16) != 1)
  {
    v30 = sub_23B483644();
    swift_allocError();
    v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v32 = v50;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEE26D0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v6);
LABEL_7:
    v27 = (uint64_t)v49;
    return __swift_destroy_boxed_opaque_existential_0(v27);
  }
  if ((*(_BYTE *)(v23 + 32) & 1) != 0)
  {
    v53 = 1;
    sub_23B446428();
    v25 = v20;
    sub_23B4836BC();
    type metadata accessor for FBKSInteraction();
    sub_23B44646C(&qword_256A1A6D8, (uint64_t (*)(uint64_t))type metadata accessor for FBKSInteraction, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    v26 = v41;
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v24, v6);
    v27 = (uint64_t)v49;
    v28 = v38;
    *v38 = v51;
    swift_storeEnumTagMultiPayload();
    v29 = (uint64_t)v28;
  }
  else
  {
    v52 = 0;
    sub_23B4464AC();
    v33 = v21;
    sub_23B4836BC();
    sub_23B4833B0();
    sub_23B44646C(&qword_256A1A6E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v35 = (uint64_t)v40;
    v36 = v43;
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v36);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v24, v6);
    v27 = (uint64_t)v49;
    swift_storeEnumTagMultiPayload();
    v29 = v35;
  }
  v37 = (uint64_t)v39;
  sub_23B4464F0(v29, (uint64_t)v39);
  sub_23B4464F0(v37, v22);
  return __swift_destroy_boxed_opaque_existential_0(v27);
}

uint64_t sub_23B440D50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSEvaluation.Subject.init(from:)(a1, a2);
}

void sub_23B440D64(_QWORD *a1)
{
  FBKSEvaluation.Subject.encode(to:)(a1);
}

void static FBKSEvaluation.Action.concern.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t FBKSEvaluation.Action.description.getter()
{
  char *v0;

  return *(_QWORD *)&aThumbsUthumbsD[8 * *v0];
}

uint64_t FBKSEvaluation.Action.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aThumbsUthumbsD[8 * *v0];
}

void sub_23B440DD0()
{
  qword_256A1A640 = (uint64_t)&unk_250C5C478;
}

uint64_t static FBKSEvaluation.Action.allCases.getter()
{
  if (qword_256A1A4C8 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static FBKSEvaluation.Action.allCases.setter(uint64_t a1)
{
  if (qword_256A1A4C8 != -1)
    swift_once();
  swift_beginAccess();
  qword_256A1A640 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FBKSEvaluation.Action.allCases.modify())()
{
  if (qword_256A1A4C8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

FeedbackService::FBKSEvaluation::Action_optional __swiftcall FBKSEvaluation.Action.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FeedbackService::FBKSEvaluation::Action_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23B4836B0();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_23B440F8C()
{
  return sub_23B472D54();
}

uint64_t sub_23B440F94()
{
  return sub_23B473020();
}

uint64_t sub_23B440F9C()
{
  return sub_23B473060();
}

FeedbackService::FBKSEvaluation::Action_optional sub_23B440FA4(Swift::String *a1)
{
  return FBKSEvaluation.Action.init(rawValue:)(*a1);
}

uint64_t sub_23B440FB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FBKSEvaluation.Action.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for FBKSEvaluation.Subject(uint64_t a1)
{
  return sub_23B445CDC(a1, (uint64_t *)&unk_256A1A7E8);
}

uint64_t sub_23B440FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FBKSEvaluation.Subject(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B441030()
{
  sub_23B4487DC();
  return sub_23B4834C4();
}

uint64_t sub_23B44108C()
{
  sub_23B4487DC();
  return sub_23B4834AC();
}

uint64_t sub_23B4410D8@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256A1A4C8 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = qword_256A1A640;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B44114C(char *a1, char *a2)
{
  return sub_23B473684(*a1, *a2);
}

uint64_t FBKSEvaluation.FormResponse.feedbackID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FBKSEvaluation.FormResponse.feedbackID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FBKSEvaluation.FormResponse.feedbackID.modify())()
{
  return nullsub_1;
}

uint64_t FBKSEvaluation.FormResponse.answers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FBKSEvaluation.FormResponse.answers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FBKSEvaluation.FormResponse.answers.modify())()
{
  return nullsub_1;
}

FeedbackService::FBKSEvaluation::FormResponse __swiftcall FBKSEvaluation.FormResponse.init(feedbackID:answers:)(Swift::String feedbackID, Swift::OpaquePointer answers)
{
  uint64_t v2;
  FeedbackService::FBKSEvaluation::FormResponse result;

  *(Swift::String *)v2 = feedbackID;
  *(Swift::OpaquePointer *)(v2 + 16) = answers;
  result.feedbackID = feedbackID;
  result.answers = answers;
  return result;
}

uint64_t static FBKSEvaluation.FormResponse.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_23B4837D0() & 1) != 0)
    return sub_23B4430A8(v2, v3);
  else
    return 0;
}

uint64_t sub_23B441278(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  char v19;
  int64_t v21;

  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = 1 << *(_BYTE *)(a1 + 32);
    v5 = -1;
    if (v4 < 64)
      v5 = ~(-1 << v4);
    v21 = (unint64_t)(v4 + 63) >> 6;
    if ((v5 & v3) != 0)
    {
      v6 = __clz(__rbit64(v5 & v3));
LABEL_20:
      v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
      v11 = *v10;
      v12 = v10[1];
      v13 = *(_QWORD *)(a1 + 56) + 24 * v6;
      v14 = *(_QWORD *)v13;
      v15 = *(_QWORD *)(v13 + 8);
      v16 = *(_BYTE *)(v13 + 16);
      swift_bridgeObjectRetain();
      sub_23B448820(v14, v15, v16);
      v17 = sub_23B475F0C(v11, v12);
      v19 = v18;
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        __asm { BR              X8 }
      sub_23B44884C(v14, v15, v16);
      return 0;
    }
    if ((unint64_t)(v4 + 63) >> 6 > 1)
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = 1;
      if (v7)
        goto LABEL_19;
      v8 = 2;
      if ((unint64_t)(v4 + 63) >> 6 <= 2)
        return 1;
      v7 = *(_QWORD *)(a1 + 80);
      if (v7)
        goto LABEL_19;
      v8 = 3;
      if ((unint64_t)(v4 + 63) >> 6 <= 3)
        return 1;
      v7 = *(_QWORD *)(a1 + 88);
      if (v7)
      {
LABEL_19:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
        goto LABEL_20;
      }
      v9 = 4;
      if (v21 > 4)
      {
        v7 = *(_QWORD *)(a1 + 96);
        if (v7)
        {
          v8 = 4;
          goto LABEL_19;
        }
        while (1)
        {
          v8 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            JUMPOUT(0x23B44300CLL);
          }
          if (v8 >= v21)
            break;
          v7 = *(_QWORD *)(a1 + 64 + 8 * v8);
          ++v9;
          if (v7)
            goto LABEL_19;
        }
      }
    }
    return 1;
  }
  return 0;
}

uint64_t sub_23B4430A8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  char v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  int64_t v29;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v29 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_54;
    }
    if (v11 >= v29)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v29)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v29)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v29)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(_QWORD **)(*(_QWORD *)(v3 + 56) + 8 * v10);
    sub_23B43ED54(*v14, v16);
    swift_bridgeObjectRetain();
    v18 = sub_23B475F70(v15, v16);
    v20 = v19;
    sub_23B43ED68(v15, v16);
    if ((v20 & 1) == 0)
      goto LABEL_50;
    v21 = *(_QWORD **)(*(_QWORD *)(a2 + 56) + 8 * v18);
    v22 = v21[2];
    if (v22 != v17[2])
      goto LABEL_50;
    if (v22)
      v23 = v21 == v17;
    else
      v23 = 1;
    if (!v23)
    {
      v24 = v21[4] == v17[4] && v21[5] == v17[5];
      if (!v24 && (sub_23B4837D0() & 1) == 0)
        goto LABEL_50;
      if (v22 != 1)
      {
        v25 = v21[6] == v17[6] && v21[7] == v17[7];
        if (!v25 && (sub_23B4837D0() & 1) == 0)
          goto LABEL_50;
        v26 = v22 - 2;
        if (v26)
        {
          v27 = 0;
          while (1)
          {
            v28 = v21[v27 + 8] == v17[v27 + 8] && v21[v27 + 9] == v17[v27 + 9];
            if (!v28 && (sub_23B4837D0() & 1) == 0)
              break;
            v27 += 2;
            if (!--v26)
              goto LABEL_6;
          }
LABEL_50:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
LABEL_6:
    result = swift_bridgeObjectRelease();
  }
  v13 = v11 + 4;
  if (v13 >= v29)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v29)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_23B443340(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73726577736E61;
  else
    return 0x6B63616264656566;
}

BOOL sub_23B44337C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s15FeedbackService0A12FeatureFlagsO9hashValueSivg_0()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B4433D8()
{
  return sub_23B483854();
}

uint64_t sub_23B443400()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B443440()
{
  char *v0;

  return sub_23B443340(*v0);
}

uint64_t sub_23B443448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B446904(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B44346C()
{
  sub_23B446534();
  return sub_23B48389C();
}

uint64_t sub_23B443494()
{
  sub_23B446534();
  return sub_23B4838A8();
}

uint64_t FBKSEvaluation.FormResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6E8);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B446534();
  sub_23B483890();
  v13 = 0;
  sub_23B483770();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
    sub_23B446578();
    sub_23B4837A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t FBKSEvaluation.FormResponse.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A718);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B446534();
  sub_23B483884();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v16 = 0;
  v9 = sub_23B4836F8();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
  v15 = 1;
  sub_23B446684();
  swift_bridgeObjectRetain();
  sub_23B483728();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B4437DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FBKSEvaluation.FormResponse.init(from:)(a1, a2);
}

uint64_t sub_23B4437F0(_QWORD *a1)
{
  return FBKSEvaluation.FormResponse.encode(to:)(a1);
}

uint64_t sub_23B443804(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_23B4837D0() & 1) != 0)
    return sub_23B4430A8(v2, v3);
  else
    return 0;
}

uint64_t FBKSEvaluation.subject.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23B440FEC(v1 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject, a1);
}

void FBKSEvaluation.action.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action);
}

uint64_t FBKSEvaluation.formResponse.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse + 8);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse + 16);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  return sub_23B445D10(v2, v3);
}

void sub_23B4438B0(void *a1, void (*a2)(void *, uint64_t))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v15);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      a2(a1, 1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44894C();
  v14 = (void *)swift_allocError();
  a2(v14, 1);

}

void sub_23B443AD0(uint64_t a1, unint64_t a2, void *a3, void (*a4)(void *, uint64_t))
{
  id v8;
  id v9;
  void *v10;

  if (a3)
  {
    v9 = a3;
    a4(a3, 1);

  }
  else if (a2 >> 60 == 15)
  {
    a4(0, 0);
  }
  else
  {
    sub_23B483200();
    swift_allocObject();
    sub_23B446D90(a1, a2);
    sub_23B4831F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A750);
    sub_23B448AA0();
    sub_23B4831E8();
    swift_release();
    v8 = v10;
    a4(v10, 0);
    sub_23B448B1C(a1, a2);

  }
}

uint64_t static FBKSEvaluation.fetch(evaluationID:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_23B443C58()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  int8x16_t *v7;
  _QWORD *v8;
  _BYTE *v10;
  uint64_t v11;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 64) = sub_23B44BBC0(0xD000000000000014, 0x800000023B48D5E0, &v11);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    v7[1] = vextq_s8(*(int8x16_t *)(v0 + 72), *(int8x16_t *)(v0 + 72), 8uLL);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A750);
    *v8 = v0;
    v8[1] = sub_23B443ED8;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B443ED8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B443F44()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
}

uint64_t sub_23B443F54()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B443F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A890);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  _s15FeedbackService14FBKSEvaluationC5fetch12evaluationID10completiony10Foundation4UUIDV_ys6ResultOyACSgs5Error_pGctFZ_0(a3, (void (*)(void *, uint64_t))sub_23B448A40, v9);
  return swift_release();
}

uint64_t sub_23B444068(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A890);
    return sub_23B483530();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A890);
    return sub_23B48353C();
  }
}

id FBKSEvaluation.init(subject:action:formResponse:)(uint64_t a1, char *a2, __int128 *a3)
{
  _BYTE *v3;
  char v5;
  uint64_t v6;
  char *v7;
  id v8;
  __int128 v10;
  objc_super v11;

  v5 = *a2;
  v10 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  sub_23B440FEC(a1, (uint64_t)&v3[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
  v3[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = v5;
  v7 = &v3[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
  *(_OWORD *)v7 = v10;
  *((_QWORD *)v7 + 2) = v6;
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for FBKSEvaluation(0);
  v8 = objc_msgSendSuper2(&v11, sel_init);
  sub_23B445D40(a1);
  return v8;
}

uint64_t sub_23B444170(void (*a1)(uint64_t *), uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  id v26;
  _QWORD v27[3];
  uint64_t aBlock[3];
  ValueMetadata *v29;
  unint64_t v30;
  _QWORD *v31;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256A1A4E0 != -1)
    swift_once();
  v9 = sub_23B4833E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_256A1BC98);
  v10 = sub_23B4833C8();
  v11 = sub_23B4835A8();
  if (os_log_type_enabled(v10, v11))
  {
    v27[1] = v6;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v27[2] = sub_23B44BBC0(0x5F2864726F636572, 0xEA0000000000293ALL, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v10, v11, "%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v13, -1, -1);
    MEMORY[0x23B86528C](v12, -1, -1);
  }

  v29 = &type metadata for FeedbackFeatureFlags;
  v30 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v14 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v14 & 1) != 0)
  {
    sub_23B483248();
    swift_allocObject();
    sub_23B48323C();
    aBlock[0] = (uint64_t)v3;
    type metadata accessor for FBKSEvaluation(0);
    sub_23B44646C(&qword_256A1A760, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
    v15 = sub_23B483230();
    v17 = v16;
    swift_release();
    sub_23B446D90(v15, v17);
    if (qword_256A1A510 != -1)
      swift_once();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a1;
    *(_QWORD *)(v21 + 24) = a2;
    swift_retain();
    v22 = (void *)sub_23B457884((uint64_t)sub_23B446DF8, v21);
    swift_release();
    if (v22)
    {
      v23 = (void *)sub_23B483338();
      sub_23B43ED7C(v15, v17);
      v24 = (_QWORD *)swift_allocObject();
      v24[2] = a1;
      v24[3] = a2;
      v24[4] = v3;
      v30 = (unint64_t)sub_23B446E04;
      v31 = v24;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B444D20;
      v29 = (ValueMetadata *)&block_descriptor_0;
      v25 = _Block_copy(aBlock);
      swift_retain();
      v26 = v3;
      swift_release();
      objc_msgSend(v22, sel_recordEvaluationWithEvaluationJSON_completion_, v23, v25);
      sub_23B43ED7C(v15, v17);
      _Block_release(v25);

      return swift_unknownObjectRelease();
    }
    else
    {
      sub_23B43ED7C(v15, v17);
      return sub_23B43ED7C(v15, v17);
    }
  }
  else
  {
    sub_23B446D44();
    v18 = swift_allocError();
    *v19 = 0;
    *v8 = v18;
    swift_storeEnumTagMultiPayload();
    a1(v8);
    return sub_23B448B30((uint64_t)v8, &qword_256A1A758);
  }
}

uint64_t sub_23B4445D4(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  id v20;
  _QWORD v22[2];
  void (*v23)(_QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256A1A4E0 != -1)
    swift_once();
  v8 = sub_23B4833E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
  v9 = a1;
  v10 = sub_23B4833C8();
  v11 = sub_23B48359C();
  if (!os_log_type_enabled(v10, v11))
  {

    if (a1)
      goto LABEL_5;
LABEL_7:
    sub_23B44894C();
    *v7 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    goto LABEL_8;
  }
  v12 = swift_slowAlloc();
  v23 = a2;
  v13 = (uint8_t *)v12;
  v14 = swift_slowAlloc();
  v25 = (uint64_t)a1;
  v26 = v14;
  *(_DWORD *)v13 = 136315138;
  v22[0] = v13 + 4;
  v15 = v9;
  v22[1] = v5;
  v16 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
  v17 = sub_23B483470();
  v25 = sub_23B44BBC0(v17, v18, &v26);
  sub_23B4835D8();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_23B433000, v10, v11, "Failed to connect to centralized feedback daemon: %s", v13, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B86528C](v14, -1, -1);
  v19 = v13;
  a2 = v23;
  MEMORY[0x23B86528C](v19, -1, -1);

  if (!a1)
    goto LABEL_7;
LABEL_5:
  *v7 = (uint64_t)v9;
  swift_storeEnumTagMultiPayload();
  v20 = v9;
LABEL_8:
  a2(v7);
  return sub_23B448B30((uint64_t)v7, &qword_256A1A758);
}

uint64_t sub_23B444854(uint64_t a1, void *a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  void (*v27)(uint64_t *);
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  char *v43;
  _QWORD v44[2];
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t *);
  uint64_t v49;

  v46 = a5;
  v47 = a1;
  v48 = a3;
  v49 = a4;
  v6 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char **)((char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v44 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v44 - v19;
  v21 = sub_23B4833B0();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *v11 = (uint64_t)a2;
    swift_storeEnumTagMultiPayload();
    v25 = a2;
    v48(v11);
    return sub_23B448B30((uint64_t)v11, &qword_256A1A758);
  }
  v26 = v46;
  v44[0] = v15;
  v44[1] = v9;
  v45 = v24;
  v27 = v48;
  sub_23B448908(v47, (uint64_t)v20, &qword_256A1A650);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  if (v28(v20, 1, v21) == 1)
  {
    sub_23B448B30((uint64_t)v20, &qword_256A1A650);
    sub_23B44894C();
    *v11 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    v27(v11);
    return sub_23B448B30((uint64_t)v11, &qword_256A1A758);
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v45, v20, v21);
  sub_23B440FEC(v26 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject, (uint64_t)v8);
  v30 = (uint64_t)v11;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v47 = v22;
    v31 = *v8;
    v32 = (uint64_t)&(*v8)[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID];
    swift_beginAccess();
    sub_23B448908(v32, (uint64_t)v18, &qword_256A1A650);
    v33 = v28(v18, 1, v21);
    sub_23B448B30((uint64_t)v18, &qword_256A1A650);
    if (v33 == 1)
    {
      v34 = v47;
      v35 = v44[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v47 + 16))(v44[0], v45, v21);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v21);
      swift_beginAccess();
      sub_23B448990(v35, v32);
      swift_endAccess();
    }
    v36 = &v31[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation];
    swift_beginAccess();
    *v36 = 0;
    v37 = &v31[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented];
    swift_beginAccess();
    v38 = v21;
    if (*v37 == 1)
    {
      if (qword_256A1A4E0 != -1)
        swift_once();
      v39 = sub_23B4833E0();
      __swift_project_value_buffer(v39, (uint64_t)qword_256A1BC98);
      v40 = sub_23B4833C8();
      v41 = sub_23B4835A8();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_23B433000, v40, v41, "Resetting sentPresented after successful evaluation", v42, 2u);
        MEMORY[0x23B86528C](v42, -1, -1);
      }

      *v37 = 0;
    }
    else
    {

    }
    v22 = v47;
  }
  else
  {
    v38 = v21;
    sub_23B445D40((uint64_t)v8);
  }
  v43 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v30, v45, v38);
  swift_storeEnumTagMultiPayload();
  v27((uint64_t *)v30);
  sub_23B448B30(v30, &qword_256A1A758);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v43, v38);
}

uint64_t sub_23B444D20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_23B4833A4();
    v10 = sub_23B4833B0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = sub_23B4833B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  v12 = a3;
  v9(v8, a3);

  swift_release();
  return sub_23B448B30((uint64_t)v8, &qword_256A1A650);
}

uint64_t sub_23B444E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return swift_task_switch();
}

uint64_t sub_23B444E38()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t v12;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v12 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0x292864726F636572, 0xE800000000000000, &v12);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 72);
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v8;
    *(_QWORD *)(v8 + 16) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v9;
    sub_23B4833B0();
    *v9 = v0;
    v9[1] = sub_23B4450AC;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B4450AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B445120()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B445154(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A878);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_23B444170((void (*)(uint64_t *))sub_23B4488C8, v6);
  return swift_release();
}

uint64_t sub_23B445230(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v13[2];

  v2 = sub_23B4833B0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v13 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B448908(a1, (uint64_t)v11, &qword_256A1A758);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13[1] = *v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A878);
    return sub_23B483530();
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v3 + 32))(v8, v11, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A878);
    sub_23B48353C();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

id FBKSEvaluation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKSEvaluation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B44541C(char a1)
{
  return *(_QWORD *)&aSubject_3[8 * a1];
}

BOOL sub_23B44543C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B445450()
{
  char *v0;

  return sub_23B44541C(*v0);
}

uint64_t sub_23B445458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B448660(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B44547C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23B445488()
{
  sub_23B446E30();
  return sub_23B48389C();
}

uint64_t sub_23B4454B0()
{
  sub_23B446E30();
  return sub_23B4838A8();
}

id FBKSEvaluation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSEvaluation(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B44554C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A768);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B446E30();
  sub_23B483890();
  LOBYTE(v11) = 0;
  type metadata accessor for FBKSEvaluation.Subject(0);
  sub_23B44646C(&qword_256A1A778, type metadata accessor for FBKSEvaluation.Subject, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject);
  sub_23B4837A0();
  if (!v2)
  {
    LOBYTE(v11) = *(_BYTE *)(v3 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action);
    v13 = 1;
    sub_23B446E74();
    sub_23B4837A0();
    v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse + 16);
    v11 = *(_OWORD *)(v3 + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse);
    v12 = v9;
    v13 = 2;
    sub_23B446EB8();
    sub_23B483764();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *FBKSEvaluation.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSEvaluation.init(from:)(a1);
}

char *FBKSEvaluation.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char *v17;
  objc_class *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  objc_super v23;
  __int128 v24;
  uint64_t v25;
  char v26;

  v4 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v4);
  v19 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A790);
  v6 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v22 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_23B446E30();
  v10 = v1;
  v20 = v8;
  sub_23B483884();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);

    type metadata accessor for FBKSEvaluation(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v11 = v6;
    LOBYTE(v24) = 0;
    sub_23B44646C(&qword_256A1A798, type metadata accessor for FBKSEvaluation.Subject, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject);
    v13 = (uint64_t)v19;
    v12 = v20;
    v14 = v21;
    sub_23B483728();
    sub_23B4464F0(v13, (uint64_t)&v10[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
    v26 = 1;
    sub_23B446EFC();
    sub_23B483728();
    v10[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = v24;
    v26 = 2;
    sub_23B446F40();
    sub_23B4836EC();
    v16 = v25;
    v17 = &v10[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
    *(_OWORD *)v17 = v24;
    *((_QWORD *)v17 + 2) = v16;

    v18 = (objc_class *)type metadata accessor for FBKSEvaluation(0);
    v23.receiver = v10;
    v23.super_class = v18;
    v10 = (char *)objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v12, v14);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  }
  return v10;
}

char *sub_23B445A2C@<X0>(_QWORD *a1@<X0>, char **a2@<X8>)
{
  uint64_t v2;
  id v5;
  char *result;

  v5 = objc_allocWithZone((Class)type metadata accessor for FBKSEvaluation(0));
  result = FBKSEvaluation.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23B445A80(_QWORD *a1)
{
  return sub_23B44554C(a1);
}

uint64_t _s15FeedbackService14FBKSEvaluationC7SubjectO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void **v18;
  void *v19;
  void *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v4 = sub_23B4833B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FBKSEvaluation.Subject(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (void **)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A8A8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (void **)&v17[*(int *)(v15 + 48)];
  sub_23B440FEC(a1, (uint64_t)v17);
  sub_23B440FEC(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23B440FEC((uint64_t)v17, (uint64_t)v11);
    v19 = *v11;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = *v18;
      sub_23B446384();
      v21 = sub_23B4835C0();

LABEL_9:
      sub_23B445D40((uint64_t)v17);
      return v21 & 1;
    }

  }
  else
  {
    sub_23B440FEC((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, void **, uint64_t))(v5 + 32))(v7, v18, v4);
      v21 = sub_23B483398();
      v22 = *(void (**)(char *, uint64_t))(v5 + 8);
      v22(v7, v4);
      v22(v13, v4);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  sub_23B448B30((uint64_t)v17, &qword_256A1A8A8);
  v21 = 0;
  return v21 & 1;
}

uint64_t type metadata accessor for FBKSEvaluation(uint64_t a1)
{
  return sub_23B445CDC(a1, (uint64_t *)&unk_256A1A7D0);
}

uint64_t sub_23B445CDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B445D10(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23B445D40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FBKSEvaluation.Subject(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23B445D7C(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  void (*v24)(_QWORD, _QWORD);
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  id v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t aBlock[3];
  ValueMetadata *v49;
  uint64_t (*v50)();
  _QWORD *v51;

  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  v8 = MEMORY[0x24BDAC7A8](v46);
  v44 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (id *)((char *)&v41 - v12);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v41 - v14);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v17 = qword_256A1A4E0;
  swift_retain();
  v45 = a4;
  if (v17 != -1)
    swift_once();
  v18 = sub_23B4833E0();
  __swift_project_value_buffer(v18, (uint64_t)qword_256A1BC98);
  v19 = sub_23B4833C8();
  v20 = sub_23B4835A8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v43 = a3;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v41 = v16;
    v42 = a1;
    v24 = a2;
    v25 = v23;
    aBlock[0] = v23;
    *(_DWORD *)v22 = 136446210;
    v47 = sub_23B44BBC0(0x5F2864726F636572, 0xEA0000000000293ALL, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v19, v20, "%{public}s", v22, 0xCu);
    swift_arrayDestroy();
    v26 = v25;
    a2 = v24;
    v16 = v41;
    a1 = v42;
    MEMORY[0x23B86528C](v26, -1, -1);
    MEMORY[0x23B86528C](v22, -1, -1);
  }

  v49 = &type metadata for FeedbackFeatureFlags;
  v50 = (uint64_t (*)())sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v27 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v27 & 1) != 0)
  {
    sub_23B483248();
    swift_allocObject();
    sub_23B48323C();
    aBlock[0] = (uint64_t)a1;
    type metadata accessor for FBKSEvaluation(0);
    sub_23B44646C(&qword_256A1A760, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
    v28 = sub_23B483230();
    v30 = v29;
    swift_release();
    sub_23B446D90(v28, v30);
    if (qword_256A1A510 != -1)
      swift_once();
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = sub_23B448B70;
    *(_QWORD *)(v35 + 24) = v16;
    swift_retain();
    v36 = (void *)sub_23B457884((uint64_t)sub_23B448BF0, v35);
    swift_release();
    if (v36)
    {
      v37 = (void *)sub_23B483338();
      sub_23B43ED7C(v28, v30);
      v38 = (_QWORD *)swift_allocObject();
      v38[2] = sub_23B448B70;
      v38[3] = v16;
      v38[4] = a1;
      v50 = sub_23B448BE8;
      v51 = v38;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B444D20;
      v49 = (ValueMetadata *)&block_descriptor_56;
      v39 = _Block_copy(aBlock);
      swift_retain();
      v40 = a1;
      swift_release();
      objc_msgSend(v36, sel_recordEvaluationWithEvaluationJSON_completion_, v37, v39);
      sub_23B43ED7C(v28, v30);
      _Block_release(v39);
      swift_release();
      swift_unknownObjectRelease();

      return;
    }
    sub_23B43ED7C(v28, v30);
    sub_23B43ED7C(v28, v30);
  }
  else
  {
    sub_23B446D44();
    v31 = swift_allocError();
    *v32 = 0;
    *v15 = v31;
    swift_storeEnumTagMultiPayload();
    sub_23B448908((uint64_t)v15, (uint64_t)v13, &qword_256A1A758);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v33 = *v13;
      v34 = *v13;
      a2(v33, 1);

    }
    else
    {
      sub_23B448B30((uint64_t)v13, &qword_256A1A758);
      a2(v45, 0);
    }
    sub_23B448B30((uint64_t)v15, &qword_256A1A758);
  }
  swift_release();
}

unint64_t sub_23B446384()
{
  unint64_t result;

  result = qword_256A1A670;
  if (!qword_256A1A670)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256A1A670);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23B4463E4()
{
  unint64_t result;

  result = qword_256A1A690;
  if (!qword_256A1A690)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485940, &type metadata for FBKSEvaluation.Subject.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A690);
  }
  return result;
}

unint64_t sub_23B446428()
{
  unint64_t result;

  result = qword_256A1A698;
  if (!qword_256A1A698)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4858F0, &type metadata for FBKSEvaluation.Subject.InteractionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A698);
  }
  return result;
}

uint64_t sub_23B44646C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8651F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B4464AC()
{
  unint64_t result;

  result = qword_256A1A6A8;
  if (!qword_256A1A6A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4858A0, &type metadata for FBKSEvaluation.Subject.IdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A6A8);
  }
  return result;
}

uint64_t sub_23B4464F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FBKSEvaluation.Subject(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B446534()
{
  unint64_t result;

  result = qword_256A1A6F0;
  if (!qword_256A1A6F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485850, &type metadata for FBKSEvaluation.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A6F0);
  }
  return result;
}

unint64_t sub_23B446578()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A1A700;
  if (!qword_256A1A700)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A6F8);
    v2[0] = sub_23B446640();
    v2[1] = sub_23B44674C(&qword_256A1A710, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A1A700);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8651E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23B446640()
{
  unint64_t result;

  result = qword_256A1A708;
  if (!qword_256A1A708)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.Question, &type metadata for FBKSForm.Question);
    atomic_store(result, (unint64_t *)&qword_256A1A708);
  }
  return result;
}

unint64_t sub_23B446684()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256A1A720;
  if (!qword_256A1A720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A6F8);
    v2[0] = sub_23B446708();
    v2[1] = sub_23B44674C(&qword_256A1A730, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256A1A720);
  }
  return result;
}

unint64_t sub_23B446708()
{
  unint64_t result;

  result = qword_256A1A728;
  if (!qword_256A1A728)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.Question, &type metadata for FBKSForm.Question);
    atomic_store(result, (unint64_t *)&qword_256A1A728);
  }
  return result;
}

uint64_t sub_23B44674C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A638);
    v8 = a2;
    result = MEMORY[0x23B8651F0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B4467AC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617265746E69 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B44688C()
{
  return 12383;
}

uint64_t sub_23B446898(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23B446904(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6B63616264656566 && a2 == 0xEA00000000004449;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73726577736E61 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void _s15FeedbackService14FBKSEvaluationC5fetch12evaluationID10completiony10Foundation4UUIDV_ys6ResultOyACSgs5Error_pGctFZ_0(uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  uint64_t aBlock[3];
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1BC98);
  v6 = sub_23B4833C8();
  v7 = sub_23B4835A8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136446210;
    sub_23B44BBC0(0xD00000000000001FLL, 0x800000023B48D6D0, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);
  }

  v19 = &type metadata for FeedbackFeatureFlags;
  v20 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v10 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v10 & 1) != 0)
  {
    if (qword_256A1A510 != -1)
      swift_once();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a2;
    *(_QWORD *)(v11 + 24) = a3;
    swift_retain();
    v12 = (void *)sub_23B457884((uint64_t)sub_23B448A90, v11);
    swift_release();
    if (v12)
    {
      v13 = (void *)sub_23B48338C();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = a2;
      *(_QWORD *)(v14 + 24) = a3;
      v20 = (unint64_t)sub_23B448A98;
      v21 = v14;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B47D698;
      v19 = (ValueMetadata *)&block_descriptor_42;
      v15 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_fetchEvaluationWithEvaluationID_completion_, v13, v15);
      swift_unknownObjectRelease();
      _Block_release(v15);

    }
  }
  else
  {
    sub_23B446D44();
    v16 = (void *)swift_allocError();
    *v17 = 0;
    a2(v16, 1);

  }
}

unint64_t sub_23B446D00()
{
  unint64_t result;

  result = qword_256A1A740;
  if (!qword_256A1A740)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FeedbackFeatureFlags, &type metadata for FeedbackFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_256A1A740);
  }
  return result;
}

unint64_t sub_23B446D44()
{
  unint64_t result;

  result = qword_256A1A748;
  if (!qword_256A1A748)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FeedbackFeatureError, &type metadata for FeedbackFeatureError);
    atomic_store(result, (unint64_t *)&qword_256A1A748);
  }
  return result;
}

uint64_t sub_23B446D88(uint64_t a1)
{
  uint64_t v1;

  return sub_23B443F88(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23B446D90(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_23B446DD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B446DF8(void *a1)
{
  uint64_t v1;

  return sub_23B4445D4(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23B446E04(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_23B444854(a1, a2, *(void (**)(uint64_t *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23B446E28(uint64_t a1)
{
  return sub_23B445154(a1);
}

unint64_t sub_23B446E30()
{
  unint64_t result;

  result = qword_256A1A770;
  if (!qword_256A1A770)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485800, &type metadata for FBKSEvaluation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A770);
  }
  return result;
}

unint64_t sub_23B446E74()
{
  unint64_t result;

  result = qword_256A1A780;
  if (!qword_256A1A780)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.Action, &type metadata for FBKSEvaluation.Action);
    atomic_store(result, (unint64_t *)&qword_256A1A780);
  }
  return result;
}

unint64_t sub_23B446EB8()
{
  unint64_t result;

  result = qword_256A1A788;
  if (!qword_256A1A788)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.FormResponse, &type metadata for FBKSEvaluation.FormResponse);
    atomic_store(result, (unint64_t *)&qword_256A1A788);
  }
  return result;
}

unint64_t sub_23B446EFC()
{
  unint64_t result;

  result = qword_256A1A7A0;
  if (!qword_256A1A7A0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.Action, &type metadata for FBKSEvaluation.Action);
    atomic_store(result, (unint64_t *)&qword_256A1A7A0);
  }
  return result;
}

unint64_t sub_23B446F40()
{
  unint64_t result;

  result = qword_256A1A7A8;
  if (!qword_256A1A7A8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.FormResponse, &type metadata for FBKSEvaluation.FormResponse);
    atomic_store(result, (unint64_t *)&qword_256A1A7A8);
  }
  return result;
}

unint64_t sub_23B446F88()
{
  unint64_t result;

  result = qword_256A1A7B0;
  if (!qword_256A1A7B0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.EvaluationError, &type metadata for FBKSEvaluation.EvaluationError);
    atomic_store(result, (unint64_t *)&qword_256A1A7B0);
  }
  return result;
}

unint64_t sub_23B446FD0()
{
  unint64_t result;

  result = qword_256A1A7B8;
  if (!qword_256A1A7B8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.Action, &type metadata for FBKSEvaluation.Action);
    atomic_store(result, (unint64_t *)&qword_256A1A7B8);
  }
  return result;
}

unint64_t sub_23B447018()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A1A7C0;
  if (!qword_256A1A7C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A7C8);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256A1A7C0);
  }
  return result;
}

uint64_t sub_23B447064()
{
  return type metadata accessor for FBKSEvaluation(0);
}

uint64_t sub_23B44706C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FBKSEvaluation.Subject(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FBKSEvaluation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSEvaluation.__allocating_init(subject:action:formResponse:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FBKSEvaluation.record(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of FBKSEvaluation.record()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B447194;
  return v7(a1);
}

uint64_t sub_23B447194()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of FBKSEvaluation.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FBKSEvaluation.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_23B447230()
{
  return 0;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.EvaluationError()
{
  return &type metadata for FBKSEvaluation.EvaluationError;
}

char *initializeBufferWithCopyOfBuffer for FBKSEvaluation.Subject(char *a1, char **a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = *a2;
      *(_QWORD *)a1 = *a2;
      v7 = v6;
    }
    else
    {
      v9 = sub_23B4833B0();
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for FBKSEvaluation.Subject(id *a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    v2 = sub_23B4833B0();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
}

void **initializeWithCopy for FBKSEvaluation.Subject(void **a1, void **a2)
{
  void *v4;
  id v5;
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = *a2;
    *a1 = *a2;
    v5 = v4;
  }
  else
  {
    v6 = sub_23B4833B0();
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **assignWithCopy for FBKSEvaluation.Subject(void **a1, void **a2)
{
  void *v4;
  id v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23B445D40((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = *a2;
      *a1 = *a2;
      v5 = v4;
    }
    else
    {
      v6 = sub_23B4833B0();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for FBKSEvaluation.Subject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_23B4833B0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for FBKSEvaluation.Subject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23B445D40((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_23B4833B0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSEvaluation.Subject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for FBKSEvaluation.Subject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23B4475C0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23B4475D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B4833B0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FBKSEvaluation.Action(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSEvaluation.Action(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23B447728 + 4 * byte_23B484FC5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23B44775C + 4 * byte_23B484FC0[v4]))();
}

uint64_t sub_23B44775C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447764(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B44776CLL);
  return result;
}

uint64_t sub_23B447778(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B447780);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23B447784(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B44778C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.Action()
{
  return &type metadata for FBKSEvaluation.Action;
}

uint64_t destroy for FBKSEvaluation.FormResponse()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15FeedbackService14FBKSEvaluationC12FormResponseVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FBKSEvaluation.FormResponse(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FBKSEvaluation.FormResponse(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSEvaluation.FormResponse(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSEvaluation.FormResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.FormResponse()
{
  return &type metadata for FBKSEvaluation.FormResponse;
}

uint64_t getEnumTagSinglePayload for FBKSEvaluation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSEvaluation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B447A40 + 4 * byte_23B484FCF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B447A74 + 4 * byte_23B484FCA[v4]))();
}

uint64_t sub_23B447A74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447A7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B447A84);
  return result;
}

uint64_t sub_23B447A90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B447A98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B447A9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447AA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447AB0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B447AB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.CodingKeys()
{
  return &type metadata for FBKSEvaluation.CodingKeys;
}

_BYTE *sub_23B447AD8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.FormResponse.CodingKeys()
{
  return &type metadata for FBKSEvaluation.FormResponse.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FBKSRemoteEvaluationResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s15FeedbackService14FBKSEvaluationC12FormResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B447BD0 + 4 * byte_23B484FD9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B447C04 + 4 * byte_23B484FD4[v4]))();
}

uint64_t sub_23B447C04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447C0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B447C14);
  return result;
}

uint64_t sub_23B447C20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B447C28);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B447C2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B447C34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.Subject.CodingKeys()
{
  return &type metadata for FBKSEvaluation.Subject.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.Subject.IdCodingKeys()
{
  return &type metadata for FBKSEvaluation.Subject.IdCodingKeys;
}

uint64_t getEnumTagSinglePayload for FBKSForm.Question.CustomCodingKeys(unsigned int *a1, int a2)
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

uint64_t _s15FeedbackService14FBKSEvaluationC15EvaluationErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B447CF0 + 4 * byte_23B484FDE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B447D10 + 4 * byte_23B484FE3[v4]))();
}

_BYTE *sub_23B447CF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B447D10(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B447D18(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B447D20(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B447D28(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B447D30(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKSEvaluation.Subject.InteractionCodingKeys()
{
  return &type metadata for FBKSEvaluation.Subject.InteractionCodingKeys;
}

unint64_t sub_23B447D50()
{
  unint64_t result;

  result = qword_256A1A7F8;
  if (!qword_256A1A7F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4854F8, &type metadata for FBKSEvaluation.Subject.InteractionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A7F8);
  }
  return result;
}

unint64_t sub_23B447D98()
{
  unint64_t result;

  result = qword_256A1A800;
  if (!qword_256A1A800)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4855B0, &type metadata for FBKSEvaluation.Subject.IdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A800);
  }
  return result;
}

unint64_t sub_23B447DE0()
{
  unint64_t result;

  result = qword_256A1A808;
  if (!qword_256A1A808)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485668, &type metadata for FBKSEvaluation.Subject.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A808);
  }
  return result;
}

unint64_t sub_23B447E28()
{
  unint64_t result;

  result = qword_256A1A810;
  if (!qword_256A1A810)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485720, &type metadata for FBKSEvaluation.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A810);
  }
  return result;
}

unint64_t sub_23B447E70()
{
  unint64_t result;

  result = qword_256A1A818;
  if (!qword_256A1A818)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4857D8, &type metadata for FBKSEvaluation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A818);
  }
  return result;
}

unint64_t sub_23B447EB8()
{
  unint64_t result;

  result = qword_256A1A820;
  if (!qword_256A1A820)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485748, &type metadata for FBKSEvaluation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A820);
  }
  return result;
}

unint64_t sub_23B447F00()
{
  unint64_t result;

  result = qword_256A1A828;
  if (!qword_256A1A828)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485770, &type metadata for FBKSEvaluation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A828);
  }
  return result;
}

unint64_t sub_23B447F48()
{
  unint64_t result;

  result = qword_256A1A830;
  if (!qword_256A1A830)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485690, &type metadata for FBKSEvaluation.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A830);
  }
  return result;
}

unint64_t sub_23B447F90()
{
  unint64_t result;

  result = qword_256A1A838;
  if (!qword_256A1A838)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4856B8, &type metadata for FBKSEvaluation.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A838);
  }
  return result;
}

unint64_t sub_23B447FD8()
{
  unint64_t result;

  result = qword_256A1A840;
  if (!qword_256A1A840)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485520, &type metadata for FBKSEvaluation.Subject.IdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A840);
  }
  return result;
}

unint64_t sub_23B448020()
{
  unint64_t result;

  result = qword_256A1A848;
  if (!qword_256A1A848)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485548, &type metadata for FBKSEvaluation.Subject.IdCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A848);
  }
  return result;
}

unint64_t sub_23B448068()
{
  unint64_t result;

  result = qword_256A1A850;
  if (!qword_256A1A850)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485468, &type metadata for FBKSEvaluation.Subject.InteractionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A850);
  }
  return result;
}

unint64_t sub_23B4480B0()
{
  unint64_t result;

  result = qword_256A1A858;
  if (!qword_256A1A858)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485490, &type metadata for FBKSEvaluation.Subject.InteractionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A858);
  }
  return result;
}

unint64_t sub_23B4480F8()
{
  unint64_t result;

  result = qword_256A1A860;
  if (!qword_256A1A860)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4855D8, &type metadata for FBKSEvaluation.Subject.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A860);
  }
  return result;
}

unint64_t sub_23B448140()
{
  unint64_t result;

  result = qword_256A1A868;
  if (!qword_256A1A868)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485600, &type metadata for FBKSEvaluation.Subject.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A868);
  }
  return result;
}

void sub_23B448184(void *a1, void *a2, void (*a3)(id, uint64_t), uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t aBlock[3];
  ValueMetadata *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = a4;
  v13[5] = a5;
  v14 = qword_256A1A4E0;
  v36 = a2;
  swift_retain();
  v35 = a5;
  if (v14 != -1)
    swift_once();
  v15 = sub_23B4833E0();
  __swift_project_value_buffer(v15, (uint64_t)qword_256A1BC98);
  v16 = sub_23B4833C8();
  v17 = sub_23B4835A8();
  if (os_log_type_enabled(v16, v17))
  {
    v34 = v13;
    v18 = swift_slowAlloc();
    v33 = v10;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136446210;
    v37 = sub_23B44BBC0(0x5F2864726F636572, 0xEA0000000000293ALL, aBlock);
    v13 = v34;
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v16, v17, "%{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v20, -1, -1);
    MEMORY[0x23B86528C](v19, -1, -1);
  }

  v39 = &type metadata for FeedbackFeatureFlags;
  v40 = (uint64_t (*)())sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v21 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v21 & 1) == 0)
  {
    sub_23B446D44();
    v25 = swift_allocError();
    *v26 = 0;
    *v12 = v25;
    swift_storeEnumTagMultiPayload();
    sub_23B466674((uint64_t)v12, (uint64_t)v36, a3, a4, v35);
    sub_23B448B30((uint64_t)v12, &qword_256A1A758);
LABEL_8:
    swift_release();
    return;
  }
  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  aBlock[0] = (uint64_t)a1;
  type metadata accessor for FBKSEvaluation(0);
  sub_23B44646C(&qword_256A1A760, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
  v22 = sub_23B483230();
  v24 = v23;
  swift_release();
  sub_23B446D90(v22, v24);
  if (qword_256A1A510 != -1)
    swift_once();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = sub_23B4488AC;
  *(_QWORD *)(v27 + 24) = v13;
  swift_retain();
  v28 = (void *)sub_23B457884((uint64_t)sub_23B448BF0, v27);
  swift_release();
  if (!v28)
  {
    sub_23B43ED7C(v22, v24);
    sub_23B43ED7C(v22, v24);
    goto LABEL_8;
  }
  v29 = (void *)sub_23B483338();
  sub_23B43ED7C(v22, v24);
  v30 = (_QWORD *)swift_allocObject();
  v30[2] = sub_23B4488AC;
  v30[3] = v13;
  v30[4] = a1;
  v40 = sub_23B448BE8;
  v41 = v30;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23B444D20;
  v39 = (ValueMetadata *)&block_descriptor_27;
  v31 = _Block_copy(aBlock);
  swift_retain();
  v32 = a1;
  swift_release();
  objc_msgSend(v28, sel_recordEvaluationWithEvaluationJSON_completion_, v29, v31);
  sub_23B43ED7C(v22, v24);
  _Block_release(v31);
  swift_release();
  swift_unknownObjectRelease();

}

uint64_t sub_23B448660(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x707365526D726F66 && a2 == 0xEC00000065736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23B4487AC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_23B4487DC()
{
  unint64_t result;

  result = qword_256A1A870;
  if (!qword_256A1A870)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.Action, &type metadata for FBKSEvaluation.Action);
    atomic_store(result, (unint64_t *)&qword_256A1A870);
  }
  return result;
}

uint64_t sub_23B448820(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 3 || a3 == 5 || a3 == 4)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23B44884C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 3 || a3 == 5 || a3 == 4)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23B448878()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_23B4488AC(uint64_t a1)
{
  uint64_t v1;

  sub_23B466674(a1, *(_QWORD *)(v1 + 16), *(void (**)(id, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_23B4488BC()
{
  return objectdestroy_29Tm(&qword_256A1A878);
}

uint64_t sub_23B4488C8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A878);
  return sub_23B445230(a1);
}

uint64_t sub_23B448908(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_23B44894C()
{
  unint64_t result;

  result = qword_256A1A880;
  if (!qword_256A1A880)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSEvaluation.EvaluationError, &type metadata for FBKSEvaluation.EvaluationError);
    atomic_store(result, (unint64_t *)&qword_256A1A880);
  }
  return result;
}

uint64_t sub_23B448990(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B4489D8()
{
  return objectdestroy_29Tm(&qword_256A1A890);
}

uint64_t objectdestroy_29Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_23B448A40(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A890);
  return sub_23B444068(a1, v3);
}

void sub_23B448A90(void *a1)
{
  uint64_t v1;

  sub_23B4438B0(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

void sub_23B448A98(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_23B443AD0(a1, a2, a3, *(void (**)(void *, uint64_t))(v3 + 16));
}

unint64_t sub_23B448AA0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256A1A898;
  if (!qword_256A1A898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A750);
    v2 = sub_23B44646C(&qword_256A1A8A0, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE4AC0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256A1A898);
  }
  return result;
}

uint64_t sub_23B448B1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B43ED7C(a1, a2);
  return a1;
}

uint64_t sub_23B448B30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_23B448B70(uint64_t a1)
{
  uint64_t v1;

  sub_23B43FC44(a1, *(void (**)(id, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t static FBKSDonation.presented(evaluationID:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return swift_task_switch();
}

uint64_t sub_23B448C14()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  _BYTE *v10;
  uint64_t v11;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0xD000000000000018, 0x800000023B48D6F0, &v11);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v7;
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v0 + 64);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v8;
    *v8 = v0;
    v8[1] = sub_23B448E80;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B448E80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B448EEC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B448EF8()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_256A1A8B0 = result;
  return result;
}

uint64_t FBKSDonation.DonationError.description.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000027;
  if (*v0 == 1)
    v1 = 0xD00000000000002CLL;
  if (*v0)
    return v1;
  else
    return 0x6E6F6974616E6F44;
}

BOOL static FBKSDonation.DonationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FBKSDonation.DonationError.hash(into:)()
{
  return sub_23B483854();
}

uint64_t FBKSDonation.DonationError.hashValue.getter()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

void sub_23B449010(void *a1, void (*a2)(void *, uint64_t))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  _BYTE *v15;
  uint64_t v16;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v16);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      a2(a1, 1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44C878();
  v14 = (void *)swift_allocError();
  *v15 = 0;
  a2(v14, 1);

}

void sub_23B449234(uint64_t a1, unint64_t a2, void *a3, void (*a4)(void *, uint64_t))
{
  id v8;
  id v9;
  void *v10;

  if (a3)
  {
    v9 = a3;
    a4(a3, 1);

  }
  else if (a2 >> 60 == 15)
  {
    a4(0, 0);
  }
  else
  {
    sub_23B483200();
    swift_allocObject();
    sub_23B446D90(a1, a2);
    sub_23B4831F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A8C8);
    sub_23B44CD50();
    sub_23B4831E8();
    swift_release();
    v8 = v10;
    a4(v10, 0);
    sub_23B448B1C(a1, a2);

  }
}

uint64_t static FBKSDonation.fetch(evaluationID:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_23B4493BC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  int8x16_t *v7;
  _QWORD *v8;
  _BYTE *v10;
  uint64_t v11;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 64) = sub_23B44BBC0(0xD000000000000014, 0x800000023B48D5E0, &v11);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    v7[1] = vextq_s8(*(int8x16_t *)(v0 + 72), *(int8x16_t *)(v0 + 72), 8uLL);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A8C8);
    *v8 = v0;
    v8[1] = sub_23B443ED8;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B44963C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A920);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  _s15FeedbackService12FBKSDonationC5fetch12evaluationID10completiony10Foundation4UUIDV_ys6ResultOyACSgs5Error_pGctFZ_0(a3, (void (*)(void *, uint64_t))sub_23B44CCF0, v9);
  return swift_release();
}

uint64_t sub_23B44971C(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A920);
    return sub_23B483530();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A920);
    return sub_23B48353C();
  }
}

void sub_23B449788(void *a1, void (*a2)(void))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v15);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      ((void (*)(void *))a2)(a1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44CE5C();
  v14 = (void *)swift_allocError();
  a2();

}

void sub_23B4499A0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_23B4499F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  _s15FeedbackService12FBKSDonationC9presented12evaluationID10completiony10Foundation4UUIDV_ys5Error_pSgctFZ_0(a2, (void (*)(void))sub_23B44CCD4, v8);
  return swift_release();
}

char *sub_23B449AD4(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11)
{
  objc_class *v11;
  id v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  _OWORD v26[2];
  char v27;
  _OWORD v28[2];
  char v29;
  uint64_t v30[4];

  v19 = objc_allocWithZone(v11);
  v20 = *(_BYTE *)(a5 + 32);
  v21 = *(_BYTE *)(a6 + 32);
  *(_OWORD *)v30 = *a1;
  v22 = *(_OWORD *)(a5 + 16);
  v28[0] = *(_OWORD *)a5;
  v28[1] = v22;
  v29 = v20;
  v23 = *(_OWORD *)(a6 + 16);
  v26[0] = *(_OWORD *)a6;
  v26[1] = v23;
  v27 = v21;
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(v30, a2, a3, a4, (uint64_t *)v28, (uint64_t *)v26, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11);
}

char *FBKSDonation.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11, uint64_t a12)
{
  objc_class *v12;
  objc_class *v13;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  char *v25;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[2];
  char v33;
  _OWORD v34[2];
  char v35;
  uint64_t v36[4];

  v13 = v12;
  v30 = a7;
  v31 = a8;
  v28 = a3;
  v29 = a4;
  v27 = a9;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v13);
  v21 = *(_BYTE *)(a5 + 32);
  v22 = *(_BYTE *)(a6 + 32);
  *(_OWORD *)v36 = *a1;
  v23 = *(_OWORD *)(a5 + 16);
  v34[0] = *(_OWORD *)a5;
  v34[1] = v23;
  v35 = v21;
  v24 = *(_OWORD *)(a6 + 16);
  v32[0] = *(_OWORD *)a6;
  v32[1] = v24;
  v33 = v22;
  sub_23B448908(a12, (uint64_t)v20, &qword_256A1A650);
  v25 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(v36, a2, v28, v29, (uint64_t *)v34, (uint64_t *)v32, v30, v31, v27, *((uint64_t *)&v27 + 1), a10, a11, (uint64_t)v20);
  sub_23B448B30(a12, &qword_256A1A650);
  return v25;
}

char *FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  char v30;
  _OWORD v31[2];
  char v32;
  uint64_t v33[4];

  v28 = a8;
  v26 = a4;
  v27 = a7;
  v25 = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v18) = *(_BYTE *)(a5 + 32);
  v20 = *(_BYTE *)(a6 + 32);
  *(_OWORD *)v33 = *a1;
  v21 = *(_OWORD *)(a5 + 16);
  v31[0] = *(_OWORD *)a5;
  v31[1] = v21;
  v32 = v18;
  v22 = *(_OWORD *)(a6 + 16);
  v29[0] = *(_OWORD *)a6;
  v29[1] = v22;
  v30 = v20;
  sub_23B448908(a12, (uint64_t)v19, &qword_256A1A650);
  v23 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(v33, a2, a3, v26, (uint64_t *)v31, (uint64_t *)v29, v27, v28, v25, *((uint64_t *)&v25 + 1), a10, a11, (uint64_t)v19);
  sub_23B448B30(a12, &qword_256A1A650);
  return v23;
}

char *FBKSDonation.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11)
{
  objc_class *v11;
  id v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  _OWORD v26[2];
  char v27;
  _OWORD v28[2];
  char v29;
  uint64_t v30[4];

  v19 = objc_allocWithZone(v11);
  v20 = *(_BYTE *)(a5 + 32);
  v21 = *(_BYTE *)(a6 + 32);
  *(_OWORD *)v30 = *a1;
  v22 = *(_OWORD *)(a5 + 16);
  v28[0] = *(_OWORD *)a5;
  v28[1] = v22;
  v29 = v20;
  v23 = *(_OWORD *)(a6 + 16);
  v26[0] = *(_OWORD *)a6;
  v26[1] = v23;
  v27 = v21;
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(v30, a2, a3, a4, (uint64_t *)v28, (uint64_t *)v26, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11);
}

char *FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  char v12;
  char v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[2];
  char v18;
  _OWORD v19[2];
  char v20;
  __int128 v21;

  v12 = *(_BYTE *)(a5 + 32);
  v13 = *(_BYTE *)(a6 + 32);
  v21 = *a1;
  v14 = *(_OWORD *)(a5 + 16);
  v19[0] = *(_OWORD *)a5;
  v19[1] = v14;
  v20 = v12;
  v15 = *(_OWORD *)(a6 + 16);
  v17[0] = *(_OWORD *)a6;
  v17[1] = v15;
  v18 = v13;
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)((uint64_t *)&v21, a2, a3, a4, (uint64_t *)v19, (uint64_t *)v17, a7, a8, a9, a10, a11, a12);
}

id FBKSDonation.__allocating_init(from:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  id v4;
  _QWORD v6[5];

  v3 = objc_allocWithZone(v1);
  sub_23B44C834(a1, (uint64_t)v6);
  v4 = FBKSInteraction.init(from:)(v6);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v4;
}

id FBKSDonation.init(from:)(uint64_t a1)
{
  id v2;
  _QWORD v4[5];

  sub_23B44C834(a1, (uint64_t)v4);
  v2 = FBKSInteraction.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v2;
}

uint64_t sub_23B44A028(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint8_t *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _BYTE *v35;
  char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  id v43;
  uint64_t *v44;
  void (*v45)(_QWORD);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t aBlock[3];
  ValueMetadata *v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v6);
  v49 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B4833B0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256A1A4E0 != -1)
    swift_once();
  v14 = sub_23B4833E0();
  v47 = __swift_project_value_buffer(v14, (uint64_t)qword_256A1BC98);
  v15 = sub_23B4833C8();
  v16 = sub_23B4835A8();
  v17 = os_log_type_enabled(v15, v16);
  v48 = v9;
  if (v17)
  {
    v44 = v13;
    v18 = swift_slowAlloc();
    v45 = a1;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136446210;
    v54 = sub_23B44BBC0(0x5F286574616E6F64, 0xEA0000000000293ALL, aBlock);
    v13 = v44;
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v15, v16, "%{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v20, -1, -1);
    v21 = v19;
    a1 = v45;
    MEMORY[0x23B86528C](v21, -1, -1);
  }

  v51 = &type metadata for FeedbackFeatureFlags;
  v52 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v22 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  v23 = (uint64_t)v49;
  if ((v22 & 1) == 0)
  {
    sub_23B446D44();
    v30 = swift_allocError();
    *v31 = 0;
LABEL_15:
    *v13 = v30;
    swift_storeEnumTagMultiPayload();
    a1(v13);
    return sub_23B448B30((uint64_t)v13, &qword_256A1A758);
  }
  if (qword_256A1A4D0 != -1)
    swift_once();
  if ((byte_256A1A8B0 & 1) == 0)
  {
    v32 = sub_23B4833C8();
    v33 = sub_23B483584();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_23B433000, v32, v33, "Donation is not supported on FCS", v34, 2u);
      MEMORY[0x23B86528C](v34, -1, -1);
    }

    sub_23B44C878();
    v30 = swift_allocError();
    *v35 = 1;
    goto LABEL_15;
  }
  v24 = v3 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448908(v24, v23, &qword_256A1A650);
  v25 = v48;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v23, 1, v8) == 1)
  {
    sub_23B448B30(v23, &qword_256A1A650);
    sub_23B483248();
    swift_allocObject();
    sub_23B48323C();
    aBlock[0] = v3;
    type metadata accessor for FBKSDonation();
    sub_23B44CDC4(qword_256A1A8D8, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    v26 = (void *)v3;
    v27 = sub_23B483230();
    v29 = v28;
    swift_release();
    sub_23B446D90(v27, v29);
    if (qword_256A1A510 != -1)
      swift_once();
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = a1;
    *(_QWORD *)(v38 + 24) = a2;
    swift_retain();
    v39 = (void *)sub_23B457884((uint64_t)sub_23B44C91C, v38);
    swift_release();
    if (v39)
    {
      v40 = (void *)sub_23B483338();
      sub_23B43ED7C(v27, v29);
      v41 = (_QWORD *)swift_allocObject();
      v41[2] = a1;
      v41[3] = a2;
      v41[4] = v26;
      v52 = (unint64_t)sub_23B44C950;
      v53 = v41;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B444D20;
      v51 = (ValueMetadata *)&block_descriptor_1;
      v42 = _Block_copy(aBlock);
      swift_retain();
      v43 = v26;
      swift_release();
      objc_msgSend(v39, sel_donateWithDonationJSON_completion_, v40, v42);
      sub_23B43ED7C(v27, v29);
      _Block_release(v42);

      return swift_unknownObjectRelease();
    }
    else
    {
      sub_23B43ED7C(v27, v29);
      return sub_23B43ED7C(v27, v29);
    }
  }
  else
  {
    v37 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v46, v23, v8);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 16))(v13, v37, v8);
    swift_storeEnumTagMultiPayload();
    a1(v13);
    sub_23B448B30((uint64_t)v13, &qword_256A1A758);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v37, v8);
  }
}

uint64_t sub_23B44A6C8(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  _BYTE *v22;
  _QWORD v24[2];
  void (*v25)(_QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256A1A4E0 != -1)
    swift_once();
  v8 = sub_23B4833E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
  v9 = a1;
  v10 = sub_23B4833C8();
  v11 = sub_23B48359C();
  if (!os_log_type_enabled(v10, v11))
  {

    if (a1)
      goto LABEL_5;
LABEL_7:
    sub_23B44C878();
    v21 = swift_allocError();
    *v22 = 0;
    *v7 = v21;
    swift_storeEnumTagMultiPayload();
    goto LABEL_8;
  }
  v12 = swift_slowAlloc();
  v25 = a2;
  v13 = (uint8_t *)v12;
  v14 = swift_slowAlloc();
  v27 = (uint64_t)a1;
  v28 = v14;
  *(_DWORD *)v13 = 136315138;
  v24[0] = v13 + 4;
  v15 = v9;
  v24[1] = v5;
  v16 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
  v17 = sub_23B483470();
  v27 = sub_23B44BBC0(v17, v18, &v28);
  sub_23B4835D8();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_23B433000, v10, v11, "Failed to connect to centralized feedback daemon: %s", v13, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B86528C](v14, -1, -1);
  v19 = v13;
  a2 = v25;
  MEMORY[0x23B86528C](v19, -1, -1);

  if (!a1)
    goto LABEL_7;
LABEL_5:
  *v7 = (uint64_t)v9;
  swift_storeEnumTagMultiPayload();
  v20 = v9;
LABEL_8:
  a2(v7);
  return sub_23B448B30((uint64_t)v7, &qword_256A1A758);
}

uint64_t sub_23B44A94C(uint64_t a1, void *a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  _BYTE *v22;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a5;
  v28 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - v14;
  v16 = sub_23B4833B0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *v9 = (uint64_t)a2;
    swift_storeEnumTagMultiPayload();
    v20 = a2;
LABEL_5:
    a3(v9);
    return sub_23B448B30((uint64_t)v9, &qword_256A1A758);
  }
  sub_23B448908(v28, (uint64_t)v15, &qword_256A1A650);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_23B448B30((uint64_t)v15, &qword_256A1A650);
    sub_23B44C878();
    v21 = swift_allocError();
    *v22 = 0;
    *v9 = v21;
    swift_storeEnumTagMultiPayload();
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  v24 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v24(v13, v19, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
  v25 = v27 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448990((uint64_t)v13, v25);
  swift_endAccess();
  v24((char *)v9, v19, v16);
  swift_storeEnumTagMultiPayload();
  a3(v9);
  sub_23B448B30((uint64_t)v9, &qword_256A1A758);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_23B44ABD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return swift_task_switch();
}

uint64_t sub_23B44ABEC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v11;
  char v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v16 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0x29286574616E6F64, 0xE800000000000000, &v16);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    if (qword_256A1A4D0 != -1)
      swift_once();
    if ((byte_256A1A8B0 & 1) != 0)
    {
      v7 = *(_QWORD *)(v0 + 72);
      v8 = swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v8;
      *(_QWORD *)(v8 + 16) = v7;
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v9;
      sub_23B4833B0();
      *v9 = v0;
      v9[1] = sub_23B4450AC;
      return sub_23B4837DC();
    }
    v13 = sub_23B4833C8();
    v14 = sub_23B483584();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23B433000, v13, v14, "Donation is not supported on FCS", v15, 2u);
      MEMORY[0x23B86528C](v15, -1, -1);
    }

    sub_23B44C878();
    swift_allocError();
    v12 = 1;
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    v12 = 0;
  }
  *v11 = v12;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B44AF2C(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t aBlock[3];
  ValueMetadata *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256A1A4E0 != -1)
    swift_once();
  v9 = sub_23B4833E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_256A1BC98);
  v10 = sub_23B4833C8();
  v11 = sub_23B4835A8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v31 = sub_23B44BBC0(0x6164696C61766E69, 0xEE00293A5F286574, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v10, v11, "%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v13, -1, -1);
    MEMORY[0x23B86528C](v12, -1, -1);
  }

  v28 = &type metadata for FeedbackFeatureFlags;
  v29 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v14 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v14 & 1) == 0)
  {
    sub_23B446D44();
LABEL_12:
    v22 = (void *)swift_allocError();
    *v23 = 0;
    a1();

    return;
  }
  v15 = v3 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448908(v15, (uint64_t)v8, &qword_256A1A650);
  v16 = sub_23B4833B0();
  LODWORD(v15) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v8, 1, v16);
  sub_23B448B30((uint64_t)v8, &qword_256A1A650);
  if ((_DWORD)v15 == 1)
  {
    if (qword_256A1A510 != -1)
      swift_once();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a1;
    *(_QWORD *)(v17 + 24) = a2;
    swift_retain();
    v18 = (void *)sub_23B457884((uint64_t)sub_23B44C9AC, v17);
    swift_release();
    if (v18)
    {
      sub_23B483248();
      swift_allocObject();
      sub_23B48323C();
      aBlock[0] = v3;
      type metadata accessor for FBKSDonation();
      sub_23B44CDC4(qword_256A1A8D8, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
      v19 = sub_23B483230();
      v21 = v20;
      swift_release();
      sub_23B446D90(v19, v21);
      v24 = (void *)sub_23B483338();
      sub_23B43ED7C(v19, v21);
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = a1;
      *(_QWORD *)(v25 + 24) = a2;
      v29 = (unint64_t)sub_23B44C9B4;
      v30 = v25;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B4499A0;
      v28 = (ValueMetadata *)&block_descriptor_18;
      v26 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v18, sel_invalidateDonationWithDonationJSON_completion_, v24, v26);
      sub_23B43ED7C(v19, v21);
      _Block_release(v26);

      swift_unknownObjectRelease();
      return;
    }
    sub_23B44C878();
    goto LABEL_12;
  }
  ((void (*)(_QWORD))a1)(0);
}

void sub_23B44B3C8(void *a1, void (*a2)(void))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  _BYTE *v15;
  uint64_t v16;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v16);
    sub_23B4835D8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      ((void (*)(void *))a2)(a1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44C878();
  v14 = (void *)swift_allocError();
  *v15 = 0;
  a2();

}

uint64_t sub_23B44B5E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return swift_task_switch();
}

uint64_t sub_23B44B5FC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t v12;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v12 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0x6164696C61766E69, 0xEC00000029286574, &v12);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 64);
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v8;
    *(_QWORD *)(v8 + 16) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v9;
    *v9 = v0;
    v9[1] = sub_23B44B878;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B44B878()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B44B8E4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B44B918(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a6(a5, v13);
  return swift_release();
}

uint64_t sub_23B44BA00(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B483530();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B48353C();
  }
}

void FBKSDonation.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBKSDonation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSDonation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B44BAEC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23B44BAFC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23B44BB30(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23B44BB50(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23B44BBC0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23B4835D8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23B44BBC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B44BC90(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B43F084((uint64_t)v12, *a3);
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
      sub_23B43F084((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23B44BC90(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B4835E4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B44BE48(a5, a6);
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
  v8 = sub_23B483650();
  if (!v8)
  {
    sub_23B48365C();
    __break(1u);
LABEL_17:
    result = sub_23B4836A4();
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

uint64_t sub_23B44BE48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B44BEDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B44C0B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B44C0B4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B44BEDC(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B44C050(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B483614();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B48365C();
      __break(1u);
LABEL_10:
      v2 = sub_23B4834A0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B4836A4();
    __break(1u);
LABEL_14:
    result = sub_23B48365C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B44C050(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A938);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B44C0B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A938);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
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
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

_BYTE **sub_23B44C200(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void _s15FeedbackService12FBKSDonationC9presented12evaluationID10completiony10Foundation4UUIDV_ys5Error_pSgctFZ_0(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  uint64_t aBlock[3];
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1BC98);
  v6 = sub_23B4833C8();
  v7 = sub_23B4835A8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136446210;
    sub_23B44BBC0(0xD000000000000023, 0x800000023B48DA40, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);
  }

  v19 = &type metadata for FeedbackFeatureFlags;
  v20 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v10 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v10 & 1) != 0)
  {
    if (qword_256A1A510 != -1)
      swift_once();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a2;
    *(_QWORD *)(v11 + 24) = a3;
    swift_retain();
    v12 = (void *)sub_23B457884((uint64_t)sub_23B44CE54, v11);
    swift_release();
    if (v12)
    {
      v13 = (void *)sub_23B48338C();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = a2;
      *(_QWORD *)(v14 + 24) = a3;
      v20 = (unint64_t)sub_23B44CEA0;
      v21 = v14;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B4499A0;
      v19 = (ValueMetadata *)&block_descriptor_52;
      v15 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_presentedDonationWithEvaluationID_completion_, v13, v15);
      swift_unknownObjectRelease();
      _Block_release(v15);

    }
  }
  else
  {
    sub_23B446D44();
    v16 = (void *)swift_allocError();
    *v17 = 0;
    a2();

  }
}

uint64_t sub_23B44C518(uint64_t a1)
{
  uint64_t v1;

  return sub_23B4499F4(a1, *(_QWORD *)(v1 + 16));
}

void _s15FeedbackService12FBKSDonationC5fetch12evaluationID10completiony10Foundation4UUIDV_ys6ResultOyACSgs5Error_pGctFZ_0(uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  uint64_t aBlock[3];
  ValueMetadata *v19;
  unint64_t v20;
  uint64_t v21;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1BC98);
  v6 = sub_23B4833C8();
  v7 = sub_23B4835A8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136446210;
    sub_23B44BBC0(0xD00000000000001FLL, 0x800000023B48D6D0, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);
  }

  v19 = &type metadata for FeedbackFeatureFlags;
  v20 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v10 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v10 & 1) != 0)
  {
    if (qword_256A1A510 != -1)
      swift_once();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a2;
    *(_QWORD *)(v11 + 24) = a3;
    swift_retain();
    v12 = (void *)sub_23B457884((uint64_t)sub_23B44CD40, v11);
    swift_release();
    if (v12)
    {
      v13 = (void *)sub_23B48338C();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = a2;
      *(_QWORD *)(v14 + 24) = a3;
      v20 = (unint64_t)sub_23B44CD48;
      v21 = v14;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B47D698;
      v19 = (ValueMetadata *)&block_descriptor_40;
      v15 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_fetchDonationWithEvaluationID_completion_, v13, v15);
      swift_unknownObjectRelease();
      _Block_release(v15);

    }
  }
  else
  {
    sub_23B446D44();
    v16 = (void *)swift_allocError();
    *v17 = 0;
    a2(v16, 1);

  }
}

uint64_t sub_23B44C82C(uint64_t a1)
{
  uint64_t v1;

  return sub_23B44963C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23B44C834(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23B44C878()
{
  unint64_t result;

  result = qword_256A1A8D0;
  if (!qword_256A1A8D0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSDonation.DonationError, &type metadata for FBKSDonation.DonationError);
    atomic_store(result, (unint64_t *)&qword_256A1A8D0);
  }
  return result;
}

uint64_t type metadata accessor for FBKSDonation()
{
  uint64_t result;

  result = qword_256A1A8F8;
  if (!qword_256A1A8F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B44C8F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B44C91C(void *a1)
{
  uint64_t v1;

  return sub_23B44A6C8(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23B44C924()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23B44C950(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_23B44A94C(a1, a2, *(void (**)(uint64_t *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_23B44C974(uint64_t a1)
{
  uint64_t v1;

  return sub_23B44B918(a1, *(_QWORD *)(v1 + 16), &qword_256A1A878, (uint64_t)&unk_250C5FCD0, (uint64_t)sub_23B4488C8, (void (*)(uint64_t, uint64_t))sub_23B44A028);
}

void sub_23B44C9AC(void *a1)
{
  uint64_t v1;

  sub_23B44B3C8(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_23B44C9B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23B44C9D4(uint64_t a1)
{
  uint64_t v1;

  return sub_23B44B918(a1, *(_QWORD *)(v1 + 16), &qword_256A1A918, (uint64_t)&unk_250C5FCA8, (uint64_t)sub_23B44CCD4, (void (*)(uint64_t, uint64_t))sub_23B44AF2C);
}

unint64_t sub_23B44CA10()
{
  unint64_t result;

  result = qword_256A1A8F0;
  if (!qword_256A1A8F0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSDonation.DonationError, &type metadata for FBKSDonation.DonationError);
    atomic_store(result, (unint64_t *)&qword_256A1A8F0);
  }
  return result;
}

uint64_t sub_23B44CA54()
{
  return type metadata accessor for FBKSDonation();
}

uint64_t sub_23B44CA5C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for FBKSDonation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSDonation.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of FBKSDonation.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 592))();
}

uint64_t dispatch thunk of FBKSDonation.donate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of FBKSDonation.donate()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x260);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B44CEA4;
  return v7(a1);
}

uint64_t dispatch thunk of FBKSDonation.invalidate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of FBKSDonation.invalidate()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x270);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23B447194;
  return v5();
}

uint64_t storeEnumTagSinglePayload for FBKSDonation.DonationError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B44CC48 + 4 * byte_23B485A2D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B44CC7C + 4 * byte_23B485A28[v4]))();
}

uint64_t sub_23B44CC7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B44CC84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B44CC8CLL);
  return result;
}

uint64_t sub_23B44CC98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B44CCA0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B44CCA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B44CCAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSDonation.DonationError()
{
  return &type metadata for FBKSDonation.DonationError;
}

uint64_t sub_23B44CCC8()
{
  return objectdestroy_29Tm(&qword_256A1A918);
}

uint64_t sub_23B44CCD8()
{
  return objectdestroy_29Tm(&qword_256A1A878);
}

uint64_t sub_23B44CCE4()
{
  return objectdestroy_29Tm(&qword_256A1A920);
}

uint64_t sub_23B44CCF0(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A920);
  return sub_23B44971C(a1, v3);
}

void sub_23B44CD40(void *a1)
{
  uint64_t v1;

  sub_23B449010(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

void sub_23B44CD48(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_23B449234(a1, a2, a3, *(void (**)(void *, uint64_t))(v3 + 16));
}

unint64_t sub_23B44CD50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256A1A928;
  if (!qword_256A1A928)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1A8C8);
    v2 = sub_23B44CDC4(&qword_256A1A930, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE4AC0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256A1A928);
  }
  return result;
}

uint64_t sub_23B44CDC4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FBKSDonation();
    result = MEMORY[0x23B8651F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B44CE04()
{
  return objectdestroy_29Tm(&qword_256A1A918);
}

uint64_t sub_23B44CE10(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B44BA00(a1);
}

void sub_23B44CE54(void *a1)
{
  uint64_t v1;

  sub_23B449788(a1, *(void (**)(void))(v1 + 16));
}

unint64_t sub_23B44CE5C()
{
  unint64_t result;

  result = qword_256A1A940;
  if (!qword_256A1A940)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.InteractionError, &type metadata for FBKSInteraction.InteractionError);
    atomic_store(result, (unint64_t *)&qword_256A1A940);
  }
  return result;
}

uint64_t FormItem.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t FormItem.shouldRepeat.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t FormItem.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FormItem.platform.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FormItem.signature.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FormItem.formIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FormItem.isSurvey.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 80) == 0x796576727553 && *(_QWORD *)(v0 + 88) == 0xE600000000000000)
    return 1;
  else
    return sub_23B4837D0();
}

uint64_t sub_23B44CFD8(char a1)
{
  return qword_23B485D60[a1];
}

uint64_t sub_23B44CFF8(char *a1, char *a2)
{
  return sub_23B4732F0(*a1, *a2);
}

uint64_t sub_23B44D004()
{
  return sub_23B47328C();
}

uint64_t sub_23B44D010()
{
  return sub_23B472E64();
}

uint64_t sub_23B44D018()
{
  return sub_23B47328C();
}

uint64_t sub_23B44D020@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B44E0E4();
  *a1 = result;
  return result;
}

uint64_t sub_23B44D04C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23B44CFD8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B44D074()
{
  char *v0;

  return sub_23B44CFD8(*v0);
}

uint64_t sub_23B44D07C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B44E0E4();
  *a1 = result;
  return result;
}

void sub_23B44D0A0(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_23B44D0AC()
{
  sub_23B44D704();
  return sub_23B48389C();
}

uint64_t sub_23B44D0D4()
{
  sub_23B44D704();
  return sub_23B4838A8();
}

uint64_t sub_23B44D0FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = sub_23B4831D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v10 = sub_23B4837C4();
  v26 = 0;
  v11 = objc_msgSend(v9, sel_dataWithJSONObject_options_error_, v10, 1, &v26);
  swift_unknownObjectRelease();
  v12 = v26;
  if (v11)
  {
    v13 = sub_23B483344();
    v15 = v14;

    sub_23B483200();
    swift_allocObject();
    sub_23B4831F4();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCB1A0], v5);
    sub_23B4831DC();
    sub_23B44E12C();
    sub_23B4831E8();
    swift_release();
    result = sub_23B43ED7C(v13, v15);
    if (!v2)
    {
      v17 = v27;
      v18 = v28;
      v19 = v29;
      v20 = v30;
      v21 = v31;
      v22 = v32;
      v23 = v33;
      *(_QWORD *)a2 = v26;
      *(_BYTE *)(a2 + 8) = v17;
      *(_OWORD *)(a2 + 16) = v18;
      *(_OWORD *)(a2 + 32) = v19;
      *(_OWORD *)(a2 + 48) = v20;
      *(_OWORD *)(a2 + 64) = v21;
      *(_QWORD *)(a2 + 80) = v22;
      *(_QWORD *)(a2 + 88) = v23;
    }
  }
  else
  {
    v24 = v12;
    sub_23B483314();

    return swift_willThrow();
  }
  return result;
}

uint64_t FormItem.description.getter()
{
  sub_23B483608();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B4837AC();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B483488();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t FormItem.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[11];
  int v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A948);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(unsigned __int8 *)(v1 + 8);
  v8 = *(_QWORD *)(v1 + 16);
  v14[9] = *(_QWORD *)(v1 + 24);
  v14[10] = v8;
  v9 = *(_QWORD *)(v1 + 32);
  v14[7] = *(_QWORD *)(v1 + 40);
  v14[8] = v9;
  v10 = *(_QWORD *)(v1 + 48);
  v14[5] = *(_QWORD *)(v1 + 56);
  v14[6] = v10;
  v11 = *(_QWORD *)(v1 + 64);
  v14[3] = *(_QWORD *)(v1 + 72);
  v14[4] = v11;
  v12 = *(_QWORD *)(v1 + 88);
  v14[1] = *(_QWORD *)(v1 + 80);
  v14[2] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B44D704();
  sub_23B483890();
  v22 = 0;
  sub_23B483794();
  if (!v2)
  {
    v21 = 1;
    sub_23B48377C();
    v20 = 2;
    sub_23B483770();
    v19 = 3;
    sub_23B483770();
    v18 = 4;
    sub_23B483770();
    v17 = 5;
    sub_23B483770();
    v16 = 6;
    sub_23B483770();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23B44D704()
{
  unint64_t result;

  result = qword_256A1A950;
  if (!qword_256A1A950)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485D0C, &type metadata for FormItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A950);
  }
  return result;
}

uint64_t FormItem.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
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
  void (*v21)(char *, uint64_t);
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
  int v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A958);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B44D704();
  sub_23B483884();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v6;
  }
  else
  {
    v41 = 0;
    v9 = sub_23B48371C();
    v40 = 1;
    v33 = sub_23B483704();
    v39 = 2;
    v32 = sub_23B4836F8();
    v38 = 3;
    v12 = v11;
    swift_bridgeObjectRetain();
    v13 = sub_23B4836F8();
    v34 = v12;
    v30 = v13;
    v31 = v14;
    v37 = 4;
    swift_bridgeObjectRetain();
    v28 = sub_23B4836F8();
    v29 = v15;
    v16 = v31;
    v36 = 5;
    swift_bridgeObjectRetain();
    v26 = sub_23B4836F8();
    v27 = v17;
    v35 = 6;
    swift_bridgeObjectRetain();
    v18 = sub_23B4836F8();
    v20 = v19;
    v33 &= 1u;
    v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    v25 = v18;
    v21(v8, v5);
    v22 = v34;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v33;
    *(_QWORD *)(a2 + 16) = v32;
    *(_QWORD *)(a2 + 24) = v22;
    *(_QWORD *)(a2 + 32) = v30;
    *(_QWORD *)(a2 + 40) = v16;
    v24 = v27;
    *(_QWORD *)(a2 + 48) = v28;
    *(_QWORD *)(a2 + 56) = v23;
    *(_QWORD *)(a2 + 64) = v26;
    *(_QWORD *)(a2 + 72) = v24;
    *(_QWORD *)(a2 + 80) = v25;
    *(_QWORD *)(a2 + 88) = v20;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B44DB60@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FormItem.init(from:)(a1, a2);
}

uint64_t sub_23B44DB74(_QWORD *a1)
{
  return FormItem.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for FormItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FormItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FormItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FormItem(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for FormItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FormItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FormItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FormItem()
{
  return &type metadata for FormItem;
}

uint64_t getEnumTagSinglePayload for FormItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FormItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23B44DF8C + 4 * byte_23B485B5D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23B44DFC0 + 4 * byte_23B485B58[v4]))();
}

uint64_t sub_23B44DFC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B44DFC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B44DFD0);
  return result;
}

uint64_t sub_23B44DFDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B44DFE4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23B44DFE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B44DFF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FormItem.CodingKeys()
{
  return &type metadata for FormItem.CodingKeys;
}

unint64_t sub_23B44E010()
{
  unint64_t result;

  result = qword_256A1A960;
  if (!qword_256A1A960)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485CE4, &type metadata for FormItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A960);
  }
  return result;
}

unint64_t sub_23B44E058()
{
  unint64_t result;

  result = qword_256A1A968;
  if (!qword_256A1A968)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485C1C, &type metadata for FormItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A968);
  }
  return result;
}

unint64_t sub_23B44E0A0()
{
  unint64_t result;

  result = qword_256A1A970;
  if (!qword_256A1A970)
  {
    result = MEMORY[0x23B8651F0](&unk_23B485C44, &type metadata for FormItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1A970);
  }
  return result;
}

uint64_t sub_23B44E0E4()
{
  unint64_t v0;

  v0 = sub_23B4836B0();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

unint64_t sub_23B44E12C()
{
  unint64_t result;

  result = qword_256A1A978;
  if (!qword_256A1A978)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FormItem, &type metadata for FormItem);
    atomic_store(result, (unint64_t *)&qword_256A1A978);
  }
  return result;
}

Swift::Void __swiftcall FBKSLaunchConfiguration.setToSkipPrompt(_:)(Swift::Bool a1)
{
  sub_23B44E1AC(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt);
}

Swift::Void __swiftcall FBKSLaunchConfiguration.setAlwaysLaunchInRemoteAlert(_:)(Swift::Bool a1)
{
  sub_23B44E1AC(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert);
}

Swift::Void __swiftcall FBKSLaunchConfiguration.setNotifyImmediately(_:)(Swift::Bool a1)
{
  sub_23B44E1AC(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately);
}

uint64_t sub_23B44E1AC(char a1, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  char *v4;
  uint64_t result;

  if ((a1 & 1) != 0)
    v3 = 1;
  else
    v3 = 2;
  v4 = (char *)(v2 + *a2);
  result = swift_beginAccess();
  *v4 = v3;
  return result;
}

uint64_t sub_23B44E218(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  char v4;
  char *v5;
  uint64_t result;

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  v5 = (char *)(a1 + *a4);
  result = swift_beginAccess();
  *v5 = v4;
  return result;
}

uint64_t FBKSLaunchConfiguration.asJSON.getter()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  type metadata accessor for FBKSLaunchConfiguration();
  sub_23B44E770(&qword_256A1A980, (uint64_t)&protocol conformance descriptor for FBKSLaunchConfiguration);
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t _s15FeedbackService23FBKSLaunchConfigurationC8fromJSON4dataACSg10Foundation4DataV_tFZ_0()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_23B4833E0();
  MEMORY[0x24BDAC7A8](v0);
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  type metadata accessor for FBKSLaunchConfiguration();
  sub_23B44E770(&qword_256A1A988, (uint64_t)&protocol conformance descriptor for FBKSLaunchConfiguration);
  sub_23B4831E8();
  swift_release();
  return v2;
}

uint64_t sub_23B44E770(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FBKSLaunchConfiguration();
    result = MEMORY[0x23B8651F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B44E7B0(uint64_t a1)
{
  return sub_23B44E7E4(a1, qword_256A1BC80);
}

uint64_t sub_23B44E7CC(uint64_t a1)
{
  return sub_23B44E7E4(a1, qword_256A1BC98);
}

uint64_t sub_23B44E7E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23B4833E0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23B4833D4();
}

void static FBKSAdmin.reportFailureToLaunchForm(formIdentifier:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  if (qword_256A1A4B0 != -1)
    swift_once();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  sub_23B44E9C4(a3);
  v7 = (void *)sub_23B43C960((uint64_t)sub_23B44F844, v6);
  swift_release();
  if (v7)
  {
    v8 = (void *)sub_23B483428();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a3;
    *(_QWORD *)(v9 + 24) = a4;
    v11[4] = sub_23B44E9D8;
    v11[5] = v9;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_23B4499A0;
    v11[3] = &block_descriptor_2;
    v10 = _Block_copy(v11);
    sub_23B44E9C4(a3);
    swift_release();
    objc_msgSend(v7, sel_reportFailureToLaunchFormWithFormIdentifier_completion_, v8, v10);
    swift_unknownObjectRelease();
    _Block_release(v10);

  }
}

uint64_t sub_23B44E9C4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_23B44E9D8(void *a1)
{
  uint64_t v1;

  sub_23B44EF3C(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), 0xD000000000000035, 0x800000023B48DB50);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void static FBKSAdmin.didFinishSubmission(formIdentifier:feedbackId:isSurvey:error:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, id a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];

  if (qword_256A1A4B0 != -1)
    swift_once();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a6;
  *(_QWORD *)(v12 + 24) = a7;
  sub_23B44E9C4(a6);
  v13 = (void *)sub_23B43C960((uint64_t)sub_23B44EBD0, v12);
  swift_release();
  if (v13)
  {
    v14 = (void *)sub_23B483428();
    if (a5)
    {
      v15 = a5;
      a5 = _s15FeedbackService9FBKSErrorV14xpcSafeNSError5errorSo0F0Cs5Error_p_tFZ_0();

    }
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a6;
    *(_QWORD *)(v16 + 24) = a7;
    v18[4] = sub_23B44EBEC;
    v18[5] = v16;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 1107296256;
    v18[2] = sub_23B4499A0;
    v18[3] = &block_descriptor_12;
    v17 = _Block_copy(v18);
    sub_23B44E9C4(a6);
    swift_release();
    objc_msgSend(v13, sel_didFinishSubmissionWithFormIdentifier_feedbackId_isSurvey_error_completion_, v14, a3, a4 & 1, a5, v17);
    swift_unknownObjectRelease();
    _Block_release(v17);

  }
}

void sub_23B44EBD0(void *a1)
{
  uint64_t v1;

  sub_23B44ED64(a1, *(void (**)(void *))(v1 + 16));
}

void sub_23B44EBEC(void *a1)
{
  uint64_t v1;

  sub_23B44EF3C(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), 0xD000000000000049, 0x800000023B48DB00);
}

void static FBKSAdmin.clearCachedUserSession(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  if (qword_256A1A4B0 != -1)
    swift_once();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_23B44E9C4(a1);
  v5 = (void *)sub_23B43C960((uint64_t)sub_23B44F844, v4);
  swift_release();
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    v8[4] = sub_23B44F7B8;
    v8[5] = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_23B4499A0;
    v8[3] = &block_descriptor_21;
    v7 = _Block_copy(v8);
    sub_23B44E9C4(a1);
    swift_release();
    objc_msgSend(v5, sel_clearCachedUserSessionWithCompletion_, v7);
    swift_unknownObjectRelease();
    _Block_release(v7);
  }
}

void sub_23B44ED64(void *a1, void (*a2)(void *))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (qword_256A1A4D8 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC80);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (!os_log_type_enabled(v6, v7))
  {

    if (!a2)
      return;
    goto LABEL_7;
  }
  v8 = (uint8_t *)swift_slowAlloc();
  v9 = swift_slowAlloc();
  v13 = v9;
  *(_DWORD *)v8 = 136315138;
  v10 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
  v11 = sub_23B483470();
  sub_23B44BBC0(v11, v12, &v13);
  sub_23B4835D8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to daemon: %s", v8, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B86528C](v9, -1, -1);
  MEMORY[0x23B86528C](v8, -1, -1);

  if (a2)
LABEL_7:
    a2(a1);
}

void sub_23B44EF3C(void *a1, void (*a2)(void *), uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!a1)
  {
LABEL_6:
    if (!a2)
      return;
    goto LABEL_7;
  }
  v9 = qword_256A1A4D8;
  v10 = a1;
  if (v9 != -1)
    swift_once();
  v11 = sub_23B4833E0();
  __swift_project_value_buffer(v11, (uint64_t)qword_256A1BC80);
  v12 = v10;
  v13 = sub_23B4833C8();
  v14 = sub_23B48359C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v15 = 136446466;
    sub_23B44BBC0(a4, a5, &v22);
    sub_23B4835D8();
    *(_WORD *)(v15 + 12) = 2080;
    v16 = v12;
    v17 = objc_msgSend(v16, sel_description);
    v18 = sub_23B483434();
    v20 = v19;

    sub_23B44BBC0(v18, v20, &v22);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v13, v14, "[%{public}s] failed with: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v21, -1, -1);
    MEMORY[0x23B86528C](v15, -1, -1);

    goto LABEL_6;
  }

  if (!a2)
    return;
LABEL_7:
  a2(a1);
}

uint64_t static FBKSAdmin.resetDaemon()()
{
  uint64_t v0;
  id *v1;
  void *v2;
  void *v3;
  _QWORD v5[6];

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  v1 = (id *)(v0 + 16);
  if (qword_256A1A4B0 != -1)
    swift_once();
  swift_retain();
  v2 = (void *)sub_23B43C984((uint64_t)sub_23B44F80C, v0);
  swift_release();
  if (v2)
  {
    v5[4] = sub_23B44F814;
    v5[5] = v0;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 1107296256;
    v5[2] = sub_23B4499A0;
    v5[3] = &block_descriptor_27_0;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_resetDaemonWithCompletion_, v3);
    swift_unknownObjectRelease();
    _Block_release(v3);
  }
  swift_beginAccess();
  if (*v1)
  {
    *v1;
    swift_willThrow();
  }
  return swift_release();
}

void sub_23B44F2EC(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16[3];

  if (qword_256A1A4D8 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC80);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v15 = a1;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, v16);
    sub_23B4835D8();

    a1 = v15;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

  }
  else
  {

  }
  swift_beginAccess();
  v13 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v14 = v5;

}

void sub_23B44F4D0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void **v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void **v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[3];
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32[3];

  v4 = sub_23B4833E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = qword_256A1A4D8;
    v9 = a1;
    if (v8 != -1)
      swift_once();
    v10 = (void **)(a2 + 16);
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC80);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    v12 = v9;
    v13 = sub_23B4833C8();
    v14 = sub_23B48359C();
    v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      v16 = swift_slowAlloc();
      v28 = v15;
      v17 = v16;
      v29 = swift_slowAlloc();
      v32[0] = v29;
      *(_DWORD *)v17 = 136446466;
      v31 = sub_23B44BBC0(0x6561447465736572, 0xED000029286E6F6DLL, v32);
      v27[2] = v32;
      sub_23B4835D8();
      *(_WORD *)(v17 + 12) = 2080;
      v27[1] = v17 + 14;
      v18 = v12;
      v19 = objc_msgSend(v18, sel_description);
      v20 = v10;
      v21 = sub_23B483434();
      v30 = a1;
      v23 = v22;

      v24 = v21;
      v10 = v20;
      v31 = sub_23B44BBC0(v24, v23, v32);
      sub_23B4835D8();

      a1 = v30;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B433000, v13, (os_log_type_t)v28, "[%{public}s] failed with: %s", (uint8_t *)v17, 0x16u);
      v25 = v29;
      swift_arrayDestroy();
      MEMORY[0x23B86528C](v25, -1, -1);
      MEMORY[0x23B86528C](v17, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_beginAccess();
    v26 = *v10;
    *v10 = a1;

  }
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

void sub_23B44F7B8(void *a1)
{
  uint64_t v1;

  sub_23B44EF3C(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), 0xD000000000000023, 0x800000023B48DAD0);
}

uint64_t sub_23B44F7E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23B44F80C(void *a1)
{
  uint64_t v1;

  sub_23B44F2EC(a1, v1);
}

void sub_23B44F814(void *a1)
{
  uint64_t v1;

  sub_23B44F4D0(a1, v1);
}

ValueMetadata *type metadata accessor for FBKSAdmin()
{
  return &type metadata for FBKSAdmin;
}

uint64_t sub_23B44F848()
{
  return JSONCodable.encode()();
}

uint64_t JSONCodable.encode()()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t sub_23B44F8E8()
{
  return static JSONCodable.decode(from:)();
}

uint64_t static JSONCodable.decode(from:)()
{
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  sub_23B4831E8();
  return swift_release();
}

uint64_t dispatch thunk of JSONCodable.encode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static JSONCodable.decode(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_23B44F9C4()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  sub_23B44FE80();
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t sub_23B44FA64()
{
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  sub_23B44FE3C();
  sub_23B4831E8();
  return swift_release();
}

uint64_t sub_23B44FB00()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  sub_23B44FDFC(&qword_256A1A9A8, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject.RemoteEvaluation);
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t sub_23B44FB94()
{
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  sub_23B44FDFC(&qword_256A1A9A0, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject.RemoteEvaluation);
  sub_23B4831E8();
  return swift_release();
}

uint64_t sub_23B44FC40()
{
  uint64_t v0;

  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  sub_23B44FDB8();
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t sub_23B44FCD8()
{
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  sub_23B44FD74();
  sub_23B4831E8();
  return swift_release();
}

unint64_t sub_23B44FD74()
{
  unint64_t result;

  result = qword_256A1A990;
  if (!qword_256A1A990)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteAlertRequest, &type metadata for FBKSRemoteAlertRequest);
    atomic_store(result, (unint64_t *)&qword_256A1A990);
  }
  return result;
}

unint64_t sub_23B44FDB8()
{
  unint64_t result;

  result = qword_256A1A998;
  if (!qword_256A1A998)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteAlertRequest, &type metadata for FBKSRemoteAlertRequest);
    atomic_store(result, (unint64_t *)&qword_256A1A998);
  }
  return result;
}

uint64_t sub_23B44FDFC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
    result = MEMORY[0x23B8651F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B44FE3C()
{
  unint64_t result;

  result = qword_256A1A9B0;
  if (!qword_256A1A9B0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteEvaluationRequest, &type metadata for FBKSRemoteEvaluationRequest);
    atomic_store(result, (unint64_t *)&qword_256A1A9B0);
  }
  return result;
}

unint64_t sub_23B44FE80()
{
  unint64_t result;

  result = qword_256A1A9B8;
  if (!qword_256A1A9B8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteEvaluationRequest, &type metadata for FBKSRemoteEvaluationRequest);
    atomic_store(result, (unint64_t *)&qword_256A1A9B8);
  }
  return result;
}

uint64_t sub_23B44FEC4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23B44FEF0()
{
  uint64_t v0;

  v0 = sub_23B4833E0();
  __swift_allocate_value_buffer(v0, qword_256A1A9C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A1A9C0);
  return sub_23B4833D4();
}

id sub_23B44FF6C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DaemonConnection()), sel_init);
  qword_256A1A9D8 = (uint64_t)result;
  return result;
}

id static DaemonConnection.shared.getter()
{
  if (qword_256A1A4F0 != -1)
    swift_once();
  return (id)qword_256A1A9D8;
}

id sub_23B450020()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15FeedbackService16DaemonConnection____lazy_storage___xpcConnection;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15FeedbackService16DaemonConnection____lazy_storage___xpcConnection);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC15FeedbackService16DaemonConnection____lazy_storage___xpcConnection);
  }
  else
  {
    swift_getObjectType();
    v4 = sub_23B45008C(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23B45008C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t aBlock;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  void (*v21)();
  uint64_t v22;

  if (qword_256A1A4E8 != -1)
    swift_once();
  v2 = sub_23B4833E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A1A9C0);
  v3 = sub_23B4833C8();
  v4 = sub_23B4835A8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_23B43C788();
    sub_23B44BBC0(v7, v8, &aBlock);
    sub_23B4835D8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v3, v4, "%s: Setting up connection to daemon", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v6, -1, -1);
    MEMORY[0x23B86528C](v5, -1, -1);
  }

  v9 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v10 = (void *)sub_23B483428();
  v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FeedbackDaemonInterface()), sel_init);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  objc_msgSend(v11, sel_setExportedObject_, a1);
  v21 = sub_23B450378;
  v22 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor_3;
  v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  v21 = sub_23B450394;
  v22 = 0;
  aBlock = v13;
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor_3_0;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v11, sel_resume);
  return v11;
}

id FeedbackDaemonInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_23B450378()
{
  sub_23B4503B0(0x800000023B48DC70, "Connection to daemon interrupted from client service");
}

void sub_23B450394()
{
  sub_23B4503B0(0x800000023B48DC30, "Connection to daemon invalidated from client service");
}

void sub_23B4503B0(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23B484E90;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 32) = 0xD000000000000034;
  *(_QWORD *)(v4 + 40) = a1;
  sub_23B48383C();
  swift_bridgeObjectRelease();
  if (qword_256A1A4E8 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1A9C0);
  oslog = sub_23B4833C8();
  v6 = sub_23B4835A8();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B433000, oslog, v6, a2, v7, 2u);
    MEMORY[0x23B86528C](v7, -1, -1);
  }

}

uint64_t sub_23B4504E4(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v9;
  _QWORD aBlock[6];

  v4 = sub_23B450020();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  aBlock[4] = sub_23B450A58;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B450F3C;
  aBlock[3] = &block_descriptor_8_0;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v7 = objc_msgSend(v4, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);

  sub_23B4835FC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A9F8);
  if (swift_dynamicCast())
    return v9;
  else
    return 0;
}

id DaemonConnection.__deallocating_deinit()
{
  return sub_23B43CFBC(type metadata accessor for DaemonConnection);
}

uint64_t type metadata accessor for DaemonConnection()
{
  return objc_opt_self();
}

uint64_t FeedbackDaemonInterface.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for FeedbackDaemonInterface();
  objc_msgSend(objc_msgSendSuper2(&v6, sel_init), sel_setProtocol_, &unk_256A2E2A8);
  sub_23B43CF58(0, &qword_256A1A580);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23B484EA0;
  v2 = sub_23B43CF58(0, &qword_256A1A590);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A598);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_23B43CF58(0, &qword_256A1A5A0);
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5A8);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_23B43CF58(0, &qword_256A1A5B0);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5B8);
  *(_QWORD *)(v1 + 96) = v4;
  MEMORY[0x23B864974](v1);
  result = sub_23B483554();
  __break(1u);
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FeedbackDaemonInterface()
{
  return objc_opt_self();
}

id FeedbackDaemonInterface.__deallocating_deinit()
{
  return sub_23B43CFBC(type metadata accessor for FeedbackDaemonInterface);
}

uint64_t method lookup function for DaemonConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_23B450A34()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23B450A58(uint64_t a1)
{
  uint64_t v1;

  sub_23B43CAD0(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_23B450A70()
{
  uint64_t v0;

  v0 = sub_23B4833E0();
  __swift_allocate_value_buffer(v0, qword_256A1AA00);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A1AA00);
  return sub_23B4833D4();
}

void sub_23B450ADC()
{
  uint64_t v0;
  id v1;
  id v2;

  type metadata accessor for SeedPortal();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 120) = objc_msgSend(objc_allocWithZone((Class)FBKSHTTPClient), sel_init);
  v1 = objc_msgSend(objc_allocWithZone((Class)FBKSHTTPClient), sel_init);
  v2 = objc_msgSend(objc_allocWithZone((Class)FBKSSeedPortalAPI), sel_initClient_, v1);

  *(_QWORD *)(v0 + 112) = v2;
  qword_256A1AA18 = v0;
}

uint64_t static SeedPortal.shared.getter()
{
  if (qword_256A1A500 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_23B450BB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B450BCC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23B450CDC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  type metadata accessor for User();
  *v1 = v0;
  v1[1] = sub_23B450C64;
  return sub_23B4837DC();
}

uint64_t sub_23B450C64()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B450CD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23B450CDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A1AA28[0];
  if (!qword_256A1AA28[0])
  {
    v1 = type metadata accessor for SeedPortal();
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for SeedPortal, v1);
    atomic_store(result, qword_256A1AA28);
  }
  return result;
}

uint64_t type metadata accessor for SeedPortal()
{
  return objc_opt_self();
}

void sub_23B450D40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char *, uint64_t);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  id v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  uint64_t (*v21)(void *);
  uint64_t v22;

  v15 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v16 = *(id *)(a2 + 112);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  v9 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v9(v8 + ((v7 + 24) & ~v7), (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v21 = sub_23B452320;
  v22 = v8;
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23B450F3C;
  v20 = &block_descriptor_35;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v14((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v4);
  v11 = swift_allocObject();
  v9(v11 + ((v7 + 16) & ~v7), (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v21 = (uint64_t (*)(void *))sub_23B452198;
  v22 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23B450F3C;
  v20 = &block_descriptor_41;
  v12 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_seedPortalLoginAsUnauthenticatedUserWithSuccessHandler_error_, v10, v12);
  _Block_release(v12);
  _Block_release(v10);
}

void sub_23B450F34(uint64_t a1)
{
  uint64_t v1;

  sub_23B450D40(a1, v1);
}

void sub_23B450F3C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23B450F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23B450FA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  sub_23B450CDC();
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  type metadata accessor for User();
  *v5 = v0;
  v5[1] = sub_23B451068;
  return sub_23B4837DC();
}

uint64_t sub_23B451068()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B4510DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char *, uint64_t);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t aBlock;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  uint64_t (*v22)(void *);
  uint64_t v23;

  v15 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v17 = *(id *)(a2 + 112);
  v16 = sub_23B483428();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  v9 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v9(v8 + ((v7 + 24) & ~v7), (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v22 = sub_23B452184;
  v23 = v8;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23B450F3C;
  v21 = &block_descriptor_23;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v14((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v4);
  v11 = swift_allocObject();
  v9(v11 + ((v7 + 16) & ~v7), (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v22 = (uint64_t (*)(void *))sub_23B452198;
  v23 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23B450F3C;
  v21 = &block_descriptor_29;
  v12 = _Block_copy(&aBlock);
  swift_release();
  v13 = (void *)v16;
  objc_msgSend(v17, sel_seedPortalLoginWithDeviceToken_success_error_, v16, v10, v12);
  _Block_release(v12);
  _Block_release(v10);

}

void sub_23B4512F0(uint64_t a1)
{
  uint64_t v1;

  sub_23B4510DC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23B4512FC(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  NSObject *v36;
  id v37;
  void *v38;
  NSObject *v39;
  NSObject *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  char v46;

  v43 = a4;
  v44 = a3;
  v6 = type metadata accessor for User();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v42 = (uint64_t)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA90);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v41 - v15;
  v17 = sub_23B483380();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(a1, sel_participantID);
  if (v21)
  {
    v22 = v21;
    v45 = 0;
    v46 = 1;
    sub_23B483560();

    if ((v46 & 1) == 0)
    {
      v23 = v45;
      v24 = objc_msgSend(*(id *)(a2 + 112), sel_seedPortalSession);
      if (v24)
      {
        v25 = v24;
        v41 = v23;
        v26 = objc_msgSend(v24, sel_expiresDate);

        if (v26)
        {
          sub_23B483368();

          v27 = 0;
        }
        else
        {
          v27 = 1;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v14, v27, 1, v17);
        sub_23B4521DC((uint64_t)v14, (uint64_t)v16);
        v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
        v29 = v41;
        if (v28 != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
          sub_23B483374();
          (*(void (**)(char *, char *, uint64_t))(v18 + 16))(&v10[*(int *)(v6 + 28)], v20, v17);
          *(_QWORD *)v10 = v29;
          v10[8] = v43;
          sub_23B452224((uint64_t)v10, v42);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
          sub_23B48353C();
          sub_23B452268((uint64_t)v10);
          return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
      }
      sub_23B45219C((uint64_t)v16);
    }
  }
  if (qword_256A1A4F8 != -1)
    swift_once();
  v30 = sub_23B4833E0();
  __swift_project_value_buffer(v30, (uint64_t)qword_256A1AA00);
  v31 = a1;
  v32 = sub_23B4833C8();
  v33 = sub_23B4835A8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    v45 = v31;
    v36 = v31;
    sub_23B4835D8();
    *v35 = v31;

    _os_log_impl(&dword_23B433000, v32, v33, "No participant id in loginInfo %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA98);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v35, -1, -1);
    MEMORY[0x23B86528C](v34, -1, -1);
  }
  else
  {

    v32 = v31;
  }

  sub_23B483434();
  v37 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v38 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v37, sel_initWithDomain_code_userInfo_, v38, -1001, 0);

  v45 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  return sub_23B483530();
}

uint64_t sub_23B451798(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  return sub_23B483530();
}

uint64_t sub_23B4517DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B4517F4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23B450CDC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23B451880;
  return sub_23B4837B8();
}

uint64_t sub_23B451880()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B4518D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B4518DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA80);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = *(void **)(a2 + 112);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_23B452140;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B44FEC4;
  aBlock[3] = &block_descriptor_17;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_logOutServerSideWithCompletion_, v10);
  _Block_release(v10);
}

void sub_23B451A10(uint64_t a1)
{
  uint64_t v1;

  sub_23B4518DC(a1, v1);
}

uint64_t sub_23B451A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23B451A34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  sub_23B450CDC();
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA48);
  *v5 = v0;
  v5[1] = sub_23B451AF8;
  return sub_23B4837DC();
}

uint64_t sub_23B451AF8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B451B6C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B451BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA70);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = *(void **)(a2 + 112);
  v8 = (void *)sub_23B483428();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_23B4520CC;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B451DF0;
  aBlock[3] = &block_descriptor_4;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_loadFormItemWithFormTat_withCompletion_, v8, v11);
  _Block_release(v11);

}

void sub_23B451CF4(uint64_t a1)
{
  uint64_t v1;

  sub_23B451BA0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23B451D00(uint64_t a1, id a2)
{
  id v2;
  _QWORD v5[4];
  _OWORD v6[6];

  if (a2)
  {
    *(_QWORD *)&v6[0] = a2;
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA70);
    return sub_23B483530();
  }
  else
  {
    if (a1)
    {
      v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA78);
      v5[0] = a1;
      swift_bridgeObjectRetain();
      sub_23B44D0FC(v5, (uint64_t)v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
      *((_QWORD *)&v6[0] + 1) = BYTE8(v6[0]);
    }
    else
    {
      memset(v6, 0, sizeof(v6));
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA70);
    return sub_23B48353C();
  }
}

uint64_t sub_23B451DF0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_23B483410();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t SeedPortal.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t SeedPortal.__deallocating_deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t SeedPortal.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B451EE8()
{
  uint64_t v0;

  return v0;
}

uint64_t method lookup function for SeedPortal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SeedPortal.unauthenticatedLogin()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B44CEA4;
  return v6(a1);
}

uint64_t dispatch thunk of SeedPortal.loginWithDeviceToken(token:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 128)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 128));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23B44CEA4;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of SeedPortal.logOutServerSide()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 136) + *(_QWORD *)(*(_QWORD *)v0 + 136));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B447194;
  return v4();
}

uint64_t dispatch thunk of SeedPortal.fetchFormItem(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 144)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 144));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23B447194;
  return v10(a1, a2, a3);
}

uint64_t sub_23B4520C0()
{
  return objectdestroy_29Tm(&qword_256A1AA70);
}

uint64_t sub_23B4520CC(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA70);
  return sub_23B451D00(a1, a2);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_23B452134()
{
  return objectdestroy_29Tm(&qword_256A1AA80);
}

uint64_t sub_23B452140()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA80);
  return sub_23B48353C();
}

uint64_t sub_23B452184(void *a1)
{
  return sub_23B452328(a1, 0);
}

uint64_t sub_23B45218C()
{
  return objectdestroy_29Tm(&qword_256A1AA88);
}

uint64_t sub_23B45219C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B4521DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B452224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for User();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B452268(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for User();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroy_19Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B452320(void *a1)
{
  return sub_23B452328(a1, 1);
}

uint64_t sub_23B452328(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88) - 8) + 80);
  return sub_23B4512FC(a1, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5), a2);
}

uint64_t sub_23B452380()
{
  return objectdestroy_29Tm(&qword_256A1AA88);
}

uint64_t sub_23B45238C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA88);
  return sub_23B451798(a1);
}

unint64_t static Strings.FeedbackServiceBundleIdentifier.getter()
{
  return 0xD000000000000019;
}

unint64_t static Strings.errorDomain.getter()
{
  return 0xD000000000000019;
}

unint64_t static Strings.fbaBundleIdentifier.getter()
{
  return 0xD000000000000025;
}

unint64_t static Strings.fbaGroupIdentifier.getter()
{
  return 0xD000000000000018;
}

unint64_t static Strings.feedbackInternalBundleIdentifier.getter()
{
  return 0xD00000000000001ALL;
}

void sub_23B452488()
{
  qword_2542F8280 = 0x6B63616264656566;
  unk_2542F8288 = 0xE900000000000064;
}

uint64_t static Strings.Daemon.processName.getter()
{
  return sub_23B4526F8(&qword_2542F8248, &qword_2542F8280);
}

unint64_t static Strings.Daemon.bundleIdentifier.getter()
{
  return 0xD000000000000013;
}

unint64_t static Strings.Daemon.loggingSubsystem.getter()
{
  return 0xD000000000000013;
}

unint64_t static Strings.Daemon.errorDomain.getter()
{
  return 0xD000000000000013;
}

unint64_t static Strings.Daemon.XPCActivityIdentifier.getter()
{
  return 0xD000000000000029;
}

unint64_t static Strings.Daemon.configurationUserDefaultsDomain.getter()
{
  return 0xD000000000000021;
}

unint64_t static Strings.Daemon.directoryName.getter()
{
  return 0xD000000000000013;
}

unint64_t static Strings.Daemon.CheckDonationsTaskIdentifier.getter()
{
  return 0xD000000000000023;
}

unint64_t static Strings.XPC.clientEntitlement.getter()
{
  return 0xD000000000000020;
}

unint64_t static Strings.XPC.adminEntitlement.getter()
{
  return 0xD000000000000019;
}

unint64_t static Strings.XPC.machService.getter()
{
  return 0xD000000000000017;
}

unint64_t static Strings.XPC.CentralizedFeedback.draftingEntitlement.getter()
{
  return 0xD000000000000023;
}

unint64_t static Strings.XPC.CentralizedFeedback.entitlement.getter()
{
  return 0xD00000000000002FLL;
}

unint64_t static Strings.XPC.CentralizedFeedback.remoteEvaluationEntitlement.getter()
{
  return 0xD000000000000025;
}

unint64_t static Strings.XPC.CentralizedFeedback.machService.getter()
{
  return 0xD000000000000028;
}

unint64_t static Strings.Notification.categoryIdentifier.getter()
{
  return 0xD000000000000020;
}

void sub_23B452674()
{
  qword_2542F8258 = 0x657A6F6F6E73;
  unk_2542F8260 = 0xE600000000000000;
}

uint64_t static Strings.Notification.snoozeActionIdentifier.getter()
{
  return sub_23B4526F8(&qword_2542F8250, &qword_2542F8258);
}

void sub_23B4526B4()
{
  qword_2542F8268 = 0x656E696C636564;
  unk_2542F8270 = 0xE700000000000000;
}

uint64_t static Strings.Notification.declineActionIdentifier.getter()
{
  return sub_23B4526F8(&qword_2542F8278, &qword_2542F8268);
}

uint64_t sub_23B4526F8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static Strings.Notification.cfbCategoryIdentifier.getter()
{
  return 0xD000000000000022;
}

unint64_t static FBKSStrings.FeedbackServiceBundleIdentifier.getter()
{
  return 0xD000000000000019;
}

id FBKSStrings.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FBKSStrings.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSStrings();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for FBKSStrings()
{
  return objc_opt_self();
}

id FBKSStrings.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSStrings();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

ValueMetadata *type metadata accessor for Strings()
{
  return &type metadata for Strings;
}

ValueMetadata *type metadata accessor for Strings.Daemon()
{
  return &type metadata for Strings.Daemon;
}

ValueMetadata *type metadata accessor for Strings.XPC()
{
  return &type metadata for Strings.XPC;
}

ValueMetadata *type metadata accessor for Strings.XPC.CentralizedFeedback()
{
  return &type metadata for Strings.XPC.CentralizedFeedback;
}

ValueMetadata *type metadata accessor for Strings.Notification()
{
  return &type metadata for Strings.Notification;
}

uint64_t FBKSFeedbackCount.asJSON.getter()
{
  uint64_t v0;

  swift_getObjectType();
  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  sub_23B452DDC(&qword_256A1AAA0, (uint64_t)&protocol conformance descriptor for FBKSFeedbackCount);
  v0 = sub_23B483230();
  swift_release();
  return v0;
}

uint64_t _s15FeedbackService17FBKSFeedbackCountC8fromJSON4dataACSg10Foundation4DataV_tFZ_0()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_23B4833E0();
  MEMORY[0x24BDAC7A8](v0);
  sub_23B483200();
  swift_allocObject();
  sub_23B4831F4();
  type metadata accessor for FBKSFeedbackCount();
  sub_23B452DDC(&qword_256A1AAA8, (uint64_t)&protocol conformance descriptor for FBKSFeedbackCount);
  sub_23B4831E8();
  swift_release();
  return v2;
}

uint64_t sub_23B452DDC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FBKSFeedbackCount();
    result = MEMORY[0x23B8651F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void FBKSRemoteEvaluationRequest.action.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

id FBKSRemoteEvaluationRequest.interaction.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t FBKSRemoteEvaluationRequest.showFeedbackForm.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

_BYTE *FBKSRemoteEvaluationRequest.init(action:interaction:showFeedbackForm:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_BYTE *)a4 = *result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_23B452E4C(char a1)
{
  if (!a1)
    return 0x6E6F69746361;
  if (a1 == 1)
    return 0x7463617265746E69;
  return 0xD000000000000010;
}

uint64_t sub_23B452EAC()
{
  char *v0;

  return sub_23B452E4C(*v0);
}

uint64_t sub_23B452EB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B454EBC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B452ED8()
{
  sub_23B4530CC();
  return sub_23B48389C();
}

uint64_t sub_23B452F00()
{
  sub_23B4530CC();
  return sub_23B4838A8();
}

uint64_t FBKSRemoteEvaluationRequest.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  _QWORD v10[2];
  int v11;
  char v12;
  char v13;
  char v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAB0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10[0] = *((_QWORD *)v1 + 1);
  v11 = v1[16];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4530CC();
  sub_23B483890();
  v15 = v8;
  v14 = 0;
  sub_23B446E74();
  sub_23B4837A0();
  if (!v2)
  {
    v10[1] = v10[0];
    v13 = 1;
    type metadata accessor for FBKSInteraction();
    sub_23B44646C(&qword_256A1A6A0, (uint64_t (*)(uint64_t))type metadata accessor for FBKSInteraction, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    sub_23B4837A0();
    v12 = 2;
    sub_23B48377C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23B4530CC()
{
  unint64_t result;

  result = qword_256A1AAB8;
  if (!qword_256A1AAB8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4867DC, &type metadata for FBKSRemoteEvaluationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AAB8);
  }
  return result;
}

void FBKSRemoteEvaluationRequest.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  id v10;
  char v11;
  id v12[2];
  char v13;
  char v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4530CC();
  sub_23B483884();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v15 = 0;
    sub_23B446EFC();
    sub_23B483728();
    v9 = v16;
    type metadata accessor for FBKSInteraction();
    v14 = 1;
    sub_23B44646C(&qword_256A1A6D8, (uint64_t (*)(uint64_t))type metadata accessor for FBKSInteraction, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    sub_23B483728();
    v13 = 2;
    v10 = v12[1];
    v11 = sub_23B483704();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 16) = v11 & 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

  }
}

void sub_23B4532FC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  FBKSRemoteEvaluationRequest.init(from:)(a1, a2);
}

uint64_t sub_23B453310(_QWORD *a1)
{
  return FBKSRemoteEvaluationRequest.encode(to:)(a1);
}

uint64_t static FBKSRemoteEvaluationError.== infix(_:_:)()
{
  return 1;
}

uint64_t FBKSRemoteEvaluationError.hash(into:)()
{
  return sub_23B483854();
}

uint64_t sub_23B453354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B455004(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23B45337C()
{
  sub_23B453590();
  return sub_23B48389C();
}

uint64_t sub_23B4533A4()
{
  sub_23B453590();
  return sub_23B4838A8();
}

uint64_t sub_23B4533CC()
{
  return 0;
}

uint64_t sub_23B4533D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23B453404()
{
  sub_23B4535D4();
  return sub_23B48389C();
}

uint64_t sub_23B45342C()
{
  sub_23B4535D4();
  return sub_23B4838A8();
}

uint64_t FBKSRemoteEvaluationError.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAD0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B453590();
  sub_23B483890();
  sub_23B4535D4();
  sub_23B483740();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_23B453590()
{
  unint64_t result;

  result = qword_256A1AAD8;
  if (!qword_256A1AAD8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48678C, &type metadata for FBKSRemoteEvaluationError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AAD8);
  }
  return result;
}

unint64_t sub_23B4535D4()
{
  unint64_t result;

  result = qword_256A1AAE0;
  if (!qword_256A1AAE0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48673C, &type metadata for FBKSRemoteEvaluationError.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AAE0);
  }
  return result;
}

uint64_t FBKSRemoteEvaluationError.hashValue.getter()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t FBKSRemoteEvaluationError.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAE8);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAF0);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B453590();
  v8 = v23;
  sub_23B483884();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23B483734() + 16) != 1)
  {
    v14 = sub_23B483644();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v16 = &type metadata for FBKSRemoteEvaluationError;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v13);
  }
  sub_23B4535D4();
  v11 = v4;
  sub_23B4836BC();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_0(v13);
}

uint64_t sub_23B4538B4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

uint64_t sub_23B4538E4(_QWORD *a1)
{
  return FBKSRemoteEvaluationError.init(from:)(a1);
}

uint64_t sub_23B4538F8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAD0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B453590();
  sub_23B483890();
  sub_23B4535D4();
  sub_23B483740();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_23B453A34()
{
  char *v0;

  return sub_23B4538B4(*v0);
}

uint64_t sub_23B453A3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B455094(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B453A60()
{
  sub_23B453DD4();
  return sub_23B48389C();
}

uint64_t sub_23B453A88()
{
  sub_23B453DD4();
  return sub_23B4838A8();
}

uint64_t sub_23B453AB0()
{
  sub_23B453E18();
  return sub_23B48389C();
}

uint64_t sub_23B453AD8()
{
  sub_23B453E18();
  return sub_23B4838A8();
}

uint64_t sub_23B453B00()
{
  sub_23B453EA0();
  return sub_23B48389C();
}

uint64_t sub_23B453B28()
{
  sub_23B453EA0();
  return sub_23B4838A8();
}

void FBKSRemoteEvaluationResponse.encode(to:)(_QWORD *a1)
{
  void **v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AAF8);
  v18 = *(_QWORD *)(v3 - 8);
  v19 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AB00);
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AB08);
  v21 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (unint64_t)*v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B453DD4();
  sub_23B483890();
  if ((v12 & 0x8000000000000000) != 0)
  {
    v25 = 1;
    sub_23B453E18();
    v15 = v22;
    sub_23B483740();
    sub_23B453E5C();
    v16 = v19;
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v16);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v15);
  }
  else
  {
    v24 = 0;
    sub_23B453EA0();
    v13 = (id)v12;
    v14 = v22;
    sub_23B483740();
    v23 = v13;
    type metadata accessor for FBKSEvaluation(0);
    sub_23B44646C(&qword_256A1A760, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v14);
    sub_23B453EE4((id)v12);
  }
}

unint64_t sub_23B453DD4()
{
  unint64_t result;

  result = qword_256A1AB10;
  if (!qword_256A1AB10)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4866EC, &type metadata for FBKSRemoteEvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB10);
  }
  return result;
}

unint64_t sub_23B453E18()
{
  unint64_t result;

  result = qword_256A1AB18;
  if (!qword_256A1AB18)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48669C, &type metadata for FBKSRemoteEvaluationResponse.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB18);
  }
  return result;
}

unint64_t sub_23B453E5C()
{
  unint64_t result;

  result = qword_256A1AB20;
  if (!qword_256A1AB20)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteEvaluationError, &type metadata for FBKSRemoteEvaluationError);
    atomic_store(result, (unint64_t *)&qword_256A1AB20);
  }
  return result;
}

unint64_t sub_23B453EA0()
{
  unint64_t result;

  result = qword_256A1AB28;
  if (!qword_256A1AB28)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48664C, &type metadata for FBKSRemoteEvaluationResponse.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB28);
  }
  return result;
}

void sub_23B453EE4(id a1)
{
  if (((unint64_t)a1 & 0x8000000000000000) == 0)

}

uint64_t FBKSRemoteEvaluationResponse.init(from:)@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;

  v29 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AB30);
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AB38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AB40);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23B453DD4();
  v14 = v34;
  sub_23B483884();
  if (v14)
    goto LABEL_7;
  v27 = v5;
  v28 = v6;
  v15 = v30;
  v16 = v31;
  v17 = v32;
  v34 = v10;
  v18 = sub_23B483734();
  if (*(_QWORD *)(v18 + 16) != 1)
  {
    v21 = sub_23B483644();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v23 = &type metadata for FBKSRemoteEvaluationResponse;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v9);
LABEL_7:
    v19 = (uint64_t)v33;
    return __swift_destroy_boxed_opaque_existential_0(v19);
  }
  if ((*(_BYTE *)(v18 + 32) & 1) != 0)
  {
    v37 = 1;
    sub_23B453E18();
    sub_23B4836BC();
    sub_23B4542C8();
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v15, v17);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v9);
    v19 = (uint64_t)v33;
    v20 = 0x8000000000000000;
  }
  else
  {
    v36 = 0;
    sub_23B453EA0();
    sub_23B4836BC();
    type metadata accessor for FBKSEvaluation(0);
    sub_23B44646C(&qword_256A1A8A0, type metadata accessor for FBKSEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation);
    v25 = v27;
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v9);
    v20 = v35;
    v19 = (uint64_t)v33;
  }
  *v29 = v20;
  return __swift_destroy_boxed_opaque_existential_0(v19);
}

unint64_t sub_23B4542C8()
{
  unint64_t result;

  result = qword_256A1AB48;
  if (!qword_256A1AB48)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteEvaluationError, &type metadata for FBKSRemoteEvaluationError);
    atomic_store(result, (unint64_t *)&qword_256A1AB48);
  }
  return result;
}

uint64_t sub_23B45430C@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  return FBKSRemoteEvaluationResponse.init(from:)(a1, a2);
}

void sub_23B454320(_QWORD *a1)
{
  FBKSRemoteEvaluationResponse.encode(to:)(a1);
}

uint64_t FBKSRemoteEvaluationClient.remoteEvaluate(interaction:action:showFeedbackForm:)()
{
  return swift_task_switch();
}

uint64_t sub_23B454348()
{
  sub_23B483608();
  swift_bridgeObjectRelease();
  return sub_23B483668();
}

unint64_t sub_23B4543D0(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_23B44FE3C();
  result = sub_23B44FE80();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_23B454400()
{
  unint64_t result;

  result = qword_256A1AB58;
  if (!qword_256A1AB58)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSRemoteEvaluationError, &type metadata for FBKSRemoteEvaluationError);
    atomic_store(result, (unint64_t *)&qword_256A1AB58);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FBKSRemoteEvaluationRequest(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = v3;
  return a1;
}

void destroy for FBKSRemoteEvaluationRequest(uint64_t a1)
{

}

uint64_t assignWithCopy for FBKSRemoteEvaluationRequest(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FBKSRemoteEvaluationRequest(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSRemoteEvaluationRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteEvaluationRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationRequest()
{
  return &type metadata for FBKSRemoteEvaluationRequest;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationError()
{
  return &type metadata for FBKSRemoteEvaluationError;
}

_QWORD *initializeBufferWithCopyOfBuffer for FBKSRemoteEvaluationResponse(_QWORD *a1, id *a2)
{
  id v3;

  v3 = *a2;
  sub_23B45460C(*a2);
  *a1 = v3;
  return a1;
}

id sub_23B45460C(id result)
{
  if (((unint64_t)result & 0x8000000000000000) == 0)
    return result;
  return result;
}

void destroy for FBKSRemoteEvaluationResponse(id *a1)
{
  sub_23B453EE4(*a1);
}

void **assignWithCopy for FBKSRemoteEvaluationResponse(void **a1, id *a2)
{
  id v3;
  void *v4;

  v3 = *a2;
  sub_23B45460C(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_23B453EE4(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for FBKSRemoteEvaluationResponse(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;
  sub_23B453EE4(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSRemoteEvaluationResponse(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 127);
  v3 = (((*(_QWORD *)a1 >> 57) >> 6) | (2 * ((*(_QWORD *)a1 >> 57) & 0x38 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteEvaluationResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7E)
  {
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_23B454740(_QWORD *a1)
{
  return *a1 >> 63;
}

_QWORD *sub_23B45474C(_QWORD *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_23B45475C(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationResponse()
{
  return &type metadata for FBKSRemoteEvaluationResponse;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationClient()
{
  return &type metadata for FBKSRemoteEvaluationClient;
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteEvaluationResponse.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B4547DC + 4 * byte_23B485F85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B454810 + 4 * byte_23B485F80[v4]))();
}

uint64_t sub_23B454810(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B454818(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B454820);
  return result;
}

uint64_t sub_23B45482C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B454834);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B454838(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B454840(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationResponse.CodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationResponse.SuccessCodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationResponse.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationResponse.FailureCodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationResponse.FailureCodingKeys;
}

uint64_t _s15FeedbackService25FBKSRemoteEvaluationErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B4548BC + 4 * byte_23B485F8A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B4548DC + 4 * byte_23B485F8F[v4]))();
}

_BYTE *sub_23B4548BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B4548DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B4548E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B4548EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B4548F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B4548FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationError.CodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationError.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationError.ErrorCodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationError.ErrorCodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteEvaluationRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B454974 + 4 * byte_23B485F99[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B4549A8 + 4 * byte_23B485F94[v4]))();
}

uint64_t sub_23B4549A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4549B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4549B8);
  return result;
}

uint64_t sub_23B4549C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B4549CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B4549D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4549D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteEvaluationRequest.CodingKeys()
{
  return &type metadata for FBKSRemoteEvaluationRequest.CodingKeys;
}

unint64_t sub_23B4549F8()
{
  unint64_t result;

  result = qword_256A1AB60;
  if (!qword_256A1AB60)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4862F4, &type metadata for FBKSRemoteEvaluationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB60);
  }
  return result;
}

unint64_t sub_23B454A40()
{
  unint64_t result;

  result = qword_256A1AB68;
  if (!qword_256A1AB68)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4863FC, &type metadata for FBKSRemoteEvaluationError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB68);
  }
  return result;
}

unint64_t sub_23B454A88()
{
  unint64_t result;

  result = qword_256A1AB70;
  if (!qword_256A1AB70)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4864B4, &type metadata for FBKSRemoteEvaluationResponse.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB70);
  }
  return result;
}

unint64_t sub_23B454AD0()
{
  unint64_t result;

  result = qword_256A1AB78;
  if (!qword_256A1AB78)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48656C, &type metadata for FBKSRemoteEvaluationResponse.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB78);
  }
  return result;
}

unint64_t sub_23B454B18()
{
  unint64_t result;

  result = qword_256A1AB80;
  if (!qword_256A1AB80)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486624, &type metadata for FBKSRemoteEvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB80);
  }
  return result;
}

unint64_t sub_23B454B60()
{
  unint64_t result;

  result = qword_256A1AB88;
  if (!qword_256A1AB88)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4864DC, &type metadata for FBKSRemoteEvaluationResponse.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB88);
  }
  return result;
}

unint64_t sub_23B454BA8()
{
  unint64_t result;

  result = qword_256A1AB90;
  if (!qword_256A1AB90)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486504, &type metadata for FBKSRemoteEvaluationResponse.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB90);
  }
  return result;
}

unint64_t sub_23B454BF0()
{
  unint64_t result;

  result = qword_256A1AB98;
  if (!qword_256A1AB98)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486424, &type metadata for FBKSRemoteEvaluationResponse.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AB98);
  }
  return result;
}

unint64_t sub_23B454C38()
{
  unint64_t result;

  result = qword_256A1ABA0;
  if (!qword_256A1ABA0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48644C, &type metadata for FBKSRemoteEvaluationResponse.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABA0);
  }
  return result;
}

unint64_t sub_23B454C80()
{
  unint64_t result;

  result = qword_256A1ABA8;
  if (!qword_256A1ABA8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486594, &type metadata for FBKSRemoteEvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABA8);
  }
  return result;
}

unint64_t sub_23B454CC8()
{
  unint64_t result;

  result = qword_256A1ABB0;
  if (!qword_256A1ABB0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4865BC, &type metadata for FBKSRemoteEvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABB0);
  }
  return result;
}

unint64_t sub_23B454D10()
{
  unint64_t result;

  result = qword_256A1ABB8;
  if (!qword_256A1ABB8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48631C, &type metadata for FBKSRemoteEvaluationError.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABB8);
  }
  return result;
}

unint64_t sub_23B454D58()
{
  unint64_t result;

  result = qword_256A1ABC0;
  if (!qword_256A1ABC0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486344, &type metadata for FBKSRemoteEvaluationError.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABC0);
  }
  return result;
}

unint64_t sub_23B454DA0()
{
  unint64_t result;

  result = qword_256A1ABC8;
  if (!qword_256A1ABC8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48636C, &type metadata for FBKSRemoteEvaluationError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABC8);
  }
  return result;
}

unint64_t sub_23B454DE8()
{
  unint64_t result;

  result = qword_256A1ABD0;
  if (!qword_256A1ABD0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486394, &type metadata for FBKSRemoteEvaluationError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABD0);
  }
  return result;
}

unint64_t sub_23B454E30()
{
  unint64_t result;

  result = qword_256A1ABD8;
  if (!qword_256A1ABD8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486264, &type metadata for FBKSRemoteEvaluationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABD8);
  }
  return result;
}

unint64_t sub_23B454E78()
{
  unint64_t result;

  result = qword_256A1ABE0;
  if (!qword_256A1ABE0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48628C, &type metadata for FBKSRemoteEvaluationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1ABE0);
  }
  return result;
}

uint64_t sub_23B454EBC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617265746E69 && a2 == 0xEB000000006E6F69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E170)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23B455004(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23B455080()
{
  return 0x726F727265;
}

uint64_t sub_23B455094(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t FBKSPromptStyle.init(rawValue:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

BOOL sub_23B4551AC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B4551C0()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

uint64_t sub_23B455204()
{
  return sub_23B483854();
}

uint64_t sub_23B45522C()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

_QWORD *sub_23B45526C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  if (*result == 2)
    v2 = 2;
  else
    v2 = *result == 1;
  v3 = *result != 2 && *result != 1;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_23B45529C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23B4552A8()
{
  sub_23B457248();
  return sub_23B4834D0();
}

uint64_t sub_23B455304()
{
  sub_23B457248();
  return sub_23B4834B8();
}

uint64_t sub_23B455394()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23B455420(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B455468())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23B4554B8()
{
  return sub_23B455694(&OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

uint64_t sub_23B4554D0(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

uint64_t (*sub_23B4554DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45552C()
{
  return sub_23B455694(&OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

uint64_t sub_23B455544(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

uint64_t (*sub_23B455550())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B4555A0()
{
  return sub_23B455694(&OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

uint64_t sub_23B4555B8(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

uint64_t (*sub_23B4555C4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_23B455614(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + *a3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3 + 8))
    return 0;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23B455688()
{
  return sub_23B455694(&OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

uint64_t sub_23B455694(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_23B4556F0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (a3)
  {
    v6 = sub_23B483434();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B455768(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

uint64_t sub_23B455774(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B4557CC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23B455830())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B455874(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B4558B0 + 4 * byte_23B486830[a1]))(0xD000000000000014, 0x800000023B48CD10);
}

uint64_t sub_23B4558B0()
{
  return 0x745374706D6F7270;
}

uint64_t sub_23B4558D0()
{
  uint64_t v0;

  return v0 - 14;
}

uint64_t sub_23B455950(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B45598C + 4 * byte_23B486838[a1]))(0xD000000000000014, 0x800000023B48CD10);
}

uint64_t sub_23B45598C()
{
  return 0x745374706D6F7270;
}

uint64_t sub_23B4559AC()
{
  uint64_t v0;

  return v0 - 14;
}

void sub_23B455A2C(char *a1)
{
  sub_23B473488(*a1);
}

void sub_23B455A38()
{
  char *v0;

  sub_23B4730C4(0, *v0);
}

void sub_23B455A44(uint64_t a1)
{
  char *v1;

  sub_23B472F24(a1, *v1);
}

void sub_23B455A4C(uint64_t a1)
{
  char *v1;

  sub_23B4730C4(a1, *v1);
}

uint64_t sub_23B455A54@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B457200();
  *a1 = result;
  return result;
}

uint64_t sub_23B455A80@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23B455874(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B455AA8()
{
  unsigned __int8 *v0;

  return sub_23B455950(*v0);
}

uint64_t sub_23B455AB0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B457200();
  *a1 = result;
  return result;
}

void sub_23B455AD4(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23B455AE0()
{
  sub_23B4562E4();
  return sub_23B48389C();
}

uint64_t sub_23B455B08()
{
  sub_23B4562E4();
  return sub_23B4838A8();
}

uint64_t sub_23B455B30()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B455B74(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B455BBC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B455C00()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B455C44(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B455C8C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B455CD0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B455D14(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B455D5C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id FBKSLaunchConfiguration.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FBKSLaunchConfiguration.init()()
{
  _BYTE *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle] = 2;
  v1 = &v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle];
  *v1 = 0;
  v1[1] = 0;
  v2 = &v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage];
  *v2 = 0;
  v2[1] = 0;
  v3 = &v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle];
  *v3 = 0;
  v3[1] = 0;
  v4 = &v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle];
  *v4 = 0;
  v4[1] = 0;
  v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt] = 2;
  v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert] = 2;
  v0[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately] = 2;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for FBKSLaunchConfiguration();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for FBKSLaunchConfiguration()
{
  return objc_opt_self();
}

id FBKSLaunchConfiguration.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSLaunchConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B455F3C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t *v9;
  _BYTE v11[120];
  char v12;
  uint64_t v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AC28);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4562E4();
  sub_23B483890();
  v9 = (uint64_t *)(v3 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  swift_beginAccess();
  v13 = *v9;
  v12 = 0;
  sub_23B456328();
  sub_23B4837A0();
  if (!v2)
  {
    swift_beginAccess();
    v12 = 1;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11[96] = 2;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11[72] = 3;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11[48] = 4;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11[24] = 5;
    sub_23B483758();
    swift_beginAccess();
    v11[0] = 6;
    sub_23B483758();
    swift_beginAccess();
    v14 = 7;
    sub_23B483758();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23B4562E4()
{
  unint64_t result;

  result = qword_256A1AC30;
  if (!qword_256A1AC30)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486AD4, &type metadata for FBKSLaunchConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AC30);
  }
  return result;
}

unint64_t sub_23B456328()
{
  unint64_t result;

  result = qword_256A1AC38;
  if (!qword_256A1AC38)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSPromptStyle, &type metadata for FBKSPromptStyle);
    atomic_store(result, (unint64_t *)&qword_256A1AC38);
  }
  return result;
}

id FBKSLaunchConfiguration.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSLaunchConfiguration.init(from:)(a1);
}

id FBKSLaunchConfiguration.init(from:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _BYTE *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  _BYTE *v39;
  char v40;
  void *v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  objc_class *v45;
  uint64_t v46;
  _BYTE *v47;
  _BYTE *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  _BYTE *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  _BYTE *v58;
  objc_super v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t *v68;

  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AC40);
  v51 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = &v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle];
  *(_QWORD *)&v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle] = 2;
  v5 = (uint64_t *)&v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle];
  *v5 = 0;
  v5[1] = 0;
  v57 = v5;
  v6 = (uint64_t *)&v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage];
  *v6 = 0;
  v6[1] = 0;
  v56 = v6;
  v7 = (uint64_t *)&v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle];
  *v7 = 0;
  v7[1] = 0;
  v55 = v7;
  v8 = (uint64_t *)&v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle];
  *v8 = 0;
  v8[1] = 0;
  v68 = v8;
  v9 = &v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt];
  v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt] = 2;
  v10 = &v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert];
  v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert] = 2;
  v11 = &v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately];
  v1[OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately] = 2;
  v12 = a1[3];
  v53 = a1;
  v13 = __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23B4562E4();
  v54 = v1;
  v52 = v4;
  v14 = v13;
  v15 = v58;
  sub_23B483884();
  if (v15)
  {
    v18 = v54;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for FBKSLaunchConfiguration();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v16 = v49;
    v58 = v9;
    v48 = v10;
    v47 = v11;
    v67 = 0;
    sub_23B456968();
    v17 = v50;
    sub_23B483728();
    v20 = v66;
    swift_beginAccess();
    *v16 = v20;
    LOBYTE(v66) = 1;
    v21 = sub_23B4836D4();
    v22 = v57;
    v23 = v56;
    v24 = v21;
    v26 = v25;
    swift_beginAccess();
    *v22 = v24;
    v22[1] = v26;
    swift_bridgeObjectRelease();
    v65 = 2;
    v27 = sub_23B4836D4();
    v28 = v55;
    v29 = v27;
    v31 = v30;
    swift_beginAccess();
    *v23 = v29;
    v23[1] = v31;
    swift_bridgeObjectRelease();
    v64 = 3;
    v32 = sub_23B4836D4();
    v34 = v33;
    swift_beginAccess();
    *v28 = v32;
    v28[1] = v34;
    swift_bridgeObjectRelease();
    v63 = 4;
    v35 = sub_23B4836D4();
    v37 = v36;
    v38 = v68;
    swift_beginAccess();
    *v38 = v35;
    v38[1] = v37;
    swift_bridgeObjectRelease();
    v62 = 5;
    LOBYTE(v38) = sub_23B4836E0();
    v39 = v58;
    swift_beginAccess();
    *v39 = (_BYTE)v38;
    v61 = 6;
    v40 = sub_23B4836E0();
    v41 = v54;
    v42 = (uint64_t)v53;
    LOBYTE(v20) = v40;
    v43 = v48;
    swift_beginAccess();
    *v43 = v20;
    v60 = 7;
    LOBYTE(v20) = sub_23B4836E0();
    v44 = v47;
    swift_beginAccess();
    *v44 = v20;

    v45 = (objc_class *)type metadata accessor for FBKSLaunchConfiguration();
    v59.receiver = v41;
    v59.super_class = v45;
    v14 = objc_msgSendSuper2(&v59, sel_init);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v17);
    __swift_destroy_boxed_opaque_existential_0(v42);
  }
  return v14;
}

unint64_t sub_23B456968()
{
  unint64_t result;

  result = qword_256A1AC48;
  if (!qword_256A1AC48)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSPromptStyle, &type metadata for FBKSPromptStyle);
    atomic_store(result, (unint64_t *)&qword_256A1AC48);
  }
  return result;
}

unint64_t sub_23B4569B0()
{
  unint64_t result;

  result = qword_256A1AC50;
  if (!qword_256A1AC50)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSPromptStyle, &type metadata for FBKSPromptStyle);
    atomic_store(result, (unint64_t *)&qword_256A1AC50);
  }
  return result;
}

id sub_23B4569F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for FBKSLaunchConfiguration());
  result = FBKSLaunchConfiguration.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23B456A44(_QWORD *a1)
{
  return sub_23B455F3C(a1);
}

uint64_t sub_23B456A64@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23B456AB4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23B456B00@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle, a2);
}

uint64_t sub_23B456B0C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

uint64_t sub_23B456B28@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage, a2);
}

uint64_t sub_23B456B34(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

uint64_t sub_23B456B50@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle, a2);
}

uint64_t sub_23B456B5C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

uint64_t sub_23B456B78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle, a2);
}

uint64_t keypath_get_1Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B456BD4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

uint64_t sub_23B456BF0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt, a2);
}

uint64_t sub_23B456BFC(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt);
}

uint64_t sub_23B456C08@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert, a2);
}

uint64_t sub_23B456C14(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert);
}

uint64_t sub_23B456C20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately, a2);
}

uint64_t keypath_get_9Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_23B456C78(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately);
}

uint64_t keypath_set_10Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

ValueMetadata *type metadata accessor for FBKSPromptStyle()
{
  return &type metadata for FBKSPromptStyle;
}

uint64_t method lookup function for FBKSLaunchConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.promptStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.promptStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.promptStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptMessage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptMessage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedPromptMessage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewProceedButtonTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewProceedButtonTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewProceedButtonTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewDeclineButtonTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewDeclineButtonTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.localizedAlertViewDeclineButtonTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.skipsPrompt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.skipsPrompt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.skipsPrompt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.alwaysLaunchInRemoteAlert.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.alwaysLaunchInRemoteAlert.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.alwaysLaunchInRemoteAlert.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.notifyImmediately.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.notifyImmediately.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.notifyImmediately.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of FBKSLaunchConfiguration.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t getEnumTagSinglePayload for FBKSLaunchConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSLaunchConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23B4570A8 + 4 * byte_23B486845[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23B4570DC + 4 * byte_23B486840[v4]))();
}

uint64_t sub_23B4570DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4570E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4570ECLL);
  return result;
}

uint64_t sub_23B4570F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B457100);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23B457104(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B45710C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSLaunchConfiguration.CodingKeys()
{
  return &type metadata for FBKSLaunchConfiguration.CodingKeys;
}

unint64_t sub_23B45712C()
{
  unint64_t result;

  result = qword_256A1AC58;
  if (!qword_256A1AC58)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486AAC, &type metadata for FBKSLaunchConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AC58);
  }
  return result;
}

unint64_t sub_23B457174()
{
  unint64_t result;

  result = qword_256A1AC60;
  if (!qword_256A1AC60)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4869E4, &type metadata for FBKSLaunchConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AC60);
  }
  return result;
}

unint64_t sub_23B4571BC()
{
  unint64_t result;

  result = qword_256A1AC68;
  if (!qword_256A1AC68)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486A0C, &type metadata for FBKSLaunchConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AC68);
  }
  return result;
}

uint64_t sub_23B457200()
{
  unint64_t v0;

  v0 = sub_23B4836B0();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

unint64_t sub_23B457248()
{
  unint64_t result;

  result = qword_256A1AC70;
  if (!qword_256A1AC70)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSPromptStyle, &type metadata for FBKSPromptStyle);
    atomic_store(result, (unint64_t *)&qword_256A1AC70);
  }
  return result;
}

uint64_t sub_23B457290()
{
  uint64_t v0;

  v0 = sub_23B4833E0();
  __swift_allocate_value_buffer(v0, qword_256A1AC78);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A1AC78);
  return sub_23B4833D4();
}

id sub_23B45730C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CFBDaemonConnection()), sel_init);
  qword_256A1AC90 = (uint64_t)result;
  return result;
}

id static CFBDaemonConnection.shared.getter()
{
  if (qword_256A1A510 != -1)
    swift_once();
  return (id)qword_256A1AC90;
}

id sub_23B4573C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15FeedbackService19CFBDaemonConnection____lazy_storage___xpcConnection;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15FeedbackService19CFBDaemonConnection____lazy_storage___xpcConnection);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC15FeedbackService19CFBDaemonConnection____lazy_storage___xpcConnection);
  }
  else
  {
    swift_getObjectType();
    v4 = sub_23B45742C(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23B45742C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t aBlock;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  void (*v21)();
  uint64_t v22;

  if (qword_256A1A508 != -1)
    swift_once();
  v2 = sub_23B4833E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A1AC78);
  v3 = sub_23B4833C8();
  v4 = sub_23B4835A8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_23B43C788();
    sub_23B44BBC0(v7, v8, &aBlock);
    sub_23B4835D8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v3, v4, "%s: Setting up connection to centralized feedback daemon", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v6, -1, -1);
    MEMORY[0x23B86528C](v5, -1, -1);
  }

  v9 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v10 = (void *)sub_23B483428();
  v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CentralizedFeedbackDaemonInterface()), sel_init);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  objc_msgSend(v11, sel_setExportedObject_, a1);
  v21 = sub_23B457718;
  v22 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor_3_1;
  v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  v21 = sub_23B457734;
  v22 = 0;
  aBlock = v13;
  v18 = 1107296256;
  v19 = sub_23B44FEC4;
  v20 = &block_descriptor_6;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v11, sel_resume);
  return v11;
}

id CentralizedFeedbackDaemonInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_23B457718()
{
  sub_23B457750(0x800000023B48DC70, "Connection to daemon interrupted from client service");
}

void sub_23B457734()
{
  sub_23B457750(0x800000023B48DC30, "Connection to daemon invalidated from client service");
}

void sub_23B457750(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23B484E90;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 32) = 0xD000000000000034;
  *(_QWORD *)(v4 + 40) = a1;
  sub_23B48383C();
  swift_bridgeObjectRelease();
  if (qword_256A1A508 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1AC78);
  oslog = sub_23B4833C8();
  v6 = sub_23B4835A8();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B433000, oslog, v6, a2, v7, 2u);
    MEMORY[0x23B86528C](v7, -1, -1);
  }

}

uint64_t sub_23B457884(uint64_t a1, uint64_t a2)
{
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD aBlock[3];
  ValueMetadata *v16;
  unint64_t v17;
  uint64_t v18;

  v16 = &type metadata for FeedbackFeatureFlags;
  v17 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v4 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v4 & 1) != 0)
  {
    v5 = sub_23B4573C0();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    v17 = (unint64_t)sub_23B457C9C;
    v18 = v6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23B450F3C;
    v16 = (ValueMetadata *)&block_descriptor_5;
    v7 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v8 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v7);
    _Block_release(v7);

    sub_23B4835FC();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AC98);
    if (swift_dynamicCast())
      return v14;
    else
      return 0;
  }
  else
  {
    if (qword_256A1A508 != -1)
      swift_once();
    v10 = sub_23B4833E0();
    __swift_project_value_buffer(v10, (uint64_t)qword_256A1AC78);
    v11 = sub_23B4833C8();
    v12 = sub_23B48359C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23B433000, v11, v12, "Centralized Feedback feature disabled", v13, 2u);
      MEMORY[0x23B86528C](v13, -1, -1);
    }

    return 0;
  }
}

void sub_23B457A88(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A588);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23B484E90;
  sub_23B483608();
  sub_23B483488();
  swift_getErrorValue();
  sub_23B483800();
  sub_23B483488();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0xE000000000000000;
  sub_23B48383C();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_23B483308();
  a2();

}

id CFBDaemonConnection.__deallocating_deinit()
{
  return sub_23B43CFBC(type metadata accessor for CFBDaemonConnection);
}

id CentralizedFeedbackDaemonInterface.init()()
{
  void *v0;
  id v1;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CentralizedFeedbackDaemonInterface();
  v1 = objc_msgSendSuper2(&v3, sel_init);
  objc_msgSend(v1, sel_setProtocol_, &unk_256A2EE40);
  return v1;
}

id CentralizedFeedbackDaemonInterface.__deallocating_deinit()
{
  return sub_23B43CFBC(type metadata accessor for CentralizedFeedbackDaemonInterface);
}

uint64_t sub_23B457C78()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23B457C9C(uint64_t a1)
{
  uint64_t v1;

  sub_23B457A88(a1, *(void (**)(void))(v1 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t type metadata accessor for CFBDaemonConnection()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CentralizedFeedbackDaemonInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for CFBDaemonConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CFBDaemonConnection.remoteObject(errorHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

void FBKSEvaluation.Subject.RemoteEvaluation.action.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t FBKSEvaluation.Subject.RemoteEvaluation.subject.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
  return sub_23B458384(v1 + *(int *)(v3 + 20), a1, type metadata accessor for FBKSEvaluation.Subject);
}

uint64_t type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation()
{
  uint64_t result;

  result = qword_256A1ACD8;
  if (!qword_256A1ACD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FBKSEvaluation.Subject.RemoteEvaluation.showFeedbackForm.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation() + 24));
}

uint64_t FBKSEvaluation.Subject.RemoteEvaluation.init(action:subject:showFeedbackForm:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _BYTE *a4@<X8>)
{
  uint64_t v7;
  uint64_t result;

  *a4 = *a1;
  v7 = type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
  result = sub_23B4464F0(a2, (uint64_t)&a4[*(int *)(v7 + 20)]);
  a4[*(int *)(v7 + 24)] = a3;
  return result;
}

uint64_t sub_23B457E30(char a1)
{
  if (!a1)
    return 0x6E6F69746361;
  if (a1 == 1)
    return 0x7463656A627573;
  return 0xD000000000000010;
}

uint64_t sub_23B457E88()
{
  char *v0;

  return sub_23B457E30(*v0);
}

uint64_t sub_23B457E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B459DBC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B457EB4()
{
  sub_23B4580A0();
  return sub_23B48389C();
}

uint64_t sub_23B457EDC()
{
  sub_23B4580A0();
  return sub_23B4838A8();
}

uint64_t FBKSEvaluation.Subject.RemoteEvaluation.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ACA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4580A0();
  sub_23B483890();
  v10[15] = *v3;
  v10[14] = 0;
  sub_23B446E74();
  sub_23B4837A0();
  if (!v2)
  {
    type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
    v10[13] = 1;
    type metadata accessor for FBKSEvaluation.Subject(0);
    sub_23B44646C(&qword_256A1A778, type metadata accessor for FBKSEvaluation.Subject, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject);
    sub_23B4837A0();
    v10[12] = 2;
    sub_23B48377C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23B4580A0()
{
  unint64_t result;

  result = qword_256A1ACB0;
  if (!qword_256A1ACB0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486D5C, &_s16RemoteEvaluationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256A1ACB0);
  }
  return result;
}

uint64_t FBKSEvaluation.Subject.RemoteEvaluation.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _BYTE *v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v18 = a2;
  v19 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v19);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ACB8);
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4580A0();
  v20 = v7;
  v11 = (uint64_t)v22;
  sub_23B483884();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v22 = a1;
  v12 = v10;
  v25 = 0;
  sub_23B446EFC();
  v13 = v20;
  v14 = v21;
  sub_23B483728();
  *v12 = v26;
  v24 = 1;
  sub_23B44646C(&qword_256A1A798, type metadata accessor for FBKSEvaluation.Subject, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject);
  sub_23B483728();
  sub_23B4464F0((uint64_t)v4, (uint64_t)&v12[*(int *)(v8 + 20)]);
  v23 = 2;
  v15 = sub_23B483704();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v14);
  v12[*(int *)(v8 + 24)] = v15 & 1;
  sub_23B458384((uint64_t)v12, v18, (uint64_t (*)(_QWORD))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  return sub_23B4583C8((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation);
}

uint64_t sub_23B458384(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B4583C8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B458404@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSEvaluation.Subject.RemoteEvaluation.init(from:)(a1, a2);
}

uint64_t sub_23B458418(_QWORD *a1)
{
  return FBKSEvaluation.Subject.RemoteEvaluation.encode(to:)(a1);
}

uint64_t FBKSEvaluation.Subject.remoteEvaluate(action:showFeedbackForm:)(_BYTE *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 88) = v2;
  *(_BYTE *)(v3 + 113) = a2;
  *(_BYTE *)(v3 + 114) = *a1;
  return swift_task_switch();
}

uint64_t sub_23B458450()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char *v7;
  _BYTE *v8;
  _QWORD *v10;
  uint64_t v11;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 80) = sub_23B44BBC0(0xD000000000000028, 0x800000023B48E2E0, &v11);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) == 0)
  {
    sub_23B446D44();
    swift_allocError();
    *v8 = 0;
    goto LABEL_9;
  }
  if ((*(_BYTE *)(v0 + 113) & 1) != 0)
  {
    sub_23B458768();
    swift_allocError();
    strcpy(v7, "Unimplemented");
    *((_WORD *)v7 + 7) = -4864;
LABEL_9:
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_BYTE *)(v0 + 112) = *(_BYTE *)(v0 + 114);
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v10;
  *v10 = v0;
  v10[1] = sub_23B4586E8;
  return FBKSEvaluation.Subject.evaluate(action:formResponse:)((_BYTE *)(v0 + 112), v0 + 56);
}

uint64_t sub_23B4586E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 104) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23B45875C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23B458768()
{
  unint64_t result;

  result = qword_256A1ACC8;
  if (!qword_256A1ACC8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for Failure, &type metadata for Failure);
    atomic_store(result, (unint64_t *)&qword_256A1ACC8);
  }
  return result;
}

uint64_t FBKSEvaluation.Subject._remoteEvaluate(action:showFeedbackForm:)(_BYTE *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 64) = v2;
  *(_BYTE *)(v3 + 128) = a2;
  *(_QWORD *)(v3 + 72) = type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation();
  *(_QWORD *)(v3 + 80) = swift_task_alloc();
  *(_BYTE *)(v3 + 129) = *a1;
  return swift_task_switch();
}

uint64_t sub_23B458818()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v19 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0xD000000000000029, 0x800000023B48E310, &v19);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_BYTE *)(v0 + 129);
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_BYTE **)(v0 + 80);
    v10 = *(_BYTE *)(v0 + 128);
    sub_23B458384(*(_QWORD *)(v0 + 64), (uint64_t)&v8[*(int *)(v9 + 20)], type metadata accessor for FBKSEvaluation.Subject);
    *v8 = v7;
    v8[*(int *)(v9 + 24)] = v10;
    sub_23B483248();
    swift_allocObject();
    sub_23B48323C();
    sub_23B44646C(&qword_256A1A9A8, (uint64_t (*)(uint64_t))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject.RemoteEvaluation);
    v11 = sub_23B483230();
    *(_QWORD *)(v0 + 88) = v11;
    *(_QWORD *)(v0 + 96) = v12;
    v14 = v11;
    v15 = v12;
    swift_release();
    v16 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v16;
    *(_QWORD *)(v16 + 16) = v14;
    *(_QWORD *)(v16 + 24) = v15;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v17;
    *v17 = v0;
    v17[1] = sub_23B458B50;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v13 = 0;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B458B50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B458BBC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  sub_23B43ED7C(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  sub_23B4583C8(v1, (uint64_t (*)(_QWORD))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B458C0C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  sub_23B43ED7C(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  sub_23B4583C8(v1, (uint64_t (*)(_QWORD))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B458C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, char *, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v16 = a2;
  v17 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256A1A510 != -1)
    swift_once();
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  v11 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v11(v10 + v9, v7, v4);
  v12 = (void *)sub_23B457884((uint64_t)sub_23B459EF8, v10);
  swift_release();
  if (v12)
  {
    v13 = (void *)sub_23B483338();
    v8(v7, a1, v4);
    v14 = swift_allocObject();
    v11(v14 + v9, v7, v4);
    aBlock[4] = sub_23B459FA0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23B47D698;
    aBlock[3] = &block_descriptor_6;
    v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v12, sel_remoteEvaluateWithRequest_completion_, v13, v15, v16, v17);
    swift_unknownObjectRelease();
    _Block_release(v15);

  }
}

uint64_t sub_23B458E40(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v2 = sub_23B4833E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A1BC98);
  v3 = a1;
  v4 = sub_23B4833C8();
  v5 = sub_23B48359C();
  if (!os_log_type_enabled(v4, v5))
  {

    if (a1)
      goto LABEL_5;
LABEL_7:
    sub_23B458768();
    v12 = swift_allocError();
    *v13 = 0xD000000000000044;
    v13[1] = 0x800000023B48E370;
    v15 = v12;
    goto LABEL_8;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  v7 = swift_slowAlloc();
  v15 = v7;
  *(_DWORD *)v6 = 136315138;
  v8 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
  v9 = sub_23B483470();
  sub_23B44BBC0(v9, v10, &v15);
  sub_23B4835D8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23B433000, v4, v5, "Failed to connect to daemon: %s", v6, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B86528C](v7, -1, -1);
  MEMORY[0x23B86528C](v6, -1, -1);

  if (!a1)
    goto LABEL_7;
LABEL_5:
  v15 = (uint64_t)v3;
  v11 = v3;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B483530();
}

uint64_t sub_23B459068(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v6 = sub_23B4833E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_256A1BC98);
  v7 = sub_23B4833C8();
  v8 = sub_23B483590();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23B433000, v7, v8, "Returned from remote evaluation", v9, 2u);
    MEMORY[0x23B86528C](v9, -1, -1);
  }

  if (a3)
  {
    v10 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B483530();
  }
  else if (a2 >> 60 == 15)
  {
    v12 = sub_23B4833C8();
    v13 = sub_23B4835A8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23B433000, v12, v13, "Remote evaluation finished. No FBKSInteraction", v14, 2u);
      MEMORY[0x23B86528C](v14, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B48353C();
  }
  else
  {
    sub_23B483200();
    swift_allocObject();
    sub_23B446D90(a1, a2);
    sub_23B4831F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A750);
    sub_23B448AA0();
    sub_23B4831E8();
    swift_release();
    if (v25)
    {
      v15 = v25;
      v16 = sub_23B4833C8();
      v17 = sub_23B4835A8();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v18 = 138543362;
        v19 = v15;
        sub_23B4835D8();
        *v24 = v25;

        _os_log_impl(&dword_23B433000, v16, v17, "Remote evaluation finished with evaluation %{public}@", v18, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AA98);
        swift_arrayDestroy();
        MEMORY[0x23B86528C](v24, -1, -1);
        MEMORY[0x23B86528C](v18, -1, -1);
      }
      else
      {

        v16 = v15;
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
      sub_23B48353C();

    }
    else
    {
      v20 = sub_23B4833C8();
      v21 = sub_23B48359C();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_23B433000, v20, v21, "Remote evaluation finished bad JSON FBKEvaluation", v22, 2u);
        MEMORY[0x23B86528C](v22, -1, -1);
      }

      sub_23B458768();
      swift_allocError();
      *v23 = 0xD000000000000020;
      v23[1] = 0x800000023B48E340;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
      sub_23B483530();
    }
    return sub_23B448B1C(a1, a2);
  }
}

void sub_23B4594F8(uint64_t a1)
{
  uint64_t v1;

  sub_23B458C5C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23B459500(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_23B44646C(&qword_256A1A9A0, (uint64_t (*)(uint64_t))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject.RemoteEvaluation);
  result = sub_23B44646C(&qword_256A1A9A8, (uint64_t (*)(uint64_t))type metadata accessor for FBKSEvaluation.Subject.RemoteEvaluation, (uint64_t)&protocol conformance descriptor for FBKSEvaluation.Subject.RemoteEvaluation);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

_QWORD *_s16RemoteEvaluationVwCP(_BYTE *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  void **v8;
  void **v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (void **)&a1[v7];
    v9 = (void **)((char *)a2 + v7);
    type metadata accessor for FBKSEvaluation.Subject(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = *v9;
      *v8 = *v9;
      v11 = v10;
    }
    else
    {
      v13 = sub_23B4833B0();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
    }
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

void _s16RemoteEvaluationVwxx(uint64_t a1, uint64_t a2)
{
  id *v2;
  uint64_t v3;

  v2 = (id *)(a1 + *(int *)(a2 + 20));
  type metadata accessor for FBKSEvaluation.Subject(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    v3 = sub_23B4833B0();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  }
}

_BYTE *_s16RemoteEvaluationVwcp(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  void **v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (void **)&a1[v6];
  v8 = (void **)&a2[v6];
  type metadata accessor for FBKSEvaluation.Subject(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = *v8;
    *v7 = *v8;
    v10 = v9;
  }
  else
  {
    v11 = sub_23B4833B0();
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, v8, v11);
  }
  swift_storeEnumTagMultiPayload();
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *_s16RemoteEvaluationVwca(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  void **v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;

  *a1 = *a2;
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = (void **)&a1[v6];
    v8 = (void **)&a2[v6];
    sub_23B4583C8((uint64_t)&a1[v6], type metadata accessor for FBKSEvaluation.Subject);
    type metadata accessor for FBKSEvaluation.Subject(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = *v8;
      *v7 = *v8;
      v10 = v9;
    }
    else
    {
      v11 = sub_23B4833B0();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, v8, v11);
    }
    swift_storeEnumTagMultiPayload();
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *_s16RemoteEvaluationVwtk(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for FBKSEvaluation.Subject(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = sub_23B4833B0();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *_s16RemoteEvaluationVwta(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = &a2[v6];
    sub_23B4583C8((uint64_t)&a1[v6], type metadata accessor for FBKSEvaluation.Subject);
    v9 = type metadata accessor for FBKSEvaluation.Subject(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v10 = sub_23B4833B0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t _s16RemoteEvaluationVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B4599D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for FBKSEvaluation.Subject(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t _s16RemoteEvaluationVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B459A70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for FBKSEvaluation.Subject(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_23B459AEC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FBKSEvaluation.Subject(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s16RemoteEvaluationV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B459BB4 + 4 * byte_23B486BC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B459BE8 + 4 * byte_23B486BC0[v4]))();
}

uint64_t sub_23B459BE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B459BF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B459BF8);
  return result;
}

uint64_t sub_23B459C04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B459C0CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B459C10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B459C18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s16RemoteEvaluationV10CodingKeysOMa()
{
  return &_s16RemoteEvaluationV10CodingKeysON;
}

unint64_t sub_23B459C38()
{
  unint64_t result;

  result = qword_256A1ACE8;
  if (!qword_256A1ACE8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486D34, &_s16RemoteEvaluationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256A1ACE8);
  }
  return result;
}

unint64_t sub_23B459C80()
{
  unint64_t result;

  result = qword_256A1ACF0;
  if (!qword_256A1ACF0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486CA4, &_s16RemoteEvaluationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256A1ACF0);
  }
  return result;
}

unint64_t sub_23B459CC8()
{
  unint64_t result;

  result = qword_256A1ACF8;
  if (!qword_256A1ACF8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B486CCC, &_s16RemoteEvaluationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256A1ACF8);
  }
  return result;
}

void sub_23B459D0C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23B4835D8();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_23B459DBC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463656A627573 && a2 == 0xE700000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E170)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23B459EF8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B458E40(a1);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23B459FA0(uint64_t a1, unint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B459068(a1, a2, a3);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

char *FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  _BYTE *v12;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  char *v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  char *v29;
  char *v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v68;

  v17 = *a1;
  v16 = a1[1];
  v18 = a5[1];
  v59 = a5[2];
  v57 = *a5;
  v58 = a5[3];
  v19 = *((_BYTE *)a5 + 32);
  v64 = a6[1];
  v65 = *a6;
  v62 = a6[3];
  v63 = a6[2];
  v20 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
  *v20 = 0;
  v20[1] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions] = 0;
  v60 = v19;
  v61 = *((_BYTE *)a6 + 32);
  v21 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent];
  *(_OWORD *)v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  v21[32] = -8;
  v22 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent];
  *(_OWORD *)v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  v22[32] = -8;
  v23 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion];
  *v23 = 0;
  v23[1] = 0;
  v24 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics];
  *v24 = 0;
  v24[1] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics] = 0;
  v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority] = 0;
  v25 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID];
  v26 = sub_23B4833B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
  v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented] = 0;
  v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation] = 1;
  v27 = &v12[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain];
  *v27 = v17;
  v27[1] = v16;
  v68.receiver = v12;
  v68.super_class = (Class)type metadata accessor for FBKSInteraction();
  v28 = (char *)objc_msgSendSuper2(&v68, sel_init);
  v29 = v28;
  if (a3)
  {
    v30 = &v28[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
    *(_QWORD *)v30 = a2;
    *((_QWORD *)v30 + 1) = a3;
  }
  else
  {
    v31 = (void *)objc_opt_self();
    v32 = v29;
    v33 = objc_msgSend(v31, sel_mainBundle);
    v34 = objc_msgSend(v33, sel_bundleIdentifier);

    if (v34)
    {
      v35 = sub_23B483434();
      v37 = v36;

    }
    else
    {

      v35 = 0;
      v37 = 0;
    }
    v38 = (uint64_t *)&v32[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
    *v38 = v35;
    v38[1] = v37;
  }
  swift_bridgeObjectRelease();
  v39 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions];
  swift_beginAccess();
  *(_QWORD *)v39 = a4;
  swift_bridgeObjectRelease();
  v40 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent];
  swift_beginAccess();
  v41 = *(_QWORD *)v40;
  v42 = *((_QWORD *)v40 + 1);
  v43 = *((_QWORD *)v40 + 2);
  v44 = *((_QWORD *)v40 + 3);
  *(_QWORD *)v40 = v57;
  *((_QWORD *)v40 + 1) = v18;
  *((_QWORD *)v40 + 2) = v59;
  *((_QWORD *)v40 + 3) = v58;
  v45 = v40[32];
  v40[32] = v60;
  sub_23B45A430(v41, v42, v43, v44, v45);
  v46 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent];
  swift_beginAccess();
  v47 = *(_QWORD *)v46;
  v48 = *((_QWORD *)v46 + 1);
  v49 = *((_QWORD *)v46 + 2);
  v50 = *((_QWORD *)v46 + 3);
  *(_QWORD *)v46 = v65;
  *((_QWORD *)v46 + 1) = v64;
  *((_QWORD *)v46 + 2) = v63;
  *((_QWORD *)v46 + 3) = v62;
  v51 = v46[32];
  v46[32] = v61;
  sub_23B45A430(v47, v48, v49, v50, v51);
  v52 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion];
  swift_beginAccess();
  *(_QWORD *)v52 = a7;
  *((_QWORD *)v52 + 1) = a8;
  swift_bridgeObjectRelease();
  v53 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics];
  swift_beginAccess();
  *(_QWORD *)v53 = a9;
  *((_QWORD *)v53 + 1) = a10;
  swift_bridgeObjectRelease();
  v54 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics];
  swift_beginAccess();
  *(_QWORD *)v54 = a11;
  swift_bridgeObjectRelease();
  v55 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority];
  swift_beginAccess();
  *v55 = a12 & 1;
  return v29;
}

uint64_t type metadata accessor for FBKSInteraction()
{
  uint64_t result;

  result = qword_256A1B338;
  if (!qword_256A1B338)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23B45A430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 <= 0xF7u)
    sub_23B45A444(a1, a2, a3, a4, a5);
}

void sub_23B45A444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __asm { BR              X10 }
}

uint64_t sub_23B45A478(uint64_t a1, unint64_t a2)
{
  return sub_23B43ED7C(a1, a2);
}

uint64_t sub_23B45A488()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B45A4A8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = a5 & 0xF;
  sub_23B43ED7C(a1, a2);
  return sub_23B44884C(v6, v5, v7);
}

char *FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13)
{
  _BYTE *v13;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  _QWORD *v23;
  char v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  char *v29;
  char *v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v69;

  v18 = *a1;
  v17 = a1[1];
  v60 = a5[2];
  v61 = a5[1];
  v58 = *a5;
  v59 = a5[3];
  v62 = *((_BYTE *)a5 + 32);
  v65 = a6[1];
  v66 = *a6;
  v63 = a6[3];
  v64 = a6[2];
  v19 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
  *v19 = 0;
  v19[1] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions] = 0;
  v20 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent];
  *(_OWORD *)v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  v20[32] = -8;
  v21 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent];
  *(_OWORD *)v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  v21[32] = -8;
  v22 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion];
  *v22 = 0;
  v22[1] = 0;
  v23 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics];
  *v23 = 0;
  v23[1] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics] = 0;
  v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority] = 0;
  v24 = *((_BYTE *)a6 + 32);
  v25 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID];
  v26 = sub_23B4833B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
  v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented] = 0;
  v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation] = 1;
  v27 = &v13[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain];
  *v27 = v18;
  v27[1] = v17;
  v69.receiver = v13;
  v69.super_class = (Class)type metadata accessor for FBKSInteraction();
  v28 = (char *)objc_msgSendSuper2(&v69, sel_init);
  v29 = v28;
  if (a3)
  {
    v30 = &v28[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
    *(_QWORD *)v30 = a2;
    *((_QWORD *)v30 + 1) = a3;
  }
  else
  {
    v31 = (void *)objc_opt_self();
    v32 = v29;
    v33 = objc_msgSend(v31, sel_mainBundle);
    v34 = objc_msgSend(v33, sel_bundleIdentifier);

    if (v34)
    {
      v35 = sub_23B483434();
      v37 = v36;

    }
    else
    {

      v35 = 0;
      v37 = 0;
    }
    v38 = (uint64_t *)&v32[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
    *v38 = v35;
    v38[1] = v37;
  }
  swift_bridgeObjectRelease();
  v39 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions];
  swift_beginAccess();
  *(_QWORD *)v39 = a4;
  swift_bridgeObjectRelease();
  v40 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent];
  swift_beginAccess();
  v41 = *(_QWORD *)v40;
  v42 = *((_QWORD *)v40 + 1);
  v43 = *((_QWORD *)v40 + 2);
  v44 = *((_QWORD *)v40 + 3);
  *(_QWORD *)v40 = v58;
  *((_QWORD *)v40 + 1) = v61;
  *((_QWORD *)v40 + 2) = v60;
  *((_QWORD *)v40 + 3) = v59;
  v45 = v40[32];
  v40[32] = v62;
  sub_23B45A430(v41, v42, v43, v44, v45);
  v46 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent];
  swift_beginAccess();
  v47 = *(_QWORD *)v46;
  v48 = *((_QWORD *)v46 + 1);
  v49 = *((_QWORD *)v46 + 2);
  v50 = *((_QWORD *)v46 + 3);
  *(_QWORD *)v46 = v66;
  *((_QWORD *)v46 + 1) = v65;
  *((_QWORD *)v46 + 2) = v64;
  *((_QWORD *)v46 + 3) = v63;
  v51 = v46[32];
  v46[32] = v24;
  sub_23B45A430(v47, v48, v49, v50, v51);
  v52 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion];
  swift_beginAccess();
  *(_QWORD *)v52 = a7;
  *((_QWORD *)v52 + 1) = a8;
  swift_bridgeObjectRelease();
  v53 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics];
  swift_beginAccess();
  *(_QWORD *)v53 = a9;
  *((_QWORD *)v53 + 1) = a10;
  swift_bridgeObjectRelease();
  v54 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics];
  swift_beginAccess();
  *(_QWORD *)v54 = a11;
  swift_bridgeObjectRelease();
  v55 = &v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority];
  swift_beginAccess();
  *v55 = a12 & 1;
  v56 = (uint64_t)&v29[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID];
  swift_beginAccess();
  sub_23B448990(a13, v56);
  swift_endAccess();
  return v29;
}

id FBKSInteraction.init(from:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  char *v8;
  char *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char *v25;
  char *v26;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  id v64;
  objc_class *v65;
  __int128 v66;
  __int128 v67;
  _BYTE *v68;
  _BYTE *v69;
  _BYTE *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t *v82;
  char *v83;
  _QWORD *v84;
  objc_super v85;
  char v86;
  char v87;
  uint64_t v88;
  char v89;
  char v90;
  char v91;
  char v92;
  _BYTE v93[24];
  uint64_t v94;
  char v95;
  char v96;
  uint64_t *v97;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v3);
  v71 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AD70);
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID];
  *v7 = 0;
  v7[1] = 0;
  v97 = v7;
  v84 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions] = 0;
  v8 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v78 = v8;
  v8[32] = -8;
  v9 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v79 = v9;
  v9[32] = -8;
  v10 = (uint64_t *)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion];
  *v10 = 0;
  v10[1] = 0;
  v82 = v10;
  v11 = (uint64_t *)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics];
  *v11 = 0;
  v11[1] = 0;
  v81 = v11;
  v80 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics] = 0;
  v70 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority];
  v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority] = 0;
  v12 = (uint64_t)&v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID];
  v13 = sub_23B4833B0();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v77 = v12;
  v14(v12, 1, 1, v13);
  v15 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented];
  v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented] = 0;
  v16 = &v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation];
  v1[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation] = 1;
  v17 = a1[3];
  v76 = a1;
  v18 = __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23B45B32C();
  v83 = v1;
  v74 = v6;
  v19 = v18;
  v20 = v75;
  sub_23B483884();
  if (v20)
  {
    v24 = v83;
    v25 = v79;
    v26 = v78;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B45A430(*(_QWORD *)v26, *((_QWORD *)v26 + 1), *((_QWORD *)v26 + 2), *((_QWORD *)v26 + 3), v26[32]);
    sub_23B45A430(*(_QWORD *)v25, *((_QWORD *)v25 + 1), *((_QWORD *)v25 + 2), *((_QWORD *)v25 + 3), v25[32]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B448B30(v77, &qword_256A1A650);

    type metadata accessor for FBKSInteraction();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v21 = v70;
    v75 = v13;
    v69 = v15;
    v68 = v16;
    v22 = (uint64_t)v71;
    v23 = v72;
    v96 = 0;
    sub_23B45B384();
    sub_23B483728();
    *(_OWORD *)&v83[OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain] = *(_OWORD *)v93;
    v93[0] = 1;
    v28 = sub_23B4836D4();
    v29 = v79;
    v30 = v78;
    v31 = v97;
    *v97 = v28;
    v31[1] = v32;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
    v96 = 2;
    sub_23B446684();
    sub_23B4836EC();
    v33 = *(_QWORD *)v93;
    v34 = v84;
    swift_beginAccess();
    *v34 = v33;
    swift_bridgeObjectRelease();
    v92 = 3;
    *(_QWORD *)&v67 = sub_23B45B3C8();
    sub_23B4836EC();
    v66 = *(_OWORD *)&v93[8];
    v35 = *(_QWORD *)v93;
    v36 = v94;
    v37 = v95;
    swift_beginAccess();
    v38 = *(_QWORD *)v30;
    v39 = *((_QWORD *)v30 + 1);
    v40 = *((_QWORD *)v30 + 2);
    v41 = *((_QWORD *)v30 + 3);
    *(_QWORD *)v30 = v35;
    *(_OWORD *)(v30 + 8) = v66;
    *((_QWORD *)v30 + 3) = v36;
    v42 = v30[32];
    v30[32] = v37;
    sub_23B45A430(v38, v39, v40, v41, v42);
    v91 = 4;
    sub_23B4836EC();
    v67 = *(_OWORD *)&v93[8];
    v43 = *(_QWORD *)v93;
    v44 = v94;
    v45 = v95;
    swift_beginAccess();
    v46 = *(_QWORD *)v29;
    v47 = *((_QWORD *)v29 + 1);
    v48 = *((_QWORD *)v29 + 2);
    v49 = *((_QWORD *)v29 + 3);
    *(_QWORD *)v29 = v43;
    *(_OWORD *)(v29 + 8) = v67;
    *((_QWORD *)v29 + 3) = v44;
    v50 = v29[32];
    v29[32] = v45;
    sub_23B45A430(v46, v47, v48, v49, v50);
    v93[0] = 5;
    v51 = sub_23B4836D4();
    *(_QWORD *)&v67 = v52;
    v53 = v82;
    swift_beginAccess();
    v54 = v67;
    *v53 = v51;
    v53[1] = v54;
    swift_bridgeObjectRelease();
    v90 = 6;
    v55 = sub_23B4836D4();
    *(_QWORD *)&v67 = v56;
    v57 = v81;
    swift_beginAccess();
    v58 = v67;
    *v57 = v55;
    v57[1] = v58;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AD90);
    v89 = 7;
    sub_23B46BA10(&qword_256A1AD98, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1798], MEMORY[0x24BEE04E0]);
    sub_23B4836EC();
    v59 = v88;
    v60 = v80;
    swift_beginAccess();
    *v60 = v59;
    swift_bridgeObjectRelease();
    LOBYTE(v88) = 8;
    LOBYTE(v60) = sub_23B483704();
    swift_beginAccess();
    *v21 = v60 & 1;
    v87 = 9;
    sub_23B44646C(&qword_256A1A6E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23B4836EC();
    v61 = v77;
    swift_beginAccess();
    sub_23B448990(v22, v61);
    swift_endAccess();
    v87 = 10;
    LOBYTE(v60) = sub_23B483704();
    v62 = v69;
    swift_beginAccess();
    *v62 = v60 & 1;
    v86 = 11;
    LOBYTE(v60) = sub_23B483704();
    v63 = v68;
    swift_beginAccess();
    *v63 = v60 & 1;
    v64 = v83;

    v65 = (objc_class *)type metadata accessor for FBKSInteraction();
    v85.receiver = v64;
    v85.super_class = v65;
    v19 = objc_msgSendSuper2(&v85, sel_init);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v74, v73);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
  }
  return v19;
}

unint64_t sub_23B45B32C()
{
  unint64_t result;

  result = qword_256A1AD78;
  if (!qword_256A1AD78)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A82C, &type metadata for FBKSInteraction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AD78);
  }
  return result;
}

uint64_t sub_23B45B370(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0x12)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23B45B384()
{
  unint64_t result;

  result = qword_256A1AD80;
  if (!qword_256A1AD80)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.FeatureDomain, &type metadata for FBKSInteraction.FeatureDomain);
    atomic_store(result, (unint64_t *)&qword_256A1AD80);
  }
  return result;
}

unint64_t sub_23B45B3C8()
{
  unint64_t result;

  result = qword_256A1AD88;
  if (!qword_256A1AD88)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.Content, &type metadata for FBKSInteraction.Content);
    atomic_store(result, (unint64_t *)&qword_256A1AD88);
  }
  return result;
}

uint64_t sub_23B45B40C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_23B45B45C(v4, v5);
}

uint64_t sub_23B45B45C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0x12)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23B45B470(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  *v4 = v2;
  v4[1] = v3;
  return sub_23B45B370(v5, v6);
}

uint64_t (*sub_23B45B4C8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45B50C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID + 8))
  {
    swift_bridgeObjectRetain();
    if ((sub_23B465A60() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_256A1A528 != -1)
        swift_once();
      v1 = qword_256A1AD10;
      swift_bridgeObjectRetain();
    }
  }
  return v1;
}

uint64_t sub_23B45B5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23B45B5D0(uint64_t *a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID;
  a1[2] = v1;
  a1[3] = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = *v4;
  v6 = v4[1];
  if (v6)
  {
    swift_bridgeObjectRetain();
    if ((sub_23B465A60() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_256A1A528 != -1)
        swift_once();
      v5 = qword_256A1AD10;
      v6 = *(_QWORD *)algn_256A1AD18;
      swift_bridgeObjectRetain();
    }
  }
  *a1 = v5;
  a1[1] = v6;
  return sub_23B45B690;
}

uint64_t sub_23B45B690(uint64_t a1)
{
  *(_OWORD *)(*(_QWORD *)(a1 + 16) + *(_QWORD *)(a1 + 24)) = *(_OWORD *)a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B45B6AC()
{
  return sub_23B45B964();
}

uint64_t sub_23B45B6B8(uint64_t a1)
{
  return sub_23B45B9B4(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions);
}

uint64_t (*sub_23B45B6C4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_23B45B708(uint64_t a1@<X8>)
{
  sub_23B45B770(&OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent, a1);
}

double sub_23B45B714(uint64_t *a1)
{
  double result;

  *(_QWORD *)&result = sub_23B45B7D8(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent).n128_u64[0];
  return result;
}

uint64_t (*sub_23B45B720())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_23B45B764(uint64_t a1@<X8>)
{
  sub_23B45B770(&OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent, a1);
}

void sub_23B45B770(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = v2 + *a1;
  swift_beginAccess();
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)(v4 + 8);
  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)a2 = *(_QWORD *)v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 24) = v8;
  v9 = *(_BYTE *)(v4 + 32);
  *(_BYTE *)(a2 + 32) = v9;
  sub_23B465BC4(v5, v6, v7, v8, v9);
}

double sub_23B45B7CC(uint64_t *a1)
{
  double result;

  *(_QWORD *)&result = sub_23B45B7D8(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent).n128_u64[0];
  return result;
}

__n128 sub_23B45B7D8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __n128 result;
  __int128 v13;

  v3 = *a1;
  v13 = *(_OWORD *)(a1 + 1);
  v4 = a1[3];
  v5 = *((_BYTE *)a1 + 32);
  v6 = v2 + *a2;
  swift_beginAccess();
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)(v6 + 8);
  v9 = *(_QWORD *)(v6 + 16);
  v10 = *(_QWORD *)(v6 + 24);
  *(_QWORD *)v6 = v3;
  *(_OWORD *)(v6 + 8) = v13;
  *(_QWORD *)(v6 + 24) = v4;
  v11 = *(_BYTE *)(v6 + 32);
  *(_BYTE *)(v6 + 32) = v5;
  sub_23B45A430(v7, v8, v9, v10, v11);
  return result;
}

uint64_t (*sub_23B45B85C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45B8A0()
{
  return sub_23B455694(&OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion);
}

uint64_t sub_23B45B8AC(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion);
}

uint64_t (*sub_23B45B8B8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45B8FC()
{
  return sub_23B455694(&OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics);
}

uint64_t sub_23B45B908(uint64_t a1, uint64_t a2)
{
  return sub_23B455774(a1, a2, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics);
}

uint64_t (*sub_23B45B914())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23B45B958()
{
  return sub_23B45B964();
}

uint64_t sub_23B45B964()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B45B9A8(uint64_t a1)
{
  return sub_23B45B9B4(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics);
}

uint64_t sub_23B45B9B4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23B45BA00())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45BA44()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B45BA88(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B45BAD0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45BB14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  return sub_23B448908(v3, a1, &qword_256A1A650);
}

uint64_t sub_23B45BB6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B4833B0();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  v8 = v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448990((uint64_t)v5, v8);
  return swift_endAccess();
}

uint64_t sub_23B45BC48()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B45BC8C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B45BCD4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23B45BD18()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23B45BD5C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B45BDA4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_23B45BDE8(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  _BYTE *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26[3];
  ValueMetadata *v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v5 = sub_23B4833E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A1BC98);
  v6 = sub_23B4833C8();
  v7 = sub_23B4835A8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v26[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v30 = sub_23B44BBC0(0x65746E6573657270, 0xED0000293A5F2864, v26);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);
  }

  v27 = &type metadata for FeedbackFeatureFlags;
  v28 = sub_23B446D00();
  LOBYTE(v26[0]) = 0;
  v10 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  if ((v10 & 1) != 0)
  {
    v11 = (_BYTE *)(v2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
    swift_beginAccess();
    if ((*v11 & 1) != 0)
    {
      v12 = sub_23B4833C8();
      v13 = sub_23B4835A8();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_23B433000, v12, v13, "Ignoring .presented(), sentPresented already set", v14, 2u);
        MEMORY[0x23B86528C](v14, -1, -1);
      }

      ((void (*)(_QWORD))a1)(0);
    }
    else
    {
      sub_23B483248();
      swift_allocObject();
      sub_23B48323C();
      v26[0] = v2;
      type metadata accessor for FBKSInteraction();
      sub_23B44646C(&qword_256A1A6A0, (uint64_t (*)(uint64_t))type metadata accessor for FBKSInteraction, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
      v17 = sub_23B483230();
      v19 = v18;
      swift_release();
      sub_23B446D90(v17, v19);
      if (qword_256A1A510 != -1)
        swift_once();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = a1;
      *(_QWORD *)(v20 + 24) = a2;
      swift_retain();
      v21 = (void *)sub_23B457884((uint64_t)sub_23B468AFC, v20);
      swift_release();
      if (v21)
      {
        v22 = (void *)sub_23B483338();
        sub_23B43ED7C(v17, v19);
        v23 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v24 = (_QWORD *)swift_allocObject();
        v24[2] = v23;
        v24[3] = a1;
        v24[4] = a2;
        v28 = (unint64_t)sub_23B468B54;
        v29 = v24;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 1107296256;
        v26[2] = (uint64_t)sub_23B4499A0;
        v27 = (ValueMetadata *)&block_descriptor_7;
        v25 = _Block_copy(v26);
        swift_retain();
        swift_release();
        objc_msgSend(v21, sel_presentedInteractionWithInteractionJSON_completion_, v22, v25);
        sub_23B43ED7C(v17, v19);
        _Block_release(v25);

        swift_unknownObjectRelease();
      }
      else
      {
        sub_23B43ED7C(v17, v19);
        sub_23B43ED7C(v17, v19);
      }
    }
  }
  else
  {
    sub_23B446D44();
    v15 = (void *)swift_allocError();
    *v16 = 0;
    a1();

  }
}

uint64_t sub_23B45C294()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return swift_task_switch();
}

uint64_t sub_23B45C2AC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t v12;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v12 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 56) = sub_23B44BBC0(0x65746E6573657270, 0xEB00000000292864, &v12);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 64);
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v8;
    *(_QWORD *)(v8 + 16) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v9;
    *v9 = v0;
    v9[1] = sub_23B44B878;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void sub_23B45C528(char *a1, uint64_t *a2, void (*a3)(id, uint64_t), uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  char v26;
  objc_class *v27;
  _BYTE *v28;
  uint64_t *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(id, uint64_t);
  uint64_t v41;
  uint64_t v42;
  objc_super v43;
  uint64_t v44[5];

  v5 = v4;
  v41 = type metadata accessor for FBKSEvaluation.Subject(0);
  MEMORY[0x24BDAC7A8](v41);
  v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *a1;
  v13 = *a2;
  v14 = a2[1];
  v15 = a2[2];
  if (qword_256A1A4E0 != -1)
    swift_once();
  v16 = sub_23B4833E0();
  __swift_project_value_buffer(v16, (uint64_t)qword_256A1BC98);
  v17 = sub_23B4833C8();
  v18 = sub_23B4835A8();
  if (os_log_type_enabled(v17, v18))
  {
    v38 = v15;
    v19 = swift_slowAlloc();
    v40 = a3;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v39 = v14;
    v37 = a4;
    v22 = v5;
    v23 = v21;
    v44[0] = v21;
    *(_DWORD *)v20 = 136446210;
    v42 = sub_23B44BBC0(0xD000000000000029, 0x800000023B48E3C0, v44);
    v15 = v38;
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v17, v18, "%{public}s", v20, 0xCu);
    swift_arrayDestroy();
    v24 = v23;
    v5 = v22;
    a4 = v37;
    v14 = v39;
    MEMORY[0x23B86528C](v24, -1, -1);
    v25 = v20;
    a3 = v40;
    MEMORY[0x23B86528C](v25, -1, -1);
  }

  v44[3] = (uint64_t)&type metadata for FeedbackFeatureFlags;
  v44[4] = sub_23B446D00();
  LOBYTE(v44[0]) = 0;
  v26 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  if ((v26 & 1) != 0)
  {
    *v11 = v5;
    swift_storeEnumTagMultiPayload();
    v27 = (objc_class *)type metadata accessor for FBKSEvaluation(0);
    v28 = objc_allocWithZone(v27);
    sub_23B440FEC((uint64_t)v11, (uint64_t)&v28[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject]);
    v28[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_action] = v12;
    v29 = (uint64_t *)&v28[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
    *v29 = v13;
    v29[1] = v14;
    v29[2] = v15;
    v30 = v5;
    sub_23B445D10(v13, v14);
    v43.receiver = v28;
    v43.super_class = v27;
    v31 = objc_msgSendSuper2(&v43, sel_init);
    sub_23B445D40((uint64_t)v11);
    v32 = v30;
    swift_retain();
    v33 = v31;
    sub_23B448184(v33, v32, a3, a4, v33);

    swift_release();
  }
  else
  {
    sub_23B446D44();
    v34 = (void *)swift_allocError();
    *v35 = 0;
    a3(v34, 1);

  }
}

uint64_t sub_23B45C87C(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 72) = v2;
  *(_BYTE *)(v3 + 128) = *a1;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)a2;
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(a2 + 16);
  return swift_task_switch();
}

uint64_t sub_23B45C8AC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v13;
  __int128 v14;
  uint64_t v15;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v15 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 64) = sub_23B44BBC0(0xD00000000000001ELL, 0x800000023B48E3F0, &v15);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 96);
    v14 = *(_OWORD *)(v0 + 80);
    v8 = *(_BYTE *)(v0 + 128);
    v9 = *(_QWORD *)(v0 + 72);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v10;
    *(_QWORD *)(v10 + 16) = v9;
    *(_BYTE *)(v10 + 24) = v8;
    *(_OWORD *)(v10 + 32) = v14;
    *(_QWORD *)(v10 + 48) = v7;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v11;
    type metadata accessor for FBKSEvaluation(0);
    *v11 = v0;
    v11[1] = sub_23B45CB44;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v13 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B45CB44()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B45CBB0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B45CBE4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 *v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  char v18;
  __int128 v19;
  __int128 *v20;
  char v21;
  __int128 v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  __int128 v36;
  __int128 v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADB0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B45B32C();
  sub_23B483890();
  v27 = v2;
  v11 = (__int128 *)(v2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v36 = *v11;
  v40 = 0;
  sub_23B46B988();
  v12 = v41;
  sub_23B4837A0();
  if (v12)
  {
    v13 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  }
  else
  {
    v41 = v8;
    v26 = v6;
    v15 = v27;
    LOBYTE(v36) = 1;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    v16 = (_QWORD *)(v15 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions);
    swift_beginAccess();
    *(_QWORD *)&v36 = *v16;
    v39 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
    sub_23B446578();
    sub_23B483764();
    v17 = (__int128 *)(v15 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent);
    swift_beginAccess();
    v18 = *((_BYTE *)v17 + 32);
    v19 = v17[1];
    v36 = *v17;
    v37 = v19;
    v38 = v18;
    v35 = 3;
    sub_23B46B9CC();
    sub_23B483764();
    v20 = (__int128 *)(v15 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent);
    swift_beginAccess();
    v21 = *((_BYTE *)v20 + 32);
    v22 = v20[1];
    v36 = *v20;
    v37 = v22;
    v38 = v21;
    v34 = 4;
    sub_23B483764();
    swift_beginAccess();
    v34 = 5;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v33 = 6;
    swift_bridgeObjectRetain();
    sub_23B48374C();
    swift_bridgeObjectRelease();
    v23 = (uint64_t *)(v15 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics);
    swift_beginAccess();
    v32 = *v23;
    v31 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AD90);
    sub_23B46BA10(&qword_256A1ADC8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1770], MEMORY[0x24BEE04C0]);
    sub_23B483764();
    swift_beginAccess();
    v31 = 8;
    sub_23B48377C();
    v24 = v15 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
    swift_beginAccess();
    v25 = (uint64_t)v26;
    sub_23B448908(v24, (uint64_t)v26, &qword_256A1A650);
    v30 = 9;
    sub_23B4833B0();
    sub_23B44646C(&qword_256A1A6B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_23B483764();
    sub_23B448B30(v25, &qword_256A1A650);
    swift_beginAccess();
    v29 = 10;
    sub_23B48377C();
    swift_beginAccess();
    v28 = 11;
    sub_23B48377C();
    v13 = *(uint64_t (**)(char *, uint64_t))(v41 + 8);
  }
  return v13(v10, v7);
}

unint64_t FBKSInteraction.InteractionError.description.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t static FBKSInteraction.InteractionError.== infix(_:_:)()
{
  return 1;
}

uint64_t FBKSInteraction.InteractionError.hash(into:)()
{
  return sub_23B483854();
}

uint64_t FBKSInteraction.InteractionError.hashValue.getter()
{
  sub_23B483848();
  sub_23B483854();
  return sub_23B483878();
}

unint64_t sub_23B45D288()
{
  return 0xD00000000000001BLL;
}

double static FBKSInteraction.FeatureDomain.expertAssistant.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = xmmword_23B48A930;
  return result;
}

unint64_t FBKSInteraction.FeatureDomain.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = v0[1];
  v3 = *v0;
  switch(v2)
  {
    case 0uLL:
    case 3uLL:
    case 7uLL:
      v3 = 0xD000000000000010;
      break;
    case 1uLL:
      v3 = 0x432079726F6D654DLL;
      break;
    case 2uLL:
      v3 = 0x74697277646E6148;
      break;
    case 4uLL:
      v3 = 0x4520656369766544;
      break;
    case 5uLL:
      v3 = 0x20676E6974697257;
      break;
    case 6uLL:
      v3 = 0x6552207472616D53;
      break;
    case 8uLL:
      v3 = 0xD000000000000012;
      break;
    case 9uLL:
      v3 = 0x676948206C69614DLL;
      break;
    case 0xAuLL:
      v3 = 0xD000000000000016;
      break;
    case 0xBuLL:
      v3 = 0xD00000000000001BLL;
      break;
    case 0xCuLL:
      v3 = 0xD000000000000018;
      break;
    case 0xDuLL:
      v3 = 0xD00000000000001ALL;
      break;
    case 0xEuLL:
      v3 = 0x615020636967614DLL;
      break;
    case 0xFuLL:
      v3 = 0x7341207466697753;
      break;
    case 0x10uLL:
      v3 = 0x4320736F746F6850;
      break;
    case 0x11uLL:
      v3 = 1953719636;
      break;
    default:
      break;
  }
  sub_23B45B45C(v1, v2);
  return v3;
}

double sub_23B45D504()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7C8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23B48A940;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_OWORD *)(v0 + 56) = xmmword_23B48A950;
  *(_OWORD *)(v0 + 72) = xmmword_23B48A960;
  *(_OWORD *)(v0 + 88) = xmmword_23B48A970;
  *(_OWORD *)(v0 + 104) = xmmword_23B48A980;
  *(_OWORD *)(v0 + 120) = xmmword_23B48A990;
  *(_OWORD *)(v0 + 136) = xmmword_23B48A9A0;
  *(_OWORD *)(v0 + 152) = xmmword_23B48A9B0;
  *(_OWORD *)(v0 + 168) = xmmword_23B48A9C0;
  *(_OWORD *)(v0 + 184) = xmmword_23B48A9D0;
  *(_OWORD *)(v0 + 200) = xmmword_23B48A9E0;
  *(_OWORD *)(v0 + 216) = xmmword_23B48A9F0;
  *(_OWORD *)(v0 + 232) = xmmword_23B48AA00;
  *(_OWORD *)(v0 + 248) = xmmword_23B48AA10;
  *(_QWORD *)(v0 + 264) = 13;
  *(_OWORD *)(v0 + 272) = xmmword_23B48AA20;
  *(_OWORD *)(v0 + 288) = xmmword_23B48A930;
  *(_OWORD *)(v0 + 304) = xmmword_23B48AA30;
  *(_OWORD *)(v0 + 320) = xmmword_23B48AA40;
  result = 0.0;
  *(_OWORD *)(v0 + 336) = xmmword_23B48AA50;
  qword_256A1AD00 = v0;
  return result;
}

uint64_t static FBKSInteraction.FeatureDomain.allCases.getter()
{
  return sub_23B462378(&qword_256A1A518);
}

uint64_t static FBKSInteraction.FeatureDomain.allCases.setter(uint64_t a1)
{
  return sub_23B4623EC(a1, &qword_256A1A518, &qword_256A1AD00);
}

uint64_t (*static FBKSInteraction.FeatureDomain.allCases.modify())()
{
  if (qword_256A1A518 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t FBKSInteraction.FeatureDomain.hash(into:)()
{
  uint64_t v0;
  uint64_t result;

  switch(*(_QWORD *)(v0 + 8))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x11:
      result = sub_23B483854();
      break;
    default:
      sub_23B483854();
      result = sub_23B48347C();
      break;
  }
  return result;
}

uint64_t sub_23B45D7D0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B45D808 + 4 * byte_23B486DE4[a1]))(0xD000000000000011, 0x800000023B48E6D0);
}

uint64_t sub_23B45D808()
{
  return 0x6E65476567616D69;
}

uint64_t sub_23B45D904()
{
  return 0x686769486C69616DLL;
}

uint64_t sub_23B45D928(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_23B45D970()
{
  return 0x706150636967616DLL;
}

uint64_t sub_23B45D98C()
{
  return 0x7373417466697773;
}

uint64_t sub_23B45D9AC()
{
  return 0x6C43736F746F6870;
}

uint64_t sub_23B45D9D0()
{
  return 0x7261726F706D6574;
}

uint64_t sub_23B45D9EC()
{
  return 1953719668;
}

uint64_t sub_23B45D9FC()
{
  unsigned __int8 *v0;

  return sub_23B45D7D0(*v0);
}

uint64_t sub_23B45DA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46C9EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B45DA28(_BYTE *a1@<X8>)
{
  *a1 = 19;
}

uint64_t sub_23B45DA34()
{
  sub_23B46BA74();
  return sub_23B48389C();
}

uint64_t sub_23B45DA5C()
{
  sub_23B46BA74();
  return sub_23B4838A8();
}

uint64_t sub_23B45DA84()
{
  sub_23B46BE70();
  return sub_23B48389C();
}

uint64_t sub_23B45DAAC()
{
  sub_23B46BE70();
  return sub_23B4838A8();
}

uint64_t sub_23B45DAD4()
{
  sub_23B46BDA4();
  return sub_23B48389C();
}

uint64_t sub_23B45DAFC()
{
  sub_23B46BDA4();
  return sub_23B4838A8();
}

uint64_t sub_23B45DB24()
{
  sub_23B46BEF8();
  return sub_23B48389C();
}

uint64_t sub_23B45DB4C()
{
  sub_23B46BEF8();
  return sub_23B4838A8();
}

uint64_t sub_23B45DB74()
{
  sub_23B46BF80();
  return sub_23B48389C();
}

uint64_t sub_23B45DB9C()
{
  sub_23B46BF80();
  return sub_23B4838A8();
}

uint64_t sub_23B45DBC4()
{
  sub_23B46BBC8();
  return sub_23B48389C();
}

uint64_t sub_23B45DBEC()
{
  sub_23B46BBC8();
  return sub_23B4838A8();
}

uint64_t sub_23B45DC14()
{
  sub_23B46BD1C();
  return sub_23B48389C();
}

uint64_t sub_23B45DC3C()
{
  sub_23B46BD1C();
  return sub_23B4838A8();
}

uint64_t sub_23B45DC64()
{
  sub_23B46BD60();
  return sub_23B48389C();
}

uint64_t sub_23B45DC8C()
{
  sub_23B46BD60();
  return sub_23B4838A8();
}

uint64_t sub_23B45DCB4()
{
  sub_23B46BF3C();
  return sub_23B48389C();
}

uint64_t sub_23B45DCDC()
{
  sub_23B46BF3C();
  return sub_23B4838A8();
}

uint64_t sub_23B45DD04()
{
  sub_23B46BCD8();
  return sub_23B48389C();
}

uint64_t sub_23B45DD2C()
{
  sub_23B46BCD8();
  return sub_23B4838A8();
}

uint64_t sub_23B45DD54()
{
  sub_23B46BC0C();
  return sub_23B48389C();
}

uint64_t sub_23B45DD7C()
{
  sub_23B46BC0C();
  return sub_23B4838A8();
}

uint64_t sub_23B45DDA4()
{
  sub_23B46BC50();
  return sub_23B48389C();
}

uint64_t sub_23B45DDCC()
{
  sub_23B46BC50();
  return sub_23B4838A8();
}

uint64_t sub_23B45DDF4()
{
  sub_23B46BC94();
  return sub_23B48389C();
}

uint64_t sub_23B45DE1C()
{
  sub_23B46BC94();
  return sub_23B4838A8();
}

uint64_t sub_23B45DE44()
{
  sub_23B46BB40();
  return sub_23B48389C();
}

uint64_t sub_23B45DE6C()
{
  sub_23B46BB40();
  return sub_23B4838A8();
}

uint64_t sub_23B45DE94()
{
  sub_23B46BDE8();
  return sub_23B48389C();
}

uint64_t sub_23B45DEBC()
{
  sub_23B46BDE8();
  return sub_23B4838A8();
}

uint64_t sub_23B45DEE4()
{
  sub_23B46BB84();
  return sub_23B48389C();
}

uint64_t sub_23B45DF0C()
{
  sub_23B46BB84();
  return sub_23B4838A8();
}

uint64_t sub_23B45DF34()
{
  sub_23B46BEB4();
  return sub_23B48389C();
}

uint64_t sub_23B45DF5C()
{
  sub_23B46BEB4();
  return sub_23B4838A8();
}

uint64_t sub_23B45DF88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46D1B8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23B45DFB0()
{
  sub_23B46BAFC();
  return sub_23B48389C();
}

uint64_t sub_23B45DFD8()
{
  sub_23B46BAFC();
  return sub_23B4838A8();
}

uint64_t sub_23B45E000()
{
  sub_23B46BAB8();
  return sub_23B48389C();
}

uint64_t sub_23B45E028()
{
  sub_23B46BAB8();
  return sub_23B4838A8();
}

uint64_t sub_23B45E050()
{
  sub_23B46BE2C();
  return sub_23B48389C();
}

uint64_t sub_23B45E078()
{
  sub_23B46BE2C();
  return sub_23B4838A8();
}

uint64_t FBKSInteraction.FeatureDomain.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t result;
  void (*v41)(char *, uint64_t);
  char *v42;
  char **v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADD0);
  v110 = *(_QWORD *)(v3 - 8);
  v111 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v108 = (char *)v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADD8);
  v107 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v106 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADE0);
  v104 = *(_QWORD *)(v6 - 8);
  v105 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v103 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADE8);
  v101 = *(_QWORD *)(v8 - 8);
  v102 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v100 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADF0);
  v98 = *(_QWORD *)(v10 - 8);
  v99 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v97 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1ADF8);
  v95 = *(_QWORD *)(v12 - 8);
  v96 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v94 = (char *)v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE00);
  v92 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v91 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE08);
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v88 = (char *)v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE10);
  v86 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v85 = (char *)v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE18);
  v83 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v82 = (char *)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE20);
  v80 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v79 = (char *)v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE28);
  v77 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v76 = (char *)v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE30);
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v73 = (char *)v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE38);
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v70 = (char *)v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE40);
  v68 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v67 = (char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE48);
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v64 = (char *)v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE50);
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE58);
  v59 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v26 = (char *)v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE60);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AE68);
  v112 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v32 = (char *)v58 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v1[1];
  v58[1] = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B46BA74();
  v113 = v32;
  sub_23B483890();
  switch(v33)
  {
    case 0:
      v116 = 0;
      sub_23B46BF80();
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
      goto LABEL_24;
    case 1:
      v116 = 1;
      sub_23B46BF3C();
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v59 + 8);
      v42 = v26;
      v43 = (char **)&v92;
      goto LABEL_16;
    case 2:
      v116 = 2;
      sub_23B46BEF8();
      v44 = v61;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v62 + 8);
      v42 = v44;
      v43 = (char **)&v95;
      goto LABEL_16;
    case 3:
      v116 = 3;
      sub_23B46BEB4();
      v45 = v64;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v65 + 8);
      v42 = v45;
      v43 = (char **)&v98;
      goto LABEL_16;
    case 4:
      v116 = 4;
      sub_23B46BE70();
      v46 = v67;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v68 + 8);
      v42 = v46;
      v43 = (char **)&v101;
      goto LABEL_16;
    case 5:
      v116 = 5;
      sub_23B46BE2C();
      v47 = v70;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v71 + 8);
      v42 = v47;
      v43 = (char **)&v104;
      goto LABEL_16;
    case 6:
      v116 = 6;
      sub_23B46BDE8();
      v48 = v73;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v74 + 8);
      v42 = v48;
      v43 = (char **)&v107;
      goto LABEL_16;
    case 7:
      v116 = 7;
      sub_23B46BDA4();
      v49 = v76;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v77 + 8);
      v42 = v49;
      v43 = (char **)&v110;
      goto LABEL_16;
    case 8:
      v116 = 8;
      sub_23B46BD60();
      v50 = v79;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v80 + 8);
      v42 = v50;
      v43 = &v113;
      goto LABEL_16;
    case 9:
      v116 = 9;
      sub_23B46BD1C();
      v51 = v82;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v83 + 8);
      v42 = v51;
      v43 = (char **)&v115;
      goto LABEL_16;
    case 10:
      v116 = 10;
      sub_23B46BCD8();
      v52 = v85;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v86 + 8);
      v42 = v52;
      v43 = (char **)&v117;
      goto LABEL_16;
    case 11:
      v116 = 11;
      sub_23B46BC94();
      v53 = v88;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v89 + 8);
      v42 = v53;
      v43 = (char **)&v118;
      goto LABEL_16;
    case 12:
      v116 = 12;
      sub_23B46BC50();
      v54 = v91;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v41 = *(void (**)(char *, uint64_t))(v92 + 8);
      v42 = v54;
      v43 = (char **)&v119;
LABEL_16:
      v55 = (uint64_t)*(v43 - 32);
      goto LABEL_23;
    case 13:
      v116 = 13;
      sub_23B46BC0C();
      v56 = v94;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v57 = v95;
      v55 = v96;
      goto LABEL_22;
    case 14:
      v116 = 14;
      sub_23B46BBC8();
      v56 = v97;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v57 = v98;
      v55 = v99;
      goto LABEL_22;
    case 15:
      v116 = 15;
      sub_23B46BB84();
      v56 = v100;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v57 = v101;
      v55 = v102;
      goto LABEL_22;
    case 16:
      v116 = 16;
      sub_23B46BB40();
      v56 = v103;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v57 = v104;
      v55 = v105;
      goto LABEL_22;
    case 17:
      v116 = 18;
      sub_23B46BAB8();
      v56 = v108;
      v35 = v113;
      v34 = v114;
      sub_23B483740();
      v57 = v110;
      v55 = v111;
LABEL_22:
      v41 = *(void (**)(char *, uint64_t))(v57 + 8);
      v42 = v56;
LABEL_23:
      v41(v42, v55);
LABEL_24:
      result = (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v35, v34);
      break;
    default:
      v116 = 17;
      sub_23B46BAFC();
      v36 = v106;
      v38 = v113;
      v37 = v114;
      sub_23B483740();
      v39 = v109;
      sub_23B483770();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v36, v39);
      result = (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v38, v37);
      break;
  }
  return result;
}

uint64_t FBKSInteraction.FeatureDomain.hashValue.getter()
{
  sub_23B483848();
  FBKSInteraction.FeatureDomain.hash(into:)();
  return sub_23B483878();
}

uint64_t FBKSInteraction.FeatureDomain.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v37[8];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;

  v84 = a2;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF10);
  v90 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v89 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF18);
  v37[6] = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v83 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF20);
  v67 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v82 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF28);
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v81 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF30);
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v80 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF38);
  v61 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v79 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF40);
  v59 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v78 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF48);
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v77 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF50);
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v76 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF58);
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v75 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF60);
  v45 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v88 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF68);
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v87 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF70);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v74 = (char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF78);
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v85 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF80);
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v73 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF88);
  v41 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v72 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF90);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v71 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AF98);
  v37[7] = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFA0);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFA8);
  v26 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v28 = (char *)v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1[3];
  v91 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_23B46BA74();
  v30 = v92;
  sub_23B483884();
  if (!v30)
  {
    v37[3] = v25;
    v37[1] = v23;
    v37[2] = v22;
    v37[4] = v21;
    v37[5] = 0;
    v92 = v26;
    v31 = v86;
    v32 = sub_23B483734();
    if (*(_QWORD *)(v32 + 16) == 1)
      __asm { BR              X10 }
    v33 = sub_23B483644();
    swift_allocError();
    v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v35 = &type metadata for FBKSInteraction.FeatureDomain;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26D0], v33);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v28, v31);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
}

void sub_23B45F518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 1;
  sub_23B46BF3C();
  v3 = *(_QWORD *)(v2 - 560);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 536) + 8))(v3, *(_QWORD *)(v2 - 528));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 1;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F5A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 2;
  sub_23B46BEF8();
  v3 = *(_QWORD *)(v2 - 264);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 520) + 8))(v3, *(_QWORD *)(v2 - 512));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 2;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 3;
  sub_23B46BEB4();
  v3 = *(_QWORD *)(v2 - 256);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 504) + 8))(v3, *(_QWORD *)(v2 - 496));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 3;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 4;
  sub_23B46BE70();
  v3 = *(_QWORD *)(v2 - 248);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 488) + 8))(v3, *(_QWORD *)(v2 - 480));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 4;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v3 - 65) = 5;
  sub_23B46BE2C();
  v4 = *(_QWORD *)(v3 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 464) + 8))(v0, *(_QWORD *)(v3 - 456));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8))(v2, v1);
    v5 = *(_QWORD **)(v3 - 160);
    *v5 = 0;
    v5[1] = 5;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F7C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 6;
  sub_23B46BDE8();
  v3 = *(_QWORD *)(v2 - 240);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 448) + 8))(v3, *(_QWORD *)(v2 - 440));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 6;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F84C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v3 - 65) = 7;
  sub_23B46BDA4();
  v4 = *(_QWORD *)(v3 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 432) + 8))(v0, *(_QWORD *)(v3 - 424));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8))(v2, v1);
    v5 = *(_QWORD **)(v3 - 160);
    *v5 = 0;
    v5[1] = 7;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F8D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v3 - 65) = 8;
  sub_23B46BD60();
  v4 = *(_QWORD *)(v3 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 472) + 8))(v0, *(_QWORD *)(v3 - 416));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8))(v2, v1);
    v5 = *(_QWORD **)(v3 - 160);
    *v5 = 0;
    v5[1] = 8;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 9;
  sub_23B46BD1C();
  v3 = *(_QWORD *)(v2 - 232);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 408) + 8))(v3, *(_QWORD *)(v2 - 400));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 9;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45F9DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 10;
  sub_23B46BCD8();
  v3 = *(_QWORD *)(v2 - 224);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 392) + 8))(v3, *(_QWORD *)(v2 - 384));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 10;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FA64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 11;
  sub_23B46BC94();
  v3 = *(_QWORD *)(v2 - 216);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 376) + 8))(v3, *(_QWORD *)(v2 - 368));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 11;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FAEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 12;
  sub_23B46BC50();
  v3 = *(_QWORD *)(v2 - 208);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 360) + 8))(v3, *(_QWORD *)(v2 - 352));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 12;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FB74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 13;
  sub_23B46BC0C();
  v3 = *(_QWORD *)(v2 - 200);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 344) + 8))(v3, *(_QWORD *)(v2 - 336));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 13;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FBFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 14;
  sub_23B46BBC8();
  v3 = *(_QWORD *)(v2 - 192);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 328) + 8))(v3, *(_QWORD *)(v2 - 320));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 14;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FC84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 15;
  sub_23B46BB84();
  v3 = *(_QWORD *)(v2 - 184);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 312) + 8))(v3, *(_QWORD *)(v2 - 304));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 15;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 65) = 16;
  sub_23B46BB40();
  v3 = *(_QWORD *)(v2 - 176);
  v4 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 296) + 8))(v3, *(_QWORD *)(v2 - 288));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 160);
    *v5 = 0;
    v5[1] = 16;
    JUMPOUT(0x23B45F4F0);
  }
  JUMPOUT(0x23B45F4D0);
}

void sub_23B45FD94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v2 - 65) = 17;
  sub_23B46BAFC();
  v3 = *(_QWORD *)(v2 - 168);
  v4 = v0;
  v5 = *(_QWORD *)(v2 - 552);
  sub_23B4836BC();
  if (v5)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B45F4E8);
  }
  v6 = *(_QWORD *)(v2 - 280);
  sub_23B4836F8();
  v7 = *(_QWORD *)(v2 - 96);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 544) + 8))(v3, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v4);
  JUMPOUT(0x23B45FF74);
}

void sub_23B45FDF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 65) = 18;
  sub_23B46BAB8();
  v5 = *(_QWORD *)(v4 - 552);
  sub_23B4836BC();
  if (v5)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v3, v1);
    JUMPOUT(0x23B45F4F0);
  }
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v0, *(_QWORD *)(v4 - 272));
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v3, v1);
  JUMPOUT(0x23B45FF7CLL);
}

uint64_t sub_23B45FF88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSInteraction.FeatureDomain.init(from:)(a1, a2);
}

uint64_t sub_23B45FF9C(_QWORD *a1)
{
  return FBKSInteraction.FeatureDomain.encode(to:)(a1);
}

uint64_t sub_23B45FFB0@<X0>(_QWORD *a1@<X8>)
{
  return sub_23B4657F4(&qword_256A1A518, &qword_256A1AD00, a1);
}

uint64_t sub_23B45FFD0()
{
  sub_23B483848();
  FBKSInteraction.FeatureDomain.hash(into:)();
  return sub_23B483878();
}

uint64_t sub_23B46001C()
{
  sub_23B483848();
  FBKSInteraction.FeatureDomain.hash(into:)();
  return sub_23B483878();
}

uint64_t sub_23B460060()
{
  sub_23B483848();
  sub_23B48347C();
  return sub_23B483878();
}

uint64_t sub_23B4600B4()
{
  return sub_23B48347C();
}

uint64_t sub_23B4600D0()
{
  sub_23B483848();
  sub_23B48347C();
  return sub_23B483878();
}

uint64_t sub_23B460120@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23B4836B0();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_23B460170(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x800000023B48CE00;
}

double FBKSInteraction.StructuredValue.init(_:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  char v6;
  __int128 v7;
  char v8;

  static FBKSInteraction.StructuredValue.wrap(_:)(a1, (uint64_t)&v7);
  __swift_destroy_boxed_opaque_existential_0(a1);
  if (!v2)
  {
    v6 = v8;
    result = *(double *)&v7;
    *(_OWORD *)a2 = v7;
    *(_BYTE *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t static FBKSInteraction.StructuredValue.wrap(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  char v19;
  uint64_t v20[4];
  _BYTE v21[32];
  uint64_t v22;

  sub_23B43F084(a1, (uint64_t)v21);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *(_QWORD *)a2 = LOBYTE(v20[0]);
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) = 0;
    return result;
  }
  sub_23B43F084(a1, (uint64_t)v21);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *(_QWORD *)a2 = v20[0];
    *(_QWORD *)(a2 + 8) = 0;
    v6 = 1;
LABEL_26:
    *(_BYTE *)(a2 + 16) = v6;
    return result;
  }
  sub_23B43F084(a1, (uint64_t)v21);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *(_QWORD *)a2 = v20[0];
    *(_QWORD *)(a2 + 8) = 0;
    v6 = 2;
    goto LABEL_26;
  }
  sub_23B43F084(a1, (uint64_t)v21);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v7 = v20[1];
    *(_QWORD *)a2 = v20[0];
    *(_QWORD *)(a2 + 8) = v7;
    v6 = 3;
    goto LABEL_26;
  }
  sub_23B43F084(a1, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFB0);
  if (!swift_dynamicCast())
  {
    sub_23B43F084(a1, (uint64_t)v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFB8);
    if (!swift_dynamicCast())
    {
      sub_23B46BFC4();
      swift_allocError();
      return swift_willThrow();
    }
    v16 = sub_23B468B80(v20[0]);
    result = swift_bridgeObjectRelease();
    if (v2)
      return result;
    *(_QWORD *)a2 = v16;
    *(_QWORD *)(a2 + 8) = 0;
    v6 = 5;
    goto LABEL_26;
  }
  v8 = *(_QWORD *)(v20[0] + 16);
  if (!v8)
  {
    result = swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
LABEL_25:
    *(_QWORD *)a2 = v12;
    *(_QWORD *)(a2 + 8) = 0;
    v6 = 4;
    goto LABEL_26;
  }
  v22 = MEMORY[0x24BEE4AF8];
  sub_23B43E2DC(0, v8, 0);
  v9 = v20[0] + 32;
  while (1)
  {
    sub_23B43F084(v9, (uint64_t)v21);
    sub_23B43F084((uint64_t)v21, (uint64_t)v20);
    static FBKSInteraction.StructuredValue.wrap(_:)(v18, v20);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
    if (v2)
      break;
    v10 = v18[0];
    v17 = v18[1];
    v11 = v19;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
    v12 = v22;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_23B43E2DC(0, *(_QWORD *)(v12 + 16) + 1, 1);
      v12 = v22;
    }
    v14 = *(_QWORD *)(v12 + 16);
    v13 = *(_QWORD *)(v12 + 24);
    if (v14 >= v13 >> 1)
    {
      sub_23B43E2DC(v13 > 1, v14 + 1, 1);
      v12 = v22;
    }
    *(_QWORD *)(v12 + 16) = v14 + 1;
    v15 = v12 + 24 * v14;
    *(_QWORD *)(v15 + 32) = v10;
    *(_QWORD *)(v15 + 40) = v17;
    *(_BYTE *)(v15 + 48) = v11;
    v9 += 32;
    if (!--v8)
    {
      result = swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  swift_bridgeObjectRelease();
  return swift_release();
}

void FBKSInteraction.StructuredValue.unwrap()()
{
  __asm { BR              X10 }
}

void sub_23B460594()
{
  uint64_t v0;
  char v1;

  *(_QWORD *)(v0 + 24) = MEMORY[0x24BEE1328];
  *(_BYTE *)v0 = v1 & 1;
}

uint64_t sub_23B460734(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X8 }
  }
  return 1;
}

void FBKSInteraction.StructuredValue.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_23B460B08()
{
  sub_23B483854();
  return sub_23B483860();
}

uint64_t sub_23B460B60()
{
  sub_23B483854();
  return sub_23B48347C();
}

uint64_t sub_23B460B8C()
{
  uint64_t v0;
  uint64_t v1;

  sub_23B483854();
  return sub_23B46A3BC(v1, v0);
}

uint64_t sub_23B460BB0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23B483854();
  return sub_23B4694D8(v1, v0);
}

uint64_t sub_23B460BD4(char a1)
{
  return *(_QWORD *)&aBool_0[8 * a1];
}

uint64_t sub_23B460BF4()
{
  sub_23B46C0D4();
  return sub_23B48389C();
}

uint64_t sub_23B460C1C()
{
  sub_23B46C0D4();
  return sub_23B4838A8();
}

uint64_t sub_23B460C44()
{
  sub_23B46C1E4();
  return sub_23B48389C();
}

uint64_t sub_23B460C6C()
{
  sub_23B46C1E4();
  return sub_23B4838A8();
}

uint64_t sub_23B460C94()
{
  char *v0;

  return sub_23B460BD4(*v0);
}

uint64_t sub_23B460C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46D23C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B460CC0(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23B460CCC()
{
  sub_23B46C008();
  return sub_23B48389C();
}

uint64_t sub_23B460CF4()
{
  sub_23B46C008();
  return sub_23B4838A8();
}

uint64_t sub_23B460D1C()
{
  sub_23B46C04C();
  return sub_23B48389C();
}

uint64_t sub_23B460D44()
{
  sub_23B46C04C();
  return sub_23B4838A8();
}

uint64_t sub_23B460D6C()
{
  sub_23B46C15C();
  return sub_23B48389C();
}

uint64_t sub_23B460D94()
{
  sub_23B46C15C();
  return sub_23B4838A8();
}

uint64_t sub_23B460DBC()
{
  sub_23B46C1A0();
  return sub_23B48389C();
}

uint64_t sub_23B460DE4()
{
  sub_23B46C1A0();
  return sub_23B4838A8();
}

uint64_t sub_23B460E0C()
{
  sub_23B46C118();
  return sub_23B48389C();
}

uint64_t sub_23B460E34()
{
  sub_23B46C118();
  return sub_23B4838A8();
}

void FBKSInteraction.StructuredValue.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  _QWORD v15[18];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFC8);
  v15[13] = *(_QWORD *)(v3 - 8);
  v15[14] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v15[12] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFD0);
  v15[10] = *(_QWORD *)(v5 - 8);
  v15[11] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v15[9] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFD8);
  v15[7] = *(_QWORD *)(v7 - 8);
  v15[8] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v15[6] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFE0);
  v15[4] = *(_QWORD *)(v9 - 8);
  v15[5] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v15[3] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFE8);
  v15[1] = *(_QWORD *)(v11 - 8);
  v15[2] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFF0);
  MEMORY[0x24BDAC7A8](v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1AFF8);
  v15[16] = *(_QWORD *)(v13 - 8);
  v15[17] = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15[15] = *(_QWORD *)v1;
  v15[0] = *(_QWORD *)(v1 + 8);
  v14 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B46C008();
  sub_23B483890();
  __asm { BR              X9 }
}

uint64_t sub_23B4610A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 88) = 0;
  sub_23B46C1E4();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23B483740();
  sub_23B48377C();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v1, v5);
}

uint64_t FBKSInteraction.StructuredValue.hashValue.getter()
{
  sub_23B483848();
  FBKSInteraction.StructuredValue.hash(into:)();
  return sub_23B483878();
}

uint64_t FBKSInteraction.StructuredValue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  _QWORD v28[5];
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
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;

  v45 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B060);
  v4 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  v37 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B068);
  v38 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v43 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B070);
  v34 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v41 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B078);
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v40 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B080);
  v30 = *(_QWORD *)(v10 - 8);
  v31 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v39 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B088);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B090);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_23B46C008();
  v21 = v47;
  sub_23B483884();
  if (!v21)
  {
    v28[4] = v15;
    v28[2] = v13;
    v28[3] = v12;
    v29 = v17;
    v47 = v19;
    v22 = sub_23B483734();
    if (*(_QWORD *)(v22 + 16) == 1)
    {
      v28[1] = v16;
      __asm { BR              X9 }
    }
    v23 = sub_23B483644();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v25 = &type metadata for FBKSInteraction.StructuredValue;
    v26 = v47;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v16);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
}

void sub_23B461828(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v3 - 96) = 1;
  sub_23B46C1A0();
  v5 = *(_QWORD *)(v3 - 168);
  v6 = *(_QWORD *)(v3 - 280);
  v7 = *(_QWORD *)(v3 - 104);
  sub_23B4836BC();
  if (v1)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B4617F4);
  }
  v8 = *(_QWORD *)(v3 - 232);
  v9 = sub_23B48371C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 240) + 8))(v5, v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 248) + 8))(v7, v6);
  v10 = *(_QWORD *)(v3 - 112);
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = v2;
  __swift_destroy_boxed_opaque_existential_0(v10);
  JUMPOUT(0x23B461800);
}

void sub_23B461894(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v3 - 96) = 2;
  sub_23B46C15C();
  v5 = *(_QWORD *)(v3 - 160);
  v6 = *(_QWORD *)(v3 - 104);
  sub_23B4836BC();
  if (v1)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B4617F4);
  }
  v7 = *(_QWORD *)(v3 - 216);
  sub_23B483710();
  v8 = *(_QWORD *)(v3 - 248);
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 224) + 8))(v5, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v8 + 8))(v6, *(_QWORD *)(v3 - 280));
  v11 = *(_QWORD *)(v3 - 112);
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = v2;
  __swift_destroy_boxed_opaque_existential_0(v11);
  JUMPOUT(0x23B461800);
}

void sub_23B461900()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)(v4 - 96) = 3;
  sub_23B46C118();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23B4836BC();
  if (v1)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B4617F4);
  }
  v6 = sub_23B4836F8();
  v7 = *(_QWORD *)(v4 - 248);
  v8 = v6;
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 208) + 8))(v0, v2);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v7 + 8))(v5, *(_QWORD *)(v4 - 280));
  v12 = *(_QWORD *)(v4 - 120);
  v11 = *(_QWORD *)(v4 - 112);
  *(_QWORD *)v12 = v8;
  *(_QWORD *)(v12 + 8) = v10;
  *(_BYTE *)(v12 + 16) = v3;
  __swift_destroy_boxed_opaque_existential_0(v11);
  JUMPOUT(0x23B461800);
}

void sub_23B461964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v2 - 96) = 4;
  sub_23B46C0D4();
  v3 = v1;
  v4 = *(_QWORD *)(v2 - 104);
  sub_23B4836BC();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B030);
    sub_23B46C2E0(&qword_256A1B0A8, (uint64_t (*)(void))sub_23B46C29C, MEMORY[0x24BEE12D0]);
    v5 = *(_QWORD *)(v2 - 200);
    sub_23B483728();
    v6 = *(_QWORD *)(v2 - 248);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v3, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD))(v6 + 8))(v4, *(_QWORD *)(v2 - 280));
    JUMPOUT(0x23B461D3CLL);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23B4617F4);
}

uint64_t sub_23B461D98@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSInteraction.StructuredValue.init(from:)(a1, a2);
}

void sub_23B461DAC(_QWORD *a1)
{
  FBKSInteraction.StructuredValue.encode(to:)(a1);
}

uint64_t sub_23B461DC4()
{
  sub_23B483848();
  FBKSInteraction.StructuredValue.hash(into:)();
  return sub_23B483878();
}

uint64_t sub_23B461E18()
{
  sub_23B483848();
  FBKSInteraction.StructuredValue.hash(into:)();
  return sub_23B483878();
}

uint64_t FBKSInteraction.Content.description.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B461E9C
                                                                     + 4
                                                                     * byte_23B486E60[*(unsigned __int8 *)(v0 + 32) >> 4]))(0xD000000000000010, 0x800000023B48E550);
}

uint64_t sub_23B461E9C()
{
  return 1954047316;
}

uint64_t sub_23B461EAC()
{
  return 0x6567616D49;
}

uint64_t sub_23B461EC0()
{
  return 0x6F69647541;
}

uint64_t sub_23B461ED4()
{
  return 0x74697277646E6148;
}

uint64_t sub_23B461EF4()
{
  return 0x686374656B53;
}

uint64_t sub_23B461F08()
{
  return 0x65542B6567616D49;
}

uint64_t sub_23B461F24()
{
  return 0x542B686374656B53;
}

uint64_t sub_23B461F44()
{
  return 0x6F65646956;
}

uint64_t sub_23B461F58()
{
  return 0x6320656372756F53;
}

uint64_t sub_23B461F78()
{
  return 0x7275746375727453;
}

uint64_t sub_23B461F94(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_23B461FAC()
{
  return 0x6163696669746F4ELL;
}

uint64_t sub_23B461FCC()
{
  return 0x73656D206C69614DLL;
}

uint64_t sub_23B461FEC()
{
  return 0x696A6F6D45;
}

uint64_t sub_23B462000()
{
  return 1280136264;
}

double sub_23B462010()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  __int128 v12;
  double result;
  __int128 v14;
  unsigned __int8 v15;
  _QWORD v16[3];
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7A0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23B48AA60;
  *(_OWORD *)(v0 + 32) = xmmword_23B48AA70;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  *(_BYTE *)(v0 + 64) = 0;
  *(_OWORD *)(v0 + 72) = xmmword_23B48AA80;
  *(_QWORD *)(v0 + 88) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 104) = 16;
  *(_OWORD *)(v0 + 112) = xmmword_23B48AA80;
  *(_QWORD *)(v0 + 128) = 0;
  *(_QWORD *)(v0 + 136) = 0;
  *(_BYTE *)(v0 + 144) = 32;
  *(_OWORD *)(v0 + 152) = xmmword_23B48AA80;
  *(_QWORD *)(v0 + 168) = 0;
  *(_QWORD *)(v0 + 176) = 0;
  *(_BYTE *)(v0 + 184) = 48;
  *(_OWORD *)(v0 + 192) = xmmword_23B48AA80;
  *(_QWORD *)(v0 + 208) = 0;
  *(_QWORD *)(v0 + 216) = 0;
  *(_BYTE *)(v0 + 224) = 64;
  *(_OWORD *)(v0 + 232) = xmmword_23B48AA80;
  *(_OWORD *)(v0 + 248) = xmmword_23B48AA70;
  *(_BYTE *)(v0 + 264) = 80;
  *(_OWORD *)(v0 + 272) = xmmword_23B48AA80;
  *(_OWORD *)(v0 + 288) = xmmword_23B48AA70;
  *(_BYTE *)(v0 + 304) = 96;
  *(_QWORD *)(v0 + 312) = 0;
  *(_QWORD *)(v0 + 320) = 0xC000000000000000;
  *(_QWORD *)(v0 + 328) = 0;
  *(_QWORD *)(v0 + 336) = 0;
  *(_BYTE *)(v0 + 344) = 112;
  *(_OWORD *)(v0 + 352) = xmmword_23B48AA70;
  *(_QWORD *)(v0 + 368) = 0;
  *(_QWORD *)(v0 + 376) = 0;
  *(_BYTE *)(v0 + 384) = 0x80;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7A8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B484E90;
  *(_QWORD *)(inited + 32) = 7955819;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = 0x65756C6176;
  *(_QWORD *)(inited + 56) = 0xE500000000000000;
  v2 = sub_23B473830(inited);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7B0);
  v17 = v3;
  v16[0] = v2;
  static FBKSInteraction.StructuredValue.wrap(_:)((uint64_t)v16, (uint64_t)&v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  v4 = v15;
  *(_OWORD *)(v0 + 392) = v14;
  *(_QWORD *)(v0 + 408) = v4;
  *(_QWORD *)(v0 + 416) = 0;
  *(_BYTE *)(v0 + 424) = -112;
  v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_23B484E90;
  *(_QWORD *)(v5 + 32) = 7955819;
  *(_QWORD *)(v5 + 40) = 0xE300000000000000;
  *(_QWORD *)(v5 + 48) = 0x65756C6176;
  *(_QWORD *)(v5 + 56) = 0xE500000000000000;
  v6 = sub_23B473830(v5);
  v17 = v3;
  v16[0] = v6;
  static FBKSInteraction.StructuredValue.wrap(_:)((uint64_t)v16, (uint64_t)&v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  v7 = v15 | 0xA0;
  v8 = v14;
  *(_OWORD *)(v0 + 432) = xmmword_23B48AA80;
  *(_OWORD *)(v0 + 448) = v8;
  *(_BYTE *)(v0 + 464) = v7;
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_23B484E90;
  *(_QWORD *)(v9 + 32) = 7955819;
  *(_QWORD *)(v9 + 40) = 0xE300000000000000;
  *(_QWORD *)(v9 + 48) = 0x65756C6176;
  *(_QWORD *)(v9 + 56) = 0xE500000000000000;
  v10 = sub_23B473830(v9);
  v17 = v3;
  v16[0] = v10;
  static FBKSInteraction.StructuredValue.wrap(_:)((uint64_t)v16, (uint64_t)&v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  v11 = v15 | 0xB0;
  v12 = v14;
  *(_QWORD *)(v0 + 472) = 0;
  *(_QWORD *)(v0 + 480) = 0xC000000000000000;
  *(_OWORD *)(v0 + 488) = v12;
  *(_BYTE *)(v0 + 504) = v11;
  result = 0.0;
  *(_OWORD *)(v0 + 512) = xmmword_23B48AA70;
  *(_OWORD *)(v0 + 528) = 0u;
  *(_BYTE *)(v0 + 544) = -64;
  *(_QWORD *)(v0 + 552) = 1954047348;
  *(_QWORD *)(v0 + 560) = 0xE400000000000000;
  *(_OWORD *)(v0 + 568) = 0u;
  *(_BYTE *)(v0 + 584) = -48;
  *(_OWORD *)(v0 + 592) = xmmword_23B48AA80;
  *(_OWORD *)(v0 + 608) = 0u;
  *(_BYTE *)(v0 + 624) = -32;
  *(_QWORD *)(v0 + 632) = 1954047348;
  *(_QWORD *)(v0 + 640) = 0xE400000000000000;
  *(_OWORD *)(v0 + 648) = 0u;
  *(_BYTE *)(v0 + 664) = -16;
  qword_256A1AD08 = v0;
  return result;
}

uint64_t static FBKSInteraction.Content.allCases.getter()
{
  return sub_23B462378(&qword_256A1A520);
}

uint64_t sub_23B462378(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static FBKSInteraction.Content.allCases.setter(uint64_t a1)
{
  return sub_23B4623EC(a1, &qword_256A1A520, &qword_256A1AD08);
}

uint64_t sub_23B4623EC(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FBKSInteraction.Content.allCases.modify())()
{
  if (qword_256A1A520 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void FBKSInteraction.Content.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_23B462508()
{
  sub_23B483854();
  return sub_23B48347C();
}

uint64_t sub_23B4626D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B462710 + 4 * byte_23B486E80[a1]))(0xD000000000000010, 0x800000023B48E770);
}

uint64_t sub_23B462710()
{
  return 1954047348;
}

uint64_t sub_23B462720()
{
  return 0x6567616D69;
}

uint64_t sub_23B462734()
{
  return 0x6F69647561;
}

uint64_t sub_23B462748()
{
  return 0x74697277646E6168;
}

uint64_t sub_23B462768()
{
  return 0x686374656B73;
}

uint64_t sub_23B46277C()
{
  return 0x7865546567616D69;
}

uint64_t sub_23B462798()
{
  return 0x6554686374656B73;
}

uint64_t sub_23B4627B4()
{
  return 0x6F65646976;
}

uint64_t sub_23B4627C8()
{
  return 0x6F43656372756F73;
}

uint64_t sub_23B4627E8()
{
  return 0x7275746375727473;
}

uint64_t sub_23B462804()
{
  return 0x7274536567616D69;
}

uint64_t sub_23B462828()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_23B462848()
{
  return 0x7373654D6C69616DLL;
}

uint64_t sub_23B462868()
{
  return 0x696A6F6D65;
}

uint64_t sub_23B46287C()
{
  return 1819112552;
}

uint64_t sub_23B46288C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7275746375727473;
  else
    return 0x6567616D69;
}

uint64_t sub_23B4628C4(char a1)
{
  if ((a1 & 1) != 0)
    return 1954047348;
  else
    return 0x6567616D69;
}

uint64_t sub_23B4628F0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7275746375727473;
  else
    return 0x686374656B73;
}

uint64_t sub_23B462928(char a1)
{
  if ((a1 & 1) != 0)
    return 1954047348;
  else
    return 0x686374656B73;
}

uint64_t sub_23B462954()
{
  sub_23B46C744();
  return sub_23B48389C();
}

uint64_t sub_23B46297C()
{
  sub_23B46C744();
  return sub_23B4838A8();
}

uint64_t sub_23B4629A4()
{
  unsigned __int8 *v0;

  return sub_23B4626D8(*v0);
}

uint64_t sub_23B4629AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46D474(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B4629D0(_BYTE *a1@<X8>)
{
  *a1 = 16;
}

uint64_t sub_23B4629DC()
{
  sub_23B46C348();
  return sub_23B48389C();
}

uint64_t sub_23B462A04()
{
  sub_23B46C348();
  return sub_23B4838A8();
}

uint64_t sub_23B462A2C()
{
  sub_23B46C3D0();
  return sub_23B48389C();
}

uint64_t sub_23B462A54()
{
  sub_23B46C3D0();
  return sub_23B4838A8();
}

uint64_t sub_23B462A7C()
{
  sub_23B46C700();
  return sub_23B48389C();
}

uint64_t sub_23B462AA4()
{
  sub_23B46C700();
  return sub_23B4838A8();
}

uint64_t sub_23B462ACC()
{
  sub_23B46C38C();
  return sub_23B48389C();
}

uint64_t sub_23B462AF4()
{
  sub_23B46C38C();
  return sub_23B4838A8();
}

uint64_t sub_23B462B1C()
{
  sub_23B46C788();
  return sub_23B48389C();
}

uint64_t sub_23B462B44()
{
  sub_23B46C788();
  return sub_23B4838A8();
}

uint64_t sub_23B462B6C()
{
  char *v0;

  return sub_23B46288C(*v0);
}

uint64_t sub_23B462B74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46DA80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B462B98()
{
  sub_23B46C524();
  return sub_23B48389C();
}

uint64_t sub_23B462BC0()
{
  sub_23B46C524();
  return sub_23B4838A8();
}

uint64_t sub_23B462BE8()
{
  char *v0;

  return sub_23B4628C4(*v0);
}

uint64_t sub_23B462BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46DB68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B462C14()
{
  sub_23B46C678();
  return sub_23B48389C();
}

uint64_t sub_23B462C3C()
{
  sub_23B46C678();
  return sub_23B4838A8();
}

uint64_t sub_23B462C64()
{
  sub_23B46C458();
  return sub_23B48389C();
}

uint64_t sub_23B462C8C()
{
  sub_23B46C458();
  return sub_23B4838A8();
}

uint64_t sub_23B462CB4()
{
  sub_23B46C49C();
  return sub_23B48389C();
}

uint64_t sub_23B462CDC()
{
  sub_23B46C49C();
  return sub_23B4838A8();
}

uint64_t sub_23B462D04()
{
  sub_23B46C6BC();
  return sub_23B48389C();
}

uint64_t sub_23B462D2C()
{
  sub_23B46C6BC();
  return sub_23B4838A8();
}

uint64_t sub_23B462D54()
{
  char *v0;

  return sub_23B4628F0(*v0);
}

uint64_t sub_23B462D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46DC38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B462D80()
{
  sub_23B46C4E0();
  return sub_23B48389C();
}

uint64_t sub_23B462DA8()
{
  sub_23B46C4E0();
  return sub_23B4838A8();
}

uint64_t sub_23B462DD0()
{
  char *v0;

  return sub_23B462928(*v0);
}

uint64_t sub_23B462DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46DD20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B462DFC()
{
  sub_23B46C634();
  return sub_23B48389C();
}

uint64_t sub_23B462E24()
{
  sub_23B46C634();
  return sub_23B4838A8();
}

uint64_t sub_23B462E4C()
{
  sub_23B46C5AC();
  return sub_23B48389C();
}

uint64_t sub_23B462E74()
{
  sub_23B46C5AC();
  return sub_23B4838A8();
}

uint64_t sub_23B462E9C()
{
  sub_23B46C568();
  return sub_23B48389C();
}

uint64_t sub_23B462EC4()
{
  sub_23B46C568();
  return sub_23B4838A8();
}

uint64_t sub_23B462EEC()
{
  sub_23B46C7CC();
  return sub_23B48389C();
}

uint64_t sub_23B462F14()
{
  sub_23B46C7CC();
  return sub_23B4838A8();
}

uint64_t sub_23B462F3C()
{
  sub_23B46C5F0();
  return sub_23B48389C();
}

uint64_t sub_23B462F64()
{
  sub_23B46C5F0();
  return sub_23B4838A8();
}

void FBKSInteraction.Content.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;

  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0B0);
  v64 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v63 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0B8);
  v62 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v60 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0C0);
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v52 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0C8);
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v49 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0D0);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v58 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0D8);
  v54 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v53 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0E0);
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v46 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0E8);
  v40 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v38 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0F0);
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v36 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B0F8);
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v42 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B100);
  v35 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v34 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B108);
  v32 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v31 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B110);
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v28 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B118);
  v26 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B120);
  v23 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B128);
  MEMORY[0x24BDAC7A8](v17);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B130);
  v71 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = v1[1];
  v69 = *v1;
  v70 = v20;
  v21 = v1[2];
  v67 = v1[3];
  v68 = v21;
  v22 = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B46C348();
  v72 = v19;
  sub_23B483890();
  __asm { BR              X10 }
}

uint64_t sub_23B46352C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 112) = 0;
  sub_23B46C7CC();
  v5 = *(_QWORD *)(v3 - 128);
  v4 = *(_QWORD *)(v3 - 120);
  sub_23B483740();
  sub_23B483770();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 136) + 8))(v5, v4);
}

void sub_23B463D24()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 - 112) = 14;
  v2 = *(_QWORD *)(v0 - 152);
  v1 = *(_QWORD *)(v0 - 144);
  sub_23B446D90(v2, v1);
  sub_23B46C3D0();
  sub_23B483740();
  *(_QWORD *)(v0 - 112) = v2;
  *(_QWORD *)(v0 - 104) = v1;
  sub_23B46C414();
  sub_23B4837A0();
  JUMPOUT(0x23B46399CLL);
}

void sub_23B463DA4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 15;
  sub_23B46C38C();
  sub_23B483740();
  sub_23B483770();
  JUMPOUT(0x23B463CDCLL);
}

uint64_t FBKSInteraction.Content.hashValue.getter()
{
  sub_23B483848();
  FBKSInteraction.Content.hash(into:)();
  return sub_23B483878();
}

uint64_t FBKSInteraction.Content.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v36[8];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;

  v73 = a2;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1C8);
  v62 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v68 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1D0);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v72 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1D8);
  v55 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v70 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1E0);
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v78 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1E8);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v71 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1F0);
  v54 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v69 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B1F8);
  v51 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v77 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B200);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v67 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B208);
  v42 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v66 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B210);
  v43 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v65 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B218);
  v44 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v76 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B220);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v75 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B228);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v64 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B230);
  v36[7] = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v63 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B238);
  v36[6] = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v18 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B240);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B248);
  v23 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v25 = (char *)v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = a1[3];
  v81 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_23B46C348();
  v27 = v82;
  sub_23B483884();
  if (v27)
  {
    v28 = (uint64_t)v81;
  }
  else
  {
    v36[2] = v22;
    v36[1] = v20;
    v36[0] = v19;
    v36[3] = v18;
    v36[5] = 0;
    v82 = v23;
    v29 = v25;
    v30 = sub_23B483734();
    if (*(_QWORD *)(v30 + 16) == 1)
    {
      v36[4] = v25;
      __asm { BR              X10 }
    }
    v31 = sub_23B483644();
    swift_allocError();
    v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v33 = &type metadata for FBKSInteraction.Content;
    v34 = v80;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v33, *MEMORY[0x24BEE26D0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v29, v34);
    v28 = (uint64_t)v81;
  }
  return __swift_destroy_boxed_opaque_existential_0(v28);
}

uint64_t sub_23B46570C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSInteraction.Content.init(from:)(a1, a2);
}

void sub_23B465720(_QWORD *a1)
{
  FBKSInteraction.Content.encode(to:)(a1);
}

uint64_t sub_23B465738()
{
  sub_23B483848();
  FBKSInteraction.Content.hash(into:)();
  return sub_23B483878();
}

uint64_t sub_23B46578C()
{
  sub_23B483848();
  FBKSInteraction.Content.hash(into:)();
  return sub_23B483878();
}

uint64_t sub_23B4657D8@<X0>(_QWORD *a1@<X8>)
{
  return sub_23B4657F4(&qword_256A1A520, &qword_256A1AD08, a1);
}

uint64_t sub_23B4657F4@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B465858@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return sub_23B45B45C(v4, v5);
}

uint64_t sub_23B4658AC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  *v4 = v2;
  v4[1] = v3;
  sub_23B45B45C(v2, v3);
  return sub_23B45B370(v5, v6);
}

void sub_23B465924()
{
  qword_256A1AD10 = 0x6170206472696854;
  *(_QWORD *)algn_256A1AD18 = 0xEB00000000797472;
}

uint64_t static FBKSInteraction.thirdPartyBundleID.getter()
{
  uint64_t v0;

  if (qword_256A1A528 != -1)
    swift_once();
  v0 = qword_256A1AD10;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_23B4659AC@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (uint64_t *)(*(_QWORD *)result + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID);
  v4 = *v3;
  v5 = v3[1];
  if (v5)
  {
    swift_bridgeObjectRetain();
    result = sub_23B465A60();
    if ((result & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_256A1A528 != -1)
        swift_once();
      v4 = qword_256A1AD10;
      v5 = *(_QWORD *)algn_256A1AD18;
      result = swift_bridgeObjectRetain();
    }
  }
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_23B465A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_23B483494();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_23B483494();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_23B4837D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_23B483494();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_23B483494();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_23B465BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 <= 0xF7u)
    sub_23B465BD8(a1, a2, a3, a4, a5);
}

void sub_23B465BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __asm { BR              X10 }
}

uint64_t sub_23B465C0C(uint64_t a1, unint64_t a2)
{
  return sub_23B446D90(a1, a2);
}

uint64_t sub_23B465C1C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B465C3C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = a5 & 0xF;
  sub_23B446D90(a1, a2);
  return sub_23B448820(v6, v5, v7);
}

void sub_23B465C68(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *a1 + *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)(v4 + 8);
  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)a3 = *(_QWORD *)v4;
  *(_QWORD *)(a3 + 8) = v6;
  *(_QWORD *)(a3 + 16) = v7;
  *(_QWORD *)(a3 + 24) = v8;
  v9 = *(_BYTE *)(v4 + 32);
  *(_BYTE *)(a3 + 32) = v9;
  sub_23B465BC4(v5, v6, v7, v8, v9);
}

void sub_23B465CC8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *a2 + *a5;
  v10 = *(_BYTE *)(a1 + 32);
  swift_beginAccess();
  v11 = *(_QWORD *)(v9 + 8);
  v15 = *(_QWORD *)v9;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  *(_QWORD *)v9 = v5;
  *(_QWORD *)(v9 + 8) = v6;
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v8;
  v14 = *(_BYTE *)(v9 + 32);
  *(_BYTE *)(v9 + 32) = v10;
  sub_23B465BC4(v5, v6, v7, v8, v10);
  sub_23B45A430(v15, v11, v12, v13, v14);
}

uint64_t sub_23B465D80(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B465DE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_23B448908(a1, (uint64_t)&v13 - v8, &qword_256A1A650);
  v10 = *a2;
  sub_23B448908((uint64_t)v9, (uint64_t)v7, &qword_256A1A650);
  v11 = v10 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448990((uint64_t)v7, v11);
  swift_endAccess();
  return sub_23B448B30((uint64_t)v9, &qword_256A1A650);
}

unint64_t sub_23B465F10()
{
  uint64_t v0;
  uint64_t *v1;
  unint64_t v2;
  unint64_t v3;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_featureDomain);
  swift_beginAccess();
  v3 = *v1;
  v2 = v1[1];
  switch(v2)
  {
    case 0uLL:
    case 3uLL:
    case 7uLL:
      v3 = 0xD000000000000010;
      break;
    case 1uLL:
      v3 = 0x432079726F6D654DLL;
      break;
    case 2uLL:
      v3 = 0x74697277646E6148;
      break;
    case 4uLL:
      v3 = 0x4520656369766544;
      break;
    case 5uLL:
      v3 = 0x20676E6974697257;
      break;
    case 6uLL:
      v3 = 0x6552207472616D53;
      break;
    case 8uLL:
      v3 = 0xD000000000000012;
      break;
    case 9uLL:
      v3 = 0x676948206C69614DLL;
      break;
    case 0xAuLL:
      v3 = 0xD000000000000016;
      break;
    case 0xBuLL:
      v3 = 0xD00000000000001BLL;
      break;
    case 0xCuLL:
      v3 = 0xD000000000000018;
      break;
    case 0xDuLL:
      v3 = 0xD00000000000001ALL;
      break;
    case 0xEuLL:
      v3 = 0x615020636967614DLL;
      break;
    case 0xFuLL:
      v3 = 0x7341207466697753;
      break;
    case 0x10uLL:
      v3 = 0x4320736F746F6850;
      break;
    case 0x11uLL:
      v3 = 1953719636;
      break;
    default:
      break;
  }
  sub_23B45B45C(*v1, v2);
  return v3;
}

char *FBKSInteraction.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11, uint64_t a12)
{
  objc_class *v12;
  id v19;

  v19 = objc_allocWithZone(v12);
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11, a12);
}

char *FBKSInteraction.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11)
{
  objc_class *v11;
  id v19;

  v19 = objc_allocWithZone(v11);
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11);
}

void sub_23B4662E8(void *a1, void (*a2)(void))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v15);
    sub_23B4835D8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      ((void (*)(void *))a2)(a1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44CE5C();
  v14 = (void *)swift_allocError();
  a2();

}

uint64_t sub_23B466500(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x23B865310](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (_BYTE *)(v6 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
    swift_beginAccess();
    *v8 = 1;

  }
  return a3(a1);
}

uint64_t sub_23B466598(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_23B45BDE8((void (*)(void))sub_23B472CF8, v6);
  return swift_release();
}

void sub_23B466674(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t), uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A758);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (id *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23B448908(a1, (uint64_t)v11, &qword_256A1A758);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = *v11;
    v13 = *v11;
    a3(v12, 1);

  }
  else
  {
    sub_23B448B30((uint64_t)v11, &qword_256A1A758);
    v14 = (_BYTE *)(a2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
    swift_beginAccess();
    if (*v14 == 1)
    {
      if (qword_256A1A4E0 != -1)
        swift_once();
      v15 = sub_23B4833E0();
      __swift_project_value_buffer(v15, (uint64_t)qword_256A1BC98);
      v16 = sub_23B4833C8();
      v17 = sub_23B4835A8();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_23B433000, v16, v17, "Resetting sentPresented after successful evaluation", v18, 2u);
        MEMORY[0x23B86528C](v18, -1, -1);
      }

      *v14 = 0;
    }
    a3(a5, 0);
  }
}

uint64_t sub_23B466850(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17[3];
  char v18;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7D0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v18 = a3;
  v17[0] = a4;
  v17[1] = a5;
  v17[2] = a6;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  sub_23B45C528(&v18, v17, (void (*)(id, uint64_t))sub_23B472C7C, v15);
  return swift_release();
}

uint64_t sub_23B46695C(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7D0);
    return sub_23B483530();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7D0);
    return sub_23B48353C();
  }
}

id FBKSInteraction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKSInteraction.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B466A40(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B466A78 + 4 * byte_23B486EF2[a1]))(0xD000000000000010, 0x800000023B48E610);
}

uint64_t sub_23B466A78()
{
  return 0x4465727574616566;
}

uint64_t sub_23B466A9C()
{
  return 0x49656C646E75625FLL;
}

uint64_t sub_23B466AB8()
{
  return 0x6C616E696769726FLL;
}

uint64_t sub_23B466B3C()
{
  return 0x7250686769487369;
}

uint64_t sub_23B466B60()
{
  return 0x7461756C6176655FLL;
}

uint64_t sub_23B466B84()
{
  return 0x73657250746E6573;
}

uint64_t sub_23B466BA8()
{
  return 0x6176457473726966;
}

uint64_t sub_23B466BCC()
{
  unsigned __int8 *v0;

  return sub_23B466A40(*v0);
}

uint64_t sub_23B466BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46DDF0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B466BF8(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_23B466C04()
{
  sub_23B45B32C();
  return sub_23B48389C();
}

uint64_t sub_23B466C2C()
{
  sub_23B45B32C();
  return sub_23B4838A8();
}

id FBKSInteraction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSInteraction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id FBKSInteraction.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSInteraction.init(from:)(a1);
}

uint64_t sub_23B466DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 576))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_23B466DD0(_QWORD *a1)
{
  return sub_23B45CBE4(a1);
}

uint64_t FBKSInteraction.EvaluationResponse.description.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23B466E28
                                                            + 4 * byte_23B486EFE[*(unsigned __int8 *)(v0 + 24)]))(0x752073626D756854, 0xE900000000000070);
}

uint64_t sub_23B466E28()
{
  return 0x642073626D756854;
}

uint64_t sub_23B466E48()
{
  return 0x632074726F706552;
}

uint64_t sub_23B466E6C()
{
  _QWORD *v0;

  if (v0[1] | v0[2] | *v0)
    return 0x657373696D736944;
  else
    return 0x6E776F6E6B6E55;
}

uint64_t sub_23B466EB0(char a1)
{
  return *(_QWORD *)&aUnknown_2[8 * a1];
}

uint64_t sub_23B466ED0()
{
  char *v0;

  return sub_23B466EB0(*v0);
}

uint64_t sub_23B466ED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B46E320(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B466EFC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23B466F08()
{
  sub_23B46C854();
  return sub_23B48389C();
}

uint64_t sub_23B466F30()
{
  sub_23B46C854();
  return sub_23B4838A8();
}

uint64_t sub_23B466F58()
{
  sub_23B46C964();
  return sub_23B48389C();
}

uint64_t sub_23B466F80()
{
  sub_23B46C964();
  return sub_23B4838A8();
}

uint64_t sub_23B466FA8()
{
  sub_23B46C898();
  return sub_23B48389C();
}

uint64_t sub_23B466FD0()
{
  sub_23B46C898();
  return sub_23B4838A8();
}

uint64_t sub_23B466FF8()
{
  sub_23B46C8DC();
  return sub_23B48389C();
}

uint64_t sub_23B467020()
{
  sub_23B46C8DC();
  return sub_23B4838A8();
}

uint64_t sub_23B467048()
{
  sub_23B46C920();
  return sub_23B48389C();
}

uint64_t sub_23B467070()
{
  sub_23B46C920();
  return sub_23B4838A8();
}

uint64_t sub_23B467098()
{
  sub_23B46C9A8();
  return sub_23B48389C();
}

uint64_t sub_23B4670C0()
{
  sub_23B46C9A8();
  return sub_23B4838A8();
}

void FBKSInteraction.EvaluationResponse.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B258);
  v24 = *(_QWORD *)(v3 - 8);
  v25 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v23 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B260);
  v21 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v20 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B268);
  v18 = *(_QWORD *)(v7 - 8);
  v19 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v17 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B270);
  v15 = *(_QWORD *)(v9 - 8);
  v16 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B278);
  MEMORY[0x24BDAC7A8](v14);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B280);
  v29 = *(_QWORD *)(v10 - 8);
  v30 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v11 = *v1;
  v26 = v1[1];
  v27 = v11;
  v28 = v1[2];
  v12 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B46C854();
  sub_23B483890();
  __asm { BR              X9 }
}

uint64_t sub_23B4672EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 - 112) = 2;
  sub_23B46C920();
  v2 = *(_QWORD *)(v1 - 224);
  v3 = *(_QWORD *)(v1 - 120);
  sub_23B483740();
  v4 = *(_QWORD *)(v1 - 152);
  *(_QWORD *)(v1 - 112) = *(_QWORD *)(v1 - 144);
  *(_QWORD *)(v1 - 104) = v4;
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(v1 - 136);
  sub_23B446EB8();
  v5 = *(_QWORD *)(v1 - 208);
  sub_23B483764();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 216) + 8))(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 128) + 8))(v0, v3);
}

uint64_t FBKSInteraction.EvaluationResponse.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v38 = a2;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2B8);
  v37 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v36 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2C0);
  v5 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  v32 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2C8);
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2D0);
  v27[4] = *(_QWORD *)(v9 - 8);
  v27[5] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2D8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2E0);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23B46C854();
  v20 = v40;
  sub_23B483884();
  if (!v20)
  {
    v27[2] = v11;
    v27[3] = v14;
    v27[1] = v12;
    v40 = v16;
    v21 = sub_23B483734();
    v22 = v15;
    if (*(_QWORD *)(v21 + 16) == 1)
      __asm { BR              X10 }
    v23 = sub_23B483644();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v25 = &type metadata for FBKSInteraction.EvaluationResponse;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v22);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
}

void sub_23B467910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 112) = 1;
  sub_23B46C964();
  v5 = *(_QWORD *)(v4 - 168);
  sub_23B4836BC();
  if (!v2)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 224) + 8))(v5, *(_QWORD *)(v4 - 216));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 72) + 8))(v0, v1);
    *(_OWORD *)v3 = xmmword_23B48A950;
    *(_QWORD *)(v3 + 16) = 0;
    *(_BYTE *)(v3 + 24) = 3;
    JUMPOUT(0x23B4678E8);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23B4678E0);
}

void sub_23B4679FC()
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
  uint64_t v9;

  *(_BYTE *)(v5 - 112) = 3;
  sub_23B46C8DC();
  v6 = v1;
  sub_23B4836BC();
  if (v2)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B4678E0);
  }
  sub_23B446F40();
  v7 = *(_QWORD *)(v5 - 184);
  sub_23B4836EC();
  v8 = *(_QWORD *)(v5 - 72);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 176) + 8))(v4, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  v9 = *(_QWORD *)(v5 - 96);
  *(_OWORD *)v3 = *(_OWORD *)(v5 - 112);
  *(_QWORD *)(v3 + 16) = v9;
  *(_BYTE *)(v3 + 24) = 1;
  JUMPOUT(0x23B4678E8);
}

void sub_23B467A54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = v3;
  *(_QWORD *)(v6 - 152) = a1;
  *(_BYTE *)(v6 - 112) = 4;
  sub_23B46C898();
  v8 = v4;
  v9 = v2;
  sub_23B4836BC();
  if (v5)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23B4678DCLL);
  }
  sub_23B446F40();
  v10 = *(_QWORD *)(v6 - 208);
  sub_23B4836EC();
  v11 = *(_QWORD *)(v6 - 72);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  JUMPOUT(0x23B467C94);
}

uint64_t sub_23B467CAC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSInteraction.EvaluationResponse.init(from:)(a1, a2);
}

void sub_23B467CC0(_QWORD *a1)
{
  FBKSInteraction.EvaluationResponse.encode(to:)(a1);
}

void static FBKSInteraction.userResponse(id:)(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 3;
}

void sub_23B467CEC(void *a1, void (*a2)(void *, uint64_t))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  _BYTE *v15;
  uint64_t v16;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v16);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to centralized feedback daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

    if (a1)
    {
LABEL_5:
      v13 = v5;
      a2(a1, 1);

      return;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  sub_23B44C878();
  v14 = (void *)swift_allocError();
  *v15 = 0;
  a2(v14, 1);

}

void sub_23B467F10(uint64_t a1, unint64_t a2, void *a3, void (*a4)(void *, uint64_t))
{
  uint8_t *v4;
  void *v8;
  _BYTE *v9;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;

  if (a3)
  {
    v21 = a3;
    a4(a3, 1);

  }
  else if (a2 >> 60 == 15)
  {
    sub_23B44C878();
    v8 = (void *)swift_allocError();
    *v9 = 0;
    a4(v8, 1);

  }
  else
  {
    sub_23B483200();
    swift_allocObject();
    sub_23B446D90(a1, a2);
    sub_23B4831F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2F0);
    sub_23B472BF4();
    sub_23B4831E8();
    swift_release();
    v11 = v22;
    if (qword_256A1A4E0 != -1)
      swift_once();
    v12 = sub_23B4833E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_256A1BC98);
    swift_bridgeObjectRetain_n();
    v13 = sub_23B4833C8();
    v14 = sub_23B483590();
    v15 = v22 >> 62;
    if (!os_log_type_enabled((os_log_t)v13, v14))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_12;
    }
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    v20 = (id)(v11 >> 62);
    if (v15)
      goto LABEL_23;
    v16 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      swift_bridgeObjectRelease();
      v22 = v16;
      sub_23B4835D8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B433000, (os_log_t)v13, v14, "Fetched %ld donations:", v4, 0xCu);
      MEMORY[0x23B86528C](v4, -1, -1);

      v15 = (unint64_t)v20;
LABEL_12:
      if (v15)
      {
        swift_bridgeObjectRetain();
        v13 = sub_23B483674();
        if (!v13)
          goto LABEL_21;
      }
      else
      {
        v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v13)
          goto LABEL_21;
      }
      if (v13 >= 1)
        break;
      __break(1u);
LABEL_23:
      swift_bridgeObjectRetain();
      v16 = sub_23B483674();
      swift_bridgeObjectRelease();
    }
    v17 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
        v18 = (id)MEMORY[0x23B8649E0](v17, v11);
      else
        v18 = *(id *)(v11 + 8 * v17 + 32);
      v19 = v18;
      ++v17;
      v22 = (unint64_t)v18;
      sub_23B4682B0(&v22);

    }
    while (v13 != v17);
LABEL_21:
    swift_bridgeObjectRelease();
    a4((void *)v11, 0);
    sub_23B448B1C(a1, a2);
    swift_bridgeObjectRelease();
  }
}

void sub_23B4682B0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A650);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B4833B0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v27 - v11;
  v13 = *a1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  sub_23B448908(v13, (uint64_t)v5, &qword_256A1A650);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_23B448B30((uint64_t)v5, &qword_256A1A650);
    if (qword_256A1A4E0 != -1)
      swift_once();
    v14 = sub_23B4833E0();
    __swift_project_value_buffer(v14, (uint64_t)qword_256A1BC98);
    v15 = sub_23B4833C8();
    v16 = sub_23B48359C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_23B433000, v15, v16, "Fetched donation is missing evaluationID", v17, 2u);
      MEMORY[0x23B86528C](v17, -1, -1);
    }

  }
  else
  {
    v29 = v1;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    if (qword_256A1A4E0 != -1)
      swift_once();
    v18 = sub_23B4833E0();
    __swift_project_value_buffer(v18, (uint64_t)qword_256A1BC98);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    v19 = sub_23B4833C8();
    v20 = sub_23B483590();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v31 = v28;
      *(_DWORD *)v21 = 136315138;
      v27[1] = v21 + 4;
      sub_23B44646C(&qword_256A1A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v22 = sub_23B4837AC();
      v30 = sub_23B44BBC0(v22, v23, &v31);
      sub_23B4835D8();
      swift_bridgeObjectRelease();
      v24 = *(void (**)(char *, uint64_t))(v7 + 8);
      v24(v10, v6);
      _os_log_impl(&dword_23B433000, v19, v20, "Fetched donation ID: %s", v21, 0xCu);
      v25 = v28;
      swift_arrayDestroy();
      MEMORY[0x23B86528C](v25, -1, -1);
      MEMORY[0x23B86528C](v21, -1, -1);

      v24(v12, v6);
    }
    else
    {

      v26 = *(void (**)(char *, uint64_t))(v7 + 8);
      v26(v10, v6);
      v26(v12, v6);
    }
  }
}

uint64_t static FBKSDonation.fetchMultiple(count:fromLatest:)(int a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 72) = v2;
  *(_BYTE *)(v3 + 108) = a2;
  *(_DWORD *)(v3 + 104) = a1;
  return swift_task_switch();
}

uint64_t sub_23B46868C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v13;
  uint64_t v14;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B4835A8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v14 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 64) = sub_23B44BBC0(0xD000000000000020, 0x800000023B48E5A0, &v14);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  *(_QWORD *)(v0 + 40) = &type metadata for FeedbackFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_23B446D00();
  *(_BYTE *)(v0 + 16) = 0;
  v6 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_BYTE *)(v0 + 108);
    v9 = *(_DWORD *)(v0 + 104);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v10;
    *(_QWORD *)(v10 + 16) = v7;
    *(_DWORD *)(v10 + 24) = v9;
    *(_BYTE *)(v10 + 28) = v8;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B2F0);
    *v11 = v0;
    v11[1] = sub_23B468918;
    return sub_23B4837DC();
  }
  else
  {
    sub_23B446D44();
    swift_allocError();
    *v13 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B468918()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B468984(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B790);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  _s15FeedbackService12FBKSDonationC13fetchMultiple5count10fromLatest10completionys6UInt32V_Sbys6ResultOySayACGs5Error_pGctFZ_0(a3, a4, (void (*)(void *, uint64_t))sub_23B472BD0, v11);
  return swift_release();
}

uint64_t sub_23B468A6C(void *a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B790);
    return sub_23B483530();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B790);
    return sub_23B48353C();
  }
}

uint64_t sub_23B468AD8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23B468AFC(void *a1)
{
  uint64_t v1;

  sub_23B4662E8(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_23B468B04()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23B468B28()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B468B54(uint64_t a1)
{
  uint64_t v1;

  return sub_23B466500(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_23B468B78(uint64_t a1)
{
  return sub_23B466598(a1);
}

uint64_t sub_23B468B80(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  BOOL v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  _BYTE v33[32];
  _BYTE v34[32];
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7C0);
  result = sub_23B483680();
  v4 = 0;
  v30 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v27 = v6;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v29 = result + 64;
  v35 = result;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    sub_23B43F084(*(_QWORD *)(v30 + 56) + 32 * i, (uint64_t)v34);
    sub_23B43F084((uint64_t)v34, (uint64_t)v33);
    swift_bridgeObjectRetain();
    static FBKSInteraction.StructuredValue.wrap(_:)(v31, v33);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
    if (v1)
    {
      swift_bridgeObjectRelease();
      v26 = v35;
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
      return v26;
    }
    v19 = v31[0];
    v20 = v31[1];
    v21 = v32;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    *(_QWORD *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    result = v35;
    v22 = (_QWORD *)(*(_QWORD *)(v35 + 48) + 16 * i);
    *v22 = v18;
    v22[1] = v17;
    v23 = *(_QWORD *)(result + 56) + 24 * i;
    *(_QWORD *)v23 = v19;
    *(_QWORD *)(v23 + 8) = v20;
    *(_BYTE *)(v23 + 16) = v21;
    v24 = *(_QWORD *)(result + 16);
    v13 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (v13)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    *(_QWORD *)(result + 16) = v25;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = __OFADD__(v4++, 1);
    if (v13)
      goto LABEL_27;
    if (v4 >= v28)
      return result;
    v14 = *(_QWORD *)(v27 + 8 * v4);
    if (!v14)
      break;
LABEL_15:
    v10 = (v14 - 1) & v14;
  }
  v15 = v4 + 1;
  if (v4 + 1 >= v28)
    return result;
  v14 = *(_QWORD *)(v27 + 8 * v15);
  if (v14)
    goto LABEL_14;
  v15 = v4 + 2;
  if (v4 + 2 >= v28)
    return result;
  v14 = *(_QWORD *)(v27 + 8 * v15);
  if (v14)
    goto LABEL_14;
  v15 = v4 + 3;
  if (v4 + 3 >= v28)
    return result;
  v14 = *(_QWORD *)(v27 + 8 * v15);
  if (v14)
  {
LABEL_14:
    v4 = v15;
    goto LABEL_15;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v28)
      return result;
    v14 = *(_QWORD *)(v27 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23B468DE0(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  BOOL v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _OWORD v33[2];
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7B8);
  result = sub_23B483680();
  v3 = (_QWORD *)result;
  v4 = 0;
  v31 = a1;
  v32 = (_QWORD *)result;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v28 = v6;
  v29 = (unint64_t)(v8 + 63) >> 6;
  v30 = result + 64;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v31 + 48) + 16 * i);
    v17 = *v16;
    v18 = v16[1];
    v19 = *(_QWORD *)(v31 + 56) + 24 * i;
    v21 = *(_QWORD *)v19;
    v20 = *(_QWORD *)(v19 + 8);
    v22 = *(_BYTE *)(v19 + 16);
    swift_bridgeObjectRetain();
    v23 = sub_23B448820(v21, v20, v22);
    v24 = v34;
    FBKSInteraction.StructuredValue.unwrap()(v33, v23);
    v34 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      v3 = v32;
      swift_release();
      sub_23B44884C(v21, v20, v22);
      return (uint64_t)v3;
    }
    sub_23B44884C(v21, v20, v22);
    *(_QWORD *)(v30 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v3 = v32;
    v25 = (_QWORD *)(v32[6] + 16 * i);
    *v25 = v17;
    v25[1] = v18;
    result = (uint64_t)sub_23B43F054(v33, (_OWORD *)(v32[7] + 32 * i));
    v26 = v32[2];
    v13 = __OFADD__(v26, 1);
    v27 = v26 + 1;
    if (v13)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v32[2] = v27;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = __OFADD__(v4++, 1);
    if (v13)
      goto LABEL_27;
    if (v4 >= v29)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v28 + 8 * v4);
    if (!v14)
      break;
LABEL_15:
    v10 = (v14 - 1) & v14;
  }
  v15 = v4 + 1;
  if (v4 + 1 >= v29)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v28 + 8 * v15);
  if (v14)
    goto LABEL_14;
  v15 = v4 + 2;
  if (v4 + 2 >= v29)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v28 + 8 * v15);
  if (v14)
    goto LABEL_14;
  v15 = v4 + 3;
  if (v4 + 3 >= v29)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v28 + 8 * v15);
  if (v14)
  {
LABEL_14:
    v4 = v15;
    goto LABEL_15;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v29)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v28 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_23B46904C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23B4690AC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x23B469290);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_23B4692B4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B469310()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_23B46904C((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_23B43ED7C(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_23B4694D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  int64_t v15;

  v14 = (_QWORD *)(a2 + 64);
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v15 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = __clz(__rbit64(v4));
    goto LABEL_16;
  }
  if (v15 > 1)
  {
    v6 = v14[1];
    v7 = 1;
    if (v6)
      goto LABEL_15;
    v7 = 2;
    if (v15 <= 2)
      goto LABEL_17;
    v6 = v14[2];
    if (v6)
    {
LABEL_15:
      v5 = __clz(__rbit64(v6)) + (v7 << 6);
LABEL_16:
      v9 = *(_QWORD *)(a2 + 56) + 24 * v5;
      v10 = *(_QWORD *)v9;
      v11 = *(_QWORD *)(v9 + 8);
      v12 = *(unsigned __int8 *)(v9 + 16);
      swift_bridgeObjectRetain();
      sub_23B448820(v10, v11, v12);
      sub_23B48347C();
      swift_bridgeObjectRelease();
      __asm { BR              X8 }
    }
    v8 = 3;
    if (v15 > 3)
    {
      v6 = v14[3];
      if (v6)
      {
        v7 = 3;
        goto LABEL_15;
      }
      while (1)
      {
        v7 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          JUMPOUT(0x23B46A2CCLL);
        }
        if (v7 >= v15)
          break;
        v6 = v14[v7];
        ++v8;
        if (v6)
          goto LABEL_15;
      }
    }
  }
LABEL_17:
  swift_release();
  return sub_23B483854();
}

uint64_t sub_23B46A3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23B483854();
  if (v3)
    __asm { BR              X9 }
  return result;
}

uint64_t _s15FeedbackService15FBKSInteractionC13FeatureDomainO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_44;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_44;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_44;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_44;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_44;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_44;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_44;
      v6 = 1;
      v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7)
        goto LABEL_44;
      v6 = 1;
      v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8)
        goto LABEL_44;
      v6 = 1;
      v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9)
        goto LABEL_44;
      v6 = 1;
      v3 = 9;
      break;
    case 0xAuLL:
      if (v5 != 10)
        goto LABEL_44;
      v6 = 1;
      v3 = 10;
      break;
    case 0xBuLL:
      if (v5 != 11)
        goto LABEL_44;
      v6 = 1;
      v3 = 11;
      break;
    case 0xCuLL:
      if (v5 != 12)
        goto LABEL_44;
      v6 = 1;
      v3 = 12;
      break;
    case 0xDuLL:
      if (v5 != 13)
        goto LABEL_44;
      v6 = 1;
      v3 = 13;
      break;
    case 0xEuLL:
      if (v5 != 14)
        goto LABEL_44;
      v6 = 1;
      v3 = 14;
      break;
    case 0xFuLL:
      if (v5 != 15)
        goto LABEL_44;
      v6 = 1;
      v3 = 15;
      break;
    case 0x10uLL:
      if (v5 != 16)
        goto LABEL_44;
      v6 = 1;
      v3 = 16;
      break;
    case 0x11uLL:
      if (v5 != 17)
        goto LABEL_44;
      v6 = 1;
      v3 = 17;
      break;
    default:
      if (v5 < 0x12)
      {
LABEL_44:
        v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        v6 = 1;
      }
      else
      {
        v6 = sub_23B4837D0();
      }
      sub_23B45B45C(v4, v5);
      sub_23B45B45C(v2, v3);
      break;
  }
  sub_23B45B370(v2, v3);
  sub_23B45B370(v4, v5);
  return v6 & 1;
}

void _s15FeedbackService15FBKSInteractionC15StructuredValueO2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_23B46A764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  char v6;

  if (v5)
  {
    sub_23B448820(v0, v1, v5);
    sub_23B44884C(v2, v3, v4);
    sub_23B44884C(v0, v1, v5);
    v6 = 0;
  }
  else
  {
    sub_23B44884C(v2, v3, 0);
    sub_23B44884C(v0, v1, 0);
    v6 = ((v2 & 1) == 0) ^ v0;
  }
  return v6 & 1;
}

uint64_t sub_23B46A9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_23B4832D8();
  v11 = result;
  if (result)
  {
    result = sub_23B4832F0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_23B4832E4();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_23B46904C(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_23B46AA54(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23B46AA98()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23B46AACC + dword_23B46AB8C[v0 >> 62]))();
}

uint64_t sub_23B46AADC@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_23B446D90(v2, v1);
      sub_23B4692B4(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void _s15FeedbackService15FBKSInteractionC7ContentO2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23B46B974(uint64_t a1)
{
  uint64_t v1;

  return sub_23B466850(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

unint64_t sub_23B46B988()
{
  unint64_t result;

  result = qword_256A1ADB8;
  if (!qword_256A1ADB8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.FeatureDomain, &type metadata for FBKSInteraction.FeatureDomain);
    atomic_store(result, (unint64_t *)&qword_256A1ADB8);
  }
  return result;
}

unint64_t sub_23B46B9CC()
{
  unint64_t result;

  result = qword_256A1ADC0;
  if (!qword_256A1ADC0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.Content, &type metadata for FBKSInteraction.Content);
    atomic_store(result, (unint64_t *)&qword_256A1ADC0);
  }
  return result;
}

uint64_t sub_23B46BA10(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1AD90);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x23B8651F0](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B46BA74()
{
  unint64_t result;

  result = qword_256A1AE70;
  if (!qword_256A1AE70)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A7DC, &type metadata for FBKSInteraction.FeatureDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE70);
  }
  return result;
}

unint64_t sub_23B46BAB8()
{
  unint64_t result;

  result = qword_256A1AE78;
  if (!qword_256A1AE78)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A78C, &type metadata for FBKSInteraction.FeatureDomain.TestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE78);
  }
  return result;
}

unint64_t sub_23B46BAFC()
{
  unint64_t result;

  result = qword_256A1AE80;
  if (!qword_256A1AE80)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A73C, &type metadata for FBKSInteraction.FeatureDomain.TemporaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE80);
  }
  return result;
}

unint64_t sub_23B46BB40()
{
  unint64_t result;

  result = qword_256A1AE88;
  if (!qword_256A1AE88)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A6EC, &type metadata for FBKSInteraction.FeatureDomain.PhotosCleanupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE88);
  }
  return result;
}

unint64_t sub_23B46BB84()
{
  unint64_t result;

  result = qword_256A1AE90;
  if (!qword_256A1AE90)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A69C, &type metadata for FBKSInteraction.FeatureDomain.SwiftAssistCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE90);
  }
  return result;
}

unint64_t sub_23B46BBC8()
{
  unint64_t result;

  result = qword_256A1AE98;
  if (!qword_256A1AE98)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A64C, &type metadata for FBKSInteraction.FeatureDomain.MagicPaperCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AE98);
  }
  return result;
}

unint64_t sub_23B46BC0C()
{
  unint64_t result;

  result = qword_256A1AEA0;
  if (!qword_256A1AEA0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A5FC, &type metadata for FBKSInteraction.FeatureDomain.NotificationsBreakthroughCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEA0);
  }
  return result;
}

unint64_t sub_23B46BC50()
{
  unint64_t result;

  result = qword_256A1AEA8;
  if (!qword_256A1AEA8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A5AC, &type metadata for FBKSInteraction.FeatureDomain.NotificationsHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEA8);
  }
  return result;
}

unint64_t sub_23B46BC94()
{
  unint64_t result;

  result = qword_256A1AEB0;
  if (!qword_256A1AEB0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A55C, &type metadata for FBKSInteraction.FeatureDomain.NotificationsSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEB0);
  }
  return result;
}

unint64_t sub_23B46BCD8()
{
  unint64_t result;

  result = qword_256A1AEB8;
  if (!qword_256A1AEB8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A50C, &type metadata for FBKSInteraction.FeatureDomain.MessagesSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEB8);
  }
  return result;
}

unint64_t sub_23B46BD1C()
{
  unint64_t result;

  result = qword_256A1AEC0;
  if (!qword_256A1AEC0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A4BC, &type metadata for FBKSInteraction.FeatureDomain.MailHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEC0);
  }
  return result;
}

unint64_t sub_23B46BD60()
{
  unint64_t result;

  result = qword_256A1AEC8;
  if (!qword_256A1AEC8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A46C, &type metadata for FBKSInteraction.FeatureDomain.MailSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEC8);
  }
  return result;
}

unint64_t sub_23B46BDA4()
{
  unint64_t result;

  result = qword_256A1AED0;
  if (!qword_256A1AED0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A41C, &type metadata for FBKSInteraction.FeatureDomain.EmojiGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AED0);
  }
  return result;
}

unint64_t sub_23B46BDE8()
{
  unint64_t result;

  result = qword_256A1AED8;
  if (!qword_256A1AED8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A3CC, &type metadata for FBKSInteraction.FeatureDomain.SmartRepliesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AED8);
  }
  return result;
}

unint64_t sub_23B46BE2C()
{
  unint64_t result;

  result = qword_256A1AEE0;
  if (!qword_256A1AEE0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A37C, &type metadata for FBKSInteraction.FeatureDomain.WritingToolsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEE0);
  }
  return result;
}

unint64_t sub_23B46BE70()
{
  unint64_t result;

  result = qword_256A1AEE8;
  if (!qword_256A1AEE8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A32C, &type metadata for FBKSInteraction.FeatureDomain.DeviceExpertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEE8);
  }
  return result;
}

unint64_t sub_23B46BEB4()
{
  unint64_t result;

  result = qword_256A1AEF0;
  if (!qword_256A1AEF0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A2DC, &type metadata for FBKSInteraction.FeatureDomain.SystemAssistantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEF0);
  }
  return result;
}

unint64_t sub_23B46BEF8()
{
  unint64_t result;

  result = qword_256A1AEF8;
  if (!qword_256A1AEF8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A28C, &type metadata for FBKSInteraction.FeatureDomain.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AEF8);
  }
  return result;
}

unint64_t sub_23B46BF3C()
{
  unint64_t result;

  result = qword_256A1AF00;
  if (!qword_256A1AF00)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A23C, &type metadata for FBKSInteraction.FeatureDomain.MemoryCreationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AF00);
  }
  return result;
}

unint64_t sub_23B46BF80()
{
  unint64_t result;

  result = qword_256A1AF08;
  if (!qword_256A1AF08)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A1EC, &type metadata for FBKSInteraction.FeatureDomain.ImageGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1AF08);
  }
  return result;
}

unint64_t sub_23B46BFC4()
{
  unint64_t result;

  result = qword_256A1AFC0;
  if (!qword_256A1AFC0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A1AC, &type metadata for FBKSInteraction.StructuredValue.StructuredValueError);
    atomic_store(result, (unint64_t *)&qword_256A1AFC0);
  }
  return result;
}

unint64_t sub_23B46C008()
{
  unint64_t result;

  result = qword_256A1B000;
  if (!qword_256A1B000)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A15C, &type metadata for FBKSInteraction.StructuredValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B000);
  }
  return result;
}

unint64_t sub_23B46C04C()
{
  unint64_t result;

  result = qword_256A1B008;
  if (!qword_256A1B008)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A10C, &type metadata for FBKSInteraction.StructuredValue.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B008);
  }
  return result;
}

unint64_t sub_23B46C090()
{
  unint64_t result;

  result = qword_256A1B020;
  if (!qword_256A1B020)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.StructuredValue, &type metadata for FBKSInteraction.StructuredValue);
    atomic_store(result, (unint64_t *)&qword_256A1B020);
  }
  return result;
}

unint64_t sub_23B46C0D4()
{
  unint64_t result;

  result = qword_256A1B028;
  if (!qword_256A1B028)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A0BC, &type metadata for FBKSInteraction.StructuredValue.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B028);
  }
  return result;
}

unint64_t sub_23B46C118()
{
  unint64_t result;

  result = qword_256A1B040;
  if (!qword_256A1B040)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A06C, &type metadata for FBKSInteraction.StructuredValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B040);
  }
  return result;
}

unint64_t sub_23B46C15C()
{
  unint64_t result;

  result = qword_256A1B048;
  if (!qword_256A1B048)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48A01C, &type metadata for FBKSInteraction.StructuredValue.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B048);
  }
  return result;
}

unint64_t sub_23B46C1A0()
{
  unint64_t result;

  result = qword_256A1B050;
  if (!qword_256A1B050)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489FCC, &type metadata for FBKSInteraction.StructuredValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B050);
  }
  return result;
}

unint64_t sub_23B46C1E4()
{
  unint64_t result;

  result = qword_256A1B058;
  if (!qword_256A1B058)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489F7C, &type metadata for FBKSInteraction.StructuredValue.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B058);
  }
  return result;
}

uint64_t sub_23B46C228(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1B010);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x23B8651F0](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B46C29C()
{
  unint64_t result;

  result = qword_256A1B0A0;
  if (!qword_256A1B0A0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.StructuredValue, &type metadata for FBKSInteraction.StructuredValue);
    atomic_store(result, (unint64_t *)&qword_256A1B0A0);
  }
  return result;
}

uint64_t sub_23B46C2E0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1B030);
    v8 = a2();
    result = MEMORY[0x23B8651F0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23B46C348()
{
  unint64_t result;

  result = qword_256A1B138;
  if (!qword_256A1B138)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489F2C, &type metadata for FBKSInteraction.Content.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B138);
  }
  return result;
}

unint64_t sub_23B46C38C()
{
  unint64_t result;

  result = qword_256A1B140;
  if (!qword_256A1B140)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489EDC, &type metadata for FBKSInteraction.Content.HtmlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B140);
  }
  return result;
}

unint64_t sub_23B46C3D0()
{
  unint64_t result;

  result = qword_256A1B148;
  if (!qword_256A1B148)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489E8C, &type metadata for FBKSInteraction.Content.EmojiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B148);
  }
  return result;
}

unint64_t sub_23B46C414()
{
  unint64_t result;

  result = qword_256A1B150;
  if (!qword_256A1B150)
  {
    result = MEMORY[0x23B8651F0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A1B150);
  }
  return result;
}

unint64_t sub_23B46C458()
{
  unint64_t result;

  result = qword_256A1B158;
  if (!qword_256A1B158)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489E3C, &type metadata for FBKSInteraction.Content.MailMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B158);
  }
  return result;
}

unint64_t sub_23B46C49C()
{
  unint64_t result;

  result = qword_256A1B160;
  if (!qword_256A1B160)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489DEC, &type metadata for FBKSInteraction.Content.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B160);
  }
  return result;
}

unint64_t sub_23B46C4E0()
{
  unint64_t result;

  result = qword_256A1B168;
  if (!qword_256A1B168)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489D9C, &type metadata for FBKSInteraction.Content.SketchStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B168);
  }
  return result;
}

unint64_t sub_23B46C524()
{
  unint64_t result;

  result = qword_256A1B170;
  if (!qword_256A1B170)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489D4C, &type metadata for FBKSInteraction.Content.ImageStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B170);
  }
  return result;
}

unint64_t sub_23B46C568()
{
  unint64_t result;

  result = qword_256A1B178;
  if (!qword_256A1B178)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489CFC, &type metadata for FBKSInteraction.Content.StructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B178);
  }
  return result;
}

unint64_t sub_23B46C5AC()
{
  unint64_t result;

  result = qword_256A1B180;
  if (!qword_256A1B180)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489CAC, &type metadata for FBKSInteraction.Content.SourceCodeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B180);
  }
  return result;
}

unint64_t sub_23B46C5F0()
{
  unint64_t result;

  result = qword_256A1B188;
  if (!qword_256A1B188)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489C5C, &type metadata for FBKSInteraction.Content.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B188);
  }
  return result;
}

unint64_t sub_23B46C634()
{
  unint64_t result;

  result = qword_256A1B190;
  if (!qword_256A1B190)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489C0C, &type metadata for FBKSInteraction.Content.SketchTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B190);
  }
  return result;
}

unint64_t sub_23B46C678()
{
  unint64_t result;

  result = qword_256A1B198;
  if (!qword_256A1B198)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489BBC, &type metadata for FBKSInteraction.Content.ImageTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B198);
  }
  return result;
}

unint64_t sub_23B46C6BC()
{
  unint64_t result;

  result = qword_256A1B1A0;
  if (!qword_256A1B1A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489B6C, &type metadata for FBKSInteraction.Content.SketchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B1A0);
  }
  return result;
}

unint64_t sub_23B46C700()
{
  unint64_t result;

  result = qword_256A1B1A8;
  if (!qword_256A1B1A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489B1C, &type metadata for FBKSInteraction.Content.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B1A8);
  }
  return result;
}

unint64_t sub_23B46C744()
{
  unint64_t result;

  result = qword_256A1B1B0;
  if (!qword_256A1B1B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489ACC, &type metadata for FBKSInteraction.Content.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B1B0);
  }
  return result;
}

unint64_t sub_23B46C788()
{
  unint64_t result;

  result = qword_256A1B1B8;
  if (!qword_256A1B1B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489A7C, &type metadata for FBKSInteraction.Content.ImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B1B8);
  }
  return result;
}

unint64_t sub_23B46C7CC()
{
  unint64_t result;

  result = qword_256A1B1C0;
  if (!qword_256A1B1C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489A2C, &type metadata for FBKSInteraction.Content.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B1C0);
  }
  return result;
}

unint64_t sub_23B46C810()
{
  unint64_t result;

  result = qword_256A1B250;
  if (!qword_256A1B250)
  {
    result = MEMORY[0x23B8651F0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A1B250);
  }
  return result;
}

unint64_t sub_23B46C854()
{
  unint64_t result;

  result = qword_256A1B288;
  if (!qword_256A1B288)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4899DC, &type metadata for FBKSInteraction.EvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B288);
  }
  return result;
}

unint64_t sub_23B46C898()
{
  unint64_t result;

  result = qword_256A1B290;
  if (!qword_256A1B290)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48998C, &type metadata for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B290);
  }
  return result;
}

unint64_t sub_23B46C8DC()
{
  unint64_t result;

  result = qword_256A1B298;
  if (!qword_256A1B298)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48993C, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B298);
  }
  return result;
}

unint64_t sub_23B46C920()
{
  unint64_t result;

  result = qword_256A1B2A0;
  if (!qword_256A1B2A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4898EC, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B2A0);
  }
  return result;
}

unint64_t sub_23B46C964()
{
  unint64_t result;

  result = qword_256A1B2A8;
  if (!qword_256A1B2A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48989C, &type metadata for FBKSInteraction.EvaluationResponse.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B2A8);
  }
  return result;
}

unint64_t sub_23B46C9A8()
{
  unint64_t result;

  result = qword_256A1B2B0;
  if (!qword_256A1B2B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48984C, &type metadata for FBKSInteraction.EvaluationResponse.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B2B0);
  }
  return result;
}

uint64_t sub_23B46C9EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E65476567616D69 && a2 == 0xEF6E6F6974617265;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x724379726F6D656DLL && a2 == 0xEE006E6F69746165 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74697277646E6168 && a2 == 0xEB00000000676E69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73416D6574737973 && a2 == 0xEF746E6174736973 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7845656369766564 && a2 == 0xEC00000074726570 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x54676E6974697277 && a2 == 0xEC000000736C6F6FLL || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7065527472616D73 && a2 == 0xEC0000007365696CLL || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6547696A6F6D65 && a2 == 0xEF6E6F6974617265 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023B48E6D0 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x686769486C69616DLL && a2 == 0xEE0073746867696CLL || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023B48E6F0 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000023B48E710 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000023B48E730 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000023B48E750 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x706150636967616DLL && a2 == 0xEA00000000007265 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x7373417466697773 && a2 == 0xEB00000000747369 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6C43736F746F6870 && a2 == 0xED000070756E6165 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x7261726F706D6574 && a2 == 0xE900000000000079 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 1953719668 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 18;
    else
      return 19;
  }
}

uint64_t sub_23B46D1B8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23B46D22C()
{
  return 1701667182;
}

uint64_t sub_23B46D23C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1819242338 && a2 == 0xE400000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C62756F64 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7961727261 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x616E6F6974636964 && a2 == 0xEA00000000007972)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23B46D474(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F69647561 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74697277646E6168 && a2 == 0xEB00000000676E69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x686374656B73 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7865546567616D69 && a2 == 0xE900000000000074 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6554686374656B73 && a2 == 0xEA00000000007478 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F65646976 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6F43656372756F73 && a2 == 0xEA00000000006564 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7275746375727473 && a2 == 0xEA00000000006465 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x7274536567616D69 && a2 == 0xEF64657275746375 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E770 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6163696669746F6ELL && a2 == 0xEC0000006E6F6974 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x7373654D6C69616DLL && a2 == 0xEB00000000656761 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x696A6F6D65 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 1819112552 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 15;
    else
      return 16;
  }
}

uint64_t sub_23B46DA80(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6567616D69 && a2 == 0xE500000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7275746375727473 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B46DB68(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6567616D69 && a2 == 0xE500000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B46DC38(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x686374656B73 && a2 == 0xE600000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7275746375727473 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B46DD20(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x686374656B73 && a2 == 0xE600000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B46DDF0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4465727574616566 && a2 == 0xED00006E69616D6FLL;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49656C646E75625FLL && a2 == 0xE900000000000044 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E610 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C616E696769726FLL && a2 == 0xEF746E65746E6F43 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E640 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7265566C65646F6DLL && a2 == 0xEC0000006E6F6973 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x74736F6E67616964 && a2 == 0xEB00000000736369 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48E670 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7250686769487369 && a2 == 0xEE00797469726F69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7461756C6176655FLL && a2 == 0xED000044496E6F69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x73657250746E6573 && a2 == 0xED00006465746E65 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6176457473726966 && a2 == 0xEF6E6F697461756CLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_23B46E320(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657373696D736964 && a2 == 0xE900000000000064 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x705573626D756874 && a2 == 0xE800000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F4473626D756874 && a2 == 0xEA00000000006E77 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F4374726F706572 && a2 == 0xED00006E7265636ELL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

void _s15FeedbackService12FBKSDonationC13fetchMultiple5count10fromLatest10completionys6UInt32V_Sbys6ResultOySayACGs5Error_pGctFZ_0(uint64_t a1, char a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  uint64_t aBlock[3];
  ValueMetadata *v21;
  unint64_t v22;
  uint64_t v23;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v8 = sub_23B4833E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
  v9 = sub_23B4833C8();
  v10 = sub_23B4835A8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136446210;
    sub_23B44BBC0(0xD00000000000002BLL, 0x800000023B48E790, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v9, v10, "%{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v12, -1, -1);
    MEMORY[0x23B86528C](v11, -1, -1);
  }

  v21 = &type metadata for FeedbackFeatureFlags;
  v22 = sub_23B446D00();
  LOBYTE(aBlock[0]) = 0;
  v13 = sub_23B4833BC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  if ((v13 & 1) != 0)
  {
    if (qword_256A1A510 != -1)
      swift_once();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    swift_retain();
    v15 = (void *)sub_23B457884((uint64_t)sub_23B472BE4, v14);
    swift_release();
    if (v15)
    {
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = a3;
      *(_QWORD *)(v16 + 24) = a4;
      v22 = (unint64_t)sub_23B472BEC;
      v23 = v16;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B47D698;
      v21 = (ValueMetadata *)&block_descriptor_51;
      v17 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v15, sel_fetchDonationsWithCount_fromLatest_completion_, a1, a2 & 1, v17);
      swift_unknownObjectRelease();
      _Block_release(v17);
    }
  }
  else
  {
    sub_23B446D44();
    v18 = (void *)swift_allocError();
    *v19 = 0;
    a3(v18, 1);

  }
}

uint64_t sub_23B46E848(uint64_t a1)
{
  uint64_t v1;

  return sub_23B468984(a1, *(_QWORD *)(v1 + 16), *(unsigned int *)(v1 + 24), *(_BYTE *)(v1 + 28));
}

unint64_t sub_23B46E85C()
{
  unint64_t result;

  result = qword_256A1B2F8;
  if (!qword_256A1B2F8)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.InteractionError, &type metadata for FBKSInteraction.InteractionError);
    atomic_store(result, (unint64_t *)&qword_256A1B2F8);
  }
  return result;
}

uint64_t sub_23B46E8A0()
{
  return sub_23B46E9C0(&qword_256A1B300, &qword_256A1B308);
}

unint64_t sub_23B46E8C8()
{
  unint64_t result;

  result = qword_256A1B310;
  if (!qword_256A1B310)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.FeatureDomain, &type metadata for FBKSInteraction.FeatureDomain);
    atomic_store(result, (unint64_t *)&qword_256A1B310);
  }
  return result;
}

unint64_t sub_23B46E910()
{
  unint64_t result;

  result = qword_256A1B318;
  if (!qword_256A1B318)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.StructuredValue, &type metadata for FBKSInteraction.StructuredValue);
    atomic_store(result, (unint64_t *)&qword_256A1B318);
  }
  return result;
}

unint64_t sub_23B46E958()
{
  unint64_t result;

  result = qword_256A1B320;
  if (!qword_256A1B320)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSInteraction.Content, &type metadata for FBKSInteraction.Content);
    atomic_store(result, (unint64_t *)&qword_256A1B320);
  }
  return result;
}

uint64_t sub_23B46E99C()
{
  return sub_23B46E9C0(&qword_256A1B328, &qword_256A1B330);
}

uint64_t sub_23B46E9C0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B46EA0C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__bundleID);
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B46EA48@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions, a2);
}

uint64_t sub_23B46EA54(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B465D80(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_prefillQuestions);
}

void sub_23B46EA70(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_23B465C68(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent, a2);
}

void sub_23B46EA8C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_23B465CC8(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_originalContent);
}

void sub_23B46EAA8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_23B465C68(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent, a2);
}

void sub_23B46EAC4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_23B465CC8(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_generatedContent);
}

uint64_t sub_23B46EAE0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion, a2);
}

uint64_t sub_23B46EAEC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_modelVersion);
}

uint64_t sub_23B46EB08@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics, a2);
}

uint64_t sub_23B46EB14(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B4557CC(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_diagnostics);
}

uint64_t sub_23B46EB30@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics, a2);
}

uint64_t keypath_get_15Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B46EB8C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23B465D80(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_auxiliaryMetrics);
}

uint64_t sub_23B46EBA8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority, a2);
}

uint64_t sub_23B46EBB4(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_isHighPriority);
}

uint64_t sub_23B46EBC0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC15FeedbackService15FBKSInteraction__evaluationID;
  swift_beginAccess();
  return sub_23B448908(v3, a2, &qword_256A1A650);
}

uint64_t sub_23B46EC20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented, a2);
}

uint64_t sub_23B46EC2C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_sentPresented);
}

uint64_t sub_23B46EC38@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation, a2);
}

uint64_t sub_23B46EC44(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15FeedbackService15FBKSInteraction_firstEvaluation);
}

uint64_t sub_23B46EC50()
{
  return type metadata accessor for FBKSInteraction();
}

void sub_23B46EC58()
{
  unint64_t v0;

  sub_23B46F2E0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for FBKSInteraction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSInteraction.featureDomain.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FBKSInteraction.featureDomain.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of FBKSInteraction.featureDomain.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of FBKSInteraction.bundleID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of FBKSInteraction.bundleID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of FBKSInteraction.bundleID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of FBKSInteraction.prefillQuestions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of FBKSInteraction.prefillQuestions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of FBKSInteraction.prefillQuestions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of FBKSInteraction.originalContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of FBKSInteraction.originalContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of FBKSInteraction.originalContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of FBKSInteraction.generatedContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of FBKSInteraction.generatedContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of FBKSInteraction.generatedContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of FBKSInteraction.modelVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of FBKSInteraction.modelVersion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of FBKSInteraction.modelVersion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of FBKSInteraction.diagnostics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of FBKSInteraction.diagnostics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of FBKSInteraction.diagnostics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of FBKSInteraction.auxiliaryMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of FBKSInteraction.auxiliaryMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of FBKSInteraction.auxiliaryMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of FBKSInteraction.isHighPriority.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of FBKSInteraction.isHighPriority.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of FBKSInteraction.isHighPriority.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of FBKSInteraction.evaluationID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of FBKSInteraction.setEvaluationID(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of FBKSInteraction.sentPresented.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of FBKSInteraction.sentPresented.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of FBKSInteraction.sentPresented.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of FBKSInteraction.firstEvaluation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of FBKSInteraction.firstEvaluation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of FBKSInteraction.firstEvaluation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of FBKSInteraction.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:evaluationID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of FBKSInteraction.__allocating_init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of FBKSInteraction.presented(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of FBKSInteraction.presented()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x220);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23B447194;
  return v5();
}

uint64_t dispatch thunk of FBKSInteraction.evaluate(action:formResponse:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of FBKSInteraction.evaluate(action:formResponse:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x230);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23B46F24C;
  return v9(a1, a2);
}

uint64_t sub_23B46F24C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of FBKSInteraction.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of FBKSInteraction.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 576))();
}

void sub_23B46F2E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256A1B358)
  {
    sub_23B4833B0();
    v0 = sub_23B4835CC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256A1B358);
  }
}

ValueMetadata *type metadata accessor for FBKSInteraction.InteractionError()
{
  return &type metadata for FBKSInteraction.InteractionError;
}

unint64_t destroy for FBKSInteraction.FeatureDomain(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s15FeedbackService15FBKSInteractionC13FeatureDomainOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for FBKSInteraction.FeatureDomain(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FBKSInteraction.FeatureDomain(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.FeatureDomain(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFED && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483630);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 17;
  if (v4 >= 0x13)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.FeatureDomain(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFEE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483630;
    if (a3 >= 0x7FFFFFEE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFEE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 17;
  }
  return result;
}

uint64_t sub_23B46F554(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23B46F56C(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain()
{
  return &type metadata for FBKSInteraction.FeatureDomain;
}

uint64_t destroy for FBKSInteraction.StructuredValue(uint64_t a1)
{
  return sub_23B44884C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s15FeedbackService15FBKSInteractionC15StructuredValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B448820(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FBKSInteraction.StructuredValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B448820(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23B44884C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for FBKSInteraction.StructuredValue(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23B44884C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.StructuredValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.StructuredValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B46F71C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23B46F724(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue()
{
  return &type metadata for FBKSInteraction.StructuredValue;
}

void destroy for FBKSInteraction.Content(uint64_t a1)
{
  sub_23B45A444(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for FBKSInteraction.Content(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_23B465BD8(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for FBKSInteraction.Content(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_23B465BD8(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_23B45A444(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FBKSInteraction.Content(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_23B45A444(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.Content(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x11 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 17);
  v3 = ((*(unsigned __int8 *)(a1 + 32) >> 4) & 0xFFFFFFEF | (16 * ((*(unsigned __int8 *)(a1 + 32) >> 3) & 1))) ^ 0x1F;
  if (v3 >= 0x10)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x10)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 17;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x11)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x11)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
    {
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_BYTE *)(result + 32) = 8 - 16 * a2;
    }
  }
  return result;
}

uint64_t sub_23B46F924(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 4;
}

uint64_t sub_23B46F930(uint64_t result)
{
  *(_BYTE *)(result + 32) &= 0xFu;
  return result;
}

uint64_t sub_23B46F940(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 7 | (16 * a2);
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content()
{
  return &type metadata for FBKSInteraction.Content;
}

uint64_t sub_23B46F964(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 2u)
    return sub_23B445D10(a1, a2);
  return a1;
}

uint64_t destroy for FBKSInteraction.EvaluationResponse(uint64_t a1)
{
  return sub_23B46F98C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_23B46F98C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 2u)
    return sub_23B4487AC(a1, a2);
  return a1;
}

uint64_t initializeWithCopy for FBKSInteraction.EvaluationResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23B46F964(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for FBKSInteraction.EvaluationResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23B46F964(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23B46F98C(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FBKSInteraction.EvaluationResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23B46F98C(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.EvaluationResponse(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.EvaluationResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B46FB58(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 2u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23B46FB70(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 3;
  if (a2 >= 3)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 3;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse()
{
  return &type metadata for FBKSInteraction.EvaluationResponse;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.EvaluationResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.EvaluationResponse.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23B46FC78 + 4 * byte_23B486F2E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23B46FCAC + 4 * byte_23B486F29[v4]))();
}

uint64_t sub_23B46FCAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B46FCB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B46FCBCLL);
  return result;
}

uint64_t sub_23B46FCC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B46FCD0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23B46FCD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B46FCDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.CodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.UnknownCodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.DismissedCodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.DismissedCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys()
{
  return &type metadata for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.Content.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.Content.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_23B46FE24 + 4 * byte_23B486F38[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_23B46FE58 + 4 * byte_23B486F33[v4]))();
}

uint64_t sub_23B46FE58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B46FE60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B46FE68);
  return result;
}

uint64_t sub_23B46FE74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B46FE7CLL);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_23B46FE80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B46FE88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.CodingKeys()
{
  return &type metadata for FBKSInteraction.Content.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.TextCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.TextCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.ImageCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.ImageCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.AudioCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.AudioCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.HandwritingCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.HandwritingCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.SketchCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.SketchCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.ImageTextCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.ImageTextCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.SketchTextCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.SketchTextCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.VideoCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.VideoCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.SourceCodeCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.SourceCodeCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.StructuredCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.StructuredCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.ImageStructuredCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.ImageStructuredCodingKeys;
}

uint64_t _s15FeedbackService15FBKSInteractionC7ContentO19ImageTextCodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B46FFA4 + 4 * byte_23B486F42[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B46FFD8 + 4 * byte_23B486F3D[v4]))();
}

uint64_t sub_23B46FFD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B46FFE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B46FFE8);
  return result;
}

uint64_t sub_23B46FFF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B46FFFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B470000(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B470008(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.SketchStructuredCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.SketchStructuredCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.NotificationCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.NotificationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.MailMessageCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.MailMessageCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.EmojiCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.EmojiCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.Content.HtmlCodingKeys()
{
  return &type metadata for FBKSInteraction.Content.HtmlCodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.StructuredValue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23B4700B0 + 4 * byte_23B486F4C[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23B4700E4 + 4 * byte_23B486F47[v4]))();
}

uint64_t sub_23B4700E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4700EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4700F4);
  return result;
}

uint64_t sub_23B470100(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B470108);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23B47010C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B470114(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.CodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.BoolCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.BoolCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.IntegerCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.DoubleCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.DoubleCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.StringCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.StringCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.ArrayCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.ArrayCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.DictionaryCodingKeys()
{
  return &type metadata for FBKSInteraction.StructuredValue.DictionaryCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.StructuredValue.StructuredValueError()
{
  return &type metadata for FBKSInteraction.StructuredValue.StructuredValueError;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.FeatureDomain.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.FeatureDomain.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_23B47027C + 4 * byte_23B486F56[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_23B4702B0 + 4 * byte_23B486F51[v4]))();
}

uint64_t sub_23B4702B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4702B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4702C0);
  return result;
}

uint64_t sub_23B4702CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B4702D4);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_23B4702D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4702E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.CodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.ImageGenerationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.ImageGenerationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.MemoryCreationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.MemoryCreationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.HandwritingCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.HandwritingCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.SystemAssistantCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.SystemAssistantCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.DeviceExpertCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.DeviceExpertCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.WritingToolsCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.WritingToolsCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.SmartRepliesCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.SmartRepliesCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.EmojiGenerationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.EmojiGenerationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.MailSummarizationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.MailSummarizationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.MailHighlightsCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.MailHighlightsCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.MessagesSummarizationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.MessagesSummarizationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.NotificationsSummarizationCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.NotificationsSummarizationCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.NotificationsHighlightsCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.NotificationsHighlightsCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.NotificationsBreakthroughCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.NotificationsBreakthroughCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.MagicPaperCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.MagicPaperCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.SwiftAssistCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.SwiftAssistCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.PhotosCleanupCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.PhotosCleanupCodingKeys;
}

uint64_t _s15FeedbackService15FBKSInteractionC16InteractionErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B47044C + 4 * byte_23B486F5B[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B47046C + 4 * byte_23B486F60[v4]))();
}

_BYTE *sub_23B47044C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B47046C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B470474(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B47047C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B470484(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B47048C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.TemporaryCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.TemporaryCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSInteraction.FeatureDomain.TestCodingKeys()
{
  return &type metadata for FBKSInteraction.FeatureDomain.TestCodingKeys;
}

uint64_t getEnumTagSinglePayload for FBKSInteraction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSInteraction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23B470594 + 4 * byte_23B486F6A[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23B4705C8 + 4 * byte_23B486F65[v4]))();
}

uint64_t sub_23B4705C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4705D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4705D8);
  return result;
}

uint64_t sub_23B4705E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B4705ECLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23B4705F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4705F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSInteraction.CodingKeys()
{
  return &type metadata for FBKSInteraction.CodingKeys;
}

unint64_t sub_23B470618()
{
  unint64_t result;

  result = qword_256A1B360;
  if (!qword_256A1B360)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487BB4, &type metadata for FBKSInteraction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B360);
  }
  return result;
}

unint64_t sub_23B470660()
{
  unint64_t result;

  result = qword_256A1B368;
  if (!qword_256A1B368)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487CBC, &type metadata for FBKSInteraction.FeatureDomain.TemporaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B368);
  }
  return result;
}

unint64_t sub_23B4706A8()
{
  unint64_t result;

  result = qword_256A1B370;
  if (!qword_256A1B370)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4882C4, &type metadata for FBKSInteraction.FeatureDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B370);
  }
  return result;
}

unint64_t sub_23B4706F0()
{
  unint64_t result;

  result = qword_256A1B378;
  if (!qword_256A1B378)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488364, &type metadata for FBKSInteraction.StructuredValue.StructuredValueError);
    atomic_store(result, (unint64_t *)&qword_256A1B378);
  }
  return result;
}

unint64_t sub_23B470738()
{
  unint64_t result;

  result = qword_256A1B380;
  if (!qword_256A1B380)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48841C, &type metadata for FBKSInteraction.StructuredValue.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B380);
  }
  return result;
}

unint64_t sub_23B470780()
{
  unint64_t result;

  result = qword_256A1B388;
  if (!qword_256A1B388)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4884D4, &type metadata for FBKSInteraction.StructuredValue.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B388);
  }
  return result;
}

unint64_t sub_23B4707C8()
{
  unint64_t result;

  result = qword_256A1B390;
  if (!qword_256A1B390)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48858C, &type metadata for FBKSInteraction.StructuredValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B390);
  }
  return result;
}

unint64_t sub_23B470810()
{
  unint64_t result;

  result = qword_256A1B398;
  if (!qword_256A1B398)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488644, &type metadata for FBKSInteraction.StructuredValue.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B398);
  }
  return result;
}

unint64_t sub_23B470858()
{
  unint64_t result;

  result = qword_256A1B3A0;
  if (!qword_256A1B3A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4886FC, &type metadata for FBKSInteraction.StructuredValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3A0);
  }
  return result;
}

unint64_t sub_23B4708A0()
{
  unint64_t result;

  result = qword_256A1B3A8;
  if (!qword_256A1B3A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4887B4, &type metadata for FBKSInteraction.StructuredValue.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3A8);
  }
  return result;
}

unint64_t sub_23B4708E8()
{
  unint64_t result;

  result = qword_256A1B3B0;
  if (!qword_256A1B3B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48886C, &type metadata for FBKSInteraction.StructuredValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3B0);
  }
  return result;
}

unint64_t sub_23B470930()
{
  unint64_t result;

  result = qword_256A1B3B8;
  if (!qword_256A1B3B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488924, &type metadata for FBKSInteraction.Content.HtmlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3B8);
  }
  return result;
}

unint64_t sub_23B470978()
{
  unint64_t result;

  result = qword_256A1B3C0;
  if (!qword_256A1B3C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4889DC, &type metadata for FBKSInteraction.Content.EmojiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3C0);
  }
  return result;
}

unint64_t sub_23B4709C0()
{
  unint64_t result;

  result = qword_256A1B3C8;
  if (!qword_256A1B3C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488A94, &type metadata for FBKSInteraction.Content.MailMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3C8);
  }
  return result;
}

unint64_t sub_23B470A08()
{
  unint64_t result;

  result = qword_256A1B3D0;
  if (!qword_256A1B3D0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488B4C, &type metadata for FBKSInteraction.Content.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3D0);
  }
  return result;
}

unint64_t sub_23B470A50()
{
  unint64_t result;

  result = qword_256A1B3D8;
  if (!qword_256A1B3D8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488C04, &type metadata for FBKSInteraction.Content.SketchStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3D8);
  }
  return result;
}

unint64_t sub_23B470A98()
{
  unint64_t result;

  result = qword_256A1B3E0;
  if (!qword_256A1B3E0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488CBC, &type metadata for FBKSInteraction.Content.ImageStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3E0);
  }
  return result;
}

unint64_t sub_23B470AE0()
{
  unint64_t result;

  result = qword_256A1B3E8;
  if (!qword_256A1B3E8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488D74, &type metadata for FBKSInteraction.Content.StructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3E8);
  }
  return result;
}

unint64_t sub_23B470B28()
{
  unint64_t result;

  result = qword_256A1B3F0;
  if (!qword_256A1B3F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488E2C, &type metadata for FBKSInteraction.Content.SourceCodeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3F0);
  }
  return result;
}

unint64_t sub_23B470B70()
{
  unint64_t result;

  result = qword_256A1B3F8;
  if (!qword_256A1B3F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488EE4, &type metadata for FBKSInteraction.Content.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B3F8);
  }
  return result;
}

unint64_t sub_23B470BB8()
{
  unint64_t result;

  result = qword_256A1B400;
  if (!qword_256A1B400)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488F9C, &type metadata for FBKSInteraction.Content.SketchTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B400);
  }
  return result;
}

unint64_t sub_23B470C00()
{
  unint64_t result;

  result = qword_256A1B408;
  if (!qword_256A1B408)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489054, &type metadata for FBKSInteraction.Content.ImageTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B408);
  }
  return result;
}

unint64_t sub_23B470C48()
{
  unint64_t result;

  result = qword_256A1B410;
  if (!qword_256A1B410)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48910C, &type metadata for FBKSInteraction.Content.SketchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B410);
  }
  return result;
}

unint64_t sub_23B470C90()
{
  unint64_t result;

  result = qword_256A1B418;
  if (!qword_256A1B418)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4891C4, &type metadata for FBKSInteraction.Content.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B418);
  }
  return result;
}

unint64_t sub_23B470CD8()
{
  unint64_t result;

  result = qword_256A1B420;
  if (!qword_256A1B420)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48927C, &type metadata for FBKSInteraction.Content.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B420);
  }
  return result;
}

unint64_t sub_23B470D20()
{
  unint64_t result;

  result = qword_256A1B428;
  if (!qword_256A1B428)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489334, &type metadata for FBKSInteraction.Content.ImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B428);
  }
  return result;
}

unint64_t sub_23B470D68()
{
  unint64_t result;

  result = qword_256A1B430;
  if (!qword_256A1B430)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4893EC, &type metadata for FBKSInteraction.Content.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B430);
  }
  return result;
}

unint64_t sub_23B470DB0()
{
  unint64_t result;

  result = qword_256A1B438;
  if (!qword_256A1B438)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4894A4, &type metadata for FBKSInteraction.Content.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B438);
  }
  return result;
}

unint64_t sub_23B470DF8()
{
  unint64_t result;

  result = qword_256A1B440;
  if (!qword_256A1B440)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48955C, &type metadata for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B440);
  }
  return result;
}

unint64_t sub_23B470E40()
{
  unint64_t result;

  result = qword_256A1B448;
  if (!qword_256A1B448)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489614, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B448);
  }
  return result;
}

unint64_t sub_23B470E88()
{
  unint64_t result;

  result = qword_256A1B450;
  if (!qword_256A1B450)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4896CC, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B450);
  }
  return result;
}

unint64_t sub_23B470ED0()
{
  unint64_t result;

  result = qword_256A1B458;
  if (!qword_256A1B458)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489824, &type metadata for FBKSInteraction.EvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B458);
  }
  return result;
}

unint64_t sub_23B470F18()
{
  unint64_t result;

  result = qword_256A1B460;
  if (!qword_256A1B460)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489744, &type metadata for FBKSInteraction.EvaluationResponse.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B460);
  }
  return result;
}

unint64_t sub_23B470F60()
{
  unint64_t result;

  result = qword_256A1B468;
  if (!qword_256A1B468)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48976C, &type metadata for FBKSInteraction.EvaluationResponse.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B468);
  }
  return result;
}

unint64_t sub_23B470FA8()
{
  unint64_t result;

  result = qword_256A1B470;
  if (!qword_256A1B470)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4896F4, &type metadata for FBKSInteraction.EvaluationResponse.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B470);
  }
  return result;
}

unint64_t sub_23B470FF0()
{
  unint64_t result;

  result = qword_256A1B478;
  if (!qword_256A1B478)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48971C, &type metadata for FBKSInteraction.EvaluationResponse.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B478);
  }
  return result;
}

unint64_t sub_23B471038()
{
  unint64_t result;

  result = qword_256A1B480;
  if (!qword_256A1B480)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48963C, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B480);
  }
  return result;
}

unint64_t sub_23B471080()
{
  unint64_t result;

  result = qword_256A1B488;
  if (!qword_256A1B488)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489664, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsUpCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B488);
  }
  return result;
}

unint64_t sub_23B4710C8()
{
  unint64_t result;

  result = qword_256A1B490;
  if (!qword_256A1B490)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489584, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B490);
  }
  return result;
}

unint64_t sub_23B471110()
{
  unint64_t result;

  result = qword_256A1B498;
  if (!qword_256A1B498)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4895AC, &type metadata for FBKSInteraction.EvaluationResponse.ThumbsDownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B498);
  }
  return result;
}

unint64_t sub_23B471158()
{
  unint64_t result;

  result = qword_256A1B4A0;
  if (!qword_256A1B4A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4894CC, &type metadata for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4A0);
  }
  return result;
}

unint64_t sub_23B4711A0()
{
  unint64_t result;

  result = qword_256A1B4A8;
  if (!qword_256A1B4A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4894F4, &type metadata for FBKSInteraction.EvaluationResponse.ReportConcernCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4A8);
  }
  return result;
}

unint64_t sub_23B4711E8()
{
  unint64_t result;

  result = qword_256A1B4B0;
  if (!qword_256A1B4B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489794, &type metadata for FBKSInteraction.EvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4B0);
  }
  return result;
}

unint64_t sub_23B471230()
{
  unint64_t result;

  result = qword_256A1B4B8;
  if (!qword_256A1B4B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4897BC, &type metadata for FBKSInteraction.EvaluationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4B8);
  }
  return result;
}

unint64_t sub_23B471278()
{
  unint64_t result;

  result = qword_256A1B4C0;
  if (!qword_256A1B4C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48935C, &type metadata for FBKSInteraction.Content.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4C0);
  }
  return result;
}

unint64_t sub_23B4712C0()
{
  unint64_t result;

  result = qword_256A1B4C8;
  if (!qword_256A1B4C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489384, &type metadata for FBKSInteraction.Content.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4C8);
  }
  return result;
}

unint64_t sub_23B471308()
{
  unint64_t result;

  result = qword_256A1B4D0;
  if (!qword_256A1B4D0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4892A4, &type metadata for FBKSInteraction.Content.ImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4D0);
  }
  return result;
}

unint64_t sub_23B471350()
{
  unint64_t result;

  result = qword_256A1B4D8;
  if (!qword_256A1B4D8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4892CC, &type metadata for FBKSInteraction.Content.ImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4D8);
  }
  return result;
}

unint64_t sub_23B471398()
{
  unint64_t result;

  result = qword_256A1B4E0;
  if (!qword_256A1B4E0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4891EC, &type metadata for FBKSInteraction.Content.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4E0);
  }
  return result;
}

unint64_t sub_23B4713E0()
{
  unint64_t result;

  result = qword_256A1B4E8;
  if (!qword_256A1B4E8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489214, &type metadata for FBKSInteraction.Content.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4E8);
  }
  return result;
}

unint64_t sub_23B471428()
{
  unint64_t result;

  result = qword_256A1B4F0;
  if (!qword_256A1B4F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489134, &type metadata for FBKSInteraction.Content.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4F0);
  }
  return result;
}

unint64_t sub_23B471470()
{
  unint64_t result;

  result = qword_256A1B4F8;
  if (!qword_256A1B4F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48915C, &type metadata for FBKSInteraction.Content.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B4F8);
  }
  return result;
}

unint64_t sub_23B4714B8()
{
  unint64_t result;

  result = qword_256A1B500;
  if (!qword_256A1B500)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48907C, &type metadata for FBKSInteraction.Content.SketchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B500);
  }
  return result;
}

unint64_t sub_23B471500()
{
  unint64_t result;

  result = qword_256A1B508;
  if (!qword_256A1B508)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4890A4, &type metadata for FBKSInteraction.Content.SketchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B508);
  }
  return result;
}

unint64_t sub_23B471548()
{
  unint64_t result;

  result = qword_256A1B510;
  if (!qword_256A1B510)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488FC4, &type metadata for FBKSInteraction.Content.ImageTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B510);
  }
  return result;
}

unint64_t sub_23B471590()
{
  unint64_t result;

  result = qword_256A1B518;
  if (!qword_256A1B518)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488FEC, &type metadata for FBKSInteraction.Content.ImageTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B518);
  }
  return result;
}

unint64_t sub_23B4715D8()
{
  unint64_t result;

  result = qword_256A1B520;
  if (!qword_256A1B520)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488F0C, &type metadata for FBKSInteraction.Content.SketchTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B520);
  }
  return result;
}

unint64_t sub_23B471620()
{
  unint64_t result;

  result = qword_256A1B528;
  if (!qword_256A1B528)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488F34, &type metadata for FBKSInteraction.Content.SketchTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B528);
  }
  return result;
}

unint64_t sub_23B471668()
{
  unint64_t result;

  result = qword_256A1B530;
  if (!qword_256A1B530)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488E54, &type metadata for FBKSInteraction.Content.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B530);
  }
  return result;
}

unint64_t sub_23B4716B0()
{
  unint64_t result;

  result = qword_256A1B538;
  if (!qword_256A1B538)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488E7C, &type metadata for FBKSInteraction.Content.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B538);
  }
  return result;
}

unint64_t sub_23B4716F8()
{
  unint64_t result;

  result = qword_256A1B540;
  if (!qword_256A1B540)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488D9C, &type metadata for FBKSInteraction.Content.SourceCodeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B540);
  }
  return result;
}

unint64_t sub_23B471740()
{
  unint64_t result;

  result = qword_256A1B548;
  if (!qword_256A1B548)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488DC4, &type metadata for FBKSInteraction.Content.SourceCodeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B548);
  }
  return result;
}

unint64_t sub_23B471788()
{
  unint64_t result;

  result = qword_256A1B550;
  if (!qword_256A1B550)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488CE4, &type metadata for FBKSInteraction.Content.StructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B550);
  }
  return result;
}

unint64_t sub_23B4717D0()
{
  unint64_t result;

  result = qword_256A1B558;
  if (!qword_256A1B558)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488D0C, &type metadata for FBKSInteraction.Content.StructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B558);
  }
  return result;
}

unint64_t sub_23B471818()
{
  unint64_t result;

  result = qword_256A1B560;
  if (!qword_256A1B560)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488C2C, &type metadata for FBKSInteraction.Content.ImageStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B560);
  }
  return result;
}

unint64_t sub_23B471860()
{
  unint64_t result;

  result = qword_256A1B568;
  if (!qword_256A1B568)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488C54, &type metadata for FBKSInteraction.Content.ImageStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B568);
  }
  return result;
}

unint64_t sub_23B4718A8()
{
  unint64_t result;

  result = qword_256A1B570;
  if (!qword_256A1B570)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488B74, &type metadata for FBKSInteraction.Content.SketchStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B570);
  }
  return result;
}

unint64_t sub_23B4718F0()
{
  unint64_t result;

  result = qword_256A1B578;
  if (!qword_256A1B578)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488B9C, &type metadata for FBKSInteraction.Content.SketchStructuredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B578);
  }
  return result;
}

unint64_t sub_23B471938()
{
  unint64_t result;

  result = qword_256A1B580;
  if (!qword_256A1B580)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488ABC, &type metadata for FBKSInteraction.Content.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B580);
  }
  return result;
}

unint64_t sub_23B471980()
{
  unint64_t result;

  result = qword_256A1B588;
  if (!qword_256A1B588)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488AE4, &type metadata for FBKSInteraction.Content.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B588);
  }
  return result;
}

unint64_t sub_23B4719C8()
{
  unint64_t result;

  result = qword_256A1B590;
  if (!qword_256A1B590)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488A04, &type metadata for FBKSInteraction.Content.MailMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B590);
  }
  return result;
}

unint64_t sub_23B471A10()
{
  unint64_t result;

  result = qword_256A1B598;
  if (!qword_256A1B598)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488A2C, &type metadata for FBKSInteraction.Content.MailMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B598);
  }
  return result;
}

unint64_t sub_23B471A58()
{
  unint64_t result;

  result = qword_256A1B5A0;
  if (!qword_256A1B5A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48894C, &type metadata for FBKSInteraction.Content.EmojiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5A0);
  }
  return result;
}

unint64_t sub_23B471AA0()
{
  unint64_t result;

  result = qword_256A1B5A8;
  if (!qword_256A1B5A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488974, &type metadata for FBKSInteraction.Content.EmojiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5A8);
  }
  return result;
}

unint64_t sub_23B471AE8()
{
  unint64_t result;

  result = qword_256A1B5B0;
  if (!qword_256A1B5B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488894, &type metadata for FBKSInteraction.Content.HtmlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5B0);
  }
  return result;
}

unint64_t sub_23B471B30()
{
  unint64_t result;

  result = qword_256A1B5B8;
  if (!qword_256A1B5B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4888BC, &type metadata for FBKSInteraction.Content.HtmlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5B8);
  }
  return result;
}

unint64_t sub_23B471B78()
{
  unint64_t result;

  result = qword_256A1B5C0;
  if (!qword_256A1B5C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B489414, &type metadata for FBKSInteraction.Content.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5C0);
  }
  return result;
}

unint64_t sub_23B471BC0()
{
  unint64_t result;

  result = qword_256A1B5C8;
  if (!qword_256A1B5C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48943C, &type metadata for FBKSInteraction.Content.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5C8);
  }
  return result;
}

unint64_t sub_23B471C08()
{
  unint64_t result;

  result = qword_256A1B5D0;
  if (!qword_256A1B5D0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488724, &type metadata for FBKSInteraction.StructuredValue.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5D0);
  }
  return result;
}

unint64_t sub_23B471C50()
{
  unint64_t result;

  result = qword_256A1B5D8;
  if (!qword_256A1B5D8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48874C, &type metadata for FBKSInteraction.StructuredValue.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5D8);
  }
  return result;
}

unint64_t sub_23B471C98()
{
  unint64_t result;

  result = qword_256A1B5E0;
  if (!qword_256A1B5E0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48866C, &type metadata for FBKSInteraction.StructuredValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5E0);
  }
  return result;
}

unint64_t sub_23B471CE0()
{
  unint64_t result;

  result = qword_256A1B5E8;
  if (!qword_256A1B5E8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488694, &type metadata for FBKSInteraction.StructuredValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5E8);
  }
  return result;
}

unint64_t sub_23B471D28()
{
  unint64_t result;

  result = qword_256A1B5F0;
  if (!qword_256A1B5F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4885B4, &type metadata for FBKSInteraction.StructuredValue.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5F0);
  }
  return result;
}

unint64_t sub_23B471D70()
{
  unint64_t result;

  result = qword_256A1B5F8;
  if (!qword_256A1B5F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4885DC, &type metadata for FBKSInteraction.StructuredValue.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B5F8);
  }
  return result;
}

unint64_t sub_23B471DB8()
{
  unint64_t result;

  result = qword_256A1B600;
  if (!qword_256A1B600)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4884FC, &type metadata for FBKSInteraction.StructuredValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B600);
  }
  return result;
}

unint64_t sub_23B471E00()
{
  unint64_t result;

  result = qword_256A1B608;
  if (!qword_256A1B608)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488524, &type metadata for FBKSInteraction.StructuredValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B608);
  }
  return result;
}

unint64_t sub_23B471E48()
{
  unint64_t result;

  result = qword_256A1B610;
  if (!qword_256A1B610)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488444, &type metadata for FBKSInteraction.StructuredValue.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B610);
  }
  return result;
}

unint64_t sub_23B471E90()
{
  unint64_t result;

  result = qword_256A1B618;
  if (!qword_256A1B618)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48846C, &type metadata for FBKSInteraction.StructuredValue.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B618);
  }
  return result;
}

unint64_t sub_23B471ED8()
{
  unint64_t result;

  result = qword_256A1B620;
  if (!qword_256A1B620)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48838C, &type metadata for FBKSInteraction.StructuredValue.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B620);
  }
  return result;
}

unint64_t sub_23B471F20()
{
  unint64_t result;

  result = qword_256A1B628;
  if (!qword_256A1B628)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4883B4, &type metadata for FBKSInteraction.StructuredValue.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B628);
  }
  return result;
}

unint64_t sub_23B471F68()
{
  unint64_t result;

  result = qword_256A1B630;
  if (!qword_256A1B630)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4887DC, &type metadata for FBKSInteraction.StructuredValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B630);
  }
  return result;
}

unint64_t sub_23B471FB0()
{
  unint64_t result;

  result = qword_256A1B638;
  if (!qword_256A1B638)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488804, &type metadata for FBKSInteraction.StructuredValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B638);
  }
  return result;
}

unint64_t sub_23B471FF8()
{
  unint64_t result;

  result = qword_256A1B640;
  if (!qword_256A1B640)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4881E4, &type metadata for FBKSInteraction.FeatureDomain.ImageGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B640);
  }
  return result;
}

unint64_t sub_23B472040()
{
  unint64_t result;

  result = qword_256A1B648;
  if (!qword_256A1B648)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48820C, &type metadata for FBKSInteraction.FeatureDomain.ImageGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B648);
  }
  return result;
}

unint64_t sub_23B472088()
{
  unint64_t result;

  result = qword_256A1B650;
  if (!qword_256A1B650)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488194, &type metadata for FBKSInteraction.FeatureDomain.MemoryCreationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B650);
  }
  return result;
}

unint64_t sub_23B4720D0()
{
  unint64_t result;

  result = qword_256A1B658;
  if (!qword_256A1B658)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4881BC, &type metadata for FBKSInteraction.FeatureDomain.MemoryCreationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B658);
  }
  return result;
}

unint64_t sub_23B472118()
{
  unint64_t result;

  result = qword_256A1B660;
  if (!qword_256A1B660)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488144, &type metadata for FBKSInteraction.FeatureDomain.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B660);
  }
  return result;
}

unint64_t sub_23B472160()
{
  unint64_t result;

  result = qword_256A1B668;
  if (!qword_256A1B668)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48816C, &type metadata for FBKSInteraction.FeatureDomain.HandwritingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B668);
  }
  return result;
}

unint64_t sub_23B4721A8()
{
  unint64_t result;

  result = qword_256A1B670;
  if (!qword_256A1B670)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4880F4, &type metadata for FBKSInteraction.FeatureDomain.SystemAssistantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B670);
  }
  return result;
}

unint64_t sub_23B4721F0()
{
  unint64_t result;

  result = qword_256A1B678;
  if (!qword_256A1B678)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48811C, &type metadata for FBKSInteraction.FeatureDomain.SystemAssistantCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B678);
  }
  return result;
}

unint64_t sub_23B472238()
{
  unint64_t result;

  result = qword_256A1B680;
  if (!qword_256A1B680)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4880A4, &type metadata for FBKSInteraction.FeatureDomain.DeviceExpertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B680);
  }
  return result;
}

unint64_t sub_23B472280()
{
  unint64_t result;

  result = qword_256A1B688;
  if (!qword_256A1B688)
  {
    result = MEMORY[0x23B8651F0](&unk_23B4880CC, &type metadata for FBKSInteraction.FeatureDomain.DeviceExpertCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B688);
  }
  return result;
}

unint64_t sub_23B4722C8()
{
  unint64_t result;

  result = qword_256A1B690;
  if (!qword_256A1B690)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488054, &type metadata for FBKSInteraction.FeatureDomain.WritingToolsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B690);
  }
  return result;
}

unint64_t sub_23B472310()
{
  unint64_t result;

  result = qword_256A1B698;
  if (!qword_256A1B698)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48807C, &type metadata for FBKSInteraction.FeatureDomain.WritingToolsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B698);
  }
  return result;
}

unint64_t sub_23B472358()
{
  unint64_t result;

  result = qword_256A1B6A0;
  if (!qword_256A1B6A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488004, &type metadata for FBKSInteraction.FeatureDomain.SmartRepliesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6A0);
  }
  return result;
}

unint64_t sub_23B4723A0()
{
  unint64_t result;

  result = qword_256A1B6A8;
  if (!qword_256A1B6A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48802C, &type metadata for FBKSInteraction.FeatureDomain.SmartRepliesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6A8);
  }
  return result;
}

unint64_t sub_23B4723E8()
{
  unint64_t result;

  result = qword_256A1B6B0;
  if (!qword_256A1B6B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487FB4, &type metadata for FBKSInteraction.FeatureDomain.EmojiGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6B0);
  }
  return result;
}

unint64_t sub_23B472430()
{
  unint64_t result;

  result = qword_256A1B6B8;
  if (!qword_256A1B6B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487FDC, &type metadata for FBKSInteraction.FeatureDomain.EmojiGenerationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6B8);
  }
  return result;
}

unint64_t sub_23B472478()
{
  unint64_t result;

  result = qword_256A1B6C0;
  if (!qword_256A1B6C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487F64, &type metadata for FBKSInteraction.FeatureDomain.MailSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6C0);
  }
  return result;
}

unint64_t sub_23B4724C0()
{
  unint64_t result;

  result = qword_256A1B6C8;
  if (!qword_256A1B6C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487F8C, &type metadata for FBKSInteraction.FeatureDomain.MailSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6C8);
  }
  return result;
}

unint64_t sub_23B472508()
{
  unint64_t result;

  result = qword_256A1B6D0;
  if (!qword_256A1B6D0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487F14, &type metadata for FBKSInteraction.FeatureDomain.MailHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6D0);
  }
  return result;
}

unint64_t sub_23B472550()
{
  unint64_t result;

  result = qword_256A1B6D8;
  if (!qword_256A1B6D8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487F3C, &type metadata for FBKSInteraction.FeatureDomain.MailHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6D8);
  }
  return result;
}

unint64_t sub_23B472598()
{
  unint64_t result;

  result = qword_256A1B6E0;
  if (!qword_256A1B6E0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487EC4, &type metadata for FBKSInteraction.FeatureDomain.MessagesSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6E0);
  }
  return result;
}

unint64_t sub_23B4725E0()
{
  unint64_t result;

  result = qword_256A1B6E8;
  if (!qword_256A1B6E8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487EEC, &type metadata for FBKSInteraction.FeatureDomain.MessagesSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6E8);
  }
  return result;
}

unint64_t sub_23B472628()
{
  unint64_t result;

  result = qword_256A1B6F0;
  if (!qword_256A1B6F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487E74, &type metadata for FBKSInteraction.FeatureDomain.NotificationsSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6F0);
  }
  return result;
}

unint64_t sub_23B472670()
{
  unint64_t result;

  result = qword_256A1B6F8;
  if (!qword_256A1B6F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487E9C, &type metadata for FBKSInteraction.FeatureDomain.NotificationsSummarizationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B6F8);
  }
  return result;
}

unint64_t sub_23B4726B8()
{
  unint64_t result;

  result = qword_256A1B700;
  if (!qword_256A1B700)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487E24, &type metadata for FBKSInteraction.FeatureDomain.NotificationsHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B700);
  }
  return result;
}

unint64_t sub_23B472700()
{
  unint64_t result;

  result = qword_256A1B708;
  if (!qword_256A1B708)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487E4C, &type metadata for FBKSInteraction.FeatureDomain.NotificationsHighlightsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B708);
  }
  return result;
}

unint64_t sub_23B472748()
{
  unint64_t result;

  result = qword_256A1B710;
  if (!qword_256A1B710)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487DD4, &type metadata for FBKSInteraction.FeatureDomain.NotificationsBreakthroughCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B710);
  }
  return result;
}

unint64_t sub_23B472790()
{
  unint64_t result;

  result = qword_256A1B718;
  if (!qword_256A1B718)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487DFC, &type metadata for FBKSInteraction.FeatureDomain.NotificationsBreakthroughCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B718);
  }
  return result;
}

unint64_t sub_23B4727D8()
{
  unint64_t result;

  result = qword_256A1B720;
  if (!qword_256A1B720)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487D84, &type metadata for FBKSInteraction.FeatureDomain.MagicPaperCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B720);
  }
  return result;
}

unint64_t sub_23B472820()
{
  unint64_t result;

  result = qword_256A1B728;
  if (!qword_256A1B728)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487DAC, &type metadata for FBKSInteraction.FeatureDomain.MagicPaperCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B728);
  }
  return result;
}

unint64_t sub_23B472868()
{
  unint64_t result;

  result = qword_256A1B730;
  if (!qword_256A1B730)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487D34, &type metadata for FBKSInteraction.FeatureDomain.SwiftAssistCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B730);
  }
  return result;
}

unint64_t sub_23B4728B0()
{
  unint64_t result;

  result = qword_256A1B738;
  if (!qword_256A1B738)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487D5C, &type metadata for FBKSInteraction.FeatureDomain.SwiftAssistCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B738);
  }
  return result;
}

unint64_t sub_23B4728F8()
{
  unint64_t result;

  result = qword_256A1B740;
  if (!qword_256A1B740)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487CE4, &type metadata for FBKSInteraction.FeatureDomain.PhotosCleanupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B740);
  }
  return result;
}

unint64_t sub_23B472940()
{
  unint64_t result;

  result = qword_256A1B748;
  if (!qword_256A1B748)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487D0C, &type metadata for FBKSInteraction.FeatureDomain.PhotosCleanupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B748);
  }
  return result;
}

unint64_t sub_23B472988()
{
  unint64_t result;

  result = qword_256A1B750;
  if (!qword_256A1B750)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487C2C, &type metadata for FBKSInteraction.FeatureDomain.TemporaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B750);
  }
  return result;
}

unint64_t sub_23B4729D0()
{
  unint64_t result;

  result = qword_256A1B758;
  if (!qword_256A1B758)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487C54, &type metadata for FBKSInteraction.FeatureDomain.TemporaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B758);
  }
  return result;
}

unint64_t sub_23B472A18()
{
  unint64_t result;

  result = qword_256A1B760;
  if (!qword_256A1B760)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487BDC, &type metadata for FBKSInteraction.FeatureDomain.TestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B760);
  }
  return result;
}

unint64_t sub_23B472A60()
{
  unint64_t result;

  result = qword_256A1B768;
  if (!qword_256A1B768)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487C04, &type metadata for FBKSInteraction.FeatureDomain.TestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B768);
  }
  return result;
}

unint64_t sub_23B472AA8()
{
  unint64_t result;

  result = qword_256A1B770;
  if (!qword_256A1B770)
  {
    result = MEMORY[0x23B8651F0](&unk_23B488234, &type metadata for FBKSInteraction.FeatureDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B770);
  }
  return result;
}

unint64_t sub_23B472AF0()
{
  unint64_t result;

  result = qword_256A1B778;
  if (!qword_256A1B778)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48825C, &type metadata for FBKSInteraction.FeatureDomain.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B778);
  }
  return result;
}

unint64_t sub_23B472B38()
{
  unint64_t result;

  result = qword_256A1B780;
  if (!qword_256A1B780)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487B24, &type metadata for FBKSInteraction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B780);
  }
  return result;
}

unint64_t sub_23B472B80()
{
  unint64_t result;

  result = qword_256A1B788;
  if (!qword_256A1B788)
  {
    result = MEMORY[0x23B8651F0](&unk_23B487B4C, &type metadata for FBKSInteraction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B788);
  }
  return result;
}

uint64_t sub_23B472BC4()
{
  return objectdestroy_29Tm(&qword_256A1B790);
}

uint64_t sub_23B472BD0(uint64_t a1, char a2)
{
  return sub_23B472C90(a1, a2, &qword_256A1B790, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B468A6C);
}

void sub_23B472BE4(void *a1)
{
  uint64_t v1;

  sub_23B467CEC(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

void sub_23B472BEC(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_23B467F10(a1, a2, a3, *(void (**)(void *, uint64_t))(v3 + 16));
}

unint64_t sub_23B472BF4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256A1B798;
  if (!qword_256A1B798)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1B2F0);
    v2 = sub_23B44646C(&qword_256A1A930, (uint64_t (*)(uint64_t))type metadata accessor for FBKSDonation, (uint64_t)&protocol conformance descriptor for FBKSInteraction);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256A1B798);
  }
  return result;
}

uint64_t sub_23B472C70()
{
  return objectdestroy_29Tm(&qword_256A1B7D0);
}

uint64_t sub_23B472C7C(uint64_t a1, char a2)
{
  return sub_23B472C90(a1, a2, &qword_256A1B7D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B46695C);
}

uint64_t sub_23B472C90(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v6 = a2 & 1;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8) + 80);
  return a4(a1, v6, v4 + ((v7 + 16) & ~v7));
}

uint64_t sub_23B472CEC()
{
  return objectdestroy_29Tm(&qword_256A1A918);
}

uint64_t sub_23B472CF8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B44BA00(a1);
}

uint64_t sub_23B472D54()
{
  sub_23B483848();
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

uint64_t sub_23B472DBC()
{
  sub_23B483848();
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

uint64_t sub_23B472E64()
{
  sub_23B48347C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B472EA4()
{
  sub_23B48347C();
  return swift_bridgeObjectRelease();
}

void sub_23B472F24(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23B472F6C()
{
  sub_23B48347C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B473020()
{
  sub_23B48347C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B473060()
{
  sub_23B483848();
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

void sub_23B4730C4(uint64_t a1, char a2)
{
  sub_23B483848();
  __asm { BR              X10 }
}

uint64_t sub_23B47311C()
{
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

uint64_t sub_23B4731E8()
{
  sub_23B483848();
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

uint64_t sub_23B47328C()
{
  sub_23B483848();
  sub_23B48347C();
  swift_bridgeObjectRelease();
  return sub_23B483878();
}

uint64_t sub_23B4732F0(char a1, char a2)
{
  char v3;

  if (qword_23B48B318[a1] == qword_23B48B318[a2] && qword_23B48B350[a1] == qword_23B48B350[a2])
    v3 = 1;
  else
    v3 = sub_23B4837D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23B473374(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x73726577736E61;
    else
      v3 = 0xD000000000000014;
    if (v2 == 1)
      v4 = 0xE700000000000000;
    else
      v4 = 0x800000023B48CE30;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x73726577736E61;
      else
        v6 = 0xD000000000000014;
      if (v5 == 1)
        v7 = 0xE700000000000000;
      else
        v7 = 0x800000023B48CE30;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v3 = 0x696669746E656469;
    v4 = 0xEA00000000007265;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xEA00000000007265;
  if (v3 != 0x696669746E656469)
  {
LABEL_21:
    v8 = sub_23B4837D0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_23B473488(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23B4734D8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23B473594 + 4 * byte_23B48AAA8[a2]))(0x745374706D6F7270);
}

uint64_t sub_23B473594(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x745374706D6F7270 && v1 == 0xEB00000000656C79)
    v2 = 1;
  else
    v2 = sub_23B4837D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_23B473684(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aThumbsUthumbsD_0[8 * a1] == *(_QWORD *)&aThumbsUthumbsD_0[8 * a2]
    && *(_QWORD *)&aInvalidContent_0[8 * a1 + 16] == *(_QWORD *)&aInvalidContent_0[8 * a2 + 16])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_23B4837D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

unint64_t sub_23B473708(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7B8);
  v2 = sub_23B483698();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23B477E28(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23B475F0C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23B43F054(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23B473830(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B930);
  v2 = (_QWORD *)sub_23B483698();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23B475F0C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23B473950(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B928);
  v2 = (_QWORD *)sub_23B483698();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    sub_23B43ED54(v5, v6);
    swift_bridgeObjectRetain();
    result = sub_23B475F70(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t FBKSForm.AuthenticationMethod.description.getter(uint64_t a1)
{
  uint64_t result;

  if ((unint64_t)(a1 - 1) < 3)
    return *(_QWORD *)&aNone[8 * a1 - 8];
  result = sub_23B4837E8();
  __break(1u);
  return result;
}

uint64_t FBKSForm.AuthenticationMethod.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  return result;
}

uint64_t *sub_23B473AE8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = *result - 4;
  v4 = __CFADD__(v3, 3);
  v5 = v3 < 0xFFFFFFFFFFFFFFFDLL;
  if (!v4)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_23B473B08()
{
  sub_23B477DE4();
  return sub_23B4834D0();
}

uint64_t sub_23B473B64()
{
  sub_23B477DE4();
  return sub_23B4834B8();
}

uint64_t sub_23B473BB0()
{
  uint64_t *v0;

  return FBKSForm.AuthenticationMethod.description.getter(*v0);
}

uint64_t FBKSForm.Question.init(stringValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  BOOL v5;
  uint64_t v6;
  uint64_t result;

  v3 = a2;
  v5 = a1 == 0x656C7469743ALL && a2 == 0xE600000000000000;
  if (v5 || (v6 = a1, (sub_23B4837D0() & 1) != 0))
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v3 = 0;
  }
  else if (v6 == 0x616572613ALL && v3 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v3 = 1;
  }
  else if (v6 == 0x706972637365643ALL && v3 == 0xEC0000006E6F6974 || (result = sub_23B4837D0(), (result & 1) != 0))
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v3 = 2;
  }
  *a3 = v6;
  a3[1] = v3;
  return result;
}

uint64_t FBKSForm.Question.stringValue.getter()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v1 = v0[1];
  v2 = *v0;
  if (v1 <= 2)
    v2 = *(_QWORD *)&aTitle_4[8 * v1];
  sub_23B43ED54(*v0, v1);
  return v2;
}

uint64_t FBKSForm.Question.description.getter()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v1 = v0[1];
  v2 = *v0;
  if (v1 <= 2)
    v2 = *(_QWORD *)&aTitle_4[8 * v1];
  sub_23B43ED54(*v0, v1);
  return v2;
}

uint64_t FBKSForm.Question.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_23B483854();
  sub_23B483854();
  return sub_23B48347C();
}

uint64_t sub_23B473E30(char a1)
{
  return *(_QWORD *)&aTitle_5[8 * a1];
}

uint64_t sub_23B473E50()
{
  sub_23B476F8C();
  return sub_23B48389C();
}

uint64_t sub_23B473E78()
{
  sub_23B476F8C();
  return sub_23B4838A8();
}

uint64_t sub_23B473EA0()
{
  char *v0;

  return sub_23B473E30(*v0);
}

uint64_t sub_23B473EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B477C0C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B473ECC(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23B473ED8()
{
  sub_23B476EC0();
  return sub_23B48389C();
}

uint64_t sub_23B473F00()
{
  sub_23B476EC0();
  return sub_23B4838A8();
}

uint64_t sub_23B473F28()
{
  sub_23B476F04();
  return sub_23B48389C();
}

uint64_t sub_23B473F50()
{
  sub_23B476F04();
  return sub_23B4838A8();
}

uint64_t sub_23B473F78()
{
  sub_23B476F48();
  return sub_23B48389C();
}

uint64_t sub_23B473FA0()
{
  sub_23B476F48();
  return sub_23B4838A8();
}

uint64_t sub_23B473FC8()
{
  sub_23B476FD0();
  return sub_23B48389C();
}

uint64_t sub_23B473FF0()
{
  sub_23B476FD0();
  return sub_23B4838A8();
}

uint64_t FBKSForm.Question.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7D8);
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7E0);
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7E8);
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7F0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B7F8);
  v36 = *(_QWORD *)(v15 - 8);
  v37 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *v2;
  v19 = v2[1];
  v27 = v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B476EC0();
  sub_23B483890();
  switch(v19)
  {
    case 0:
      v38 = 0;
      sub_23B476FD0();
      v21 = v37;
      sub_23B483740();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v21);
    case 1:
      v39 = 1;
      sub_23B476F8C();
      v23 = v37;
      sub_23B483740();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v23);
    case 2:
      v40 = 2;
      sub_23B476F48();
      v20 = v30;
      v21 = v37;
      sub_23B483740();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v32);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v21);
    default:
      v41 = 3;
      sub_23B476F04();
      v24 = v33;
      v25 = v37;
      sub_23B483740();
      v26 = v35;
      sub_23B483770();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v25);
  }
}

uint64_t FBKSForm.Question.hashValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23B483848();
  sub_23B483854();
  if (v1 > 2)
    sub_23B48347C();
  return sub_23B483878();
}

uint64_t FBKSForm.Question.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  v30 = a2;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B828);
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B830);
  v23[4] = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B838);
  v23[5] = *(_QWORD *)(v5 - 8);
  v23[6] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v27 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B840);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B848);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_23B476EC0();
  v16 = v32;
  sub_23B483884();
  if (!v16)
  {
    v23[2] = v7;
    v23[3] = v10;
    v23[1] = v8;
    v32 = v12;
    v17 = sub_23B483734();
    v18 = v11;
    if (*(_QWORD *)(v17 + 16) == 1)
      __asm { BR              X10 }
    v19 = sub_23B483644();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
    *v21 = &type metadata for FBKSForm.Question;
    sub_23B4836C8();
    sub_23B483638();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v18);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
}

uint64_t sub_23B474980()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23B483848();
  sub_23B483854();
  if (v1 > 2)
    sub_23B48347C();
  return sub_23B483878();
}

uint64_t sub_23B474A0C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_23B483854();
  sub_23B483854();
  return sub_23B48347C();
}

uint64_t sub_23B474A90()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23B483848();
  sub_23B483854();
  if (v1 > 2)
    sub_23B48347C();
  return sub_23B483878();
}

uint64_t sub_23B474B1C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSForm.Question.init(from:)(a1, a2);
}

uint64_t sub_23B474B30(_QWORD *a1)
{
  return FBKSForm.Question.encode(to:)(a1);
}

uint64_t sub_23B474BB0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_23B474C6C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B474CD4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B474D3C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B474D84()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  swift_beginAccess();
  *v1 = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B474E1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23B474EA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23B474EF0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id FBKSForm.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  unint64_t *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  objc_super v12;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = (unint64_t *)&v5[OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers];
  v7 = v5;
  v8 = MEMORY[0x24BEE4AF8];
  *v6 = sub_23B473950(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v7[OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod] = 3;
  v9 = sub_23B473950(v8);
  swift_beginAccess();
  *v6 = v9;
  swift_bridgeObjectRelease();
  v10 = &v7[OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;

  v12.receiver = v7;
  v12.super_class = v2;
  return objc_msgSendSuper2(&v12, sel_init);
}

id FBKSForm.init(identifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  unint64_t *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  objc_super v11;

  v5 = (unint64_t *)&v2[OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers];
  v6 = v2;
  v7 = MEMORY[0x24BEE4AF8];
  *v5 = sub_23B473950(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v6[OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod] = 3;
  v8 = sub_23B473950(v7);
  swift_beginAccess();
  *v5 = v8;
  swift_bridgeObjectRelease();
  v9 = &v6[OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for FBKSForm();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_23B47519C(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  os_log_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[3];

  v4 = v3;
  v8 = sub_23B4833E0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v12 = a1[1];
  if (qword_256A1A4E0 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  swift_bridgeObjectRetain();
  sub_23B43ED54(v13, v12);
  swift_bridgeObjectRetain();
  sub_23B43ED54(v13, v12);
  v15 = sub_23B4833C8();
  v16 = sub_23B483590();
  if (os_log_type_enabled(v15, v16))
  {
    v37 = v15;
    v38 = v9;
    v39 = v4;
    v17 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v44[0] = v36;
    *(_DWORD *)v17 = 136315394;
    swift_bridgeObjectRetain();
    v40 = a2;
    v43 = sub_23B44BBC0(a2, a3, v44);
    sub_23B4835D8();
    v41 = a3;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    v18 = v13;
    v19 = v12;
    if (v12 <= 2)
    {
      v18 = *(_QWORD *)&aTitle_4[8 * v12];
      v19 = *(_QWORD *)&aDescrip_0[8 * v12 + 8];
    }
    sub_23B43ED54(v13, v12);
    v43 = sub_23B44BBC0(v18, v19, v44);
    sub_23B4835D8();
    swift_bridgeObjectRelease();
    sub_23B43ED68(v13, v12);
    sub_23B43ED68(v13, v12);
    v20 = v37;
    _os_log_impl(&dword_23B433000, v37, v16, "setting answer [%s] for question [%s]", (uint8_t *)v17, 0x16u);
    v21 = v36;
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v21, -1, -1);
    MEMORY[0x23B86528C](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v8);
    a2 = v40;
    a3 = v41;
    v4 = v39;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_23B43ED68(v13, v12);
    sub_23B43ED68(v13, v12);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v22 = (uint64_t *)(v4 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  swift_beginAccess();
  v23 = *v22;
  if (!*(_QWORD *)(*v22 + 16))
    goto LABEL_16;
  sub_23B43ED54(v13, v12);
  swift_bridgeObjectRetain();
  v24 = sub_23B475F70(v13, v12);
  if ((v25 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_23B43ED68(v13, v12);
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A618);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_23B484E90;
    *(_QWORD *)(v33 + 32) = a2;
    *(_QWORD *)(v33 + 40) = a3;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23B43ED54(v13, v12);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42 = *v22;
    *v22 = 0x8000000000000000;
    v32 = v33;
    goto LABEL_17;
  }
  v26 = a2;
  v27 = *(_QWORD **)(*(_QWORD *)(v23 + 56) + 8 * v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_23B43ED68(v13, v12);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v27 = sub_23B43E1B4(0, v27[2] + 1, 1, v27);
  v29 = v27[2];
  v28 = v27[3];
  if (v29 >= v28 >> 1)
    v27 = sub_23B43E1B4((_QWORD *)(v28 > 1), v29 + 1, 1, v27);
  v27[2] = v29 + 1;
  v30 = &v27[2 * v29];
  v30[4] = v26;
  v30[5] = a3;
  swift_beginAccess();
  sub_23B43ED54(v13, v12);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v42 = *v22;
  *v22 = 0x8000000000000000;
  v32 = (uint64_t)v27;
LABEL_17:
  sub_23B47665C(v32, v13, v12, isUniquelyReferenced_nonNull_native);
  *v22 = v42;
  swift_bridgeObjectRelease();
  sub_23B43ED68(v13, v12);
  return swift_endAccess();
}

uint64_t sub_23B47567C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7[2];

  v7[0] = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  sub_23B47519C(v7, a3, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B475754(char a1)
{
  if (!a1)
    return 0x696669746E656469;
  if (a1 == 1)
    return 0x73726577736E61;
  return 0xD000000000000014;
}

uint64_t sub_23B4757B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23B473374(*a1, *a2);
}

uint64_t sub_23B4757C0()
{
  return sub_23B472DBC();
}

uint64_t sub_23B4757C8()
{
  return sub_23B472EA4();
}

uint64_t sub_23B4757D0()
{
  return sub_23B4731E8();
}

uint64_t sub_23B4757D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B477D9C();
  *a1 = result;
  return result;
}

uint64_t sub_23B475804@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23B475754(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B47582C()
{
  char *v0;

  return sub_23B475754(*v0);
}

uint64_t sub_23B475834@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B477D9C();
  *a1 = result;
  return result;
}

uint64_t sub_23B475858()
{
  sub_23B477034();
  return sub_23B48389C();
}

uint64_t sub_23B475880()
{
  sub_23B477034();
  return sub_23B4838A8();
}

void *FBKSForm.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSForm.init(from:)(a1);
}

void *FBKSForm.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t *v7;
  char *v8;
  unint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  char *v21;
  objc_class *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t *v26;
  objc_super v27;
  unint64_t v28;
  char v29;
  uint64_t v30;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B868);
  v4 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (unint64_t *)&v1[OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers];
  v8 = v1;
  v9 = sub_23B473950(MEMORY[0x24BEE4AF8]);
  v26 = v7;
  *v7 = v9;
  v10 = &v8[OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod];
  *(_QWORD *)&v8[OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod] = 3;
  v11 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B477034();
  sub_23B483884();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_bridgeObjectRelease();
    type metadata accessor for FBKSForm();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v24 = v10;
    v12 = v4;
    v29 = 0;
    v13 = v25;
    v14 = sub_23B4836F8();
    v16 = (uint64_t *)&v8[OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier];
    *v16 = v14;
    v16[1] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
    v29 = 1;
    sub_23B446684();
    sub_23B483728();
    v18 = v28;
    v19 = v26;
    swift_beginAccess();
    *v19 = v18;
    swift_bridgeObjectRelease();
    LOBYTE(v28) = 2;
    sub_23B477078();
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v13);
    v20 = v30;
    v21 = v24;
    swift_beginAccess();
    *(_QWORD *)v21 = v20;

    v22 = (objc_class *)type metadata accessor for FBKSForm();
    v27.receiver = v8;
    v27.super_class = v22;
    v11 = objc_msgSendSuper2(&v27, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v11;
}

uint64_t sub_23B475BB8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t *v10;
  uint64_t *v11;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B880);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B477034();
  sub_23B483890();
  swift_beginAccess();
  v15 = 0;
  swift_bridgeObjectRetain();
  sub_23B483770();
  if (v2)
  {
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = (uint64_t *)(v3 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
    swift_beginAccess();
    v14 = *v10;
    LOBYTE(v13) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6F8);
    sub_23B446578();
    sub_23B4837A0();
    v11 = (uint64_t *)(v3 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
    swift_beginAccess();
    v13 = *v11;
    v12[15] = 2;
    sub_23B4770BC();
    sub_23B4837A0();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
}

id FBKSForm.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKSForm.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBKSForm.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSForm();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B475EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 208))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_23B475ED4()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xD8))();
}

unint64_t sub_23B475F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B483848();
  sub_23B48347C();
  v4 = sub_23B483878();
  return sub_23B4767BC(a1, a2, v4);
}

unint64_t sub_23B475F70(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_23B483848();
  sub_23B483854();
  if (a2 > 2)
    sub_23B48347C();
  v4 = sub_23B483878();
  return sub_23B47689C(a1, a2, v4);
}

uint64_t sub_23B476010(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B938);
  v36 = a2;
  v6 = sub_23B48368C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23B483848();
    sub_23B48347C();
    result = sub_23B483878();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23B476324(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  __int128 v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B928);
  v6 = sub_23B48368C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v31 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v30 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v16 = v15 | (v13 << 6);
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v30)
          goto LABEL_35;
        v18 = v31[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v30)
            goto LABEL_35;
          v18 = v31[v13];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v30)
            {
LABEL_35:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v29 = 1 << *(_BYTE *)(v5 + 32);
                if (v29 >= 64)
                  bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v31 = -1 << v29;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v13 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_42;
                if (v13 >= v30)
                  goto LABEL_35;
                v18 = v31[v13];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v13 = v19;
          }
        }
LABEL_21:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
      v32 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v16);
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v16 + 8);
      if ((a2 & 1) == 0)
      {
        sub_23B43ED54(v32, v21);
        swift_bridgeObjectRetain();
      }
      sub_23B483848();
      sub_23B483854();
      if (v21 > 2)
        sub_23B48347C();
      result = sub_23B483878();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14) = v32;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14) = v20;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23B47665C(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23B475F70(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23B476C18();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return sub_23B43ED54(a2, a3);
    }
    goto LABEL_14;
  }
  sub_23B476324(v15, a4 & 1);
  v21 = sub_23B475F70(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23B4837F4();
  __break(1u);
  return result;
}

unint64_t sub_23B4767BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23B4837D0() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23B4837D0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23B47689C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v13;
  uint64_t v14;
  unint64_t v15;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
    return v5;
  v8 = ~v4;
  while (1)
  {
    v9 = *(_QWORD *)(v3 + 48) + 16 * v5;
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8);
    switch(v11)
    {
      case 0uLL:
        if (!a2)
        {
          v14 = *(_QWORD *)v9;
          v15 = 0;
          goto LABEL_24;
        }
        goto LABEL_13;
      case 1uLL:
        if (a2 == 1)
        {
          v14 = *(_QWORD *)v9;
          v15 = 1;
          goto LABEL_24;
        }
        goto LABEL_13;
      case 2uLL:
        if (a2 == 2)
        {
          v14 = *(_QWORD *)v9;
          v15 = 2;
          goto LABEL_24;
        }
LABEL_13:
        sub_23B43ED54(*(_QWORD *)v9, *(_QWORD *)(v9 + 8));
        sub_23B43ED54(a1, a2);
        sub_23B43ED68(v10, v11);
        sub_23B43ED68(a1, a2);
        goto LABEL_14;
    }
    if (a2 < 3)
      goto LABEL_13;
    if (v10 == a1 && v11 == a2)
      break;
    v13 = sub_23B4837D0();
    sub_23B43ED54(v10, v11);
    sub_23B43ED54(a1, a2);
    sub_23B43ED68(v10, v11);
    sub_23B43ED68(a1, a2);
    if ((v13 & 1) != 0)
      return v5;
LABEL_14:
    v5 = (v5 + 1) & v8;
    if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      return v5;
  }
  sub_23B43ED54(a1, a2);
  sub_23B43ED54(a1, a2);
  v14 = a1;
  v15 = a2;
LABEL_24:
  sub_23B43ED68(v14, v15);
  sub_23B43ED68(a1, a2);
  return v5;
}

void *sub_23B476A64()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B938);
  v2 = *v0;
  v3 = sub_23B483680();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23B476C18()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B928);
  v2 = *v0;
  v3 = sub_23B483680();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v18);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v18) = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    sub_23B43ED54(v19, *((unint64_t *)&v19 + 1));
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _s15FeedbackService8FBKSFormC8QuestionO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      v3 = 1;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_23B4837D0();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:
    sub_23B43ED54(v4, v5);
    sub_23B43ED54(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2)
    goto LABEL_11;
  v6 = 1;
  v3 = 2;
LABEL_13:
  sub_23B43ED68(v2, v3);
  sub_23B43ED68(v4, v5);
  return v6 & 1;
}

unint64_t sub_23B476EC0()
{
  unint64_t result;

  result = qword_256A1B800;
  if (!qword_256A1B800)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B2C4, &type metadata for FBKSForm.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B800);
  }
  return result;
}

unint64_t sub_23B476F04()
{
  unint64_t result;

  result = qword_256A1B808;
  if (!qword_256A1B808)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B274, &type metadata for FBKSForm.Question.CustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B808);
  }
  return result;
}

unint64_t sub_23B476F48()
{
  unint64_t result;

  result = qword_256A1B810;
  if (!qword_256A1B810)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B224, &type metadata for FBKSForm.Question.DescriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B810);
  }
  return result;
}

unint64_t sub_23B476F8C()
{
  unint64_t result;

  result = qword_256A1B818;
  if (!qword_256A1B818)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B1D4, &type metadata for FBKSForm.Question.AreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B818);
  }
  return result;
}

unint64_t sub_23B476FD0()
{
  unint64_t result;

  result = qword_256A1B820;
  if (!qword_256A1B820)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B184, &type metadata for FBKSForm.Question.TitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B820);
  }
  return result;
}

uint64_t type metadata accessor for FBKSForm()
{
  return objc_opt_self();
}

unint64_t sub_23B477034()
{
  unint64_t result;

  result = qword_256A1B870;
  if (!qword_256A1B870)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B134, &type metadata for FBKSForm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B870);
  }
  return result;
}

unint64_t sub_23B477078()
{
  unint64_t result;

  result = qword_256A1B878;
  if (!qword_256A1B878)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.AuthenticationMethod, &type metadata for FBKSForm.AuthenticationMethod);
    atomic_store(result, (unint64_t *)&qword_256A1B878);
  }
  return result;
}

unint64_t sub_23B4770BC()
{
  unint64_t result;

  result = qword_256A1B888;
  if (!qword_256A1B888)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.AuthenticationMethod, &type metadata for FBKSForm.AuthenticationMethod);
    atomic_store(result, (unint64_t *)&qword_256A1B888);
  }
  return result;
}

unint64_t sub_23B477104()
{
  unint64_t result;

  result = qword_256A1B890;
  if (!qword_256A1B890)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.AuthenticationMethod, &type metadata for FBKSForm.AuthenticationMethod);
    atomic_store(result, (unint64_t *)&qword_256A1B890);
  }
  return result;
}

unint64_t sub_23B47714C()
{
  unint64_t result;

  result = qword_256A1B898;
  if (!qword_256A1B898)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.Question, &type metadata for FBKSForm.Question);
    atomic_store(result, (unint64_t *)&qword_256A1B898);
  }
  return result;
}

uint64_t sub_23B477190@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B4771E8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B477240@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23B477290(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for FBKSForm()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSForm.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of FBKSForm.answers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FBKSForm.clearAnswers()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of FBKSForm.authenticationMethod.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of FBKSForm.authenticationMethod.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FBKSForm.authenticationMethod.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FBKSForm.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of FBKSForm.prefill(question:answer:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FBKSForm.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of FBKSForm.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

ValueMetadata *type metadata accessor for FBKSForm.AuthenticationMethod()
{
  return &type metadata for FBKSForm.AuthenticationMethod;
}

uint64_t getEnumTagSinglePayload for FBKSForm.Question(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FBKSForm.Question(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKSForm.Question()
{
  return &type metadata for FBKSForm.Question;
}

uint64_t storeEnumTagSinglePayload for FBKSForm.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B47752C + 4 * byte_23B48AAB9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B477560 + 4 * byte_23B48AAB4[v4]))();
}

uint64_t sub_23B477560(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B477568(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B477570);
  return result;
}

uint64_t sub_23B47757C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B477584);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B477588(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B477590(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSForm.CodingKeys()
{
  return &type metadata for FBKSForm.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FBKSForm.Question.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKSForm.Question.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23B477688 + 4 * byte_23B48AAC3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B4776BC + 4 * byte_23B48AABE[v4]))();
}

uint64_t sub_23B4776BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4776C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4776CCLL);
  return result;
}

uint64_t sub_23B4776D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B4776E0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B4776E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4776EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSForm.Question.CodingKeys()
{
  return &type metadata for FBKSForm.Question.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSForm.Question.TitleCodingKeys()
{
  return &type metadata for FBKSForm.Question.TitleCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSForm.Question.AreaCodingKeys()
{
  return &type metadata for FBKSForm.Question.AreaCodingKeys;
}

ValueMetadata *type metadata accessor for FBKSForm.Question.DescriptionCodingKeys()
{
  return &type metadata for FBKSForm.Question.DescriptionCodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKSForm.Question.CustomCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B477778 + 4 * byte_23B48AAC8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B477798 + 4 * byte_23B48AACD[v4]))();
}

_BYTE *sub_23B477778(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B477798(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B4777A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B4777A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B4777B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B4777B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKSForm.Question.CustomCodingKeys()
{
  return &type metadata for FBKSForm.Question.CustomCodingKeys;
}

unint64_t sub_23B4777D8()
{
  unint64_t result;

  result = qword_256A1B8A0;
  if (!qword_256A1B8A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AE74, &type metadata for FBKSForm.Question.CustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8A0);
  }
  return result;
}

unint64_t sub_23B477820()
{
  unint64_t result;

  result = qword_256A1B8A8;
  if (!qword_256A1B8A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B01C, &type metadata for FBKSForm.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8A8);
  }
  return result;
}

unint64_t sub_23B477868()
{
  unint64_t result;

  result = qword_256A1B8B0;
  if (!qword_256A1B8B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B10C, &type metadata for FBKSForm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8B0);
  }
  return result;
}

unint64_t sub_23B4778B0()
{
  unint64_t result;

  result = qword_256A1B8B8;
  if (!qword_256A1B8B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B044, &type metadata for FBKSForm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8B8);
  }
  return result;
}

unint64_t sub_23B4778F8()
{
  unint64_t result;

  result = qword_256A1B8C0;
  if (!qword_256A1B8C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B06C, &type metadata for FBKSForm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8C0);
  }
  return result;
}

unint64_t sub_23B477940()
{
  unint64_t result;

  result = qword_256A1B8C8;
  if (!qword_256A1B8C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AF3C, &type metadata for FBKSForm.Question.TitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8C8);
  }
  return result;
}

unint64_t sub_23B477988()
{
  unint64_t result;

  result = qword_256A1B8D0;
  if (!qword_256A1B8D0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AF64, &type metadata for FBKSForm.Question.TitleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8D0);
  }
  return result;
}

unint64_t sub_23B4779D0()
{
  unint64_t result;

  result = qword_256A1B8D8;
  if (!qword_256A1B8D8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AEEC, &type metadata for FBKSForm.Question.AreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8D8);
  }
  return result;
}

unint64_t sub_23B477A18()
{
  unint64_t result;

  result = qword_256A1B8E0;
  if (!qword_256A1B8E0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AF14, &type metadata for FBKSForm.Question.AreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8E0);
  }
  return result;
}

unint64_t sub_23B477A60()
{
  unint64_t result;

  result = qword_256A1B8E8;
  if (!qword_256A1B8E8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AE9C, &type metadata for FBKSForm.Question.DescriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8E8);
  }
  return result;
}

unint64_t sub_23B477AA8()
{
  unint64_t result;

  result = qword_256A1B8F0;
  if (!qword_256A1B8F0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AEC4, &type metadata for FBKSForm.Question.DescriptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8F0);
  }
  return result;
}

unint64_t sub_23B477AF0()
{
  unint64_t result;

  result = qword_256A1B8F8;
  if (!qword_256A1B8F8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48ADE4, &type metadata for FBKSForm.Question.CustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B8F8);
  }
  return result;
}

unint64_t sub_23B477B38()
{
  unint64_t result;

  result = qword_256A1B900;
  if (!qword_256A1B900)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AE0C, &type metadata for FBKSForm.Question.CustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B900);
  }
  return result;
}

unint64_t sub_23B477B80()
{
  unint64_t result;

  result = qword_256A1B908;
  if (!qword_256A1B908)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AF8C, &type metadata for FBKSForm.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B908);
  }
  return result;
}

unint64_t sub_23B477BC8()
{
  unint64_t result;

  result = qword_256A1B910;
  if (!qword_256A1B910)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48AFB4, &type metadata for FBKSForm.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B910);
  }
  return result;
}

uint64_t sub_23B477C0C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1634038369 && a2 == 0xE400000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D6F74737563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23B477D9C()
{
  unint64_t v0;

  v0 = sub_23B4836B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_23B477DE4()
{
  unint64_t result;

  result = qword_256A1B918;
  if (!qword_256A1B918)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSForm.AuthenticationMethod, &type metadata for FBKSForm.AuthenticationMethod);
    atomic_store(result, (unint64_t *)&qword_256A1B918);
  }
  return result;
}

uint64_t sub_23B477E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B477E70(char a1)
{
  if ((a1 & 1) != 0)
    return 0x697461756C617665;
  else
    return 1836216166;
}

uint64_t sub_23B477EA4()
{
  char *v0;

  return sub_23B477E70(*v0);
}

uint64_t sub_23B477EAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B478DDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B477ED0()
{
  sub_23B478288();
  return sub_23B48389C();
}

uint64_t sub_23B477EF8()
{
  sub_23B478288();
  return sub_23B4838A8();
}

uint64_t sub_23B477F20()
{
  sub_23B4782CC();
  return sub_23B48389C();
}

uint64_t sub_23B477F48()
{
  sub_23B4782CC();
  return sub_23B4838A8();
}

uint64_t sub_23B477F70()
{
  sub_23B478320();
  return sub_23B48389C();
}

uint64_t sub_23B477F98()
{
  sub_23B478320();
  return sub_23B4838A8();
}

void FBKSRemoteAlertRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  int v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B940);
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B948);
  v28 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B950);
  v29 = *(_QWORD *)(v9 - 8);
  v30 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)v1;
  v31 = *(id *)(v1 + 8);
  v32 = v12;
  v13 = *(char *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B478288();
  v14 = v13;
  sub_23B483890();
  if (v13 < 0)
  {
    v20 = v13 & 1;
    LOBYTE(v33) = 1;
    sub_23B4782CC();
    v21 = v31;
    v22 = v31;
    v23 = v30;
    sub_23B483740();
    v24 = v32;
    LOBYTE(v33) = (_BYTE)v32;
    v34 = v22;
    v35 = v20;
    sub_23B44FE80();
    v25 = v27;
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v25);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v23);
    v18 = v24;
    v19 = v21;
  }
  else
  {
    LOBYTE(v33) = 0;
    sub_23B478320();
    v15 = v32;
    v16 = v32;
    v17 = v30;
    sub_23B483740();
    v33 = v16;
    type metadata accessor for FBKSForm();
    sub_23B43EFCC(&qword_256A1A5F0, (uint64_t)&protocol conformance descriptor for FBKSForm);
    sub_23B4837A0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v17);
    v18 = v15;
    v19 = v31;
  }
  sub_23B478310(v18, v19, v14);
}

unint64_t sub_23B478288()
{
  unint64_t result;

  result = qword_256A1B958;
  if (!qword_256A1B958)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B850, &type metadata for FBKSRemoteAlertRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B958);
  }
  return result;
}

unint64_t sub_23B4782CC()
{
  unint64_t result;

  result = qword_256A1B960;
  if (!qword_256A1B960)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B800, &type metadata for FBKSRemoteAlertRequest.EvaluationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B960);
  }
  return result;
}

void sub_23B478310(void *a1, void *a2, char a3)
{
  if (a3 < 0)
    a1 = a2;

}

unint64_t sub_23B478320()
{
  unint64_t result;

  result = qword_256A1B968;
  if (!qword_256A1B968)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B7B0, &type metadata for FBKSRemoteAlertRequest.FormCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B968);
  }
  return result;
}

uint64_t FBKSRemoteAlertRequest.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v31 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B970);
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B978);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B980);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23B478288();
  v13 = v36;
  sub_23B483884();
  if (!v13)
  {
    v26 = v5;
    v27 = v7;
    v14 = v29;
    v15 = v30;
    v36 = v9;
    v16 = v31;
    v17 = sub_23B483734();
    if (*(_QWORD *)(v17 + 16) == 1)
    {
      if ((*(_BYTE *)(v17 + 32) & 1) != 0)
      {
        LOBYTE(v33) = 1;
        sub_23B4782CC();
        sub_23B4836BC();
        sub_23B44FE3C();
        sub_23B483728();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v8);
        v18 = v33;
        v19 = v34;
        v20 = v35 | 0x80;
      }
      else
      {
        LOBYTE(v33) = 0;
        sub_23B478320();
        v24 = v27;
        sub_23B4836BC();
        type metadata accessor for FBKSForm();
        sub_23B43EFCC(&qword_256A1A628, (uint64_t)&protocol conformance descriptor for FBKSForm);
        sub_23B483728();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v4);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v8);
        v19 = 0;
        v20 = 0;
        v18 = v33;
      }
      *(_QWORD *)v16 = v18;
      *(_QWORD *)(v16 + 8) = v19;
      *(_BYTE *)(v16 + 16) = v20;
    }
    else
    {
      v21 = sub_23B483644();
      swift_allocError();
      v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A6D0);
      *v23 = &type metadata for FBKSRemoteAlertRequest;
      sub_23B4836C8();
      sub_23B483638();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
}

unint64_t sub_23B478738(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_23B44FD74();
  result = sub_23B44FDB8();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23B478764@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKSRemoteAlertRequest.init(from:)(a1, a2);
}

void sub_23B478778(_QWORD *a1)
{
  FBKSRemoteAlertRequest.encode(to:)(a1);
}

id sub_23B478790(void *a1, void *a2, char a3)
{
  if (a3 < 0)
    a1 = a2;
  return a1;
}

void destroy for FBKSRemoteAlertRequest(uint64_t a1)
{
  sub_23B478310(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s15FeedbackService22FBKSRemoteAlertRequestOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B478790(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FBKSRemoteAlertRequest(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B478790(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23B478310(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for FBKSRemoteAlertRequest(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23B478310(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKSRemoteAlertRequest(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3FFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x3FFFF);
  v3 = ((*(unsigned __int8 *)(a1 + 16) >> 7) | (2
                                              * ((*(_QWORD *)(a1 + 8) >> 53) & 0x780 | (*(_QWORD *)a1 >> 60) & 0x8F | (16 * (*(_QWORD *)(a1 + 8) & 7)) | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x3F) << 11)))) ^ 0x3FFFF;
  if (v3 >= 0x3FFFE)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteAlertRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3;

  if (a2 > 0x3FFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x3FFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3FFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3FFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      v3 = ((-a2 >> 1) & 0x1FFFF) - (a2 << 17);
      *(_QWORD *)result = v3 << 60;
      *(_QWORD *)(result + 8) = ((v3 >> 4) | (v3 << 53)) & 0xF000000000000007;
      *(_BYTE *)(result + 16) = (v3 >> 10) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_23B478984(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 7;
}

uint64_t sub_23B478990(uint64_t result)
{
  *(_BYTE *)(result + 16) &= ~0x80u;
  return result;
}

int8x16_t sub_23B4789A0(int8x16_t *a1, char a2)
{
  __int8 v2;
  int8x16_t result;

  v2 = a1[1].i8[0] & 1 | (a2 << 7);
  result = vandq_s8(*a1, (int8x16_t)xmmword_23B48B490);
  *a1 = result;
  a1[1].i8[0] = v2;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteAlertRequest()
{
  return &type metadata for FBKSRemoteAlertRequest;
}

uint64_t storeEnumTagSinglePayload for FBKSRemoteAlertRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B478A24 + 4 * byte_23B48B4A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B478A58 + 4 * byte_23B48B4A0[v4]))();
}

uint64_t sub_23B478A58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B478A60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B478A68);
  return result;
}

uint64_t sub_23B478A74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B478A7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B478A80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B478A88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteAlertRequest.CodingKeys()
{
  return &type metadata for FBKSRemoteAlertRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSRemoteAlertRequest.FormCodingKeys()
{
  return &type metadata for FBKSRemoteAlertRequest.FormCodingKeys;
}

uint64_t _s15FeedbackService22FBKSRemoteAlertRequestO14FormCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B478AF8 + 4 * byte_23B48B4AA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B478B18 + 4 * byte_23B48B4AF[v4]))();
}

_BYTE *sub_23B478AF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B478B18(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B478B20(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B478B28(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B478B30(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B478B38(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKSRemoteAlertRequest.EvaluationCodingKeys()
{
  return &type metadata for FBKSRemoteAlertRequest.EvaluationCodingKeys;
}

unint64_t sub_23B478B58()
{
  unint64_t result;

  result = qword_256A1B988;
  if (!qword_256A1B988)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B618, &type metadata for FBKSRemoteAlertRequest.EvaluationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B988);
  }
  return result;
}

unint64_t sub_23B478BA0()
{
  unint64_t result;

  result = qword_256A1B990;
  if (!qword_256A1B990)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B6D0, &type metadata for FBKSRemoteAlertRequest.FormCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B990);
  }
  return result;
}

unint64_t sub_23B478BE8()
{
  unint64_t result;

  result = qword_256A1B998;
  if (!qword_256A1B998)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B788, &type metadata for FBKSRemoteAlertRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B998);
  }
  return result;
}

unint64_t sub_23B478C30()
{
  unint64_t result;

  result = qword_256A1B9A0;
  if (!qword_256A1B9A0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B640, &type metadata for FBKSRemoteAlertRequest.FormCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9A0);
  }
  return result;
}

unint64_t sub_23B478C78()
{
  unint64_t result;

  result = qword_256A1B9A8;
  if (!qword_256A1B9A8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B668, &type metadata for FBKSRemoteAlertRequest.FormCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9A8);
  }
  return result;
}

unint64_t sub_23B478CC0()
{
  unint64_t result;

  result = qword_256A1B9B0;
  if (!qword_256A1B9B0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B588, &type metadata for FBKSRemoteAlertRequest.EvaluationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9B0);
  }
  return result;
}

unint64_t sub_23B478D08()
{
  unint64_t result;

  result = qword_256A1B9B8;
  if (!qword_256A1B9B8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B5B0, &type metadata for FBKSRemoteAlertRequest.EvaluationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9B8);
  }
  return result;
}

unint64_t sub_23B478D50()
{
  unint64_t result;

  result = qword_256A1B9C0;
  if (!qword_256A1B9C0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B6F8, &type metadata for FBKSRemoteAlertRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9C0);
  }
  return result;
}

unint64_t sub_23B478D98()
{
  unint64_t result;

  result = qword_256A1B9C8;
  if (!qword_256A1B9C8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48B720, &type metadata for FBKSRemoteAlertRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1B9C8);
  }
  return result;
}

uint64_t sub_23B478DDC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1836216166 && a2 == 0xE400000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x697461756C617665 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id static FBKSError.maybeXpcSafeNSError(error:)(void *a1)
{
  id v2;
  id v3;

  if (!a1)
    return 0;
  v2 = a1;
  v3 = _s15FeedbackService9FBKSErrorV14xpcSafeNSError5errorSo0F0Cs5Error_p_tFZ_0();

  return v3;
}

id static FBKSError.nsError(anyError:)(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v6;
  uint64_t v7;
  _BYTE v8[32];

  sub_23B43F084(a1, (uint64_t)v8);
  if (swift_dynamicCast())
  {
    v2 = _s15FeedbackService9FBKSErrorV7nsError06stringE0So7NSErrorCSS_tFZ_0((uint64_t)v6, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23B43F084(a1, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A5F8);
    if (swift_dynamicCast())
    {
      v2 = _s15FeedbackService9FBKSErrorV14xpcSafeNSError5errorSo0F0Cs5Error_p_tFZ_0();

    }
    else
    {
      sub_23B483434();
      v3 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v4 = (void *)sub_23B483428();
      swift_bridgeObjectRelease();
      v2 = objc_msgSend(v3, sel_initWithDomain_code_userInfo_, v4, -1000, 0);

    }
  }
  return v2;
}

id _s15FeedbackService9FBKSErrorV14xpcSafeNSError5errorSo0F0Cs5Error_p_tFZ_0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t inited;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v0 = (void *)sub_23B483308();
  v1 = objc_msgSend(v0, sel_domain);
  sub_23B483434();

  v2 = objc_msgSend(v0, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B9D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B484E90;
  *(_QWORD *)(inited + 32) = sub_23B483434();
  *(_QWORD *)(inited + 40) = v4;
  v5 = v0;
  v6 = objc_msgSend(v5, sel_description);
  v7 = sub_23B483434();
  v9 = v8;

  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v9;
  sub_23B473708(inited);
  v10 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v11 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_23B483404();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, v2, v12);

  return v13;
}

id _s15FeedbackService9FBKSErrorV7nsError06stringE0So7NSErrorCSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  sub_23B483434();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B9D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B484E90;
  *(_QWORD *)(inited + 32) = sub_23B483434();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_23B473708(inited);
  v6 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v7 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23B483404();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithDomain_code_userInfo_, v7, -200, v8);

  return v9;
}

ValueMetadata *type metadata accessor for FBKSError()
{
  return &type metadata for FBKSError;
}

unint64_t sub_23B479304()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A1B9D8;
  if (!qword_256A1B9D8)
  {
    v1 = sub_23B43CF58(255, &qword_256A1B9E0);
    result = MEMORY[0x23B8651F0](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256A1B9D8);
  }
  return result;
}

id sub_23B47935C@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, "ID");
  *a1 = result;
  return result;
}

uint64_t sub_23B479394()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_23B4793A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_23B43CF58(0, &qword_256A1B9E8);
  result = sub_23B4833F8();
  *a1 = result;
  return result;
}

uint64_t getEntitlement(for:entitlement:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B9F0);
  sub_23B4833EC();
  return v1;
}

void sub_23B479444(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  SecTaskRef v6;
  __SecTask *v7;
  __CFString *v8;
  CFTypeRef v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  audit_token_t token;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)token.val = a1;
  *(_QWORD *)&token.val[2] = a2;
  *(_QWORD *)&token.val[4] = a3;
  *(_QWORD *)&token.val[6] = a4;
  v6 = SecTaskCreateWithAuditToken(0, &token);
  if (v6)
  {
    v7 = v6;
    *(_QWORD *)token.val = 0;
    v8 = (__CFString *)sub_23B483428();
    v9 = SecTaskCopyValueForEntitlement(v7, v8, (CFErrorRef *)&token);

    if (!*(_QWORD *)token.val)
    {

      *a5 = v9;
      return;
    }
    if (qword_256A1A4D8 != -1)
      swift_once();
    v10 = sub_23B4833E0();
    __swift_project_value_buffer(v10, (uint64_t)qword_256A1BC80);
    v11 = sub_23B4833C8();
    v12 = sub_23B48359C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v17 = v14;
      *(_DWORD *)v13 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A1B9F8);
      v15 = sub_23B483470();
      sub_23B44BBC0(v15, v16, &v17);
      sub_23B4835D8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B433000, v11, v12, "Error getting entitlement: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86528C](v14, -1, -1);
      MEMORY[0x23B86528C](v13, -1, -1);

    }
    else
    {

    }
    swift_unknownObjectRelease();

  }
  *a5 = 0;
}

void sub_23B4796AC()
{
  strcpy((char *)&qword_256A1BCC0, "inboxFormTats");
  *(_WORD *)&algn_256A1BCC8[6] = -4864;
}

void sub_23B4796DC()
{
  id v0;
  void *v1;
  id v2;

  sub_23B483434();
  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
    qword_256A1BCD0 = (uint64_t)v2;
  else
    __break(1u);
}

void static FBKSSharedPersistence.removeAllInboxTats()()
{
  void *v0;
  id v1;

  if (qword_256A1A538 != -1)
    swift_once();
  v0 = (void *)qword_256A1BCD0;
  if (qword_256A1A530 != -1)
    swift_once();
  v1 = (id)sub_23B483428();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);

}

uint64_t static FBKSSharedPersistence.saveSurveyTatInFBAInbox(formIdentifier:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[2];
  unint64_t v42;

  v39 = sub_23B483380();
  v4 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256A1A4D8 != -1)
    swift_once();
  v7 = sub_23B4833E0();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_256A1BC80);
  swift_bridgeObjectRetain_n();
  v9 = sub_23B4833C8();
  v10 = sub_23B4835A8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v38 = v8;
    v13 = v12;
    v42 = v12;
    *(_DWORD *)v11 = 136446466;
    v41[0] = sub_23B44BBC0(0xD000000000000028, 0x800000023B48E870, (uint64_t *)&v42);
    sub_23B4835D8();
    *(_WORD *)(v11 + 12) = 2082;
    swift_bridgeObjectRetain();
    v41[0] = sub_23B44BBC0(a1, a2, (uint64_t *)&v42);
    sub_23B4835D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B433000, v9, v10, "%{public}s [%{public}s]", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v13, -1, -1);
    MEMORY[0x23B86528C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v42 = _s15FeedbackService21FBKSSharedPersistenceC16fbaInboxFormTatsSayAA13FBKSSInboxTatCGvgZ_0();
  swift_bridgeObjectRetain();
  v14 = swift_bridgeObjectRetain();
  v15 = sub_23B47BB4C(v14, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = &qword_256A1B000;
  if (!v15)
    goto LABEL_13;
  v38 = v4;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v17 = sub_23B4833C8();
  v18 = sub_23B4835A8();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v37 = a1;
    v20 = v19;
    v21 = swift_slowAlloc();
    v35[1] = 0;
    v22 = v21;
    v41[0] = v21;
    *(_DWORD *)v20 = 136446722;
    v40 = sub_23B44BBC0(0xD000000000000028, 0x800000023B48E870, v41);
    v36 = v6;
    sub_23B4835D8();
    *(_WORD *)(v20 + 12) = 2082;
    swift_bridgeObjectRetain();
    v40 = sub_23B44BBC0(v37, a2, v41);
    sub_23B4835D8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 22) = 2082;
    sub_23B44646C(&qword_256A1BA00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v23 = sub_23B4837AC();
    v40 = sub_23B44BBC0(v23, v24, v41);
    v6 = v36;
    v16 = &qword_256A1B000;
    sub_23B4835D8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v17, v18, "%{public}s found existing: %{public}s added at [%{public}s]", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v22, -1, -1);
    v25 = v20;
    a1 = v37;
    MEMORY[0x23B86528C](v25, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v26 = sub_23B47BDA4(&v42, a1, a2);
  result = swift_bridgeObjectRelease();
  v4 = v38;
  if (v42 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_23B483674();
    result = swift_bridgeObjectRelease();
    if (v28 >= v26)
      goto LABEL_12;
LABEL_20:
    __break(1u);
    return result;
  }
  v28 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v28 < v26)
    goto LABEL_20;
LABEL_12:
  sub_23B47B2BC(v26, v28);
  swift_release();
LABEL_13:
  swift_bridgeObjectRetain();
  sub_23B483374();
  type metadata accessor for FBKSSInboxTat();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a1;
  *(_QWORD *)(v29 + 24) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v29 + v16[411], v6, v39);
  swift_bridgeObjectRetain_n();
  v30 = sub_23B4833C8();
  v31 = sub_23B483590();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v41[0] = v33;
    *(_DWORD *)v32 = 136446466;
    v40 = sub_23B44BBC0(0xD000000000000028, 0x800000023B48E870, v41);
    sub_23B4835D8();
    *(_WORD *)(v32 + 12) = 2082;
    swift_bridgeObjectRetain();
    v40 = sub_23B44BBC0(a1, a2, v41);
    sub_23B4835D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B433000, v30, v31, "%{public}s appending: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v33, -1, -1);
    MEMORY[0x23B86528C](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v34 = swift_retain();
  MEMORY[0x23B86489C](v34);
  if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23B483518();
  sub_23B483524();
  sub_23B48350C();
  sub_23B47B5B4(v42);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t static FBKSSharedPersistence.removeInboxTat(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;

  if (qword_256A1A4D8 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC80);
  swift_bridgeObjectRetain_n();
  v5 = sub_23B4833C8();
  v6 = sub_23B4835A8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136446466;
    sub_23B44BBC0(0xD000000000000012, 0x800000023B48E8A0, (uint64_t *)&v12);
    sub_23B4835D8();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_23B44BBC0(a1, a2, (uint64_t *)&v12);
    sub_23B4835D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B433000, v5, v6, "%{public}s [%{public}s]", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v8, -1, -1);
    MEMORY[0x23B86528C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = _s15FeedbackService21FBKSSharedPersistenceC16fbaInboxFormTatsSayAA13FBKSSInboxTatCGvgZ_0();
  swift_bridgeObjectRetain();
  v9 = sub_23B47BDA4(&v12, a1, a2);
  result = swift_bridgeObjectRelease();
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_23B483674();
    result = swift_bridgeObjectRelease();
    if (v11 >= v9)
      goto LABEL_8;
  }
  else
  {
    v11 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v9)
    {
LABEL_8:
      sub_23B47B2BC(v9, v11);
      sub_23B47B5B4(v12);
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t static FBKSSharedPersistence.fbaInboxFormTat(formIdentifier:)(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;

  v4 = _s15FeedbackService21FBKSSharedPersistenceC16fbaInboxFormTatsSayAA13FBKSSInboxTatCGvgZ_0();
  swift_bridgeObjectRetain();
  v5 = sub_23B47BB4C(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23B47A224(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  sub_23B43E2C0(0, v2, 0);
  v3 = v12;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_23B43F084(i, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23B43E2C0(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v12;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23B43E2C0(v5 > 1, v6 + 1, 1);
        v3 = v12;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t FBKSSInboxTat.asJSONString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v1 = sub_23B483464();
  MEMORY[0x24BDAC7A8](v1);
  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  v15 = v0;
  sub_23B44646C(&qword_256A1BA08, (uint64_t (*)(uint64_t))type metadata accessor for FBKSSInboxTat, (uint64_t)&protocol conformance descriptor for FBKSSInboxTat);
  v2 = sub_23B483230();
  v4 = v3;
  swift_release();
  sub_23B483458();
  v5 = sub_23B48344C();
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    if (qword_256A1A4D8 != -1)
      swift_once();
    v9 = sub_23B4833E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_256A1BC80);
    swift_bridgeObjectRetain_n();
    v10 = sub_23B4833C8();
    v11 = sub_23B483590();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_23B44BBC0(v7, v8, &v15);
      sub_23B4835D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B433000, v10, v11, "Encoded Inbox Tat: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86528C](v13, -1, -1);
      MEMORY[0x23B86528C](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    sub_23B43ED7C(v2, v4);

    return v7;
  }
  else
  {
    sub_23B483608();
    swift_bridgeObjectRelease();
    result = sub_23B483668();
    __break(1u);
  }
  return result;
}

uint64_t FBKSSharedPersistence.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FBKSSharedPersistence.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t FBKSSInboxTat.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FBKSSInboxTat.dateAdded.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC15FeedbackService13FBKSSInboxTat_dateAdded;
  v4 = sub_23B483380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t static FBKSSInboxTat.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24))
    return 1;
  else
    return sub_23B4837D0();
}

uint64_t sub_23B47A794(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6564644165746164;
  else
    return 0x696669746E656469;
}

uint64_t sub_23B47A7D4()
{
  char *v0;

  return sub_23B47A794(*v0);
}

uint64_t sub_23B47A7DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B47C3B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B47A800()
{
  sub_23B47C0FC();
  return sub_23B48389C();
}

uint64_t sub_23B47A828()
{
  sub_23B47C0FC();
  return sub_23B4838A8();
}

uint64_t FBKSSInboxTat.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC15FeedbackService13FBKSSInboxTat_dateAdded;
  v2 = sub_23B483380();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FBKSSInboxTat.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC15FeedbackService13FBKSSInboxTat_dateAdded;
  v2 = sub_23B483380();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t FBKSSInboxTat.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BA10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B47C0FC();
  sub_23B483890();
  v8[15] = 0;
  sub_23B483770();
  if (!v1)
  {
    v8[14] = 1;
    sub_23B483380();
    sub_23B44646C(&qword_256A1BA20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23B4837A0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t FBKSSInboxTat.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FBKSSInboxTat.init(from:)(a1);
  return v2;
}

uint64_t *FBKSSInboxTat.init(from:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  char v22;

  v20 = *v1;
  v17 = sub_23B483380();
  v3 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BA28);
  v6 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B47C0FC();
  v9 = v19;
  sub_23B483884();
  if (v9)
  {
    swift_deallocPartialClassInstance();
    v14 = (uint64_t)a1;
  }
  else
  {
    v15 = v3;
    v16 = v6;
    v19 = a1;
    v11 = v17;
    v10 = v18;
    v22 = 0;
    v1[2] = sub_23B4836F8();
    v1[3] = v12;
    v21 = 1;
    sub_23B44646C(&qword_256A1BA30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23B483728();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v10);
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))((uint64_t)v1 + OBJC_IVAR____TtC15FeedbackService13FBKSSInboxTat_dateAdded, v5, v11);
    v14 = (uint64_t)v19;
  }
  __swift_destroy_boxed_opaque_existential_0(v14);
  return v1;
}

uint64_t *sub_23B47ACB4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t *result;

  v5 = swift_allocObject();
  result = FBKSSInboxTat.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_23B47AD08(_QWORD *a1)
{
  return FBKSSInboxTat.encode(to:)(a1);
}

void sub_23B47AD28(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23B483674();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B8649ECLL);
}

uint64_t _s15FeedbackService13FBKSSInboxTatC8fromJSON6stringACSgSS_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  _QWORD v8[4];

  v0 = sub_23B483464();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B483458();
  v4 = sub_23B483440();
  v6 = v5;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23B483200();
    swift_allocObject();
    sub_23B4831F4();
    type metadata accessor for FBKSSInboxTat();
    sub_23B44646C(&qword_256A1BA60, (uint64_t (*)(uint64_t))type metadata accessor for FBKSSInboxTat, (uint64_t)&protocol conformance descriptor for FBKSSInboxTat);
    sub_23B4831E8();
    sub_23B448B1C(v4, v6);
    swift_release();
    return v8[3];
  }
  return result;
}

uint64_t _s15FeedbackService21FBKSSharedPersistenceC16fbaInboxFormTatsSayAA13FBKSSInboxTatCGvgZ_0()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (qword_256A1A538 != -1)
    swift_once();
  v0 = (void *)qword_256A1BCD0;
  if (qword_256A1A530 != -1)
    swift_once();
  v1 = (void *)sub_23B483428();
  v2 = objc_msgSend(v0, sel_arrayForKey_, v1);

  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v3 = sub_23B4834F4();

  v4 = sub_23B47A224(v3);
  swift_bridgeObjectRelease();
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v11 = MEMORY[0x24BEE4AF8];
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      swift_bridgeObjectRetain();
      v7 = v4 + 40;
      do
      {
        swift_bridgeObjectRetain();
        v8 = _s15FeedbackService13FBKSSInboxTatC8fromJSON6stringACSgSS_tFZ_0();
        v9 = swift_bridgeObjectRelease();
        if (v8)
        {
          MEMORY[0x23B86489C](v9);
          if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_23B483518();
          sub_23B483524();
          sub_23B48350C();
        }
        v7 += 16;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
      v5 = v11;
    }
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t type metadata accessor for FBKSSInboxTat()
{
  uint64_t result;

  result = qword_256A1BA38;
  if (!qword_256A1BA38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B47B2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_23B483674();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_23B483674();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_23B483674();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B8649EC](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for FBKSSInboxTat();
  swift_arrayDestroy();
  if (!v5)
    return sub_23B48350C();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_23B483674();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_23B48350C();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_23B483674();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_23B4836A4();
  __break(1u);
  return result;
}

void sub_23B47B5B4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = sub_23B4833E0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256A1A4D8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_256A1BC80);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_bridgeObjectRetain_n();
  v8 = sub_23B4833C8();
  LODWORD(v9) = sub_23B483590();
  v10 = a1 >> 62;
  if (!os_log_type_enabled(v8, (os_log_type_t)v9))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  v1 = swift_slowAlloc();
  v45 = swift_slowAlloc();
  v49 = v45;
  *(_DWORD *)v1 = 136446466;
  v48 = sub_23B44BBC0(0x7461742865766173, 0xEB00000000293A73, &v49);
  sub_23B4835D8();
  *(_WORD *)(v1 + 12) = 2082;
  if (v10)
    goto LABEL_41;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    v47 = v8;
    v46 = v9;
    if (v11)
    {
      v48 = MEMORY[0x24BEE4AF8];
      sub_23B43E2C0(0, v11 & ~(v11 >> 63), 0);
      if (v11 < 0)
      {
        __break(1u);
        return;
      }
      v41 = v10;
      v42 = v6;
      v43 = v4;
      v44 = v3;
      v12 = v48;
      if ((a1 & 0xC000000000000001) != 0)
      {
        v13 = 0;
        do
        {
          v14 = MEMORY[0x23B8649E0](v13, a1);
          v15 = *(_QWORD *)(v14 + 16);
          v16 = *(_QWORD *)(v14 + 24);
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          v48 = v12;
          v18 = *(_QWORD *)(v12 + 16);
          v17 = *(_QWORD *)(v12 + 24);
          if (v18 >= v17 >> 1)
          {
            sub_23B43E2C0(v17 > 1, v18 + 1, 1);
            v12 = v48;
          }
          ++v13;
          *(_QWORD *)(v12 + 16) = v18 + 1;
          v19 = v12 + 16 * v18;
          *(_QWORD *)(v19 + 32) = v15;
          *(_QWORD *)(v19 + 40) = v16;
        }
        while (v11 != v13);
      }
      else
      {
        v20 = a1 + 32;
        do
        {
          v21 = *(_QWORD *)(*(_QWORD *)v20 + 16);
          v22 = *(_QWORD *)(*(_QWORD *)v20 + 24);
          v48 = v12;
          v23 = *(_QWORD *)(v12 + 16);
          v24 = *(_QWORD *)(v12 + 24);
          swift_bridgeObjectRetain();
          if (v23 >= v24 >> 1)
          {
            sub_23B43E2C0(v24 > 1, v23 + 1, 1);
            v12 = v48;
          }
          *(_QWORD *)(v12 + 16) = v23 + 1;
          v25 = v12 + 16 * v23;
          *(_QWORD *)(v25 + 32) = v21;
          *(_QWORD *)(v25 + 40) = v22;
          v20 += 8;
          --v11;
        }
        while (v11);
      }
      v4 = v43;
      v3 = v44;
      v10 = v41;
      v6 = v42;
    }
    v9 = MEMORY[0x23B8648C0](v12, MEMORY[0x24BEE0D00]);
    v27 = v26;
    swift_bridgeObjectRelease();
    v48 = sub_23B44BBC0(v9, v27, &v49);
    sub_23B4835D8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v28 = v47;
    _os_log_impl(&dword_23B433000, v47, (os_log_type_t)v46, "%{public}s %{public}s]", (uint8_t *)v1, 0x16u);
    v8 = v45;
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v8, -1, -1);
    MEMORY[0x23B86528C](v1, -1, -1);

LABEL_21:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v10)
    {
      swift_bridgeObjectRetain();
      v4 = sub_23B483674();
      if (!v4)
        goto LABEL_35;
    }
    else
    {
      v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v4)
        goto LABEL_35;
    }
    if (v4 >= 1)
      break;
    __break(1u);
LABEL_41:
    swift_bridgeObjectRetain();
    v11 = sub_23B483674();
    swift_bridgeObjectRelease();
  }
  v29 = 0;
  v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      MEMORY[0x23B8649E0](v29, a1);
    else
      swift_retain();
    v31 = FBKSSInboxTat.asJSONString.getter();
    v33 = v32;
    swift_release();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v30 = sub_23B43E1B4(0, v30[2] + 1, 1, v30);
    v35 = v30[2];
    v34 = v30[3];
    if (v35 >= v34 >> 1)
      v30 = sub_23B43E1B4((_QWORD *)(v34 > 1), v35 + 1, 1, v30);
    ++v29;
    v30[2] = v35 + 1;
    v36 = &v30[2 * v35];
    v36[4] = v31;
    v36[5] = v33;
  }
  while (v4 != v29);
LABEL_35:
  swift_bridgeObjectRelease();
  if (qword_256A1A538 != -1)
    swift_once();
  v37 = (void *)qword_256A1BCD0;
  v38 = (void *)sub_23B4834E8();
  swift_bridgeObjectRelease();
  if (qword_256A1A530 != -1)
    swift_once();
  v39 = (void *)sub_23B483428();
  objc_msgSend(v37, sel_setObject_forKey_, v38, v39);

}

uint64_t sub_23B47BB4C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;

  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v6 = sub_23B483674();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v7 = 4;
      do
      {
        v8 = v7 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v9 = MEMORY[0x23B8649E0](v7 - 4, a1);
          v10 = __OFADD__(v8, 1);
          v11 = v7 - 3;
          if (v10)
            goto LABEL_18;
        }
        else
        {
          v9 = *(_QWORD *)(a1 + 8 * v7);
          swift_retain();
          v10 = __OFADD__(v8, 1);
          v11 = v7 - 3;
          if (v10)
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        v12 = *(_QWORD *)(v9 + 16) == a2 && *(_QWORD *)(v9 + 24) == a3;
        if (v12 || (sub_23B4837D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return v9;
        }
        swift_release();
        ++v7;
      }
      while (v11 != v6);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23B47BC74(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_17;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x23B8649E0](v7, a1);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      if (*(_QWORD *)(v8 + 16) == a2 && *(_QWORD *)(v8 + 24) == a3)
        break;
      v10 = sub_23B4837D0();
      swift_release();
      if ((v10 & 1) != 0)
        return v7;
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_17:
        swift_bridgeObjectRetain();
        v6 = sub_23B483674();
        swift_bridgeObjectRelease();
        v7 = 0;
        if (!v6)
          return v7;
      }
      else
      {
        ++v7;
        if (v11 == v6)
          return 0;
      }
    }
    swift_release();
  }
  return v7;
}

uint64_t sub_23B47BDA4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v22;
  int v23;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = swift_bridgeObjectRetain();
  v8 = sub_23B47BC74(v7, a2, a3);
  v10 = v9;
  v11 = v3;
  swift_bridgeObjectRelease();
  if (v3)
    return v8;
  if ((v10 & 1) == 0)
  {
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_61;
    if (*a1 >> 62)
    {
LABEL_62:
      swift_bridgeObjectRetain();
      v29 = sub_23B483674();
      swift_bridgeObjectRelease();
      if (v12 != v29)
        goto LABEL_6;
    }
    else if (v12 != *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      v12 = v8 + 5;
      v31 = v11;
      while (1)
      {
        v13 = v12 - 4;
        v14 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v15 = MEMORY[0x23B8649E0](v12 - 4);
        }
        else
        {
          if ((v13 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          if (v13 >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_52;
          v15 = *(_QWORD *)(v14 + 8 * v12);
          swift_retain();
        }
        if (*(_QWORD *)(v15 + 16) == a2 && *(_QWORD *)(v15 + 24) == a3)
        {
          swift_release();
          goto LABEL_39;
        }
        v17 = sub_23B4837D0();
        swift_release();
        if ((v17 & 1) != 0)
          goto LABEL_39;
        if (v13 != v8)
          break;
LABEL_35:
        if (__OFADD__(v8++, 1))
          goto LABEL_54;
LABEL_39:
        v25 = v12 - 3;
        if (__OFADD__(v13, 1))
          goto LABEL_53;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v26 = sub_23B483674();
          swift_bridgeObjectRelease();
        }
        else
        {
          v26 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v12;
        if (v25 == v26)
          return v8;
      }
      v18 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v19 = MEMORY[0x23B8649E0](v8, *a1);
        v18 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v13 & 0x8000000000000000) != 0)
            goto LABEL_57;
          if (v13 >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_58;
          v20 = *(_QWORD *)(v18 + 8 * v12);
          swift_retain();
          goto LABEL_24;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_55;
        if (v8 >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_56;
        v19 = *(_QWORD *)(v18 + 8 * v8 + 32);
        swift_retain();
        if ((v18 & 0xC000000000000001) == 0)
          goto LABEL_21;
      }
      v20 = MEMORY[0x23B8649E0](v12 - 4, v18);
      v18 = *a1;
LABEL_24:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v18;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v18 & 0x8000000000000000) != 0
        || (v18 & 0x4000000000000000) != 0)
      {
        sub_23B47AD28(v18);
      }
      *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v20;
      swift_release();
      sub_23B48350C();
      v22 = *a1;
      v23 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v22;
      if (!v23 || (v22 & 0x8000000000000000) != 0 || (v22 & 0x4000000000000000) != 0)
        sub_23B47AD28(v22);
      v11 = v31;
      if ((v13 & 0x8000000000000000) != 0)
        goto LABEL_59;
      if (v13 >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_60;
      *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 8 * v12) = v19;
      swift_release();
      sub_23B48350C();
      goto LABEL_35;
    }
    return v8;
  }
  v27 = *a1;
  if (!(v27 >> 62))
    return *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v30 = sub_23B483674();
  swift_bridgeObjectRelease();
  return v30;
}

unint64_t sub_23B47C0FC()
{
  unint64_t result;

  result = qword_256A1BA18;
  if (!qword_256A1BA18)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48BB1C, &type metadata for FBKSSInboxTat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BA18);
  }
  return result;
}

uint64_t type metadata accessor for FBKSSharedPersistence()
{
  return objc_opt_self();
}

uint64_t method lookup function for FBKSSharedPersistence()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23B47C16C()
{
  return type metadata accessor for FBKSSInboxTat();
}

uint64_t sub_23B47C174()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B483380();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FBKSSInboxTat()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSSInboxTat.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t storeEnumTagSinglePayload for FBKSSInboxTat.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B47C25C + 4 * byte_23B48B975[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B47C290 + 4 * byte_23B48B970[v4]))();
}

uint64_t sub_23B47C290(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B47C298(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B47C2A0);
  return result;
}

uint64_t sub_23B47C2AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B47C2B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B47C2B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B47C2C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSSInboxTat.CodingKeys()
{
  return &type metadata for FBKSSInboxTat.CodingKeys;
}

unint64_t sub_23B47C2E0()
{
  unint64_t result;

  result = qword_256A1BA48;
  if (!qword_256A1BA48)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48BAF4, &type metadata for FBKSSInboxTat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BA48);
  }
  return result;
}

unint64_t sub_23B47C328()
{
  unint64_t result;

  result = qword_256A1BA50;
  if (!qword_256A1BA50)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48BA64, &type metadata for FBKSSInboxTat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BA50);
  }
  return result;
}

unint64_t sub_23B47C370()
{
  unint64_t result;

  result = qword_256A1BA58;
  if (!qword_256A1BA58)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48BA8C, &type metadata for FBKSSInboxTat.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BA58);
  }
  return result;
}

uint64_t sub_23B47C3B4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6564644165746164 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

const char *FeedbackFeatureFlags.domain.getter()
{
  return "FeedbackFrameworks";
}

const char *FeedbackFeatureFlags.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "BatchEvaluation";
  else
    return "CentralizedFeedback";
}

const char *sub_23B47C4F4()
{
  return "FeedbackFrameworks";
}

const char *sub_23B47C508()
{
  _BYTE *v0;

  if (*v0)
    return "BatchEvaluation";
  else
    return "CentralizedFeedback";
}

unint64_t FeedbackFeatureError.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000022;
  else
    return 0xD000000000000026;
}

BOOL static FeedbackFeatureError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeedbackFeatureError.hash(into:)()
{
  return sub_23B483854();
}

unint64_t sub_23B47C5C0()
{
  unint64_t result;

  result = qword_256A1BA68;
  if (!qword_256A1BA68)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FeedbackFeatureFlags, &type metadata for FeedbackFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_256A1BA68);
  }
  return result;
}

unint64_t sub_23B47C608()
{
  unint64_t result;

  result = qword_256A1BA70;
  if (!qword_256A1BA70)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FeedbackFeatureError, &type metadata for FeedbackFeatureError);
    atomic_store(result, (unint64_t *)&qword_256A1BA70);
  }
  return result;
}

unint64_t sub_23B47C64C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000022;
  else
    return 0xD000000000000026;
}

ValueMetadata *type metadata accessor for FeedbackFeatureFlags()
{
  return &type metadata for FeedbackFeatureFlags;
}

uint64_t _s15FeedbackService20FeedbackFeatureFlagsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B47C6EC + 4 * byte_23B48BB75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B47C720 + 4 * byte_23B48BB70[v4]))();
}

uint64_t sub_23B47C720(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B47C728(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B47C730);
  return result;
}

uint64_t sub_23B47C73C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B47C744);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B47C748(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B47C750(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackFeatureError()
{
  return &type metadata for FeedbackFeatureError;
}

id sub_23B47C7BC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  return *v1;
}

void sub_23B47C85C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id FBKSDraftLauncher.__allocating_init(feedbackForm:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id FBKSDraftLauncher.init(feedbackForm:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for FBKSDraftLauncher();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for FBKSDraftLauncher()
{
  return objc_opt_self();
}

void sub_23B47C9B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t aBlock[9];

  v4 = v3;
  if (qword_256A1A4E0 != -1)
    swift_once();
  v8 = sub_23B4833E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
  v9 = sub_23B4833C8();
  v10 = sub_23B483584();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136446210;
    aBlock[6] = sub_23B44BBC0(0xD000000000000030, 0x800000023B48EB40, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v9, v10, "%{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v12, -1, -1);
    MEMORY[0x23B86528C](v11, -1, -1);
  }

  if (a1)
    v13 = a1;
  else
    v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FBKSLaunchConfiguration()), sel_init);
  v14 = qword_256A1A4F0;
  v15 = a1;
  if (v14 != -1)
    swift_once();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  sub_23B44E9C4((uint64_t)a2);
  v17 = (void *)sub_23B4504E4((uint64_t)sub_23B47CF28, v16);
  swift_release();
  if (v17)
  {
    v18 = (id *)(v4 + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
    swift_beginAccess();
    v19 = objc_msgSend(*v18, sel_asJSON);
    v20 = sub_23B483344();
    v22 = v21;

    v23 = (void *)sub_23B483338();
    sub_23B43ED7C(v20, v22);
    v24 = objc_msgSend(v13, sel_asJSON);
    v25 = sub_23B483344();
    v27 = v26;

    v28 = (void *)sub_23B483338();
    sub_23B43ED7C(v25, v27);
    if (a2)
    {
      aBlock[4] = (uint64_t)a2;
      aBlock[5] = a3;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23B4499A0;
      aBlock[3] = (uint64_t)&block_descriptor_8;
      a2 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v17, sel_collectFeedbackWithFormData_launchConfigurationData_completion_, v23, v28, a2);

    swift_unknownObjectRelease();
    _Block_release(a2);

  }
  else
  {
    v28 = v13;
  }

}

void sub_23B47CD24(void *a1, void (*a2)(void *))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (!os_log_type_enabled(v6, v7))
  {

    if (!a2)
      return;
    goto LABEL_7;
  }
  v8 = (uint8_t *)swift_slowAlloc();
  v9 = swift_slowAlloc();
  v13 = v9;
  *(_DWORD *)v8 = 136315138;
  v10 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
  v11 = sub_23B483470();
  sub_23B44BBC0(v11, v12, &v13);
  sub_23B4835D8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to daemon: %s", v8, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B86528C](v9, -1, -1);
  MEMORY[0x23B86528C](v8, -1, -1);

  if (a2)
LABEL_7:
    a2(a1);
}

uint64_t sub_23B47CEFC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

void sub_23B47CF28(void *a1)
{
  uint64_t v1;

  sub_23B47CD24(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_23B47CFF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23B47D010()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v1 = sub_23B4833E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_256A1BC98);
  v2 = sub_23B4833C8();
  v3 = sub_23B483584();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446210;
    v0[2] = sub_23B44BBC0(0xD000000000000025, 0x800000023B48EB80, &v11);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v5, -1, -1);
    MEMORY[0x23B86528C](v4, -1, -1);
  }

  v7 = v0[3];
  v6 = v0[4];
  v8 = swift_task_alloc();
  v0[5] = v8;
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_task_alloc();
  v0[6] = v9;
  *v9 = v0;
  v9[1] = sub_23B47D1F8;
  return sub_23B4837DC();
}

uint64_t sub_23B47D1F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B47D264()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B47D298(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_23B47C9B8(a3, sub_23B47D658, v9);
  return swift_release();
}

uint64_t sub_23B47D37C(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B483530();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
    return sub_23B48353C();
  }
}

id FBKSDraftLauncher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKSDraftLauncher.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBKSDraftLauncher.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSDraftLauncher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B47D494(uint64_t a1)
{
  uint64_t v1;

  return sub_23B47D298(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

id sub_23B47D49C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for FBKSDraftLauncher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSDraftLauncher.form.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of FBKSDraftLauncher.__allocating_init(feedbackForm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FBKSDraftLauncher.collectFeedback(launchConfiguration:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FBKSDraftLauncher.collectFeedback(launchConfiguration:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x80);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B447194;
  return v7(a1);
}

uint64_t sub_23B47D5B0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23B47D5C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23B47D5E4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23B47D5F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23B47D658(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A918);
  return sub_23B47D37C(a1);
}

uint64_t sub_23B47D698(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_23B483344();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_23B448B1C((uint64_t)v4, v8);
  return swift_release();
}

void *FBKSFeedbackCount.currentCampaign.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign);
  v2 = v1;
  return v1;
}

uint64_t FBKSFeedbackCount.feedbackFiled.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_23B47D7A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  void *v4;

  a4(0);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_23B4834E8();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t FBKSFeedbackCount.errors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FBKSFeedbackCount.declineCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount);
}

id FBKSFeedbackCount.__allocating_init(feedbackFiled:errors:currentCampaign:declineCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  objc_super v11;

  v9 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v9[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign] = a3;
  *(_QWORD *)&v9[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled] = a1;
  *(_QWORD *)&v9[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount] = a4;
  *(_QWORD *)&v9[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors] = a2;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

id FBKSFeedbackCount.init(feedbackFiled:errors:currentCampaign:declineCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign] = a3;
  *(_QWORD *)&v4[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled] = a1;
  *(_QWORD *)&v4[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount] = a4;
  *(_QWORD *)&v4[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors] = a2;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t static FBKSFeedbackCount.fetchCountsForForm(identifier:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  _s15FeedbackService17FBKSFeedbackCountC18fetchCountsForForm10identifier10completionySS_yACSg_So7NSErrorCSgtctFZ_0(a1, a2, (uint64_t)sub_23B47DA60, v8);
  return swift_release();
}

void sub_23B47D9AC(void *a1, void *a2, void (*a3)(id, uint64_t))
{
  id v5;
  uint64_t v6;
  id v8;

  if (a2)
  {
    v8 = a2;
    v5 = a2;
  }
  else
  {
    if (a1)
    {
      v8 = a1;
      v5 = a1;
      v6 = 0;
      goto LABEL_6;
    }
    v5 = _s15FeedbackService9FBKSErrorV7nsError06stringE0So7NSErrorCSS_tFZ_0(0xD000000000000020, 0x800000023B48F000);
    v8 = v5;
  }
  v6 = 1;
LABEL_6:
  a3(v5, v6);

}

uint64_t sub_23B47DA3C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23B47DA60(void *a1, void *a2)
{
  uint64_t v2;

  sub_23B47D9AC(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t static FBKSFeedbackCount.fetchCountsForForm(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_23B47DA88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_23B47DB3C;
  return sub_23B4837DC();
}

uint64_t sub_23B47DB3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B47DBA8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B47DBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BC40);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23B482934;
  *(_QWORD *)(v12 + 24) = v11;
  swift_retain();
  _s15FeedbackService17FBKSFeedbackCountC18fetchCountsForForm10identifier10completionySS_yACSg_So7NSErrorCSgtctFZ_0(a3, a4, (uint64_t)sub_23B4829EC, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_23B47DCD0(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BC40);
    return sub_23B483530();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BC40);
    return sub_23B48353C();
  }
}

uint64_t sub_23B47DD3C(void *a1, uint64_t (*a2)(_QWORD, void *))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  if (qword_256A1A4E0 != -1)
    swift_once();
  v4 = sub_23B4833E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A1BC98);
  v5 = a1;
  v6 = sub_23B4833C8();
  v7 = sub_23B48359C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v14 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A888);
    v11 = sub_23B483470();
    sub_23B44BBC0(v11, v12, &v14);
    sub_23B4835D8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B433000, v6, v7, "Failed to connect to daemon: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v9, -1, -1);
    MEMORY[0x23B86528C](v8, -1, -1);

  }
  else
  {

  }
  return a2(0, a1);
}

void sub_23B47DF10(uint64_t a1, unint64_t a2, void *a3, void (*a4)(void))
{
  id v6;
  uint64_t v9;
  id v10;
  id v11;

  if (a3)
  {
    v11 = a3;
    v6 = a3;
LABEL_5:
    ((void (*)(_QWORD, id))a4)(0, v6);

    return;
  }
  if (a2 >> 60 == 15)
  {
    v6 = _s15FeedbackService9FBKSErrorV7nsError06stringE0So7NSErrorCSS_tFZ_0(0xD000000000000020, 0x800000023B48F000);
    v11 = v6;
    goto LABEL_5;
  }
  sub_23B446D90(a1, a2);
  v9 = _s15FeedbackService17FBKSFeedbackCountC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  if (v9)
    v10 = (id)v9;
  else
    v10 = _s15FeedbackService9FBKSErrorV7nsError06stringE0So7NSErrorCSS_tFZ_0(0xD000000000000027, 0x800000023B48F030);
  a4();

  sub_23B448B1C(a1, a2);
}

unint64_t FBKSFeedbackCount.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  unint64_t v12;

  swift_getObjectType();
  v0 = sub_23B483464();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23B483218();
  MEMORY[0x24BDAC7A8](v1);
  sub_23B483248();
  swift_allocObject();
  sub_23B48323C();
  sub_23B48320C();
  sub_23B483224();
  sub_23B4817FC(&qword_256A1AAA0, v2, (uint64_t (*)(uint64_t))type metadata accessor for FBKSFeedbackCount, (uint64_t)&protocol conformance descriptor for FBKSFeedbackCount);
  v3 = sub_23B483230();
  v5 = v4;
  sub_23B483458();
  v6 = sub_23B48344C();
  if (!v7)
  {
    if (qword_256A1A4E0 != -1)
      swift_once();
    v8 = sub_23B4833E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_256A1BC98);
    v9 = sub_23B4833C8();
    v10 = sub_23B48359C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_23B433000, v9, v10, "Failed to generate JSON string", v11, 2u);
      MEMORY[0x23B86528C](v11, -1, -1);
    }

    v6 = FBKSFeedbackCount.description.getter();
  }
  v12 = v6;
  sub_23B43ED7C(v3, v5);
  swift_release();
  return v12;
}

unint64_t FBKSFeedbackCount.description.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;

  v1 = *(void **)(v0 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign);
  if (v1)
  {
    v2 = v1;
    FBKSCampaign.description.getter();
    sub_23B483488();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23B483488();
    swift_bridgeObjectRelease();
    sub_23B483488();

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23B483488();
  }
  sub_23B483488();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_23B483674();
    swift_bridgeObjectRelease();
    if (v8)
    {
      swift_bridgeObjectRetain_n();
      v4 = sub_23B483674();
      swift_bridgeObjectRelease();
      if (v4)
      {
        if (v4 >= 1)
        {
LABEL_7:
          v5 = 0;
          do
          {
            if ((v3 & 0xC000000000000001) != 0)
              v6 = (id)MEMORY[0x23B8649E0](v5, v3);
            else
              v6 = *(id *)(v3 + 8 * v5 + 32);
            v7 = v6;
            FBKSFeedback.description.getter();
            sub_23B483488();
            swift_bridgeObjectRelease();
            ++v5;
            swift_bridgeObjectRetain();
            sub_23B483488();
            swift_bridgeObjectRelease();
            sub_23B483488();

            swift_bridgeObjectRelease();
          }
          while (v4 != v5);
          goto LABEL_16;
        }
        __break(1u);
      }
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
  }
  sub_23B483488();
LABEL_18:
  sub_23B483488();
  v9 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors);
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_21;
    }
LABEL_31:
    sub_23B483488();
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23B483674();
  swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_31;
  swift_bridgeObjectRetain_n();
  v10 = sub_23B483674();
  swift_bridgeObjectRelease();
  if (v10)
  {
    if (v10 >= 1)
    {
LABEL_21:
      v11 = 0;
      do
      {
        if ((v9 & 0xC000000000000001) != 0)
          v12 = (id)MEMORY[0x23B8649E0](v11, v9);
        else
          v12 = *(id *)(v9 + 8 * v11 + 32);
        v13 = v12;
        FBKSCampaignError.description.getter();
        sub_23B483488();
        swift_bridgeObjectRelease();
        ++v11;
        swift_bridgeObjectRetain();
        sub_23B483488();
        swift_bridgeObjectRelease();
        sub_23B483488();

        swift_bridgeObjectRelease();
      }
      while (v10 != v11);
      goto LABEL_30;
    }
    __break(1u);
  }
LABEL_30:
  swift_bridgeObjectRelease();
LABEL_32:
  sub_23B483608();
  swift_bridgeObjectRelease();
  sub_23B4837AC();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B483488();
  swift_bridgeObjectRelease();
  return 0xD000000000000012;
}

uint64_t FBKSCampaign.description.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t result;

  sub_23B483608();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state) >= 5uLL)
  {
    result = sub_23B4837E8();
    __break(1u);
  }
  else
  {
    sub_23B483488();
    swift_bridgeObjectRelease();
    sub_23B483488();
    if (qword_256A1A540 != -1)
      swift_once();
    v1 = (id)qword_256A1BA90;
    v2 = (void *)sub_23B48335C();
    v3 = objc_msgSend(v1, sel_stringFromDate_, v2);

    sub_23B483434();
    sub_23B483488();
    swift_bridgeObjectRelease();
    sub_23B483488();
    return 0x203A65746174735BLL;
  }
  return result;
}

uint64_t FBKSFeedback.description.getter()
{
  id v0;
  void *v1;
  id v2;

  sub_23B483608();
  sub_23B483488();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B4837AC();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  if (qword_256A1A540 != -1)
    swift_once();
  v0 = (id)qword_256A1BA90;
  v1 = (void *)sub_23B48335C();
  v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  sub_23B483434();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  return 0;
}

uint64_t FBKSCampaignError.description.getter()
{
  id v0;
  void *v1;
  id v2;

  sub_23B483608();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  sub_23B4837AC();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  swift_bridgeObjectRetain();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  if (qword_256A1A540 != -1)
    swift_once();
  v0 = (id)qword_256A1BA90;
  v1 = (void *)sub_23B48335C();
  v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  sub_23B483434();
  sub_23B483488();
  swift_bridgeObjectRelease();
  sub_23B483488();
  return 0x3A6E69616D6F645BLL;
}

void FBKSFeedbackCount.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B47EF14(char a1)
{
  return *(_QWORD *)&aCurrentcfeedba[8 * a1];
}

uint64_t sub_23B47EF34()
{
  char *v0;

  return sub_23B47EF14(*v0);
}

uint64_t sub_23B47EF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B481974(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B47EF60()
{
  sub_23B4817A4();
  return sub_23B48389C();
}

uint64_t sub_23B47EF88()
{
  sub_23B4817A4();
  return sub_23B4838A8();
}

uint64_t FBKSFeedbackCount.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BAD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4817A4();
  sub_23B483890();
  v11 = *(_QWORD *)(v3 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign);
  HIBYTE(v10) = 0;
  type metadata accessor for FBKSCampaign(0);
  sub_23B4817FC(&qword_256A1BAE0, 255, type metadata accessor for FBKSCampaign, (uint64_t)&protocol conformance descriptor for FBKSCampaign);
  sub_23B483764();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled);
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BAE8);
    sub_23B4818EC(&qword_256A1BAF0, &qword_256A1BAF8, (uint64_t)&protocol conformance descriptor for FBKSFeedback, MEMORY[0x24BEE12A0]);
    sub_23B4837A0();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors);
    HIBYTE(v10) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB00);
    sub_23B481850(&qword_256A1BB08, &qword_256A1BB10, (uint64_t)&protocol conformance descriptor for FBKSCampaignError, MEMORY[0x24BEE12A0]);
    sub_23B4837A0();
    LOBYTE(v11) = 3;
    sub_23B483794();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id FBKSFeedbackCount.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSFeedbackCount.init(from:)(a1);
}

id FBKSFeedbackCount.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *ObjectType;
  objc_super v15;
  char v16;
  uint64_t v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB18);
  v4 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B4817A4();
  v7 = v1;
  sub_23B483884();
  if (v2)
  {
    v11 = ObjectType;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v8 = v4;
    type metadata accessor for FBKSCampaign(0);
    v16 = 0;
    sub_23B4817FC(&qword_256A1BB20, 255, type metadata accessor for FBKSCampaign, (uint64_t)&protocol conformance descriptor for FBKSCampaign);
    v9 = v13;
    sub_23B4836EC();
    v12 = OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign;
    *(_QWORD *)&v7[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BAE8);
    v16 = 1;
    sub_23B4818EC(&qword_256A1BB28, &qword_256A1BB30, (uint64_t)&protocol conformance descriptor for FBKSFeedback, MEMORY[0x24BEE12D0]);
    sub_23B483728();
    *(_QWORD *)&v7[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB00);
    v16 = 2;
    sub_23B481850(&qword_256A1BB38, &qword_256A1BB40, (uint64_t)&protocol conformance descriptor for FBKSCampaignError, MEMORY[0x24BEE12D0]);
    sub_23B483728();
    *(_QWORD *)&v7[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors] = v17;
    LOBYTE(v17) = 3;
    *(_QWORD *)&v7[OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount] = sub_23B48371C();

    v15.receiver = v7;
    v15.super_class = ObjectType;
    v11 = objc_msgSendSuper2(&v15, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v11;
}

uint64_t sub_23B47F618@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23B4813F8(a1, (uint64_t (*)(uint64_t))FBKSFeedbackCount.init(from:), a2);
}

uint64_t sub_23B47F634(_QWORD *a1)
{
  return FBKSFeedbackCount.encode(to:)(a1);
}

uint64_t FBKSCampaignState.description.getter(unint64_t a1)
{
  uint64_t result;

  if (a1 < 5)
    return *(_QWORD *)&aPending[8 * a1];
  result = sub_23B4837E8();
  __break(1u);
  return result;
}

unint64_t FBKSCampaignState.init(rawValue:)(unint64_t a1)
{
  return sub_23B481B4C(a1);
}

unint64_t sub_23B47F6D0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23B481B4C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_23B47F700()
{
  sub_23B48288C();
  return sub_23B4834D0();
}

uint64_t sub_23B47F75C()
{
  sub_23B48288C();
  return sub_23B4834B8();
}

uint64_t sub_23B47F7A8()
{
  unint64_t *v0;

  return FBKSCampaignState.description.getter(*v0);
}

uint64_t FBKSCampaign.state.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state);
}

uint64_t FBKSCampaign.updatedAt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B480950(&OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt, a1);
}

id FBKSCampaign.__allocating_init(state:updatedAt:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state] = a1;
  v6 = &v5[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt];
  v7 = sub_23B483380();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  v11.receiver = v5;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
  return v9;
}

id FBKSCampaign.init(state:updatedAt:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state] = a1;
  v6 = &v2[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt];
  v7 = sub_23B483380();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  v11.receiver = v2;
  v11.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
  return v9;
}

id FBKSCampaign.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKSCampaign.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B47F9E0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4164657461647075;
  else
    return 0x6574617473;
}

uint64_t sub_23B47FA18()
{
  char *v0;

  return sub_23B47F9E0(*v0);
}

uint64_t sub_23B47FA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B482448(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B47FA44()
{
  sub_23B481B5C();
  return sub_23B48389C();
}

uint64_t sub_23B47FA6C()
{
  sub_23B481B5C();
  return sub_23B4838A8();
}

uint64_t FBKSCampaign.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB48);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B481B5C();
  sub_23B483890();
  v11 = *(_QWORD *)(v3 + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state);
  v10[7] = 0;
  sub_23B481BA0();
  sub_23B4837A0();
  if (!v2)
  {
    v10[6] = 1;
    sub_23B483380();
    sub_23B4817FC(&qword_256A1BA20, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23B4837A0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

char *FBKSCampaign.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSCampaign.init(from:)(a1);
}

char *FBKSCampaign.init(from:)(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  objc_class *ObjectType;
  uint64_t v25;
  objc_super v26;
  char v27;
  uint64_t v28;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v20 = sub_23B483380();
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB60);
  v7 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v23 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_23B481B5C();
  v11 = v2;
  v21 = v9;
  v12 = v25;
  sub_23B483884();
  if (v12)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v13 = v6;
    v14 = v20;
    v15 = v7;
    v27 = 0;
    sub_23B481BE4();
    v16 = v21;
    v17 = v22;
    sub_23B483728();
    *(_QWORD *)&v11[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state] = v28;
    LOBYTE(v28) = 1;
    sub_23B4817FC(&qword_256A1BA30, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23B483728();
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v11[OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt], v13, v14);

    v26.receiver = v11;
    v26.super_class = ObjectType;
    v6 = (char *)objc_msgSendSuper2(&v26, sel_init);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  }
  return v6;
}

uint64_t sub_23B47FF04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23B4813F8(a1, (uint64_t (*)(uint64_t))FBKSCampaign.init(from:), a2);
}

uint64_t sub_23B47FF20(_QWORD *a1)
{
  return FBKSCampaign.encode(to:)(a1);
}

uint64_t FBKSFeedback.formIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_formIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FBKSFeedback.submissionDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B480950(&OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate, a1);
}

uint64_t FBKSFeedback.build.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_build);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FBKSFeedback.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id);
}

id FBKSFeedback.__allocating_init(formIdentifier:submissionDate:build:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  objc_super v21;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_formIdentifier];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate];
  v16 = sub_23B483380();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a3, v16);
  v18 = &v13[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_build];
  *(_QWORD *)v18 = a4;
  *((_QWORD *)v18 + 1) = a5;
  *(_QWORD *)&v13[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id] = a6;
  v21.receiver = v13;
  v21.super_class = v6;
  v19 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v16);
  return v19;
}

id FBKSFeedback.init(formIdentifier:submissionDate:build:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_formIdentifier];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v6[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate];
  v16 = sub_23B483380();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a3, v16);
  v18 = &v6[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_build];
  *(_QWORD *)v18 = a4;
  *((_QWORD *)v18 + 1) = a5;
  *(_QWORD *)&v6[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id] = a6;
  v21.receiver = v6;
  v21.super_class = ObjectType;
  v19 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v16);
  return v19;
}

void FBKSFeedback.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B480258(char a1)
{
  return *(_QWORD *)&aFormidensubmis[8 * a1];
}

uint64_t sub_23B480278()
{
  char *v0;

  return sub_23B480258(*v0);
}

uint64_t sub_23B480280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B482530(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B4802A4()
{
  sub_23B481C28();
  return sub_23B48389C();
}

uint64_t sub_23B4802CC()
{
  sub_23B481C28();
  return sub_23B4838A8();
}

uint64_t FBKSFeedback.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B481C28();
  sub_23B483890();
  v8[15] = 0;
  sub_23B483770();
  if (!v1)
  {
    v8[14] = 1;
    sub_23B483380();
    sub_23B4817FC(&qword_256A1BA20, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23B4837A0();
    v8[13] = 2;
    sub_23B483770();
    v8[12] = 3;
    sub_23B483794();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

id FBKSFeedback.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSFeedback.init(from:)(a1);
}

id FBKSFeedback.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  objc_class *ObjectType;
  _QWORD *v30;
  objc_super v31;
  char v32;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_23B483380();
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB80);
  v6 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v9);
  sub_23B481C28();
  v10 = v1;
  v27 = v8;
  v11 = (uint64_t)v30;
  sub_23B483884();
  if (v11)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v12 = v5;
    v30 = a1;
    v13 = v25;
    v14 = v26;
    v32 = 0;
    v15 = v27;
    v16 = v28;
    v17 = sub_23B4836F8();
    v19 = (uint64_t *)&v10[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_formIdentifier];
    *v19 = v17;
    v19[1] = v20;
    v24[1] = v19;
    v32 = 1;
    sub_23B4817FC(&qword_256A1BA30, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23B483728();
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v10[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate], v12, v14);
    v32 = 2;
    v21 = sub_23B4836F8();
    v22 = (uint64_t *)&v10[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_build];
    *v22 = v21;
    v22[1] = v23;
    v32 = 3;
    *(_QWORD *)&v10[OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id] = sub_23B48371C();

    v31.receiver = v10;
    v31.super_class = ObjectType;
    v9 = objc_msgSendSuper2(&v31, sel_init);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  }
  return v9;
}

uint64_t sub_23B4808E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23B4813F8(a1, (uint64_t (*)(uint64_t))FBKSFeedback.init(from:), a2);
}

uint64_t sub_23B4808FC(_QWORD *a1)
{
  return FBKSFeedback.encode(to:)(a1);
}

uint64_t FBKSCampaignError.date.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B480950(&OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date, a1);
}

uint64_t sub_23B480950@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *a1;
  v5 = sub_23B483380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t FBKSCampaignError.code.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code);
}

uint64_t FBKSCampaignError.domain.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_domain);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_23B480A00()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FBKSCampaignError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_errorDescription);
  swift_bridgeObjectRetain();
  return v1;
}

id FBKSCampaignError.__allocating_init(code:domain:errorDescription:date:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  objc_super v21;

  v12 = (char *)objc_allocWithZone(v6);
  v13 = &v12[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date];
  v14 = sub_23B483380();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a6, v14);
  *(_QWORD *)&v12[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code] = a1;
  v16 = &v12[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_domain];
  *(_QWORD *)v16 = a2;
  *((_QWORD *)v16 + 1) = a3;
  v17 = &v12[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_errorDescription];
  *(_QWORD *)v17 = a4;
  *((_QWORD *)v17 + 1) = a5;
  v21.receiver = v12;
  v21.super_class = v6;
  v18 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a6, v14);
  return v18;
}

id FBKSCampaignError.init(code:domain:errorDescription:date:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v13 = &v6[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date];
  v14 = sub_23B483380();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a6, v14);
  *(_QWORD *)&v6[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code] = a1;
  v16 = &v6[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_domain];
  *(_QWORD *)v16 = a2;
  *((_QWORD *)v16 + 1) = a3;
  v17 = &v6[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_errorDescription];
  *(_QWORD *)v17 = a4;
  *((_QWORD *)v17 + 1) = a5;
  v21.receiver = v6;
  v21.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a6, v14);
  return v18;
}

id sub_23B480C6C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  return v5;
}

void FBKSCampaignError.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23B480D1C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B480D54 + 4 * byte_23B48BD80[a1]))(0xD000000000000010, 0x800000023B48EFB0);
}

uint64_t sub_23B480D54()
{
  return 1702125924;
}

uint64_t sub_23B480D64()
{
  return 0x6E69616D6F64;
}

uint64_t sub_23B480D78()
{
  return 1701080931;
}

uint64_t sub_23B480D88()
{
  unsigned __int8 *v0;

  return sub_23B480D1C(*v0);
}

uint64_t sub_23B480D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B4826E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B480DB4()
{
  sub_23B481C6C();
  return sub_23B48389C();
}

uint64_t sub_23B480DDC()
{
  sub_23B481C6C();
  return sub_23B4838A8();
}

id _s15FeedbackService17FBKSFeedbackCountCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t FBKSCampaignError.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B481C6C();
  sub_23B483890();
  v8[15] = 0;
  sub_23B483380();
  sub_23B4817FC(&qword_256A1BA20, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_23B4837A0();
  if (!v1)
  {
    v8[14] = 1;
    sub_23B483794();
    v8[13] = 2;
    sub_23B483770();
    v8[12] = 3;
    sub_23B483770();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

id FBKSCampaignError.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKSCampaignError.init(from:)(a1);
}

id FBKSCampaignError.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  objc_class *ObjectType;
  char *v31;
  objc_super v32;
  char v33;

  ObjectType = (objc_class *)swift_getObjectType();
  v26 = sub_23B483380();
  v3 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BB98);
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v8);
  sub_23B481C6C();
  v9 = v1;
  v27 = v7;
  v10 = v31;
  sub_23B483884();
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v11 = v5;
    v12 = (uint64_t)a1;
    v33 = 0;
    sub_23B4817FC(&qword_256A1BA30, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v13 = v28;
    v15 = v26;
    v14 = v27;
    sub_23B483728();
    v17 = v3;
    v18 = &v9[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date];
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v9[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date], v29, v15);
    v33 = 1;
    *(_QWORD *)&v9[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code] = sub_23B48371C();
    v33 = 2;
    v19 = sub_23B4836F8();
    v31 = v18;
    v20 = (uint64_t *)&v9[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_domain];
    *v20 = v19;
    v20[1] = v21;
    v33 = 3;
    v22 = sub_23B4836F8();
    v23 = v11;
    v24 = (uint64_t *)&v9[OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_errorDescription];
    *v24 = v22;
    v24[1] = v25;

    v32.receiver = v9;
    v32.super_class = ObjectType;
    v8 = objc_msgSendSuper2(&v32, sel_init);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v13);
    __swift_destroy_boxed_opaque_existential_0(v12);
  }
  return v8;
}

uint64_t sub_23B4813DC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23B4813F8(a1, (uint64_t (*)(uint64_t))FBKSCampaignError.init(from:), a2);
}

uint64_t sub_23B4813F8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  objc_class *v3;
  uint64_t v4;
  id v8;
  uint64_t result;

  v8 = objc_allocWithZone(v3);
  result = a2(a1);
  if (!v4)
    *a3 = result;
  return result;
}

uint64_t sub_23B481450(_QWORD *a1)
{
  return FBKSCampaignError.encode(to:)(a1);
}

id sub_23B481470()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 3);
  result = objc_msgSend(v0, sel_setTimeStyle_, 3);
  qword_256A1BA90 = (uint64_t)v0;
  return result;
}

void _s15FeedbackService17FBKSFeedbackCountC18fetchCountsForForm10identifier10completionySS_yACSg_So7NSErrorCSgtctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t aBlock[6];

  if (qword_256A1A4E0 != -1)
    swift_once();
  v6 = sub_23B4833E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_256A1BC98);
  v7 = sub_23B4833C8();
  v8 = sub_23B4835A8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    aBlock[0] = v10;
    *(_DWORD *)v9 = 136446210;
    sub_23B44BBC0(0xD00000000000002ALL, 0x800000023B48EFD0, aBlock);
    sub_23B4835D8();
    _os_log_impl(&dword_23B433000, v7, v8, "%{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86528C](v10, -1, -1);
    MEMORY[0x23B86528C](v9, -1, -1);
  }

  if (qword_256A1A4F0 != -1)
    swift_once();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  swift_retain();
  v12 = (void *)sub_23B4504E4((uint64_t)sub_23B482984, v11);
  swift_release();
  if (v12)
  {
    v13 = (void *)sub_23B483428();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    aBlock[4] = (uint64_t)sub_23B48298C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23B47D698;
    aBlock[3] = (uint64_t)&block_descriptor_9;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_fetchCountsForFormWithIdentifier_completion_, v13, v15);
    swift_unknownObjectRelease();
    _Block_release(v15);

  }
}

uint64_t sub_23B481778(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B47DBB4(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for FBKSFeedbackCount()
{
  return objc_opt_self();
}

unint64_t sub_23B4817A4()
{
  unint64_t result;

  result = qword_256A1BAD8;
  if (!qword_256A1BAD8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C4B4, &type metadata for FBKSFeedbackCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BAD8);
  }
  return result;
}

uint64_t type metadata accessor for FBKSCampaign(uint64_t a1)
{
  return sub_23B445CDC(a1, (uint64_t *)&unk_256A1BBA8);
}

uint64_t sub_23B4817FC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B8651F0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FBKSFeedback(uint64_t a1)
{
  return sub_23B445CDC(a1, (uint64_t *)&unk_256A1BBB8);
}

uint64_t sub_23B481850(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1BB00);
    v10 = sub_23B4817FC(a2, 255, type metadata accessor for FBKSCampaignError, a3);
    result = MEMORY[0x23B8651F0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FBKSCampaignError(uint64_t a1)
{
  return sub_23B445CDC(a1, (uint64_t *)&unk_256A1BBC8);
}

uint64_t sub_23B4818EC(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A1BAE8);
    v10 = sub_23B4817FC(a2, 255, type metadata accessor for FBKSFeedback, a3);
    result = MEMORY[0x23B8651F0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B481974(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x43746E6572727563 && a2 == 0xEF6E676961706D61;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B63616264656566 && a2 == 0xED000064656C6946 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73726F727265 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x43656E696C636564 && a2 == 0xEC000000746E756FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t sub_23B481B4C(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

unint64_t sub_23B481B5C()
{
  unint64_t result;

  result = qword_256A1BB50;
  if (!qword_256A1BB50)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C464, &type metadata for FBKSCampaign.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BB50);
  }
  return result;
}

unint64_t sub_23B481BA0()
{
  unint64_t result;

  result = qword_256A1BB58;
  if (!qword_256A1BB58)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSCampaignState, &type metadata for FBKSCampaignState);
    atomic_store(result, (unint64_t *)&qword_256A1BB58);
  }
  return result;
}

unint64_t sub_23B481BE4()
{
  unint64_t result;

  result = qword_256A1BB68;
  if (!qword_256A1BB68)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSCampaignState, &type metadata for FBKSCampaignState);
    atomic_store(result, (unint64_t *)&qword_256A1BB68);
  }
  return result;
}

unint64_t sub_23B481C28()
{
  unint64_t result;

  result = qword_256A1BB78;
  if (!qword_256A1BB78)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C414, &type metadata for FBKSFeedback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BB78);
  }
  return result;
}

unint64_t sub_23B481C6C()
{
  unint64_t result;

  result = qword_256A1BB90;
  if (!qword_256A1BB90)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C3C4, &type metadata for FBKSCampaignError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BB90);
  }
  return result;
}

unint64_t sub_23B481CB4()
{
  unint64_t result;

  result = qword_256A1BBA0;
  if (!qword_256A1BBA0)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSCampaignState, &type metadata for FBKSCampaignState);
    atomic_store(result, (unint64_t *)&qword_256A1BBA0);
  }
  return result;
}

uint64_t method lookup function for FBKSFeedbackCount()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSFeedbackCount.__allocating_init(feedbackFiled:errors:currentCampaign:declineCount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for FBKSCampaignState()
{
  return &type metadata for FBKSCampaignState;
}

uint64_t sub_23B481D1C()
{
  return type metadata accessor for FBKSCampaign(0);
}

uint64_t sub_23B481D24()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B483380();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FBKSCampaign()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSCampaign.__allocating_init(state:updatedAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FBKSCampaign.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23B481DCC()
{
  return type metadata accessor for FBKSFeedback(0);
}

uint64_t sub_23B481DD4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B483380();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FBKSFeedback()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSFeedback.__allocating_init(formIdentifier:submissionDate:build:id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FBKSFeedback.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_23B481E88()
{
  return type metadata accessor for FBKSCampaignError(0);
}

uint64_t sub_23B481E90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B483380();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FBKSCampaignError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKSCampaignError.__allocating_init(code:domain:errorDescription:date:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for FBKSCampaignError.CodingKeys()
{
  return &type metadata for FBKSCampaignError.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKSFeedback.CodingKeys()
{
  return &type metadata for FBKSFeedback.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKSCampaign.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B481F9C + 4 * byte_23B48BD89[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B481FD0 + 4 * byte_23B48BD84[v4]))();
}

uint64_t sub_23B481FD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B481FD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B481FE0);
  return result;
}

uint64_t sub_23B481FEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B481FF4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B481FF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B482000(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSCampaign.CodingKeys()
{
  return &type metadata for FBKSCampaign.CodingKeys;
}

uint64_t _s15FeedbackService17FBKSCampaignErrorC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23B482068 + 4 * byte_23B48BD93[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B48209C + 4 * byte_23B48BD8E[v4]))();
}

uint64_t sub_23B48209C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4820A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B4820ACLL);
  return result;
}

uint64_t sub_23B4820B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B4820C0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B4820C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B4820CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKSFeedbackCount.CodingKeys()
{
  return &type metadata for FBKSFeedbackCount.CodingKeys;
}

unint64_t sub_23B4820EC()
{
  unint64_t result;

  result = qword_256A1BBD8;
  if (!qword_256A1BBD8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C174, &type metadata for FBKSFeedbackCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BBD8);
  }
  return result;
}

unint64_t sub_23B482134()
{
  unint64_t result;

  result = qword_256A1BBE0;
  if (!qword_256A1BBE0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C22C, &type metadata for FBKSCampaign.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BBE0);
  }
  return result;
}

unint64_t sub_23B48217C()
{
  unint64_t result;

  result = qword_256A1BBE8;
  if (!qword_256A1BBE8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C2E4, &type metadata for FBKSFeedback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BBE8);
  }
  return result;
}

unint64_t sub_23B4821C4()
{
  unint64_t result;

  result = qword_256A1BBF0;
  if (!qword_256A1BBF0)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C39C, &type metadata for FBKSCampaignError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BBF0);
  }
  return result;
}

unint64_t sub_23B48220C()
{
  unint64_t result;

  result = qword_256A1BBF8;
  if (!qword_256A1BBF8)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C30C, &type metadata for FBKSCampaignError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BBF8);
  }
  return result;
}

unint64_t sub_23B482254()
{
  unint64_t result;

  result = qword_256A1BC00;
  if (!qword_256A1BC00)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C334, &type metadata for FBKSCampaignError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC00);
  }
  return result;
}

unint64_t sub_23B48229C()
{
  unint64_t result;

  result = qword_256A1BC08;
  if (!qword_256A1BC08)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C254, &type metadata for FBKSFeedback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC08);
  }
  return result;
}

unint64_t sub_23B4822E4()
{
  unint64_t result;

  result = qword_256A1BC10;
  if (!qword_256A1BC10)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C27C, &type metadata for FBKSFeedback.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC10);
  }
  return result;
}

unint64_t sub_23B48232C()
{
  unint64_t result;

  result = qword_256A1BC18;
  if (!qword_256A1BC18)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C19C, &type metadata for FBKSCampaign.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC18);
  }
  return result;
}

unint64_t sub_23B482374()
{
  unint64_t result;

  result = qword_256A1BC20;
  if (!qword_256A1BC20)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C1C4, &type metadata for FBKSCampaign.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC20);
  }
  return result;
}

unint64_t sub_23B4823BC()
{
  unint64_t result;

  result = qword_256A1BC28;
  if (!qword_256A1BC28)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C0E4, &type metadata for FBKSFeedbackCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC28);
  }
  return result;
}

unint64_t sub_23B482404()
{
  unint64_t result;

  result = qword_256A1BC30;
  if (!qword_256A1BC30)
  {
    result = MEMORY[0x23B8651F0](&unk_23B48C10C, &type metadata for FBKSFeedbackCount.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A1BC30);
  }
  return result;
}

uint64_t sub_23B482448(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4164657461647075 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23B482530(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6564496D726F66 && a2 == 0xEE00726569666974;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x697373696D627573 && a2 == 0xEE00657461446E6FLL || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646C697562 && a2 == 0xE500000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23B4826E0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v3 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701080931 && a2 == 0xE400000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000 || (sub_23B4837D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023B48EFB0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23B4837D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23B482854()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23B482878()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_23B48288C()
{
  unint64_t result;

  result = qword_256A1BC38;
  if (!qword_256A1BC38)
  {
    result = MEMORY[0x23B8651F0](&protocol conformance descriptor for FBKSCampaignState, &type metadata for FBKSCampaignState);
    atomic_store(result, (unint64_t *)&qword_256A1BC38);
  }
  return result;
}

uint64_t sub_23B4828D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BC40);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23B482934(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A1BC40);
  return sub_23B47DCD0(a1, v3);
}

uint64_t sub_23B482984(void *a1)
{
  uint64_t v1;

  return sub_23B47DD3C(a1, *(uint64_t (**)(_QWORD, void *))(v1 + 16));
}

void sub_23B48298C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_23B47DF10(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t dispatch thunk of FBKSFeedbackCount.__allocating_init(from:)()
{
  return dispatch thunk of FBKSFeedback.__allocating_init(from:)();
}

uint64_t dispatch thunk of FBKSCampaignError.__allocating_init(from:)()
{
  return dispatch thunk of FBKSFeedback.__allocating_init(from:)();
}

uint64_t sub_23B4831D0()
{
  return MEMORY[0x24BDCB1A8]();
}

uint64_t sub_23B4831DC()
{
  return MEMORY[0x24BDCB1B0]();
}

uint64_t sub_23B4831E8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23B4831F4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23B483200()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23B48320C()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_23B483218()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_23B483224()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_23B483230()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23B48323C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23B483248()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23B483254()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t sub_23B483260()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23B48326C()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23B483278()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23B483284()
{
  return MEMORY[0x24BDCBA48]();
}

uint64_t sub_23B483290()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_23B48329C()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23B4832A8()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_23B4832B4()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_23B4832C0()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_23B4832CC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23B4832D8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23B4832E4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23B4832F0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23B4832FC()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_23B483308()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23B483314()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23B483320()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23B48332C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B483338()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23B483344()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23B483350()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23B48335C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23B483368()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23B483374()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23B483380()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23B48338C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23B483398()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23B4833A4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23B4833B0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B4833BC()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23B4833C8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B4833D4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B4833E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B4833EC()
{
  return MEMORY[0x24BEE6608]();
}

uint64_t sub_23B4833F8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23B483404()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23B483410()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23B48341C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23B483428()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B483434()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B483440()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23B48344C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23B483458()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23B483464()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23B483470()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23B48347C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B483488()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B483494()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_23B4834A0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B4834AC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23B4834B8()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23B4834C4()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23B4834D0()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23B4834DC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23B4834E8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23B4834F4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23B483500()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23B48350C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23B483518()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23B483524()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23B483530()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23B48353C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23B483548()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23B483554()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_23B483560()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_23B48356C()
{
  return MEMORY[0x24BDCFDF0]();
}

uint64_t sub_23B483578()
{
  return MEMORY[0x24BDCFE00]();
}

uint64_t sub_23B483584()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23B483590()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23B48359C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B4835A8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B4835B4()
{
  return MEMORY[0x24BDD00F8]();
}

uint64_t sub_23B4835C0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23B4835CC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23B4835D8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B4835E4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B4835F0()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_23B4835FC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23B483608()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B483614()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B483620()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23B48362C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23B483638()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23B483644()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23B483650()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B48365C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B483668()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B483674()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23B483680()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23B48368C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23B483698()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23B4836A4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B4836B0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23B4836BC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23B4836C8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23B4836D4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23B4836E0()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_23B4836EC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23B4836F8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23B483704()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23B483710()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23B48371C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23B483728()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23B483734()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23B483740()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23B48374C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23B483758()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_23B483764()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23B483770()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23B48377C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23B483788()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23B483794()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23B4837A0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23B4837AC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B4837B8()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23B4837C4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23B4837D0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B4837DC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23B4837E8()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_23B4837F4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23B483800()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23B48380C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B483818()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B483824()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B483830()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B48383C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23B483848()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B483854()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B483860()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23B48386C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23B483878()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B483884()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23B483890()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23B48389C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23B4838A8()
{
  return MEMORY[0x24BEE4A10]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x24BDE8C20]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

