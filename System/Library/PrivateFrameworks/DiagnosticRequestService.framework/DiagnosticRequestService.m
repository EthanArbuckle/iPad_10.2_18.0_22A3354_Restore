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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0B7160]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1DBBF7F7C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1DBBF7F7C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t DRSRequestOutcomeForState(uint64_t a1)
{
  if ((unint64_t)(a1 - 4096) < 8)
    return 3;
  if ((unint64_t)(a1 - 4352) <= 7)
  {
    if (((1 << a1) & 0xED) != 0)
      return 1;
    return 3;
  }
  if (a1 == 0x2000)
    return 2;
  else
    return 0;
}

BOOL DRSRequestStateIsTerminal(uint64_t a1)
{
  return DRSRequestOutcomeForState(a1) != 0;
}

BOOL DRSRequestStateIsErrorOrRejected(uint64_t a1)
{
  return ((DRSRequestOutcomeForState(a1) - 1) & 0xFD) == 0;
}

BOOL DRSRequestStateIsClientFacingError(uint64_t a1)
{
  int v2;
  _BOOL4 v4;

  v2 = DRSRequestOutcomeForState(a1);
  v4 = a1 == 4352 || a1 == 4357;
  return v2 == 1 && v4;
}

const __CFString *DRSDampeningOutcomeStringForOutcome(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("Accepted");
  else
    return off_1EA3D0F80[a1 - 1];
}

const __CFString *DRSRequestDSDecisionStringForDecision(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1EA3D0FC0[(char)a1];
}

uint64_t DRSRequestStateForDampeningOutcome(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 8)
    return 0;
  else
    return a1 + 4095;
}

uint64_t _deleteFileWithPath(void *a1)
{
  id v1;
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v19;
  char v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1
    && (v20 = 0,
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v1, &v20),
        v2,
        v3))
  {
    if (v20)
    {
      DPLogHandle_LogManagementError();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v4))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v1;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefusingToDeleteDirectory", "%{public}@ is a directory", buf, 0xCu);
      }

      DPLogHandle_LogManagementError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        _deleteFileWithPath_cold_1((uint64_t)v1, v5, v6, v7, v8, v9, v10, v11);
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v12 = objc_msgSend(v13, "removeItemAtPath:error:", v1, &v19);
      v5 = v19;

      if ((v12 & 1) != 0)
      {
        DPLogHandle_LogManagement();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v1;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DeletedFile", "Deleted %{public}@", buf, 0xCu);
        }
      }
      else
      {
        DPLogHandle_RequestError();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          -[NSObject localizedDescription](v5, "localizedDescription");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          v17 = CFSTR("Unknown");
          if (v15)
            v17 = (const __CFString *)v15;
          *(_DWORD *)buf = 138543618;
          v22 = v1;
          v23 = 2114;
          v24 = v17;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemoveFileFailure", "Failed to remove file with path %{public}@ due to error: %{public}@", buf, 0x16u);

        }
      }

    }
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

__CFString *DRRequestStateWithoutOutcomeStringForState(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 4095)
  {
    switch(a1)
    {
      case 4096:
        v1 = CFSTR("Rejected by resource hysteresis");
        break;
      case 4097:
        v1 = CFSTR("Rejected by resource cap");
        break;
      case 4098:
        v1 = CFSTR("Rejected by random resource downsampling");
        break;
      case 4099:
        v1 = CFSTR("Rejected by signature hysteresis");
        break;
      case 4100:
        v1 = CFSTR("Rejected by signature cap");
        break;
      case 4101:
        v1 = CFSTR("Rejected by random signature downsampling");
        break;
      case 4102:
        v1 = CFSTR("Rejected by total cap");
        break;
      case 4103:
        v1 = CFSTR("Service is disabled");
        break;
      default:
        switch(a1)
        {
          case 4352:
            v1 = CFSTR("On-receipt work failed");
            break;
          case 4353:
            v1 = CFSTR("Rejected by decision server");
            break;
          case 4354:
            v1 = CFSTR("Log culled/missing");
            break;
          case 4355:
            v1 = CFSTR("Multiple upload failures");
            break;
          case 4356:
            v1 = CFSTR("Customer disabled analytics");
            break;
          case 4357:
            v1 = CFSTR("Log size exceeds cap");
            break;
          case 4358:
            v1 = CFSTR("Invalid state transition");
            break;
          case 4359:
            v1 = CFSTR("Failed to update log file state (mark purgeable and/or delete)");
            break;
          default:
            if (a1 != 0x2000)
              goto LABEL_15;
            v1 = CFSTR("Uploaded");
            break;
        }
        break;
    }
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      v1 = CFSTR("Awaiting upload");
    }
    else if (a1 == 2)
    {
      v1 = CFSTR("Uploading");
    }
    else
    {
LABEL_15:
      v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown state (%#llx"), a1);
    }
  }
  else
  {
    v1 = CFSTR("Awaiting on-receipt work");
  }
  return v1;
}

id DRRequestStateWithOutcomeStringForState(uint64_t a1)
{
  int v2;
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = DRSRequestOutcomeForState(a1);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  DRRequestStateWithoutOutcomeStringForState(a1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v2 - 1) > 2)
    v6 = CFSTR("In-Flight");
  else
    v6 = off_1EA3D0FD8[(char)(v2 - 1)];
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (%@)"), v4, v6);

  return v7;
}

id DRSDictionaryForData(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  id v6;
  objc_class *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  if (v2)
  {
    DPLogHandle_ServiceXPCError();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      objc_msgSend(v2, "localizedDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      v5 = "Could not deserialize dictionary due to error: %{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedDictionary", v5, buf, 0xCu);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    DPLogHandle_ServiceXPCError();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      v5 = "Dict object not of expected class: %{public}@";
      goto LABEL_8;
    }
LABEL_9:

    v6 = 0;
    goto LABEL_10;
  }
  v6 = v1;
LABEL_10:

  return v6;
}

uint64_t DRSRequestExpectedLogStateForState(uint64_t a1, int a2, int a3)
{
  int v6;

  v6 = DRSRequestOutcomeForState(a1);
  if (!v6 && a2)
  {
    if (!a3 || a1 == 2 && a3 == 1)
      return 0;
    return a1 != 0;
  }
  if (!v6)
    return a1 != 0;
  if (v6 == 2)
    return 2;
  else
    return 3;
}

void sub_1DBB9BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1DBB9C418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1DBB9C730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB9D224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _minBufferDurationQueue()
{
  if (_minBufferDurationQueue_onceToken != -1)
    dispatch_once(&_minBufferDurationQueue_onceToken, &__block_literal_global_669);
  return (id)_minBufferDurationQueue_queue;
}

void ___minBufferDurationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DRSTailspin enforce min trace buffer duration queue", 0);
  v1 = (void *)_minBufferDurationQueue_queue;
  _minBufferDurationQueue_queue = (uint64_t)v0;

}

uint64_t DRSProtoDecisionResultReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id DRSRapidErrorWithDescription(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("DRSCKRapidError"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DRSRapidSandboxContainer()
{
  if (DRSRapidSandboxContainer_onceToken != -1)
    dispatch_once(&DRSRapidSandboxContainer_onceToken, &__block_literal_global_0);
  return (id)DRSRapidSandboxContainer_container;
}

id DRSRapidProdContainer()
{
  if (DRSRapidProdContainer_onceToken != -1)
    dispatch_once(&DRSRapidProdContainer_onceToken, &__block_literal_global_11);
  return (id)DRSRapidProdContainer_container;
}

void sub_1DBBA110C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoClientDeviceMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_25:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DRSProtoFileDescriptionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (1)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_34;
            v21 += 7;
            v14 = v22++ >= 9;
            if (v14)
            {
              v23 = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_36:
          *(_QWORD *)(a1 + 8) = v23;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
      }
      v20 = *(void **)(a1 + v19);
      *(_QWORD *)(a1 + v19) = v18;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsBatchReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoClientDeviceMetadata *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 10)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(DRSProtoDiagnosticRequestStats);
    objc_msgSend(a1, "addRequestsResultsStats:", v17);
    if (!PBReaderPlaceMark() || !DRSProtoDiagnosticRequestStatsReadFrom((char *)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DRSProtoRapidPayloadReplyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              v20 = 0;
LABEL_36:
            *(_BYTE *)(a1 + 24) = v20 != 0;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id DRSSandboxContainer()
{
  if (DRSSandboxContainer_onceToken != -1)
    dispatch_once(&DRSSandboxContainer_onceToken, &__block_literal_global_1);
  return (id)DRSSandboxContainer_container;
}

id DRSProductionContainer()
{
  if (DRSProductionContainer_onceToken != -1)
    dispatch_once(&DRSProductionContainer_onceToken, &__block_literal_global_5);
  return (id)DRSProductionContainer_container;
}

void DRSConfigureOperation(void *a1, void *a2, void *a3)
{
  _xpc_activity_s *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  const char *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;

  v19 = a1;
  v5 = a3;
  v6 = a2;
  objc_msgSend(v19, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferAnonymousRequests:", 1);

  objc_msgSend(v19, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutomaticallyRetryNetworkFailures:", 1);

  objc_msgSend(v19, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v19, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQualityOfService:", 9);

  objc_msgSend(v19, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContainer:", v6);

  objc_msgSend(v19, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setXPCActivity:", v5);

  if (v5)
  {
    v13 = xpc_activity_copy_criteria(v5);
    v14 = v13;
    if (v13)
    {
      v15 = (const char *)*MEMORY[0x1E0C808C8];
      xpc_dictionary_get_value(v13, (const char *)*MEMORY[0x1E0C808C8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = xpc_dictionary_get_BOOL(v14, v15);
        objc_msgSend(v19, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAllowsExpensiveNetworkAccess:", !v17);

      }
    }

  }
}

id DRSDeviceMetadata()
{
  if (DRSDeviceMetadata_onceToken != -1)
    dispatch_once(&DRSDeviceMetadata_onceToken, &__block_literal_global_6);
  return (id)DRSDeviceMetadata_deviceMetadata;
}

uint64_t DRValidateCKRecordDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!objc_msgSend(v3, "count"))
  {
    if (a2)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52[0] = CFSTR("'recordDictionary' is nil or empty");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v4);
      v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v16 = 0;
    goto LABEL_31;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (!v5)
  {
    v16 = 1;
    goto LABEL_30;
  }
  v6 = v5;
  v33 = a2;
  v34 = v4;
  v7 = *(_QWORD *)v40;
  v32 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v40 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v48 = *MEMORY[0x1E0CB2D50];
          v49 = CFSTR("'recordDictionary' has a non-NSString key");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v11);
          *v33 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
LABEL_28:
        v16 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_isSupportedRecordDictionaryValueType(v10) & 1) != 0)
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("'recordDictionary' value of type '%@' for key '%@' is not allowed"), v28, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)MEMORY[0x1E0CB35C8];
          v43 = *MEMORY[0x1E0CB2D50];
          v44 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v31);
          *v33 = (id)objc_claimAutoreleasedReturnValue();

        }
        v11 = v10;
LABEL_27:

        goto LABEL_28;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            if ((_isSupportedRecordDictionaryValueType(*(void **)(*((_QWORD *)&v35 + 1) + 8 * j)) & 1) == 0)
            {
              if (v33)
              {
                v18 = (void *)MEMORY[0x1E0CB3940];
                v19 = (objc_class *)objc_opt_class();
                NSStringFromClass(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringWithFormat:", CFSTR("'recordDictionary' value of type '%@' for array with key '%@' is not allowed"), v20, v9);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = (void *)MEMORY[0x1E0CB35C8];
                v45 = *MEMORY[0x1E0CB2D50];
                v46 = v21;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v23);
                *v33 = (id)objc_claimAutoreleasedReturnValue();

              }
              v4 = v34;
              goto LABEL_27;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v13)
            continue;
          break;
        }
      }

      v4 = v34;
      v7 = v32;
LABEL_19:

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    v16 = 1;
    if (v6)
      continue;
    break;
  }
LABEL_30:

LABEL_31:
  return v16;
}

uint64_t _isSupportedRecordDictionaryValueType(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

void DRSCoreAnalyticsSendEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  DPLogHandle_Telemetry();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EmittingCATelemetry", "Emitting event %{public}@ with payload:\n%{public}@", (uint8_t *)&v6, 0x16u);
  }

  AnalyticsSendEvent();
}

uint64_t DRSProtoRequestDescriptionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_32;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_32:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_34;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_36;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_36:
      *(_QWORD *)(a1 + 8) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsBatchReplyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

BOOL DRSProtoDiagnosticUploadRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  DRSProtoRequestDescription *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 10)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v18 = *(DRSProtoRequestDescription **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v19;
        goto LABEL_28;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_33;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(DRSProtoFileDescription);
    objc_msgSend((id)a1, "addLogs:", v18);
    if (!PBReaderPlaceMark() || (DRSProtoFileDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL DRSProtoTaskingConfigMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  DRSProtoTaskingDeviceMetadata *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 24;
        goto LABEL_26;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || !DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)v18, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = 16;
LABEL_26:
    v18 = *(DRSProtoTaskingDeviceMetadata **)(a1 + v20);
    *(_QWORD *)(a1 + v20) = v19;
LABEL_27:

    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL DRSProtoEnableDataGatheringRequestBatchReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoClientDeviceMetadata *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 10)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(DRSProtoEnableDataGatheringRequest);
    objc_msgSend(a1, "addDataGatheringRequests:", v17);
    if (!PBReaderPlaceMark() || (DRSProtoEnableDataGatheringRequestReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  DRSProtoDiagnosticRequestOutcomeBucket *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_23;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_23;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_23:
        v19 = *(DRSProtoDiagnosticRequestOutcomeBucket **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;
        goto LABEL_24;
      case 0xAu:
        v19 = objc_alloc_init(DRSProtoDiagnosticRequestOutcomeBucket);
        objc_msgSend(a1, "addOutcomes:", v19);
        if (PBReaderPlaceMark()
          && (DRSProtoDiagnosticRequestOutcomeBucketReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_24:

LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_25;
    }
  }
}

void sub_1DBBABD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBBAC194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBBAFA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
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

void sub_1DBBB2988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1DBBB2C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t DRSRequestDBFilePath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:", kDRSRequestDBFileName);
}

id DRSRequestRemoveDB(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  -[NSObject stringByAppendingPathComponent:](v1, "stringByAppendingPathComponent:", kDRSRequestDBFileName);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject stringByAppendingPathComponent:](v1, "stringByAppendingPathComponent:", kDRSRequestDBFileWalName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject stringByAppendingPathComponent:](v1, "stringByAppendingPathComponent:", kDRSRequestDBFileShmName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _removePathIfExists(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _removePathIfExists(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _removePathIfExists(v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = 0;
  else
    v9 = v6 == 0;
  if (v9 && v7 == 0)
  {
    DPLogHandle_CoreDataError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v1;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemovingRequestDBSuccess", "Removed DB at working directory %{public}@", buf, 0xCu);
    }
    v22 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = CFSTR("Unknown error");
      -[NSObject appendFormat:](v11, "appendFormat:", CFSTR("%@: %@\n"), v2, v14);

    }
    if (v6)
    {
      objc_msgSend(v6, "localizedDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (const __CFString *)v15;
      else
        v17 = CFSTR("Unknown error");
      -[NSObject appendFormat:](v11, "appendFormat:", CFSTR("%@: %@\n"), v3, v17);

    }
    if (v8)
    {
      objc_msgSend(v8, "localizedDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (const __CFString *)v18;
      else
        v20 = CFSTR("Unknown error");
      -[NSObject appendFormat:](v11, "appendFormat:", CFSTR("%@: %@\n"), v4, v20);

    }
    DPLogHandle_CoreDataError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemovingRequestDBFailure", "Failed to remove request DB due to error: %{public}@", buf, 0xCu);
    }

    _coreDataHelperError(v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id _removePathIfExists(void *a1)
{
  id v1;
  void *v2;
  int v3;
  id v4;
  void *v5;
  id v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "fileExistsAtPath:", v1))
    goto LABEL_4;
  v7 = 0;
  v3 = objc_msgSend(v2, "removeItemAtPath:error:", v1, &v7);
  v4 = v7;
  v5 = v4;
  if (v3)
  {

LABEL_4:
    v5 = 0;
  }

  return v5;
}

id _coreDataHelperError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t DRSTaskingDBFilePath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("DRSTaskingDataModel"));
}

uint64_t DRSCKConfigDBFilePath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("DRSCKConfigModel"));
}

id _dbFilePath(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(a2, "stringByAppendingString:", CFSTR(".sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DRSRequestModelForVersion(int a1, _QWORD *a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  __CFString *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if ((a1 - 1) < 3)
  {
    v3 = off_1EA3D1588[(__int16)(a1 - 1)];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.performance.DiagnosticRequestService"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("DRSDataModel"), CFSTR("momd"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
        {
          DPLogHandle_CoreDataError();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v21))
          {
            -[NSObject path](v6, "path");
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v22;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelBundleCreationFailure", "Failed to create NSBundle from URL: '%@'", buf, 0xCu);

          }
          if (!a2)
          {
            v10 = 0;
            goto LABEL_36;
          }
          v23 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[NSObject path](v6, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (__CFString *)objc_msgSend(v23, "initWithFormat:", CFSTR("Failed to create bundle for model URL '%@'"), v24);

          _coreDataHelperError(v9);
          v10 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        objc_msgSend(v7, "URLForResource:withExtension:", v3, CFSTR("mom"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v9);
          if (!v10)
          {
            DPLogHandle_CoreDataError();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v11))
            {
              *(_DWORD *)buf = 138543618;
              v27 = v9;
              v28 = 2112;
              v29 = v3;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationFailure", "Failed instantiate model using URL %{public}@ (model version: '%@')", buf, 0x16u);
            }

            if (a2)
            {
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed instantiate model using URL %@"), v6);
              v13 = (void *)MEMORY[0x1E0CB35C8];
              v32 = *MEMORY[0x1E0CB2D50];
              v33[0] = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v14);
              *a2 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          DPLogHandle_CoreData();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v15))
          {
            objc_msgSend(v10, "versionIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v27 = v9;
            v28 = 2112;
            v29 = v3;
            v30 = 2112;
            v31 = v16;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationSuccess", "Instantiate model using URL %{public}@ (model version: '%@', identifiers: '%@')", buf, 0x20u);

          }
        }
        else
        {
          DPLogHandle_CoreDataError();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v25))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v3;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelVersionURLFailure", "Failed to get URL for model version '%@'", buf, 0xCu);
          }

          if (!a2)
          {
            v10 = 0;
            goto LABEL_35;
          }
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create URL for model name %@"), v3);
          _coreDataHelperError(v15);
          v10 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_35:
        goto LABEL_36;
      }
      DPLogHandle_CoreDataError();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelResourceURLFailure", "Failed to get URL for model bundle", buf, 2u);
      }

      if (a2)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create URL for model name %@"), CFSTR("DRSDataModel"));
        _coreDataHelperError(v8);
        v10 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      DPLogHandle_CoreDataError();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138543362;
        v27 = CFSTR("com.apple.performance.DiagnosticRequestService");
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FrameworkBundleAccessFailure", "Get bundle for  %{public}@", buf, 0xCu);
      }
    }
    v10 = 0;
LABEL_37:

    return v10;
  }
  DPLogHandle_CoreDataError();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a1;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequestModelVersion", "Invalid version: %u", buf, 8u);
  }

  if (a2)
  {
    _coreDataHelperError(CFSTR("Invalid Version"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

id _persistentContainerForModel(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v32;
  _QWORD v33[4];
  NSObject *v34;
  __int128 *p_buf;
  uint8_t v36[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v32 = a2;
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C97BC8], "persistentContainerWithName:managedObjectModel:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    _dbFilePath(v32, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      DPLogHandle_CoreData();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreDescriptionSuccess", "Create NSPersistentStoreDescription with path %{public}@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v16, "setReadOnly:", a4);
      objc_msgSend(v16, "setShouldMigrateStoreAutomatically:", a5);
      v45 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPersistentStoreDescriptions:", v18);

      v19 = dispatch_semaphore_create(0);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__1;
      v43 = __Block_byref_object_dispose__1;
      v44 = 0;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = ___persistentContainerForModel_block_invoke;
      v33[3] = &unk_1EA3D1568;
      p_buf = &buf;
      v20 = v19;
      v34 = v20;
      objc_msgSend(v13, "loadPersistentStoresWithCompletionHandler:", v33);
      v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v21)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v21);
        DPLogHandle_CoreDataError();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v36 = 138543618;
          v37 = v14;
          v38 = 2114;
          v39 = v23;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreLoadFailure", "Failed to load persistent store with path '%{public}@' due to error: %{public}@", v36, 0x16u);

        }
        v24 = 0;
      }
      else
      {
        DPLogHandle_CoreData();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v30))
        {
          *(_DWORD *)v36 = 138543362;
          v37 = v14;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreLoadSuccess", "Loaded persistent store with path '%{public}@'", v36, 0xCu);
        }

        v24 = v13;
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      DPLogHandle_CoreDataError();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v27))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreDescriptionFailure", "Failed to create NSPersistentStoreDescription with path %{public}@", (uint8_t *)&buf, 0xCu);
      }

      if (!a6)
      {
        v24 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create NSPersistentStoreDescription with path %@"), v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v29);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 0;
    }

LABEL_24:
    goto LABEL_25;
  }
  DPLogHandle_CoreDataError();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("DRSDataModel");
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentContainerCreationFailure", "Failed to create NSPersistentContainer with name %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (!a6)
  {
    v24 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create NSPersistentContainer with name %@"), v12, v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB35C8];
  v48 = *MEMORY[0x1E0CB2D50];
  v49[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v15);
  v24 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
  return v24;
}

void sub_1DBBB4248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void ___persistentContainerForModel_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id DRSRequestPersistentContainerForVersion(int a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a2;
  DRSRequestModelForVersion(a1, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    _persistentContainerForModel(v10, v9, CFSTR("DRSDataModel"), a3, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

_QWORD *DRSRequestPersistentContainer(void *a1, uint64_t a2, _QWORD *a3)
{
  return _persistentContainer(a1, CFSTR("DRSDataModel"), a2, 0, a3);
}

_QWORD *_persistentContainer(void *a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.performance.DiagnosticRequestService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "URLForResource:withExtension:", v10, CFSTR("momd"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v13);
      v15 = v14;
      if (v14)
      {
        _persistentContainerForModel(v14, v9, v10, a3, a4, a5);
        a5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      DPLogHandle_CoreDataError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138543362;
        v29 = (const __CFString *)v13;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationFailure", "Failed instantiate model using URL %{public}@", buf, 0xCu);
      }

      if (!a5)
        goto LABEL_17;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed instantiate model using URL %@"), v13);
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
      a5 = 0;
      goto LABEL_17;
    }
    DPLogHandle_CoreDataError();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelResourceFailure", "Failed to get URL for model resource", buf, 2u);
    }

    if (a5)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create URL for model name %@"), v10);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("DRSCoreDataHelperError"), 0, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else
  {
    DPLogHandle_CoreDataError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138543362;
      v29 = CFSTR("com.apple.performance.DiagnosticRequestService");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FrameworkBundleAccessFailure", "Get bundle for  %{public}@", buf, 0xCu);
    }
    a5 = 0;
  }
LABEL_18:

  return a5;
}

_QWORD *DRSTaskingPersistentContainer(void *a1, uint64_t a2, _QWORD *a3)
{
  return _persistentContainer(a1, CFSTR("DRSTaskingDataModel"), a2, 1, a3);
}

_QWORD *DRSCKConfigPersistentContainer(void *a1, uint64_t a2, _QWORD *a3)
{
  return _persistentContainer(a1, CFSTR("DRSCKConfigModel"), a2, 1, a3);
}

void sub_1DBBB6328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBBB6E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
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

void sub_1DBBB7BBC(_Unwind_Exception *a1)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DBBB7FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBB9360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBB9B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBBA834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _acceptingAdminReplyMessage(void *a1)
{
  xpc_object_t reply;

  reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_BOOL(reply, "AdminRequest_Reply", 1);
  return reply;
}

void sub_1DBBBBFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBBEA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBBEC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBBF62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoDiagnosticUploadRequestBatchReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoClientDeviceMetadata *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 10)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(DRSProtoDiagnosticUploadRequest);
    objc_msgSend(a1, "addUploadRequests:", v17);
    if (!PBReaderPlaceMark() || !DRSProtoDiagnosticUploadRequestReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *DRSStringForServiceState(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Waiting for activation");
  if (a1 == 1)
    v1 = CFSTR("Activated");
  if (a1 == 2)
    return CFSTR("Deactivated");
  else
    return v1;
}

void DRSRegisterForDeviceUnlockNotification()
{
  if (DRSRegisterForDeviceUnlockNotification_onceToken != -1)
    dispatch_once(&DRSRegisterForDeviceUnlockNotification_onceToken, &__block_literal_global_5);
}

void DRSWaitForDeviceUnlock()
{
  if (DRSWaitForDeviceUnlock_onceToken != -1)
    dispatch_once(&DRSWaitForDeviceUnlock_onceToken, &__block_literal_global_9);
}

BOOL DRSDeviceIsUnlocked()
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

void DRSConfirmDirectoryIsInitialized(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  char v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  id v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v5, &v50))
  {
    if (!v50)
    {
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v5;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequiredDirectory", "FATAL ERROR: %{public}@ exists but is not a directory", buf, 0xCu);
      }
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FATAL ERROR: %@ exists but is not a directory"), v5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        DRSConfirmDirectoryIsInitialized_cold_1(v9, v7, v10, v11, v12, v13, v14, v15);
      goto LABEL_42;
    }
  }
  else
  {
    v49 = 0;
    v16 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v49);
    v17 = v49;
    if ((v16 & 1) == 0)
    {
      v31 = v7;
      if (os_signpost_enabled(v31))
      {
        objc_msgSend(v17, "localizedDescription");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32)
          v34 = (const __CFString *)v32;
        else
          v34 = CFSTR("Unknown");
        *(_DWORD *)buf = 138543618;
        v52 = v5;
        v53 = 2114;
        v54 = (void *)v34;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequiredDirectoryFailure", "FATAL ERROR: Failed to create %{public}@ due to error: %{public}@", buf, 0x16u);

      }
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v17, "localizedDescription");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (const __CFString *)v36;
      else
        v38 = CFSTR("Unknown");
      v39 = objc_msgSend(v35, "initWithFormat:", CFSTR("FATAL ERROR: Failed to create %@ due to error: %@"), v5, v38);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        DRSConfirmDirectoryIsInitialized_cold_1(v39, v31, v40, v41, v42, v43, v44, v45);
LABEL_42:
      exit(1);
    }
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatedRequiredDirectory", "Created %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v19 = *MEMORY[0x1E0C999D8];
  v47 = 0;
  v20 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v48, v19, &v47);
  v21 = v48;
  v22 = v47;
  if ((v20 & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject BOOLValue](v21, "BOOLValue"))
    {
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v5;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingCorrect", "Value for NSURLIsExcludedFromBackupKey of %{public}@ is already correctly set", buf, 0xCu);
      }
LABEL_30:

      goto LABEL_31;
    }
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 138543618;
      v52 = v5;
      v53 = 2114;
      v54 = v21;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingIncorrect", "Value for NSURLIsExcludedFromBackupKey of %{public}@ is not correctly set (%{public}@)", buf, 0x16u);
    }
  }
  else
  {
    v23 = v7;
    if (os_signpost_enabled(v23))
    {
      objc_msgSend(v22, "localizedDescription");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = CFSTR("Unknown");
      if (v24)
        v26 = (const __CFString *)v24;
      *(_DWORD *)buf = 138543618;
      v52 = v5;
      v53 = 2114;
      v54 = (void *)v26;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingFetchFailed", "WARNING: Failed to get value for NSURLIsExcludedFromBackupKey for %{public}@ from due to error: %{public}@", buf, 0x16u);

    }
  }

  v46 = 0;
  v27 = objc_msgSend(v18, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v19, &v46);
  v22 = v46;
  if ((v27 & 1) == 0)
  {
    v21 = v7;
    if (os_signpost_enabled(v21))
    {
      objc_msgSend(v22, "localizedDescription");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("Unknown");
      if (v28)
        v30 = (const __CFString *)v28;
      *(_DWORD *)buf = 138543618;
      v52 = v5;
      v53 = 2114;
      v54 = (void *)v30;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingFailure", "SOFT ERROR: Failed to exclude %{public}@ from backup due to error: %{public}@", buf, 0x16u);

    }
    goto LABEL_30;
  }
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v5;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingSuccess", "Set resource to exclude %{public}@ from backup", buf, 0xCu);
  }
LABEL_31:

}

id DRSGetConfigurationDictionary(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  _configAccessQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DRSGetConfigurationDictionary_block_invoke;
  block[3] = &unk_1EA3D1520;
  v9 = v3;
  v10 = &v12;
  v11 = &v18;
  v5 = v3;
  dispatch_sync(v4, block);

  *a2 = objc_retainAutorelease((id)v13[5]);
  v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
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

id _configAccessQueue()
{
  if (_configAccessQueue_onceToken != -1)
    dispatch_once(&_configAccessQueue_onceToken, &__block_literal_global_22);
  return (id)_configAccessQueue_syncQueue;
}

uint64_t DRSSetConfigurationDictionary(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a1;
  v6 = a2;
  *a3 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("DPConfig.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _configAccessQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DRSSetConfigurationDictionary_block_invoke;
  block[3] = &unk_1EA3D1970;
  v18 = &v20;
  v19 = &v24;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  dispatch_sync(v8, block);

  *a3 = objc_retainAutorelease((id)v25[5]);
  v12 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void sub_1DBBC1370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id DRSPidToProcessName(int a1)
{
  uint64_t ProcessNameByPID;
  NSObject *v3;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1 < 1)
  {
    DPLogHandle_ServiceLifecycleError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v5))
      goto LABEL_11;
    v8 = 67109120;
    v9 = a1;
    v6 = "InvalidPidToProcessName";
    v7 = "WARNING: Invalid pid (%d) cannot be mapped to a process name";
    goto LABEL_10;
  }
  v12 = 0;
  v13 = 0;
  ProcessNameByPID = GetProcessNameByPID();
  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v8 = 67109378;
    v9 = a1;
    v10 = 2080;
    v11 = ProcessNameByPID;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PidToProcessName", "Mapped client pid %d to process %s", (uint8_t *)&v8, 0x12u);
  }

  if (ProcessNameByPID)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", ProcessNameByPID);
  DPLogHandle_ServiceLifecycleError();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v8 = 67109120;
    v9 = a1;
    v6 = "GetProcessNameByPIDFailed";
    v7 = "WARNING: Failed to map pid (%d) to a process name";
LABEL_10:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v8, 8u);
  }
LABEL_11:

  return 0;
}

void ___configAccessQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.DiagnosticPipeline configuration access queue", 0);
  v1 = (void *)_configAccessQueue_syncQueue;
  _configAccessQueue_syncQueue = (uint64_t)v0;

}

uint64_t DRSProtoRapidPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  DRSProtoClientDeviceMetadata *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (PBReaderPlaceMark() && DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
          goto LABEL_29;
        goto LABEL_44;
      case 2u:
        v17 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_29;
      case 3u:
        v17 = objc_alloc_init(DRSProtoFileDescription);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (DRSProtoFileDescriptionReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      case 4u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 40) = v21;
        goto LABEL_42;
      case 5u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v25;

        goto LABEL_42;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_42;
    }
  }
}

uint64_t DRSProtoTaskingConfigCompletionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  BOOL v17;
  DRSProtoTaskingConfigMetadata *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
              objc_storeStrong((id *)(a1 + 32), v18);
              if (PBReaderPlaceMark() && DRSProtoTaskingConfigMetadataReadFrom((uint64_t)v18, a2))
              {
                PBReaderRecallMark();

                goto LABEL_32;
              }

              return 0;
            case 2u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 24;
              goto LABEL_26;
            case 3u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 16;
LABEL_26:
              v22 = *(void **)(a1 + v21);
              *(_QWORD *)(a1 + v21) = v20;

              goto LABEL_32;
            case 4u:
              *(_BYTE *)(a1 + 40) |= 1u;
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v25 = 0;
              }
              *(_DWORD *)(a1 + 8) = v25;
              goto LABEL_32;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_32:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DRSProtoEnableDataGatheringRequestResponseBatchReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoDecisionResult *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 10)
      {
        v17 = objc_alloc_init(DRSProtoDecisionResult);
        objc_msgSend(a1, "addDecisionResults:", v17);
        if (!PBReaderPlaceMark() || (DRSProtoDecisionResultReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBBC4DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DRSProtoEnableDataGatheringRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  DRSProtoRequestDescription *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_35;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_37:
        *(_BYTE *)(a1 + 24) = v21 != 0;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DRSProtoDiagnosticRequestOutcomeBucketReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_51:
        *(_QWORD *)(a1 + 8) = v26;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
          while (1)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
              break;
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0)
              goto LABEL_53;
            v30 += 7;
            v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_55:
          v36 = 20;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_47:
          v36 = 16;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *DRSSystemProfilePlatformStringForPlatform(unsigned int a1)
{
  if (a1 > 6)
    return CFSTR("Unknown");
  else
    return off_1EA3D1DF0[(char)a1];
}

id DRSSystemProfileVariantStringForParameters(int a1, int a2, int a3)
{
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = &stru_1EA3D37D0;
  v8 = CFSTR("Seed");
  if (!a2)
    v8 = &stru_1EA3D37D0;
  if (a1)
  {
    v9 = CFSTR("Internal%@%@");
  }
  else
  {
    v7 = CFSTR("Customer");
    v9 = CFSTR("%@%@");
  }
  if (a3)
    v7 = CFSTR("Carrier");
  return (id)objc_msgSend(v6, "initWithFormat:", v9, v7, v8);
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

uint64_t DRSProtoTaskingSystemMessageReceiptReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  BOOL v17;
  DRSProtoTaskingDeviceMetadata *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
              objc_storeStrong((id *)(a1 + 40), v18);
              if (PBReaderPlaceMark() && DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)v18, a2))
              {
                PBReaderRecallMark();

                goto LABEL_29;
              }

              return 0;
            case 2u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 48;
              goto LABEL_28;
            case 3u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 24;
              goto LABEL_28;
            case 4u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 16;
              goto LABEL_28;
            case 5u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 8;
LABEL_28:
              v22 = *(void **)(a1 + v21);
              *(_QWORD *)(a1 + v21) = v20;

              goto LABEL_29;
            case 6u:
              *(_BYTE *)(a1 + 56) |= 1u;
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v25 = 0;
              }
              *(_DWORD *)(a1 + 32) = v25;
              goto LABEL_29;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_29:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBBCE618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
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

const __CFString *DRSTaskingStringForTaskingStateChangeReason(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("Unknown");
  else
    return off_1EA3D1F78[a1];
}

void sub_1DBBD1ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DBBD3794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBD3F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DPLogHandle_ClientError()
{
  if (DPLogHandle_ClientError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientError_onceToken, &__block_literal_global_10);
  return (id)DPLogHandle_ClientError_handle;
}

id DPLogHandle_AdminError()
{
  if (DPLogHandle_AdminError_onceToken != -1)
    dispatch_once(&DPLogHandle_AdminError_onceToken, &__block_literal_global_2);
  return (id)DPLogHandle_AdminError_handle;
}

id DPLogHandle_ClientXPCError()
{
  if (DPLogHandle_ClientXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientXPCError_onceToken, &__block_literal_global_4);
  return (id)DPLogHandle_ClientXPCError_handle;
}

id DPLogHandle_ClientXPC()
{
  if (DPLogHandle_ClientXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientXPC_onceToken, &__block_literal_global_6_0);
  return (id)DPLogHandle_ClientXPC_handle;
}

id DPLogHandle_ClientAPI()
{
  if (DPLogHandle_ClientAPI_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientAPI_onceToken, &__block_literal_global_8_0);
  return (id)DPLogHandle_ClientAPI_handle;
}

id DPLogHandle_ClientAPIError()
{
  if (DPLogHandle_ClientAPIError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientAPIError_onceToken, &__block_literal_global_10);
  return (id)DPLogHandle_ClientAPIError_handle;
}

id DPLogHandle_CKRecordError()
{
  if (DPLogHandle_CKRecordError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecordError_onceToken, &__block_literal_global_12);
  return (id)DPLogHandle_CKRecordError_handle;
}

id DPLogHandle_CKRecord()
{
  if (DPLogHandle_CKRecord_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecord_onceToken, &__block_literal_global_14);
  return (id)DPLogHandle_CKRecord_handle;
}

id DPLogHandle_CKRecordUpload()
{
  if (DPLogHandle_CKRecordUpload_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecordUpload_onceToken, &__block_literal_global_16);
  return (id)DPLogHandle_CKRecordUpload_handle;
}

id DPLogHandle_CKInverness()
{
  if (DPLogHandle_CKInverness_onceToken != -1)
    dispatch_once(&DPLogHandle_CKInverness_onceToken, &__block_literal_global_18);
  return (id)DPLogHandle_CKInverness_handle;
}

id DPLogHandle_CKInvernessError()
{
  if (DPLogHandle_CKInvernessError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKInvernessError_onceToken, &__block_literal_global_20);
  return (id)DPLogHandle_CKInvernessError_handle;
}

id DPLogHandle_CKCFUpload()
{
  if (DPLogHandle_CKCFUpload_onceToken != -1)
    dispatch_once(&DPLogHandle_CKCFUpload_onceToken, &__block_literal_global_22_0);
  return (id)DPLogHandle_CKCFUpload_handle;
}

id DPLogHandle_CKCFUploadError()
{
  if (DPLogHandle_CKCFUploadError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKCFUploadError_onceToken, &__block_literal_global_24);
  return (id)DPLogHandle_CKCFUploadError_handle;
}

id DPLogHandle_ServiceXPCError()
{
  if (DPLogHandle_ServiceXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceXPCError_onceToken, &__block_literal_global_26);
  return (id)DPLogHandle_ServiceXPCError_handle;
}

id DPLogHandle_ServiceXPC()
{
  if (DPLogHandle_ServiceXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceXPC_onceToken, &__block_literal_global_28);
  return (id)DPLogHandle_ServiceXPC_handle;
}

id DPLogHandle_ServiceLifecycle()
{
  if (DPLogHandle_ServiceLifecycle_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceLifecycle_onceToken, &__block_literal_global_30);
  return (id)DPLogHandle_ServiceLifecycle_handle;
}

id DPLogHandle_ServiceLifecycleError()
{
  if (DPLogHandle_ServiceLifecycleError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceLifecycleError_onceToken, &__block_literal_global_32);
  return (id)DPLogHandle_ServiceLifecycleError_handle;
}

id DPLogHandle_PermissiveUploadActivity()
{
  if (DPLogHandle_PermissiveUploadActivity_onceToken != -1)
    dispatch_once(&DPLogHandle_PermissiveUploadActivity_onceToken, &__block_literal_global_34_0);
  return (id)DPLogHandle_PermissiveUploadActivity_handle;
}

id DPLogHandle_LogManagement()
{
  if (DPLogHandle_LogManagement_onceToken != -1)
    dispatch_once(&DPLogHandle_LogManagement_onceToken, &__block_literal_global_36);
  return (id)DPLogHandle_LogManagement_handle;
}

id DPLogHandle_LogManagementError()
{
  if (DPLogHandle_LogManagementError_onceToken != -1)
    dispatch_once(&DPLogHandle_LogManagementError_onceToken, &__block_literal_global_38);
  return (id)DPLogHandle_LogManagementError_handle;
}

id DPLogHandle_DAReporting()
{
  if (DPLogHandle_DAReporting_onceToken != -1)
    dispatch_once(&DPLogHandle_DAReporting_onceToken, &__block_literal_global_40);
  return (id)DPLogHandle_DAReporting_handle;
}

id DPLogHandle_DAReportingError()
{
  if (DPLogHandle_DAReportingError_onceToken != -1)
    dispatch_once(&DPLogHandle_DAReportingError_onceToken, &__block_literal_global_42_0);
  return (id)DPLogHandle_DAReportingError_handle;
}

id DPLogHandle_RequestError()
{
  if (DPLogHandle_RequestError_onceToken != -1)
    dispatch_once(&DPLogHandle_RequestError_onceToken, &__block_literal_global_44);
  return (id)DPLogHandle_RequestError_handle;
}

id DPLogHandle_Request()
{
  if (DPLogHandle_Request_onceToken != -1)
    dispatch_once(&DPLogHandle_Request_onceToken, &__block_literal_global_46);
  return (id)DPLogHandle_Request_handle;
}

id DPLogHandle_TailspinError()
{
  if (DPLogHandle_TailspinError_onceToken != -1)
    dispatch_once(&DPLogHandle_TailspinError_onceToken, &__block_literal_global_48);
  return (id)DPLogHandle_TailspinError_handle;
}

id DPLogHandle_Tailspin()
{
  if (DPLogHandle_Tailspin_onceToken != -1)
    dispatch_once(&DPLogHandle_Tailspin_onceToken, &__block_literal_global_50_0);
  return (id)DPLogHandle_Tailspin_handle;
}

id DPLogHandle_SubmitLogError()
{
  if (DPLogHandle_SubmitLogError_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogError_onceToken, &__block_literal_global_52);
  return (id)DPLogHandle_SubmitLogError_handle;
}

id DPLogHandle_SubmitLog()
{
  if (DPLogHandle_SubmitLog_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLog_onceToken, &__block_literal_global_54);
  return (id)DPLogHandle_SubmitLog_handle;
}

id DPLogHandle_SubmitLogToCKContainerError()
{
  if (DPLogHandle_SubmitLogToCKContainerError_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogToCKContainerError_onceToken, &__block_literal_global_56_0);
  return (id)DPLogHandle_SubmitLogToCKContainerError_handle;
}

id DPLogHandle_SubmitLogToCKContainer()
{
  if (DPLogHandle_SubmitLogToCKContainer_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogToCKContainer_onceToken, &__block_literal_global_58);
  return (id)DPLogHandle_SubmitLogToCKContainer_handle;
}

id DPLogHandle_EnableDataGatheringQueryError()
{
  if (DPLogHandle_EnableDataGatheringQueryError_onceToken != -1)
    dispatch_once(&DPLogHandle_EnableDataGatheringQueryError_onceToken, &__block_literal_global_60);
  return (id)DPLogHandle_EnableDataGatheringQueryError_handle;
}

id DPLogHandle_EnableDataGatheringQuery()
{
  if (DPLogHandle_EnableDataGatheringQuery_onceToken != -1)
    dispatch_once(&DPLogHandle_EnableDataGatheringQuery_onceToken, &__block_literal_global_62);
  return (id)DPLogHandle_EnableDataGatheringQuery_handle;
}

id DPLogHandle_CoreDataError()
{
  if (DPLogHandle_CoreDataError_onceToken != -1)
    dispatch_once(&DPLogHandle_CoreDataError_onceToken, &__block_literal_global_64);
  return (id)DPLogHandle_CoreDataError_handle;
}

id DPLogHandle_CoreData()
{
  if (DPLogHandle_CoreData_onceToken != -1)
    dispatch_once(&DPLogHandle_CoreData_onceToken, &__block_literal_global_66);
  return (id)DPLogHandle_CoreData_handle;
}

id DPLogHandle_SystemProfileError()
{
  if (DPLogHandle_SystemProfileError_onceToken != -1)
    dispatch_once(&DPLogHandle_SystemProfileError_onceToken, &__block_literal_global_68);
  return (id)DPLogHandle_SystemProfileError_handle;
}

id DPLogHandle_SystemProfile()
{
  if (DPLogHandle_SystemProfile_onceToken != -1)
    dispatch_once(&DPLogHandle_SystemProfile_onceToken, &__block_literal_global_70);
  return (id)DPLogHandle_SystemProfile_handle;
}

id DPLogHandle_DampeningManager()
{
  if (DPLogHandle_DampeningManager_onceToken != -1)
    dispatch_once(&DPLogHandle_DampeningManager_onceToken, &__block_literal_global_72);
  return (id)DPLogHandle_DampeningManager_handle;
}

id DPLogHandle_DampeningManagerError()
{
  if (DPLogHandle_DampeningManagerError_onceToken != -1)
    dispatch_once(&DPLogHandle_DampeningManagerError_onceToken, &__block_literal_global_74);
  return (id)DPLogHandle_DampeningManagerError_handle;
}

id DPLogHandle_TaskingMessage()
{
  if (DPLogHandle_TaskingMessage_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessage_onceToken, &__block_literal_global_76);
  return (id)DPLogHandle_TaskingMessage_handle;
}

id DPLogHandle_TaskingMessageError()
{
  if (DPLogHandle_TaskingMessageError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageError_onceToken, &__block_literal_global_78);
  return (id)DPLogHandle_TaskingMessageError_handle;
}

id DPLogHandle_TaskingDecisionMaker()
{
  if (DPLogHandle_TaskingDecisionMaker_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDecisionMaker_onceToken, &__block_literal_global_80);
  return (id)DPLogHandle_TaskingDecisionMaker_handle;
}

id DPLogHandle_TaskingDecisionMakerError()
{
  if (DPLogHandle_TaskingDecisionMakerError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDecisionMakerError_onceToken, &__block_literal_global_82);
  return (id)DPLogHandle_TaskingDecisionMakerError_handle;
}

id DPLogHandle_ConfigPersistedStore()
{
  if (DPLogHandle_ConfigPersistedStore_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigPersistedStore_onceToken, &__block_literal_global_84);
  return (id)DPLogHandle_ConfigPersistedStore_handle;
}

id DPLogHandle_ConfigPersistedStoreError()
{
  if (DPLogHandle_ConfigPersistedStoreError_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigPersistedStoreError_onceToken, &__block_literal_global_86);
  return (id)DPLogHandle_ConfigPersistedStoreError_handle;
}

id DPLogHandle_TaskingManager()
{
  if (DPLogHandle_TaskingManager_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingManager_onceToken, &__block_literal_global_88_0);
  return (id)DPLogHandle_TaskingManager_handle;
}

id DPLogHandle_TaskingManagerError()
{
  if (DPLogHandle_TaskingManagerError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingManagerError_onceToken, &__block_literal_global_90);
  return (id)DPLogHandle_TaskingManagerError_handle;
}

id DPLogHandle_TaskingMessageChannel()
{
  if (DPLogHandle_TaskingMessageChannel_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageChannel_onceToken, &__block_literal_global_92);
  return (id)DPLogHandle_TaskingMessageChannel_handle;
}

id DPLogHandle_TaskingMessageChannelError()
{
  if (DPLogHandle_TaskingMessageChannelError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageChannelError_onceToken, &__block_literal_global_94);
  return (id)DPLogHandle_TaskingMessageChannelError_handle;
}

id DPLogHandle_ClientTaskingXPC()
{
  if (DPLogHandle_ClientTaskingXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientTaskingXPC_onceToken, &__block_literal_global_96);
  return (id)DPLogHandle_ClientTaskingXPC_handle;
}

id DPLogHandle_ClientTaskingXPCError()
{
  if (DPLogHandle_ClientTaskingXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientTaskingXPCError_onceToken, &__block_literal_global_98);
  return (id)DPLogHandle_ClientTaskingXPCError_handle;
}

id DPLogHandle_ConfigMonitor()
{
  if (DPLogHandle_ConfigMonitor_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigMonitor_onceToken, &__block_literal_global_100);
  return (id)DPLogHandle_ConfigMonitor_handle;
}

id DPLogHandle_ConfigMonitorError()
{
  if (DPLogHandle_ConfigMonitorError_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigMonitorError_onceToken, &__block_literal_global_102);
  return (id)DPLogHandle_ConfigMonitorError_handle;
}

id DPLogHandle_ServiceTasking()
{
  if (DPLogHandle_ServiceTasking_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTasking_onceToken, &__block_literal_global_104);
  return (id)DPLogHandle_ServiceTasking_handle;
}

id DPLogHandle_ServiceTaskingError()
{
  if (DPLogHandle_ServiceTaskingError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingError_onceToken, &__block_literal_global_106);
  return (id)DPLogHandle_ServiceTaskingError_handle;
}

id DPLogHandle_ServiceTaskingXPC()
{
  if (DPLogHandle_ServiceTaskingXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingXPC_onceToken, &__block_literal_global_108);
  return (id)DPLogHandle_ServiceTaskingXPC_handle;
}

id DPLogHandle_ServiceTaskingXPCError()
{
  if (DPLogHandle_ServiceTaskingXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingXPCError_onceToken, &__block_literal_global_110);
  return (id)DPLogHandle_ServiceTaskingXPCError_handle;
}

id DPLogHandle_ServiceEventPublisher()
{
  if (DPLogHandle_ServiceEventPublisher_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceEventPublisher_onceToken, &__block_literal_global_112_0);
  return (id)DPLogHandle_ServiceEventPublisher_handle;
}

id DPLogHandle_ServiceEventPublisherError()
{
  if (DPLogHandle_ServiceEventPublisherError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceEventPublisherError_onceToken, &__block_literal_global_114);
  return (id)DPLogHandle_ServiceEventPublisherError_handle;
}

id DPLogHandle_Telemetry()
{
  if (DPLogHandle_Telemetry_onceToken != -1)
    dispatch_once(&DPLogHandle_Telemetry_onceToken, &__block_literal_global_116);
  return (id)DPLogHandle_Telemetry_handle;
}

id DPLogHandle_TaskingDSTelemetry()
{
  if (DPLogHandle_TaskingDSTelemetry_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDSTelemetry_onceToken, &__block_literal_global_118);
  return (id)DPLogHandle_TaskingDSTelemetry_handle;
}

id DPLogHandle_CKConfig()
{
  if (DPLogHandle_CKConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_CKConfig_onceToken, &__block_literal_global_120);
  return (id)DPLogHandle_CKConfig_handle;
}

id DPLogHandle_CKConfigError()
{
  if (DPLogHandle_CKConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKConfigError_onceToken, &__block_literal_global_122);
  return (id)DPLogHandle_CKConfigError_handle;
}

id DPLogHandle_UploadSessionDate()
{
  if (DPLogHandle_UploadSessionDate_onceToken != -1)
    dispatch_once(&DPLogHandle_UploadSessionDate_onceToken, &__block_literal_global_124);
  return (id)DPLogHandle_UploadSessionDate_handle;
}

id DPLogHandle_UploadSessionDateError()
{
  if (DPLogHandle_UploadSessionDateError_onceToken != -1)
    dispatch_once(&DPLogHandle_UploadSessionDateError_onceToken, &__block_literal_global_126);
  return (id)DPLogHandle_UploadSessionDateError_handle;
}

id DPLogHandle_DPConfig()
{
  if (DPLogHandle_DPConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_DPConfig_onceToken, &__block_literal_global_128);
  return (id)DPLogHandle_DPConfig_handle;
}

id DPLogHandle_DPConfigError()
{
  if (DPLogHandle_DPConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_DPConfigError_onceToken, &__block_literal_global_130);
  return (id)DPLogHandle_DPConfigError_handle;
}

id DPLogHandle_DRSConfig()
{
  if (DPLogHandle_DRSConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_DRSConfig_onceToken, &__block_literal_global_132);
  return (id)DPLogHandle_DRSConfig_handle;
}

id DPLogHandle_DRSConfigError()
{
  if (DPLogHandle_DRSConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_DRSConfigError_onceToken, &__block_literal_global_134);
  return (id)DPLogHandle_DRSConfigError_handle;
}

const __CFString *DRConfigCompletionTypeString(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 4096)
  {
    switch(a1)
    {
      case 8193:
        result = CFSTR("Invalidated");
        break;
      case 8194:
        result = CFSTR("Expired");
        break;
      case 8195:
        result = CFSTR("ExternallyCancelled");
        break;
      case 8196:
        result = CFSTR("ClientCompleted");
        break;
      default:
        if (a1 != 4097)
          return CFSTR("UnknownCompletionType");
        result = CFSTR("NotComplete");
        break;
    }
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      return CFSTR("Rejected");
    }
    else if (a1 == 2)
    {
      return CFSTR("TaskingDisabled");
    }
    else
    {
      return CFSTR("UnknownCompletionType");
    }
  }
  else
  {
    return CFSTR("Invalid");
  }
  return result;
}

void sub_1DBBD85C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

id _base64EncodedMD5Digest(uint64_t a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  void *v4;
  void *v5;
  unsigned __int8 v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = objc_retainAutorelease((id)MEMORY[0x1E0C80A78]());
  v2 = (const void *)objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 4);

  CC_MD5(v2, v3, v7);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1DBBD9FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDA3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDA928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDAFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDB848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDBD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDBFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDC8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDCB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoTaskingDeviceMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoClientDeviceMetadata *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(DRSProtoClientDeviceMetadata **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _oneIsNil(uint64_t a1, uint64_t a2)
{
  return (a1 != 0) ^ (a2 != 0);
}

BOOL DRSProtoTaskingConfigReceiptReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  DRSProtoTaskingConfigMetadata *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !DRSProtoTaskingConfigMetadataReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(DRSProtoTaskingConfigMetadata **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBBDF198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBDFEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBE06D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _checkCancelNonNil(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    DPLogHandle_TaskingMessageError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      v6 = 136446210;
      v7 = a2;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSCancelTaskingMessageFailedInit", "nil '%{public}s' when trying to instantiate 'DRCancelTaskingMessage'", (uint8_t *)&v6, 0xCu);
    }

  }
  return a1 != 0;
}

void sub_1DBBE1378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DRSTaskingSystemMessageFromJSONData(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a1, 0, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  if (v1)
  {
    DRSTaskingSystemMessageFromJSONDict(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DPLogHandle_TaskingManagerError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      objc_msgSend(v2, "localizedDescription");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = CFSTR("Unknown");
      if (v5)
        v7 = (const __CFString *)v5;
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONData", "Could not process JSON data due to error %{public}@", buf, 0xCu);

    }
    v3 = 0;
  }

  return v3;
}

id DRSTaskingSystemMessageFromJSONDict(void *a1)
{
  id v1;
  __objc2_class *v2;
  void *v3;
  NSObject *v5;
  uint8_t v6[16];

  v1 = a1;
  if (+[DRSTaskingSystemMessage isJSONDictForClass:](DRSTaskingMessage, "isJSONDictForClass:", v1))
  {
    v2 = DRSTaskingMessage;
LABEL_7:
    v3 = (void *)objc_msgSend([v2 alloc], "initWithJSONDict:", v1);
    goto LABEL_8;
  }
  if (+[DRSTaskingSystemMessage isJSONDictForClass:](DRSCancelTaskingMessage, "isJSONDictForClass:", v1))
  {
    v2 = DRSCancelTaskingMessage;
    goto LABEL_7;
  }
  if (+[DRSTaskingSystemMessage isJSONDictForClass:](DRSPopulationPingMessage, "isJSONDictForClass:", v1))
  {
    v2 = DRSPopulationPingMessage;
    goto LABEL_7;
  }
  DPLogHandle_TaskingMessageError();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONDict", "Unknown JSON message", v6, 2u);
  }

  v3 = 0;
LABEL_8:

  return v3;
}

NSObject *_dateFromJSONDict(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v2, "doubleValue");
      objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v5 = v4;
        v6 = v5;
      }
      else
      {
        DPLogHandle_TaskingMessageError();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v7))
          _os_signpost_emit_unreliably_with_name_impl();

        v6 = 0;
      }
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
        _os_signpost_emit_unreliably_with_name_impl();
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1DBBE24CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBE37DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

id _dampeningManagerError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("DRSDampeningManagerError"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1DBBE490C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBE68EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBBE8A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1DBBE924C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBE95C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBEA178(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DBBEA4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__allocating_init(request:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A330);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_allocWithZone(v1);
  sub_1DBBEC474(a1, (uint64_t)v4, &qword_1F030A330);
  v6 = sub_1DBBF7F58();
  sub_1DBBEC4B8(a1, &qword_1F030A330);
  return v6;
}

uint64_t RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.init(request:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A330);
  MEMORY[0x1E0C80A78]();
  sub_1DBBEC474(a1, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1F030A330);
  v3 = sub_1DBBF7F58();
  sub_1DBBEC4B8(a1, &qword_1F030A330);
  return v3;
}

void RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__allocating_init(functionName:request:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.init(functionName:request:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t RapidCloudFunctionServiceAPIAsync.submitRapidPayload(deviceMetadata:payloadMetadata:payloadDescription:uploadAttempts:payload:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;

  v22 = a8;
  v21 = a7;
  v16 = type metadata accessor for RapidPayload(0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  v24 = a2;
  v25 = a3;
  v26 = a4;
  v27 = BYTE4(a4) & 1;
  v28 = a5;
  v29 = a6;
  sub_1DBBEC180();
  sub_1DBBF8018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a10 + 8))(v18, v21, v22, a9, a10);
  return sub_1DBBEC5C0((uint64_t)v18, type metadata accessor for RapidPayload);
}

uint64_t sub_1DBBEBD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
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
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  unint64_t v51;

  v50 = a5;
  v51 = a7;
  v42 = a6;
  v43 = a2;
  v48 = a4;
  v44 = a1;
  v45 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v49 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FileDescription(0);
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v41 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v40 = (uint64_t)&v38 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for RequestDescription(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v39 = (uint64_t)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v38 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for ClientDeviceMetadata(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v38 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v38 - v29;
  sub_1DBBEC474(v43, (uint64_t)v23, &qword_1F030A390);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_1DBBEC4B8((uint64_t)v23, &qword_1F030A390);
  }
  else
  {
    sub_1DBBEC538((uint64_t)v23, (uint64_t)v30, type metadata accessor for ClientDeviceMetadata);
    sub_1DBBEC57C((uint64_t)v30, (uint64_t)v28, type metadata accessor for ClientDeviceMetadata);
    RapidPayload.deviceMetadata.setter((uint64_t)v28);
    sub_1DBBEC5C0((uint64_t)v30, type metadata accessor for ClientDeviceMetadata);
  }
  sub_1DBBEC474(v45, (uint64_t)v14, &qword_1F030A388);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_1DBBEC4B8((uint64_t)v14, &qword_1F030A388);
  }
  else
  {
    sub_1DBBEC538((uint64_t)v14, (uint64_t)v20, type metadata accessor for RequestDescription);
    v31 = v39;
    sub_1DBBEC57C((uint64_t)v20, v39, type metadata accessor for RequestDescription);
    RapidPayload.payloadMetadata.setter(v31);
    sub_1DBBEC5C0((uint64_t)v20, type metadata accessor for RequestDescription);
  }
  v32 = v49;
  sub_1DBBEC474(v48, v49, &qword_1F030A380);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v32, 1, v47) != 1)
  {
    v35 = v40;
    sub_1DBBEC538(v32, v40, type metadata accessor for FileDescription);
    v36 = v41;
    sub_1DBBEC57C(v35, v41, type metadata accessor for FileDescription);
    RapidPayload.payloadDescription.setter(v36);
    sub_1DBBEC5C0(v35, type metadata accessor for FileDescription);
    result = v50;
    v34 = v51;
    if ((v50 & 0x100000000) != 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  sub_1DBBEC4B8(v32, &qword_1F030A380);
  result = v50;
  v34 = v51;
  if ((v50 & 0x100000000) == 0)
LABEL_11:
    result = RapidPayload.uploadAttempts.setter(result);
LABEL_12:
  if (v34 >> 60 != 15)
  {
    v37 = v42;
    sub_1DBBEC4F4(v42, v34);
    return RapidPayload.payload.setter(v37, v34);
  }
  return result;
}

uint64_t sub_1DBBEC13C(uint64_t a1)
{
  uint64_t v1;

  return sub_1DBBEBD68(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned int *)(v1 + 40) | ((unint64_t)*(unsigned __int8 *)(v1 + 44) << 32), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

unint64_t sub_1DBBEC180()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F030A338;
  if (!qword_1F030A338)
  {
    v1 = type metadata accessor for RapidPayload(255);
    result = MEMORY[0x1DF0B716C](&protocol conformance descriptor for RapidPayload, v1);
    atomic_store(result, (unint64_t *)&qword_1F030A338);
  }
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.__allocating_init(codeService:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.init(codeService:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

void RapidCloudFunctionServiceAPIAsyncClient.submitRapidPayload(_:completion:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A330);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v12 - v6;
  sub_1DBBEC57C(a1, (uint64_t)&v12 - v6, type metadata accessor for RapidPayload);
  v8 = type metadata accessor for RapidPayload(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  v9 = objc_allocWithZone((Class)type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation());
  sub_1DBBEC474((uint64_t)v7, (uint64_t)v5, &qword_1F030A330);
  v10 = (void *)sub_1DBBF7F58();
  sub_1DBBEC4B8((uint64_t)v7, &qword_1F030A330);
  v11 = v10;
  swift_retain();
  sub_1DBBF7F4C();

  sub_1DBBF80CC();
}

uint64_t type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation()
{
  uint64_t result;

  result = qword_1F030AB10;
  if (!qword_1F030AB10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1DBBEC3D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 96))();
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceAPI()
{
  return &type metadata for RapidCloudFunctionServiceAPI;
}

uint64_t sub_1DBBEC410()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DBBEC44C()
{
  return type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation();
}

uint64_t type metadata accessor for RapidCloudFunctionServiceAPIAsyncClient()
{
  return objc_opt_self();
}

uint64_t sub_1DBBEC474(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DBBEC4B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DBBEC4F4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DBBEC538(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DBBEC57C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DBBEC5C0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.Environment.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  return result;
}

BOOL sub_1DBBEC614(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DBBEC628()
{
  sub_1DBBF80FC();
  sub_1DBBF8108();
  return sub_1DBBF8114();
}

uint64_t sub_1DBBEC66C()
{
  return sub_1DBBF8108();
}

uint64_t sub_1DBBEC694()
{
  sub_1DBBF80FC();
  sub_1DBBF8108();
  return sub_1DBBF8114();
}

uint64_t *sub_1DBBEC6D4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

void sub_1DBBEC6F4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.environment.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment);
}

id DiagnosticPipelineRapidServiceFunctionsClient.__allocating_init(environment:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(a1);
}

id DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(uint64_t a1)
{
  char *v1;
  char v2;
  char *v3;
  uint64_t v4;
  id result;
  char *v6;
  objc_super v7;

  *(_QWORD *)&v1[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment] = a1;
  v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) >= 3)
  {
    v6 = v1;
    result = (id)sub_1DBBF80F0();
    __break(1u);
  }
  else
  {
    v3 = v1;
    *(_QWORD *)&v3[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_client] = sub_1DBBED830(1, v2);
    *(_QWORD *)&v3[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_container] = v4;

    v7.receiver = v3;
    v7.super_class = (Class)type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient();
    return objc_msgSendSuper2(&v7, sel_init);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient()
{
  return objc_opt_self();
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.submitRapidPayload(buildVariant:deviceCategory:deviceModel:platform:teamID:issueCategory:contextDictionaryData:requestTime:build:logType:logSize:fileName:uploadAttempts:payload:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, uint64_t a13, __int128 a14, __int128 a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, void (*)(uint64_t), uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v45 = a7;
  v46 = a8;
  v43 = a5;
  v44 = a6;
  v41 = a3;
  v42 = a4;
  v40 = a2;
  v60 = a21;
  v59 = a20;
  v57 = a19;
  v56 = a18;
  v55 = a17;
  v54 = a16;
  v53 = a15;
  v52 = a14;
  v51 = a13;
  v50 = a12;
  v49 = a11;
  v48 = a10;
  v47 = a9;
  v22 = type metadata accessor for RapidPayload(0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for FileDescription(0);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for RequestDescription(0);
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v39 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for ClientDeviceMetadata(0);
  MEMORY[0x1E0C80A78](v31);
  v33 = (char *)&v39 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = a1;
  v76 = v40;
  v77 = v41;
  v78 = v42;
  v79 = v43;
  v80 = v44;
  v81 = v45;
  v82 = v46;
  sub_1DBBECF70(&qword_1F030A3B0, v34, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
  sub_1DBBF8018();
  v70 = v47;
  v71 = v48;
  v72 = v49;
  v73 = v50;
  v74 = v51;
  sub_1DBBECF70(&qword_1F030A3B8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
  sub_1DBBF8018();
  v67 = v52;
  v68 = v53;
  v69 = v54;
  sub_1DBBECF70(&qword_1F030A3C0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
  sub_1DBBF8018();
  v61 = v33;
  v62 = v30;
  v63 = v27;
  v64 = v55;
  v65 = v56;
  v66 = v57;
  sub_1DBBECF70((unint64_t *)&qword_1F030A338, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
  sub_1DBBF8018();
  v35 = *(_QWORD *)(v58 + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_client);
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = v59;
  *(_QWORD *)(v36 + 24) = v60;
  v37 = *(void (**)(char *, void (*)(uint64_t), uint64_t))(*(_QWORD *)v35 + 96);
  swift_retain();
  v37(v24, sub_1DBBED15C, v36);
  swift_release();
  sub_1DBBEC5C0((uint64_t)v24, type metadata accessor for RapidPayload);
  sub_1DBBEC5C0((uint64_t)v27, type metadata accessor for FileDescription);
  sub_1DBBEC5C0((uint64_t)v30, type metadata accessor for RequestDescription);
  return sub_1DBBEC5C0((uint64_t)v33, type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_1DBBECBEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  v6 = v0[7];
  v8 = v0[8];
  v7 = v0[9];
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.buildVariant.setter(v1, v2);
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.deviceCategory.setter(v3, v4);
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.deviceModel.setter(v5, v6);
  swift_bridgeObjectRetain();
  return ClientDeviceMetadata.platform.setter(v8, v7);
}

uint64_t sub_1DBBECC94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[2];
  v2 = v0[3];
  v4 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v6 = v0[7];
  v8 = v0[8];
  v7 = v0[9];
  v9 = v0[10];
  swift_bridgeObjectRetain();
  RequestDescription.teamID.setter(v1, v2);
  swift_bridgeObjectRetain();
  RequestDescription.issueCategory.setter(v4, v3);
  if (v6 >> 60 != 15)
  {
    sub_1DBBEC4F4(v5, v6);
    RequestDescription.contextDictionaryData.setter(v5, v6);
  }
  RequestDescription.requestTime.setter(v8);
  swift_bridgeObjectRetain();
  return RequestDescription.build.setter(v7, v9);
}

uint64_t sub_1DBBECD58()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  swift_bridgeObjectRetain();
  FileDescription.logType.setter(v1, v2);
  FileDescription.logSize.setter(v3);
  swift_bridgeObjectRetain();
  return FileDescription.fileName.setter(v4, v5);
}

uint64_t sub_1DBBECDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(_QWORD);
  uint64_t v24;

  v13 = type metadata accessor for FileDescription(0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for RequestDescription(0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for ClientDeviceMetadata(0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBBEC57C(a2, (uint64_t)v21, v22);
  RapidPayload.deviceMetadata.setter((uint64_t)v21);
  sub_1DBBEC57C(a3, (uint64_t)v18, type metadata accessor for RequestDescription);
  RapidPayload.payloadMetadata.setter((uint64_t)v18);
  sub_1DBBEC57C(a4, (uint64_t)v15, type metadata accessor for FileDescription);
  RapidPayload.payloadDescription.setter((uint64_t)v15);
  RapidPayload.uploadAttempts.setter(a5);
  sub_1DBBEC4F4(a6, a7);
  return RapidPayload.payload.setter(a6, a7);
}

uint64_t sub_1DBBECF3C(uint64_t a1)
{
  uint64_t v1;

  return sub_1DBBECDD4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_DWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1DBBECF70(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0B716C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1DBBECFB0(uint64_t a1, void (*a2)(uint64_t, unint64_t, uint64_t, uint64_t, id))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = type metadata accessor for RapidPayloadReply(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A3D0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (id *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DBBED67C(a1, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = *v9;
    v11 = *v9;
    a2(0, 0xF000000000000000, 0, 0, v10);

  }
  else
  {
    sub_1DBBED6C4((uint64_t)v9, (uint64_t)v6);
    v12 = RapidPayloadReply.replyPayload.getter();
    v14 = v13;
    if (RapidPayloadReply.hasFailureReason.getter())
    {
      v15 = RapidPayloadReply.failureReason.getter();
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    a2(v12, v14, v15, v17, 0);
    swift_bridgeObjectRelease();
    sub_1DBBED624(v12, v14);
    sub_1DBBEC5C0((uint64_t)v6, type metadata accessor for RapidPayloadReply);
  }
}

uint64_t sub_1DBBED138()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DBBED15C(uint64_t a1)
{
  uint64_t v1;

  sub_1DBBECFB0(a1, *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, id))(v1 + 16));
}

void sub_1DBBED410(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v8 = a4;
  if (a2 >> 60 != 15)
  {
    v9 = (void *)sub_1DBBF7F34();
    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = 0;
  if (a4)
LABEL_5:
    v8 = (void *)sub_1DBBF80A8();
LABEL_6:
  if (a5)
    v10 = sub_1DBBF7F04();
  else
    v10 = 0;
  v11 = (id)v10;
  (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v9, v8);

}

id DiagnosticPipelineRapidServiceFunctionsClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DiagnosticPipelineRapidServiceFunctionsClient.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DiagnosticPipelineRapidServiceFunctionsClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DBBED5A4()
{
  unint64_t result;

  result = qword_1F030A3C8;
  if (!qword_1F030A3C8)
  {
    result = MEMORY[0x1DF0B716C](&protocol conformance descriptor for DiagnosticPipelineRapidServiceFunctionsClient.Environment, &type metadata for DiagnosticPipelineRapidServiceFunctionsClient.Environment);
    atomic_store(result, (unint64_t *)&qword_1F030A3C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient.Environment()
{
  return &type metadata for DiagnosticPipelineRapidServiceFunctionsClient.Environment;
}

uint64_t sub_1DBBED5F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DBBED61C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;

  sub_1DBBED410(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16));
}

uint64_t sub_1DBBED624(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DBBED668(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DBBED624(a1, a2);
  return a1;
}

uint64_t sub_1DBBED67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBBED6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RapidPayloadReply(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional __swiftcall RapidCloudFunctionServiceConnection.Environment.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 4)
    return (DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional)3;
  else
    return (DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional)(0x2010003u >> (8 * rawValue));
}

uint64_t RapidCloudFunctionServiceConnection.Environment.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_1DBBED734(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DBBED748()
{
  sub_1DBBF80FC();
  sub_1DBBF8108();
  return sub_1DBBF8114();
}

uint64_t sub_1DBBED78C()
{
  return sub_1DBBF8108();
}

uint64_t sub_1DBBED7B8()
{
  sub_1DBBF80FC();
  sub_1DBBF8108();
  return sub_1DBBF8114();
}

_QWORD *sub_1DBBED7F8@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;

  if (*result >= 4uLL)
    v2 = 3;
  else
    v2 = 0x2010003u >> (8 * *result);
  *a2 = v2;
  return result;
}

void sub_1DBBED820(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t sub_1DBBED830(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF7AB0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 == 1)
    v7 = 1;
  else
    v7 = 2;
  v21[0] = 0xD000000000000019;
  v21[1] = 0x80000001DBC03FC0;
  sub_1DBBF80C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1DBBF80C0();
  swift_bridgeObjectRelease();
  v8 = objc_allocWithZone(MEMORY[0x1E0C94C40]);
  v9 = (void *)sub_1DBBF80A8();
  v10 = objc_msgSend(v8, sel_initWithContainerIdentifier_environment_, v9, v7);

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C94C28]), sel_initWithContainerID_, v10);
  v12 = (void *)sub_1DBBF80A8();
  v13 = objc_msgSend(v11, sel_codeServiceWithName_databaseScope_, v12, a1);

  if (a2 != 2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v14 = (void *)sub_1DBBF80A8();
  swift_bridgeObjectRelease();
  sub_1DBBF7F1C();
  v15 = sub_1DBBF7F28();
  v16 = *(_QWORD *)(v15 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v6, 1, v15);
  if ((_DWORD)result != 1)
  {
    v18 = (void *)sub_1DBBF7F10();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
    v19 = objc_msgSend(v11, sel_codeServiceWithName_serviceInstanceURL_, v14, v18);

    v13 = v19;
LABEL_8:
    type metadata accessor for RapidCloudFunctionServiceAPIAsyncClient();
    v20 = RapidCloudFunctionServiceAPIAsyncClient.__allocating_init(codeService:)((uint64_t)v13);

    return v20;
  }
  __break(1u);
  return result;
}

unint64_t sub_1DBBEDAD0()
{
  unint64_t result;

  result = qword_1F030A3D8;
  if (!qword_1F030A3D8)
  {
    result = MEMORY[0x1DF0B716C](&protocol conformance descriptor for RapidCloudFunctionServiceConnection.Environment, &type metadata for RapidCloudFunctionServiceConnection.Environment);
    atomic_store(result, (unint64_t *)&qword_1F030A3D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceConnection()
{
  return &type metadata for RapidCloudFunctionServiceConnection;
}

uint64_t getEnumTagSinglePayload for RapidCloudFunctionServiceConnection.Environment(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RapidCloudFunctionServiceConnection.Environment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBBEDC00 + 4 * byte_1DBBFD825[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DBBEDC34 + 4 * asc_1DBBFD820[v4]))();
}

uint64_t sub_1DBBEDC34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBBEDC3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBBEDC44);
  return result;
}

uint64_t sub_1DBBEDC50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBBEDC58);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DBBEDC5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBBEDC64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBBEDC70(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DBBEDC78(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceConnection.Environment()
{
  return &type metadata for RapidCloudFunctionServiceConnection.Environment;
}

uint64_t ClientDeviceMetadata.buildVariant.getter()
{
  return sub_1DBBEE07C(type metadata accessor for ClientDeviceMetadata);
}

uint64_t type metadata accessor for ClientDeviceMetadata(uint64_t a1)
{
  return sub_1DBBEFCC8(a1, (uint64_t *)&unk_1F030BD50);
}

uint64_t ClientDeviceMetadata.buildVariant.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE0F0(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.buildVariant.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL ClientDeviceMetadata.hasBuildVariant.getter()
{
  return sub_1DBBEE1A8(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearBuildVariant()()
{
  sub_1DBBEE1E4(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceCategory.getter()
{
  return sub_1DBBEE228(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceCategory.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE288(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.deviceCategory.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL ClientDeviceMetadata.hasDeviceCategory.getter()
{
  return sub_1DBBEE340(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearDeviceCategory()()
{
  sub_1DBBEE37C(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceModel.getter()
{
  return sub_1DBBEE974(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceModel.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE9D4(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.deviceModel.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL ClientDeviceMetadata.hasDeviceModel.getter()
{
  return sub_1DBBEEA8C(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearDeviceModel()()
{
  sub_1DBBEEAC8(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.platform.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ClientDeviceMetadata.platform.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ClientDeviceMetadata.platform.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL ClientDeviceMetadata.hasPlatform.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32) + 8) != 0;
}

Swift::Void __swiftcall ClientDeviceMetadata.clearPlatform()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t (*ClientDeviceMetadata.unknownFields.modify())()
{
  return nullsub_1;
}

int *ClientDeviceMetadata.init()@<X0>(uint64_t a1@<X8>)
{
  int *result;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  result = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v3 = (_QWORD *)(a1 + result[5]);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)(a1 + result[6]);
  *v4 = 0;
  v4[1] = 0;
  v5 = (_QWORD *)(a1 + result[7]);
  *v5 = 0;
  v5[1] = 0;
  v6 = (_QWORD *)(a1 + result[8]);
  *v6 = 0;
  v6[1] = 0;
  return result;
}

uint64_t variable initialization expression of ClientDeviceMetadata._buildVariant()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._deviceCategory()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._deviceModel()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._platform()
{
  return 0;
}

uint64_t RequestDescription.teamID.getter()
{
  return sub_1DBBEE07C(type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE07C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 20));
  if (v2[1])
    v3 = *v2;
  else
    v3 = 0;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t type metadata accessor for RequestDescription(uint64_t a1)
{
  return sub_1DBBEFCC8(a1, (uint64_t *)&unk_1F030BD60);
}

uint64_t RequestDescription.teamID.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE0F0(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE0F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3(0) + 20));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*RequestDescription.teamID.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RequestDescription(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL RequestDescription.hasTeamID.getter()
{
  return sub_1DBBEE1A8(type metadata accessor for RequestDescription);
}

BOOL sub_1DBBEE1A8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearTeamID()()
{
  sub_1DBBEE1E4(type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE1E4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(v1 + *(int *)(a1(0) + 20));
  result = swift_bridgeObjectRelease();
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t RequestDescription.issueCategory.getter()
{
  return sub_1DBBEE228(type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE228(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 24));
  if (v2[1])
    v3 = *v2;
  else
    v3 = 0;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t RequestDescription.issueCategory.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE288(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE288(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3(0) + 24));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*RequestDescription.issueCategory.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RequestDescription(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL RequestDescription.hasIssueCategory.getter()
{
  return sub_1DBBEE340(type metadata accessor for RequestDescription);
}

BOOL sub_1DBBEE340(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearIssueCategory()()
{
  sub_1DBBEE37C(type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE37C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(v1 + *(int *)(a1(0) + 24));
  result = swift_bridgeObjectRelease();
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t RequestDescription.contextDictionaryData.getter()
{
  return sub_1DBBEFEE0(type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBEE3C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DBBEC4F4(a1, a2);
  return a1;
}

uint64_t RequestDescription.contextDictionaryData.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEFF3C(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t (*RequestDescription.contextDictionaryData.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RequestDescription(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = *v4;
  v6 = v4[1];
  if (v6 >> 60 == 15)
    v7 = 0;
  else
    v7 = *v4;
  v8 = 0xC000000000000000;
  if (v6 >> 60 != 15)
    v8 = v6;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v8;
  sub_1DBBEE3C0(v5, v6);
  return sub_1DBBEE440;
}

BOOL RequestDescription.hasContextDictionaryData.getter()
{
  return sub_1DBBF0074(type metadata accessor for RequestDescription);
}

Swift::Void __swiftcall RequestDescription.clearContextDictionaryData()()
{
  sub_1DBBF00B4(type metadata accessor for RequestDescription);
}

uint64_t RequestDescription.requestTime.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t RequestDescription.requestTime.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for RequestDescription(0);
  v4 = v1 + *(int *)(result + 32);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*RequestDescription.requestTime.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for RequestDescription(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_1DBBEE514;
}

BOOL RequestDescription.hasRequestTime.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32) + 8) & 1) == 0;
}

Swift::Void __swiftcall RequestDescription.clearRequestTime()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

uint64_t RequestDescription.build.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t RequestDescription.build.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*RequestDescription.build.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RequestDescription(0) + 36);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL RequestDescription.hasBuild.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearBuild()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  swift_bridgeObjectRelease();
  *v1 = 0;
  v1[1] = 0;
}

uint64_t (*RequestDescription.unknownFields.modify())()
{
  return nullsub_1;
}

double RequestDescription.init()@<D0>(uint64_t a1@<X8>)
{
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  double result;
  uint64_t v6;
  _QWORD *v7;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = (int *)type metadata accessor for RequestDescription(0);
  v3 = (_QWORD *)(a1 + v2[5]);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)(a1 + v2[6]);
  *v4 = 0;
  v4[1] = 0;
  result = 0.0;
  *(_OWORD *)(a1 + v2[7]) = xmmword_1DBBFD930;
  v6 = a1 + v2[8];
  *(_QWORD *)v6 = 0;
  *(_BYTE *)(v6 + 8) = 1;
  v7 = (_QWORD *)(a1 + v2[9]);
  *v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t variable initialization expression of RequestDescription._teamID()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._issueCategory()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._contextDictionaryData()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._requestTime()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._build()
{
  return 0;
}

uint64_t FileDescription.logType.getter()
{
  return sub_1DBBEE07C(type metadata accessor for FileDescription);
}

uint64_t type metadata accessor for FileDescription(uint64_t a1)
{
  return sub_1DBBEFCC8(a1, (uint64_t *)&unk_1F030BD70);
}

uint64_t FileDescription.logType.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE0F0(a1, a2, type metadata accessor for FileDescription);
}

uint64_t (*FileDescription.logType.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for FileDescription(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL FileDescription.hasLogType.getter()
{
  return sub_1DBBEE1A8(type metadata accessor for FileDescription);
}

Swift::Void __swiftcall FileDescription.clearLogType()()
{
  sub_1DBBEE1E4(type metadata accessor for FileDescription);
}

uint64_t FileDescription.logSize.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for FileDescription(0) + 24));
  if (v1[8])
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t FileDescription.logSize.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for FileDescription(0);
  v4 = v1 + *(int *)(result + 24);
  *(_QWORD *)v4 = a1;
  *(_BYTE *)(v4 + 8) = 0;
  return result;
}

uint64_t (*FileDescription.logSize.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(type metadata accessor for FileDescription(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = (uint64_t *)(v1 + v3);
  if (*((_BYTE *)v4 + 8))
    v5 = 0;
  else
    v5 = *v4;
  *(_QWORD *)a1 = v5;
  return sub_1DBBEE514;
}

uint64_t sub_1DBBEE8F8(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8) + *(int *)(result + 16);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

BOOL FileDescription.hasLogSize.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for FileDescription(0) + 24) + 8) & 1) == 0;
}

Swift::Void __swiftcall FileDescription.clearLogSize()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for FileDescription(0) + 24);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
}

uint64_t FileDescription.fileName.getter()
{
  return sub_1DBBEE974(type metadata accessor for FileDescription);
}

uint64_t sub_1DBBEE974(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 28));
  if (v2[1])
    v3 = *v2;
  else
    v3 = 0;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t FileDescription.fileName.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE9D4(a1, a2, type metadata accessor for FileDescription);
}

uint64_t sub_1DBBEE9D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3(0) + 28));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*FileDescription.fileName.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for FileDescription(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

BOOL FileDescription.hasFileName.getter()
{
  return sub_1DBBEEA8C(type metadata accessor for FileDescription);
}

BOOL sub_1DBBEEA8C(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 28) + 8) != 0;
}

Swift::Void __swiftcall FileDescription.clearFileName()()
{
  sub_1DBBEEAC8(type metadata accessor for FileDescription);
}

uint64_t sub_1DBBEEAC8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(v1 + *(int *)(a1(0) + 28));
  result = swift_bridgeObjectRelease();
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t (*FileDescription.unknownFields.modify())()
{
  return nullsub_1;
}

int *FileDescription.init()@<X0>(uint64_t a1@<X8>)
{
  int *result;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  result = (int *)type metadata accessor for FileDescription(0);
  v3 = (_QWORD *)(a1 + result[5]);
  *v3 = 0;
  v3[1] = 0;
  v4 = a1 + result[6];
  *(_QWORD *)v4 = 0;
  *(_BYTE *)(v4 + 8) = 1;
  v5 = (_QWORD *)(a1 + result[7]);
  *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t variable initialization expression of FileDescription._logType()
{
  return 0;
}

uint64_t variable initialization expression of FileDescription._logSize()
{
  return 0;
}

uint64_t variable initialization expression of FileDescription._fileName()
{
  return 0;
}

uint64_t RapidPayload.deviceMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_1F030A390);
  v7 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_1DBBEC538((uint64_t)v5, a1, type metadata accessor for ClientDeviceMetadata);
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v8 = (_QWORD *)(a1 + v7[5]);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_QWORD *)(a1 + v7[6]);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_QWORD *)(a1 + v7[7]);
  *v10 = 0;
  v10[1] = 0;
  v11 = (_QWORD *)(a1 + v7[8]);
  *v11 = 0;
  v11[1] = 0;
  return sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A390);
}

uint64_t type metadata accessor for RapidPayload(uint64_t a1)
{
  return sub_1DBBEFCC8(a1, (uint64_t *)&unk_1F030BD80);
}

uint64_t RapidPayload.deviceMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 20);
  sub_1DBBEC4B8(v3, &qword_1F030A390);
  sub_1DBBEC538(a1, v3, type metadata accessor for ClientDeviceMetadata);
  v4 = type metadata accessor for ClientDeviceMetadata(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*RapidPayload.deviceMetadata.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v3[2] = v6;
  v7 = *((_QWORD *)v6 - 1);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for RapidPayload(0) + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_1DBBEC474(v1 + v10, (uint64_t)v5, &qword_1F030A390);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = &v9[v6[5]];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = &v9[v6[6]];
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    v13 = &v9[v6[7]];
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = 0;
    v14 = &v9[v6[8]];
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A390);
  }
  else
  {
    sub_1DBBEC538((uint64_t)v5, (uint64_t)v9, type metadata accessor for ClientDeviceMetadata);
  }
  return sub_1DBBEEE70;
}

void sub_1DBBEEE70(uint64_t a1, char a2)
{
  sub_1DBBEF67C(a1, a2, &qword_1F030A390, type metadata accessor for ClientDeviceMetadata);
}

BOOL RapidPayload.hasDeviceMetadata.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_1F030A390);
  v5 = type metadata accessor for ClientDeviceMetadata(0);
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_1DBBEC4B8((uint64_t)v3, &qword_1F030A390);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearDeviceMetadata()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 20);
  sub_1DBBEC4B8(v1, &qword_1F030A390);
  v2 = type metadata accessor for ClientDeviceMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t RapidPayload.payloadMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_1F030A388);
  v7 = (int *)type metadata accessor for RequestDescription(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_1DBBEC538((uint64_t)v5, a1, type metadata accessor for RequestDescription);
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v8 = (_QWORD *)(a1 + v7[5]);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_QWORD *)(a1 + v7[6]);
  *v9 = 0;
  v9[1] = 0;
  *(_OWORD *)(a1 + v7[7]) = xmmword_1DBBFD930;
  v10 = a1 + v7[8];
  *(_QWORD *)v10 = 0;
  *(_BYTE *)(v10 + 8) = 1;
  v11 = (_QWORD *)(a1 + v7[9]);
  *v11 = 0;
  v11[1] = 0;
  return sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A388);
}

uint64_t RapidPayload.payloadMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 24);
  sub_1DBBEC4B8(v3, &qword_1F030A388);
  sub_1DBBEC538(a1, v3, type metadata accessor for RequestDescription);
  v4 = type metadata accessor for RequestDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*RapidPayload.payloadMetadata.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = (int *)type metadata accessor for RequestDescription(0);
  v3[2] = v6;
  v7 = *((_QWORD *)v6 - 1);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for RapidPayload(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_1DBBEC474(v1 + v10, (uint64_t)v5, &qword_1F030A388);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = &v9[v6[5]];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = &v9[v6[6]];
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    *(_OWORD *)&v9[v6[7]] = xmmword_1DBBFD930;
    v13 = &v9[v6[8]];
    *(_QWORD *)v13 = 0;
    v13[8] = 1;
    v14 = &v9[v6[9]];
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A388);
  }
  else
  {
    sub_1DBBEC538((uint64_t)v5, (uint64_t)v9, type metadata accessor for RequestDescription);
  }
  return sub_1DBBEF288;
}

void sub_1DBBEF288(uint64_t a1, char a2)
{
  sub_1DBBEF67C(a1, a2, &qword_1F030A388, type metadata accessor for RequestDescription);
}

BOOL RapidPayload.hasPayloadMetadata.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_1F030A388);
  v5 = type metadata accessor for RequestDescription(0);
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_1DBBEC4B8((uint64_t)v3, &qword_1F030A388);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearPayloadMetadata()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 24);
  sub_1DBBEC4B8(v1, &qword_1F030A388);
  v2 = type metadata accessor for RequestDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t RapidPayload.payloadDescription.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_1F030A380);
  v7 = (int *)type metadata accessor for FileDescription(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_1DBBEC538((uint64_t)v5, a1, type metadata accessor for FileDescription);
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v8 = (_QWORD *)(a1 + v7[5]);
  *v8 = 0;
  v8[1] = 0;
  v9 = a1 + v7[6];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = (_QWORD *)(a1 + v7[7]);
  *v10 = 0;
  v10[1] = 0;
  return sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A380);
}

uint64_t RapidPayload.payloadDescription.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 28);
  sub_1DBBEC4B8(v3, &qword_1F030A380);
  sub_1DBBEC538(a1, v3, type metadata accessor for FileDescription);
  v4 = type metadata accessor for FileDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*RapidPayload.payloadDescription.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = (int *)type metadata accessor for FileDescription(0);
  v3[2] = v6;
  v7 = *((_QWORD *)v6 - 1);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for RapidPayload(0) + 28);
  *((_DWORD *)v3 + 12) = v10;
  sub_1DBBEC474(v1 + v10, (uint64_t)v5, &qword_1F030A380);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    v11 = &v9[v6[5]];
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    v12 = &v9[v6[6]];
    *(_QWORD *)v12 = 0;
    v12[8] = 1;
    v13 = &v9[v6[7]];
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = 0;
    sub_1DBBEC4B8((uint64_t)v5, &qword_1F030A380);
  }
  else
  {
    sub_1DBBEC538((uint64_t)v5, (uint64_t)v9, type metadata accessor for FileDescription);
  }
  return sub_1DBBEF668;
}

void sub_1DBBEF668(uint64_t a1, char a2)
{
  sub_1DBBEF67C(a1, a2, &qword_1F030A380, type metadata accessor for FileDescription);
}

void sub_1DBBEF67C(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = *(void **)a1;
  v7 = *(int *)(*(_QWORD *)a1 + 48);
  v8 = *(void **)(*(_QWORD *)a1 + 32);
  v9 = *(void **)(*(_QWORD *)a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v12 = *(void **)(*(_QWORD *)a1 + 8);
  v13 = **(_QWORD **)a1 + v7;
  if ((a2 & 1) != 0)
  {
    sub_1DBBEC57C(*(_QWORD *)(*(_QWORD *)a1 + 40), (uint64_t)v8, a4);
    sub_1DBBEC4B8(v13, a3);
    sub_1DBBEC538((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_1DBBEC5C0((uint64_t)v9, a4);
  }
  else
  {
    sub_1DBBEC4B8(**(_QWORD **)a1 + v7, a3);
    sub_1DBBEC538((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);
  free(v6);
}

BOOL RapidPayload.hasPayloadDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_1F030A380);
  v5 = type metadata accessor for FileDescription(0);
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_1DBBEC4B8((uint64_t)v3, &qword_1F030A380);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearPayloadDescription()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 28);
  sub_1DBBEC4B8(v1, &qword_1F030A380);
  v2 = type metadata accessor for FileDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t RapidPayload.uploadAttempts.getter()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32));
  if (v1[4])
    return 0;
  else
    return *(unsigned int *)v1;
}

uint64_t RapidPayload.uploadAttempts.setter(int a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = type metadata accessor for RapidPayload(0);
  v4 = v1 + *(int *)(result + 32);
  *(_DWORD *)v4 = a1;
  *(_BYTE *)(v4 + 4) = 0;
  return result;
}

uint64_t (*RapidPayload.uploadAttempts.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  int v4;

  *(_QWORD *)a1 = v1;
  v3 = *(int *)(type metadata accessor for RapidPayload(0) + 32);
  if (*(_BYTE *)(v1 + v3 + 4))
    v4 = 0;
  else
    v4 = *(_DWORD *)(v1 + v3);
  *(_DWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 12) = v3;
  return sub_1DBBEF93C;
}

uint64_t sub_1DBBEF93C(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)result + *(int *)(result + 12);
  *(_DWORD *)v1 = *(_DWORD *)(result + 8);
  *(_BYTE *)(v1 + 4) = 0;
  return result;
}

BOOL RapidPayload.hasUploadAttempts.getter()
{
  uint64_t v0;

  return (*(_BYTE *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32) + 4) & 1) == 0;
}

Swift::Void __swiftcall RapidPayload.clearUploadAttempts()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32);
  *(_DWORD *)v1 = 0;
  *(_BYTE *)(v1 + 4) = 1;
}

uint64_t RapidPayload.payload.getter()
{
  uint64_t v0;
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36));
  v2 = v1[1];
  if (v2 >> 60 == 15)
    v3 = 0;
  else
    v3 = *v1;
  sub_1DBBEE3C0(*v1, v2);
  return v3;
}

uint64_t RapidPayload.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for RapidPayload(0) + 36);
  result = sub_1DBBED668(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

uint64_t (*RapidPayload.payload.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RapidPayload(0) + 36);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = *v4;
  v6 = v4[1];
  if (v6 >> 60 == 15)
    v7 = 0;
  else
    v7 = *v4;
  v8 = 0xC000000000000000;
  if (v6 >> 60 != 15)
    v8 = v6;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v8;
  sub_1DBBEE3C0(v5, v6);
  return sub_1DBBEE440;
}

BOOL RapidPayload.hasPayload.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36) + 8) >> 60 != 15;
}

Swift::Void __swiftcall RapidPayload.clearPayload()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36);
  sub_1DBBED668(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *(_OWORD *)v1 = xmmword_1DBBFD930;
}

uint64_t (*RapidPayload.unknownFields.modify())()
{
  return nullsub_1;
}

double RapidPayload.init()@<D0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = (int *)type metadata accessor for RapidPayload(0);
  v3 = a1 + v2[5];
  v4 = type metadata accessor for ClientDeviceMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = a1 + v2[6];
  v6 = type metadata accessor for RequestDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a1 + v2[7];
  v8 = type metadata accessor for FileDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a1 + v2[8];
  *(_DWORD *)v9 = 0;
  *(_BYTE *)(v9 + 4) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + v2[9]) = xmmword_1DBBFD930;
  return result;
}

uint64_t variable initialization expression of RapidPayload._deviceMetadata@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBEFC1C(type metadata accessor for ClientDeviceMetadata, a1);
}

uint64_t variable initialization expression of RapidPayload._payloadMetadata@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBEFC1C(type metadata accessor for RequestDescription, a1);
}

uint64_t sub_1DBBEFC1C@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

uint64_t variable initialization expression of RapidPayload._payloadDescription@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBEFC1C(type metadata accessor for FileDescription, a1);
}

uint64_t variable initialization expression of RapidPayload._uploadAttempts()
{
  return 0x100000000;
}

uint64_t variable initialization expression of RapidPayload._payload()
{
  return 0;
}

uint64_t RapidPayloadReply.success.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) & 1;
}

uint64_t type metadata accessor for RapidPayloadReply(uint64_t a1)
{
  return sub_1DBBEFCC8(a1, (uint64_t *)&unk_1F030BD90);
}

uint64_t sub_1DBBEFCC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RapidPayloadReply.success.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RapidPayloadReply(0);
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RapidPayloadReply.success.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = v1;
  v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 20);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(v1 + v3) & 1;
  *(_DWORD *)(a1 + 8) = v3;
  return sub_1DBBEFD70;
}

uint64_t sub_1DBBEFD70(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)result + *(int *)(result + 8)) = *(_BYTE *)(result + 12);
  return result;
}

BOOL RapidPayloadReply.hasSuccess.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) != 2;
}

Swift::Void __swiftcall RapidPayloadReply.clearSuccess()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) = 2;
}

uint64_t RapidPayloadReply.failureReason.getter()
{
  return sub_1DBBEE228(type metadata accessor for RapidPayloadReply);
}

uint64_t RapidPayloadReply.failureReason.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEE288(a1, a2, type metadata accessor for RapidPayloadReply);
}

uint64_t (*RapidPayloadReply.failureReason.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_1DBBEDD24;
}

uint64_t sub_1DBBEFE50(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1[1];
  v3 = (_QWORD *)(a1[2] + *((int *)a1 + 6));
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
  }
  return result;
}

BOOL RapidPayloadReply.hasFailureReason.getter()
{
  return sub_1DBBEE340(type metadata accessor for RapidPayloadReply);
}

Swift::Void __swiftcall RapidPayloadReply.clearFailureReason()()
{
  sub_1DBBEE37C(type metadata accessor for RapidPayloadReply);
}

uint64_t RapidPayloadReply.replyPayload.getter()
{
  return sub_1DBBEFEE0(type metadata accessor for RapidPayloadReply);
}

uint64_t sub_1DBBEFEE0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 28));
  v3 = v2[1];
  if (v3 >> 60 == 15)
    v4 = 0;
  else
    v4 = *v2;
  sub_1DBBEE3C0(*v2, v3);
  return v4;
}

uint64_t RapidPayloadReply.replyPayload.setter(uint64_t a1, uint64_t a2)
{
  return sub_1DBBEFF3C(a1, a2, type metadata accessor for RapidPayloadReply);
}

uint64_t sub_1DBBEFF3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;

  v6 = v3 + *(int *)(a3(0) + 28);
  result = sub_1DBBED668(*(_QWORD *)v6, *(_QWORD *)(v6 + 8));
  *(_QWORD *)v6 = a1;
  *(_QWORD *)(v6 + 8) = a2;
  return result;
}

uint64_t (*RapidPayloadReply.replyPayload.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  v5 = *v4;
  v6 = v4[1];
  if (v6 >> 60 == 15)
    v7 = 0;
  else
    v7 = *v4;
  v8 = 0xC000000000000000;
  if (v6 >> 60 != 15)
    v8 = v6;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v8;
  sub_1DBBEE3C0(v5, v6);
  return sub_1DBBEE440;
}

uint64_t sub_1DBBEFFE0(uint64_t a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16) + *(int *)(a1 + 24);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)v3;
  v6 = *(_QWORD *)(v3 + 8);
  if ((a2 & 1) != 0)
  {
    sub_1DBBEC4F4(*(_QWORD *)a1, v2);
    sub_1DBBED668(v5, v6);
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
    return sub_1DBBED624(v4, v2);
  }
  else
  {
    result = sub_1DBBED668(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    *(_QWORD *)v3 = v4;
    *(_QWORD *)(v3 + 8) = v2;
  }
  return result;
}

BOOL RapidPayloadReply.hasReplyPayload.getter()
{
  return sub_1DBBF0074(type metadata accessor for RapidPayloadReply);
}

BOOL sub_1DBBF0074(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 28) + 8) >> 60 != 15;
}

Swift::Void __swiftcall RapidPayloadReply.clearReplyPayload()()
{
  sub_1DBBF00B4(type metadata accessor for RapidPayloadReply);
}

double sub_1DBBF00B4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = v1 + *(int *)(a1(0) + 28);
  sub_1DBBED668(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  result = 0.0;
  *(_OWORD *)v2 = xmmword_1DBBFD930;
  return result;
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1DBBF7F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvs_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1DBBF7F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*RapidPayloadReply.unknownFields.modify())()
{
  return nullsub_1;
}

double RapidPayloadReply.init()@<D0>(uint64_t a1@<X8>)
{
  int *v2;
  _QWORD *v3;
  double result;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = (int *)type metadata accessor for RapidPayloadReply(0);
  *(_BYTE *)(a1 + v2[5]) = 2;
  v3 = (_QWORD *)(a1 + v2[6]);
  *v3 = 0;
  v3[1] = 0;
  result = 0.0;
  *(_OWORD *)(a1 + v2[7]) = xmmword_1DBBFD930;
  return result;
}

uint64_t variable initialization expression of RapidPayloadReply._success()
{
  return 2;
}

uint64_t variable initialization expression of RapidPayloadReply._failureReason()
{
  return 0;
}

uint64_t variable initialization expression of RapidPayloadReply._replyPayload()
{
  return 0;
}

void *ClientDeviceMetadata.protoMessageName.unsafeMutableAddressor()
{
  return &static ClientDeviceMetadata.protoMessageName;
}

unint64_t static ClientDeviceMetadata.protoMessageName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_1DBBF0218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_1DBBF8084();
  __swift_allocate_value_buffer(v0, static ClientDeviceMetadata._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A768);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A770);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DBBFD940;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "build_variant";
  *(_QWORD *)(v7 + 8) = 13;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1DBBF806C();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "device_category";
  *(_QWORD *)(v11 + 8) = 15;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "device_model";
  *((_QWORD *)v13 + 1) = 12;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "platform";
  *((_QWORD *)v15 + 1) = 8;
  v15[16] = 2;
  v10();
  return sub_1DBBF8078();
}

uint64_t ClientDeviceMetadata._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_1DBBF0A58(&qword_1F030AE20, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap);
}

uint64_t static ClientDeviceMetadata._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF2338(&qword_1F030AE20, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap, a1);
}

uint64_t ClientDeviceMetadata.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_1DBBF7FA0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          type metadata accessor for ClientDeviceMetadata(0);
          sub_1DBBF7FC4();
          break;
        default:
          break;
      }
      result = sub_1DBBF7FA0();
    }
  }
  return result;
}

uint64_t ClientDeviceMetadata.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  int *v3;

  result = type metadata accessor for ClientDeviceMetadata(0);
  v3 = (int *)result;
  if (*(_QWORD *)(v0 + *(int *)(result + 20) + 8))
    result = sub_1DBBF803C();
  if (!v1)
  {
    if (*(_QWORD *)(v0 + v3[6] + 8))
      sub_1DBBF803C();
    if (*(_QWORD *)(v0 + v3[7] + 8))
      sub_1DBBF803C();
    if (*(_QWORD *)(v0 + v3[8] + 8))
      sub_1DBBF803C();
    return sub_1DBBF7F64();
  }
  return result;
}

uint64_t ClientDeviceMetadata.hashValue.getter()
{
  return sub_1DBBF25D4(type metadata accessor for ClientDeviceMetadata, &qword_1F030A3E0, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF0650@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  result = _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = a1[6];
  v6 = (_QWORD *)(a2 + a1[5]);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  v8 = a1[8];
  v9 = (_QWORD *)(a2 + a1[7]);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_QWORD *)(a2 + v8);
  *v10 = 0;
  v10[1] = 0;
  return result;
}

unint64_t sub_1DBBF069C()
{
  return 0xD000000000000014;
}

uint64_t (*sub_1DBBF06C4())()
{
  return nullsub_1;
}

uint64_t sub_1DBBF06D4()
{
  return ClientDeviceMetadata.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DBBF06E8()
{
  return ClientDeviceMetadata.traverse<A>(visitor:)();
}

uint64_t sub_1DBBF0700()
{
  sub_1DBBECF70(&qword_1F030A758, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
  return sub_1DBBF7F94();
}

uint64_t sub_1DBBF0754@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF0E98(&qword_1F030AE20, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF0770()
{
  sub_1DBBECF70(&qword_1F030A3B0, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
  return sub_1DBBF8000();
}

uint64_t sub_1DBBF07B4()
{
  sub_1DBBECF70(&qword_1F030A3B0, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
  return sub_1DBBF800C();
}

void *RequestDescription.protoMessageName.unsafeMutableAddressor()
{
  return &static RequestDescription.protoMessageName;
}

unint64_t static RequestDescription.protoMessageName.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_1DBBF0834()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_1DBBF8084();
  __swift_allocate_value_buffer(v0, static RequestDescription._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RequestDescription._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A768);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A770);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DBBFD950;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "team_id";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1DBBF806C();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "issue_category";
  *(_QWORD *)(v11 + 8) = 14;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "context_dictionary_data";
  *((_QWORD *)v13 + 1) = 23;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "request_time";
  *((_QWORD *)v15 + 1) = 12;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "build";
  *(_QWORD *)(v16 + 8) = 5;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_1DBBF8078();
}

uint64_t RequestDescription._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_1DBBF0A58(&qword_1F030AE28, (uint64_t)static RequestDescription._protobuf_nameMap);
}

uint64_t sub_1DBBF0A58(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1DBBF8084();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static RequestDescription._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF2338(&qword_1F030AE28, (uint64_t)static RequestDescription._protobuf_nameMap, a1);
}

uint64_t RequestDescription.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_1DBBF7FA0();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 5:
          type metadata accessor for RequestDescription(0);
          v4 = v3;
          sub_1DBBF7FC4();
          goto LABEL_5;
        case 3:
          type metadata accessor for RequestDescription(0);
          v4 = v3;
          sub_1DBBF7FB8();
          goto LABEL_5;
        case 4:
          type metadata accessor for RequestDescription(0);
          v4 = v3;
          sub_1DBBF7FDC();
LABEL_5:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_1DBBF7FA0();
    }
  }
  return result;
}

uint64_t RequestDescription.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  int *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  result = type metadata accessor for RequestDescription(0);
  v3 = (int *)result;
  if (*(_QWORD *)(v0 + *(int *)(result + 20) + 8))
    result = sub_1DBBF803C();
  if (!v1)
  {
    if (*(_QWORD *)(v0 + v3[6] + 8))
      sub_1DBBF803C();
    v4 = v0 + v3[7];
    v5 = *(_QWORD *)(v4 + 8);
    if (v5 >> 60 != 15)
    {
      v6 = *(_QWORD *)v4;
      sub_1DBBEC4F4(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
      sub_1DBBF8030();
      sub_1DBBED668(v6, v5);
    }
    if ((*(_BYTE *)(v0 + v3[8] + 8) & 1) == 0)
      sub_1DBBF8054();
    if (*(_QWORD *)(v0 + v3[9] + 8))
      sub_1DBBF803C();
    return sub_1DBBF7F64();
  }
  return result;
}

uint64_t RequestDescription.hashValue.getter()
{
  return sub_1DBBF25D4(type metadata accessor for RequestDescription, &qword_1F030A3E8, (uint64_t)&protocol conformance descriptor for RequestDescription);
}

double sub_1DBBF0D84@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  double result;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = a1[6];
  v5 = (_QWORD *)(a2 + a1[5]);
  *v5 = 0;
  v5[1] = 0;
  v6 = (_QWORD *)(a2 + v4);
  *v6 = 0;
  v6[1] = 0;
  result = 0.0;
  v8 = a1[8];
  *(_OWORD *)(a2 + a1[7]) = xmmword_1DBBFD930;
  v9 = a2 + v8;
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = (_QWORD *)(a2 + a1[9]);
  *v10 = 0;
  v10[1] = 0;
  return result;
}

unint64_t sub_1DBBF0DE8()
{
  return 0xD000000000000012;
}

uint64_t sub_1DBBF0E04()
{
  return RequestDescription.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DBBF0E18()
{
  return RequestDescription.traverse<A>(visitor:)();
}

uint64_t sub_1DBBF0E2C()
{
  sub_1DBBECF70(&qword_1F030A750, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
  return sub_1DBBF7F94();
}

uint64_t sub_1DBBF0E7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF0E98(&qword_1F030AE28, (uint64_t)static RequestDescription._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF0E98@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DBBF8084();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1DBBF0F04()
{
  sub_1DBBECF70(&qword_1F030A3B8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
  return sub_1DBBF8000();
}

uint64_t sub_1DBBF0F44()
{
  sub_1DBBECF70(&qword_1F030A3B8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
  return sub_1DBBF800C();
}

void *FileDescription.protoMessageName.unsafeMutableAddressor()
{
  return &static FileDescription.protoMessageName;
}

uint64_t static FileDescription.protoMessageName.getter()
{
  return 0x63736544656C6946;
}

uint64_t sub_1DBBF0FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_1DBBF8084();
  __swift_allocate_value_buffer(v0, static FileDescription._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static FileDescription._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A768);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A770);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DBBFD960;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "log_type";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1DBBF806C();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "log_size";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "file_name";
  *(_QWORD *)(v12 + 8) = 9;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_1DBBF8078();
}

uint64_t FileDescription._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_1DBBF0A58(&qword_1F030AE30, (uint64_t)static FileDescription._protobuf_nameMap);
}

uint64_t static FileDescription._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF2338(&qword_1F030AE30, (uint64_t)static FileDescription._protobuf_nameMap, a1);
}

uint64_t FileDescription.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_1DBBF7FA0();
    if (v0 || (v2 & 1) != 0)
      return result;
    switch(result)
    {
      case 3:
        goto LABEL_2;
      case 2:
        type metadata accessor for FileDescription(0);
        sub_1DBBF7FDC();
        break;
      case 1:
LABEL_2:
        type metadata accessor for FileDescription(0);
        sub_1DBBF7FC4();
        break;
    }
    v0 = 0;
  }
}

uint64_t FileDescription.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = type metadata accessor for FileDescription(0);
  v3 = result;
  if (*(_QWORD *)(v0 + *(int *)(result + 20) + 8))
    result = sub_1DBBF803C();
  if (!v1)
  {
    if ((*(_BYTE *)(v0 + *(int *)(v3 + 24) + 8) & 1) == 0)
      sub_1DBBF8054();
    if (*(_QWORD *)(v0 + *(int *)(v3 + 28) + 8))
      sub_1DBBF803C();
    return sub_1DBBF7F64();
  }
  return result;
}

uint64_t FileDescription.hashValue.getter()
{
  return sub_1DBBF25D4(type metadata accessor for FileDescription, &qword_1F030A3F0, (uint64_t)&protocol conformance descriptor for FileDescription);
}

uint64_t sub_1DBBF1390@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  result = _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v5 = a1[6];
  v6 = (_QWORD *)(a2 + a1[5]);
  *v6 = 0;
  v6[1] = 0;
  v7 = a2 + v5;
  *(_QWORD *)v7 = 0;
  *(_BYTE *)(v7 + 8) = 1;
  v8 = (_QWORD *)(a2 + a1[7]);
  *v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_1DBBF13DC()
{
  return 0x63736544656C6946;
}

uint64_t sub_1DBBF1400()
{
  return FileDescription.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DBBF1414()
{
  return FileDescription.traverse<A>(visitor:)();
}

uint64_t sub_1DBBF1428()
{
  sub_1DBBECF70(&qword_1F030A748, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
  return sub_1DBBF7F94();
}

uint64_t sub_1DBBF1478@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF0E98(&qword_1F030AE30, (uint64_t)static FileDescription._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF1494()
{
  sub_1DBBECF70(&qword_1F030A3C0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
  return sub_1DBBF8000();
}

uint64_t sub_1DBBF14D4()
{
  sub_1DBBECF70(&qword_1F030A3C0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
  return sub_1DBBF800C();
}

const char *RapidPayload.protoMessageName.unsafeMutableAddressor()
{
  return "RapidPayload";
}

uint64_t static RapidPayload.protoMessageName.getter()
{
  return 0x7961506469706152;
}

uint64_t sub_1DBBF1554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_1DBBF8084();
  __swift_allocate_value_buffer(v0, static RapidPayload._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RapidPayload._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A768);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A770);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DBBFD950;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "device_metadata";
  *(_QWORD *)(v7 + 8) = 15;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1DBBF806C();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "payload_metadata";
  *(_QWORD *)(v11 + 8) = 16;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "payload_description";
  *((_QWORD *)v13 + 1) = 19;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "upload_attempts";
  *((_QWORD *)v15 + 1) = 15;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "payload";
  *(_QWORD *)(v16 + 8) = 7;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_1DBBF8078();
}

uint64_t RapidPayload._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_1DBBF0A58(&qword_1F030AE38, (uint64_t)static RapidPayload._protobuf_nameMap);
}

uint64_t static RapidPayload._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF2338(&qword_1F030AE38, (uint64_t)static RapidPayload._protobuf_nameMap, a1);
}

uint64_t RapidPayload.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t v7;

  result = sub_1DBBF7FA0();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for ClientDeviceMetadata(0);
          v4 = &qword_1F030A3B0;
          v5 = type metadata accessor for ClientDeviceMetadata;
          v6 = &protocol conformance descriptor for ClientDeviceMetadata;
          goto LABEL_5;
        case 2:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for RequestDescription(0);
          v4 = &qword_1F030A3B8;
          v5 = type metadata accessor for RequestDescription;
          v6 = &protocol conformance descriptor for RequestDescription;
          goto LABEL_5;
        case 3:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for FileDescription(0);
          v4 = &qword_1F030A3C0;
          v5 = type metadata accessor for FileDescription;
          v6 = &protocol conformance descriptor for FileDescription;
LABEL_5:
          sub_1DBBECF70(v4, v5, (uint64_t)v6);
          v7 = v3;
          sub_1DBBF7FE8();
          goto LABEL_6;
        case 4:
          type metadata accessor for RapidPayload(0);
          v7 = v3;
          sub_1DBBF7FD0();
          goto LABEL_6;
        case 5:
          type metadata accessor for RapidPayload(0);
          v7 = v3;
          sub_1DBBF7FB8();
LABEL_6:
          v3 = v7;
          break;
        default:
          break;
      }
      result = sub_1DBBF7FA0();
    }
  }
  return result;
}

uint64_t RapidPayload.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = v3;
  result = sub_1DBBF1AA4(v5, a1, a2, a3);
  if (!v4)
  {
    sub_1DBBF1C18(v5, a1, a2, a3);
    sub_1DBBF1D8C(v5, a1, a2, a3);
    v10 = type metadata accessor for RapidPayload(0);
    if ((*(_BYTE *)(v5 + *(int *)(v10 + 32) + 4) & 1) == 0)
      sub_1DBBF8048();
    v11 = v5 + *(int *)(v10 + 36);
    v12 = *(_QWORD *)(v11 + 8);
    if (v12 >> 60 != 15)
    {
      v13 = *(_QWORD *)v11;
      sub_1DBBEC4F4(*(_QWORD *)v11, *(_QWORD *)(v11 + 8));
      sub_1DBBF8030();
      sub_1DBBED668(v13, v12);
    }
    return sub_1DBBF7F64();
  }
  return result;
}

uint64_t sub_1DBBF1AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ClientDeviceMetadata(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_1F030A390);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_1DBBEC4B8((uint64_t)v7, &qword_1F030A390);
  sub_1DBBEC538((uint64_t)v7, (uint64_t)v11, type metadata accessor for ClientDeviceMetadata);
  sub_1DBBECF70(&qword_1F030A3B0, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
  sub_1DBBF8060();
  return sub_1DBBEC5C0((uint64_t)v11, type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF1C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RequestDescription(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_1F030A388);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_1DBBEC4B8((uint64_t)v7, &qword_1F030A388);
  sub_1DBBEC538((uint64_t)v7, (uint64_t)v11, type metadata accessor for RequestDescription);
  sub_1DBBECF70(&qword_1F030A3B8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
  sub_1DBBF8060();
  return sub_1DBBEC5C0((uint64_t)v11, type metadata accessor for RequestDescription);
}

uint64_t sub_1DBBF1D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FileDescription(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_1F030A380);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_1DBBEC4B8((uint64_t)v7, &qword_1F030A380);
  sub_1DBBEC538((uint64_t)v7, (uint64_t)v11, type metadata accessor for FileDescription);
  sub_1DBBECF70(&qword_1F030A3C0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
  sub_1DBBF8060();
  return sub_1DBBEC5C0((uint64_t)v11, type metadata accessor for FileDescription);
}

uint64_t RapidPayload.hashValue.getter()
{
  return sub_1DBBF25D4(type metadata accessor for RapidPayload, &qword_1F030A3F8, (uint64_t)&protocol conformance descriptor for RapidPayload);
}

double sub_1DBBF1F20@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = a2 + a1[5];
  v5 = type metadata accessor for ClientDeviceMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + a1[6];
  v7 = type metadata accessor for RequestDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a2 + a1[7];
  v9 = type metadata accessor for FileDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = a1[9];
  v11 = a2 + a1[8];
  *(_DWORD *)v11 = 0;
  *(_BYTE *)(v11 + 4) = 1;
  result = 0.0;
  *(_OWORD *)(a2 + v10) = xmmword_1DBBFD930;
  return result;
}

uint64_t sub_1DBBF1FF0()
{
  return 0x7961506469706152;
}

uint64_t sub_1DBBF2010()
{
  return RapidPayload.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DBBF2024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return RapidPayload.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_1DBBF2038()
{
  sub_1DBBECF70(&qword_1F030A740, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
  return sub_1DBBF7F94();
}

uint64_t sub_1DBBF2088@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF0E98(&qword_1F030AE38, (uint64_t)static RapidPayload._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF20A4()
{
  sub_1DBBECF70((unint64_t *)&qword_1F030A338, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
  return sub_1DBBF8000();
}

uint64_t sub_1DBBF20E4()
{
  sub_1DBBECF70((unint64_t *)&qword_1F030A338, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
  return sub_1DBBF800C();
}

void *RapidPayloadReply.protoMessageName.unsafeMutableAddressor()
{
  return &static RapidPayloadReply.protoMessageName;
}

unint64_t static RapidPayloadReply.protoMessageName.getter()
{
  return 0xD000000000000011;
}

uint64_t sub_1DBBF2160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_1DBBF8084();
  __swift_allocate_value_buffer(v0, static RapidPayloadReply._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RapidPayloadReply._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A768);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A770);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DBBFD960;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "success";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1DBBF806C();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "failure_reason";
  *((_QWORD *)v11 + 1) = 14;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "reply_payload";
  *(_QWORD *)(v12 + 8) = 13;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_1DBBF8078();
}

uint64_t RapidPayloadReply._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_1DBBF0A58(qword_1F030AE40, (uint64_t)static RapidPayloadReply._protobuf_nameMap);
}

uint64_t static RapidPayloadReply._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF2338(qword_1F030AE40, (uint64_t)static RapidPayloadReply._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF2338@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DBBF8084();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t RapidPayloadReply.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  char v3;

  while (1)
  {
    result = sub_1DBBF7FA0();
    v1 = v0;
    if (v0 || (v3 & 1) != 0)
      return result;
    switch(result)
    {
      case 3:
        type metadata accessor for RapidPayloadReply(0);
        sub_1DBBF7FB8();
LABEL_3:
        v1 = 0;
        break;
      case 2:
        type metadata accessor for RapidPayloadReply(0);
        sub_1DBBF7FC4();
        goto LABEL_3;
      case 1:
        type metadata accessor for RapidPayloadReply(0);
        sub_1DBBF7FAC();
        goto LABEL_3;
    }
    v0 = v1;
  }
}

uint64_t RapidPayloadReply.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  result = type metadata accessor for RapidPayloadReply(0);
  v3 = result;
  if (*(_BYTE *)(v0 + *(int *)(result + 20)) != 2)
    result = sub_1DBBF8024();
  if (!v1)
  {
    if (*(_QWORD *)(v0 + *(int *)(v3 + 24) + 8))
      sub_1DBBF803C();
    v4 = v0 + *(int *)(v3 + 28);
    v5 = *(_QWORD *)(v4 + 8);
    if (v5 >> 60 != 15)
    {
      v6 = *(_QWORD *)v4;
      sub_1DBBEC4F4(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
      sub_1DBBF8030();
      sub_1DBBED668(v6, v5);
    }
    return sub_1DBBF7F64();
  }
  return result;
}

uint64_t RapidPayloadReply.hashValue.getter()
{
  return sub_1DBBF25D4(type metadata accessor for RapidPayloadReply, &qword_1F030A400, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
}

uint64_t sub_1DBBF25D4(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  sub_1DBBF80FC();
  a1(0);
  sub_1DBBECF70(a2, a1, a3);
  sub_1DBBF8090();
  return sub_1DBBF8114();
}

double sub_1DBBF2650@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  double result;

  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v4 = a1[6];
  *(_BYTE *)(a2 + a1[5]) = 2;
  v5 = (_QWORD *)(a2 + v4);
  *v5 = 0;
  v5[1] = 0;
  result = 0.0;
  *(_OWORD *)(a2 + a1[7]) = xmmword_1DBBFD930;
  return result;
}

unint64_t sub_1DBBF2698()
{
  return 0xD000000000000011;
}

uint64_t sub_1DBBF26B4()
{
  return RapidPayloadReply.decodeMessage<A>(decoder:)();
}

uint64_t sub_1DBBF26C8()
{
  return RapidPayloadReply.traverse<A>(visitor:)();
}

uint64_t sub_1DBBF26DC()
{
  sub_1DBBECF70(&qword_1F030A738, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
  return sub_1DBBF7F94();
}

uint64_t sub_1DBBF272C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBBF0E98(qword_1F030AE40, (uint64_t)static RapidPayloadReply._protobuf_nameMap, a1);
}

uint64_t sub_1DBBF2748()
{
  sub_1DBBECF70(&qword_1F030A450, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
  return sub_1DBBF8000();
}

uint64_t sub_1DBBF2788()
{
  sub_1DBBF80FC();
  sub_1DBBF8090();
  return sub_1DBBF8114();
}

uint64_t sub_1DBBF27DC()
{
  sub_1DBBECF70(&qword_1F030A450, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
  return sub_1DBBF800C();
}

uint64_t sub_1DBBF282C()
{
  sub_1DBBF80FC();
  sub_1DBBF8090();
  return sub_1DBBF8114();
}

void sub_1DBBF2880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1DBBF28E0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x1DBBF2AC4);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_1DBBF2AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1DBBF2880((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1DBBF2BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_1DBBF7EE0();
  v11 = result;
  if (result)
  {
    result = sub_1DBBF7EF8();
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
  v14 = sub_1DBBF7EEC();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1DBBF2880(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1DBBF2C70(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1DBBF2CBC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1DBBF2CF0 + *((int *)qword_1DBBF2EC8 + (v0 >> 62))))();
}

uint64_t sub_1DBBF2D00@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t _s24DiagnosticRequestService17RapidPayloadReplyV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  int v30;
  void (*v31)(_BYTE *, uint64_t, uint64_t);
  void (*v32)(_BYTE *, uint64_t);
  _BYTE v33[12];
  int v34;

  v4 = sub_1DBBF7F7C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v33[-v9];
  v11 = type metadata accessor for RapidPayloadReply(0);
  v12 = v11;
  v13 = *(int *)(v11 + 20);
  v14 = *(unsigned __int8 *)(a1 + v13);
  v15 = *(unsigned __int8 *)(a2 + v13);
  if (v14 == 2)
  {
    if (v15 != 2)
      goto LABEL_20;
  }
  else if (v15 == 2 || ((((v15 & 1) == 0) ^ v14) & 1) == 0)
  {
    goto LABEL_20;
  }
  v16 = *(int *)(v11 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  if (!v18)
  {
    if (v20)
      goto LABEL_20;
    goto LABEL_15;
  }
  if (!v20)
    goto LABEL_20;
  v21 = *v17 == *v19 && v18 == v20;
  if (v21 || (v22 = 0, (sub_1DBBF80E4() & 1) != 0))
  {
LABEL_15:
    v23 = *(int *)(v12 + 28);
    v24 = *(_QWORD *)(a1 + v23);
    v25 = *(_QWORD *)(a1 + v23 + 8);
    v26 = (uint64_t *)(a2 + v23);
    v27 = *v26;
    v28 = v26[1];
    if (v25 >> 60 == 15)
    {
      if (v28 >> 60 == 15)
        goto LABEL_23;
      goto LABEL_19;
    }
    if (v28 >> 60 == 15)
    {
LABEL_19:
      sub_1DBBEE3C0(v24, v25);
      sub_1DBBEE3C0(v27, v28);
      sub_1DBBED668(v24, v25);
      sub_1DBBED668(v27, v28);
      goto LABEL_20;
    }
    sub_1DBBEE3C0(v24, v25);
    sub_1DBBEE3C0(v27, v28);
    sub_1DBBF2C70(v24, v25);
    v34 = v30;
    sub_1DBBED668(v27, v28);
    sub_1DBBED668(v24, v25);
    if ((v34 & 1) != 0)
    {
LABEL_23:
      v31 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
      v31(v10, a1, v4);
      v31(v8, a2, v4);
      sub_1DBBECF70(&qword_1F030A760, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
      v22 = sub_1DBBF809C();
      v32 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
      v32(v8, v4);
      v32(v10, v4);
      return v22 & 1;
    }
LABEL_20:
    v22 = 0;
  }
  return v22 & 1;
}

uint64_t _s24DiagnosticRequestService15FileDescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  char v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void (*v31)(char *, uint64_t, uint64_t);
  void (*v32)(char *, uint64_t);
  uint64_t v33;

  v4 = sub_1DBBF7F7C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v33 - v9;
  v11 = (int *)type metadata accessor for FileDescription(0);
  v12 = v11[5];
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_25;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_25;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_1DBBF80E4() & 1) != 0))
  {
LABEL_10:
    v19 = v11[6];
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_BYTE *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = *(unsigned __int8 *)(a2 + v19 + 8);
    if ((v21 & 1) != 0)
    {
      if (!v23)
        goto LABEL_25;
    }
    else
    {
      if (*v20 != *v22)
        LOBYTE(v23) = 1;
      if ((v23 & 1) != 0)
        goto LABEL_25;
    }
    v24 = v11[7];
    v25 = (_QWORD *)(a1 + v24);
    v26 = *(_QWORD *)(a1 + v24 + 8);
    v27 = (_QWORD *)(a2 + v24);
    v28 = v27[1];
    if (v26)
    {
      if (v28)
      {
        if (*v25 != *v27 || v26 != v28)
        {
          v18 = 0;
          if ((sub_1DBBF80E4() & 1) == 0)
            return v18 & 1;
        }
LABEL_27:
        v31 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v31(v10, a1, v4);
        v31(v8, a2, v4);
        sub_1DBBECF70(&qword_1F030A760, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
        v18 = sub_1DBBF809C();
        v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        v32(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v28)
    {
      goto LABEL_27;
    }
LABEL_25:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t _s24DiagnosticRequestService12RapidPayloadV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t *v43;
  uint64_t v44;
  char v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int (*v66)(uint64_t, uint64_t, uint64_t);
  char v67;
  uint64_t v69;
  char v70;
  uint64_t v71;
  _DWORD *v72;
  char v73;
  _DWORD *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  char *v87;
  char *v88;
  void (*v89)(char *, uint64_t);
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v111 = a2;
  v112 = a1;
  v2 = sub_1DBBF7F7C();
  v92 = *(_QWORD *)(v2 - 8);
  v93 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v91 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v90 = (char *)&v90 - v5;
  v6 = type metadata accessor for FileDescription(0);
  v97 = *(_QWORD *)(v6 - 8);
  v98 = v6;
  MEMORY[0x1E0C80A78](v6);
  v94 = (uint64_t)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A778);
  MEMORY[0x1E0C80A78](v96);
  v107 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  v10 = MEMORY[0x1E0C80A78](v9);
  v100 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v105 = (char *)&v90 - v13;
  MEMORY[0x1E0C80A78](v12);
  v106 = (char *)&v90 - v14;
  v15 = type metadata accessor for RequestDescription(0);
  v102 = *(_QWORD *)(v15 - 8);
  v103 = v15;
  MEMORY[0x1E0C80A78](v15);
  v95 = (uint64_t)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A780);
  MEMORY[0x1E0C80A78](v101);
  v110 = (uint64_t)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  v19 = MEMORY[0x1E0C80A78](v18);
  v99 = (uint64_t)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v19);
  v108 = (uint64_t)&v90 - v22;
  MEMORY[0x1E0C80A78](v21);
  v109 = (uint64_t)&v90 - v23;
  v24 = type metadata accessor for ClientDeviceMetadata(0);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A788);
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v90 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  v32 = MEMORY[0x1E0C80A78](v31);
  v34 = (char *)&v90 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x1E0C80A78](v32);
  v37 = (char *)&v90 - v36;
  MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v90 - v38;
  v40 = type metadata accessor for RapidPayload(0);
  sub_1DBBEC474(v112 + *(int *)(v40 + 20), (uint64_t)v39, &qword_1F030A390);
  v104 = (int *)v40;
  sub_1DBBEC474(v111 + *(int *)(v40 + 20), (uint64_t)v37, &qword_1F030A390);
  v41 = (uint64_t)&v30[*(int *)(v28 + 48)];
  sub_1DBBEC474((uint64_t)v39, (uint64_t)v30, &qword_1F030A390);
  sub_1DBBEC474((uint64_t)v37, v41, &qword_1F030A390);
  v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
  if (v42((uint64_t)v30, 1, v24) == 1)
  {
    sub_1DBBEC4B8((uint64_t)v37, &qword_1F030A390);
    sub_1DBBEC4B8((uint64_t)v39, &qword_1F030A390);
    if (v42(v41, 1, v24) == 1)
    {
      sub_1DBBEC4B8((uint64_t)v30, &qword_1F030A390);
      goto LABEL_8;
    }
LABEL_6:
    v43 = &qword_1F030A788;
    v44 = (uint64_t)v30;
LABEL_21:
    sub_1DBBEC4B8(v44, v43);
    goto LABEL_22;
  }
  sub_1DBBEC474((uint64_t)v30, (uint64_t)v34, &qword_1F030A390);
  if (v42(v41, 1, v24) == 1)
  {
    sub_1DBBEC4B8((uint64_t)v37, &qword_1F030A390);
    sub_1DBBEC4B8((uint64_t)v39, &qword_1F030A390);
    sub_1DBBEC5C0((uint64_t)v34, type metadata accessor for ClientDeviceMetadata);
    goto LABEL_6;
  }
  sub_1DBBEC538(v41, (uint64_t)v27, type metadata accessor for ClientDeviceMetadata);
  v45 = _s24DiagnosticRequestService20ClientDeviceMetadataV2eeoiySbAC_ACtFZ_0((uint64_t)v34, (uint64_t)v27);
  sub_1DBBEC5C0((uint64_t)v27, type metadata accessor for ClientDeviceMetadata);
  sub_1DBBEC4B8((uint64_t)v37, &qword_1F030A390);
  sub_1DBBEC4B8((uint64_t)v39, &qword_1F030A390);
  sub_1DBBEC5C0((uint64_t)v34, type metadata accessor for ClientDeviceMetadata);
  sub_1DBBEC4B8((uint64_t)v30, &qword_1F030A390);
  if ((v45 & 1) == 0)
    goto LABEL_22;
LABEL_8:
  v46 = v104;
  v47 = v109;
  sub_1DBBEC474(v112 + v104[6], v109, &qword_1F030A388);
  v48 = v111;
  v49 = v108;
  sub_1DBBEC474(v111 + v46[6], v108, &qword_1F030A388);
  v50 = v110;
  v51 = v110 + *(int *)(v101 + 48);
  sub_1DBBEC474(v47, v110, &qword_1F030A388);
  sub_1DBBEC474(v49, v51, &qword_1F030A388);
  v52 = v103;
  v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v102 + 48);
  if (v53(v50, 1, v103) == 1)
  {
    sub_1DBBEC4B8(v49, &qword_1F030A388);
    sub_1DBBEC4B8(v47, &qword_1F030A388);
    v54 = v53(v51, 1, v52);
    v55 = (uint64_t)v106;
    v56 = (uint64_t)v107;
    v57 = (uint64_t)v100;
    v58 = (uint64_t)v105;
    if (v54 == 1)
    {
      sub_1DBBEC4B8(v110, &qword_1F030A388);
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v59 = v99;
  sub_1DBBEC474(v50, v99, &qword_1F030A388);
  v60 = v53(v51, 1, v52);
  v55 = (uint64_t)v106;
  v56 = (uint64_t)v107;
  v58 = (uint64_t)v105;
  if (v60 == 1)
  {
    sub_1DBBEC4B8(v108, &qword_1F030A388);
    sub_1DBBEC4B8(v109, &qword_1F030A388);
    sub_1DBBEC5C0(v59, type metadata accessor for RequestDescription);
LABEL_13:
    v43 = &qword_1F030A780;
    v44 = v110;
    goto LABEL_21;
  }
  v61 = v95;
  sub_1DBBEC538(v51, v95, type metadata accessor for RequestDescription);
  v62 = _s24DiagnosticRequestService0B11DescriptionV2eeoiySbAC_ACtFZ_0(v59, v61);
  sub_1DBBEC5C0(v61, type metadata accessor for RequestDescription);
  sub_1DBBEC4B8(v108, &qword_1F030A388);
  sub_1DBBEC4B8(v109, &qword_1F030A388);
  v57 = (uint64_t)v100;
  sub_1DBBEC5C0(v59, type metadata accessor for RequestDescription);
  sub_1DBBEC4B8(v50, &qword_1F030A388);
  if ((v62 & 1) == 0)
    goto LABEL_22;
LABEL_15:
  v63 = v112;
  sub_1DBBEC474(v112 + v46[7], v55, &qword_1F030A380);
  sub_1DBBEC474(v48 + v46[7], v58, &qword_1F030A380);
  v64 = v56 + *(int *)(v96 + 48);
  sub_1DBBEC474(v55, v56, &qword_1F030A380);
  sub_1DBBEC474(v58, v64, &qword_1F030A380);
  v65 = v98;
  v66 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48);
  if (v66(v56, 1, v98) != 1)
  {
    sub_1DBBEC474(v56, v57, &qword_1F030A380);
    if (v66(v64, 1, v65) != 1)
    {
      v69 = v94;
      sub_1DBBEC538(v64, v94, type metadata accessor for FileDescription);
      v70 = _s24DiagnosticRequestService15FileDescriptionV2eeoiySbAC_ACtFZ_0(v57, v69);
      sub_1DBBEC5C0(v69, type metadata accessor for FileDescription);
      sub_1DBBEC4B8(v58, &qword_1F030A380);
      sub_1DBBEC4B8(v55, &qword_1F030A380);
      sub_1DBBEC5C0(v57, type metadata accessor for FileDescription);
      sub_1DBBEC4B8(v56, &qword_1F030A380);
      if ((v70 & 1) == 0)
        goto LABEL_22;
      goto LABEL_25;
    }
    sub_1DBBEC4B8(v58, &qword_1F030A380);
    sub_1DBBEC4B8(v55, &qword_1F030A380);
    sub_1DBBEC5C0(v57, type metadata accessor for FileDescription);
    goto LABEL_20;
  }
  sub_1DBBEC4B8(v58, &qword_1F030A380);
  sub_1DBBEC4B8(v55, &qword_1F030A380);
  if (v66(v64, 1, v65) != 1)
  {
LABEL_20:
    v43 = &qword_1F030A778;
    v44 = v56;
    goto LABEL_21;
  }
  sub_1DBBEC4B8(v56, &qword_1F030A380);
LABEL_25:
  v71 = v46[8];
  v72 = (_DWORD *)(v63 + v71);
  v73 = *(_BYTE *)(v63 + v71 + 4);
  v74 = (_DWORD *)(v48 + v71);
  v75 = *(unsigned __int8 *)(v48 + v71 + 4);
  if ((v73 & 1) != 0)
  {
    if (!v75)
      goto LABEL_22;
  }
  else
  {
    if (*v72 != *v74)
      LOBYTE(v75) = 1;
    if ((v75 & 1) != 0)
      goto LABEL_22;
  }
  v76 = v46[9];
  v77 = *(_QWORD *)(v63 + v76);
  v78 = *(_QWORD *)(v63 + v76 + 8);
  v79 = (uint64_t *)(v48 + v76);
  v80 = *v79;
  v81 = v79[1];
  if (v78 >> 60 == 15)
  {
    if (v81 >> 60 == 15)
      goto LABEL_37;
    goto LABEL_35;
  }
  if (v81 >> 60 == 15)
  {
LABEL_35:
    sub_1DBBEE3C0(v77, v78);
    sub_1DBBEE3C0(v80, v81);
    sub_1DBBED668(v77, v78);
    sub_1DBBED668(v80, v81);
    goto LABEL_22;
  }
  sub_1DBBEE3C0(v77, v78);
  sub_1DBBEE3C0(v80, v81);
  sub_1DBBF2C70(v77, v78);
  v83 = v82;
  sub_1DBBED668(v80, v81);
  sub_1DBBED668(v77, v78);
  if ((v83 & 1) != 0)
  {
LABEL_37:
    v85 = v92;
    v84 = v93;
    v86 = *(void (**)(char *, uint64_t, uint64_t))(v92 + 16);
    v87 = v90;
    v86(v90, v112, v93);
    v88 = v91;
    v86(v91, v48, v84);
    sub_1DBBECF70(&qword_1F030A760, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
    v67 = sub_1DBBF809C();
    v89 = *(void (**)(char *, uint64_t))(v85 + 8);
    v89(v88, v84);
    v89(v87, v84);
    return v67 & 1;
  }
LABEL_22:
  v67 = 0;
  return v67 & 1;
}

uint64_t _s24DiagnosticRequestService0B11DescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  _QWORD *v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  void (*v44)(_BYTE *, uint64_t, uint64_t);
  void (*v45)(_BYTE *, uint64_t);
  _BYTE v46[4];
  int v47;
  uint64_t v48;

  v4 = sub_1DBBF7F7C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v46[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v46[-v9];
  v11 = (int *)type metadata accessor for RequestDescription(0);
  v12 = v11[5];
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_38;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_38;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_1DBBF80E4() & 1) != 0))
  {
LABEL_10:
    v19 = v11[6];
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (!v23)
        goto LABEL_38;
      if (*v20 != *v22 || v21 != v23)
      {
        v18 = 0;
        if ((sub_1DBBF80E4() & 1) == 0)
          return v18 & 1;
      }
    }
    else if (v23)
    {
      goto LABEL_38;
    }
    v25 = v11[7];
    v26 = *(_QWORD *)(a1 + v25);
    v27 = *(_QWORD *)(a1 + v25 + 8);
    v28 = (uint64_t *)(a2 + v25);
    v29 = *v28;
    v30 = v28[1];
    if (v27 >> 60 == 15)
    {
      if (v30 >> 60 == 15)
      {
LABEL_25:
        v33 = v11[8];
        v34 = (_QWORD *)(a1 + v33);
        v35 = *(_BYTE *)(a1 + v33 + 8);
        v36 = (_QWORD *)(a2 + v33);
        v37 = *(unsigned __int8 *)(a2 + v33 + 8);
        if ((v35 & 1) != 0)
        {
          if (!v37)
            goto LABEL_38;
        }
        else
        {
          if (*v34 != *v36)
            LOBYTE(v37) = 1;
          if ((v37 & 1) != 0)
            goto LABEL_38;
        }
        v38 = v11[9];
        v39 = (_QWORD *)(a1 + v38);
        v40 = *(_QWORD *)(a1 + v38 + 8);
        v41 = (_QWORD *)(a2 + v38);
        v42 = v41[1];
        if (v40)
        {
          if (v42)
          {
            if (*v39 != *v41 || v40 != v42)
            {
              v18 = 0;
              if ((sub_1DBBF80E4() & 1) == 0)
                return v18 & 1;
            }
LABEL_40:
            v44 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
            v44(v10, a1, v4);
            v44(v8, a2, v4);
            sub_1DBBECF70(&qword_1F030A760, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
            v18 = sub_1DBBF809C();
            v45 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
            v45(v8, v4);
            v45(v10, v4);
            return v18 & 1;
          }
        }
        else if (!v42)
        {
          goto LABEL_40;
        }
LABEL_38:
        v18 = 0;
        return v18 & 1;
      }
    }
    else if (v30 >> 60 != 15)
    {
      v48 = v26;
      sub_1DBBEE3C0(v26, v27);
      sub_1DBBEE3C0(v29, v30);
      sub_1DBBF2C70(v48, v27);
      v47 = v32;
      sub_1DBBED668(v29, v30);
      sub_1DBBED668(v48, v27);
      if ((v47 & 1) == 0)
        goto LABEL_38;
      goto LABEL_25;
    }
    v31 = v26;
    sub_1DBBEE3C0(v26, v27);
    sub_1DBBEE3C0(v29, v30);
    sub_1DBBED668(v31, v27);
    sub_1DBBED668(v29, v30);
    goto LABEL_38;
  }
  return v18 & 1;
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v40;

  v4 = sub_1DBBF7F7C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v40 - v9;
  v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v12 = v11[5];
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_37;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_37;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_1DBBF80E4() & 1) != 0))
  {
LABEL_10:
    v19 = v11[6];
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (!v23)
        goto LABEL_37;
      if (*v20 != *v22 || v21 != v23)
      {
        v18 = 0;
        if ((sub_1DBBF80E4() & 1) == 0)
          return v18 & 1;
      }
    }
    else if (v23)
    {
      goto LABEL_37;
    }
    v25 = v11[7];
    v26 = (_QWORD *)(a1 + v25);
    v27 = *(_QWORD *)(a1 + v25 + 8);
    v28 = (_QWORD *)(a2 + v25);
    v29 = v28[1];
    if (v27)
    {
      if (!v29)
        goto LABEL_37;
      if (*v26 != *v28 || v27 != v29)
      {
        v18 = 0;
        if ((sub_1DBBF80E4() & 1) == 0)
          return v18 & 1;
      }
    }
    else if (v29)
    {
      goto LABEL_37;
    }
    v31 = v11[8];
    v32 = (_QWORD *)(a1 + v31);
    v33 = *(_QWORD *)(a1 + v31 + 8);
    v34 = (_QWORD *)(a2 + v31);
    v35 = v34[1];
    if (v33)
    {
      if (v35)
      {
        if (*v32 != *v34 || v33 != v35)
        {
          v18 = 0;
          if ((sub_1DBBF80E4() & 1) == 0)
            return v18 & 1;
        }
LABEL_39:
        v38 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v38(v10, a1, v4);
        v38(v8, a2, v4);
        sub_1DBBECF70(&qword_1F030A760, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
        v18 = sub_1DBBF809C();
        v39 = *(void (**)(char *, uint64_t))(v5 + 8);
        v39(v8, v4);
        v39(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v35)
    {
      goto LABEL_39;
    }
LABEL_37:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_1DBBF42A0()
{
  return sub_1DBBECF70(&qword_1F030A408, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF42CC()
{
  return sub_1DBBECF70(&qword_1F030A3B0, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF42F8()
{
  return sub_1DBBECF70(&qword_1F030A3E0, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF4324()
{
  return sub_1DBBECF70(&qword_1F030A410, type metadata accessor for ClientDeviceMetadata, (uint64_t)&protocol conformance descriptor for ClientDeviceMetadata);
}

uint64_t sub_1DBBF4350()
{
  return sub_1DBBECF70(&qword_1F030A418, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
}

uint64_t sub_1DBBF437C()
{
  return sub_1DBBECF70(&qword_1F030A3B8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
}

uint64_t sub_1DBBF43A8()
{
  return sub_1DBBECF70(&qword_1F030A3E8, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
}

uint64_t sub_1DBBF43D4()
{
  return sub_1DBBECF70(&qword_1F030A420, type metadata accessor for RequestDescription, (uint64_t)&protocol conformance descriptor for RequestDescription);
}

uint64_t sub_1DBBF4400()
{
  return sub_1DBBECF70(&qword_1F030A428, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
}

uint64_t sub_1DBBF442C()
{
  return sub_1DBBECF70(&qword_1F030A3C0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
}

uint64_t sub_1DBBF4458()
{
  return sub_1DBBECF70(&qword_1F030A3F0, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
}

uint64_t sub_1DBBF4484()
{
  return sub_1DBBECF70(&qword_1F030A430, type metadata accessor for FileDescription, (uint64_t)&protocol conformance descriptor for FileDescription);
}

uint64_t sub_1DBBF44B0()
{
  return sub_1DBBECF70(&qword_1F030A438, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
}

uint64_t sub_1DBBF44DC()
{
  return sub_1DBBECF70((unint64_t *)&qword_1F030A338, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
}

uint64_t sub_1DBBF4508()
{
  return sub_1DBBECF70(&qword_1F030A3F8, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
}

uint64_t sub_1DBBF4534()
{
  return sub_1DBBECF70(&qword_1F030A440, type metadata accessor for RapidPayload, (uint64_t)&protocol conformance descriptor for RapidPayload);
}

uint64_t sub_1DBBF4560()
{
  return sub_1DBBECF70(&qword_1F030A448, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
}

uint64_t sub_1DBBF458C()
{
  return sub_1DBBECF70(&qword_1F030A450, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
}

uint64_t sub_1DBBF45B8()
{
  return sub_1DBBECF70(&qword_1F030A400, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
}

uint64_t sub_1DBBF45E4()
{
  return sub_1DBBECF70(&qword_1F030A458, type metadata accessor for RapidPayloadReply, (uint64_t)&protocol conformance descriptor for RapidPayloadReply);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientDeviceMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBBF7F7C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = a3[8];
    v18 = (uint64_t *)((char *)a1 + v16);
    v19 = (uint64_t *)((char *)a2 + v16);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (uint64_t *)((char *)a1 + v17);
    v22 = (uint64_t *)((char *)a2 + v17);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ClientDeviceMetadata(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = (_QWORD *)(a1 + v16);
  v21 = (_QWORD *)(a2 + v16);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientDeviceMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ClientDeviceMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF4A74()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DBBF7F7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RequestDescription(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBBF7F7C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = (char *)a1 + v16;
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = *(uint64_t *)((char *)a2 + v16 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19 >> 60 == 15)
    {
      *(_OWORD *)v17 = *(_OWORD *)v18;
    }
    else
    {
      v21 = *v18;
      sub_1DBBEC4F4(*v18, v19);
      *(_QWORD *)v17 = v21;
      *((_QWORD *)v17 + 1) = v19;
    }
    v22 = a3[8];
    v23 = a3[9];
    v24 = (char *)a1 + v22;
    v25 = (char *)a2 + v22;
    *(_QWORD *)v24 = *(_QWORD *)v25;
    v24[8] = v25[8];
    v26 = (uint64_t *)((char *)a1 + v23);
    v27 = (uint64_t *)((char *)a2 + v23);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for RequestDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;

  v4 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  v6 = v5[1];
  if (v6 >> 60 != 15)
    sub_1DBBED624(*v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *(_QWORD *)(a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 >> 60 == 15)
  {
    *(_OWORD *)v16 = *(_OWORD *)v17;
  }
  else
  {
    v19 = *v17;
    sub_1DBBEC4F4(*v17, v18);
    *(_QWORD *)v16 = v19;
    *(_QWORD *)(v16 + 8) = v18;
  }
  v20 = a3[8];
  v21 = a3[9];
  v22 = a1 + v20;
  v23 = a2 + v20;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  v24 = (_QWORD *)(a1 + v21);
  v25 = (_QWORD *)(a2 + v21);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (uint64_t *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v16 = *(_QWORD *)(a2 + v13 + 8);
  if (*(_QWORD *)(a1 + v13 + 8) >> 60 != 15)
  {
    if (v16 >> 60 != 15)
    {
      v18 = *v15;
      sub_1DBBEC4F4(v18, v16);
      v19 = *v14;
      v20 = v14[1];
      *v14 = v18;
      v14[1] = v16;
      sub_1DBBED624(v19, v20);
      goto LABEL_8;
    }
    sub_1DBBF4F10((uint64_t)v14);
    goto LABEL_6;
  }
  if (v16 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v14 = *(_OWORD *)v15;
    goto LABEL_8;
  }
  v17 = *v15;
  sub_1DBBEC4F4(v17, v16);
  *v14 = v17;
  v14[1] = v16;
LABEL_8:
  v21 = a3[8];
  v22 = a1 + v21;
  v23 = (uint64_t *)(a2 + v21);
  v24 = *v23;
  *(_BYTE *)(v22 + 8) = *((_BYTE *)v23 + 8);
  *(_QWORD *)v22 = v24;
  v25 = a3[9];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (_QWORD *)(a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DBBF4F10(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
  return a1;
}

uint64_t initializeWithTake for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *(_QWORD *)(a1 + v17 + 8);
  if (v20 >> 60 != 15)
  {
    v21 = v19[1];
    if (v21 >> 60 != 15)
    {
      v22 = *v18;
      *v18 = *v19;
      v18[1] = v21;
      sub_1DBBED624(v22, v20);
      goto LABEL_6;
    }
    sub_1DBBF4F10((uint64_t)v18);
  }
  *(_OWORD *)v18 = *(_OWORD *)v19;
LABEL_6:
  v23 = a3[8];
  v24 = a3[9];
  v25 = a1 + v23;
  v26 = a2 + v23;
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
  v27 = (_QWORD *)(a1 + v24);
  v28 = (uint64_t *)(a2 + v24);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestDescription()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for RequestDescription()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF510C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DBBF7F7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDescription(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBBF7F7C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v13[8] = v14[8];
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v15 = a3[7];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FileDescription(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = (uint64_t *)(a2 + v10);
  v13 = *v12;
  *(_BYTE *)(v11 + 8) = *((_BYTE *)v12 + 8);
  *(_QWORD *)v11 = v13;
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a3[7];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  v16 = (_QWORD *)(a1 + v13);
  v17 = (uint64_t *)(a2 + v13);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDescription()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for FileDescription()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF5554()
{
  return sub_1DBBF77A0();
}

uint64_t *initializeBufferWithCopyOfBuffer for RapidPayload(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t, int *);
  uint64_t v33;
  char *v34;
  char *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, _QWORD, uint64_t, int *);
  uint64_t v59;
  char *v60;
  char *v61;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  void (*v76)(char *, _QWORD, uint64_t, int *);
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  char *v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBBF7F7C();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = (int *)type metadata accessor for ClientDeviceMetadata(0);
    v13 = *((_QWORD *)v12 - 1);
    v87 = v8;
    v88 = v7;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      v16 = v12[5];
      v17 = &v10[v16];
      v18 = &v11[v16];
      v19 = *((_QWORD *)v18 + 1);
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *((_QWORD *)v17 + 1) = v19;
      v20 = v12[6];
      v21 = &v10[v20];
      v22 = &v11[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = v12[7];
      v25 = &v10[v24];
      v26 = &v11[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = v12[8];
      v29 = &v10[v28];
      v30 = &v11[v28];
      v31 = *((_QWORD *)v30 + 1);
      *(_QWORD *)v29 = *(_QWORD *)v30;
      *((_QWORD *)v29 + 1) = v31;
      v32 = *(void (**)(char *, _QWORD, uint64_t, int *))(v13 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v10, 0, 1, v12);
    }
    v33 = a3[6];
    v34 = (char *)a1 + v33;
    v35 = (char *)a2 + v33;
    v36 = (int *)type metadata accessor for RequestDescription(0);
    v37 = *((_QWORD *)v36 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v37 + 48))(v35, 1, v36))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v87(v34, v35, v88);
      v39 = v36[5];
      v40 = &v34[v39];
      v41 = &v35[v39];
      v42 = *((_QWORD *)v41 + 1);
      *(_QWORD *)v40 = *(_QWORD *)v41;
      *((_QWORD *)v40 + 1) = v42;
      v43 = v36[6];
      v44 = &v34[v43];
      v45 = &v35[v43];
      v46 = *((_QWORD *)v45 + 1);
      *(_QWORD *)v44 = *(_QWORD *)v45;
      *((_QWORD *)v44 + 1) = v46;
      v47 = v36[7];
      v86 = &v34[v47];
      v48 = (uint64_t *)&v35[v47];
      v49 = *(_QWORD *)&v35[v47 + 8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v49 >> 60 == 15)
      {
        *(_OWORD *)v86 = *(_OWORD *)v48;
      }
      else
      {
        v50 = *v48;
        sub_1DBBEC4F4(*v48, v49);
        *(_QWORD *)v86 = v50;
        *((_QWORD *)v86 + 1) = v49;
      }
      v51 = v36[8];
      v52 = &v34[v51];
      v53 = &v35[v51];
      *(_QWORD *)v52 = *(_QWORD *)v53;
      v52[8] = v53[8];
      v54 = v36[9];
      v55 = &v34[v54];
      v56 = &v35[v54];
      v57 = *((_QWORD *)v56 + 1);
      *(_QWORD *)v55 = *(_QWORD *)v56;
      *((_QWORD *)v55 + 1) = v57;
      v58 = *(void (**)(char *, _QWORD, uint64_t, int *))(v37 + 56);
      swift_bridgeObjectRetain();
      v58(v34, 0, 1, v36);
    }
    v59 = a3[7];
    v60 = (char *)a1 + v59;
    v61 = (char *)a2 + v59;
    v62 = (int *)type metadata accessor for FileDescription(0);
    v63 = *((_QWORD *)v62 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v63 + 48))(v61, 1, v62))
    {
      v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
      memcpy(v60, v61, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
    }
    else
    {
      v87(v60, v61, v88);
      v65 = v62[5];
      v66 = &v60[v65];
      v67 = &v61[v65];
      v68 = *((_QWORD *)v67 + 1);
      *(_QWORD *)v66 = *(_QWORD *)v67;
      *((_QWORD *)v66 + 1) = v68;
      v69 = v62[6];
      v70 = &v60[v69];
      v71 = &v61[v69];
      *(_QWORD *)v70 = *(_QWORD *)v71;
      v70[8] = v71[8];
      v72 = v62[7];
      v73 = &v60[v72];
      v74 = &v61[v72];
      v75 = *((_QWORD *)v74 + 1);
      *(_QWORD *)v73 = *(_QWORD *)v74;
      *((_QWORD *)v73 + 1) = v75;
      v76 = *(void (**)(char *, _QWORD, uint64_t, int *))(v63 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v76(v60, 0, 1, v62);
    }
    v77 = a3[8];
    v78 = a3[9];
    v79 = (char *)a1 + v77;
    v80 = (char *)a2 + v77;
    *(_DWORD *)v79 = *(_DWORD *)v80;
    v79[4] = v80[4];
    v81 = (char *)a1 + v78;
    v82 = (uint64_t *)((char *)a2 + v78);
    v83 = *(uint64_t *)((char *)a2 + v78 + 8);
    if (v83 >> 60 == 15)
    {
      *(_OWORD *)v81 = *(_OWORD *)v82;
    }
    else
    {
      v84 = *v82;
      sub_1DBBEC4F4(*v82, v83);
      *(_QWORD *)v81 = v84;
      *((_QWORD *)v81 + 1) = v83;
    }
  }
  return a1;
}

uint64_t destroy for RapidPayload(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t *v15;
  unint64_t v16;

  v4 = sub_1DBBF7F7C();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + a2[5];
  v7 = type metadata accessor for ClientDeviceMetadata(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v8 = a1 + a2[6];
  v9 = type metadata accessor for RequestDescription(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
  {
    v5(v8, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = (uint64_t *)(v8 + *(int *)(v9 + 28));
    v11 = v10[1];
    if (v11 >> 60 != 15)
      sub_1DBBED624(*v10, v11);
    swift_bridgeObjectRelease();
  }
  v12 = a1 + a2[7];
  v13 = type metadata accessor for FileDescription(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13);
  if (!(_DWORD)result)
  {
    v5(v12, v4);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v15 = (uint64_t *)(a1 + a2[9]);
  v16 = v15[1];
  if (v16 >> 60 != 15)
    return sub_1DBBED624(*v15, v16);
  return result;
}

uint64_t initializeWithCopy for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, _QWORD, uint64_t, int *);
  uint64_t v31;
  char *v32;
  char *v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, _QWORD, uint64_t, int *);
  uint64_t v58;
  char *v59;
  char *v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  int *v74;
  uint64_t v75;
  void (*v76)(char *, _QWORD, uint64_t, int *);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  int *v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;

  v6 = sub_1DBBF7F7C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v12 = *((_QWORD *)v11 - 1);
  v87 = (void (*)(char *, char *, uint64_t))v7;
  v88 = v6;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = v11[5];
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = v11[6];
    v19 = &v9[v18];
    v20 = &v10[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = v11[7];
    v23 = &v9[v22];
    v24 = &v10[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = v11[8];
    v27 = &v9[v26];
    v28 = &v10[v26];
    v29 = *((_QWORD *)v28 + 1);
    *(_QWORD *)v27 = *(_QWORD *)v28;
    *((_QWORD *)v27 + 1) = v29;
    v30 = *(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30(v9, 0, 1, v11);
  }
  v31 = a3[6];
  v32 = (char *)(a1 + v31);
  v33 = (char *)(a2 + v31);
  v34 = (int *)type metadata accessor for RequestDescription(0);
  v35 = *((_QWORD *)v34 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v35 + 48))(v33, 1, v34))
  {
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    v86 = a3;
    v87(v32, v33, v88);
    v37 = v34[5];
    v38 = &v32[v37];
    v39 = &v33[v37];
    v40 = *((_QWORD *)v39 + 1);
    *(_QWORD *)v38 = *(_QWORD *)v39;
    *((_QWORD *)v38 + 1) = v40;
    v41 = v34[6];
    v42 = &v32[v41];
    v43 = &v33[v41];
    v44 = *((_QWORD *)v43 + 1);
    *(_QWORD *)v42 = *(_QWORD *)v43;
    *((_QWORD *)v42 + 1) = v44;
    v45 = v34[7];
    v46 = &v32[v45];
    v47 = (uint64_t *)&v33[v45];
    v48 = *(_QWORD *)&v33[v45 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v48 >> 60 == 15)
    {
      *(_OWORD *)v46 = *(_OWORD *)v47;
    }
    else
    {
      v49 = *v47;
      sub_1DBBEC4F4(*v47, v48);
      *(_QWORD *)v46 = v49;
      *((_QWORD *)v46 + 1) = v48;
    }
    v50 = v34[8];
    v51 = &v32[v50];
    v52 = &v33[v50];
    *(_QWORD *)v51 = *(_QWORD *)v52;
    v51[8] = v52[8];
    v53 = v34[9];
    v54 = &v32[v53];
    v55 = &v33[v53];
    v56 = *((_QWORD *)v55 + 1);
    *(_QWORD *)v54 = *(_QWORD *)v55;
    *((_QWORD *)v54 + 1) = v56;
    v57 = *(void (**)(char *, _QWORD, uint64_t, int *))(v35 + 56);
    swift_bridgeObjectRetain();
    v57(v32, 0, 1, v34);
    a3 = v86;
  }
  v58 = a3[7];
  v59 = (char *)(a1 + v58);
  v60 = (char *)(a2 + v58);
  v61 = (int *)type metadata accessor for FileDescription(0);
  v62 = *((_QWORD *)v61 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v62 + 48))(v60, 1, v61))
  {
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
  }
  else
  {
    v87(v59, v60, v88);
    v64 = v61[5];
    v65 = &v59[v64];
    v66 = &v60[v64];
    v67 = *((_QWORD *)v66 + 1);
    *(_QWORD *)v65 = *(_QWORD *)v66;
    *((_QWORD *)v65 + 1) = v67;
    v68 = v61[6];
    v69 = &v59[v68];
    v70 = &v60[v68];
    *(_QWORD *)v69 = *(_QWORD *)v70;
    v69[8] = v70[8];
    v71 = v61[7];
    v72 = &v59[v71];
    v73 = &v60[v71];
    v74 = a3;
    v75 = *((_QWORD *)v73 + 1);
    *(_QWORD *)v72 = *(_QWORD *)v73;
    *((_QWORD *)v72 + 1) = v75;
    v76 = *(void (**)(char *, _QWORD, uint64_t, int *))(v62 + 56);
    swift_bridgeObjectRetain();
    a3 = v74;
    swift_bridgeObjectRetain();
    v76(v59, 0, 1, v61);
  }
  v77 = a3[8];
  v78 = a3[9];
  v79 = a1 + v77;
  v80 = a2 + v77;
  *(_DWORD *)v79 = *(_DWORD *)v80;
  *(_BYTE *)(v79 + 4) = *(_BYTE *)(v80 + 4);
  v81 = a1 + v78;
  v82 = (uint64_t *)(a2 + v78);
  v83 = *(_QWORD *)(a2 + v78 + 8);
  if (v83 >> 60 == 15)
  {
    *(_OWORD *)v81 = *(_OWORD *)v82;
  }
  else
  {
    v84 = *v82;
    sub_1DBBEC4F4(*v82, v83);
    *(_QWORD *)v81 = v84;
    *(_QWORD *)(v81 + 8) = v83;
  }
  return a1;
}

uint64_t assignWithCopy for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void (*v27)(char *, _QWORD, uint64_t, int *);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int *v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, int *);
  int v35;
  int v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  int *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  void (*v80)(char *, _QWORD, uint64_t, int *);
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  int *v94;
  uint64_t v95;
  uint64_t (*v96)(char *, uint64_t, int *);
  int v97;
  int v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char v105;
  uint64_t v106;
  char *v107;
  char *v108;
  void (*v109)(char *, _QWORD, uint64_t, int *);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int *v113;
  int v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t *v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  int *v134;
  uint64_t v135;
  void (*v136)(uint64_t, uint64_t, uint64_t);
  uint64_t v137;

  v6 = sub_1DBBF7F7C();
  v137 = *(_QWORD *)(v6 - 8);
  v136 = *(void (**)(uint64_t, uint64_t, uint64_t))(v137 + 24);
  v136(a1, a2, v6);
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v8, v9, v6);
      v15 = v10[5];
      v16 = &v8[v15];
      v17 = &v9[v15];
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
      v18 = v10[6];
      v19 = &v8[v18];
      v20 = &v9[v18];
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
      v21 = v10[7];
      v22 = &v8[v21];
      v23 = &v9[v21];
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
      v24 = v10[8];
      v25 = &v8[v24];
      v26 = &v9[v24];
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
      v27 = *(void (**)(char *, _QWORD, uint64_t, int *))(v11 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_1DBBEC5C0((uint64_t)v8, type metadata accessor for ClientDeviceMetadata);
LABEL_6:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  v136((uint64_t)v8, (uint64_t)v9, v6);
  v48 = v10[5];
  v49 = &v8[v48];
  v50 = &v9[v48];
  *(_QWORD *)v49 = *(_QWORD *)v50;
  *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51 = v10[6];
  v52 = &v8[v51];
  v53 = &v9[v51];
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *((_QWORD *)v52 + 1) = *((_QWORD *)v53 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v54 = v10[7];
  v55 = &v8[v54];
  v56 = &v9[v54];
  *(_QWORD *)v55 = *(_QWORD *)v56;
  *((_QWORD *)v55 + 1) = *((_QWORD *)v56 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v57 = v10[8];
  v58 = &v8[v57];
  v59 = &v9[v57];
  *(_QWORD *)v58 = *(_QWORD *)v59;
  *((_QWORD *)v58 + 1) = *((_QWORD *)v59 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  v29 = a3[6];
  v30 = (char *)(a1 + v29);
  v31 = (char *)(a2 + v29);
  v32 = (int *)type metadata accessor for RequestDescription(0);
  v33 = *((_QWORD *)v32 - 1);
  v34 = *(uint64_t (**)(char *, uint64_t, int *))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  v135 = v6;
  if (!v35)
  {
    if (v36)
    {
      sub_1DBBEC5C0((uint64_t)v30, type metadata accessor for RequestDescription);
      goto LABEL_13;
    }
    v60 = a3;
    v136((uint64_t)v30, (uint64_t)v31, v6);
    v61 = v32[5];
    v62 = &v30[v61];
    v63 = &v31[v61];
    *(_QWORD *)v62 = *(_QWORD *)v63;
    *((_QWORD *)v62 + 1) = *((_QWORD *)v63 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v64 = v32[6];
    v65 = &v30[v64];
    v66 = &v31[v64];
    *(_QWORD *)v65 = *(_QWORD *)v66;
    *((_QWORD *)v65 + 1) = *((_QWORD *)v66 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v67 = v32[7];
    v68 = (uint64_t *)&v30[v67];
    v69 = (uint64_t *)&v31[v67];
    v70 = *(_QWORD *)&v31[v67 + 8];
    if (*(_QWORD *)&v30[v67 + 8] >> 60 == 15)
    {
      if (v70 >> 60 != 15)
      {
        v71 = *v69;
        sub_1DBBEC4F4(v71, v70);
        *v68 = v71;
        v68[1] = v70;
LABEL_24:
        v84 = v32[8];
        v85 = &v30[v84];
        v86 = &v31[v84];
        v87 = *(_QWORD *)v86;
        v85[8] = v86[8];
        *(_QWORD *)v85 = v87;
        v88 = v32[9];
        v89 = &v30[v88];
        v90 = &v31[v88];
        *(_QWORD *)v89 = *(_QWORD *)v90;
        *((_QWORD *)v89 + 1) = *((_QWORD *)v90 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a3 = v60;
        goto LABEL_25;
      }
    }
    else
    {
      if (v70 >> 60 != 15)
      {
        v81 = *v69;
        sub_1DBBEC4F4(v81, v70);
        v82 = *v68;
        v83 = v68[1];
        *v68 = v81;
        v68[1] = v70;
        sub_1DBBED624(v82, v83);
        goto LABEL_24;
      }
      sub_1DBBF4F10((uint64_t)v68);
    }
    *(_OWORD *)v68 = *(_OWORD *)v69;
    goto LABEL_24;
  }
  if (v36)
  {
LABEL_13:
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_25;
  }
  v134 = a3;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v30, v31, v6);
  v37 = v32[5];
  v38 = &v30[v37];
  v39 = &v31[v37];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
  v40 = v32[6];
  v41 = &v30[v40];
  v42 = &v31[v40];
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
  v43 = v32[7];
  v44 = &v30[v43];
  v45 = (uint64_t *)&v31[v43];
  v46 = *(_QWORD *)&v31[v43 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v46 >> 60 == 15)
  {
    *(_OWORD *)v44 = *(_OWORD *)v45;
  }
  else
  {
    v72 = *v45;
    sub_1DBBEC4F4(*v45, v46);
    *(_QWORD *)v44 = v72;
    *((_QWORD *)v44 + 1) = v46;
  }
  a3 = v134;
  v73 = v32[8];
  v74 = &v30[v73];
  v75 = &v31[v73];
  v76 = *(_QWORD *)v75;
  v74[8] = v75[8];
  *(_QWORD *)v74 = v76;
  v77 = v32[9];
  v78 = &v30[v77];
  v79 = &v31[v77];
  *(_QWORD *)v78 = *(_QWORD *)v79;
  *((_QWORD *)v78 + 1) = *((_QWORD *)v79 + 1);
  v80 = *(void (**)(char *, _QWORD, uint64_t, int *))(v33 + 56);
  swift_bridgeObjectRetain();
  v80(v30, 0, 1, v32);
LABEL_25:
  v91 = a3[7];
  v92 = (char *)(a1 + v91);
  v93 = (char *)(a2 + v91);
  v94 = (int *)type metadata accessor for FileDescription(0);
  v95 = *((_QWORD *)v94 - 1);
  v96 = *(uint64_t (**)(char *, uint64_t, int *))(v95 + 48);
  v97 = v96(v92, 1, v94);
  v98 = v96(v93, 1, v94);
  if (v97)
  {
    if (!v98)
    {
      (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v92, v93, v135);
      v99 = v94[5];
      v100 = &v92[v99];
      v101 = &v93[v99];
      *(_QWORD *)v100 = *(_QWORD *)v101;
      *((_QWORD *)v100 + 1) = *((_QWORD *)v101 + 1);
      v102 = v94[6];
      v103 = &v92[v102];
      v104 = &v93[v102];
      v105 = v104[8];
      *(_QWORD *)v103 = *(_QWORD *)v104;
      v103[8] = v105;
      v106 = v94[7];
      v107 = &v92[v106];
      v108 = &v93[v106];
      *(_QWORD *)v107 = *(_QWORD *)v108;
      *((_QWORD *)v107 + 1) = *((_QWORD *)v108 + 1);
      v109 = *(void (**)(char *, _QWORD, uint64_t, int *))(v95 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v109(v92, 0, 1, v94);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v98)
  {
    sub_1DBBEC5C0((uint64_t)v92, type metadata accessor for FileDescription);
LABEL_30:
    v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
    memcpy(v92, v93, *(_QWORD *)(*(_QWORD *)(v110 - 8) + 64));
    goto LABEL_31;
  }
  v136((uint64_t)v92, (uint64_t)v93, v135);
  v124 = v94[5];
  v125 = &v92[v124];
  v126 = &v93[v124];
  *(_QWORD *)v125 = *(_QWORD *)v126;
  *((_QWORD *)v125 + 1) = *((_QWORD *)v126 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v127 = v94[6];
  v128 = &v92[v127];
  v129 = &v93[v127];
  v130 = *(_QWORD *)v129;
  v128[8] = v129[8];
  *(_QWORD *)v128 = v130;
  v131 = v94[7];
  v132 = &v92[v131];
  v133 = &v93[v131];
  *(_QWORD *)v132 = *(_QWORD *)v133;
  *((_QWORD *)v132 + 1) = *((_QWORD *)v133 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_31:
  v111 = a3[8];
  v112 = a1 + v111;
  v113 = (int *)(a2 + v111);
  v114 = *v113;
  *(_BYTE *)(v112 + 4) = *((_BYTE *)v113 + 4);
  *(_DWORD *)v112 = v114;
  v115 = a3[9];
  v116 = (uint64_t *)(a1 + v115);
  v117 = (uint64_t *)(a2 + v115);
  v118 = *(_QWORD *)(a2 + v115 + 8);
  if (*(_QWORD *)(a1 + v115 + 8) >> 60 != 15)
  {
    if (v118 >> 60 != 15)
    {
      v120 = *v117;
      sub_1DBBEC4F4(v120, v118);
      v121 = *v116;
      v122 = v116[1];
      *v116 = v120;
      v116[1] = v118;
      sub_1DBBED624(v121, v122);
      return a1;
    }
    sub_1DBBF4F10((uint64_t)v116);
    goto LABEL_36;
  }
  if (v118 >> 60 == 15)
  {
LABEL_36:
    *(_OWORD *)v116 = *(_OWORD *)v117;
    return a1;
  }
  v119 = *v117;
  sub_1DBBEC4F4(v119, v118);
  *v116 = v119;
  v116[1] = v118;
  return a1;
}

uint64_t initializeWithTake for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = sub_1DBBF7F7C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
    *(_OWORD *)&v9[v11[6]] = *(_OWORD *)&v10[v11[6]];
    *(_OWORD *)&v9[v11[7]] = *(_OWORD *)&v10[v11[7]];
    *(_OWORD *)&v9[v11[8]] = *(_OWORD *)&v10[v11[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[6];
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  v17 = (int *)type metadata accessor for RequestDescription(0);
  v18 = *((_QWORD *)v17 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v15, (uint64_t)v16, v6);
    *(_OWORD *)&v15[v17[5]] = *(_OWORD *)&v16[v17[5]];
    *(_OWORD *)&v15[v17[6]] = *(_OWORD *)&v16[v17[6]];
    *(_OWORD *)&v15[v17[7]] = *(_OWORD *)&v16[v17[7]];
    v20 = v17[8];
    v21 = &v15[v20];
    v22 = &v16[v20];
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    *(_OWORD *)&v15[v17[9]] = *(_OWORD *)&v16[v17[9]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v18 + 56))(v15, 0, 1, v17);
  }
  v23 = a3[7];
  v24 = (char *)(a1 + v23);
  v25 = (char *)(a2 + v23);
  v26 = (int *)type metadata accessor for FileDescription(0);
  v27 = *((_QWORD *)v26 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v27 + 48))(v25, 1, v26))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v24, (uint64_t)v25, v6);
    *(_OWORD *)&v24[v26[5]] = *(_OWORD *)&v25[v26[5]];
    v29 = v26[6];
    v30 = &v24[v29];
    v31 = &v25[v29];
    *(_QWORD *)v30 = *(_QWORD *)v31;
    v30[8] = v31[8];
    *(_OWORD *)&v24[v26[7]] = *(_OWORD *)&v25[v26[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v27 + 56))(v24, 0, 1, v26);
  }
  v32 = a3[8];
  v33 = a3[9];
  v34 = a1 + v32;
  v35 = a2 + v32;
  *(_DWORD *)v34 = *(_DWORD *)v35;
  *(_BYTE *)(v34 + 4) = *(_BYTE *)(v35 + 4);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  return a1;
}

uint64_t assignWithTake for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, int *);
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int *v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, int *);
  int v34;
  int v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t, uint64_t);
  uint64_t v108;

  v6 = sub_1DBBF7F7C();
  v108 = *(_QWORD *)(v6 - 8);
  v107 = *(void (**)(uint64_t, uint64_t, uint64_t))(v108 + 40);
  v107(a1, a2, v6);
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v8, v9, v6);
      *(_OWORD *)&v8[v10[5]] = *(_OWORD *)&v9[v10[5]];
      *(_OWORD *)&v8[v10[6]] = *(_OWORD *)&v9[v10[6]];
      *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
      *(_OWORD *)&v8[v10[8]] = *(_OWORD *)&v9[v10[8]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_1DBBEC5C0((uint64_t)v8, type metadata accessor for ClientDeviceMetadata);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v107((uint64_t)v8, (uint64_t)v9, v6);
  v50 = v10[5];
  v51 = &v8[v50];
  v52 = &v9[v50];
  v54 = *(_QWORD *)v52;
  v53 = *((_QWORD *)v52 + 1);
  *(_QWORD *)v51 = v54;
  *((_QWORD *)v51 + 1) = v53;
  swift_bridgeObjectRelease();
  v55 = v10[6];
  v56 = &v8[v55];
  v57 = &v9[v55];
  v59 = *(_QWORD *)v57;
  v58 = *((_QWORD *)v57 + 1);
  *(_QWORD *)v56 = v59;
  *((_QWORD *)v56 + 1) = v58;
  swift_bridgeObjectRelease();
  v60 = v10[7];
  v61 = &v8[v60];
  v62 = &v9[v60];
  v64 = *(_QWORD *)v62;
  v63 = *((_QWORD *)v62 + 1);
  *(_QWORD *)v61 = v64;
  *((_QWORD *)v61 + 1) = v63;
  swift_bridgeObjectRelease();
  v65 = v10[8];
  v66 = &v8[v65];
  v67 = &v9[v65];
  v69 = *(_QWORD *)v67;
  v68 = *((_QWORD *)v67 + 1);
  *(_QWORD *)v66 = v69;
  *((_QWORD *)v66 + 1) = v68;
  swift_bridgeObjectRelease();
LABEL_7:
  v16 = a3[6];
  v17 = (char *)(a1 + v16);
  v18 = (char *)(a2 + v16);
  v19 = (int *)type metadata accessor for RequestDescription(0);
  v20 = *((_QWORD *)v19 - 1);
  v21 = *(uint64_t (**)(char *, uint64_t, int *))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v17, v18, v6);
      *(_OWORD *)&v17[v19[5]] = *(_OWORD *)&v18[v19[5]];
      *(_OWORD *)&v17[v19[6]] = *(_OWORD *)&v18[v19[6]];
      *(_OWORD *)&v17[v19[7]] = *(_OWORD *)&v18[v19[7]];
      v24 = v19[8];
      v25 = &v17[v24];
      v26 = &v18[v24];
      *(_QWORD *)v25 = *(_QWORD *)v26;
      v25[8] = v26[8];
      *(_OWORD *)&v17[v19[9]] = *(_OWORD *)&v18[v19[9]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    sub_1DBBEC5C0((uint64_t)v17, type metadata accessor for RequestDescription);
LABEL_12:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  v107((uint64_t)v17, (uint64_t)v18, v6);
  v70 = v19[5];
  v71 = &v17[v70];
  v72 = &v18[v70];
  v74 = *(_QWORD *)v72;
  v73 = *((_QWORD *)v72 + 1);
  *(_QWORD *)v71 = v74;
  *((_QWORD *)v71 + 1) = v73;
  swift_bridgeObjectRelease();
  v75 = v19[6];
  v76 = &v17[v75];
  v77 = &v18[v75];
  v79 = *(_QWORD *)v77;
  v78 = *((_QWORD *)v77 + 1);
  *(_QWORD *)v76 = v79;
  *((_QWORD *)v76 + 1) = v78;
  swift_bridgeObjectRelease();
  v80 = v19[7];
  v81 = (uint64_t *)&v17[v80];
  v82 = (uint64_t *)&v18[v80];
  v83 = *(_QWORD *)&v17[v80 + 8];
  if (v83 >> 60 != 15)
  {
    v84 = v82[1];
    if (v84 >> 60 != 15)
    {
      v98 = *v81;
      *v81 = *v82;
      v81[1] = v84;
      sub_1DBBED624(v98, v83);
      goto LABEL_32;
    }
    sub_1DBBF4F10((uint64_t)v81);
  }
  *(_OWORD *)v81 = *(_OWORD *)v82;
LABEL_32:
  v99 = v19[8];
  v100 = &v17[v99];
  v101 = &v18[v99];
  *(_QWORD *)v100 = *(_QWORD *)v101;
  v100[8] = v101[8];
  v102 = v19[9];
  v103 = &v17[v102];
  v104 = &v18[v102];
  v106 = *(_QWORD *)v104;
  v105 = *((_QWORD *)v104 + 1);
  *(_QWORD *)v103 = v106;
  *((_QWORD *)v103 + 1) = v105;
  swift_bridgeObjectRelease();
LABEL_13:
  v28 = a3[7];
  v29 = (char *)(a1 + v28);
  v30 = (char *)(a2 + v28);
  v31 = (int *)type metadata accessor for FileDescription(0);
  v32 = *((_QWORD *)v31 - 1);
  v33 = *(uint64_t (**)(char *, uint64_t, int *))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33(v30, 1, v31);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v29, v30, v6);
      *(_OWORD *)&v29[v31[5]] = *(_OWORD *)&v30[v31[5]];
      v36 = v31[6];
      v37 = &v29[v36];
      v38 = &v30[v36];
      *(_QWORD *)v37 = *(_QWORD *)v38;
      v37[8] = v38[8];
      *(_OWORD *)&v29[v31[7]] = *(_OWORD *)&v30[v31[7]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v32 + 56))(v29, 0, 1, v31);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v35)
  {
    sub_1DBBEC5C0((uint64_t)v29, type metadata accessor for FileDescription);
LABEL_18:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_19;
  }
  v107((uint64_t)v29, (uint64_t)v30, v6);
  v85 = v31[5];
  v86 = &v29[v85];
  v87 = &v30[v85];
  v89 = *(_QWORD *)v87;
  v88 = *((_QWORD *)v87 + 1);
  *(_QWORD *)v86 = v89;
  *((_QWORD *)v86 + 1) = v88;
  swift_bridgeObjectRelease();
  v90 = v31[6];
  v91 = &v29[v90];
  v92 = &v30[v90];
  *(_QWORD *)v91 = *(_QWORD *)v92;
  v91[8] = v92[8];
  v93 = v31[7];
  v94 = &v29[v93];
  v95 = &v30[v93];
  v97 = *(_QWORD *)v95;
  v96 = *((_QWORD *)v95 + 1);
  *(_QWORD *)v94 = v97;
  *((_QWORD *)v94 + 1) = v96;
  swift_bridgeObjectRelease();
LABEL_19:
  v40 = a3[8];
  v41 = a3[9];
  v42 = a1 + v40;
  v43 = a2 + v40;
  *(_DWORD *)v42 = *(_DWORD *)v43;
  *(_BYTE *)(v42 + 4) = *(_BYTE *)(v43 + 4);
  v44 = (uint64_t *)(a1 + v41);
  v45 = (uint64_t *)(a2 + v41);
  v46 = *(_QWORD *)(a1 + v41 + 8);
  if (v46 >> 60 != 15)
  {
    v47 = v45[1];
    if (v47 >> 60 != 15)
    {
      v48 = *v44;
      *v44 = *v45;
      v44[1] = v47;
      sub_1DBBED624(v48, v46);
      return a1;
    }
    sub_1DBBF4F10((uint64_t)v44);
  }
  *(_OWORD *)v44 = *(_OWORD *)v45;
  return a1;
}

uint64_t getEnumTagSinglePayload for RapidPayload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF6EC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  BOOL v18;
  unsigned int v19;

  v6 = sub_1DBBF7F7C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_9:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_9;
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  v12 = *(_QWORD *)(v15 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v15;
    v13 = a3[7];
    goto LABEL_9;
  }
  v17 = *(_QWORD *)(a1 + a3[9] + 8) >> 60;
  v18 = ((4 * (_DWORD)v17) & 0xC) == 0;
  v19 = ((4 * v17) & 0xC | (v17 >> 2)) ^ 0xF;
  if (v18)
    return 0;
  else
    return v19;
}

uint64_t storeEnumTagSinglePayload for RapidPayload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF6FDC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  v8 = sub_1DBBF7F7C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A390);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_9:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A388);
  v14 = *(_QWORD *)(v16 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v16;
    v15 = a4[6];
    goto LABEL_9;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1F030A380);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[7];
    goto LABEL_9;
  }
  v18 = (_QWORD *)(a1 + a4[9]);
  *v18 = 0;
  v18[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
  return result;
}

void sub_1DBBF70E4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_1DBBF7F7C();
  if (v0 <= 0x3F)
  {
    sub_1DBBF71E4(319, &qword_1F030A660, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
    if (v1 <= 0x3F)
    {
      sub_1DBBF71E4(319, &qword_1F030A668, (void (*)(uint64_t))type metadata accessor for RequestDescription);
      if (v2 <= 0x3F)
      {
        sub_1DBBF71E4(319, qword_1F030A670, (void (*)(uint64_t))type metadata accessor for FileDescription);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_1DBBF71E4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1DBBF80D8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for RapidPayloadReply(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _OWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBBF7F7C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (char *)a1 + v12;
    v14 = (_OWORD *)((char *)a2 + v12);
    v15 = *(_QWORD *)((char *)a2 + v12 + 8);
    swift_bridgeObjectRetain();
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)v13 = *v14;
    }
    else
    {
      v17 = *(_QWORD *)v14;
      sub_1DBBEC4F4(v17, v15);
      *(_QWORD *)v13 = v17;
      *((_QWORD *)v13 + 1) = v15;
    }
  }
  return a1;
}

uint64_t destroy for RapidPayloadReply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    return sub_1DBBED624(*v6, v7);
  return result;
}

uint64_t initializeWithCopy for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)(v13 + 8);
  swift_bridgeObjectRetain();
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    sub_1DBBEC4F4(v15, v14);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *(_QWORD *)(a2 + v10 + 8);
  if (*(_QWORD *)(a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      v15 = *v12;
      sub_1DBBEC4F4(v15, v13);
      v16 = *v11;
      v17 = v11[1];
      *v11 = v15;
      v11[1] = v13;
      sub_1DBBED624(v16, v17);
      return a1;
    }
    sub_1DBBF4F10((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    return a1;
  }
  v14 = *v12;
  sub_1DBBEC4F4(v14, v13);
  *v11 = v14;
  v11[1] = v13;
  return a1;
}

uint64_t initializeWithTake for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v6 = sub_1DBBF7F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *(_QWORD *)(a1 + v12 + 8);
  if (v15 >> 60 != 15)
  {
    v16 = v14[1];
    if (v16 >> 60 != 15)
    {
      v17 = *v13;
      *v13 = *v14;
      v13[1] = v16;
      sub_1DBBED624(v17, v15);
      return a1;
    }
    sub_1DBBF4F10((uint64_t)v13);
  }
  *(_OWORD *)v13 = *(_OWORD *)v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for RapidPayloadReply()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF7670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1DBBF7F7C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for RapidPayloadReply()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBBF7708(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1DBBF7F7C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t sub_1DBBF7784()
{
  return sub_1DBBF77A0();
}

uint64_t sub_1DBBF77A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DBBF7F7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void _deleteFileWithPath_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DBB92000, a2, a3, "ERROR: File %{public}@ is a directory", a5, a6, a7, a8, 2u);
}

void DRSConfirmDirectoryIsInitialized_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DBB92000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

uint64_t sub_1DBBF7EE0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1DBBF7EEC()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1DBBF7EF8()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1DBBF7F04()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DBBF7F10()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DBBF7F1C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DBBF7F28()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DBBF7F34()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DBBF7F40()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DBBF7F4C()
{
  return MEMORY[0x1E0D11158]();
}

uint64_t sub_1DBBF7F58()
{
  return MEMORY[0x1E0D11170]();
}

uint64_t sub_1DBBF7F64()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t sub_1DBBF7F7C()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t sub_1DBBF7F88()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t sub_1DBBF7F94()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t sub_1DBBF7FA0()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t sub_1DBBF7FAC()
{
  return MEMORY[0x1E0D3EAD0]();
}

uint64_t sub_1DBBF7FB8()
{
  return MEMORY[0x1E0D3EB10]();
}

uint64_t sub_1DBBF7FC4()
{
  return MEMORY[0x1E0D3EB88]();
}

uint64_t sub_1DBBF7FD0()
{
  return MEMORY[0x1E0D3EB98]();
}

uint64_t sub_1DBBF7FDC()
{
  return MEMORY[0x1E0D3EBA8]();
}

uint64_t sub_1DBBF7FE8()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t sub_1DBBF7FF4()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t sub_1DBBF8000()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t sub_1DBBF800C()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t sub_1DBBF8018()
{
  return MEMORY[0x1E0D3EC88]();
}

uint64_t sub_1DBBF8024()
{
  return MEMORY[0x1E0D3ECF8]();
}

uint64_t sub_1DBBF8030()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t sub_1DBBF803C()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t sub_1DBBF8048()
{
  return MEMORY[0x1E0D3ED70]();
}

uint64_t sub_1DBBF8054()
{
  return MEMORY[0x1E0D3ED78]();
}

uint64_t sub_1DBBF8060()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t sub_1DBBF806C()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1DBBF8078()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1DBBF8084()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1DBBF8090()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1DBBF809C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DBBF80A8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DBBF80B4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DBBF80C0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DBBF80CC()
{
  return MEMORY[0x1E0D111A8]();
}

uint64_t sub_1DBBF80D8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DBBF80E4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DBBF80F0()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DBBF80FC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DBBF8108()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DBBF8114()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

uint64_t DRConfigStringForState()
{
  return MEMORY[0x1E0D1D208]();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1E0D1BCD0]();
}

uint64_t GetProcessNameByPID()
{
  return MEMORY[0x1E0D1AE50]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1E0D1BD28]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C810C8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t tailspin_dump_output_with_options_sync()
{
  return MEMORY[0x1E0DE8B30]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E28](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1E0C86428]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1E0C86438]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1E0C86448]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1E0C86470]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1E0C86488]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

