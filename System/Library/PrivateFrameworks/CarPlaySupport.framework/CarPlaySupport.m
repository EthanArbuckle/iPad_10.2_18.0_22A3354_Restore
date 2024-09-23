id CPSSafeCast(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E3906C4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id CPSSafeCast_0(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id CPSSafeCast_1(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t _CPSUIPressesContainsPressTypes(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  uint64_t v16;
  int v17;
  _QWORD v18[8];
  id v19;
  _QWORD __b[8];
  id v21;
  id v22;
  id location;
  char v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, a1);
  v22 = 0;
  objc_storeStrong(&v22, a2);
  memset(__b, 0, sizeof(__b));
  v15 = location;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v16)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v16;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(v15);
      v21 = *(id *)(__b[1] + 8 * v12);
      memset(v18, 0, sizeof(v18));
      v8 = v22;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v18, v25, 16);
      if (v9)
      {
        v5 = *(_QWORD *)v18[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)v18[2] != v5)
            objc_enumerationMutation(v8);
          v19 = *(id *)(v18[1] + 8 * v6);
          v3 = objc_msgSend(v21, "type");
          if (v3 == objc_msgSend(v19, "integerValue"))
            break;
          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v18, v25, 16);
            if (!v7)
              goto LABEL_13;
          }
        }
        v24 = 1;
        v17 = 1;
      }
      else
      {
LABEL_13:
        v17 = 0;
      }

      if (v17)
        break;
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v13)
          goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v17 = 0;
  }

  if (!v17)
    v24 = 0;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  return v24 & 1;
}

id CPSSafeProtocolCast(void *a1, void *a2)
{
  id v4;
  id location;
  id v6;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  if ((objc_msgSend(v4, "conformsToProtocol:", location) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

id CPSSafeCast_2(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_2(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 2;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

id CPSSafeCast_3(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSNavigationTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSNavigationTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_1);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSNavigationTemplateClasses_classes;
}

id CPSAudioTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSAudioTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_245);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSAudioTemplateClasses_classes;
}

id CPSCommunicationTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSCommunicationTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_247);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSCommunicationTemplateClasses_classes;
}

id CPSChargingParkingTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSChargingParkingTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_248);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSChargingParkingTemplateClasses_classes;
}

id CPSQuickOrderingTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSQuickOrderingTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_250);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSQuickOrderingTemplateClasses_classes;
}

id CPSPublicSafetyTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSPublicSafetyTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_251);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSPublicSafetyTemplateClasses_classes;
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

id CPSFuelingTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSFuelingTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_252);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSFuelingTemplateClasses_classes;
}

id CPSDrivingTaskTemplateClasses()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSDrivingTaskTemplateClasses_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_253);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CPSDrivingTaskTemplateClasses_classes;
}

id CarPlaySupportGeneralLogging()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CarPlaySupportGeneralLogging_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CarPlaySupportGeneralLogging_facility;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

id CPSSafeCast_4(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E3B4CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
  uint64_t v18;

  _Block_object_dispose((const void *)(v18 - 64), 8);
  _Unwind_Resume(a1);
}

id CPSSafeProtocolCast_0(void *a1, void *a2)
{
  id v4;
  id location;
  id v6;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  if ((objc_msgSend(v4, "conformsToProtocol:", location) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

uint64_t CPGuidanceStateFromCPTripPauseReason(uint64_t a1)
{
  unsigned __int8 v2;

  if ((unint64_t)(a1 - 1) <= 4)
    __asm { BR              X8 }
  return v2;
}

__CFString *NSStringFromNavigationOwner(uint64_t a1)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("None");
    case 1:
      return CFSTR("iOS");
    case 2:
      v2 = CFSTR("Car");
      break;
  }
  return v2;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t _CPPanDirectionForPressType(unint64_t a1)
{
  if (a1 <= 3)
    __asm { BR              X8 }
  return 0;
}

id CPSSafeCast_5(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeCast_6(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeProtocolCast_1(void *a1, void *a2)
{
  id v4;
  id location;
  id v6;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  if ((objc_msgSend(v4, "conformsToProtocol:", location) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

id CPSSafeCast_7(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeCast_8(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeCast_9(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

BOOL UIEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9;

  v9 = 0;
  if (a2 == a6)
  {
    v9 = 0;
    if (a1 == a5)
    {
      v9 = 0;
      if (a4 == a8)
        return a3 == a7;
    }
  }
  return v9;
}

void sub_21E3D3C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,int a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id CPSSafeCast_10(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E3D64EC(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(_DWORD *)(v2 - 108) = a2;
  _Block_object_dispose((const void *)(v2 - 88), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 104));
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id CPSSafeCast_11(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_21E3D9760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  uint64_t v22;

  _Block_object_dispose((const void *)(v22 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_21E3D9B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  uint64_t v22;

  _Block_object_dispose((const void *)(v22 - 88), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromNavigationOwner_0(uint64_t a1)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("None");
    case 1:
      return CFSTR("iOS");
    case 2:
      v2 = CFSTR("Car");
      break;
  }
  return v2;
}

void sub_21E3F4068(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  *(_QWORD *)(v12 - 248) = a1;
  *(_DWORD *)(v12 - 252) = a2;
  objc_destroyWeak((id *)(v12 - 240));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 248));
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

id CPSSafeCast_12(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeCast_13(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E3F93C8(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  _Block_object_dispose((const void *)(v2 - 72), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id CarPlayFrameworkGeneralLogging()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CarPlayFrameworkGeneralLogging_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_9);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CarPlayFrameworkGeneralLogging_facility;
}

id CarPlayFrameworkACCNavLogging()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CarPlayFrameworkACCNavLogging_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)CarPlayFrameworkACCNavLogging_facility;
}

id CPSSafeCast_14(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E401768(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 48) = a1;
  *(_DWORD *)(v2 - 52) = a2;
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 48));
}

id CPSSafeCast_15(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeCast_16(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeProtocolCast_2(void *a1, void *a2)
{
  id v4;
  id location;
  id v6;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  if ((objc_msgSend(v4, "conformsToProtocol:", location) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

id CPSSafeCast_17(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E4082BC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, id *a13, id *location)
{
  uint64_t v14;

  *(_QWORD *)(v14 - 160) = a1;
  *(_DWORD *)(v14 - 164) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(*(_Unwind_Exception **)(v14 - 160));
}

id CPListItemIdentifier(id obj)
{
  id location;
  id v3;

  location = 0;
  objc_storeStrong(&location, obj);
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_255452538) & 1) != 0)
    v3 = (id)objc_msgSend(location, "identifier");
  else
    v3 = 0;
  objc_storeStrong(&location, 0);
  return v3;
}

void sub_21E40D1B8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t CPSCoordinateRegionContainsAnnotations(id obj, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obja;
  uint64_t v15;
  int v16;
  double v17;
  _QWORD __b[8];
  id v19;
  char v20;
  id location;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  location = 0;
  objc_storeStrong(&location, obj);
  v20 = 1;
  memset(__b, 0, sizeof(__b));
  obja = location;
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v15)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obja);
      v19 = *(id *)(__b[1] + 8 * v12);
      objc_msgSend(v19, "coordinate");
      v27 = v5;
      v28 = v6;
      v9 = 0;
      if (v6 >= -180.0)
      {
        v9 = 0;
        if (v28 <= 180.0)
        {
          v9 = 0;
          if (v27 >= -90.0)
            v9 = v27 <= 90.0;
        }
      }
      if (v9)
      {
        v30 = v22 - v5;
        v29 = v23 - v6;
        v17 = fabs(v23 - v6);
        v8 = 0;
        if (v24 / 2.0 >= fabs(v22 - v5))
          v8 = v25 / 2.0 >= v17;
        v20 = v8;
        if (!v8)
          break;
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (!v13)
          goto LABEL_16;
      }
    }
    v26 = 0;
    v16 = 1;
  }
  else
  {
LABEL_16:
    v16 = 0;
  }

  if (!v16)
    v26 = v20 & 1;
  objc_storeStrong(&location, 0);
  return v26 & 1;
}

CLLocationDegrees CPSCoordinateRegionForAnnotations(id obj)
{
  double v1;
  double v2;
  double v3;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obja;
  uint64_t v15;
  CLLocationCoordinate2D v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  _QWORD __b[8];
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id location;
  CLLocationCoordinate2D v28;
  __int128 v29;
  CLLocationCoordinate2D v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  CLLocationCoordinate2D v44;
  CLLocationCoordinate2D v45;
  __int128 v46;
  __int128 v47;
  CLLocationCoordinate2D v48;
  CLLocationCoordinate2D v49;
  __int128 v50;
  CLLocationCoordinate2D v51;
  __int128 v52;
  CLLocationCoordinate2D v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, obj);
  v26 = 90.0;
  v25 = -90.0;
  v24 = 180.0;
  v23 = -180.0;
  memset(__b, 0, sizeof(__b));
  obja = location;
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v15)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obja);
      v22 = *(id *)(__b[1] + 8 * v12);
      objc_msgSend(v22, "coordinate");
      v20 = v2;
      v31 = v2;
      v32 = v1;
      v3 = v1;
      v9 = 0;
      if (v1 >= -180.0)
      {
        v3 = v32;
        v9 = 0;
        if (v32 <= 180.0)
        {
          v3 = v31;
          v9 = 0;
          if (v31 >= -90.0)
          {
            v3 = v31;
            v9 = v31 <= 90.0;
          }
        }
      }
      if (v9)
      {
        if (v20 < v26)
          v26 = v20;
        if (v1 < v24)
          v24 = v1;
        if (v20 > v25)
          v25 = v20;
        v3 = v1;
        if (v1 > v23)
        {
          v3 = v1;
          v23 = v1;
        }
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v55, 16, v3);
        if (!v13)
          break;
      }
    }
  }

  v34 = v25 - v26;
  v19 = fabs(v25 - v26);
  if (v19 + 0.000002 <= 180.0)
    v19 = v19 + 0.000002;
  v33 = v23 - v24;
  v18 = fabs(v23 - v24);
  if (v18 + 0.000002 <= 360.0)
    v18 = v18 + 0.000002;
  v40 = v19;
  v39 = v18;
  v41 = v19;
  v42 = v18;
  *(double *)&v17 = v19;
  *((double *)&v17 + 1) = v18;
  v48 = CLLocationCoordinate2DMake(v25 - v19 / 2.0, v23 - v18 / 2.0);
  v47 = v17;
  v49 = v48;
  v50 = v17;
  v28 = v48;
  v29 = v17;
  v51 = v48;
  v52 = v17;
  v53 = v48;
  v8 = 0;
  if (v48.longitude >= -180.0)
  {
    v8 = 0;
    if (v53.longitude <= 180.0)
    {
      v8 = 0;
      if (v53.latitude >= -90.0)
        v8 = v53.latitude <= 90.0;
    }
  }
  v7 = 0;
  if (v8)
  {
    v54 = v52;
    v6 = 0;
    if (*(double *)&v52 >= 0.0)
    {
      v6 = 0;
      if (*(double *)&v54 <= 180.0)
      {
        v6 = 0;
        if (*((double *)&v54 + 1) >= 0.0)
          v6 = *((double *)&v54 + 1) <= 360.0;
      }
    }
    v7 = v6;
  }
  if (!v7)
  {
    v30 = v28;
    v5 = 0;
    if (v28.longitude >= -180.0)
    {
      v5 = 0;
      if (v30.longitude <= 180.0)
      {
        v5 = 0;
        if (v30.latitude >= -90.0)
          v5 = v30.latitude <= 90.0;
      }
    }
    if (v5)
      v16 = v28;
    else
      v16 = CLLocationCoordinate2DMake(0.0, 0.0);
    v36 = 0;
    v35 = 0;
    v37 = 0;
    v38 = 0;
    v44 = v16;
    v43 = 0uLL;
    v45 = v16;
    v46 = 0uLL;
    v28 = v16;
    v29 = 0uLL;
  }
  objc_storeStrong(&location, 0);
  return v28.latitude;
}

id CPSLabelColorForAlertAction(void *a1, char a2)
{
  double v2;
  unint64_t v4;
  id v5;
  char v6;
  id v7;
  BOOL v8;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  char v15;
  id location;
  id v17;

  location = 0;
  objc_storeStrong(&location, a1);
  v15 = a2 & 1;
  v10 = (id)objc_msgSend(location, "color");

  if (v10)
  {
    v14 = CPSBackgroundColorForAlertAction(location, v15 & 1);
    v7 = (id)objc_msgSend(location, "color");
    v12 = 0;
    v8 = 1;
    if ((objc_msgSend(v14, "isEqual:") & 1) == 0)
    {
      v13 = (id)objc_msgSend(location, "color");
      v12 = 1;
      CPContrastRatioForColors();
      v8 = v2 <= 7.0;
    }
    if ((v12 & 1) != 0)

    if (v8)
    {
      v11 = (id)CPContrastingColorForColor();
      v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v6 = objc_msgSend(v11, "isEqual:");

      if ((v6 & 1) != 0)
        v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_12);
      else
        v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_14);
      objc_storeStrong(&v11, 0);
    }
    else
    {
      v17 = (id)objc_msgSend(location, "color");
    }
    objc_storeStrong(&v14, 0);
  }
  else if ((v15 & 1) != 0)
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  }
  else
  {
    v4 = objc_msgSend(location, "style");
    if (v4 <= 1)
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    }
    else if (v4 == 2)
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    }
    else
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    }
  }
  objc_storeStrong(&location, 0);
  return v17;
}

id CPSBackgroundColorForAlertAction(void *a1, char a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  unint64_t v16;
  id v18;
  id v19;
  char v20;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v20 = a2 & 1;
  v19 = 0;
  v18 = (id)objc_msgSend(location, "color");

  if (v18)
  {
    v2 = (id)objc_msgSend(location, "color");
    v3 = v19;
    v19 = v2;

  }
  else
  {
    v16 = objc_msgSend(location, "style");
    if (v16 <= 1)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v5 = v19;
      v19 = v4;

    }
    else
    {
      if (v16 == 2)
        v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      else
        v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v7 = v19;
      v19 = v6;

    }
  }
  if ((v20 & 1) == 0)
  {
    v14 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "_carScreen");
    v13 = (id)objc_msgSend(v14, "traitCollection");
    v15 = objc_msgSend(v13, "userInterfaceStyle") == 2;

    v8 = 0.22;
    if (!v15)
      v8 = 0.12;
    v9 = (id)objc_msgSend(v19, "colorWithAlphaComponent:", v8);
    v10 = v19;
    v19 = v9;

  }
  v12 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v12;
}

BOOL CPSAlertUsesMinimalStyle(id obj)
{
  id v2;
  BOOL v3;
  char v4;
  id v5;
  id location;
  BOOL v7;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = (id)objc_msgSend(location, "primaryAction");
  v4 = 0;
  v3 = 0;
  if (objc_msgSend(v2, "style") == 1)
  {
    v5 = (id)objc_msgSend(location, "secondaryAction");
    v4 = 1;
    v3 = v5 == 0;
  }
  v7 = v3;
  if ((v4 & 1) != 0)

  objc_storeStrong(&location, 0);
  return v7;
}

uint64_t _pressesContainsPressType(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  uint64_t v10;
  int v11;
  _QWORD __b[8];
  id v13;
  uint64_t v14;
  id location;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, a1);
  v14 = a2;
  memset(__b, 0, sizeof(__b));
  v9 = location;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(v9);
      v13 = *(id *)(__b[1] + 8 * v6);
      v2 = objc_msgSend(v13, "type");
      if (v2 == v14)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v7)
          goto LABEL_9;
      }
    }
    v16 = 1;
    v11 = 1;
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  if (!v11)
    v16 = 0;
  objc_storeStrong(&location, 0);
  return v16 & 1;
}

id CPSFrameworkBundle()
{
  NSArray *v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v5 = -[NSArray objectAtIndex:](v1, "objectAtIndex:", 0);

  v2 = (id)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", v5);
  v4 = (id)objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/CarPlaySupport.framework"));

  v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  return v3;
}

id CPSImageNamedWithTraitCollection(void *a1, void *a2)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v9 = 0;
  objc_storeStrong(&v9, a2);
  v6 = (void *)MEMORY[0x24BDF6AC8];
  v5 = location;
  v7 = CPSFrameworkBundle();
  v8 = (id)objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, a1);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

BOOL CPSTraitCollectionSupportsFocus(id obj)
{
  id location;
  BOOL v3;

  location = 0;
  objc_storeStrong(&location, obj);
  v3 = objc_msgSend(location, "primaryInteractionModel") == 8 || (objc_msgSend(location, "interactionModel") & 2) != 0;
  objc_storeStrong(&location, 0);
  return v3;
}

id CPSLocalizedStringForKey(id obj)
{
  id v2;
  id v3;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = CPSFrameworkBundle();
  v3 = (id)objc_msgSend(v2, "localizedStringForKey:value:table:", location, &stru_24E271FF0, CFSTR("Localizable"));

  objc_storeStrong(&location, 0);
  return v3;
}

double CPSSizeForText(void *a1, void *a2, void *a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19[3];
  id v20;
  id location;
  double v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, a1);
  v20 = 0;
  objc_storeStrong(&v20, a2);
  v19[2] = *(id *)&a4;
  v19[1] = *(id *)&a5;
  v19[0] = 0;
  objc_storeStrong(v19, a3);
  v15 = location;
  CGSizeMake_12();
  v17 = v5;
  v18 = v6;
  v24 = *MEMORY[0x24BDF65F8];
  v25[0] = v20;
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, a1);
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 1, v17, v18);

  v22 = 0.0;
  v23 = 0;
  UICeilToScale();
  UICeilToScale();
  CGSizeMake_12();
  v22 = v7;
  v23 = v8;
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
  return v22;
}

double CPSSizeForAttributedText(void *a1, void *a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v13;
  id v14[3];
  id location;
  double v16;
  uint64_t v17;

  location = 0;
  objc_storeStrong(&location, a1);
  v14[2] = *(id *)&a3;
  v14[1] = *(id *)&a4;
  v14[0] = 0;
  objc_storeStrong(v14, a2);
  v13 = location;
  CGSizeMake_12();
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, v14[0], v4, v5, a1);
  v16 = 0.0;
  v17 = 0;
  UICeilToScale();
  UICeilToScale();
  CGSizeMake_12();
  v16 = v6;
  v17 = v7;
  objc_storeStrong(v14, 0);
  objc_storeStrong(&location, 0);
  return v16;
}

double CPSRectByApplyingUserInterfaceLayoutDirectionInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  id v10;
  uint64_t v11;
  _BYTE v12[32];
  _BYTE v13[32];
  double v14;

  *(double *)v13 = a1;
  *(double *)&v13[8] = a2;
  *(double *)&v13[16] = a3;
  *(double *)&v13[24] = a4;
  *(double *)v12 = a5;
  *(double *)&v12[8] = a6;
  *(double *)&v12[16] = a7;
  *(double *)&v12[24] = a8;
  v14 = a1;
  v10 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

  if (v11 == 1)
  {
    CGRectGetMaxX(*(CGRect *)v12);
    CGRectGetMinX(*(CGRect *)v13);
    CGRectGetWidth(*(CGRect *)v13);
    CGRectGetMinY(*(CGRect *)v13);
    CGRectGetWidth(*(CGRect *)v13);
    CGRectGetHeight(*(CGRect *)v13);
    CGRectMake_4();
    return v8;
  }
  return v14;
}

uint64_t CPSIsInternalInstall()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&CPSIsInternalInstall_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_13);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return CPSIsInternalInstall_isInternal & 1;
}

id _CPAppIdentifierFromTeamAppTuple(id obj)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  os_log_t v6;
  int v7;
  uint8_t *v8;
  os_log_t v9;
  int v10;
  uint8_t *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  int v16;
  uint8_t *v17;
  _BYTE v18[7];
  unsigned __int8 v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  unint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  os_log_type_t v28;
  id v29;
  int v30;
  id location;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[8];
  uint8_t v38[4];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, obj);
  if ((objc_msgSend(location, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
  {
    v32 = location;
    v30 = 1;
  }
  else
  {
    v1 = objc_msgSend(location, "length");
    if (v1 >= _CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 1)
    {
      v13 = _CPAppIdentifierFromTeamAppTuple_teamPrefixLength;
      v27 = &v5;
      v12 = (2 * _CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x24BDAC7A8]();
      v14 = (char *)&v5 - v12;
      v26 = v13;
      v3 = *(_QWORD *)(v2 + 1640);
      v34 = 0;
      v33 = v3;
      v35 = 0;
      v36 = v3;
      v24 = 0;
      v25 = v3;
      objc_msgSend(location, "getCharacters:range:");
      for (i = 0; i < _CPAppIdentifierFromTeamAppTuple_teamPrefixLength; ++i)
      {
        if (!isdigit(*(unsigned __int16 *)&v14[2 * i])
          && (*(unsigned __int16 *)&v14[2 * i] < 0x41u || *(unsigned __int16 *)&v14[2 * i] > 0x5Au))
        {
          v22 = CarPlaySupportGeneralLogging();
          v21 = 16;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
          {
            v9 = (os_log_t)v22;
            v10 = v21;
            v11 = v37;
            __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)location);
            _os_log_error_impl(&dword_21E389000, v9, (os_log_type_t)v10, "team prefix must only contain characters in [0-9,A-Z] (%@)", v11, 0xCu);
          }
          objc_storeStrong(&v22, 0);
          v32 = 0;
          v30 = 1;
          goto LABEL_21;
        }
      }
      if ((unsigned __int16)objc_msgSend(location, "characterAtIndex:", _CPAppIdentifierFromTeamAppTuple_teamPrefixLength) == 46)
      {
        v32 = (id)objc_msgSend(location, "substringFromIndex:", _CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 1);
        v30 = 1;
      }
      else
      {
        v20 = CarPlaySupportGeneralLogging();
        v19 = 16;
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
        {
          v6 = (os_log_t)v20;
          v7 = v19;
          v8 = v18;
          __os_log_helper_16_0_0(v18);
          _os_log_error_impl(&dword_21E389000, v6, (os_log_type_t)v7, "team prefix must be followed by a dot.", v8, 2u);
        }
        objc_storeStrong(&v20, 0);
        v32 = 0;
        v30 = 1;
      }
    }
    else
    {
      v29 = CarPlaySupportGeneralLogging();
      v28 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        v15 = v29;
        v16 = v28;
        v17 = v38;
        __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)location);
        _os_log_error_impl(&dword_21E389000, (os_log_t)v29, v28, "can't extract application ID from '%@'", v38, 0xCu);
      }
      objc_storeStrong(&v29, 0);
      v32 = 0;
      v30 = 1;
    }
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  return v32;
}

id CPSSafeCast_18(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

id CPSSafeCast_19(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSSafeProtocolCast_3(void *a1, void *a2)
{
  id v4;
  id location;
  id v6;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  if ((objc_msgSend(v4, "conformsToProtocol:", location) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

void sub_21E42116C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

double CGFloatMin(double a1, double a2)
{
  return fmin(a1, a2);
}

id insertNewLabelToStackView(id obj)
{
  id v2;
  id v3;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(location, "addArrangedSubview:", v3);
  v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);
  return v2;
}

id CPSSafeCast_20(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPListItemIdentifier_0(id obj)
{
  id location;
  id v3;

  location = 0;
  objc_storeStrong(&location, obj);
  if ((objc_msgSend(location, "conformsToProtocol:", &unk_255452538) & 1) != 0)
    v3 = (id)objc_msgSend(location, "identifier");
  else
    v3 = 0;
  objc_storeStrong(&location, 0);
  return v3;
}

double UIRectGetMaxY(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

double UIRectGetMinY(double a1, double a2)
{
  return a2;
}

id CPSSafeCast_21(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t _touchesContainIndirectTouch(id obj)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obja;
  uint64_t v7;
  int v8;
  _QWORD __b[8];
  id v10;
  id location;
  char v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location = 0;
  objc_storeStrong(&location, obj);
  memset(__b, 0, sizeof(__b));
  obja = location;
  v7 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v7)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v7;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obja);
      v10 = *(id *)(__b[1] + 8 * v4);
      if (objc_msgSend(v10, "type") == 1)
        break;
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v5)
          goto LABEL_9;
      }
    }
    v12 = 1;
    v8 = 1;
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  if (!v8)
    v12 = 0;
  objc_storeStrong(&location, 0);
  return v12 & 1;
}

id CPSSafeCast_22(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

id CPSPointsOfInterestMakeLabel(id obj)
{
  id v2;
  id v3;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setNumberOfLines:", 1);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "setAccessibilityValue:", location);
  v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);
  return v2;
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 0;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

BOOL UIEdgeInsetsEqualToEdgeInsets_0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9;

  v9 = 0;
  if (a2 == a6)
  {
    v9 = 0;
    if (a1 == a5)
    {
      v9 = 0;
      if (a4 == a8)
        return a3 == a7;
    }
  }
  return v9;
}

uint64_t __os_log_helper_16_2_5_8_64_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

id CPSSafeCast_23(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

void sub_21E444304(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 104) = a1;
  *(_DWORD *)(v11 - 108) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 104));
}

void sub_21E444678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,int a28,_Unwind_Exception *exception_object)
{
  uint64_t v29;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v29 - 80));
  _Unwind_Resume(a1);
}

void sub_21E446264(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  _Block_object_dispose((const void *)(v2 - 72), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_21E447B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,int a40,uint64_t a41)
{
  uint64_t v41;

  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromNavigationOwner_1(uint64_t a1)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("None");
    case 1:
      return CFSTR("iOS");
    case 2:
      v2 = CFSTR("Car");
      break;
  }
  return v2;
}

double CPSMaxCGFloat(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v9;
  unint64_t i;
  double *v12;
  double v13;

  v13 = 0.0;
  v12 = (double *)&a9;
  for (i = 0; i < a1; ++i)
  {
    v9 = *v12++;
    v13 = CGFloatMax(v13, v9);
  }
  return v13;
}

double UIRectGetMaxY_0(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

uint64_t __os_log_helper_16_2_3_8_0_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

double CGFloatMax(double a1, double a2)
{
  return fmax(a1, a2);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

BOOL barButtonStyle(id obj)
{
  uint64_t v2;
  id location;
  _BOOL8 v4;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = objc_msgSend(location, "buttonStyle");
  if (v2)
    v4 = v2 == 1;
  else
    v4 = 0;
  objc_storeStrong(&location, 0);
  return v4;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

id CPSSafeCast_24(void *a1, void *a2)
{
  id location[2];
  id v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = location[0];
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

id CPSPresentationRoundedDistance(id obj)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;
  double v35;
  double v36;
  char v37;
  id v38;
  id v39;
  id location[21];

  location[0] = 0;
  objc_storeStrong(location, obj);
  v39 = 0;
  v33 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v34 = objc_msgSend(v33, "usesMetricSystem");

  if ((v34 & 1) != 0)
  {
    v31 = location[0];
    v32 = (id)objc_msgSend(MEMORY[0x24BDD1928], "meters");
    v38 = (id)objc_msgSend(v31, "measurementByConvertingToUnit:");

    objc_msgSend(v38, "doubleValue");
    v37 = 0;
    v36 = 0.0;
    if (*(double *)&v1 < 1000.0)
    {
      v37 = 1;
      if (*(double *)&v1 <= 500.0)
      {
        if (*(double *)&v1 <= 100.0)
        {
          if (*(double *)&v1 <= 30.0)
          {
            if (*(double *)&v1 <= 5.0)
            {
              v36 = floor(*(double *)&v1);
            }
            else
            {
              location[12] = v1;
              location[11] = COERCE_ID(5.0);
              v36 = round(*(double *)&v1 / 5.0) * 5.0;
            }
          }
          else
          {
            location[14] = v1;
            location[13] = COERCE_ID(10.0);
            v36 = round(*(double *)&v1 / 10.0) * 10.0;
          }
        }
        else
        {
          location[16] = v1;
          location[15] = (id)0x4049000000000000;
          v36 = round(*(double *)&v1 / 50.0) * 50.0;
        }
      }
      else
      {
        location[18] = v1;
        location[17] = (id)0x4059000000000000;
        v36 = round(*(double *)&v1 / 100.0) * 100.0;
      }
    }
    if ((v37 & 1) != 0)
    {
      v29 = objc_alloc(MEMORY[0x24BDD1660]);
      v30 = (id)objc_msgSend(MEMORY[0x24BDD1928], "meters");
      v2 = (void *)objc_msgSend(v29, "initWithDoubleValue:unit:", v36);
      v3 = v39;
      v39 = v2;

    }
    else
    {
      v27 = location[0];
      v28 = (id)objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
      v4 = (id)objc_msgSend(v27, "measurementByConvertingToUnit:");
      v5 = v39;
      v39 = v4;

    }
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v23 = location[0];
    v25 = (id)objc_msgSend(MEMORY[0x24BDD1928], "feet");
    v24 = (id)objc_msgSend(v23, "measurementByConvertingToUnit:");
    objc_msgSend(v24, "doubleValue");
    v26 = v6;

    if (*(double *)&v26 < 1000.0)
    {
      if (*(double *)&v26 <= 500.0)
      {
        if (*(double *)&v26 <= 100.0)
        {
          if (*(double *)&v26 <= 30.0)
          {
            location[20] = v26;
            location[19] = COERCE_ID(5.0);
            v35 = floor(*(double *)&v26 / 5.0) * 5.0;
          }
          else
          {
            location[2] = v26;
            location[1] = COERCE_ID(10.0);
            v35 = round(*(double *)&v26 / 10.0) * 10.0;
          }
        }
        else
        {
          location[4] = v26;
          location[3] = (id)0x4049000000000000;
          v35 = round(*(double *)&v26 / 50.0) * 50.0;
        }
      }
      else
      {
        location[6] = v26;
        location[5] = (id)0x4059000000000000;
        v35 = round(*(double *)&v26 / 100.0) * 100.0;
      }
      v14 = objc_alloc(MEMORY[0x24BDD1660]);
      v15 = (id)objc_msgSend(MEMORY[0x24BDD1928], "feet");
      v10 = (void *)objc_msgSend(v14, "initWithDoubleValue:unit:", v35);
      v11 = v39;
      v39 = v10;

    }
    else
    {
      v19 = location[0];
      v21 = (id)objc_msgSend(MEMORY[0x24BDD1928], "miles");
      v20 = (id)objc_msgSend(v19, "measurementByConvertingToUnit:");
      objc_msgSend(v20, "doubleValue");
      v22 = v7;

      if (*(double *)&v22 < 1.0)
      {
        location[8] = v22;
        location[7] = (id)0x3FA999999999999ALL;
        v18 = round(*(double *)&v22 / 0.05) * 0.05;
      }
      else
      {
        location[10] = v22;
        location[9] = (id)0x3FB999999999999ALL;
        v18 = round(*(double *)&v22 / 0.1) * 0.1;
      }
      v16 = objc_alloc(MEMORY[0x24BDD1660]);
      v17 = (id)objc_msgSend(MEMORY[0x24BDD1928], "miles");
      v8 = (void *)objc_msgSend(v16, "initWithDoubleValue:unit:", v18);
      v9 = v39;
      v39 = v8;

    }
  }
  v13 = v39;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v13;
}

id CPSNumberFormatterForDistance(id obj)
{
  double v1;
  id v3;
  id v4;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(location, "doubleValue");
  if (v1 < 100.0)
    objc_msgSend(v4, "setMaximumFractionDigits:", 1);
  else
    objc_msgSend(v4, "setMaximumFractionDigits:", 0);
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return v3;
}

void CPSFormattedDistanceSepartedShortUnit(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v10 = 0;
  objc_storeStrong(&v10, a2);
  v9 = CPSNumberFormatterForDistance(location);
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location, "doubleValue");
  v4 = (id)objc_msgSend(v3, "numberWithDouble:");
  v8 = (id)objc_msgSend(v9, "stringFromNumber:");

  v7 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v7, "setUnitStyle:");
  objc_msgSend(v7, "setUnitOptions:", 1);
  v5 = (id)objc_msgSend(location, "unit");
  v6 = (id)objc_msgSend(v7, "stringFromUnit:");

  if (v10)
    (*((void (**)(id, id, id))v10 + 2))(v10, v8, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

id CPSFormattedDistanceWithMediumUnit(id obj)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v5 = objc_alloc_init(MEMORY[0x24BDD1668]);
  v2 = v5;
  v3 = CPSNumberFormatterForDistance(location);
  objc_msgSend(v2, "setNumberFormatter:");

  objc_msgSend(v5, "setUnitStyle:", 2);
  objc_msgSend(v5, "setUnitOptions:", 1);
  v4 = (id)objc_msgSend(v5, "stringFromMeasurement:", location);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

id CPSRequesterIdentifierForBundleIdentifier(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.CarPlayTemplateUIHost:%@"), location);
  objc_storeStrong(&location, 0);
  return v2;
}

id _CPSAlertBackgroundColorForAction(id obj)
{
  uint64_t v2;
  id location;
  id v4;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = objc_msgSend(location, "style");
  if (v2)
  {
    if (v2 == 1)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
      goto LABEL_8;
    }
    if (v2 == 2)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      goto LABEL_8;
    }
  }
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
LABEL_8:
  objc_storeStrong(&location, 0);
  return v4;
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BBE8]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x24BE0BBF8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPContrastRatioForColors()
{
  return MEMORY[0x24BDB7938]();
}

uint64_t CPContrastingColorForColor()
{
  return MEMORY[0x24BDB7940]();
}

uint64_t CPImageByScalingImageToSize()
{
  return MEMORY[0x24BDB7950]();
}

uint64_t CPUIImageCancelGlyph()
{
  return MEMORY[0x24BE152E8]();
}

uint64_t CPUIImageForTransportButton()
{
  return MEMORY[0x24BE152F0]();
}

uint64_t CPUIImagePanGlyph()
{
  return MEMORY[0x24BE152F8]();
}

uint64_t CPUIImageRecenterGlyph()
{
  return MEMORY[0x24BE15300]();
}

uint64_t CPUIImageStarRatingEmpty()
{
  return MEMORY[0x24BE15308]();
}

uint64_t CPUIImageStarRatingFull()
{
  return MEMORY[0x24BE15310]();
}

uint64_t CPUIImageStarRatingHalf()
{
  return MEMORY[0x24BE15318]();
}

uint64_t CPUIImageZoomInGlyph()
{
  return MEMORY[0x24BE15320]();
}

uint64_t CPUIImageZoomOutGlyph()
{
  return MEMORY[0x24BE15328]();
}

uint64_t CPUILocalizedStringForKey()
{
  return MEMORY[0x24BE15330]();
}

uint64_t CPUIPlaceholderTypeForBundleIdentifier()
{
  return MEMORY[0x24BE15338]();
}

uint64_t CPUIQuestionmarkGlyph()
{
  return MEMORY[0x24BE15348]();
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x24BDC4790](font, matrix, *(_QWORD *)&symTraitValue, *(_QWORD *)&symTraitMask, size);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
  MEMORY[0x24BDC49C0](frame, context);
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x24BDC49D0](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x24BDC49D8](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDC49F0](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x24BDC49F8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x24BDC4A00](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x24BDC4A08](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x24BDC4AE0](settings, settingCount);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKMapRectForCoordinateRegion()
{
  return MEMORY[0x24BDDAFB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6688](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment)
{
  return MEMORY[0x24BDF66B0](nsTextAlignment);
}

uint64_t UICeilToScale()
{
  return MEMORY[0x24BDF7610]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x24BDF76F0]();
}

uint64_t UIEdgeInsetsFromRectWithRect()
{
  return MEMORY[0x24BE153E8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BDF7CF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CPUIGlyphFactoryWithTraitCollection()
{
  return MEMORY[0x24BE153F0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double abs(long double __lcpp_x)
{
  long double result;

  MEMORY[0x24BDAD028](__lcpp_x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int isdigit(int _c)
{
  return MEMORY[0x24BDAE8E8](*(_QWORD *)&_c);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

