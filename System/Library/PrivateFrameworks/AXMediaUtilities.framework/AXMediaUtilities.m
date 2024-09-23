uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E12DA0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *OUTLINED_FUNCTION_2_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1, id *a2)
{
  return objc_msgSend(*a2, "count");
}

void OUTLINED_FUNCTION_3_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E12D94]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *std::vector<BOOL>::vector(_QWORD *a1, unint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  int v14;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, a2);
    v6 = *a3;
    v7 = a1[1];
    v8 = v7 + a2;
    a1[1] = v7 + a2;
    if (v7)
    {
      v9 = v8 - 1;
      if (((v8 - 1) ^ (v7 - 1)) < 0x40)
      {
LABEL_10:
        v13 = *a1 + 8 * (v7 >> 6);
        v14 = v7 & 0x3F;
        if (v6)
          std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v13, a2);
        else
          std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v13, a2);
        return a1;
      }
    }
    else
    {
      v9 = v8 - 1;
    }
    v10 = v9 >> 6;
    if (v8 >= 0x41)
      v11 = v10;
    else
      v11 = 0;
    *(_QWORD *)(*a1 + 8 * v11) = 0;
    goto LABEL_10;
  }
  return a1;
}

void sub_1B0E3F7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRPScreenRecorderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ReplayKitLibraryCore_frameworkLibrary)
  {
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ReplayKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RPScreenRecorder");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRPScreenRecorderClass_block_invoke_cold_1();
    free(v3);
  }
  getRPScreenRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNDetectHorizonRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectHorizonRequestClass_softClass;
  v7 = getVNDetectHorizonRequestClass_softClass;
  if (!getVNDetectHorizonRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectHorizonRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectHorizonRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4089C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNDetectHorizonRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary)
  {
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNDetectHorizonRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNDetectHorizonRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNDetectHorizonRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0E420DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E42340(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E42598(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E429E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E42CC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E42F94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E43268(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E434C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E4388C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E43CE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E441B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E44694(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E44A70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E44E44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E45298(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VisionLibrary()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_0)
    VisionLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_0;
  if (!VisionLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVNDetectFaceExpressionsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectFaceExpressionsRequestClass_softClass;
  v7 = getVNDetectFaceExpressionsRequestClass_softClass;
  if (!getVNDetectFaceExpressionsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceExpressionsRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectFaceExpressionsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E46A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCreateFaceprintRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNCreateFaceprintRequestClass_softClass;
  v7 = getVNCreateFaceprintRequestClass_softClass;
  if (!getVNCreateFaceprintRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNCreateFaceprintRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNCreateFaceprintRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E47134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNClassifyFaceAttributesRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNClassifyFaceAttributesRequestClass_softClass;
  v7 = getVNClassifyFaceAttributesRequestClass_softClass;
  if (!getVNClassifyFaceAttributesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNClassifyFaceAttributesRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNClassifyFaceAttributesRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E471EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFaceLandmarksRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectFaceLandmarksRequestClass_softClass;
  v7 = getVNDetectFaceLandmarksRequestClass_softClass;
  if (!getVNDetectFaceLandmarksRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceLandmarksRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectFaceLandmarksRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E472A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFacePoseRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectFacePoseRequestClass_softClass;
  v7 = getVNDetectFacePoseRequestClass_softClass;
  if (!getVNDetectFacePoseRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFacePoseRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectFacePoseRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4735C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFaceRectanglesRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectFaceRectanglesRequestClass_softClass;
  v7 = getVNDetectFaceRectanglesRequestClass_softClass;
  if (!getVNDetectFaceRectanglesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceRectanglesRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectFaceRectanglesRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E47414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNDetectFaceExpressionsRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNDetectFaceExpressionsRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceExpressionsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNDetectFaceExpressionsRequestClass_block_invoke_cold_1();
    VisionLibrary_0();
  }
}

void VisionLibrary_0()
{
  void *v0;

  if (!VisionLibraryCore_frameworkLibrary_1)
    VisionLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getVNCreateFaceprintRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_0();
  result = objc_getClass("VNCreateFaceprintRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNCreateFaceprintRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNCreateFaceprintRequestClass_block_invoke_cold_1();
    return (Class)__getVNClassifyFaceAttributesRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNClassifyFaceAttributesRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_0();
  result = objc_getClass("VNClassifyFaceAttributesRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNClassifyFaceAttributesRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFaceLandmarksRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFaceLandmarksRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_0();
  result = objc_getClass("VNDetectFaceLandmarksRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceLandmarksRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFacePoseRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFacePoseRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_0();
  result = objc_getClass("VNDetectFacePoseRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFacePoseRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNDetectFacePoseRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFaceRectanglesRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFaceRectanglesRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  VisionLibrary_0();
  result = objc_getClass("VNDetectFaceRectanglesRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceRectanglesRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1();
    return (Class)+[AXMImageAestheticsNode supportsSecureCoding](v3, v4);
  }
  return result;
}

id getVNClassifyImageAestheticsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNClassifyImageAestheticsRequestClass_softClass;
  v7 = getVNClassifyImageAestheticsRequestClass_softClass;
  if (!getVNClassifyImageAestheticsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNClassifyImageAestheticsRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNClassifyImageAestheticsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E484B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNClassifyImageAestheticsRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_2)
  {
    VisionLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNClassifyImageAestheticsRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNClassifyImageAestheticsRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNClassifyImageAestheticsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0E48874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0E4897C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0E48A74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E48D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{

  _Unwind_Resume(a1);
}

void sub_1B0E49028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p)
{
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B0E493B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0E49744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p)
{
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B0E49B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *__p)
{
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B0E4A3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *__p)
{
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B0E4A6F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E4A7A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E4AA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B0E4ABE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E625AB58, MEMORY[0x1E0DE42D0]);
}

void sub_1B0E4AD94(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

_QWORD *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void sub_1B0E4B2B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B0E4B4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0E4B754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E4B95C(_Unwind_Exception *a1)
{
  void *v1;

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

id getMLModelClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMLModelClass_softClass;
  v7 = getMLModelClass_softClass;
  if (!getMLModelClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMLModelClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getMLModelClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4CD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCoreMLModelClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNCoreMLModelClass_softClass;
  v7 = getVNCoreMLModelClass_softClass;
  if (!getVNCoreMLModelClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNCoreMLModelClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNCoreMLModelClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4CE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNClassificationObservationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNClassificationObservationClass_softClass;
  v7 = getVNClassificationObservationClass_softClass;
  if (!getVNClassificationObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNClassificationObservationClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNClassificationObservationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4D228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCoreMLRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNCoreMLRequestClass_softClass;
  v7 = getVNCoreMLRequestClass_softClass;
  if (!getVNCoreMLRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNCoreMLRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNCoreMLRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4D2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMLModelClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreMLLibraryCore_frameworkLibrary)
  {
    CoreMLLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreMLLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MLModel");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMLModelClass_block_invoke_cold_1();
    free(v3);
  }
  getMLModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getVNCoreMLModelClass_block_invoke(uint64_t a1)
{
  VisionLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNCoreMLModel");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNCoreMLModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNCoreMLModelClass_block_invoke_cold_1();
    VisionLibrary_1();
  }
}

void VisionLibrary_1()
{
  void *v0;

  if (!VisionLibraryCore_frameworkLibrary_3)
    VisionLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary_3)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getVNClassificationObservationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_1();
  result = objc_getClass("VNClassificationObservation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNClassificationObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNClassificationObservationClass_block_invoke_cold_1();
    return (Class)__getVNCoreMLRequestClass_block_invoke(v3);
  }
  return result;
}

void __getVNCoreMLRequestClass_block_invoke(uint64_t a1)
{
  AXMScreenCaptureNode *v2;
  SEL v3;

  VisionLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNCoreMLRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNCoreMLRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (AXMScreenCaptureNode *)__getVNCoreMLRequestClass_block_invoke_cold_1();
    -[AXMScreenCaptureNode nodeInitialize](v2, v3);
  }
}

void sub_1B0E4D710(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getVNImageScoreObservationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageScoreObservationClass_softClass;
  v7 = getVNImageScoreObservationClass_softClass;
  if (!getVNImageScoreObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageScoreObservationClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageScoreObservationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4DE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageBrightnessObservationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageBrightnessObservationClass_softClass;
  v7 = getVNImageBrightnessObservationClass_softClass;
  if (!getVNImageBrightnessObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageBrightnessObservationClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageBrightnessObservationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4DF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageBlurObservationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageBlurObservationClass_softClass;
  v7 = getVNImageBlurObservationClass_softClass;
  if (!getVNImageBlurObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageBlurObservationClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageBlurObservationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E4E000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E4E2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNImageScoreObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageScoreObservation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageScoreObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNImageScoreObservationClass_block_invoke_cold_1();
    VisionLibrary_2();
  }
}

void VisionLibrary_2()
{
  void *v0;

  if (!VisionLibraryCore_frameworkLibrary_4)
    VisionLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary_4)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getVNImageBrightnessObservationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_2();
  result = objc_getClass("VNImageBrightnessObservation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageBrightnessObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNImageBrightnessObservationClass_block_invoke_cold_1();
    return (Class)__getVNImageBlurObservationClass_block_invoke(v3);
  }
  return result;
}

Class __getVNImageBlurObservationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_2();
  result = objc_getClass("VNImageBlurObservation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageBlurObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNImageBlurObservationClass_block_invoke_cold_1();
    return (Class)__getVNImageBlurScoreRequestClass_block_invoke(v3);
  }
  return result;
}

AXMMobileAssetEvaluationNode *__getVNImageBlurScoreRequestClass_block_invoke(uint64_t a1)
{
  AXMMobileAssetEvaluationNode *result;
  AXMMobileAssetEvaluationNode *v3;
  SEL v4;
  id v5;

  VisionLibrary_2();
  result = (AXMMobileAssetEvaluationNode *)objc_getClass("VNImageBlurScoreRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageBlurScoreRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AXMMobileAssetEvaluationNode *)__getVNImageBlurScoreRequestClass_block_invoke_cold_1();
    return -[AXMMobileAssetEvaluationNode initWithIdentifier:](v3, v4, v5);
  }
  return result;
}

void sub_1B0E4E93C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0E4EAAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0E4F2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B0E4F808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
  }
  else
  {
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __kernel_morphmin_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelWithString:", CFSTR("kernel vec4 _morphmin (sampler i, float n, vec2 d) \n { \n vec2 dc = destCoord(); \n vec4 s = sample(i, samplerTransform(i, dc)); \n for (float x = -n; x <= n; x++) \n s = min(s, sample(i, samplerTransform(i, dc + d*x))); \n return s; \n } \n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernel_morphmin_singleton;
  kernel_morphmin_singleton = v0;

  return objc_msgSend((id)kernel_morphmin_singleton, "setCanReduceOutputChannels:", 1);
}

uint64_t __kernel_morphmax_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelWithString:", CFSTR("kernel vec4 _morphmax (sampler i, float n, vec2 d) \n { \n vec2 dc = destCoord(); \n vec4 s = sample(i, samplerTransform(i, dc)); \n for (float x = -n; x <= n; x++) \n s = max(s, sample(i, samplerTransform(i, dc + d*x))); \n return s; \n } \n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernel_morphmax_singleton;
  kernel_morphmax_singleton = v0;

  return objc_msgSend((id)kernel_morphmax_singleton, "setCanReduceOutputChannels:", 1);
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

void sub_1B0E56F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t VisionLibrary_3()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_5)
    VisionLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_5;
  if (!VisionLibraryCore_frameworkLibrary_5)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getVNImageRequestHandlerClass_block_invoke(uint64_t a1)
{
  VisionLibrary_3();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageRequestHandler");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNImageRequestHandlerClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_9();
  }
}

void sub_1B0E580E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E585B4(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B0E58D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21)
{

  _Unwind_Resume(a1);
}

void sub_1B0E59484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1B0E5998C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

Class ___ZL15getMLModelClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreMLLibraryCore(char **)::frameworkLibrary)
  {
    CoreMLLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!CoreMLLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MLModel");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMLModelClass_block_invoke_cold_1();
    free(v3);
  }
  getMLModelClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary(void)
{
  uint64_t v0;
  void *v2;

  if (!UIKitLibraryCore(char **)::frameworkLibrary)
    UIKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = UIKitLibraryCore(char **)::frameworkLibrary;
  if (!UIKitLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void ___ZL15getUIImageClassv_block_invoke(uint64_t a1)
{
  void ***v2;

  UIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIImage");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void ***)___ZL15getUIImageClassv_block_invoke_cold_1();
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](v2);
  }
}

void std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<NSString * {__strong}>::__vdeallocate(void **a1)
{
  char *v1;
  char *v3;
  void *v4;
  void *v5;

  v1 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 1);
        v3 -= 8;

      }
      while (v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t std::__split_buffer<NSString * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

__CFDictionary *ImageTools_fcssCreateIOSurfacePropertiesDictionary(int a1, int a2, int a3)
{
  int hasVXD;
  int v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  unsigned int v10;
  char v11;
  int v12;

  hasVXD = ImageTools_hasVXD();
  v7 = ImageTools_hasVXD();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v9 = Mutable;
  if (hasVXD)
  {
    if (v7)
      ImageTools_setIntValue(Mutable, (const void *)*MEMORY[0x1E0CBBF10], 1280);
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBC040], CFSTR("PurpleGfxMem"));
  }
  v10 = (a1 + 15) & 0xFFFFFFF0;
  if (a3 == 1111970369)
    v11 = 2;
  else
    v11 = 1;
  v12 = (v10 << v11) * ((a2 + 15) & 0xFFFFFFF0);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E0CBBF08], v10 << v11);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E0CBC1E0], a1);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E0CBC008], a2);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E0CBC070], a3);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E0CBBEE0], v12);
  return v9;
}

uint64_t ImageTools_hasVXD()
{
  uint64_t result;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  const __CFDictionary *v4;

  if (ImageTools_hasVXD_checked == 1)
    return ImageTools_hasVXD_hasSupport;
  v1 = *MEMORY[0x1E0CBBAA8];
  v2 = IOServiceMatching("AppleVXD375");
  MatchingService = IOServiceGetMatchingService(v1, v2);
  v4 = IOServiceMatching("AppleVXD390");
  result = (MatchingService | IOServiceGetMatchingService(v1, v4)) != 0;
  ImageTools_hasVXD_hasSupport = result;
  ImageTools_hasVXD_checked = 1;
  return result;
}

void ImageTools_setIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_1B0E5A9FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B0E5AC80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5ACCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5AD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E5AD70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5ADC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E5AE14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5AE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E5AEB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5AF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E5AF5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E5AFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id getVNImageRequestHandlerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageRequestHandlerClass_softClass_0;
  v7 = getVNImageRequestHandlerClass_softClass_0;
  if (!getVNImageRequestHandlerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageRequestHandlerClass_block_invoke_0;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageRequestHandlerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E5BAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

Class __getVNImageRequestHandlerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_6)
  {
    VisionLibraryCore_frameworkLibrary_6 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_6)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNImageRequestHandler");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNImageRequestHandlerClass_block_invoke_cold_1();
    free(v3);
  }
  getVNImageRequestHandlerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNRecognizeTextRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNRecognizeTextRequestClass_softClass;
  v7 = getVNRecognizeTextRequestClass_softClass;
  if (!getVNRecognizeTextRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeTextRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNRecognizeTextRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E5CC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizeTextRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_7)
  {
    VisionLibraryCore_frameworkLibrary_7 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_7)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNRecognizeTextRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNRecognizeTextRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0E5E5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
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

void sub_1B0E5EC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

void sub_1B0E600A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHPhotoLibraryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHPhotoLibraryClass_softClass;
  v7 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E60160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E6036C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHImageManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHImageManagerClass_softClass;
  v7 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHImageManagerClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getPHImageManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E60424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPhotoLibraryClass_block_invoke_cold_1();
    PhotosLibrary();
  }
}

void PhotosLibrary()
{
  void *v0;

  if (!PhotosLibraryCore_frameworkLibrary)
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosLibrary();
  result = objc_getClass("PHAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHAssetClass_block_invoke_cold_1();
    return (Class)__getPHImageManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosLibrary();
  result = objc_getClass("PHImageManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHImageManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHImageManagerClass_block_invoke_cold_1();
    return (Class)__getPHImageRequestOptionsClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageRequestOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  PhotosLibrary();
  result = objc_getClass("PHImageRequestOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHImageRequestOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getPHImageRequestOptionsClass_block_invoke_cold_1();
    return (Class)+[AXMADSREnvelope defaultEnvelope](v3, v4);
  }
  return result;
}

id getVNDetectRectanglesRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectRectanglesRequestClass_softClass;
  v7 = getVNDetectRectanglesRequestClass_softClass;
  if (!getVNDetectRectanglesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectRectanglesRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectRectanglesRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E60F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E61334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

Class __getVNDetectRectanglesRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  VisionLibrary_4();
  result = objc_getClass("VNDetectRectanglesRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectRectanglesRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNDetectRectanglesRequestClass_block_invoke_cold_1();
    return (Class)VisionLibrary_4();
  }
  return result;
}

uint64_t VisionLibrary_4()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_8)
    VisionLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_8;
  if (!VisionLibraryCore_frameworkLibrary_8)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void _AXMRGBToHSB(long double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;

  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    if (a4 >= a6)
      v9 = a6;
    else
      v9 = a4;
    v10 = a5 < a4 || a5 < a6;
    if (v10)
      v11 = a6;
    else
      v11 = a5;
    if (v10)
      v9 = v8;
  }
  else
  {
    if (a5 >= a6)
      v9 = a6;
    else
      v9 = a5;
    v11 = a4;
  }
  v12 = 0.0;
  if (v11 <= 0.0)
  {
    v14 = 0.0;
  }
  else
  {
    v13 = v11 - v9;
    v14 = (v11 - v9) / v11;
    if (v14 != 0.0)
    {
      v15 = (v11 - a5) / v13;
      v16 = (v11 - a6) / v13;
      if (v11 == a4)
      {
        if (v9 == a5)
          v12 = v16 + 5.0;
        else
          v12 = 1.0 - v15;
      }
      else
      {
        v17 = v11 == a5;
        v18 = (v11 - a4) / v13;
        if (v17)
        {
          if (v9 == a6)
            v12 = v18 + 1.0;
          else
            v12 = 3.0 - v16;
        }
        else if (v9 == a4)
        {
          v12 = v15 + 3.0;
        }
        else
        {
          v12 = 5.0 - v18;
        }
      }
    }
  }
  *a3 = v11;
  *a1 = fmod(v12 / 6.0, 1.0);
  *a2 = v14;
}

void _AXMHSBToRGB(double *a1, double *a2, double *a3, long double a4, double a5, double a6)
{
  long double v11;
  int v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v11 = fmod(a4, 1.0) * 6.0;
  v12 = (int)v11;
  v13 = v11 - (double)(int)v11;
  v14 = (1.0 - a5) * a6;
  v15 = (1.0 - a5 * v13) * a6;
  v16 = (1.0 - a5 * (1.0 - v13)) * a6;
  v17 = a6;
  v18 = v16;
  switch(v12)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v17 = v15;
      v18 = a6;
      goto LABEL_8;
    case 2:
      v17 = (1.0 - a5) * a6;
      v18 = a6;
      v14 = v16;
      goto LABEL_8;
    case 3:
      v17 = (1.0 - a5) * a6;
      v18 = v15;
      goto LABEL_6;
    case 4:
      v17 = v16;
      v18 = (1.0 - a5) * a6;
LABEL_6:
      v14 = a6;
      goto LABEL_8;
    case 5:
      v17 = a6;
      v18 = (1.0 - a5) * a6;
      v14 = v15;
LABEL_8:
      *a1 = v17;
      *a2 = v18;
      *a3 = v14;
      break;
    default:
      return;
  }
}

void sub_1B0E63628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E637C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E6388C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E63950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E63C38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E63D2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E64DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v13 - 136));
  _Unwind_Resume(a1);
}

void sub_1B0E64E48()
{
  JUMPOUT(0x1B0E64E2CLL);
}

void sub_1B0E64E58()
{
  JUMPOUT(0x1B0E64E34);
}

void sub_1B0E64E64()
{
  JUMPOUT(0x1B0E64E38);
}

void sub_1B0E65978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E65B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E65B84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E65C0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<CGImage>::shared_ptr[abi:ne180100]<CGImage,void (*)(CGImage*),void>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  *a1 = a2;
  v6 = (_QWORD *)operator new();
  *v6 = &unk_1E625BAD8;
  v6[1] = 0;
  v6[2] = 0;
  v6[3] = a2;
  v6[4] = a3;
  a1[1] = v6;
  return a1;
}

void sub_1B0E65CA8(void *a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  __cxa_begin_catch(a1);
  v1(v2);
  __cxa_rethrow();
}

void sub_1B0E65CBC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1B5E1250CLL);
}

uint64_t std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else
    return 0;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void sub_1B0E65E54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E65FD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E6609C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E661CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E66264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E662D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E66894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v17 - 96), 8);
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

id get_LTTranslatorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_LTTranslatorClass_softClass;
  v7 = get_LTTranslatorClass_softClass;
  if (!get_LTTranslatorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_LTTranslatorClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __get_LTTranslatorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E669BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E67724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E681E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E685AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void TranslationLibrary()
{
  void *v0;

  if (!TranslationLibraryCore_frameworkLibrary)
    TranslationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!TranslationLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_1B0E6BAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1B0E6D25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void __72__iconclassification_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  iconclassification *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[iconclassification initWithMLModel:]([iconclassification alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1B0E6F1B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E6F54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0E6F634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id getPFSceneTaxonomyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPFSceneTaxonomyClass_softClass;
  v7 = getPFSceneTaxonomyClass_softClass;
  if (!getPFSceneTaxonomyClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPFSceneTaxonomyClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getPFSceneTaxonomyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E6FD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E70354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E70980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E70DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFSceneTaxonomyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PhotosFormatsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PFSceneTaxonomy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPFSceneTaxonomyClass_block_invoke_cold_1();
    free(v3);
  }
  getPFSceneTaxonomyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNVYvzEtX1JlUdu8xx5qhDIClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass;
  v7 = getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass;
  if (!getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E71254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke(uint64_t a1)
{
  Class result;

  VisionLibrary_5();
  result = objc_getClass("VNVYvzEtX1JlUdu8xx5qhDI");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke_cold_1();
    return (Class)VisionLibrary_5();
  }
  return result;
}

uint64_t VisionLibrary_5()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_9)
    VisionLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_9;
  if (!VisionLibraryCore_frameworkLibrary_9)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

double AXMTransformedNormalizedFrame(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  CGAffineTransform v14;

  v6 = a1 - 2;
  if ((unint64_t)(a1 - 2) > 2)
  {
    v9 = 1.0;
    v7 = 0.0;
    v8 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    if (!a2)
      goto LABEL_3;
  }
  else
  {
    v7 = dbl_1B0EFFB78[v6];
    v8 = dbl_1B0EFFB90[v6];
    v9 = dbl_1B0EFFBA8[v6];
    v10 = dbl_1B0EFFBC0[v6];
    v11 = dbl_1B0EFFBD8[v6];
    if (!a2)
    {
LABEL_3:
      v12 = v9;
      goto LABEL_14;
    }
  }
  if ((unint64_t)(a1 - 3) <= 1)
    v12 = v9;
  else
    v12 = -v9;
  if ((unint64_t)(a1 - 3) > 1)
    v7 = -v7;
  else
    v9 = -v9;
  if ((unint64_t)(a1 - 3) > 1)
  {
    v11 = 1.0 - v11;
  }
  else
  {
    v8 = -v8;
    v10 = 1.0 - v10;
  }
LABEL_14:
  v14.a = v9;
  v14.b = v7;
  v14.c = v8;
  v14.d = v12;
  v14.tx = v10;
  v14.ty = v11;
  *(_QWORD *)&result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a3, &v14);
  return result;
}

uint64_t AXMNormalizedFrameTransform@<X0>(uint64_t result@<X0>, int a2@<W1>, double *a3@<X8>)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = result - 2;
  if ((unint64_t)(result - 2) > 2)
  {
    v6 = 1.0;
    v4 = 0.0;
    v5 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if (!a2)
      goto LABEL_3;
  }
  else
  {
    v4 = dbl_1B0EFFB78[v3];
    v5 = dbl_1B0EFFB90[v3];
    v6 = dbl_1B0EFFBA8[v3];
    v7 = dbl_1B0EFFBC0[v3];
    v8 = dbl_1B0EFFBD8[v3];
    if (!a2)
    {
LABEL_3:
      v9 = v6;
      goto LABEL_14;
    }
  }
  if ((unint64_t)(result - 3) <= 1)
    v9 = v6;
  else
    v9 = -v6;
  if ((unint64_t)(result - 3) > 1)
    v4 = -v4;
  else
    v6 = -v6;
  if ((unint64_t)(result - 3) > 1)
  {
    v8 = 1.0 - v8;
  }
  else
  {
    v5 = -v5;
    v7 = 1.0 - v7;
  }
LABEL_14:
  *a3 = v6;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v9;
  a3[4] = v7;
  a3[5] = v8;
  return result;
}

uint64_t AXMEXIFOrientationFromInterfaceOrientation(uint64_t a1, int a2)
{
  BOOL v2;
  unsigned int v3;
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 1:
      v2 = a2 == 0;
      v3 = 5;
      goto LABEL_9;
    case 2:
      v2 = a2 == 0;
      v3 = 7;
      goto LABEL_9;
    case 3:
      if (a2)
        return 4;
      else
        return 1;
    case 4:
      v2 = a2 == 0;
      v3 = 2;
LABEL_9:
      if (v2)
        result = v3 + 1;
      else
        result = v3;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

void sub_1B0E71D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSequenceRequestHandlerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_10)
  {
    VisionLibraryCore_frameworkLibrary_10 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_10)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNSequenceRequestHandler");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNSequenceRequestHandlerClass_block_invoke_cold_1();
    free(v3);
  }
  getVNSequenceRequestHandlerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNRecognizeObjectsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNRecognizeObjectsRequestClass_softClass;
  v7 = getVNRecognizeObjectsRequestClass_softClass;
  if (!getVNRecognizeObjectsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeObjectsRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNRecognizeObjectsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E720B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizeObjectsRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_11)
  {
    VisionLibraryCore_frameworkLibrary_11 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_11)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNRecognizeObjectsRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNRecognizeObjectsRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNRecognizeObjectsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0E727A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B0E7288C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E728FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E7296C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E72AD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E72FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0E734D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E73938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B0E73AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E73D40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E73FE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E74348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1B0E7443C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E75A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42)
{

  _Unwind_Resume(a1);
}

void sub_1B0E75FC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Class ___ZL30getVNRecognizeTextRequestClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore(char **)::frameworkLibrary)
  {
    VisionLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!VisionLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNRecognizeTextRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNRecognizeTextRequestClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNImageRequestHandlerClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageRequestHandlerClass_softClass_1;
  v7 = getVNImageRequestHandlerClass_softClass_1;
  if (!getVNImageRequestHandlerClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageRequestHandlerClass_block_invoke_1;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageRequestHandlerClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E7BC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectContoursRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNDetectContoursRequestClass_softClass;
  v7 = getVNDetectContoursRequestClass_softClass;
  if (!getVNDetectContoursRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectContoursRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNDetectContoursRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E7BD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNRecognizeTextRequestClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNRecognizeTextRequestClass_softClass_0;
  v7 = getVNRecognizeTextRequestClass_softClass_0;
  if (!getVNRecognizeTextRequestClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeTextRequestClass_block_invoke_0;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNRecognizeTextRequestClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E7CB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNImageRequestHandlerClass_block_invoke_1(uint64_t a1)
{
  VisionLibrary_6();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageRequestHandler");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNImageRequestHandlerClass_block_invoke_cold_1();
    VisionLibrary_6();
  }
}

void VisionLibrary_6()
{
  void *v0;

  if (!VisionLibraryCore_frameworkLibrary_12)
    VisionLibraryCore_frameworkLibrary_12 = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary_12)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getVNDetectContoursRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  VisionLibrary_6();
  result = objc_getClass("VNDetectContoursRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDetectContoursRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVNDetectContoursRequestClass_block_invoke_cold_1();
    return (Class)__getVNRecognizeTextRequestClass_block_invoke_0(v3);
  }
  return result;
}

void __getVNRecognizeTextRequestClass_block_invoke_0(uint64_t a1)
{
  AXMImageRegistrationNode *v2;
  SEL v3;

  VisionLibrary_6();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNRecognizeTextRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNRecognizeTextRequestClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (AXMImageRegistrationNode *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
    -[AXMImageRegistrationNode nodeInitialize](v2, v3);
  }
}

id getVNTranslationalImageRegistrationRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNTranslationalImageRegistrationRequestClass_softClass;
  v7 = getVNTranslationalImageRegistrationRequestClass_softClass;
  if (!getVNTranslationalImageRegistrationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNTranslationalImageRegistrationRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNTranslationalImageRegistrationRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E8214C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageTranslationAlignmentObservationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNImageTranslationAlignmentObservationClass_softClass;
  v7 = getVNImageTranslationAlignmentObservationClass_softClass;
  if (!getVNImageTranslationAlignmentObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNImageTranslationAlignmentObservationClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNImageTranslationAlignmentObservationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E82204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNTranslationalImageRegistrationRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_7();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNTranslationalImageRegistrationRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNTranslationalImageRegistrationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  }
  else
  {
    __getVNTranslationalImageRegistrationRequestClass_block_invoke_cold_1();
    VisionLibrary_7();
  }
}

void VisionLibrary_7()
{
  void *v0;

  if (!VisionLibraryCore_frameworkLibrary_13)
    VisionLibraryCore_frameworkLibrary_13 = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary_13)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getVNImageTranslationAlignmentObservationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  VisionLibrary_7();
  result = objc_getClass("VNImageTranslationAlignmentObservation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageTranslationAlignmentObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1();
    return (Class)+[AXMCameraMetadataNode supportsSecureCoding](v3, v4);
  }
  return result;
}

void sub_1B0E832B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E833E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0E83724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1B0E83800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E838E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B0E83980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E839FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E83CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83DC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E83E78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E83F14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E83FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E84000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E8404C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E84094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E840E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E84134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E8417C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E841C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E84210(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E8425C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E842A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E8432C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E84E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_1B0E8662C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B0E86900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B0E869C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86A68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E86B20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E86BD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E86C90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E86D48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E86F24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E86F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E87004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E871AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E876BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B0E87884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

BOOL AXMIsContainedBy(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double width;
  double height;
  BOOL IsNull;
  _BOOL8 result;
  CGRect v23;

  v23 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  width = v23.size.width;
  height = v23.size.height;
  IsNull = CGRectIsNull(v23);
  result = 0;
  if (!IsNull && width > 0.0 && height > 0.0)
    return width * height / (a7 * a8) >= a9;
  return result;
}

void AXMIntersectionOverUnion(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v16;
  CGRect v17;

  CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  CGRectUnion(v16, v17);
}

double AXMDistanceBetweenCenters(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX;
  double MinY;
  double v17;
  double v18;
  CGFloat MaxY;
  double v21;
  double v22;
  double v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  v22 = (MinX + CGRectGetMaxX(v25)) * 0.5;
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  v21 = CGRectGetMinX(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  v23 = v22 - (v21 + CGRectGetMaxX(v27)) * 0.5;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  MinY = CGRectGetMinY(v28);
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  v17 = (MinY + CGRectGetMaxY(v29)) * 0.5;
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  v18 = CGRectGetMinY(v30);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  MaxY = CGRectGetMaxY(v31);
  return sqrt(v23 * v23 + (v17 - (v18 + MaxY) * 0.5) * (v17 - (v18 + MaxY) * 0.5));
}

void AXMRatioOfIntersectedAreaToSmallerRectArea(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
}

void sub_1B0E927C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E9294C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E929D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E92A58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E93284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E94BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E95A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getVNCreateSceneprintRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNCreateSceneprintRequestClass_softClass;
  v7 = getVNCreateSceneprintRequestClass_softClass;
  if (!getVNCreateSceneprintRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNCreateSceneprintRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNCreateSceneprintRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0E95C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNCreateSceneprintRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_14)
  {
    VisionLibraryCore_frameworkLibrary_14 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_14)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNCreateSceneprintRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNCreateSceneprintRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNCreateSceneprintRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0E964E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0E96AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void __getMADVIDocumentRecognitionResultClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADVIDocumentRecognitionResult");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVIDocumentRecognitionResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVIDocumentRecognitionResultClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary();
  }
}

void MediaAnalysisServicesLibrary()
{
  void *v0;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

AXMSynthOscillatorParameters *__getMADVIDocumentRecognitionRequestClass_block_invoke(uint64_t a1)
{
  AXMSynthOscillatorParameters *result;
  AXMSynthOscillatorParameters *v3;
  SEL v4;

  MediaAnalysisServicesLibrary();
  result = (AXMSynthOscillatorParameters *)objc_getClass("MADVIDocumentRecognitionRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVIDocumentRecognitionRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AXMSynthOscillatorParameters *)__getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1();
    return -[AXMSynthOscillatorParameters init](v3, v4);
  }
  return result;
}

void sub_1B0E974FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E97600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0E97730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1B0E9777C()
{
  JUMPOUT(0x1B0E9776CLL);
}

void sub_1B0E97804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E978AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E97978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E979E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E97A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E97B30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E97B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E97C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97CC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E97D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E97DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97E24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E97E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E97F88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B0E980AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E981C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E987A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void sub_1B0E98A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E98B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E98B70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E98C18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E98D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E98D68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E992DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E99530(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E99734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9999C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E99BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);

  _Block_object_dispose((const void *)(v30 - 104), 8);
  objc_destroyWeak((id *)(v30 - 56));
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

void sub_1B0E9A140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E9A368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B0E9A3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E9A4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E9A53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9A768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9A9A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9AD50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9AEA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9B0B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9B16C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9B220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9BC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0E9C0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9C1AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9C3AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9C4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E9C6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0E9C980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9CAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9CBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9CCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9CE20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9CFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B0E9D8E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9DAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9DBB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9DC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0E9DCB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9E040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0E9E328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0E9E428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9E534(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9E640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9E758(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9E858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9EA40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0E9EAC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0E9EB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0E9EF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0E9F110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1B0EA5D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B0EA5DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EA5E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0EA5EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0EA5F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EA6000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0EA61A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EA6330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EA6488(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EA665C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0EA67B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EA68E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EA6A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EA6C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t UIAccessibilityIsImageScreenshot(void *a1)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  double v20;
  int v21;
  int v22;

  v1 = a1;
  v2 = v1;
  if (v1 && (v3 = CGImageSourceCreateWithURL(v1, 0)) != 0)
  {
    v4 = v3;
    v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBD028]);
    v6 = objc_claimAutoreleasedReturnValue();

    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBD040]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBD048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(getUIScreenClass(), "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    objc_msgSend(getUIScreenClass(), "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;

    if (v6)
    {
      v19 = v18;
      v20 = v19;
      v21 = (int)(v15 * v20);
      v22 = (int)(v13 * v20);
      v6 = v8 == v21 && v10 == v22 || v8 == v22 && v10 == v21;
    }
    CFRelease(v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id getUIScreenClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUIScreenClass_softClass;
  v7 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUIScreenClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getUIScreenClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EA7BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UIAccessibilityMetadataDescriptionForVideo(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commonMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v2, *MEMORY[0x1E0C8A898], *MEMORY[0x1E0C8A9D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void _removeMetadataDescriptionItems(void *a1)
{
  void *v1;
  unint64_t v2;
  void *v3;
  id v4;

  v4 = a1;
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObject:", v3);

      ++v2;
    }
    while (objc_msgSend(v1, "count") > v2);
  }

}

uint64_t UIAccessibilityAddMetadataDescriptionToVideo(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  dispatch_semaphore_t v61;

  v3 = a1;
  v4 = (void *)MEMORY[0x1E0C8AF90];
  v5 = a2;
  objc_msgSend(v4, "assetWithURL:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:", v6, *MEMORY[0x1E0C89E98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supportedFileTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOutputFileType:", v9);

  objc_msgSend(v3, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR("axout-tmp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("MOV"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOutputURL:", v14);
  objc_msgSend(v6, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "mutableCopy");

  if (!v16)
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _removeMetadataDescriptionItems(v16);
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setKeySpace:", *MEMORY[0x1E0C8A9D0]);
  objc_msgSend(v17, "setKey:", *MEMORY[0x1E0C8A898]);
  objc_msgSend(v17, "setValue:", v5);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocale:", v18);

  objc_msgSend(v16, "addObject:", v17);
  objc_msgSend(v7, "setMetadata:", v16);
  v19 = dispatch_semaphore_create(0);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __UIAccessibilityAddMetadataDescriptionToVideo_block_invoke;
  v59[3] = &unk_1E625CB18;
  v20 = v7;
  v60 = v20;
  v61 = v19;
  v21 = v19;
  objc_msgSend(v20, "exportAsynchronouslyWithCompletionHandler:", v59);
  v22 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v21, v22);

  if (objc_msgSend(v20, "status") != 3)
  {
    v36 = 0;
    goto LABEL_12;
  }
  v55 = v13;
  objc_msgSend(v3, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingString:", CFSTR("-axtmp"));
  v24 = objc_claimAutoreleasedReturnValue();

  v54 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v26, "moveItemAtURL:toURL:error:", v3, v25, &v58);
  v27 = v58;

  if (v27)
  {
    AXMediaLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      UIAccessibilityAddMetadataDescriptionToVideo_cold_3((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
    v35 = v54;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v38, "moveItemAtURL:toURL:error:", v14, v3, &v57);
    v39 = v57;

    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeItemAtURL:error:", v25, 0);
      v36 = 1;
      v35 = v54;
      goto LABEL_9;
    }
    AXMediaLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      UIAccessibilityAddMetadataDescriptionToVideo_cold_2((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v39;
    objc_msgSend(v47, "moveItemAtURL:toURL:error:", v25, v3, &v56);
    v27 = v56;

    if (!v27)
    {
      v36 = 0;
      v35 = v54;
      v13 = v55;
      goto LABEL_10;
    }
    AXMediaLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    v35 = v54;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      UIAccessibilityAddMetadataDescriptionToVideo_cold_1((uint64_t)v27, v28, v48, v49, v50, v51, v52, v53);
  }

  v36 = 0;
LABEL_9:

  v13 = v55;
LABEL_10:

LABEL_12:
  return v36;
}

id UIAccessibilityPhotoCreationDate(void *a1)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;

  v1 = a1;
  v2 = v1;
  if (v1 && (v3 = CGImageSourceCreateWithURL(v1, 0)) != 0)
  {
    v4 = v3;
    v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    CFRelease(v4);
    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBD090]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CBD088]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
      objc_msgSend(v8, "dateFromString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 28, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 28, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v11, "year");
      if (v15 == objc_msgSend(v14, "year"))
      {
        v16 = objc_msgSend(v11, "month");
        v17 = CFSTR("MMMMddjjmm");
        if (v16 == objc_msgSend(v14, "month"))
        {
          v18 = objc_msgSend(v11, "day");
          if (v18 == objc_msgSend(v14, "day"))
            v17 = CFSTR("jjmm");
        }
      }
      else
      {
        v17 = CFSTR("MMMMddyyyyjjmm");
      }
      AXMDateStringForFormat(v9, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

__CFString *UIAccessibilityMetadataDescriptionForImage(void *a1)
{
  const __CFURL *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGImageSource *v12;
  CGImageSource *v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  CFErrorRef error;

  v1 = a1;
  error = 0;
  v2 = (__CFString *)MAImageCaptioningCopyCaption(v1, &error);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    if (error)
    {
      AXLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        UIAccessibilityMetadataDescriptionForImage_cold_1((uint64_t)&error, v5, v6, v7, v8, v9, v10, v11);

      if (error)
      {
        CFRelease(error);
        error = 0;
      }
    }
    if (v1 && (v12 = CGImageSourceCreateWithURL(v1, 0)) != 0)
    {
      v13 = v12;
      v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
      -[__CFDictionary objectForKey:](v14, "objectForKey:", *MEMORY[0x1E0CBD090]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CBD0A8]);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        -[__CFDictionary objectForKey:](v14, "objectForKey:", *MEMORY[0x1E0CBCED8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CBCEB8]);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      CFRelease(v13);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

BOOL UIAccessibilityAddMetadataDescriptionToImage(void *a1, void *a2)
{
  const __CFURL *v3;
  __CFString *v4;
  _BOOL8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *Type;
  CGImageDestinationRef v22;
  CGImageDestination *v23;
  CGImageMetadata *Mutable;
  const __CFDictionary *v25;
  CFErrorRef err;
  CFErrorRef error;

  v3 = a1;
  v4 = a2;
  if (!v3)
    goto LABEL_16;
  error = 0;
  if (MAImageCaptioningSetCaption(v3, v4, &error))
  {
    v5 = 1;
    goto LABEL_19;
  }
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    UIAccessibilityAddMetadataDescriptionToImage_cold_1((uint64_t)&error, v6, v7, v8, v9, v10, v11, v12);

  if (error)
  {
    CFRelease(error);
    error = 0;
  }
  v13 = CGImageSourceCreateWithURL(v3, 0);
  if (!v13)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_19;
  }
  v14 = v13;
  v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
  v16 = (void *)-[__CFDictionary mutableCopy](v15, "mutableCopy");

  objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v18
    && (v19 = (const __CFString *)*MEMORY[0x1E0CBD0A8],
        objc_msgSend(v18, "setObject:forKey:", v4, *MEMORY[0x1E0CBD0A8]),
        v20 = (const __CFString *)*MEMORY[0x1E0CBD090],
        objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x1E0CBD090]),
        Type = CGImageSourceGetType(v14),
        (v22 = CGImageDestinationCreateWithURL(v3, Type, 1uLL, 0)) != 0))
  {
    v23 = v22;
    Mutable = CGImageMetadataCreateMutable();
    CGImageMetadataSetValueMatchingImageProperty(Mutable, v20, v19, v4);
    CGImageMetadataSetValueMatchingImageProperty(Mutable, (CFStringRef)*MEMORY[0x1E0CBCED8], (CFStringRef)*MEMORY[0x1E0CBCEB8], v4);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", Mutable, *MEMORY[0x1E0CBC798], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBC790], 0);
    v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    err = 0;
    v5 = CGImageDestinationCopyImageSource(v23, v14, v25, &err);
    if (err)
    {
      CFRelease(err);
      err = 0;
    }
    if (Mutable)
      CFRelease(Mutable);
    CFRelease(v23);

  }
  else
  {
    v5 = 0;
  }
  CFRelease(v14);

LABEL_19:
  return v5;
}

id UIAXPhotoDescriptionString(CGImage *a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  double Width;
  double Height;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double x;
  double y;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGContext *v22;
  CGImageRef Image;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _Unwind_Exception *v40;
  CGAffineTransform transform;
  CGRect v42;
  CGRect v43;

  if (!a1)
    goto LABEL_9;
  transform.a = 0.0;
  *(_QWORD *)&transform.b = &transform;
  *(_QWORD *)&transform.c = 0x2020000000;
  v4 = getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr;
  *(_QWORD *)&transform.d = getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr;
  if (!getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr)
  {
    v5 = (void *)UIKitLibrary();
    v4 = dlsym(v5, "UIAccessibilityIsVoiceOverRunning");
    *(_QWORD *)(*(_QWORD *)&transform.b + 24) = v4;
    getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&transform, 8);
  if (v4)
  {
    if (((unsigned int (*)(void))v4)())
    {
      if (UIAXPhotoDescriptionString_onceToken == -1)
        goto LABEL_7;
      goto LABEL_25;
    }
LABEL_9:
    v10 = 0;
    return v10;
  }
  __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_25:
  dispatch_once(&UIAXPhotoDescriptionString_onceToken, &__block_literal_global_22);
LABEL_7:
  v6 = (void *)MEMORY[0x1B5E128FC]();
  Width = (double)CGImageGetWidth(a1);
  Height = (double)CGImageGetHeight(a1);
  if (CGImageGetWidth(a1) <= 0x190)
    v9 = (double)CGImageGetWidth(a1);
  else
    v9 = 400.0;
  v11 = v9 * Height / Width;
  v12 = 0;
  v13 = 0;
  v42 = CGRectIntegral(*(CGRect *)(&v9 - 2));
  x = v42.origin.x;
  y = v42.origin.y;
  v16 = v42.size.width;
  v17 = v42.size.height;
  transform.a = 0.0;
  *(_QWORD *)&transform.b = &transform;
  *(_QWORD *)&transform.c = 0x2020000000;
  v18 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  *(_QWORD *)&transform.d = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    v19 = (void *)UIKitLibrary();
    v18 = dlsym(v19, "UIGraphicsBeginImageContextWithOptions");
    *(_QWORD *)(*(_QWORD *)&transform.b + 24) = v18;
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(&transform, 8);
  if (!v18)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_27:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_28;
  }
  ((void (*)(_QWORD, double, double, double))v18)(0, v16, v17, 0.0);
  transform.a = 0.0;
  *(_QWORD *)&transform.b = &transform;
  *(_QWORD *)&transform.c = 0x2020000000;
  v20 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  *(_QWORD *)&transform.d = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    v21 = (void *)UIKitLibrary();
    v20 = dlsym(v21, "UIGraphicsGetCurrentContext");
    *(_QWORD *)(*(_QWORD *)&transform.b + 24) = v20;
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&transform, 8);
  if (!v20)
    goto LABEL_27;
  v22 = (CGContext *)((uint64_t (*)(void))v20)();
  CGContextSetInterpolationQuality(v22, kCGInterpolationHigh);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1B0EFFF50;
  transform.ty = v17;
  CGContextConcatCTM(v22, &transform);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = v16;
  v43.size.height = v17;
  CGContextDrawImage(v22, v43, a1);
  Image = CGBitmapContextCreateImage(v22);
  transform.a = 0.0;
  *(_QWORD *)&transform.b = &transform;
  *(_QWORD *)&transform.c = 0x2020000000;
  v24 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  *(_QWORD *)&transform.d = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    v25 = (void *)UIKitLibrary();
    v24 = dlsym(v25, "UIGraphicsEndImageContext");
    *(_QWORD *)(*(_QWORD *)&transform.b + 24) = v24;
    getUIGraphicsEndImageContextSymbolLoc_ptr = v24;
  }
  _Block_object_dispose(&transform, 8);
  if (!v24)
  {
LABEL_28:
    v40 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&transform, 8);
    _Unwind_Resume(v40);
  }
  ((void (*)(void))v24)();
  objc_autoreleasePoolPop(v6);
  if (Image)
    CFAutorelease(Image);
  -[objc_class sharedInstance](NSClassFromString(CFSTR("SCRCPhotoEvaluator")), "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "evaluateImage:forCriteria:inRect:", Image, a2 & 2 | (16 * ((a2 >> 2) & 1)), x, y, v16, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "blurResult");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "luminanceResult");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "humanReadableResult");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "humanReadableResult");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  __AXMStringForVariables(v30, v32, v33, v34, v35, v36, v37, v38, v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id UIAXFileTypeDescriptionForFile(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXFileTypeDescriptionForFileExtension(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id UIAXFileTypeDescriptionForFileExtension(void *a1)
{
  __CFString *v1;
  void *PreferredIdentifierForTag;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_19;
  PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v1, 0);
  UIAXFileTypeDescriptionForUTI(PreferredIdentifierForTag);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("usdz")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("filetype.3D.model");
LABEL_14:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E6260C18, CFSTR("Accessibility"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("numbers")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("filetype.number");
      goto LABEL_14;
    }
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("pages")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("filetype.pages");
      goto LABEL_14;
    }
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("key")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("filetype.keynote");
      goto LABEL_14;
    }
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("rtfd")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("filetype.rtf.document");
      goto LABEL_14;
    }
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = PreferredIdentifierForTag;
      v13 = 2112;
      v14 = v1;
      _os_log_impl(&dword_1B0E3B000, v9, OS_LOG_TYPE_INFO, "unknown file type: UTI: %@, extension: %@", (uint8_t *)&v11, 0x16u);
    }

LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    PreferredIdentifierForTag = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PreferredIdentifierForTag, "localizedStringForKey:value:table:", CFSTR("filetype.unknown"), &stru_1E6260C18, CFSTR("Accessibility"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v5 = v3;
LABEL_15:

LABEL_20:
  return v5;
}

id UIAXFileTypeDescriptionForUTI(void *a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __CFString *v89;
  _QWORD v90[39];
  _QWORD v91[41];

  v91[39] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!ContentTypeMap)
  {
    v90[0] = CFSTR("image/png");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("filetype.image"), &stru_1E6260C18, CFSTR("Accessibility"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v87;
    v90[1] = CFSTR("image/bmp");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("filetype.image"), &stru_1E6260C18, CFSTR("Accessibility"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v85;
    v90[2] = CFSTR("image/jpeg");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("filetype.image"), &stru_1E6260C18, CFSTR("Accessibility"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v83;
    v90[3] = CFSTR("image/vnd.adobe.photoshop");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("filetype.psd"), &stru_1E6260C18, CFSTR("Accessibility"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v81;
    v90[4] = CFSTR("image/tiff");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("filetype.tiff"), &stru_1E6260C18, CFSTR("Accessibility"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v79;
    v90[5] = CFSTR("image/svg+xml");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("filetype.svg"), &stru_1E6260C18, CFSTR("Accessibility"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v91[5] = v77;
    v90[6] = CFSTR("image/gif");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("filetype.gif"), &stru_1E6260C18, CFSTR("Accessibility"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v91[6] = v75;
    v90[7] = CFSTR("text/css");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("filetype.css.file"), &stru_1E6260C18, CFSTR("Accessibility"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v91[7] = v73;
    v90[8] = CFSTR("text/csv");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("filetype.csv.file"), &stru_1E6260C18, CFSTR("Accessibility"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v91[8] = v71;
    v90[9] = CFSTR("text/html");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("filetype.html.file"), &stru_1E6260C18, CFSTR("Accessibility"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91[9] = v69;
    v90[10] = CFSTR("text/calendar");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("filetype.calendar.event"), &stru_1E6260C18, CFSTR("Accessibility"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v91[10] = v67;
    v90[11] = CFSTR("text/plain");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("filetype.text.file"), &stru_1E6260C18, CFSTR("Accessibility"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v91[11] = v65;
    v90[12] = CFSTR("text/rtf");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("filetype.rtf.document"), &stru_1E6260C18, CFSTR("Accessibility"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v91[12] = v63;
    v90[13] = CFSTR("text/directory");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("filetype.contact.card"), &stru_1E6260C18, CFSTR("Accessibility"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v91[13] = v61;
    v90[14] = CFSTR("application/pdf");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("filetype.pdf"), &stru_1E6260C18, CFSTR("Accessibility"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v91[14] = v59;
    v90[15] = CFSTR("application/x-latex");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("filetype.latex"), &stru_1E6260C18, CFSTR("Accessibility"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v91[15] = v57;
    v90[16] = CFSTR("application/json");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("filetype.json"), &stru_1E6260C18, CFSTR("Accessibility"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v91[16] = v55;
    v90[17] = CFSTR("application/vnd.ms-excel");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("filetype.excel"), &stru_1E6260C18, CFSTR("Accessibility"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v91[17] = v53;
    v90[18] = CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("filetype.excel"), &stru_1E6260C18, CFSTR("Accessibility"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v91[18] = v51;
    v90[19] = CFSTR("application/onenote");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("filetype.onenote"), &stru_1E6260C18, CFSTR("Accessibility"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v91[19] = v49;
    v90[20] = CFSTR("application/vnd.ms-powerpoint");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("filetype.powerpoint"), &stru_1E6260C18, CFSTR("Accessibility"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v91[20] = v47;
    v90[21] = CFSTR("application/vnd.openxmlformats-officedocument.presentationml.presentation");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("filetype.powerpoint"), &stru_1E6260C18, CFSTR("Accessibility"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v91[21] = v45;
    v90[22] = CFSTR("application/msword");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("filetype.word"), &stru_1E6260C18, CFSTR("Accessibility"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v91[22] = v43;
    v90[23] = CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("filetype.word"), &stru_1E6260C18, CFSTR("Accessibility"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v91[23] = v41;
    v90[24] = CFSTR("application/postscript");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("filetype.postscript"), &stru_1E6260C18, CFSTR("Accessibility"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v91[24] = v39;
    v90[25] = CFSTR("application/rtf");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("filetype.rtf.document"), &stru_1E6260C18, CFSTR("Accessibility"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v91[25] = v37;
    v90[26] = CFSTR("application/xml");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("filetype.xml"), &stru_1E6260C18, CFSTR("Accessibility"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v91[26] = v35;
    v90[27] = CFSTR("application/rss+xml");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("filetype.rss"), &stru_1E6260C18, CFSTR("Accessibility"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v91[27] = v33;
    v90[28] = CFSTR("application/zip");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("filetype.zip"), &stru_1E6260C18, CFSTR("Accessibility"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v91[28] = v31;
    v90[29] = CFSTR("application/x-rar-compressed");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("filetype.rar"), &stru_1E6260C18, CFSTR("Accessibility"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v91[29] = v29;
    v90[30] = CFSTR("application/x-tar");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("filetype.tar"), &stru_1E6260C18, CFSTR("Accessibility"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v91[30] = v27;
    v90[31] = CFSTR("application/epub+zip");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("filetype.epub"), &stru_1E6260C18, CFSTR("Accessibility"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v91[31] = v25;
    v90[32] = CFSTR("audio/mp4");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("filetype.audio"), &stru_1E6260C18, CFSTR("Accessibility"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v91[32] = v23;
    v90[33] = CFSTR("audio/x-wav");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("filetype.audio"), &stru_1E6260C18, CFSTR("Accessibility"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v91[33] = v21;
    v90[34] = CFSTR("audio/x-m4a");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("filetype.audio"), &stru_1E6260C18, CFSTR("Accessibility"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v91[34] = v19;
    v90[35] = CFSTR("video/quicktime");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("filetype.video"), &stru_1E6260C18, CFSTR("Accessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v91[35] = v2;
    v90[36] = CFSTR("video/mp4");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v89 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("filetype.video"), &stru_1E6260C18, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v91[36] = v4;
    v90[37] = CFSTR("video/mpeg");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("filetype.video"), &stru_1E6260C18, CFSTR("Accessibility"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v91[37] = v6;
    v90[38] = CFSTR("video/x-m4v");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("filetype.video"), &stru_1E6260C18, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v91[38] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 39);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)ContentTypeMap;
    ContentTypeMap = v9;

    v1 = v89;
  }
  v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v1, (CFStringRef)*MEMORY[0x1E0CEC408]);
  objc_msgSend((id)ContentTypeMap, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {
    if ((-[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR("audio/")) & 1) != 0
      || -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("com.apple.coreaudio-format")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("filetype.audio");
    }
    else
    {
      if (!-[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR("video/")))
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("filetype.video");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E6260C18, CFSTR("Accessibility"));
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
LABEL_8:

  return v12;
}

__CFString *_heartLocSuffixForSuffix(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(&unk_1E62896A8, "objectForKey:", a1);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E6260C18;
  v3 = v1;

  return v3;
}

__CFString *_handLocSuffixForSuffix(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(&unk_1E62896D0, "objectForKey:", a1);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E6260C18;
  v3 = v1;

  return v3;
}

__CFString *_eyesLocSuffixForSuffix(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v1 = _eyesLocSuffixForSuffix_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_eyesLocSuffixForSuffix_onceToken, &__block_literal_global_293);
  v3 = objc_msgSend(v2, "integerValue");

  v4 = (void *)_eyesLocSuffixForSuffix_emojiDescriptions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E6260C18;
  v8 = v6;

  return v8;
}

void ___eyesLocSuffixForSuffix_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[58];
  _QWORD v3[59];

  v3[58] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6288450;
  v2[1] = &unk_1E6288468;
  v3[0] = CFSTR(".face.eyes.open");
  v3[1] = CFSTR(".face.eyes.one.eye.closed");
  v2[2] = &unk_1E6288480;
  v2[3] = &unk_1E6288498;
  v3[2] = CFSTR(".face.eyes.open");
  v3[3] = CFSTR(".face.eyes.open");
  v2[4] = &unk_1E62884B0;
  v2[5] = &unk_1E62884C8;
  v3[4] = CFSTR(".face.eyes.one.eye.closed");
  v3[5] = CFSTR(".face.eyes.one.eye.closed");
  v2[6] = &unk_1E62884E0;
  v2[7] = &unk_1E62884F8;
  v3[6] = CFSTR(".face.eyes.open");
  v3[7] = CFSTR(".face.eyes.hearts");
  v2[8] = &unk_1E6288510;
  v2[9] = &unk_1E6288528;
  v3[8] = CFSTR(".face.eyes.hearts");
  v3[9] = CFSTR(".eyes.hearts");
  v2[10] = &unk_1E6288540;
  v2[11] = &unk_1E6288558;
  v3[10] = CFSTR(".eyes.one.eye.closed");
  v3[11] = CFSTR(".sunglasses");
  v2[12] = &unk_1E6288570;
  v2[13] = &unk_1E6288588;
  v3[12] = CFSTR(".aviator.sunglasses");
  v3[13] = CFSTR(".cat.eye.sunglasses");
  v2[14] = &unk_1E62885A0;
  v2[15] = &unk_1E62885B8;
  v3[14] = CFSTR(".eyes.furled");
  v3[15] = CFSTR(".eyes.furled");
  v2[16] = &unk_1E62885D0;
  v2[17] = &unk_1E62885E8;
  v3[16] = CFSTR(".eyes.furled");
  v3[17] = CFSTR(".eyes.crying");
  v2[18] = &unk_1E6288600;
  v2[19] = &unk_1E6288618;
  v3[18] = CFSTR(".eyes.crying");
  v3[19] = CFSTR(".eyes.crying");
  v2[20] = &unk_1E6288630;
  v2[21] = &unk_1E6288648;
  v3[20] = CFSTR(".eyes.open");
  v3[21] = CFSTR(".eyes.furled");
  v2[22] = &unk_1E6288660;
  v2[23] = &unk_1E6288678;
  v3[22] = CFSTR(".eyes.furled");
  v3[23] = CFSTR(".eyes.furled");
  v2[24] = &unk_1E6288690;
  v2[25] = &unk_1E62886A8;
  v3[24] = CFSTR(".eyes.furled");
  v3[25] = CFSTR(".eyes.wide.open");
  v2[26] = &unk_1E62886C0;
  v2[27] = &unk_1E62886D8;
  v3[26] = CFSTR(".eyes.one.eye.closed");
  v3[27] = CFSTR(".eyes.open");
  v2[28] = &unk_1E62886F0;
  v2[29] = &unk_1E6288708;
  v3[28] = CFSTR(".eyes.furled");
  v3[29] = CFSTR(".eyes.open");
  v2[30] = &unk_1E6288720;
  v2[31] = &unk_1E6288738;
  v3[30] = CFSTR(".eyes.crying");
  v3[31] = CFSTR(".eyes.closed");
  v2[32] = &unk_1E6288750;
  v2[33] = &unk_1E6288768;
  v3[32] = CFSTR(".eyes.closed");
  v3[33] = CFSTR(".eyes.crying");
  v2[34] = &unk_1E6288780;
  v2[35] = &unk_1E6288798;
  v3[34] = CFSTR(".eyes.black.hearts");
  v3[35] = CFSTR(".eyes.black.hearts");
  v2[36] = &unk_1E62887B0;
  v2[37] = &unk_1E62887C8;
  v3[36] = CFSTR(".eyes.black.hearts");
  v3[37] = CFSTR(".eyes.crying");
  v2[38] = &unk_1E62887E0;
  v2[39] = &unk_1E62887F8;
  v3[38] = CFSTR(".eyes.crying");
  v3[39] = CFSTR(".eyes.open");
  v2[40] = &unk_1E6288810;
  v2[41] = &unk_1E6288828;
  v3[40] = CFSTR(".eyes.open");
  v3[41] = CFSTR(".eyes.open");
  v2[42] = &unk_1E6288840;
  v2[43] = &unk_1E6288858;
  v3[42] = CFSTR(".eyes.open");
  v3[43] = CFSTR(".eyes.crosses");
  v2[44] = &unk_1E6288870;
  v2[45] = &unk_1E6288888;
  v3[44] = CFSTR(".eyes.bandages");
  v3[45] = CFSTR(".eyes.half.closed");
  v2[46] = &unk_1E62888A0;
  v2[47] = &unk_1E62888B8;
  v3[46] = CFSTR(".eyes.closed");
  v3[47] = CFSTR(".eyes.half.closed");
  v2[48] = &unk_1E62888D0;
  v2[49] = &unk_1E62888E8;
  v3[48] = CFSTR(".eyes.closed");
  v3[49] = CFSTR(".eyes.closed");
  v2[50] = &unk_1E6288900;
  v2[51] = &unk_1E6288918;
  v3[50] = CFSTR(".eyes.closed");
  v3[51] = CFSTR(".eyes.closed");
  v2[52] = &unk_1E6288930;
  v2[53] = &unk_1E6288948;
  v3[52] = CFSTR(".eyes.half.closed");
  v3[53] = CFSTR(".eyes.half.closed");
  v2[54] = &unk_1E6288960;
  v2[55] = &unk_1E6288978;
  v3[54] = CFSTR(".eyes.open");
  v3[55] = CFSTR(".eyes.half.closed.one");
  v2[56] = &unk_1E6288990;
  v2[57] = &unk_1E62889A8;
  v3[56] = CFSTR(".eyes.tearing.up");
  v3[57] = CFSTR(".eyes.open");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_eyesLocSuffixForSuffix_emojiDescriptions;
  _eyesLocSuffixForSuffix_emojiDescriptions = v0;

}

__CFString *_mouthLocSuffixForSuffix(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v1 = _mouthLocSuffixForSuffix_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_mouthLocSuffixForSuffix_onceToken, &__block_literal_global_391);
  v3 = objc_msgSend(v2, "integerValue");

  v4 = (void *)_mouthLocSuffixForSuffix_emojiDescriptions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E6260C18;
  v8 = v6;

  return v8;
}

void ___mouthLocSuffixForSuffix_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[58];
  _QWORD v3[59];

  v3[58] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6288450;
  v2[1] = &unk_1E6288468;
  v3[0] = CFSTR(".mouth.smiling");
  v3[1] = CFSTR(".mouth.smiling");
  v2[2] = &unk_1E6288480;
  v2[3] = &unk_1E6288498;
  v3[2] = CFSTR(".mouth.smiling.half.open");
  v3[3] = CFSTR(".mouth.smiling.wide");
  v2[4] = &unk_1E62884B0;
  v2[5] = &unk_1E62884C8;
  v3[4] = CFSTR(".mouth.smiling.wide");
  v3[5] = CFSTR(".mouth.tongue");
  v2[6] = &unk_1E62884E0;
  v2[7] = &unk_1E62884F8;
  v3[6] = CFSTR(".mouth.tongue");
  v3[7] = CFSTR(".mouth.tongue");
  v2[8] = &unk_1E6288510;
  v2[9] = &unk_1E6288528;
  v3[8] = CFSTR(".mouth.smiling.wide");
  v3[9] = CFSTR(".mouth.smiling");
  v2[10] = &unk_1E6288540;
  v2[11] = &unk_1E6288558;
  v3[10] = CFSTR(".mouth.blowing.kiss");
  v3[11] = CFSTR(".mouth.smirking");
  v2[12] = &unk_1E6288570;
  v2[13] = &unk_1E6288588;
  v3[12] = CFSTR(".mouth.smirking");
  v3[13] = CFSTR(".mouth.smirking");
  v2[14] = &unk_1E62885A0;
  v2[15] = &unk_1E62885B8;
  v3[14] = CFSTR(".mouth.smiling");
  v3[15] = CFSTR(".mouth.smiling.wide");
  v2[16] = &unk_1E62885D0;
  v2[17] = &unk_1E62885E8;
  v3[16] = CFSTR(".mouth.tongue");
  v3[17] = CFSTR(".mouth.tongue");
  v2[18] = &unk_1E6288600;
  v2[19] = &unk_1E6288618;
  v3[18] = CFSTR(".mouth.smiling.wide");
  v3[19] = CFSTR(".mouth.smiling");
  v2[20] = &unk_1E6288630;
  v2[21] = &unk_1E6288648;
  v3[20] = CFSTR(".mouth.half.frowning");
  v3[21] = CFSTR(".mouth.half.frowning");
  v2[22] = &unk_1E6288660;
  v2[23] = &unk_1E6288678;
  v3[22] = CFSTR(".mouth.frowning");
  v3[23] = CFSTR(".mouth.frowning");
  v2[24] = &unk_1E6288690;
  v2[25] = &unk_1E62886A8;
  v3[24] = CFSTR(".mouth.frowning");
  v3[25] = CFSTR(".mouth.gasping");
  v2[26] = &unk_1E62886C0;
  v2[27] = &unk_1E62886D8;
  v3[26] = CFSTR(".mouth.gasping");
  v3[27] = CFSTR(".mouth.gasping");
  v2[28] = &unk_1E62886F0;
  v2[29] = &unk_1E6288708;
  v3[28] = CFSTR(".mouth.gasping");
  v3[29] = CFSTR(".mouth.screaming");
  v2[30] = &unk_1E6288720;
  v2[31] = &unk_1E6288738;
  v3[30] = CFSTR(".mouth.screaming");
  v3[31] = CFSTR(".mouth.screaming");
  v2[32] = &unk_1E6288750;
  v2[33] = &unk_1E6288768;
  v3[32] = CFSTR(".mouth.gasping");
  v3[33] = CFSTR(".mouth.gasping");
  v2[34] = &unk_1E6288780;
  v2[35] = &unk_1E6288798;
  v3[34] = CFSTR(".mouth.gasping");
  v3[35] = CFSTR(".mouth.frowning");
  v2[36] = &unk_1E62887B0;
  v2[37] = &unk_1E62887C8;
  v3[36] = CFSTR(".mouth.half.frowning");
  v3[37] = CFSTR(".mouth.half.frowning");
  v2[38] = &unk_1E62887E0;
  v2[39] = &unk_1E62887F8;
  v3[38] = CFSTR(".mouth.frowning");
  v3[39] = CFSTR(".mouth.frowning");
  v2[40] = &unk_1E6288810;
  v2[41] = &unk_1E6288828;
  v3[40] = CFSTR(".mouth.frowning");
  v3[41] = CFSTR(".mouth.thermometer");
  v2[42] = &unk_1E6288840;
  v2[43] = &unk_1E6288858;
  v3[42] = CFSTR(".mouth.surgical.mask");
  v3[43] = CFSTR(".mouth.half.frowning");
  v2[44] = &unk_1E6288870;
  v2[45] = &unk_1E6288888;
  v3[44] = CFSTR(".mouth.half.frowning");
  v3[45] = CFSTR(".mouth.half.frowning");
  v2[46] = &unk_1E62888A0;
  v2[47] = &unk_1E62888B8;
  v3[46] = CFSTR(".mouth.half.frowning");
  v3[47] = CFSTR(".mouth.frowning");
  v2[48] = &unk_1E62888D0;
  v2[49] = &unk_1E62888E8;
  v3[48] = CFSTR(".mouth.frowning");
  v3[49] = CFSTR(".mouth.smiling");
  v2[50] = &unk_1E6288900;
  v2[51] = &unk_1E6288918;
  v3[50] = CFSTR(".mouth.smiling.wide");
  v3[51] = CFSTR(".mouth.tongue");
  v2[52] = &unk_1E6288930;
  v2[53] = &unk_1E6288948;
  v3[52] = CFSTR(".mouth.tongue");
  v3[53] = CFSTR(".mouth.smiling");
  v2[54] = &unk_1E6288960;
  v2[55] = &unk_1E6288978;
  v3[54] = CFSTR(".mouth.smirking");
  v3[55] = CFSTR(".mouth.smiling");
  v2[56] = &unk_1E6288990;
  v2[57] = &unk_1E62889A8;
  v3[56] = CFSTR(".mouth.smiling.teeth");
  v3[57] = CFSTR(".mouth.smiling.teeth");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_mouthLocSuffixForSuffix_emojiDescriptions;
  _mouthLocSuffixForSuffix_emojiDescriptions = v0;

}

id UIAccessibilityEmojiDescription(void *a1)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFURL *v40;
  CGImageSource *v41;
  void *v42;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = CGImageSourceCreateWithURL(v1, 0);
    if (v3)
    {
      v4 = v3;
      v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
      -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBCCE0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v16 = 0;
LABEL_21:
        CFRelease(v4);

        goto LABEL_22;
      }
      -[__CFURL path](v2, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByDeletingPathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v9;
      v40 = v2;
      v41 = v4;
      if (objc_msgSend(v9, "rangeOfString:", CFSTR("heart-blue-loop-")))
      {
        if (objc_msgSend(v9, "rangeOfString:", CFSTR("heart-red-loop-")))
        {
          if (objc_msgSend(v9, "rangeOfString:", CFSTR("heart-purple-loop-")))
          {
            if (objc_msgSend(v9, "rangeOfString:", CFSTR("hand-loop-")))
            {
              if (objc_msgSend(v9, "rangeOfString:", CFSTR("face-red-loop-")))
              {
                if (objc_msgSend(v9, "rangeOfString:", CFSTR("face-yellow-loop-")))
                {
                  v16 = 0;
                  v17 = &stru_1E6260C18;
                  v18 = &stru_1E6260C18;
LABEL_20:

                  goto LABEL_21;
                }
                objc_msgSend(v9, "substringFromIndex:", v15);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v19, "isEqualToString:", CFSTR("21")) & 1) != 0)
                {
                  v17 = CFSTR("emoji.face.sad");
LABEL_36:
                  v39 = &stru_1E6260C18;
                  v22 = CFSTR("emoji.yellow.face");
                  goto LABEL_19;
                }
                if ((objc_msgSend(v19, "isEqualToString:", CFSTR("52")) & 1) != 0)
                {
                  v17 = CFSTR("emoji.face.sleeping");
                  goto LABEL_36;
                }
                if ((objc_msgSend(v19, "isEqualToString:", CFSTR("26")) & 1) != 0)
                {
                  v17 = CFSTR("emoji.face.confused.and.dismayed");
                  goto LABEL_36;
                }
                _eyesLocSuffixForSuffix(v19);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("emoji.face"), "stringByAppendingString:", v37);
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

                _mouthLocSuffixForSuffix(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("emoji.face"), "stringByAppendingString:", v20);
                v39 = (const __CFString *)objc_claimAutoreleasedReturnValue();
                v22 = CFSTR("emoji.yellow.face");
                goto LABEL_18;
              }
              objc_msgSend(v9, "substringFromIndex:", v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("21")) & 1) != 0)
              {
                v17 = CFSTR("emoji.face.sad");
LABEL_33:
                v39 = &stru_1E6260C18;
                v22 = CFSTR("emoji.red.face");
                goto LABEL_19;
              }
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("52")) & 1) != 0)
              {
                v17 = CFSTR("emoji.face.sleeping");
                goto LABEL_33;
              }
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("26")) & 1) != 0)
              {
                v17 = CFSTR("emoji.face.confused.and.dismayed");
                goto LABEL_33;
              }
              _eyesLocSuffixForSuffix(v19);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("emoji.face"), "stringByAppendingString:", v36);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              _mouthLocSuffixForSuffix(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("emoji.face"), "stringByAppendingString:", v20);
              v39 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v22 = CFSTR("emoji.red.face");
LABEL_18:

LABEL_19:
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "localizedStringForKey:value:table:", v22, &stru_1E6260C18, CFSTR("Accessibility"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "localizedStringForKey:value:table:", v17, &stru_1E6260C18, CFSTR("Accessibility"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (__CFString *)v39;
              objc_msgSend(v27, "localizedStringForKey:value:table:", v39, &stru_1E6260C18, CFSTR("Accessibility"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              __AXMStringForVariables(v24, v28, v29, v30, v31, v32, v33, v34, v26);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = v42;
              v2 = v40;
              v4 = v41;
              goto LABEL_20;
            }
            objc_msgSend(v9, "substringFromIndex:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            _handLocSuffixForSuffix((uint64_t)v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = CFSTR("emoji.hand");
          }
          else
          {
            objc_msgSend(v9, "substringFromIndex:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            _heartLocSuffixForSuffix((uint64_t)v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = CFSTR("emoji.heart.purple");
          }
        }
        else
        {
          objc_msgSend(v9, "substringFromIndex:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _heartLocSuffixForSuffix((uint64_t)v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = CFSTR("emoji.heart.red");
        }
      }
      else
      {
        objc_msgSend(v9, "substringFromIndex:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _heartLocSuffixForSuffix((uint64_t)v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("emoji.heart.blue");
      }
      -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v20);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = &stru_1E6260C18;
      v39 = &stru_1E6260C18;
      goto LABEL_18;
    }
  }
  v16 = 0;
LABEL_22:

  return v16;
}

Class __getUIScreenClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIScreen");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIScreenClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIScreenClass_block_invoke_cold_1();
    return (Class)UIKitLibrary();
  }
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!UIKitLibraryCore_frameworkLibrary)
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t AXMSecureCodingClasses()
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
  void *v61;

  v61 = (void *)MEMORY[0x1E0C99E60];
  v60 = objc_opt_class();
  v59 = objc_opt_class();
  v58 = objc_opt_class();
  v57 = objc_opt_class();
  v56 = objc_opt_class();
  v55 = objc_opt_class();
  v54 = objc_opt_class();
  v53 = objc_opt_class();
  v52 = objc_opt_class();
  v51 = objc_opt_class();
  v50 = objc_opt_class();
  v49 = objc_opt_class();
  v48 = objc_opt_class();
  v47 = objc_opt_class();
  v46 = objc_opt_class();
  v45 = objc_opt_class();
  v44 = objc_opt_class();
  v43 = objc_opt_class();
  v42 = objc_opt_class();
  v41 = objc_opt_class();
  v40 = objc_opt_class();
  v39 = objc_opt_class();
  v38 = objc_opt_class();
  v37 = objc_opt_class();
  v36 = objc_opt_class();
  v35 = objc_opt_class();
  v34 = objc_opt_class();
  v33 = objc_opt_class();
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v30 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return objc_msgSend(v61, "setWithObjects:", v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
           v43,
           v42,
           v41,
           v40,
           v39,
           v38,
           v37,
           v36,
           v35,
           v34,
           v33,
           v32,
           v31,
           v30,
           v29,
           v28,
           v27,
           v26,
           v25,
           v24,
           v23,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v13,
           v12,
           v11,
           v0,
           v1,
           v2,
           v3,
           v4,
           v5,
           v6,
           v7,
           v8,
           v9,
           objc_opt_class());
}

id AXMServiceInterface()
{
  if (AXMServiceInterface_onceToken != -1)
    dispatch_once(&AXMServiceInterface_onceToken, &__block_literal_global_24);
  return (id)AXMServiceInterface__Interface;
}

uint64_t AXMIsRunningInServiceProcess()
{
  if (AXMIsRunningInServiceProcess_onceToken != -1)
    dispatch_once(&AXMIsRunningInServiceProcess_onceToken, &__block_literal_global_129_0);
  return AXMIsRunningInServiceProcess__RunningInServiceProcess;
}

id _AXMContextQueue()
{
  if (_AXMContextQueue_onceToken != -1)
    dispatch_once(&_AXMContextQueue_onceToken, &__block_literal_global_131);
  return (id)_AXMContextQueue__ContextQueue;
}

id AXMCoreImageContext(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  _AXMContextQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __AXMCoreImageContext_block_invoke;
  v6[3] = &unk_1E625EB48;
  v7 = v1;
  v8 = &v9;
  v3 = v1;
  dispatch_sync(v2, v6);

  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void AXMDeleteCoreImageContext()
{
  NSObject *v0;

  _AXMContextQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v0, &__block_literal_global_138_0);

}

id AXMSharedDisplayManager()
{
  if (AXMSharedDisplayManager_onceToken != -1)
    dispatch_once(&AXMSharedDisplayManager_onceToken, &__block_literal_global_139);
  return (id)AXMSharedDisplayManager_DisplayManager;
}

id AXMAllSourceNodeClasses()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  v1[3] = objc_opt_class();
  v1[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXMAllEvaluationNodeClasses()
{
  _QWORD v1[19];

  v1[18] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  v1[3] = objc_opt_class();
  v1[4] = objc_opt_class();
  v1[5] = objc_opt_class();
  v1[6] = objc_opt_class();
  v1[7] = objc_opt_class();
  v1[8] = objc_opt_class();
  v1[9] = objc_opt_class();
  v1[10] = objc_opt_class();
  v1[11] = objc_opt_class();
  v1[12] = objc_opt_class();
  v1[13] = objc_opt_class();
  v1[14] = objc_opt_class();
  v1[15] = objc_opt_class();
  v1[16] = objc_opt_class();
  v1[17] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 18);
  return (id)objc_claimAutoreleasedReturnValue();
}

CVPixelBufferRef AXMCreatePixelBufferByRotatingBuffer(CVPixelBufferRef texture, int a2, _QWORD *a3)
{
  CVPixelBufferRef result;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  int v10;
  OSType v11;
  int v12;
  int v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  VTPixelRotationSessionRef pixelRotationSessionOut;
  CVPixelBufferRef pixelBufferOut;
  CGRect v42;

  pixelBufferOut = 0;
  if (a2 == 1)
    return CVPixelBufferRetain(texture);
  Width = CVPixelBufferGetWidth(texture);
  Height = CVPixelBufferGetHeight(texture);
  PixelFormatType = CVPixelBufferGetPixelFormatType(texture);
  v10 = a2 - 2;
  v11 = PixelFormatType;
  v12 = 0;
  v13 = 1;
  v14 = Width;
  switch(v10)
  {
    case 0:
      v13 = 0;
      v12 = 1;
      goto LABEL_9;
    case 1:
      v12 = 0;
      v13 = 0;
LABEL_9:
      v14 = Width;
      goto LABEL_13;
    case 2:
      goto LABEL_13;
    case 3:
      v13 = 0;
      v12 = 1;
      goto LABEL_12;
    case 4:
    case 6:
      v12 = 0;
      v13 = 0;
      goto LABEL_12;
    case 5:
      v12 = 0;
LABEL_12:
      v14 = Height;
      Height = Width;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
      v22 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, Height, v11, (CFDictionaryRef)v15, &pixelBufferOut);
      if ((_DWORD)v22)
      {
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _AXMMakeError(0, CFSTR("could not allocate pixel buffer: %@"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        pixelRotationSessionOut = 0;
        VTPixelRotationSessionCreate(0, &pixelRotationSessionOut);
        v30 = (double)CVPixelBufferGetWidth(texture);
        v42.size.height = (double)CVPixelBufferGetHeight(texture);
        v42.origin.x = 0.0;
        v42.origin.y = 0.0;
        v42.size.width = v30;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
        VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
        CFRelease(DictionaryRepresentation);
        if (v12)
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED778], MEMORY[0x1E0C9AAB0]);
        if (v13)
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED780], MEMORY[0x1E0C9AAB0]);
        v32 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, texture, pixelBufferOut);
        if (!(_DWORD)v32)
        {
          VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
          CFRelease(pixelRotationSessionOut);

          return pixelBufferOut;
        }
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _AXMMakeError(0, CFSTR("Could not rotate buffer: %@"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (pixelRotationSessionOut)
        {
          VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
          CFRelease(pixelRotationSessionOut);
        }
      }
      if (pixelBufferOut)
        CVPixelBufferRelease(pixelBufferOut);
LABEL_27:

LABEL_28:
      result = 0;
      break;
    default:
      if (!a3)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", Width);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _AXMMakeError(0, CFSTR("Could not rotate buffer with orientation: %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
  }
  return result;
}

id AXMImageByRotatingImage(void *a1, CGFloat a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "extent");
  v5 = v4;
  objc_msgSend(v3, "extent");
  v7 = v6;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, v5 * 0.5, v6 * 0.5);
  v16 = v18;
  CGAffineTransformRotate(&v17, &v16, a2);
  v18 = v17;
  v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, v5 * -0.5, v7 * -0.5);
  v18 = v17;
  v8 = (void *)MEMORY[0x1E0C9DDB8];
  v9 = *MEMORY[0x1E0C9E1F8];
  v20[0] = v3;
  v10 = *MEMORY[0x1E0C9E280];
  v19[0] = v9;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "axmValueWithCGAffineTransform:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithName:withInputParameters:", CFSTR("CIAffineTransform"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "outputImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void AXMWritePixelBufferToURL(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0C9DDC8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "imageWithCVPixelBuffer:", a1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  AXMWriteImageToURL(v8, v7, v6);

}

void AXMWriteImageToURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  CGColorSpaceRef DeviceRGB;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AXMCoreImageContext(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(v9, "writeJPEGRepresentationOfImage:toURL:colorSpace:options:error:", v7, v6, DeviceRGB, MEMORY[0x1E0C9AA70], &v12);

  v10 = v12;
  if (v10)
  {
    AXMediaLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v10, v11);

  }
  if (DeviceRGB)
    CFRelease(DeviceRGB);

}

void sub_1B0EAEC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  uint64_t v26;

  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B0EAF04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVN2vIWnsZbk4Su55oeWfKDq1()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr;
  v7 = getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr;
  if (!getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary_8();
    v0 = (id *)dlsym(v1, "VN2vIWnsZbk4Su55oeWfKDq1");
    v5[3] = (uint64_t)v0;
    getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVNmNJnu0xlW8CZXt6hJ7Rpb0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr;
  v7 = getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr;
  if (!getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary_8();
    v0 = (id *)dlsym(v1, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
    v5[3] = (uint64_t)v0;
    getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVN35FOB1QhtSfYGRIJvTgtTq()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr;
  v7 = getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr;
  if (!getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary_8();
    v0 = (id *)dlsym(v1, "VN35FOB1QhtSfYGRIJvTgtTq");
    v5[3] = (uint64_t)v0;
    getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVN6ZsEIQ9ri2eF1vhsxw5COm()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr;
  v7 = getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr;
  if (!getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary_8();
    v0 = (id *)dlsym(v1, "VN6ZsEIQ9ri2eF1vhsxw5COm");
    v5[3] = (uint64_t)v0;
    getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void __getMADVISceneClassificationRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADVISceneClassificationRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVISceneClassificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVISceneClassificationRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_0();
  }
}

void MediaAnalysisServicesLibrary_0()
{
  void *v0;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_0)
    MediaAnalysisServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getMADVISceneClassificationResultClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MediaAnalysisServicesLibrary_0();
  result = objc_getClass("MADVISceneClassificationResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVISceneClassificationResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getMADVISceneClassificationResultClass_block_invoke_cold_1();
    return (Class)VisionLibrary_8(v3);
  }
  return result;
}

uint64_t VisionLibrary_8()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_15)
    VisionLibraryCore_frameworkLibrary_15 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_15;
  if (!VisionLibraryCore_frameworkLibrary_15)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1B0EB580C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB5CE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB5DAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EB6074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0EB614C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EB6568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id getVNGenerateAttentionBasedSaliencyImageRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass;
  v7 = getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass;
  if (!getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EB689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_16)
  {
    VisionLibraryCore_frameworkLibrary_16 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_16)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNGenerateAttentionBasedSaliencyImageRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void sub_1B0EB6F78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB70F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB7318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0EB75DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0EB76A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB7708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0EB7760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB77C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0EB7818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB7878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0EB7928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EB7998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EBC040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0EBCB58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0EBF304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v12 = (v7 - *a1) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    v14 = v5 - (_QWORD)*a1;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v31 = result;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>>(result, v15);
    v18 = &v16[16 * v12];
    v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }
    else
    {
      v24 = &v16[16 * v12];
      do
      {
        v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
      }
      while (v22 != v23);
      v26 = *(int64x2_t *)a1;
    }
    v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    v28 = v26.i64[0];
    result = std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::~__split_buffer((uint64_t)&v28);
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)a2;
    v8 = *((_QWORD *)a2 + 1);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = v7 + 16;
  }
  a1[1] = v11;
  return result;
}

void sub_1B0EBF8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AXShotflowNetwork;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B0EBFC24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0EBFCF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1B0EC0450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_1B0EC09F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1B0EC0B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>(uint64_t a1, void **a2, void **a3, unint64_t a4)
{
  void **v6;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  unint64_t v14;
  void **v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  char v24;

  v6 = a2;
  v8 = *(id **)a1;
  if (a4 <= (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)
  {
    v14 = (uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v8) >> 3;
    if (v14 >= a4)
    {
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>((int)&v24, a2, a3, v8);
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 8);
      if (v21 != v19)
      {
        do
        {
          v22 = *(void **)(v21 - 8);
          v21 -= 8;

        }
        while (v21 != v20);
      }
      *(_QWORD *)(a1 + 8) = v20;
    }
    else
    {
      v15 = &a2[v14];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>((int)&v23, a2, v15, v8);
      v16 = *(_QWORD *)(a1 + 8);
      if (v15 != a3)
      {
        v17 = *(_QWORD **)(a1 + 8);
        do
        {
          v18 = *v15++;
          *v17++ = v18;
          v16 += 8;
        }
        while (v15 != a3);
      }
      *(_QWORD *)(a1 + 8) = v16;
    }
  }
  else
  {
    std::vector<NSString * {__strong}>::__vdeallocate((void **)a1);
    if (a4 >> 61)
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    v9 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1;
    v10 = v9 >> 2;
    if (v9 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    std::vector<NSString * {__strong}>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = *(_QWORD **)(a1 + 8);
    while (v6 != a3)
    {
      v13 = *v6++;
      *v12++ = v13;
    }
    *(_QWORD *)(a1 + 8) = v12;
  }
}

char *std::vector<NSString * {__strong}>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>(int a1, void **a2, void **a3, id *location)
{
  void **v5;
  void *v7;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5++;
      objc_storeStrong(location++, v7);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::__shared_ptr_emplace<espresso_buffer_t>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E625BAA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<espresso_buffer_t>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E625BAA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1B5E1250CLL);
}

uint64_t std::shared_ptr<espresso_buffer_t>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::shared_ptr<espresso_buffer_t>::~shared_ptr[abi:ne180100](i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1B0EC11A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::shared_ptr<espresso_buffer_t>::~shared_ptr[abi:ne180100](v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id MLAllComputeDevicesSoft()
{
  void (*v0)(void);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void (*)(void))getMLAllComputeDevicesSymbolLoc_ptr;
  v7 = getMLAllComputeDevicesSymbolLoc_ptr;
  if (!getMLAllComputeDevicesSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMLAllComputeDevicesSymbolLoc_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getMLAllComputeDevicesSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  v0();
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B0EC1A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMLAllComputeDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreMLLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)CoreMLLibraryCore_frameworkLibrary_0;
  }
  else
  {
    CoreMLLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)CoreMLLibraryCore_frameworkLibrary_0;
    if (!CoreMLLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MLAllComputeDevices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMLAllComputeDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNRecognizedTextClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNRecognizedTextClass_softClass;
  v7 = getVNRecognizedTextClass_softClass;
  if (!getVNRecognizedTextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizedTextClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNRecognizedTextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EC2358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizedTextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_17)
  {
    VisionLibraryCore_frameworkLibrary_17 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_17)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNRecognizedText");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNRecognizedTextClass_block_invoke_cold_1();
    free(v3);
  }
  getVNRecognizedTextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getVCPMediaAnalyzerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVCPMediaAnalyzerClass_softClass;
  v7 = getVCPMediaAnalyzerClass_softClass;
  if (!getVCPMediaAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalyzerClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVCPMediaAnalyzerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EC25B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHPhotoLibraryClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHPhotoLibraryClass_softClass_0;
  v7 = getPHPhotoLibraryClass_softClass_0;
  if (!getPHPhotoLibraryClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke_0;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EC2738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0EC2EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPMediaAnalyzerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    MediaAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MediaAnalysisLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VCPMediaAnalyzer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVCPMediaAnalyzerClass_block_invoke_cold_1();
    free(v3);
  }
  getVCPMediaAnalyzerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getPHPhotoLibraryClass_block_invoke_0(uint64_t a1)
{
  PhotosLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPhotoLibraryClass_block_invoke_cold_1_0();
    PhotosLibrary_0();
  }
}

void PhotosLibrary_0()
{
  void *v0;

  if (!PhotosLibraryCore_frameworkLibrary_0)
    PhotosLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPHPersonClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosLibrary_0();
  result = objc_getClass("PHPerson");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPersonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHPersonClass_block_invoke_cold_1();
    return (Class)__getMKBGetDeviceLockStateSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0EC3EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNFaceLandmarks2DClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_18)
  {
    VisionLibraryCore_frameworkLibrary_18 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_18)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNFaceLandmarks2D");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNFaceLandmarks2DClass_block_invoke_cold_1();
    free(v3);
  }
  getVNFaceLandmarks2DClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0EC8494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  _Block_object_dispose((const void *)(v9 - 208), 8);
  _Unwind_Resume(a1);
}

id getMADImageCaptionRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMADImageCaptionRequestClass_softClass;
  v7 = getMADImageCaptionRequestClass_softClass;
  if (!getMADImageCaptionRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMADImageCaptionRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getMADImageCaptionRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0EC87F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0EC96E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B0EC9918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaAnalysisLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MediaAnalysisLibraryCore_frameworkLibrary_0)
    MediaAnalysisLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = MediaAnalysisLibraryCore_frameworkLibrary_0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getVCPMediaAnalysisServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v2;

  MediaAnalysisLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = __getVCPMediaAnalysisServiceClass_block_invoke_cold_1();
    __getMADImageCaptionRequestClass_block_invoke(v2);
  }
}

void __getMADImageCaptionRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADImageCaptionRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADImageCaptionRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADImageCaptionRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_1();
  }
}

void MediaAnalysisServicesLibrary_1()
{
  void *v0;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_1)
    MediaAnalysisServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getMADCaptionResultClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADCaptionResult");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADCaptionResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADCaptionResultClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_11();
  }
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1B0ECA0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

double _AXMTextFrameForNormalizedBoundingBox(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

void sub_1B0ED0E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  uint64_t v26;

  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED17C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

void __getMADVIFaceRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADVIFaceRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVIFaceRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVIFaceRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_2();
  }
}

void MediaAnalysisServicesLibrary_2()
{
  void *v0;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_2)
    MediaAnalysisServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_2)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getMADVIFaceResultClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  MediaAnalysisServicesLibrary_2();
  result = objc_getClass("MADVIFaceResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADVIFaceResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getMADVIFaceResultClass_block_invoke_cold_1();
    return (Class)+[AXMMADSService sharedInstance](v3, v4);
  }
  return result;
}

void sub_1B0ED1C18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getMADServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_3)
  {
    MediaAnalysisServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MADService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMADServiceClass_block_invoke_cold_1();
    free(v3);
  }
  getMADServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double mean(double *a1, int a2)
{
  uint64_t v2;
  double v3;
  double v4;

  if (a2 < 1)
  {
    v3 = 0.0;
  }
  else
  {
    v2 = a2;
    v3 = 0.0;
    do
    {
      v4 = *a1++;
      v3 = v3 + v4;
      --v2;
    }
    while (v2);
  }
  return v3 / (double)a2;
}

double min(double *a1, int a2)
{
  uint64_t v2;
  double result;
  double v4;
  double v5;

  if (a2 < 1)
    return 1.79769313e308;
  v2 = a2;
  result = 1.79769313e308;
  do
  {
    v4 = *a1++;
    v5 = v4;
    if (v4 < result)
      result = v5;
    --v2;
  }
  while (v2);
  return result;
}

double max(double *a1, int a2)
{
  uint64_t v2;
  double result;
  double v4;
  double v5;

  if (a2 < 1)
    return -1.79769313e308;
  v2 = a2;
  result = -1.79769313e308;
  do
  {
    v4 = *a1++;
    v5 = v4;
    if (v4 > result)
      result = v5;
    --v2;
  }
  while (v2);
  return result;
}

double covariance(double *a1, double *a2, int a3)
{
  uint64_t v3;
  double v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (a3 < 1)
  {
    v14 = 0.0;
  }
  else
  {
    v3 = a3;
    v4 = 0.0;
    v5 = a1;
    v6 = a3;
    do
    {
      v7 = *v5++;
      v4 = v4 + v7;
      --v6;
    }
    while (v6);
    v8 = (double)a3;
    v9 = 0.0;
    v10 = a2;
    v11 = a3;
    do
    {
      v12 = *v10++;
      v9 = v9 + v12;
      --v11;
    }
    while (v11);
    v13 = v4 / v8;
    v14 = 0.0;
    v15 = v9 / v8;
    do
    {
      v16 = *a1++;
      v17 = v16 - v13;
      v18 = *a2++;
      v14 = v14 + v17 * (v18 - v15);
      --v3;
    }
    while (v3);
  }
  return v14 / (double)(a3 - 1);
}

double variance(double *a1, int a2)
{
  uint64_t v2;
  double v3;
  double *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a2 < 1)
  {
    v8 = 0.0;
  }
  else
  {
    v2 = a2;
    v3 = 0.0;
    v4 = a1;
    v5 = a2;
    do
    {
      v6 = *v4++;
      v3 = v3 + v6;
      --v5;
    }
    while (v5);
    v7 = v3 / (double)a2;
    v8 = 0.0;
    do
    {
      v9 = *a1++;
      v8 = v8 + (v9 - v7) * (v9 - v7);
      --v2;
    }
    while (v2);
  }
  return v8 / (double)(a2 - 1);
}

double rsquared(double *a1, double *a2, int a3)
{
  double v6;
  double v7;
  double v8;

  v6 = covariance(a1, a2, a3);
  v7 = variance(a1, a3);
  v8 = sqrt(v7 * variance(a2, a3));
  return v6 / v8 * (v6 / v8);
}

const char *CVML_getStatusDescription(unint64_t a1)
{
  const char *v1;

  v1 = "Not supported error";
  switch(a1)
  {
    case 0x59u:
      return v1;
    case 0x5Au:
      v1 = "General error";
      break;
    case 0x5Bu:
      v1 = "Espresso error";
      break;
    case 0x5Cu:
      v1 = "incorrect binserializer key";
      break;
    case 0x5Du:
      v1 = "small sparsity error";
      break;
    case 0x5Eu:
      v1 = "feature extraction error";
      break;
    case 0x5Fu:
      v1 = "initialization error";
      break;
    case 0x60u:
      v1 = "no saved state to revert";
      break;
    case 0x61u:
      v1 = "nominal distance not changed";
      break;
    case 0x62u:
      v1 = "batch size violation";
      break;
    case 0x63u:
      v1 = "computation kill request was issued";
      break;
    case 0x64u:
      v1 = "too few IDs to build VIP model";
      break;
    case 0x65u:
      v1 = "video error";
      break;
    case 0x66u:
      v1 = "error with projection computation";
      break;
    case 0x67u:
      v1 = "missing positional parameter";
      break;
    case 0x68u:
      v1 = "inconsistent state error";
      break;
    case 0x69u:
      v1 = "warping error";
      break;
    case 0x6Au:
      v1 = "OpenGL error";
      break;
    case 0x6Bu:
      v1 = "invalid format";
      break;
    case 0x6Cu:
      v1 = "out of bounds";
      break;
    case 0x6Du:
      v1 = "singular point configuration error";
      break;
    case 0x6Eu:
      v1 = "division by zero";
      break;
    case 0x6Fu:
      v1 = "LAPACK error";
      break;
    case 0x70u:
      v1 = "platform endianess not supported";
      break;
    case 0x71u:
      v1 = "hash already in use";
      break;
    case 0x72u:
      v1 = "invalid ID";
      break;
    case 0x73u:
      v1 = "invalid data type";
      break;
    case 0x74u:
      v1 = "data inconsistency error";
      break;
    case 0x75u:
      v1 = "I/O error";
      break;
    case 0x76u:
      v1 = "unknown option";
      break;
    case 0x77u:
      v1 = "invalid option";
      break;
    case 0x78u:
      v1 = "missing option";
      break;
    case 0x79u:
      v1 = "delegate error";
      break;
    case 0x7Au:
      v1 = "vImage related error";
      break;
    case 0x7Bu:
      v1 = "memory allocation error";
      break;
    case 0x7Cu:
      v1 = "invalid parameter";
      break;
    case 0x7Du:
      v1 = "unexpected null pointer";
      break;
    case 0x7Eu:
      v1 = "internal error";
      break;
    case 0x7Fu:
      v1 = "not implemented error";
      break;
    case 0x80u:
      v1 = "ok";
      break;
    default:
      v1 = CVML_getStatusDescription_ourSharedDefaultStatusDescription;
      snprintf(CVML_getStatusDescription_ourSharedDefaultStatusDescription, 0x3FuLL, "CVML_status module %d error %lld", a1 >> 8, a1 - 128);
      break;
  }
  return v1;
}

const char *CVML_getModuleDescription(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  v1 = a1 >> 8;
  v2 = "BinSerializer";
  switch(a1 >> 8)
  {
    case 1:
      return v2;
    case 2:
      v2 = "ERT";
      break;
    case 3:
      v2 = "Face3D";
      break;
    case 4:
      v2 = "FaceDescriptor";
      break;
    case 5:
      v2 = "FaceFrontalizer";
      break;
    case 6:
      v2 = "FaceWarper";
      break;
    case 7:
      v2 = "Geometry2D";
      break;
    case 8:
      v2 = "Geometry3D";
      break;
    case 9:
      v2 = "ImageGrouping";
      break;
    case 10:
      v2 = "ImageQuality";
      break;
    case 11:
      v2 = "LandmarkDetector";
      break;
    case 12:
      v2 = "MomentProcessor";
      break;
    case 13:
      v2 = "FaceboxAligner";
      break;
    case 14:
      v2 = "ImageDescriptor";
      break;
    case 15:
      v2 = "ImageClassifier";
      break;
    case 16:
      v2 = "ImageProcessing";
      break;
    case 17:
      v2 = "VIPIdentification";
      break;
    case 18:
      v2 = "ImageRegistration";
      break;
    case 19:
      v2 = "SimilarityMatrix";
      break;
    case 20:
      v2 = "Clustering";
      break;
    case 21:
      v2 = "HumanDetector";
      break;
    case 22:
      v2 = "FaceRegionMap";
      break;
    case 23:
      v2 = "ObjectDetector";
      break;
    case 24:
      v2 = "DML";
      break;
    case 25:
      v2 = "SGD";
      break;
    case 26:
      v2 = "ObjectTracker";
      break;
    case 27:
      v2 = "SRCClassifier";
      break;
    case 28:
      v2 = "Kmeans";
      break;
    case 29:
      v2 = "SparseCoding";
      break;
    case 30:
      v2 = "FaceID";
      break;
    case 31:
      v2 = "BoostedClassifier";
      break;
    case 32:
      v2 = "FaceSegmenter";
      break;
    case 33:
      v2 = "ImageAnalyzer";
      break;
    case 34:
      v2 = "FaceAttributes";
      break;
    case 35:
      v2 = "FaceprintAndAttributes";
      break;
    case 36:
      v2 = "FaceQuality";
      break;
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
LABEL_7:
      v2 = CVML_getModuleDescription_ourSharedModuleNameString;
      snprintf(CVML_getModuleDescription_ourSharedModuleNameString, 0x1FuLL, "CVML Module %lld", a1 >> 8);
      break;
    case 64:
      v2 = "Generic";
      break;
    case 65:
      v2 = "ImageTools";
      break;
    case 66:
      v2 = "VideoTools";
      break;
    case 67:
      v2 = "ImageWarper";
      break;
    case 68:
      v2 = "ThirdParty";
      break;
    case 69:
      v2 = "BinSerializerProcessor";
      break;
    case 70:
      v2 = "AppleNetParser";
      break;
    default:
      switch(v1)
      {
        case 128:
          v2 = "FaceProcessorCLI";
          break;
        case 129:
          v2 = "ImageClassifierCLI";
          break;
        case 130:
          v2 = "MPCmdlineClientCLI";
          break;
        case 131:
          v2 = "ClusteringCLI";
          break;
        case 132:
          v2 = "ImageProcessorCLI";
          break;
        case 133:
          v2 = "PhotosProcessorCLI";
          break;
        default:
          if (v1 != 192)
            goto LABEL_7;
          v2 = "CVMLEngine";
          break;
      }
      break;
  }
  return v2;
}

void sub_1B0ED4918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED49F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1B0ED4B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED4CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED4E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED4F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0ED5E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CVNLPLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CVNLPLibraryCore_frameworkLibrary)
    CVNLPLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CVNLPLibraryCore_frameworkLibrary;
  if (!CVNLPLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVNSceneClassificationRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVNSceneClassificationRequestClass_softClass;
  v7 = getVNSceneClassificationRequestClass_softClass;
  if (!getVNSceneClassificationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVNSceneClassificationRequestClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVNSceneClassificationRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0ED6764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSceneClassificationRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionLibraryCore_frameworkLibrary_19)
  {
    VisionLibraryCore_frameworkLibrary_19 = _sl_dlopen();
    if (!VisionLibraryCore_frameworkLibrary_19)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNSceneClassificationRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVNSceneClassificationRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getVNSceneClassificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0ED946C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0ED96D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id getVN6Mb1ME89lyW3HpahkEygIGClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVN6Mb1ME89lyW3HpahkEygIGClass_softClass;
  v7 = getVN6Mb1ME89lyW3HpahkEygIGClass_softClass;
  if (!getVN6Mb1ME89lyW3HpahkEygIGClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke;
    v3[3] = &unk_1E625C4E8;
    v3[4] = &v4;
    __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0ED9968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVN2vIWnsZbk4Su55oeWfKDq1_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0;
  v7 = getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0;
  if (!getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0)
  {
    v1 = (void *)VisionLibrary_9();
    v0 = (id *)dlsym(v1, "VN2vIWnsZbk4Su55oeWfKDq1");
    v5[3] = (uint64_t)v0;
    getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVNmNJnu0xlW8CZXt6hJ7Rpb0_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0;
  v7 = getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0;
  if (!getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0)
  {
    v1 = (void *)VisionLibrary_9();
    v0 = (id *)dlsym(v1, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
    v5[3] = (uint64_t)v0;
    getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVN35FOB1QhtSfYGRIJvTgtTq_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0;
  v7 = getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0;
  if (!getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0)
  {
    v1 = (void *)VisionLibrary_9();
    v0 = (id *)dlsym(v1, "VN35FOB1QhtSfYGRIJvTgtTq");
    v5[3] = (uint64_t)v0;
    getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getVN6ZsEIQ9ri2eF1vhsxw5COm_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0;
  v7 = getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0;
  if (!getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0)
  {
    v1 = (void *)VisionLibrary_9();
    v0 = (id *)dlsym(v1, "VN6ZsEIQ9ri2eF1vhsxw5COm");
    v5[3] = (uint64_t)v0;
    getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

Class __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke(uint64_t a1)
{
  Class result;

  VisionLibrary_9();
  result = objc_getClass("VN6Mb1ME89lyW3HpahkEygIG");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVN6Mb1ME89lyW3HpahkEygIGClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke_cold_1();
    return (Class)VisionLibrary_9();
  }
  return result;
}

uint64_t VisionLibrary_9()
{
  uint64_t v0;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary_20)
    VisionLibraryCore_frameworkLibrary_20 = _sl_dlopen();
  v0 = VisionLibraryCore_frameworkLibrary_20;
  if (!VisionLibraryCore_frameworkLibrary_20)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t AXMHasInternalSecurityPrivilages()
{
  if (AXMHasInternalSecurityPrivilages_onceToken != -1)
    dispatch_once(&AXMHasInternalSecurityPrivilages_onceToken, &__block_literal_global_38);
  return AXMHasInternalSecurityPrivilages__IsInternal;
}

id AXMWorkingDirectory(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v2 = (void *)MEMORY[0x1E0C99E98];
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Library/Accessibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v13);
      v10 = v13;

      if (v10)
      {
        AXMediaLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          AXMWorkingDirectory_cold_1((uint64_t)v5, (uint64_t)v10, v11);

      }
    }

  }
  return v5;
}

id AXMDescription(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37A0];
  v2 = a1;
  objc_msgSend(v1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axmAppendRecursiveDescription:withIndentation:", v3, 0);

  return v3;
}

id _AXMMakeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  AXMMakeError_(a1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id AXMMakeError_(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("AXMediaUtilities"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL AXMFloatApproxEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL AXMFloatWithin(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) < a3;
}

uint64_t AXMStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f,%.1f,%.1f,%.1f"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t AXMStringFromNormalizedCGRect(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f,%.2f,%.2f,%.2f"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t AXMStringFromCGSize(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f,%.1f"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t AXMStringFromCGPoint(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f,%.1f"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

__n64 AXMCGRectFromCGPoints(unint64_t *a1, uint64_t a2)
{
  __n64 result;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat *v6;
  uint64_t v7;
  CGRect v8;

  if (a2)
  {
    result.n64_u64[0] = *a1;
    v3 = a1[1];
    v4 = 0;
    if (a2 >= 2)
    {
      v5 = a2 - 1;
      v6 = (CGFloat *)(a1 + 3);
      v7 = 0;
      do
      {
        v8.origin.x = *(v6 - 1);
        v8.origin.y = *v6;
        v8.size.width = 0.0;
        v8.size.height = 0.0;
        *(CGRect *)result.n64_u64 = CGRectUnion(*(CGRect *)result.n64_u64, v8);
        v6 += 2;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    return *(__n64 *)MEMORY[0x1E0C9D648];
  }
  return result;
}

BOOL AXMSizeWithin(double a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v5;

  v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL AXMRectApproxEqual(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.001
      && vabdd_f64(a2, a6) < 0.001
      && vabdd_f64(a3, a7) < 0.001
      && vabdd_f64(a4, a8) < 0.001;
}

double AXMPointDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double AXMRectCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double AXMRectDistance(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MidY;
  double v17;
  CGFloat v18;
  double MidX;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  MidY = CGRectGetMidY(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  v17 = CGRectGetMidX(v22);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  v18 = CGRectGetMidY(v23);
  return sqrt((MidY - v18) * (MidY - v18) + (MidX - v17) * (MidX - v17));
}

uint64_t AXMEXIFOrientationForDeviceOrientationAndCameraPosition(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
    return 1;
  if ((unint64_t)(a1 - 1) > 3)
    return 6;
  return dword_1B0F00600[a1 - 1];
}

id __AXMStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  __AXMStringForVariablesWithVariadics(a1, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __AXMStringForVariablesWithVariadics(void *a1, id *a2)
{
  id v3;
  id v4;
  id *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id *v11;

  v3 = a1;
  v11 = a2;
  objc_opt_class();
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "appendString:", v3);
  while (1)
  {
    v5 = v11++;
    v6 = *v5;
    if (!v6 || (objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v6, "length"))
      goto LABEL_12;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("__AXMStringForVariablesSentinel")) & 1) != 0)
      break;
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v4, "length"))
      v8 = CFSTR(", %@");
    else
      v8 = CFSTR("%@");
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v9);

LABEL_12:
  }

  return v4;
}

id AXMLabelForNSStringElements(void *a1, int a2, int a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;

  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);

    v7 = v4 - 1;
    if (v4 != 1)
    {
      v8 = 0;
      v9 = v4 - 2;
      v10 = CFSTR(" %@");
      v22 = v7;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndex:", v8 + 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          if (a2)
            break;
        }
        if (v9 != v8 || !a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v11);
          goto LABEL_11;
        }
        objc_msgSend(v5, "appendString:", CFSTR(" "));
        v12 = v3;
        v13 = v9;
        v14 = v10;
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("last.string.to.append.in.a.sentence"), &stru_1E6260C18, CFSTR("Accessibility"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v17, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v18);

        v10 = v14;
        v9 = v13;
        v3 = v12;
        v7 = v22;

LABEL_12:
        if (v7 == ++v8)
          goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v11);
LABEL_11:
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v16);
      goto LABEL_12;
    }
LABEL_13:
    v19 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  return v20;
}

id _AXMCachedDateFormatterForFormat(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  if (_AXMCachedDateFormatterForFormat_onceToken != -1)
    dispatch_once(&_AXMCachedDateFormatterForFormat_onceToken, &__block_literal_global_57);
  v2 = _AXMCachedDateFormatterForFormat_AXDateFormatterQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___AXMCachedDateFormatterForFormat_block_invoke_2;
  v6[3] = &unk_1E625CA50;
  v7 = v1;
  v8 = &v9;
  v3 = v1;
  dispatch_sync(v2, v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

id AXMDateStringForFormat(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  _AXMCachedDateFormatterForFormat(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AXMFormatNumber(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = AXMFormatNumber__AXNumberFormatterOnceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AXMFormatNumber__AXNumberFormatterOnceToken, &__block_literal_global_63);
  objc_msgSend((id)AXMFormatNumber__AXNumberFormatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXMFormatInteger(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  AXMFormatNumber(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double AXMClampDouble(double result, double a2, double a3)
{
  if (result >= a3)
    result = a3;
  if (result > a3)
    return a3;
  return result;
}

uint64_t _AXMTaskHasEntitlement(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  CFTypeID v4;
  uint64_t v5;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID()))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

uint64_t AXMSelfTaskHasEntitlement(void *a1)
{
  id v1;
  id v2;
  uint64_t HasEntitlement;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __AXMSelfTaskHasEntitlement_block_invoke;
  v5[3] = &unk_1E625F710;
  v6 = v1;
  v2 = v1;
  HasEntitlement = _AXMTaskHasEntitlement((uint64_t)v2, (uint64_t)v5);

  return HasEntitlement;
}

uint64_t AXMCopyValueForEntitlementFromSelf(void *a1)
{
  _AXMCopyValueForEntitlementUsingTaskCreationBlock(a1, (uint64_t)&__block_literal_global_104_0);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t AXMAuditTokenTaskHasEntitlement(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t HasEntitlement;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AXMAuditTokenTaskHasEntitlement_block_invoke;
  v7[3] = &unk_1E625F738;
  v8 = v3;
  v9 = a1;
  v4 = v3;
  HasEntitlement = _AXMTaskHasEntitlement((uint64_t)v4, (uint64_t)v7);

  return HasEntitlement;
}

uint64_t AXMCopyValueForEntitlementFromAuditTokenTask(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __AXMCopyValueForEntitlementFromAuditTokenTask_block_invoke;
  v3[3] = &__block_descriptor_40_e17_____SecTask__8__0l;
  v3[4] = a1;
  _AXMCopyValueForEntitlementUsingTaskCreationBlock(a2, (uint64_t)v3);
  return objc_claimAutoreleasedReturnValue();
}

id _AXMCopyValueForEntitlementUsingTaskCreationBlock(void *a1, uint64_t a2)
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFErrorRef error;

  v3 = a1;
  v4 = (__SecTask *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      AXMediaLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_2((uint64_t)&error, v7, v8, v9, v10, v11, v12, v13);

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    AXMediaLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_1((uint64_t)v3, v14, v15, v16, v17, v18, v19, v20);

    v6 = 0;
  }

  return v6;
}

id MLMultiArray.subscript.getter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1B0EF3260();
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v5);
      sub_1B0EF3248();
      sub_1B0EF326C();
      sub_1B0EF3278();
      sub_1B0EF3254();
      --v2;
    }
    while (v2);
  }
  sub_1B0EECFF4(0, &qword_1EEEDA020);
  v6 = (void *)sub_1B0EF3164();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v6);

  return v7;
}

Swift::Float __swiftcall MLMultiArray.floatValue(_:)(Swift::OpaquePointer a1)
{
  id v1;
  float v2;
  float v3;

  v1 = MLMultiArray.subscript.getter((uint64_t)a1._rawValue);
  objc_msgSend(v1, sel_floatValue);
  v3 = v2;

  return v3;
}

id AXBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  objc_class *v10;
  id v21;

  v21 = objc_allocWithZone(v10);
  return AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

id AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  char *v10;
  char *v21;
  char *v22;
  float *v23;
  float *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  id v31;
  objc_super v33;

  v21 = &v10[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  v22 = v10;
  sub_1B0EF3098();
  v23 = (float *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat] = 0;
  v24 = (float *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle] = 0;
  v25 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth];
  *(_DWORD *)v25 = 0;
  v25[4] = 1;
  v26 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  v26[16] = 1;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints] = 0;
  v27 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize];
  *(_QWORD *)v27 = 0;
  v27[8] = 1;
  swift_beginAccess();
  v28 = sub_1B0EF30A4();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 24))(v21, a1, v28);
  swift_endAccess();
  swift_beginAccess();
  *v23 = a5;
  swift_beginAccess();
  *v24 = a6;
  v30 = (double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
  *v30 = a7;
  v30[1] = a8;
  v30[2] = a9;
  v30[3] = a10;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex] = a2;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass] = a3;
  *(double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen] = a4;
  *(double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen] = a4;

  v33.receiver = v22;
  v33.super_class = (Class)type metadata accessor for AXBoundingBox();
  v31 = objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v28);
  return v31;
}

uint64_t type metadata accessor for AXBoundingBox()
{
  uint64_t result;

  result = qword_1EEEDA2D0;
  if (!qword_1EEEDA2D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B0EDF174@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  v4 = sub_1B0EF30A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_1B0EDF1DC(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_1B0EF30A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_1B0EDF2A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  v4 = sub_1B0EF30A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1B0EDF304(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  v4 = sub_1B0EF30A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1B0EDF370())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_1B0EDF3B4@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_1B0EDF404(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0EDF544(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
}

float sub_1B0EDF410()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_1B0EDF454(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B0EDF4A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_1B0EDF4E8@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_1B0EDF538(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0EDF544(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
}

uint64_t sub_1B0EDF544(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v5;
  _DWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_DWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

float sub_1B0EDF594()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_1B0EDF5D8(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B0EDF628())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1B0EDF66C(_QWORD *a1@<X0>, CGFloat *a2@<X8>)
{
  CGRect *v3;
  CGFloat MidX;
  CGFloat MidY;

  v3 = (CGRect *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v3);
  MidY = CGRectGetMidY(*v3);
  *a2 = MidX;
  a2[1] = MidY;
}

float64x2_t sub_1B0EDF6DC(float64x2_t *a1, _QWORD *a2)
{
  float64x2_t *v3;
  float64x2_t result;

  v3 = (float64x2_t *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V2.2D, #-0.5 }
  result = vaddq_f64(*a1, vmulq_f64(v3[1], _Q2));
  *v3 = result;
  return result;
}

double sub_1B0EDF73C()
{
  uint64_t v0;
  CGRect *v1;
  double MidX;

  v1 = (CGRect *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v1);
  CGRectGetMidY(*v1);
  return MidX;
}

float64x2_t sub_1B0EDF7A8(float64_t a1, float64_t a2)
{
  uint64_t v2;
  float64x2_t *v3;
  float64x2_t v9;
  float64x2_t result;

  v3 = (float64x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V1.2D, #-0.5 }
  v9.f64[0] = a1;
  v9.f64[1] = a2;
  result = vaddq_f64(v9, vmulq_f64(v3[1], _Q1));
  *v3 = result;
  return result;
}

void (*sub_1B0EDF808(CGFloat **a1))(uint64_t *a1)
{
  uint64_t v1;
  CGFloat *v3;
  uint64_t v4;
  CGRect *v5;
  CGFloat MidX;
  CGFloat MidY;

  v3 = (CGFloat *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = (CGRect *)(v1 + v4);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v5);
  MidY = CGRectGetMidY(*v5);
  v3[3] = MidX;
  v3[4] = MidY;
  return sub_1B0EDF894;
}

void sub_1B0EDF894(uint64_t *a1)
{
  uint64_t v1;
  float64x2_t *v2;

  v1 = *a1;
  v2 = (float64x2_t *)(*(_QWORD *)(v1 + 40) + *(_QWORD *)(v1 + 48));
  __asm { FMOV            V2.2D, #-0.5 }
  *v2 = vaddq_f64(*(float64x2_t *)(v1 + 24), vmulq_f64(v2[1], _Q2));
  free((void *)v1);
}

__n128 sub_1B0EDF8BC@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  result = v3[1];
  *a2 = result;
  return result;
}

uint64_t sub_1B0EDF90C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  result = swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

double sub_1B0EDF960()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  return *(double *)(v1 + 16);
}

uint64_t sub_1B0EDF9A4(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  result = swift_beginAccess();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return result;
}

void (*sub_1B0EDF9F8(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v5 + 16);
  return sub_1B0EDFA64;
}

void sub_1B0EDFA64(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *(_OWORD *)(*(_QWORD *)(v1 + 40) + *(_QWORD *)(v1 + 48) + 16) = *(_OWORD *)(v1 + 24);
  free((void *)v1);
}

__n128 sub_1B0EDFA7C@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_1B0EDFACC(__n128 *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  result = v6;
  *(__n128 *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

double sub_1B0EDFB30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B0EDFB78(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v9;
  uint64_t result;

  v9 = (double *)(v4 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  result = swift_beginAccess();
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t (*sub_1B0EDFBE0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B0EDFC24@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1B0EDFC74(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1B0EDFCC0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1B0EDFD04(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B0EDFD4C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B0EDFD90@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B0EDFDE4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0EDFE4C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B0EDFE94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B0EDFEE4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1B0EDFF28@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_1B0EDFF78(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0EE00B8(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
}

double sub_1B0EDFF84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B0EDFFC8(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B0EE0018())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1B0EE005C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_1B0EE00AC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0EE00B8(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
}

uint64_t sub_1B0EE00B8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

double sub_1B0EE0108()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B0EE014C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B0EE019C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B0EE01E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 4);
  *(_DWORD *)a2 = *(_DWORD *)v3;
  *(_BYTE *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_1B0EE0238(int *a1, _QWORD *a2)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  result = swift_beginAccess();
  *(_DWORD *)v4 = v2;
  *(_BYTE *)(v4 + 4) = v3;
  return result;
}

unint64_t sub_1B0EE0294()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth);
  swift_beginAccess();
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

uint64_t sub_1B0EE02E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  result = swift_beginAccess();
  *(_DWORD *)v3 = a1;
  *(_BYTE *)(v3 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*sub_1B0EE0338())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__n128 sub_1B0EE037C@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_1B0EE03D4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  result = swift_beginAccess();
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  *(_BYTE *)(v5 + 16) = v4;
  return result;
}

uint64_t sub_1B0EE0430()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1B0EE0478(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;

  v7 = v3 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  result = swift_beginAccess();
  *(_QWORD *)v7 = a1;
  *(_QWORD *)(v7 + 8) = a2;
  *(_BYTE *)(v7 + 16) = a3 & 1;
  return result;
}

uint64_t (*sub_1B0EE04D8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B0EE0520@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B0EE0574(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0EE05DC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B0EE0624(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B0EE0674())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B0EE06B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 8);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_1B0EE0710(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  result = swift_beginAccess();
  *(_QWORD *)v4 = v2;
  *(_BYTE *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_1B0EE076C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1B0EE07B4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  result = swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_1B0EE0810())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t Array<A>.argmax()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_1B0EF31AC();
  MEMORY[0x1B5E12DAC](MEMORY[0x1E0DEAF38], v1);
  sub_1B0EF3140();
  v2 = sub_1B0EF32B4();
  MEMORY[0x1B5E12DAC](MEMORY[0x1E0DECC68], v2);
  sub_1B0EF314C();
  swift_bridgeObjectRelease();
  return a1;
}

AXMediaUtilities::UIType_optional __swiftcall UIType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 14;
  if ((unint64_t)rawValue < 0xE)
    v2 = rawValue;
  *v1 = v2;
  return (AXMediaUtilities::UIType_optional)rawValue;
}

double CGRect.init(centerX:y:width:height:)(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

AXMediaUtilities::UITypeClickability_optional __swiftcall UITypeClickability.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 17;
  if ((unint64_t)rawValue < 0x11)
    v2 = rawValue;
  *v1 = v2;
  return (AXMediaUtilities::UITypeClickability_optional)rawValue;
}

uint64_t static AXBoundingBox.nonMaximalSuppression(boxes:maxBoxes:)(unint64_t a1, uint64_t a2, char a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  CGRect *v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v3 = a1;
  v4 = 0;
  v32 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_52;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      while (1)
      {
        if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain_n();
          v5 = (uint64_t)sub_1B0EE5148(v3);
          swift_bridgeObjectRelease();
        }
        else
        {
          v5 = v3 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
        }
        v30 = v5;
        sub_1B0EE50D0((uint64_t *)&v30);
        if (v4)
        {
          result = swift_release();
          __break(1u);
          return result;
        }
        swift_bridgeObjectRelease_n();
        v6 = v30;
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        v31 = v6;
        if (!isUniquelyReferenced_nonNull_bridgeObject
          || (v6 & 0x8000000000000000) != 0
          || (v6 & 0x4000000000000000) != 0)
        {
          sub_1B0EE523C(v6);
        }
        v3 = v6 & 0xFFFFFFFFFFFFFF8;
        v8 = *(_QWORD *)(v3 + 16);
        if (v8)
          break;
LABEL_51:
        __break(1u);
LABEL_52:
        swift_bridgeObjectRetain();
        v25 = sub_1B0EF32C0();
        swift_bridgeObjectRelease();
        if (v25 <= 0)
          goto LABEL_55;
        swift_bridgeObjectRetain();
        if (sub_1B0EF32C0() < 1)
        {
          swift_bridgeObjectRelease();
          return MEMORY[0x1E0DEE9D8];
        }
      }
      v9 = v8 - 1;
      v11 = *(void **)(v3 + 32);
      v10 = v3 + 32;
      memmove((void *)v10, (const void *)(v10 + 8), 8 * (v8 - 1));
      *(_QWORD *)(v10 - 16) = v9;
      sub_1B0EF317C();
      v12 = v11;
      v3 = (unint64_t)&v32;
      MEMORY[0x1B5E118D0]();
      if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B0EF3188();
      sub_1B0EF31A0();
      sub_1B0EF317C();
      v13 = v31;
      v30 = MEMORY[0x1E0DEE9D8];
      if ((unint64_t)v31 >> 62)
      {
        if (v31 < 0)
          v3 = v31;
        else
          v3 = v31 & 0xFFFFFFFFFFFFFF8;
        v23 = v12;
        swift_bridgeObjectRetain();
        v14 = sub_1B0EF32C0();
      }
      else
      {
        v14 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
        v15 = v12;
        swift_bridgeObjectRetain();
      }
      v16 = (CGRect *)&v12[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
      swift_beginAccess();
      if (v14)
      {
        v29 = v12;
        v17 = 0;
        v4 = v13 & 0xFFFFFFFFFFFFFF8;
        while (1)
        {
          if ((v13 & 0xC000000000000001) != 0)
          {
            v18 = (id)MEMORY[0x1B5E119A8](v17, v13);
          }
          else
          {
            if (v17 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_50;
            v18 = *(id *)(v13 + 8 * v17 + 32);
          }
          v19 = v18;
          v20 = v17 + 1;
          if (__OFADD__(v17, 1))
            break;
          v3 = (unint64_t)v18 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
          swift_beginAccess();
          if (CGRectIntersectsRect(*(CGRect *)v3, *v16))
          {
            *v16 = CGRectUnion(*v16, *(CGRect *)v3);

          }
          else
          {
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            v3 = (unint64_t)&v30;
            sub_1B0EF3254();
          }
          ++v17;
          if (v20 == v14)
          {
            v3 = v30;
            v12 = v29;
            v4 = 0;
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      v3 = MEMORY[0x1E0DEE9D8];
LABEL_30:
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if ((a3 & 1) != 0)
      {

      }
      else
      {
        v21 = v32;
        if (v32 >> 62)
        {
          swift_bridgeObjectRetain();
          v22 = sub_1B0EF32C0();
          swift_bridgeObjectRelease();
        }
        else
        {
          v22 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
        }

        if (v22 == a2)
        {
          swift_release();
          return v21;
        }
      }
      if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        v24 = sub_1B0EF32C0();
        swift_release();
        if (v24 <= 0)
        {
LABEL_48:
          swift_release();
          return v32;
        }
      }
      else if (*(uint64_t *)(v3 + 16) <= 0)
      {
        goto LABEL_48;
      }
    }
  }
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return v3;
}

void sub_1B0EE0E00(uint64_t a1)
{
  uint64_t v1;
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = (CGRect *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectUnion(v18, *v8);
  v9 = v19.origin.x;
  v10 = v19.origin.y;
  v11 = v19.size.width;
  v12 = v19.size.height;
  v13 = CGRectGetHeight(v19);
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  if (sqrt(v13 * CGRectGetWidth(v20)) != 0.0)
  {
    v21 = CGRectIntersection(*v3, *v8);
    v14 = v21.origin.x;
    v15 = v21.origin.y;
    v16 = v21.size.width;
    v17 = v21.size.height;
    CGRectGetHeight(v21);
    v22.origin.x = v14;
    v22.origin.y = v15;
    v22.size.width = v16;
    v22.size.height = v17;
    CGRectGetWidth(v22);
  }
}

AXMediaUtilities::UIType_optional sub_1B0EE0F88()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int *v2;
  AXMediaUtilities::UIType_optional result;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat MidX;
  uint64_t v11;
  unint64_t v12;
  CGFloat MidY;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v1 = v0;
  v2 = (Swift::Int *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  result.value = UIType.init(rawValue:)(*v2).value;
  if (v16 == 14)
  {
    __break(1u);
  }
  else
  {
    sub_1B0EF3218();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA028);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B0F00610;
    v5 = (int *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
    swift_beginAccess();
    v6 = *v5;
    v7 = MEMORY[0x1E0DEB1E8];
    *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEB188];
    *(_QWORD *)(v4 + 64) = v7;
    *(_DWORD *)(v4 + 32) = v6;
    sub_1B0EF311C();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    sub_1B0EF3128();
    sub_1B0EF3134();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1B0F00620;
    v9 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
    swift_beginAccess();
    MidX = CGRectGetMidX(*(CGRect *)v9);
    CGRectGetMidY(*(CGRect *)v9);
    v11 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEF040];
    v12 = sub_1B0EE93E8();
    *(_QWORD *)(v8 + 64) = v12;
    *(CGFloat *)(v8 + 32) = MidX;
    CGRectGetMidX(*(CGRect *)v9);
    MidY = CGRectGetMidY(*(CGRect *)v9);
    *(_QWORD *)(v8 + 96) = v11;
    *(_QWORD *)(v8 + 104) = v12;
    *(CGFloat *)(v8 + 72) = MidY;
    sub_1B0EF311C();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B0F00620;
    *(_QWORD *)(v14 + 56) = v11;
    *(_QWORD *)(v14 + 64) = v12;
    v15 = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v14 + 32) = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(v14 + 96) = v11;
    *(_QWORD *)(v14 + 104) = v12;
    *(_QWORD *)(v14 + 72) = v15;
    sub_1B0EF311C();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    swift_bridgeObjectRelease();
    sub_1B0EF3134();
    return (AXMediaUtilities::UIType_optional)60;
  }
  return result;
}

double static AXBoundingBox.enlarge(rect:by:)(double a1, double a2, double a3, double a4, double a5)
{
  return a1 - (a3 * a5 - a3) * 0.5;
}

float64x2_t sub_1B0EE1310(float64_t a1, float64_t a2)
{
  uint64_t v2;
  float64x2_t *v3;
  float64x2_t v4;
  float64x2_t result;
  float64x2_t v6;

  v3 = (float64x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v4.f64[0] = a1;
  v4.f64[1] = a2;
  result = vmulq_f64(*v3, v4);
  v6 = vmulq_f64(v3[1], v4);
  *v3 = result;
  v3[1] = v6;
  return result;
}

void sub_1B0EE136C()
{
  uint64_t v0;
  CGRect *v1;
  CGFloat y;
  CGFloat x;
  CGFloat Height;
  CGFloat Width;
  CGRect v6;

  v1 = (CGRect *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  x = v1->origin.x;
  y = v1->origin.y;
  v6.size.width = v1->size.width;
  v6.size.height = v1->size.height;
  v6.origin.x = v1->origin.x;
  v6.origin.y = y;
  Height = CGRectGetHeight(v6);
  Width = CGRectGetWidth(*v1);
  v1->origin.x = y;
  v1->origin.y = x;
  v1->size.width = Height;
  v1->size.height = Width;
}

float64x2_t sub_1B0EE13E8()
{
  uint64_t v0;
  float64x2_t *v1;
  float64x2_t v2;
  double v3;
  float64x2_t result;

  v1 = (float64x2_t *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v2 = v1[1];
  v3 = v1[1].f64[1];
  if (v2.f64[0] > v3)
    v3 = v1[1].f64[0];
  __asm { FMOV            V3.2D, #-0.5 }
  result = vaddq_f64(*v1, vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0), v2), _Q3));
  *v1 = result;
  v1[1].f64[0] = v3;
  v1[1].f64[1] = v3;
  return result;
}

char *sub_1B0EE1454(CGFloat *a1)
{
  uint64_t v1;
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGPoint v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGPoint v27;
  unint64_t v28;
  unint64_t v29;
  CGFloat v30;
  CGPoint v31;
  CGFloat v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  CGPoint v37;
  unint64_t v38;
  int64_t v39;
  double *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  int *v44;
  int v45;
  char *v46;
  int *v47;
  int v48;
  char *v49;
  uint64_t *v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  char *v58;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  uint64_t v66;
  CGAffineTransform v67;
  CGPoint v68;
  CGPoint v69;
  CGPoint v70;
  CGPoint v71;

  v2 = v1;
  v3 = *a1;
  v4 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v8 = a1[4];
  v7 = a1[5];
  v9 = sub_1B0EF30A4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v14 = *v13;
  v15 = v13[1];
  v16 = v13[3];
  v60 = v13[2];
  v65 = v15 + v16;
  v66 = MEMORY[0x1E0DEE9D8];
  sub_1B0EE4B9C(0, 4, 0);
  v17 = v66;
  v61 = v8;
  v62 = v3;
  v67.a = v3;
  v67.b = v4;
  v18 = v4;
  v19 = v6;
  v67.c = v6;
  v67.d = v5;
  v20 = v5;
  v67.tx = v8;
  v67.ty = v7;
  v63 = v15;
  v64 = v7;
  v68.x = v14;
  v68.y = v15;
  v21 = CGPointApplyAffineTransform(v68, &v67);
  v23 = *(_QWORD *)(v17 + 16);
  v22 = *(_QWORD *)(v17 + 24);
  if (v23 >= v22 >> 1)
  {
    sub_1B0EE4B9C((char *)(v22 > 1), v23 + 1, 1);
    v17 = v66;
  }
  v24 = v14 + v60;
  *(_QWORD *)(v17 + 16) = v23 + 1;
  *(CGPoint *)(v17 + 16 * v23 + 32) = v21;
  v25 = v61;
  v26 = v62;
  v67.a = v62;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  v69.y = v65;
  v67.tx = v61;
  v67.ty = v64;
  v69.x = v14;
  v27 = CGPointApplyAffineTransform(v69, &v67);
  v29 = *(_QWORD *)(v17 + 16);
  v28 = *(_QWORD *)(v17 + 24);
  if (v29 >= v28 >> 1)
  {
    sub_1B0EE4B9C((char *)(v28 > 1), v29 + 1, 1);
    v17 = v66;
  }
  *(_QWORD *)(v17 + 16) = v29 + 1;
  *(CGPoint *)(v17 + 16 * v29 + 32) = v27;
  v67.a = v26;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  v70.y = v63;
  v30 = v64;
  v67.tx = v25;
  v67.ty = v64;
  v70.x = v24;
  v31 = CGPointApplyAffineTransform(v70, &v67);
  v32 = v24;
  v34 = *(_QWORD *)(v17 + 16);
  v33 = *(_QWORD *)(v17 + 24);
  v35 = v34 + 1;
  if (v34 >= v33 >> 1)
  {
    v63 = v24;
    sub_1B0EE4B9C((char *)(v33 > 1), v34 + 1, 1);
    v32 = v63;
  }
  v36 = v66;
  *(_QWORD *)(v66 + 16) = v35;
  *(CGPoint *)(v36 + 16 * v34 + 32) = v31;
  v67.a = v26;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  v67.tx = v25;
  v67.ty = v30;
  v71.x = v32;
  v71.y = v65;
  v37 = CGPointApplyAffineTransform(v71, &v67);
  v38 = *(_QWORD *)(v36 + 24);
  v39 = v34 + 2;
  if (v35 >= v38 >> 1)
  {
    sub_1B0EE4B9C((char *)(v38 > 1), v39, 1);
    v36 = v66;
  }
  *(_QWORD *)(v36 + 16) = v39;
  *(CGPoint *)(v36 + 16 * v35 + 32) = v37;
  v40 = (double *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  v41 = (char *)_s16AXMediaUtilities13AXBoundingBoxC9timestamp10containing4heatACSd_SaySo7CGPointVGSftcfC_0(v36, *v40, 0.0);
  v42 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v42, v9);
  v43 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v43, v12, v9);
  swift_endAccess();
  v44 = (int *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  v45 = *v44;
  v46 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  swift_beginAccess();
  *(_DWORD *)v46 = v45;
  v47 = (int *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  v48 = *v47;
  v49 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  swift_beginAccess();
  *(_DWORD *)v49 = v48;
  v50 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  v51 = *v50;
  v52 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
  swift_beginAccess();
  *(_QWORD *)v52 = v51;
  v53 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  v54 = *v53;
  v55 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass];
  swift_beginAccess();
  *(_QWORD *)v55 = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v56 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  swift_beginAccess();
  v57 = *v56;
  v58 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen];
  swift_beginAccess();
  *(_QWORD *)v58 = v57;
  return v41;
}

uint64_t sub_1B0EE1910(uint64_t a1, float a2)
{
  uint64_t v2;
  CGRect *v4;
  double MidX;
  CGRect *v6;
  double v7;
  double v8;
  double v9;
  double MidY;
  double v11;
  CGFloat v12;
  CGFloat v13;
  float *v14;
  float v15;
  float *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  int v30;
  _DWORD *v31;
  uint64_t v32;
  float v33;
  uint64_t v34;
  float v35;
  float32x2_t *v36;
  float32x2_t v37;
  float32x2_t *v38;
  uint64_t v39;
  float32x2_t v40;
  unint64_t v41;
  float32x2_t *v42;
  const double *v43;
  float32x4_t v44;
  __int128 v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD *v48;
  float v49;

  v4 = (CGRect *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v4);
  CGRectGetMidY(*v4);
  v6 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v7 = CGRectGetMidX(*v6);
  CGRectGetMidY(*v6);
  v49 = 1.0 - a2;
  v8 = (float)(1.0 - a2);
  v9 = MidX * v8 + v7 * a2;
  CGRectGetMidX(*v4);
  MidY = CGRectGetMidY(*v4);
  CGRectGetMidX(*v6);
  v11 = MidY * v8 + CGRectGetMidY(*v6) * a2;
  v12 = v4->size.width * v8 + v6->size.width * a2;
  v13 = v4->size.height * v8 + v6->size.height * a2;
  v14 = (float *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  v15 = *v14;
  v16 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  v17 = (float)((float)(1.0 - a2) * v15) + (float)(*v16 * a2);
  v4->origin.x = v9 - v12 * 0.5;
  v4->origin.y = v11 - v13 * 0.5;
  v4->size.width = v12;
  v4->size.height = v13;
  *v14 = v17;
  v18 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass;
  swift_beginAccess();
  v19 = *(_QWORD *)(*(_QWORD *)v18 + 16);
  v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  v21 = swift_beginAccess();
  if (v19 == *(_QWORD *)(*v20 + 16))
  {
    MEMORY[0x1E0C80A78](v21);
    v22 = swift_bridgeObjectRetain();
    v23 = sub_1B0EE94BC(v22, (float (*)(uint64_t, float))sub_1B0EE942C);
    swift_bridgeObjectRelease();
    *v20 = v23;
    result = swift_bridgeObjectRelease();
    v25 = *v20;
    v26 = *(_QWORD *)(v25 + 16);
    if (v26)
    {
      v27 = 0;
      v28 = 0;
      while (v28 < v26)
      {
        if (*(float *)(v25 + 32 + 4 * v28) < *(float *)(v25 + 32 + 4 * v27))
          v28 = v27;
        if (v26 == ++v27)
          goto LABEL_10;
      }
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v28 = 0;
LABEL_10:
    v29 = (unint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
    result = swift_beginAccess();
    *v29 = v28;
    if ((v28 & 0x8000000000000000) != 0)
      goto LABEL_26;
    if (v28 >= *(_QWORD *)(v25 + 16))
    {
LABEL_27:
      __break(1u);
      return result;
    }
    v30 = *(_DWORD *)(v25 + 4 * v28 + 32);
    v31 = (_DWORD *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
    swift_beginAccess();
    *v31 = v30;
  }
  v32 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  swift_beginAccess();
  if ((*(_BYTE *)(v32 + 4) & 1) == 0)
  {
    v33 = *(float *)v32;
    v34 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
    swift_beginAccess();
    if ((*(_BYTE *)(v34 + 4) & 1) != 0)
      v35 = v33;
    else
      v35 = (float)(v33 * a2) + (float)(v49 * *(float *)v34);
    *(float *)v34 = v35;
    *(_BYTE *)(v34 + 4) = 0;
  }
  v36 = (float32x2_t *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
  swift_beginAccess();
  if ((v36[1].i8[0] & 1) == 0)
  {
    v37 = *v36;
    v38 = (float32x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
    swift_beginAccess();
    if ((v38[1].i8[0] & 1) == 0)
    {
      *v38 = vadd_f32(vmul_n_f32(v37, a2), vmul_n_f32(*v38, v49));
      v38[1].i8[0] = 0;
    }
  }
  v39 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  swift_beginAccess();
  if ((*(_BYTE *)(v39 + 16) & 1) == 0)
  {
    v40 = *(float32x2_t *)v39;
    v41 = *(_QWORD *)(v39 + 8);
    v42 = (float32x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
    swift_beginAccess();
    if ((v42[2].i8[0] & 1) == 0)
    {
      v43 = (const double *)&v42[1];
      v44 = (float32x4_t)vld1q_dup_f64(v43);
      *(float32x2_t *)&v45 = vadd_f32(vmul_n_f32(v40, a2), vmul_n_f32(*v42, v49));
      *((float *)&v45 + 2) = vmuls_lane_f32(a2, (float32x4_t)vdupq_n_s64(v41), 2) + vmuls_lane_f32(v49, v44, 2);
      HIDWORD(v45) = 0;
      *(_OWORD *)v42->f32 = v45;
      v42[2].i8[0] = 0;
    }
  }
  v46 = (uint64_t *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  v47 = *v46;
  v48 = (_QWORD *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  result = swift_beginAccess();
  *v48 = v47;
  return result;
}

uint64_t BinaryFloatingPoint.ema<A>(to:amount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a6;
  v35 = a7;
  v36 = a5;
  v28 = a2;
  v34 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v30 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v28 - v15;
  v31 = *(_QWORD *)(a3 - 8);
  v17 = MEMORY[0x1E0C80A78](v14);
  v32 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v28 - v20;
  MEMORY[0x1E0C80A78](v19);
  v29 = (char *)&v28 - v22;
  swift_getAssociatedConformanceWitness();
  sub_1B0EF33C8();
  sub_1B0EF33B0();
  sub_1B0EF32A8();
  v23 = v30;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, a4);
  sub_1B0EF30E0();
  v24 = v29;
  sub_1B0EF31DC();
  v25 = *(void (**)(char *, uint64_t))(v31 + 8);
  v25(v21, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v16, v28, a4);
  v26 = v32;
  sub_1B0EF30E0();
  sub_1B0EF31DC();
  v25(v26, a3);
  sub_1B0EF329C();
  v25(v21, a3);
  return ((uint64_t (*)(char *, uint64_t))v25)(v24, a3);
}

void *static UIType.allCases.getter()
{
  return &unk_1E625B7F0;
}

BOOL sub_1B0EE2104(unsigned __int8 a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = a1;
  sub_1B0EF3404();
  sub_1B0EF3410();
  v4 = sub_1B0EF341C();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(unsigned __int8 *)(v8 + v11);
    result = v12 == v3;
    if (v12 == v3)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t AXMElementDetectorResult.__allocating_init(boundingBox:)(void *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1B0EE95C8((uint64_t)a1);

  return v4;
}

void *static UITypeClickability.allCases.getter()
{
  return &unk_1E625B608;
}

uint64_t AXMClickabilityDetectorResult.__allocating_init(boundingBox:)(void *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1B0EEA648((uint64_t)a1);

  return v4;
}

id sub_1B0EE22A0(float a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(float), void (*a7)(uint64_t))
{
  id v11;
  uint64_t v12;
  void *v13;

  sub_1B0EECFF4(0, &qword_1EEEDA020);
  sub_1B0EF3170();
  v11 = a4;
  a6(a1);

  v12 = swift_bridgeObjectRelease();
  a7(v12);
  v13 = (void *)sub_1B0EF3164();
  swift_bridgeObjectRelease();
  return v13;
}

id AXBoundingBox.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AXBoundingBox.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B0EE23C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B0EE23E8 + 4 * byte_1B0F006B0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_1B0EE23E8()
{
  return 1952540008;
}

uint64_t sub_1B0EE23F8()
{
  return 0x656C676E61;
}

uint64_t sub_1B0EE240C()
{
  return 1952671090;
}

uint64_t sub_1B0EE241C()
{
  return 0x646E497373616C63;
}

uint64_t sub_1B0EE2438()
{
  return 0x6C43794274616568;
}

uint64_t sub_1B0EE2458()
{
  return 0x6565537473726966;
}

uint64_t sub_1B0EE2474()
{
  return 0x6E6565537473616CLL;
}

uint64_t sub_1B0EE248C()
{
  return 0x6874706564;
}

uint64_t sub_1B0EE24A0()
{
  return 0x64696F72746E6563;
}

unint64_t sub_1B0EE24BC()
{
  return 0xD000000000000012;
}

uint64_t sub_1B0EE24D8()
{
  return 0x6C61636973796870;
}

BOOL sub_1B0EE24F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B0EE2510()
{
  return sub_1B0EF3410();
}

uint64_t sub_1B0EE253C()
{
  unsigned __int8 *v0;

  return sub_1B0EE23C0(*v0);
}

uint64_t sub_1B0EE2544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0EEC960(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0EE2568()
{
  return 0;
}

void sub_1B0EE2574(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1B0EE2580()
{
  sub_1B0EEB508();
  return sub_1B0EF3440();
}

uint64_t sub_1B0EE25A8()
{
  sub_1B0EEB508();
  return sub_1B0EF344C();
}

id AXBoundingBox.__deallocating_deinit()
{
  return sub_1B0EE44BC(0, type metadata accessor for AXBoundingBox);
}

uint64_t sub_1B0EE2640(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 *v20;
  char v21;
  uint64_t *v22;
  uint64_t *v23;
  char v24;
  _QWORD v25[2];
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  __int128 v30;
  char v31;
  char v32;
  char v33;
  char v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v2 = sub_1B0EF30A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA038);
  v39 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0EEB508();
  sub_1B0EF3434();
  v9 = v25[0];
  v10 = v25[0] + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  LOBYTE(v37) = 0;
  sub_1B0EEB560(&qword_1EEEDA040, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09B8]);
  v11 = v25[1];
  sub_1B0EF338C();
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v8, v6);
  }
  else
  {
    v12 = v3;
    v13 = v39;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v2);
    swift_beginAccess();
    LOBYTE(v37) = 1;
    sub_1B0EF3374();
    swift_beginAccess();
    LOBYTE(v37) = 2;
    sub_1B0EF3374();
    v15 = (__int128 *)(v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
    swift_beginAccess();
    v16 = v15[1];
    v37 = *v15;
    v38 = v16;
    v36 = 3;
    type metadata accessor for CGRect(0);
    sub_1B0EEB560(&qword_1EEEDA048, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9C0]);
    sub_1B0EF338C();
    swift_beginAccess();
    v36 = 4;
    sub_1B0EF3380();
    v17 = (uint64_t *)(v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
    swift_beginAccess();
    v35 = *v17;
    v34 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA050);
    sub_1B0EEB5A0(&qword_1EEEDA058, MEMORY[0x1E0DEB198], MEMORY[0x1E0DEAF10]);
    sub_1B0EF338C();
    swift_beginAccess();
    v34 = 6;
    sub_1B0EF3368();
    swift_beginAccess();
    v33 = 7;
    sub_1B0EF3368();
    v18 = v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
    swift_beginAccess();
    v19 = *(_BYTE *)(v18 + 4);
    v32 = 8;
    LOBYTE(v30) = v19;
    sub_1B0EF3344();
    v20 = (__int128 *)(v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
    swift_beginAccess();
    v21 = *((_BYTE *)v20 + 16);
    v30 = *v20;
    v31 = v21;
    LOBYTE(v29) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA060);
    sub_1B0EED02C(&qword_1EEEDA068, &qword_1EEEDA060, MEMORY[0x1E0DEDD60]);
    sub_1B0EF3350();
    v22 = (uint64_t *)(v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
    swift_beginAccess();
    v29 = *v22;
    LOBYTE(v27) = 10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA070);
    sub_1B0EEB600(&qword_1EEEDA078, &qword_1EEEDA068, MEMORY[0x1E0DEDD60], MEMORY[0x1E0DEAF10]);
    sub_1B0EF3350();
    v23 = (uint64_t *)(v9 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
    swift_beginAccess();
    v24 = *((_BYTE *)v23 + 8);
    v27 = *v23;
    v28 = v24;
    v26 = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA080);
    sub_1B0EED02C(&qword_1EEEDA088, &qword_1EEEDA080, MEMORY[0x1E0DEDD30]);
    sub_1B0EF3350();
    return (*(uint64_t (**)(char *, _QWORD))(v13 + 8))(v8, 0);
  }
}

void *AXBoundingBox.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AXBoundingBox.init(from:)(a1);
}

void *AXBoundingBox.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v23;
  char *v24;
  int v25;
  int v26;
  char *v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  objc_class *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  objc_super v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  __int128 v69;
  __int128 v70;

  v55 = sub_1B0EF30A4();
  v59 = *(_QWORD *)(v55 - 8);
  MEMORY[0x1E0C80A78](v55);
  v52 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA090);
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v1[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  v7 = v1;
  v58 = v6;
  sub_1B0EF3098();
  v50 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  *(_DWORD *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat] = 0;
  v8 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  *(_DWORD *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle] = 0;
  v9 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth];
  *(_DWORD *)v9 = 0;
  v9[4] = 1;
  v10 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v57 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints];
  *(_QWORD *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints] = 0;
  v60 = v7;
  v11 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = a1[3];
  v56 = a1;
  v13 = __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1B0EEB508();
  v14 = v54;
  sub_1B0EF3428();
  if (v14)
  {
    v15 = v55;
    v19 = v59;
    v20 = v58;
    v21 = v60;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v15);

    swift_bridgeObjectRelease();
    type metadata accessor for AXBoundingBox();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v54 = v8;
    v49 = v9;
    v48 = v10;
    v47 = v11;
    v16 = v51;
    LOBYTE(v69) = 0;
    sub_1B0EEB560(&qword_1EEEDA098, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09E0]);
    v17 = v52;
    v18 = v55;
    sub_1B0EF3338();
    v23 = v58;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v23, v17, v18);
    swift_endAccess();
    LOBYTE(v69) = 1;
    v52 = v5;
    sub_1B0EF3320();
    v24 = v60;
    v26 = v25;
    v27 = v50;
    swift_beginAccess();
    *(_DWORD *)v27 = v26;
    LOBYTE(v69) = 2;
    sub_1B0EF3320();
    v29 = v28;
    v30 = v54;
    swift_beginAccess();
    *(_DWORD *)v30 = v29;
    type metadata accessor for CGRect(0);
    v68 = 3;
    sub_1B0EEB560(&qword_1EEEDA0A0, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9E0]);
    sub_1B0EF3338();
    v31 = &v24[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
    *(_OWORD *)v31 = v69;
    *((_OWORD *)v31 + 1) = v70;
    LOBYTE(v69) = 4;
    *(_QWORD *)&v24[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex] = sub_1B0EF332C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA050);
    v68 = 5;
    sub_1B0EEB5A0(&qword_1EEEDA0A8, MEMORY[0x1E0DEB1C0], MEMORY[0x1E0DEAF40]);
    sub_1B0EF3338();
    *(_QWORD *)&v24[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass] = v69;
    LOBYTE(v69) = 6;
    sub_1B0EF3314();
    *(_QWORD *)&v24[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen] = v32;
    LOBYTE(v69) = 7;
    sub_1B0EF3314();
    *(_QWORD *)&v24[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen] = v33;
    LOBYTE(v69) = 8;
    v34 = sub_1B0EF32F0();
    v35 = v49;
    swift_beginAccess();
    *(_DWORD *)v35 = v34;
    v35[4] = BYTE4(v34) & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA060);
    v68 = 9;
    sub_1B0EED02C(&qword_1EEEDA0B0, &qword_1EEEDA060, MEMORY[0x1E0DEDD70]);
    sub_1B0EF32FC();
    v36 = v65;
    v37 = v66;
    v38 = v67;
    v39 = v48;
    swift_beginAccess();
    *(_QWORD *)v39 = v36;
    *((_QWORD *)v39 + 1) = v37;
    v39[16] = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA070);
    LOBYTE(v65) = 10;
    sub_1B0EEB600(&qword_1EEEDA0B8, &qword_1EEEDA0B0, MEMORY[0x1E0DEDD70], MEMORY[0x1E0DEAF40]);
    sub_1B0EF32FC();
    v40 = v62;
    v41 = v57;
    swift_beginAccess();
    *(_QWORD *)v41 = v40;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA080);
    LOBYTE(v62) = 11;
    sub_1B0EED02C(&qword_1EEEDA0C0, &qword_1EEEDA080, MEMORY[0x1E0DEDD40]);
    sub_1B0EF32FC();
    v42 = v63;
    LOBYTE(v41) = v64;
    v43 = v47;
    swift_beginAccess();
    *(_QWORD *)v43 = v42;
    v43[8] = (char)v41;
    v44 = v60;

    v45 = (objc_class *)type metadata accessor for AXBoundingBox();
    v61.receiver = v44;
    v61.super_class = v45;
    v13 = objc_msgSendSuper2(&v61, sel_init);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v52, v53);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  }
  return v13;
}

uint64_t sub_1B0EE3584@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  v4 = sub_1B0EF30A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1B0EE35EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B0EE49E8(a1, 0, (uint64_t (*)(uint64_t))type metadata accessor for AXBoundingBox, (uint64_t (*)(uint64_t))AXBoundingBox.init(from:), a2);
}

uint64_t sub_1B0EE3614(_QWORD *a1)
{
  return sub_1B0EE2640(a1);
}

uint64_t sub_1B0EE3634@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v27 - v15;
  v17 = *a1;
  v18 = *(int *)(v14 + 48);
  v20 = v19 + v18;
  v21 = (char *)a2 + v18;
  v22 = *a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v19 + v18, v21, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v16, v20, a3);
  sub_1B0EF31B8();
  v23 = sub_1B0EF30F8();
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v13, a3);
  result = ((uint64_t (*)(char *, uint64_t))v24)(v16, a3);
  if ((v23 & 1) != 0)
    v26 = v22;
  else
    v26 = v17;
  *a4 = v26;
  return result;
}

uint64_t BinaryFloatingPoint.clip(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0EF33D4();
  sub_1B0EF3104();
  sub_1B0EF33E0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t BinaryFloatingPoint.lerp(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t);
  _QWORD v16[2];

  v16[0] = a2;
  v16[1] = a4;
  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)v16 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v16 - v12;
  sub_1B0EF32A8();
  sub_1B0EF3104();
  sub_1B0EF32A8();
  sub_1B0EF30EC();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a3);
  v14(v11, a3);
  sub_1B0EF32A8();
  sub_1B0EF31DC();
  v14(v8, a3);
  sub_1B0EF329C();
  v14(v11, a3);
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, a3);
}

uint64_t BinaryFloatingPoint.clerp(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BinaryFloatingPoint.lerp(from:to:)(v6, v9, v10, (uint64_t)v8);
  BinaryFloatingPoint.clip(to:)(a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a3);
}

void sub_1B0EE3ACC(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E625B7F0;
}

AXMediaUtilities::UIType_optional sub_1B0EE3ADC(Swift::Int *a1)
{
  return UIType.init(rawValue:)(*a1);
}

uint64_t UITypeClickability.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1B0EE3AEC()
{
  sub_1B0EF3404();
  sub_1B0EF3410();
  return sub_1B0EF341C();
}

uint64_t sub_1B0EE3B30()
{
  sub_1B0EF3404();
  sub_1B0EF3410();
  return sub_1B0EF341C();
}

void sub_1B0EE3B70(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E625B608;
}

AXMediaUtilities::UITypeClickability_optional sub_1B0EE3B80(Swift::Int *a1)
{
  return UITypeClickability.init(rawValue:)(*a1);
}

void sub_1B0EE3B88(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t AXMElementDetectorResult.init(boundingBox:)(void *a1)
{
  uint64_t v2;

  v2 = sub_1B0EE95C8((uint64_t)a1);

  return v2;
}

double sub_1B0EE3BC0()
{
  return sub_1B0EE4308(&OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box);
}

uint64_t sub_1B0EE3BD8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label);
}

uint64_t sub_1B0EE3BF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1B0EE3C3C()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence);
}

void AXMElementDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B0EE3CB4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B0EE3CDC + 4 * byte_1B0F006BC[*v0]))(7892834, 0xE300000000000000);
}

uint64_t sub_1B0EE3CDC()
{
  return 0x6C6562616CLL;
}

uint64_t sub_1B0EE3CF0()
{
  return 0x6D614E6C6562616CLL;
}

uint64_t sub_1B0EE3D0C()
{
  return 0x6E656469666E6F63;
}

uint64_t sub_1B0EE3D28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0EECE3C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B0EE3D4C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1B0EE3D58()
{
  sub_1B0EEB6A4();
  return sub_1B0EF3440();
}

uint64_t sub_1B0EE3D80()
{
  sub_1B0EEB6A4();
  return sub_1B0EF344C();
}

id AXMElementDetectorResult.__deallocating_deinit(uint64_t a1)
{
  return sub_1B0EE44BC(a1, type metadata accessor for AXMElementDetectorResult);
}

uint64_t sub_1B0EE3DC8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 v9;
  _BYTE v11[16];
  __int128 v12;
  __int128 v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA0E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0EEB6A4();
  sub_1B0EF3434();
  v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box + 16);
  v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box);
  v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_1B0EEB560(&qword_1EEEDA048, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9C0]);
  sub_1B0EF338C();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_1B0EF3380();
    LOBYTE(v12) = 2;
    sub_1B0EF335C();
    LOBYTE(v12) = 3;
    sub_1B0EF3368();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

char *AXMElementDetectorResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AXMElementDetectorResult.init(from:)(a1);
}

char *AXMElementDetectorResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  char v25;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA0F0);
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v21 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1B0EEB6A4();
  v8 = v1;
  v19 = v6;
  sub_1B0EF3428();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);

    type metadata accessor for AXMElementDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for CGRect(0);
    v25 = 0;
    sub_1B0EEB560(&qword_1EEEDA0A0, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9E0]);
    v9 = v20;
    v10 = v19;
    sub_1B0EF3338();
    v11 = &v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box];
    *(_OWORD *)v11 = v23;
    *((_OWORD *)v11 + 1) = v24;
    LOBYTE(v23) = 1;
    *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label] = sub_1B0EF332C();
    LOBYTE(v23) = 2;
    v12 = sub_1B0EF3308();
    v14 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName];
    *v14 = v12;
    v14[1] = v15;
    LOBYTE(v23) = 3;
    sub_1B0EF3314();
    *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence] = v16;

    v17 = (objc_class *)type metadata accessor for AXMElementDetectorResult();
    v22.receiver = v8;
    v22.super_class = v17;
    v8 = (char *)objc_msgSendSuper2(&v22, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  return v8;
}

uint64_t sub_1B0EE4250@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AXMElementDetectorResult();
  result = sub_1B0EF3224();
  *a1 = result;
  return result;
}

uint64_t sub_1B0EE428C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return sub_1B0EE49E8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AXMElementDetectorResult, (uint64_t (*)(uint64_t))AXMElementDetectorResult.init(from:), a3);
}

uint64_t sub_1B0EE42B0(_QWORD *a1)
{
  return sub_1B0EE3DC8(a1);
}

uint64_t AXMClickabilityDetectorResult.init(boundingBox:)(void *a1)
{
  uint64_t v2;

  v2 = sub_1B0EEA648((uint64_t)a1);

  return v2;
}

double sub_1B0EE42FC()
{
  return sub_1B0EE4308(&OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box);
}

double sub_1B0EE4308(_QWORD *a1)
{
  uint64_t v1;

  return *(double *)(v1 + *a1);
}

double sub_1B0EE4328(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return *(double *)(a1 + *a3);
}

uint64_t sub_1B0EE433C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label);
}

uint64_t sub_1B0EE435C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1B0EE43A0()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_1B0EF3110();
  swift_bridgeObjectRelease();
  return v0;
}

double sub_1B0EE43E8()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence);
}

void AXMClickabilityDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B0EE4460()
{
  sub_1B0EEB708();
  return sub_1B0EF3440();
}

uint64_t sub_1B0EE4488()
{
  sub_1B0EEB708();
  return sub_1B0EF344C();
}

id AXMClickabilityDetectorResult.__deallocating_deinit(uint64_t a1)
{
  return sub_1B0EE44BC(a1, type metadata accessor for AXMClickabilityDetectorResult);
}

id sub_1B0EE44BC(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_1B0EE4500(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 v9;
  _BYTE v11[16];
  __int128 v12;
  __int128 v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA118);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0EEB708();
  sub_1B0EF3434();
  v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box + 16);
  v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box);
  v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_1B0EEB560(&qword_1EEEDA048, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9C0]);
  sub_1B0EF338C();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_1B0EF3380();
    LOBYTE(v12) = 2;
    sub_1B0EF335C();
    LOBYTE(v12) = 3;
    sub_1B0EF3368();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

char *AXMClickabilityDetectorResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AXMClickabilityDetectorResult.init(from:)(a1);
}

char *AXMClickabilityDetectorResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  char v25;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA120);
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v21 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1B0EEB708();
  v8 = v1;
  v19 = v6;
  sub_1B0EF3428();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);

    type metadata accessor for AXMClickabilityDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for CGRect(0);
    v25 = 0;
    sub_1B0EEB560(&qword_1EEEDA0A0, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x1E0C9B9E0]);
    v9 = v20;
    v10 = v19;
    sub_1B0EF3338();
    v11 = &v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box];
    *(_OWORD *)v11 = v23;
    *((_OWORD *)v11 + 1) = v24;
    LOBYTE(v23) = 1;
    *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label] = sub_1B0EF332C();
    LOBYTE(v23) = 2;
    v12 = sub_1B0EF3308();
    v14 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName];
    *v14 = v12;
    v14[1] = v15;
    LOBYTE(v23) = 3;
    sub_1B0EF3314();
    *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence] = v16;

    v17 = (objc_class *)type metadata accessor for AXMClickabilityDetectorResult();
    v22.receiver = v8;
    v22.super_class = v17;
    v8 = (char *)objc_msgSendSuper2(&v22, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  return v8;
}

uint64_t sub_1B0EE4988@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AXMClickabilityDetectorResult();
  result = sub_1B0EF3224();
  *a1 = result;
  return result;
}

uint64_t sub_1B0EE49C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return sub_1B0EE49E8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AXMClickabilityDetectorResult, (uint64_t (*)(uint64_t))AXMClickabilityDetectorResult.init(from:), a3);
}

uint64_t sub_1B0EE49E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  id v9;
  uint64_t result;

  v9 = objc_allocWithZone((Class)a3(a2));
  result = a4(a1);
  if (!v5)
    *a5 = result;
  return result;
}

uint64_t sub_1B0EE4A40(_QWORD *a1)
{
  return sub_1B0EE4500(a1);
}

BOOL AXModelType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_1B0EE4A84(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B0EE4A98()
{
  sub_1B0EF3404();
  sub_1B0EF3410();
  return sub_1B0EF341C();
}

uint64_t sub_1B0EE4ADC()
{
  return sub_1B0EF3410();
}

uint64_t sub_1B0EE4B04()
{
  sub_1B0EF3404();
  sub_1B0EF3410();
  return sub_1B0EF341C();
}

_QWORD *sub_1B0EE4B44@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_1B0EE4B74(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

char *sub_1B0EE4B80(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B0EE4C00(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B0EE4B9C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B0EE4CF8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B0EE4BB8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B0EE4DF0(a1, a2, a3, *v3, &qword_1EEEDA230);
  *v3 = result;
  return result;
}

char *sub_1B0EE4BDC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B0EE4DF0(a1, a2, a3, *v3, &qword_1EEEDA210);
  *v3 = result;
  return result;
}

char *sub_1B0EE4C00(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1B0EE4CF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA238);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1B0EE4DF0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_release();
  return v11;
}

unint64_t sub_1B0EE4ED4(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1B0EF3404();
  sub_1B0EF3410();
  v2 = sub_1B0EF341C();
  return sub_1B0EE5030(a1, v2);
}

char *sub_1B0EE4F38(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1B0EE5030(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1B0EE50D0(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_1B0EE7A20();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1B0EE52A4(v6);
  return sub_1B0EF3254();
}

_QWORD *sub_1B0EE5148(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA248);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1B0EE7878((uint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_1B0EF32C0();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1B0EE523C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B0EF32C0();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x1B5E119B4);
}

uint64_t sub_1B0EE52A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  float *v16;
  float v17;
  float *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  float v28;
  float *v29;
  float v30;
  _QWORD *v31;
  uint64_t v32;
  float *v33;
  float v34;
  float *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  float *v47;
  float v48;
  float *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  char v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  float *v106;
  float v107;
  float *v108;
  char *v109;
  BOOL v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  unint64_t v120;
  float *v121;
  float v122;
  float *v123;
  char *v124;
  char *v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  unint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t *v144;
  unint64_t v145;
  int64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  char *__dst;
  uint64_t v153;

  v3 = a1[1];
  result = sub_1B0EF33A4();
  v137 = v3;
  if (result < v3)
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
    {
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      __break(1u);
LABEL_194:
      __break(1u);
LABEL_195:
      __break(1u);
      return result;
    }
    v136 = result;
    v134 = a1;
    if (v3 <= 1)
    {
      v21 = MEMORY[0x1E0DEE9D8];
      v153 = MEMORY[0x1E0DEE9D8];
      v7 = (MEMORY[0x1E0DEE9D8] & 0xFFFFFFFFFFFFFF8) + 32;
      if (v3 != 1)
      {
        v23 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_152:
        if (v23 < 2)
        {
LABEL_163:
          swift_bridgeObjectRelease();
          *(_QWORD *)((v153 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_1B0EF317C();
          return swift_bridgeObjectRelease();
        }
        v127 = *v134;
        while (1)
        {
          v128 = v23 - 2;
          if (v23 < 2)
            goto LABEL_182;
          if (!v127)
            goto LABEL_195;
          v129 = (char *)v7;
          v130 = *(_QWORD *)(v21 + 32 + 16 * v128);
          v131 = *(_QWORD *)(v21 + 32 + 16 * (v23 - 1) + 8);
          result = sub_1B0EE5CF4((char *)(v127 + 8 * v130), (char *)(v127 + 8 * *(_QWORD *)(v21 + 32 + 16 * (v23 - 1))), v127 + 8 * v131, v129);
          if (v1)
            goto LABEL_163;
          if (v131 < v130)
            goto LABEL_183;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1B0EE60B4(v21);
            v21 = result;
          }
          if (v128 >= *(_QWORD *)(v21 + 16))
            goto LABEL_184;
          v132 = (_QWORD *)(v21 + 32 + 16 * v128);
          *v132 = v130;
          v132[1] = v131;
          v133 = *(_QWORD *)(v21 + 16);
          if (v23 > v133)
            goto LABEL_185;
          result = (uint64_t)memmove((void *)(v21 + 32 + 16 * (v23 - 1)), (const void *)(v21 + 32 + 16 * v23), 16 * (v133 - v23));
          *(_QWORD *)(v21 + 16) = v133 - 1;
          v23 = v133 - 1;
          v7 = (unint64_t)v129;
          if (v133 <= 2)
            goto LABEL_163;
        }
      }
    }
    else
    {
      v6 = v5 >> 1;
      type metadata accessor for AXBoundingBox();
      result = sub_1B0EF3194();
      *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      v7 = (result & 0xFFFFFFFFFFFFFF8) + 32;
      v153 = result;
    }
    v22 = 0;
    v135 = *a1 + 16;
    v141 = *a1;
    v138 = *a1 - 8;
    v21 = MEMORY[0x1E0DEE9D8];
    __dst = (char *)v7;
LABEL_22:
    v24 = v22++;
    v150 = v24;
    if (v22 >= v3)
    {
      v25 = v141;
    }
    else
    {
      v25 = v141;
      v26 = *(_QWORD *)(v141 + 8 * v24);
      v27 = (float *)(*(_QWORD *)(v141 + 8 * v22) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      v28 = *v27;
      v29 = (float *)(v26 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      result = swift_beginAccess();
      v30 = *v29;
      v22 = v24 + 2;
      if (v24 + 2 < v3)
      {
        v31 = (_QWORD *)(v135 + 8 * v24);
        while (1)
        {
          v32 = *(v31 - 1);
          v33 = (float *)(*v31 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          swift_beginAccess();
          v34 = *v33;
          v35 = (float *)(v32 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          result = swift_beginAccess();
          if (v30 < v28 == *v35 >= v34)
            break;
          ++v22;
          ++v31;
          if (v3 == v22)
          {
            v22 = v3;
            break;
          }
        }
        v7 = (unint64_t)__dst;
      }
      if (v30 < v28)
      {
        if (v22 < v24)
          goto LABEL_186;
        if (v24 < v22)
        {
          v36 = (uint64_t *)(v138 + 8 * v22);
          v37 = v22;
          v38 = v24;
          v39 = (uint64_t *)(v141 + 8 * v24);
          do
          {
            if (v38 != --v37)
            {
              if (!v141)
                goto LABEL_194;
              v40 = *v39;
              *v39 = *v36;
              *v36 = v40;
            }
            ++v38;
            --v36;
            ++v39;
          }
          while (v38 < v37);
        }
      }
    }
    if (v22 < v3)
    {
      if (__OFSUB__(v22, v24))
        goto LABEL_181;
      if (v22 - v24 < v136)
      {
        if (__OFADD__(v24, v136))
        {
LABEL_187:
          __break(1u);
          goto LABEL_188;
        }
        if (v24 + v136 >= v3)
          v41 = v3;
        else
          v41 = v24 + v136;
        if (v41 < v24)
        {
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
          goto LABEL_190;
        }
        if (v22 != v41)
        {
          v42 = (uint64_t *)(v138 + 8 * v22);
          v148 = v41;
          do
          {
            v43 = *(_QWORD *)(v25 + 8 * v22);
            v44 = v24;
            v45 = v42;
            do
            {
              v46 = *v45;
              v47 = (float *)(v43 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
              swift_beginAccess();
              v48 = *v47;
              v49 = (float *)(v46 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
              result = swift_beginAccess();
              if (*v49 >= v48)
                break;
              if (!v25)
                goto LABEL_189;
              v50 = *v45;
              v43 = v45[1];
              *v45 = v43;
              v45[1] = v50;
              --v45;
              ++v44;
            }
            while (v22 != v44);
            ++v22;
            ++v42;
            v24 = v150;
          }
          while (v22 != v148);
          v22 = v148;
          v7 = (unint64_t)__dst;
        }
      }
    }
    if (v22 >= v24)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1B0EE5FBC(0, *(_QWORD *)(v21 + 16) + 1, 1, (char *)v21);
        v21 = result;
      }
      v52 = *(_QWORD *)(v21 + 16);
      v51 = *(_QWORD *)(v21 + 24);
      v23 = v52 + 1;
      if (v52 >= v51 >> 1)
      {
        result = (uint64_t)sub_1B0EE5FBC((char *)(v51 > 1), v52 + 1, 1, (char *)v21);
        v21 = result;
      }
      *(_QWORD *)(v21 + 16) = v23;
      v142 = v21 + 32;
      v53 = (uint64_t *)(v21 + 32 + 16 * v52);
      *v53 = v24;
      v53[1] = v22;
      if (!v52)
      {
        v23 = 1;
        goto LABEL_21;
      }
      v54 = v21 + 32;
      v139 = v22;
      v140 = v21;
      while (1)
      {
        v55 = v23 - 1;
        if (v23 >= 4)
        {
          v60 = v54 + 16 * v23;
          v61 = *(_QWORD *)(v60 - 64);
          v62 = *(_QWORD *)(v60 - 56);
          v66 = __OFSUB__(v62, v61);
          v63 = v62 - v61;
          if (v66)
            goto LABEL_169;
          v65 = *(_QWORD *)(v60 - 48);
          v64 = *(_QWORD *)(v60 - 40);
          v66 = __OFSUB__(v64, v65);
          v58 = v64 - v65;
          v59 = v66;
          if (v66)
            goto LABEL_170;
          v67 = v23 - 2;
          v68 = (uint64_t *)(v54 + 16 * (v23 - 2));
          v70 = *v68;
          v69 = v68[1];
          v66 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          if (v66)
            goto LABEL_171;
          v66 = __OFADD__(v58, v71);
          v72 = v58 + v71;
          if (v66)
            goto LABEL_173;
          if (v72 >= v63)
          {
            v90 = (uint64_t *)(v54 + 16 * v55);
            v92 = *v90;
            v91 = v90[1];
            v66 = __OFSUB__(v91, v92);
            v93 = v91 - v92;
            if (v66)
              goto LABEL_179;
            v83 = v58 < v93;
            goto LABEL_94;
          }
        }
        else
        {
          if (v23 != 3)
          {
            v84 = *(_QWORD *)(v21 + 32);
            v85 = *(_QWORD *)(v21 + 40);
            v66 = __OFSUB__(v85, v84);
            v77 = v85 - v84;
            v78 = v66;
LABEL_88:
            if ((v78 & 1) != 0)
              goto LABEL_175;
            v86 = (uint64_t *)(v54 + 16 * v55);
            v88 = *v86;
            v87 = v86[1];
            v66 = __OFSUB__(v87, v88);
            v89 = v87 - v88;
            if (v66)
              goto LABEL_176;
            if (v89 < v77)
              goto LABEL_21;
            goto LABEL_96;
          }
          v57 = *(_QWORD *)(v21 + 32);
          v56 = *(_QWORD *)(v21 + 40);
          v66 = __OFSUB__(v56, v57);
          v58 = v56 - v57;
          v59 = v66;
        }
        if ((v59 & 1) != 0)
          goto LABEL_172;
        v67 = v23 - 2;
        v73 = (uint64_t *)(v54 + 16 * (v23 - 2));
        v75 = *v73;
        v74 = v73[1];
        v76 = __OFSUB__(v74, v75);
        v77 = v74 - v75;
        v78 = v76;
        if (v76)
          goto LABEL_174;
        v79 = (uint64_t *)(v54 + 16 * v55);
        v81 = *v79;
        v80 = v79[1];
        v66 = __OFSUB__(v80, v81);
        v82 = v80 - v81;
        if (v66)
          goto LABEL_177;
        if (__OFADD__(v77, v82))
          goto LABEL_178;
        if (v77 + v82 < v58)
          goto LABEL_88;
        v83 = v58 < v82;
LABEL_94:
        if (v83)
          v55 = v67;
LABEL_96:
        if (v55 - 1 >= v23)
        {
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          break;
        }
        if (!v141)
          goto LABEL_193;
        v145 = v55 - 1;
        v146 = v55;
        v144 = (uint64_t *)(v54 + 16 * (v55 - 1));
        v94 = (char *)(v54 + 16 * v55);
        v95 = *(_QWORD *)v94;
        v143 = v94;
        v147 = *v144;
        v149 = *((_QWORD *)v94 + 1);
        v96 = (char *)(v141 + 8 * *v144);
        v97 = (char *)(v141 + 8 * *(_QWORD *)v94);
        v98 = v141 + 8 * v149;
        v99 = v97 - v96 + 7;
        if (v97 - v96 >= 0)
          v99 = v97 - v96;
        v100 = v99 >> 3;
        v101 = v98 - (_QWORD)v97 + 7;
        if ((uint64_t)(v98 - (_QWORD)v97) >= 0)
          v101 = v98 - (_QWORD)v97;
        v102 = v101 >> 3;
        if (v100 < v101 >> 3)
        {
          v7 = (unint64_t)__dst;
          if (__dst != v96 || __dst >= v97)
            result = (uint64_t)memmove(__dst, v96, 8 * v100);
          v103 = &__dst[8 * v100];
          if (v95 >= v149 || v97 - v96 < 8)
          {
            v111 = v103;
            v104 = __dst;
LABEL_140:
            v97 = v96;
            goto LABEL_141;
          }
          v104 = __dst;
          while (2)
          {
            v105 = *(_QWORD *)v104;
            v106 = (float *)(*(_QWORD *)v97 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
            swift_beginAccess();
            v107 = *v106;
            v108 = (float *)(v105 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
            result = swift_beginAccess();
            if (*v108 >= v107)
            {
              v109 = v104;
              v110 = v96 == v104;
              v104 += 8;
              if (!v110)
                goto LABEL_114;
            }
            else
            {
              v109 = v97;
              v110 = v96 == v97;
              v97 += 8;
              if (!v110)
LABEL_114:
                *(_QWORD *)v96 = *(_QWORD *)v109;
            }
            v96 += 8;
            if (v104 >= v103 || (unint64_t)v97 >= v98)
            {
              v111 = v103;
              goto LABEL_140;
            }
            continue;
          }
        }
        if ((unint64_t)__dst >= v98 || __dst != v97)
          result = (uint64_t)memmove(__dst, v97, 8 * v102);
        v111 = &__dst[8 * v102];
        v112 = v147;
        v113 = v149;
        if (v147 >= v95 || (uint64_t)(v98 - (_QWORD)v97) < 8)
        {
          v7 = (unint64_t)__dst;
          v104 = __dst;
          goto LABEL_143;
        }
        v114 = (char *)(v138 + 8 * v149);
        v151 = v96;
        do
        {
          v115 = v111 - 8;
          v116 = v114 + 8;
          v118 = v97 - 8;
          v117 = *((_QWORD *)v97 - 1);
          v119 = v97;
          v120 = (unint64_t)v111;
          v121 = (float *)(*((_QWORD *)v111 - 1) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          swift_beginAccess();
          v122 = *v121;
          v123 = (float *)(v117 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          result = swift_beginAccess();
          if (*v123 >= v122)
          {
            v124 = v119;
            v118 = v115;
            if (v116 == (char *)v120)
            {
              v111 = v115;
              v7 = (unint64_t)__dst;
              v125 = v151;
              if ((unint64_t)v114 < v120)
                goto LABEL_135;
            }
            else
            {
              v111 = v115;
              v125 = v151;
              v7 = (unint64_t)__dst;
            }
            goto LABEL_134;
          }
          if (v116 != v119)
          {
            v124 = v118;
            v125 = v151;
            v7 = (unint64_t)__dst;
            v111 = (char *)v120;
LABEL_134:
            *(_QWORD *)v114 = *(_QWORD *)v118;
            goto LABEL_135;
          }
          v20 = v114 >= v119;
          v124 = v118;
          v7 = (unint64_t)__dst;
          v111 = (char *)v120;
          v125 = v151;
          if (v20)
            goto LABEL_134;
LABEL_135:
          v97 = v124;
          if (v125 >= v124)
            goto LABEL_138;
          v114 -= 8;
        }
        while (v7 < (unint64_t)v111);
        v7 = (unint64_t)__dst;
LABEL_138:
        v104 = (char *)v7;
LABEL_141:
        v112 = v147;
        v113 = v149;
LABEL_143:
        v21 = v140;
        if (v97 != v104 || v97 >= &v104[(v111 - v104 + (v111 - v104 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8])
          result = (uint64_t)memmove(v97, v104, 8 * ((v111 - v104) / 8));
        if (v113 < v112)
          goto LABEL_166;
        if (v146 > *(_QWORD *)(v140 + 16))
          goto LABEL_167;
        *v144 = v112;
        v54 = v142;
        *(_QWORD *)(v142 + 16 * v145 + 8) = v113;
        v126 = *(_QWORD *)(v140 + 16);
        if (v146 >= (uint64_t)v126)
          goto LABEL_168;
        v23 = v126 - 1;
        result = (uint64_t)memmove(v143, v143 + 16, 16 * (v126 - 1 - v146));
        *(_QWORD *)(v140 + 16) = v126 - 1;
        v83 = v126 > 2;
        v22 = v139;
        if (!v83)
        {
LABEL_21:
          v3 = v137;
          if (v22 >= v137)
            goto LABEL_152;
          goto LABEL_22;
        }
      }
    }
    __break(1u);
LABEL_181:
    __break(1u);
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    __break(1u);
LABEL_186:
    __break(1u);
    goto LABEL_187;
  }
  if (v3 < 0)
    goto LABEL_191;
  if ((unint64_t)v3 >= 2)
  {
    v8 = (uint64_t *)*a1;
    v9 = -1;
    v10 = 1;
    v11 = v8;
    do
    {
      v12 = v8[v10];
      v13 = v9;
      v14 = v11;
      do
      {
        v15 = *v14;
        v16 = (float *)(v12 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
        swift_beginAccess();
        v17 = *v16;
        v18 = (float *)(v15 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
        result = swift_beginAccess();
        if (*v18 >= v17)
          break;
        if (!v8)
          goto LABEL_192;
        v19 = *v14;
        v12 = v14[1];
        *v14 = v12;
        v14[1] = v19;
        --v14;
        v20 = __CFADD__(v13++, 1);
      }
      while (!v20);
      ++v10;
      ++v11;
      --v9;
    }
    while (v10 != v137);
  }
  return result;
}

uint64_t sub_1B0EE5CF4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  float *v16;
  float v17;
  float *v18;
  char *v19;
  BOOL v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  float *v25;
  float v26;
  float *v27;
  unint64_t v28;
  BOOL v29;
  char *v31;
  char *v32;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 7;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4)
      memmove(a4, __src, 8 * v13);
    v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8)
      goto LABEL_42;
    v31 = v7;
    v21 = (char *)(a3 - 8);
    v32 = v4;
    while (1)
    {
      v22 = v21 + 8;
      v24 = v6 - 8;
      v23 = *((_QWORD *)v6 - 1);
      v25 = (float *)(*((_QWORD *)v14 - 1) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      v26 = *v25;
      v27 = (float *)(v23 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      if (*v27 >= v26)
      {
        v28 = (unint64_t)v31;
        v24 = v14 - 8;
        if (v22 != v14)
        {
          v14 -= 8;
          goto LABEL_37;
        }
        v29 = v21 >= v14;
        v14 -= 8;
        if (v29)
          goto LABEL_37;
      }
      else
      {
        v28 = (unint64_t)v31;
        if (v22 != v6)
        {
          v6 -= 8;
LABEL_37:
          *(_QWORD *)v21 = *(_QWORD *)v24;
          goto LABEL_38;
        }
        v29 = v21 >= v6;
        v6 -= 8;
        if (v29)
          goto LABEL_37;
      }
LABEL_38:
      if ((unint64_t)v6 <= v28)
      {
        v4 = v32;
        goto LABEL_42;
      }
      v21 -= 8;
      v4 = v32;
      if (v14 <= v32)
        goto LABEL_42;
    }
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4)
    memmove(a4, __dst, 8 * v10);
  v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v15 = *(_QWORD *)v4;
      v16 = (float *)(*(_QWORD *)v6 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      v17 = *v16;
      v18 = (float *)(v15 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      if (*v18 >= v17)
        break;
      v19 = v6;
      v20 = v7 == v6;
      v6 += 8;
      if (!v20)
        goto LABEL_16;
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v19 = v4;
    v20 = v7 == v4;
    v4 += 8;
    if (v20)
      goto LABEL_17;
LABEL_16:
    *(_QWORD *)v7 = *(_QWORD *)v19;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_42:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8])
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  return 1;
}

char *sub_1B0EE5FBC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA240);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1B0EE60B4(uint64_t a1)
{
  return sub_1B0EE5FBC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1B0EE60C8(_BYTE *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;

  v7 = *v3;
  sub_1B0EF3404();
  sub_1B0EF3410();
  v8 = sub_1B0EF341C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_1B0EE7230(a2, v10, isUniquelyReferenced_nonNull_native, a3);
    *v3 = v15;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(v7 + 48);
  if (*(unsigned __int8 *)(v11 + v10) != a2)
  {
    v12 = ~v9;
    do
    {
      v10 = (v10 + 1) & v12;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_7;
    }
    while (*(unsigned __int8 *)(v11 + v10) != a2);
  }
  result = 0;
  LOBYTE(a2) = *(_BYTE *)(*(_QWORD *)(*v3 + 48) + v10);
LABEL_8:
  *a1 = a2;
  return result;
}

void sub_1B0EE61FC(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  _BOOL8 v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  char v19;
  void *v20;
  id v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_4;
  if (!*(_QWORD *)(a2 + 16))
    goto LABEL_4;
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 32);
  if ((_DWORD)v9 == 14)
    goto LABEL_4;
  v10 = *(_DWORD *)(a2 + 32);
  v11 = (_QWORD *)*a4;
  v12 = sub_1B0EE4ED4(v9);
  v14 = v11[2];
  v15 = (v13 & 1) == 0;
  v16 = __OFADD__(v14, v15);
  v17 = v14 + v15;
  if (v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LOBYTE(v18) = v13;
  if (v11[3] < v17)
  {
    sub_1B0EE6CC8(v17, a3 & 1, &qword_1EEEDA218);
    v12 = sub_1B0EE4ED4(v9);
    if ((v18 & 1) == (v19 & 1))
      goto LABEL_10;
LABEL_8:
    v12 = sub_1B0EF33F8();
    __break(1u);
  }
  if ((a3 & 1) != 0)
  {
LABEL_10:
    if ((v18 & 1) != 0)
      goto LABEL_11;
LABEL_14:
    v23 = (_QWORD *)*a4;
    *(_QWORD *)(*a4 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(_BYTE *)(v23[6] + v12) = v9;
    *(_DWORD *)(v23[7] + 4 * v12) = v10;
    v24 = v23[2];
    v16 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (!v16)
    {
      v23[2] = v25;
      v26 = *(_QWORD *)(a1 + 16);
      if (v26 == 1)
      {
LABEL_4:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        return;
      }
      v9 = 0;
      while (1)
      {
        v27 = v9 + 1;
        if (v9 + 1 >= v26)
          goto LABEL_30;
        v28 = *(_QWORD *)(a2 + 16);
        if (v27 == v28)
          goto LABEL_4;
        if (v27 >= v28)
          goto LABEL_31;
        v18 = *(unsigned __int8 *)(a1 + 33 + v9);
        if (v18 == 14)
          goto LABEL_4;
        v10 = *(_DWORD *)(a2 + 36 + 4 * v9);
        v29 = (_QWORD *)*a4;
        v30 = sub_1B0EE4ED4(v18);
        v32 = v29[2];
        v33 = (v31 & 1) == 0;
        v16 = __OFADD__(v32, v33);
        v34 = v32 + v33;
        if (v16)
          goto LABEL_28;
        a3 = v31;
        if (v29[3] < v34)
        {
          sub_1B0EE6CC8(v34, 1, &qword_1EEEDA218);
          v30 = sub_1B0EE4ED4(v18);
          if ((a3 & 1) != (v35 & 1))
            goto LABEL_8;
        }
        if ((a3 & 1) != 0)
          goto LABEL_11;
        v36 = (_QWORD *)*a4;
        *(_QWORD *)(*a4 + 8 * (v30 >> 6) + 64) |= 1 << v30;
        *(_BYTE *)(v36[6] + v30) = v18;
        *(_DWORD *)(v36[7] + 4 * v30) = v10;
        v37 = v36[2];
        v16 = __OFADD__(v37, 1);
        v38 = v37 + 1;
        if (v16)
          break;
        v36[2] = v38;
        v26 = *(_QWORD *)(a1 + 16);
        v39 = v9 + 2;
        ++v9;
        if (v39 == v26)
          goto LABEL_4;
      }
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v22 = v12;
  sub_1B0EE6B44(&qword_1EEEDA218);
  v12 = v22;
  if ((v18 & 1) == 0)
    goto LABEL_14;
LABEL_11:
  v20 = (void *)swift_allocError();
  swift_willThrow();
  v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1F0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_32:
  sub_1B0EF3218();
  sub_1B0EF3134();
  sub_1B0EF3284();
  sub_1B0EF3134();
  sub_1B0EF3290();
  __break(1u);
}

void sub_1B0EE65C4(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  _BOOL8 v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  char v19;
  void *v20;
  id v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_4;
  if (!*(_QWORD *)(a2 + 16))
    goto LABEL_4;
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 32);
  if ((_DWORD)v9 == 17)
    goto LABEL_4;
  v10 = *(_DWORD *)(a2 + 32);
  v11 = (_QWORD *)*a4;
  v12 = sub_1B0EE4ED4(v9);
  v14 = v11[2];
  v15 = (v13 & 1) == 0;
  v16 = __OFADD__(v14, v15);
  v17 = v14 + v15;
  if (v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LOBYTE(v18) = v13;
  if (v11[3] < v17)
  {
    sub_1B0EE6CC8(v17, a3 & 1, &qword_1EEEDA180);
    v12 = sub_1B0EE4ED4(v9);
    if ((v18 & 1) == (v19 & 1))
      goto LABEL_10;
LABEL_8:
    v12 = sub_1B0EF33F8();
    __break(1u);
  }
  if ((a3 & 1) != 0)
  {
LABEL_10:
    if ((v18 & 1) != 0)
      goto LABEL_11;
LABEL_14:
    v23 = (_QWORD *)*a4;
    *(_QWORD *)(*a4 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(_BYTE *)(v23[6] + v12) = v9;
    *(_DWORD *)(v23[7] + 4 * v12) = v10;
    v24 = v23[2];
    v16 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (!v16)
    {
      v23[2] = v25;
      v26 = *(_QWORD *)(a1 + 16);
      if (v26 == 1)
      {
LABEL_4:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        return;
      }
      v9 = 0;
      while (1)
      {
        v27 = v9 + 1;
        if (v9 + 1 >= v26)
          goto LABEL_30;
        v28 = *(_QWORD *)(a2 + 16);
        if (v27 == v28)
          goto LABEL_4;
        if (v27 >= v28)
          goto LABEL_31;
        v18 = *(unsigned __int8 *)(a1 + 33 + v9);
        if (v18 == 17)
          goto LABEL_4;
        v10 = *(_DWORD *)(a2 + 36 + 4 * v9);
        v29 = (_QWORD *)*a4;
        v30 = sub_1B0EE4ED4(v18);
        v32 = v29[2];
        v33 = (v31 & 1) == 0;
        v16 = __OFADD__(v32, v33);
        v34 = v32 + v33;
        if (v16)
          goto LABEL_28;
        a3 = v31;
        if (v29[3] < v34)
        {
          sub_1B0EE6CC8(v34, 1, &qword_1EEEDA180);
          v30 = sub_1B0EE4ED4(v18);
          if ((a3 & 1) != (v35 & 1))
            goto LABEL_8;
        }
        if ((a3 & 1) != 0)
          goto LABEL_11;
        v36 = (_QWORD *)*a4;
        *(_QWORD *)(*a4 + 8 * (v30 >> 6) + 64) |= 1 << v30;
        *(_BYTE *)(v36[6] + v30) = v18;
        *(_DWORD *)(v36[7] + 4 * v30) = v10;
        v37 = v36[2];
        v16 = __OFADD__(v37, 1);
        v38 = v37 + 1;
        if (v16)
          break;
        v36[2] = v38;
        v26 = *(_QWORD *)(a1 + 16);
        v39 = v9 + 2;
        ++v9;
        if (v39 == v26)
          goto LABEL_4;
      }
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v22 = v12;
  sub_1B0EE6B44(&qword_1EEEDA180);
  v12 = v22;
  if ((v18 & 1) == 0)
    goto LABEL_14;
LABEL_11:
  v20 = (void *)swift_allocError();
  swift_willThrow();
  v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1F0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_32:
  sub_1B0EF3218();
  sub_1B0EF3134();
  sub_1B0EF3284();
  sub_1B0EF3134();
  sub_1B0EF3290();
  __break(1u);
}

uint64_t sub_1B0EE698C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1B0EF32C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1B0EF32C0();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1B5E119B4](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1B0EE7878(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1B0EF32C0();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1B0EF317C();
  }
  __break(1u);
  return result;
}

void *sub_1B0EE6B44(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1B0EF32CC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v13 = (v19 - 1) & v19;
    v16 = v21 + (v10 << 6);
LABEL_12:
    v17 = *(_DWORD *)(*(_QWORD *)(v3 + 56) + 4 * v16);
    *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16) = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v16);
    *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B0EE6CC8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_1B0EF32D8();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v32 = a2;
    v9 = 0;
    v10 = (_QWORD *)(v6 + 64);
    v11 = 1 << *(_BYTE *)(v6 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v6 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v17 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v18 = v17 | (v9 << 6);
      }
      else
      {
        v19 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v14)
          goto LABEL_31;
        v20 = v10[v19];
        ++v9;
        if (!v20)
        {
          v9 = v19 + 1;
          if (v19 + 1 >= v14)
            goto LABEL_31;
          v20 = v10[v9];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v14)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                result = swift_release();
                v4 = v3;
                goto LABEL_38;
              }
              v31 = 1 << *(_BYTE *)(v6 + 32);
              if (v31 >= 64)
                bzero((void *)(v6 + 64), ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v10 = -1 << v31;
              v4 = v3;
              *(_QWORD *)(v6 + 16) = 0;
              break;
            }
            v20 = v10[v21];
            if (!v20)
            {
              while (1)
              {
                v9 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v9 >= v14)
                  goto LABEL_31;
                v20 = v10[v9];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v9 = v21;
          }
        }
LABEL_21:
        v13 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v9 << 6);
      }
      v22 = *(_BYTE *)(*(_QWORD *)(v6 + 48) + v18);
      v23 = *(_DWORD *)(*(_QWORD *)(v6 + 56) + 4 * v18);
      sub_1B0EF3404();
      sub_1B0EF3410();
      result = sub_1B0EF341C();
      v24 = -1 << *(_BYTE *)(v8 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v15 + 8 * v26);
        }
        while (v30 == -1);
        v16 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(*(_QWORD *)(v8 + 48) + v16) = v22;
      *(_DWORD *)(*(_QWORD *)(v8 + 56) + 4 * v16) = v23;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v4 = v8;
  return result;
}

uint64_t sub_1B0EE6F8C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  result = sub_1B0EF3200();
  v6 = result;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 0;
    v8 = (_QWORD *)(v4 + 56);
    v9 = 1 << *(_BYTE *)(v4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v4 + 56);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v7 << 6);
      }
      else
      {
        v17 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v12)
          goto LABEL_33;
        v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          v7 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_33;
          v18 = v8[v7];
          if (!v18)
          {
            v7 = v17 + 2;
            if (v17 + 2 >= v12)
              goto LABEL_33;
            v18 = v8[v7];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v4 + 32);
                if (v28 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v28;
                v3 = v2;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  v7 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_39;
                  if (v7 >= v12)
                    goto LABEL_33;
                  v18 = v8[v7];
                  ++v19;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v7 = v19;
            }
          }
        }
LABEL_23:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v7 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v4 + 48) + v16);
      sub_1B0EF3404();
      sub_1B0EF3410();
      result = sub_1B0EF341C();
      v21 = -1 << *(_BYTE *)(v6 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v23);
        }
        while (v27 == -1);
        v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_BYTE *)(*(_QWORD *)(v6 + 48) + v14) = v20;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_1B0EE7230(uint64_t result, unint64_t a2, char a3, uint64_t *a4)
{
  uint64_t *v4;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v6 = result;
  v7 = *(_QWORD *)(*v4 + 16);
  v8 = *(_QWORD *)(*v4 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1B0EE6F8C(v9, a4);
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_1B0EE7388(a4);
      goto LABEL_14;
    }
    sub_1B0EE7510(v9, a4);
  }
  v10 = *v4;
  sub_1B0EF3404();
  sub_1B0EF3410();
  result = sub_1B0EF341C();
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a2 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v12 = *(_QWORD *)(v10 + 48);
    if (*(unsigned __int8 *)(v12 + a2) == v6)
    {
LABEL_13:
      result = sub_1B0EF33EC();
      __break(1u);
    }
    else
    {
      v13 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(unsigned __int8 *)(v12 + a2) == v6)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v14 + 48) + a2) = v6;
  v15 = *(_QWORD *)(v14 + 16);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    *(_QWORD *)(v14 + 16) = v17;
  return result;
}

void *sub_1B0EE7388(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1B0EF31F4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v7 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v7 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v7 + 8 * v10);
        if (!v18)
          break;
      }
    }
LABEL_27:
    v13 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16) = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v16);
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v7 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v7 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B0EE7510(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  result = sub_1B0EF3200();
  v6 = result;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v7 = 0;
  v8 = v4 + 56;
  v9 = 1 << *(_BYTE *)(v4 + 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v4 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v7 << 6);
      goto LABEL_24;
    }
    v17 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v12)
      goto LABEL_33;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      v7 = v17 + 1;
      if (v17 + 1 >= v12)
        goto LABEL_33;
      v18 = *(_QWORD *)(v8 + 8 * v7);
      if (!v18)
      {
        v7 = v17 + 2;
        if (v17 + 2 >= v12)
          goto LABEL_33;
        v18 = *(_QWORD *)(v8 + 8 * v7);
        if (!v18)
          break;
      }
    }
LABEL_23:
    v11 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_24:
    v20 = *(_BYTE *)(*(_QWORD *)(v4 + 48) + v16);
    sub_1B0EF3404();
    sub_1B0EF3410();
    result = sub_1B0EF341C();
    v21 = -1 << *(_BYTE *)(v6 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_BYTE *)(*(_QWORD *)(v6 + 48) + v14) = v20;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_33:
    result = swift_release();
    v3 = v2;
    goto LABEL_35;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v7 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    v7 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v7 >= v12)
      goto LABEL_33;
    v18 = *(_QWORD *)(v8 + 8 * v7);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_1B0EE7784(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1B0EE7804(v6, a2, a3);
  return sub_1B0EE77D8;
}

void sub_1B0EE77D8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1B0EE7804(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1B5E119A8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1B0EE7870;
  }
  __break(1u);
  return result;
}

void sub_1B0EE7870(id *a1)
{

}

uint64_t sub_1B0EE7878(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B0EF32C0();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1B0EF32C0();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1B0EED02C(&qword_1EEEDA1E8, &qword_1EEEDA1E0, MEMORY[0x1E0DEAF50]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1E0);
            v10 = sub_1B0EE7784(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for AXBoundingBox();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1B0EE7A20()
{
  JUMPOUT(0x1B5E11B10);
}

id _s16AXMediaUtilities13AXBoundingBoxC9timestamp10containing4heatACSd_SaySo7CGPointVGSftcfC_0(uint64_t a1, double a2, float a3)
{
  uint64_t v6;
  id result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v6 = sub_1B0EF30A4();
  result = (id)MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v11 = (double *)(a1 + 40);
    v12 = *(double *)(a1 + 40);
    v13 = *(double *)(a1 + 32);
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      v16 = *(v11 - 1);
      v17 = *v11;
      v18 = v13 - v16;
      if (v16 >= v13)
        v18 = -0.0;
      v15 = v15 + v18;
      if (v16 < v13)
        v13 = *(v11 - 1);
      v19 = v12 - v17;
      if (v17 >= v12)
        v19 = -0.0;
      v14 = v14 + v19;
      if (v17 < v12)
        v12 = *v11;
      v22.origin.x = v13;
      v22.origin.y = v12;
      v22.size.width = v15;
      v22.size.height = v14;
      if (CGRectGetMaxX(v22) < v16)
        v15 = v16 - v13;
      v23.origin.x = v13;
      v23.origin.y = v12;
      v23.size.width = v15;
      v23.size.height = v14;
      if (CGRectGetMaxY(v23) < v17)
        v14 = v17 - v12;
      v11 += 2;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    sub_1B0EF3098();
    v20 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
    return AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)((uint64_t)v9, 0, MEMORY[0x1E0DEE9D8], a2, a3, 0.0, v13, v12, v15, v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0(int64_t a1, _QWORD *a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  unint64_t v35;
  char v36;
  uint64_t inited;
  int64_t v38;
  float v39;
  float v40;
  uint64_t v41;
  float v42;
  float v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  double v48;
  double v49;
  id v50;
  float v51;
  float v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  double v59;
  double v60;
  _BOOL4 v61;
  int64_t v62;
  _BOOL4 v63;
  int64_t v64;
  _BOOL4 v65;
  char *v66;
  double v67;
  unint64_t v68;
  _QWORD *v69;
  __int128 v70;
  uint64_t v71;
  int64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v67 = a3;
  v6 = sub_1B0EF30A4();
  MEMORY[0x1E0C80A78](v6);
  v66 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = &selRef_setPlaybackDuration_;
  v9 = objc_msgSend((id)a1, sel_shape);
  v71 = sub_1B0EECFF4(0, &qword_1EEEDA020);
  v10 = sub_1B0EF3170();

  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_68;
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v10 + 32);
    goto LABEL_4;
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  v14 = (id)MEMORY[0x1B5E119A8](1, v10);
LABEL_8:
  v15 = v14;
  swift_bridgeObjectRelease();
  v3 = sub_1B0EF31D0();

  v16 = objc_msgSend((id)a1, v8[393]);
  v10 = sub_1B0EF3170();

  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_73;
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
  {
    for (i = *(id *)(v10 + 48); ; i = (id)MEMORY[0x1B5E119A8](2, v10))
    {
      v18 = i;
      swift_bridgeObjectRelease();
      v10 = sub_1B0EF31D0();

      v76 = MEMORY[0x1E0DEE9D8];
      if (v3 < 0)
        goto LABEL_75;
      v19 = MEMORY[0x1E0DEE9D8];
      if (!v3)
        return;
      if ((v10 & 0x8000000000000000) != 0)
        goto LABEL_76;
      v73 = (id)a1;
      v20 = 0;
      a1 = v72;
      v64 = v72 + 1;
      v60 = (double)(uint64_t)v10;
      v21 = __OFADD__(v72, 1);
      v65 = v21;
      v59 = (double)v3;
      v62 = v72 + 2;
      v22 = __OFADD__(v72, 2);
      v63 = v22;
      v58 = v72 + 3;
      v23 = __OFADD__(v72, 3);
      v61 = v23;
      v8 = (char **)0x1E0CB3000;
      v69 = a2;
      v68 = v10;
      v57 = v3;
      v70 = xmmword_1B0F00630;
      while (1)
      {
        if (v20 == v3)
          goto LABEL_66;
        if (v10)
          break;
LABEL_24:
        ++v20;
        v3 = v57;
        if (v20 == v57)
          return;
      }
      if (a1 < 0)
        goto LABEL_67;
      v3 = 0;
      while (v3 != v10)
      {
        if (a1)
        {
          v75 = v19;
          sub_1B0EE4B80(0, a1, 0);
          v24 = 0;
          v25 = v75;
          do
          {
            v74 = MEMORY[0x1E0DEE9D8];
            sub_1B0EF3260();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v24);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v20);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v3);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            v26 = (void *)sub_1B0EF3164();
            swift_release();
            v27 = objc_msgSend(v73, sel_objectForKeyedSubscript_, v26);

            objc_msgSend(v27, sel_floatValue);
            v29 = v28;

            v75 = v25;
            v31 = *(_QWORD *)(v25 + 16);
            v30 = *(_QWORD *)(v25 + 24);
            v32 = v31 + 1;
            if (v31 >= v30 >> 1)
            {
              sub_1B0EE4B80((char *)(v30 > 1), v31 + 1, 1);
              v25 = v75;
            }
            ++v24;
            *(_QWORD *)(v25 + 16) = v32;
            *(_DWORD *)(v25 + 4 * v31 + 32) = v29;
            a1 = v72;
          }
          while (v72 != v24);
          a2 = v69;
        }
        else
        {
          v32 = *(_QWORD *)(v19 + 16);
          if (!v32)
          {
            v10 = 0;
            goto LABEL_62;
          }
          v25 = v19;
        }
        v33 = 0;
        v10 = 0;
        do
        {
          if (v10 >= v32)
          {
            __break(1u);
            return;
          }
          if (*(float *)(v25 + 32 + 4 * v10) < *(float *)(v25 + 4 * v33 + 32))
            v10 = v33;
          ++v33;
        }
        while (v32 != v33);
        if (v10 >= v32)
          goto LABEL_62;
        if (v10 >= 0xE)
          goto LABEL_77;
        v34 = *(float *)(v25 + 4 * v10 + 32);
        if (a2[2] && (v35 = sub_1B0EE4ED4(v10), (v36 & 1) != 0))
        {
          if (*(float *)(a2[7] + 4 * v35) > v34)
            goto LABEL_29;
        }
        else if (v34 < 0.3)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA250);
        inited = swift_initStackObject();
        v38 = a1;
        a1 = inited;
        *(_OWORD *)(inited + 16) = v70;
        *(_QWORD *)(inited + 32) = v38;
        *(_QWORD *)(inited + 40) = v20;
        *(_QWORD *)(inited + 48) = v3;
        a2 = MLMultiArray.subscript.getter(inited);
        objc_msgSend(a2, sel_floatValue);
        v40 = v39;

        swift_setDeallocating();
        v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = v70;
        if (v65)
          goto LABEL_63;
        a1 = v41;
        *(_QWORD *)(v41 + 32) = v64;
        *(_QWORD *)(v41 + 40) = v20;
        *(_QWORD *)(v41 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v41);
        objc_msgSend(a2, sel_floatValue);
        v43 = v42;

        swift_setDeallocating();
        v44 = swift_initStackObject();
        *(_OWORD *)(v44 + 16) = v70;
        if (v63)
          goto LABEL_64;
        a1 = v44;
        *(_QWORD *)(v44 + 32) = v62;
        *(_QWORD *)(v44 + 40) = v20;
        *(_QWORD *)(v44 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v44);
        objc_msgSend(a2, sel_floatValue);
        v46 = v45;

        swift_setDeallocating();
        v47 = swift_initStackObject();
        *(_OWORD *)(v47 + 16) = v70;
        if (v61)
          goto LABEL_65;
        v48 = ((double)v3 + v43) / v60;
        v49 = 1.0 - ((double)v20 + v40) / v59;
        *(_QWORD *)(v47 + 32) = v58;
        *(_QWORD *)(v47 + 40) = v20;
        *(_QWORD *)(v47 + 48) = v3;
        v50 = MLMultiArray.subscript.getter(v47);
        objc_msgSend(v50, sel_floatValue);
        v52 = v51;

        swift_setDeallocating();
        v53 = (uint64_t)v66;
        sub_1B0EF3098();
        v54 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
        v55 = AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(v53, v10, v25, v67, v34, 0.0, v48 - v52 * 0.5, v49 - v46 * 0.5, v52, v46);
        MEMORY[0x1B5E118D0]();
        if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B0EF3188();
        sub_1B0EF31A0();
        sub_1B0EF317C();

        a2 = v69;
        a1 = v72;
LABEL_30:
        v19 = MEMORY[0x1E0DEE9D8];
        ++v3;
        v10 = v68;
        if (v3 == v68)
          goto LABEL_24;
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      v11 = (id)MEMORY[0x1B5E119A8](0, v10);
LABEL_4:
      v12 = v11;
      swift_bridgeObjectRelease();
      v10 = (unint64_t)objc_msgSend(v12, sel_integerValue);

      v72 = v10 - 4;
      if (__OFSUB__(v10, 4))
        goto LABEL_70;
      v13 = objc_msgSend((id)a1, v8[393]);
      v10 = sub_1B0EF3170();

      if ((v10 & 0xC000000000000001) != 0)
        goto LABEL_71;
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v14 = *(id *)(v10 + 40);
        goto LABEL_8;
      }
      __break(1u);
LABEL_73:
      ;
    }
  }
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
}

uint64_t sub_1B0EE8448@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_1B0EE3634(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

void _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0(int64_t a1, _QWORD *a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  unint64_t v35;
  char v36;
  uint64_t inited;
  int64_t v38;
  float v39;
  float v40;
  uint64_t v41;
  float v42;
  float v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  double v48;
  double v49;
  id v50;
  float v51;
  float v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  double v59;
  double v60;
  _BOOL4 v61;
  int64_t v62;
  _BOOL4 v63;
  int64_t v64;
  _BOOL4 v65;
  char *v66;
  double v67;
  unint64_t v68;
  _QWORD *v69;
  __int128 v70;
  uint64_t v71;
  int64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v67 = a3;
  v6 = sub_1B0EF30A4();
  MEMORY[0x1E0C80A78](v6);
  v66 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = &selRef_setPlaybackDuration_;
  v9 = objc_msgSend((id)a1, sel_shape);
  v71 = sub_1B0EECFF4(0, &qword_1EEEDA020);
  v10 = sub_1B0EF3170();

  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_68;
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v10 + 32);
    goto LABEL_4;
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  v14 = (id)MEMORY[0x1B5E119A8](1, v10);
LABEL_8:
  v15 = v14;
  swift_bridgeObjectRelease();
  v3 = sub_1B0EF31D0();

  v16 = objc_msgSend((id)a1, v8[393]);
  v10 = sub_1B0EF3170();

  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_73;
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
  {
    for (i = *(id *)(v10 + 48); ; i = (id)MEMORY[0x1B5E119A8](2, v10))
    {
      v18 = i;
      swift_bridgeObjectRelease();
      v10 = sub_1B0EF31D0();

      v76 = MEMORY[0x1E0DEE9D8];
      if (v3 < 0)
        goto LABEL_75;
      v19 = MEMORY[0x1E0DEE9D8];
      if (!v3)
        return;
      if ((v10 & 0x8000000000000000) != 0)
        goto LABEL_76;
      v73 = (id)a1;
      v20 = 0;
      a1 = v72;
      v64 = v72 + 1;
      v60 = (double)(uint64_t)v10;
      v21 = __OFADD__(v72, 1);
      v65 = v21;
      v59 = (double)v3;
      v62 = v72 + 2;
      v22 = __OFADD__(v72, 2);
      v63 = v22;
      v58 = v72 + 3;
      v23 = __OFADD__(v72, 3);
      v61 = v23;
      v8 = (char **)0x1E0CB3000;
      v69 = a2;
      v68 = v10;
      v57 = v3;
      v70 = xmmword_1B0F00630;
      while (1)
      {
        if (v20 == v3)
          goto LABEL_66;
        if (v10)
          break;
LABEL_24:
        ++v20;
        v3 = v57;
        if (v20 == v57)
          return;
      }
      if (a1 < 0)
        goto LABEL_67;
      v3 = 0;
      while (v3 != v10)
      {
        if (a1)
        {
          v75 = v19;
          sub_1B0EE4B80(0, a1, 0);
          v24 = 0;
          v25 = v75;
          do
          {
            v74 = MEMORY[0x1E0DEE9D8];
            sub_1B0EF3260();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v24);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v20);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v3);
            sub_1B0EF3248();
            sub_1B0EF326C();
            sub_1B0EF3278();
            sub_1B0EF3254();
            v26 = (void *)sub_1B0EF3164();
            swift_release();
            v27 = objc_msgSend(v73, sel_objectForKeyedSubscript_, v26);

            objc_msgSend(v27, sel_floatValue);
            v29 = v28;

            v75 = v25;
            v31 = *(_QWORD *)(v25 + 16);
            v30 = *(_QWORD *)(v25 + 24);
            v32 = v31 + 1;
            if (v31 >= v30 >> 1)
            {
              sub_1B0EE4B80((char *)(v30 > 1), v31 + 1, 1);
              v25 = v75;
            }
            ++v24;
            *(_QWORD *)(v25 + 16) = v32;
            *(_DWORD *)(v25 + 4 * v31 + 32) = v29;
            a1 = v72;
          }
          while (v72 != v24);
          a2 = v69;
        }
        else
        {
          v32 = *(_QWORD *)(v19 + 16);
          if (!v32)
          {
            v10 = 0;
            goto LABEL_62;
          }
          v25 = v19;
        }
        v33 = 0;
        v10 = 0;
        do
        {
          if (v10 >= v32)
          {
            __break(1u);
            return;
          }
          if (*(float *)(v25 + 32 + 4 * v10) < *(float *)(v25 + 4 * v33 + 32))
            v10 = v33;
          ++v33;
        }
        while (v32 != v33);
        if (v10 >= v32)
          goto LABEL_62;
        if (v10 >= 0x11)
          goto LABEL_77;
        v34 = *(float *)(v25 + 4 * v10 + 32);
        if (a2[2] && (v35 = sub_1B0EE4ED4(v10), (v36 & 1) != 0))
        {
          if (*(float *)(a2[7] + 4 * v35) > v34)
            goto LABEL_29;
        }
        else if (v34 < 0.3)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA250);
        inited = swift_initStackObject();
        v38 = a1;
        a1 = inited;
        *(_OWORD *)(inited + 16) = v70;
        *(_QWORD *)(inited + 32) = v38;
        *(_QWORD *)(inited + 40) = v20;
        *(_QWORD *)(inited + 48) = v3;
        a2 = MLMultiArray.subscript.getter(inited);
        objc_msgSend(a2, sel_floatValue);
        v40 = v39;

        swift_setDeallocating();
        v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = v70;
        if (v65)
          goto LABEL_63;
        a1 = v41;
        *(_QWORD *)(v41 + 32) = v64;
        *(_QWORD *)(v41 + 40) = v20;
        *(_QWORD *)(v41 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v41);
        objc_msgSend(a2, sel_floatValue);
        v43 = v42;

        swift_setDeallocating();
        v44 = swift_initStackObject();
        *(_OWORD *)(v44 + 16) = v70;
        if (v63)
          goto LABEL_64;
        a1 = v44;
        *(_QWORD *)(v44 + 32) = v62;
        *(_QWORD *)(v44 + 40) = v20;
        *(_QWORD *)(v44 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v44);
        objc_msgSend(a2, sel_floatValue);
        v46 = v45;

        swift_setDeallocating();
        v47 = swift_initStackObject();
        *(_OWORD *)(v47 + 16) = v70;
        if (v61)
          goto LABEL_65;
        v48 = ((double)v3 + v43) / v60;
        v49 = 1.0 - ((double)v20 + v40) / v59;
        *(_QWORD *)(v47 + 32) = v58;
        *(_QWORD *)(v47 + 40) = v20;
        *(_QWORD *)(v47 + 48) = v3;
        v50 = MLMultiArray.subscript.getter(v47);
        objc_msgSend(v50, sel_floatValue);
        v52 = v51;

        swift_setDeallocating();
        v53 = (uint64_t)v66;
        sub_1B0EF3098();
        v54 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
        v55 = AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(v53, v10, v25, v67, v34, 0.0, v48 - v52 * 0.5, v49 - v46 * 0.5, v52, v46);
        MEMORY[0x1B5E118D0]();
        if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B0EF3188();
        sub_1B0EF31A0();
        sub_1B0EF317C();

        a2 = v69;
        a1 = v72;
LABEL_30:
        v19 = MEMORY[0x1E0DEE9D8];
        ++v3;
        v10 = v68;
        if (v3 == v68)
          goto LABEL_24;
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      v11 = (id)MEMORY[0x1B5E119A8](0, v10);
LABEL_4:
      v12 = v11;
      swift_bridgeObjectRelease();
      v10 = (unint64_t)objc_msgSend(v12, sel_integerValue);

      v72 = v10 - 8;
      if (__OFSUB__(v10, 8))
        goto LABEL_70;
      v13 = objc_msgSend((id)a1, v8[393]);
      v10 = sub_1B0EF3170();

      if ((v10 & 0xC000000000000001) != 0)
        goto LABEL_71;
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v14 = *(id *)(v10 + 40);
        goto LABEL_8;
      }
      __break(1u);
LABEL_73:
      ;
    }
  }
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
}

uint64_t sub_1B0EE8D0C(unint64_t a1, char *a2, float a3)
{
  uint64_t v6;
  CGRect *v7;
  unint64_t i;
  char *v9;
  char *v10;
  unint64_t v11;
  CGRect *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  float v24;
  char *v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_22;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v7 = (CGRect *)&a2[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
  a2 += OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex;
  swift_beginAccess();
  v26 = a2;
  swift_beginAccess();
  if (v6)
  {
    for (i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v9 = (char *)MEMORY[0x1B5E119A8](i, a1);
      }
      else
      {
        if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_21:
          __break(1u);
LABEL_22:
          v6 = sub_1B0EF32C0();
          goto LABEL_3;
        }
        v9 = (char *)*(id *)(a1 + 8 * i + 32);
      }
      v10 = v9;
      v11 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_21;
      v12 = (CGRect *)&v9[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
      swift_beginAccess();
      v28 = CGRectUnion(*v12, *v7);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      v17 = CGRectGetHeight(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v18 = sqrt(v17 * CGRectGetWidth(v29));
      if (v18 == 0.0)
      {
        if (a3 >= 0.0)
          goto LABEL_5;
      }
      else
      {
        v30 = CGRectIntersection(*v12, *v7);
        v19 = v30.origin.x;
        v20 = v30.origin.y;
        v21 = v30.size.width;
        v22 = v30.size.height;
        v23 = CGRectGetHeight(v30);
        v31.origin.x = v19;
        v31.origin.y = v20;
        v31.size.width = v21;
        v31.size.height = v22;
        v24 = sqrt(v23 * CGRectGetWidth(v31)) / v18;
        if (v24 <= a3)
          goto LABEL_5;
      }
      a2 = &v10[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      if (*(_QWORD *)a2 == *(_QWORD *)v26)
      {

        goto LABEL_6;
      }
LABEL_5:
      sub_1B0EF3248();
      sub_1B0EF326C();
      sub_1B0EF3278();
      a2 = (char *)&v27;
      sub_1B0EF3254();
LABEL_6:
      if (v11 == v6)
        return v27;
    }
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1B0EE8FCC(uint64_t result, uint64_t a2, uint64_t (*a3)(BOOL, uint64_t, uint64_t))
{
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x1E0DEE9D8];
  v5 = 0;
  v6 = result + 32;
  v7 = a2 + 56;
  v8 = MEMORY[0x1E0DEE9D8];
  v18 = result + 32;
  do
  {
    if (v5 <= v3)
      v9 = v3;
    else
      v9 = v5;
    while (1)
    {
      if (v5 == v9)
      {
        __break(1u);
        return result;
      }
      v10 = *(unsigned __int8 *)(v6 + v5++);
      if (!*(_QWORD *)(a2 + 16))
        break;
      sub_1B0EF3404();
      sub_1B0EF3410();
      result = sub_1B0EF341C();
      v11 = -1 << *(_BYTE *)(a2 + 32);
      v12 = result & ~v11;
      if (((*(_QWORD *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        break;
      v13 = *(_QWORD *)(a2 + 48);
      if (*(unsigned __int8 *)(v13 + v12) != v10)
      {
        v14 = ~v11;
        do
        {
          v12 = (v12 + 1) & v14;
          if (((*(_QWORD *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
            goto LABEL_15;
        }
        while (*(unsigned __int8 *)(v13 + v12) != v10);
      }
      if (v5 == v3)
        return v8;
    }
LABEL_15:
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
      result = a3(0, *(_QWORD *)(v8 + 16) + 1, 1);
    v16 = *(_QWORD *)(v8 + 16);
    v15 = *(_QWORD *)(v8 + 24);
    if (v16 >= v15 >> 1)
      result = a3(v15 > 1, v16 + 1, 1);
    *(_QWORD *)(v8 + 16) = v16 + 1;
    *(_BYTE *)(v8 + v16 + 32) = v10;
    v6 = v18;
  }
  while (v5 != v3);
  return v8;
}

uint64_t _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(unint64_t a1, float a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a1;
  v19 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_20;
  v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      v17 = v4;
      sub_1B0EE50D0(&v17);
      v5 = v17;
      v18 = v17;
      if (v17 < 0 || (v17 & 0x4000000000000000) != 0)
        break;
      if (*(uint64_t *)(v17 + 16) < 1)
        goto LABEL_24;
      while (1)
      {
LABEL_7:
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v5 & 0x8000000000000000) != 0
          || (v5 & 0x4000000000000000) != 0)
        {
          sub_1B0EE523C(v5);
        }
        v3 = v5 & 0xFFFFFFFFFFFFFF8;
        v6 = *(_QWORD *)(v3 + 16);
        if (!v6)
          break;
        v7 = v6 - 1;
        v9 = *(void **)(v3 + 32);
        v8 = v3 + 32;
        memmove((void *)v8, (const void *)(v8 + 8), 8 * (v6 - 1));
        *(_QWORD *)(v8 - 16) = v7;
        sub_1B0EF317C();
        v10 = v9;
        MEMORY[0x1B5E118D0]();
        if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B0EF3188();
        sub_1B0EF31A0();
        sub_1B0EF317C();
        v11 = swift_bridgeObjectRetain();
        v5 = sub_1B0EE8D0C(v11, v10, a2);
        swift_bridgeObjectRelease_n();

        v18 = v5;
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain();
          v12 = sub_1B0EF32C0();
          swift_bridgeObjectRelease();
          if (v12 <= 0)
          {
LABEL_18:
            swift_bridgeObjectRelease();
            return v19;
          }
        }
        else if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
        {
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
      v13 = sub_1B0EF32C0();
      swift_bridgeObjectRelease();
      if (v13 < 1)
        goto LABEL_22;
      v14 = swift_bridgeObjectRetain();
      v4 = (uint64_t)sub_1B0EE5148(v14);
      swift_bridgeObjectRelease();
    }
    swift_retain();
    v15 = sub_1B0EF32C0();
    swift_release();
    if (v15 >= 1)
      goto LABEL_7;
LABEL_24:
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v3;
}

unint64_t sub_1B0EE93E8()
{
  unint64_t result;

  result = qword_1EEEDA030;
  if (!qword_1EEEDA030)
  {
    result = MEMORY[0x1B5E12DAC](MEMORY[0x1E0DEF098], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1EEEDA030);
  }
  return result;
}

uint64_t sub_1B0EE942C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass;
  result = swift_beginAccess();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (*(_QWORD *)(*(_QWORD *)v3 + 16) <= a1)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_1B0EE94BC(uint64_t a1, float (*a2)(uint64_t, float))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  sub_1B0EE4B80(0, 0, 0);
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 32;
    do
    {
      v7 = a2(v5, *(float *)(v6 + 4 * v5));
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_1B0EE4B80((char *)(v8 > 1), v9 + 1, 1);
      ++v5;
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(float *)(v11 + 4 * v9 + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char sub_1B0EE95C8(uint64_t a1)
{
  void *v1;
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char *v8;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v11;
  CGFloat v12;
  CGFloat *v13;
  float *v14;
  Swift::Int *v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  objc_super v21;
  char v22;
  char v23;
  CGRect v24;

  v3 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = v1;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinX = CGRectGetMinX(v24);
  MinY = CGRectGetMinY(*v3);
  v11 = CGRectGetWidth(*v3);
  v12 = CGRectGetHeight(*v3);
  v13 = (CGFloat *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box];
  *v13 = MinX;
  v13[1] = MinY;
  v13[2] = v11;
  v13[3] = v12;
  v14 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  *(double *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence] = *v14;
  v15 = (Swift::Int *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  v16 = *v15;
  if (__OFADD__(*v15, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label] = *v15 + 1;
  LOBYTE(v16) = UIType.init(rawValue:)(v16);
  if (v23 == 14)
  {
LABEL_5:
    __break(1u);
    return v16;
  }
  v22 = v23;
  v17 = sub_1B0EF3128();
  v18 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName];
  *v18 = v17;
  v18[1] = v19;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for AXMElementDetectorResult();
  LOBYTE(v16) = objc_msgSendSuper2(&v21, sel_init);
  return v16;
}

uint64_t sub_1B0EE9754(uint64_t a1, unint64_t a2, float a3)
{
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
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(unint64_t, char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void *v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  void *v63;
  Swift::Int *v64;
  unint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  void *v76;
  unint64_t v77;
  Swift::Int *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t result;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  __int128 v105;
  _QWORD *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  unint64_t v115;
  unsigned __int8 v116;
  uint64_t v117;
  _QWORD *v118;

  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA170);
  v103 = *(_QWORD *)(v111 - 8);
  v6 = MEMORY[0x1E0C80A78](v111);
  v99 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v104 = (char *)&v96 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v102 = (char *)&v96 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v110 = (char *)&v96 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v109 = (char *)&v96 - v15;
  MEMORY[0x1E0C80A78](v14);
  v108 = (char *)&v96 - v16;
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA178);
  v97 = *(_QWORD *)(v112 - 8);
  v17 = MEMORY[0x1E0C80A78](v112);
  v107 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v100 = (char *)&v96 - v20;
  MEMORY[0x1E0C80A78](v19);
  v101 = (char *)&v96 - v21;
  v22 = sub_1B0EEA50C((uint64_t)&unk_1E625B5B8, &qword_1EEEDA228);
  swift_bridgeObjectRetain();
  v23 = 0;
  v24 = sub_1B0EE8FCC((uint64_t)&unk_1E625B7F0, v22, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_1B0EE4BB8);
  v113 = v22;
  swift_bridgeObjectRelease();
  v114 = (void (*)(char *, uint64_t))sub_1B0EEA488(v24, (void (*)(void))sub_1B0EED0B0, (uint64_t)&type metadata for UIType, &qword_1EEEDA228);
  swift_bridgeObjectRelease();
  if (a2 >> 62)
    goto LABEL_70;
  v25 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v26 = (char *)MEMORY[0x1E0DEE9D8];
    v106 = (_QWORD *)v23;
    if (v25)
    {
      if (v25 < 1)
      {
        __break(1u);
        goto LABEL_77;
      }
      v27 = (void *)a1;
      v28 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
          v29 = (id)MEMORY[0x1B5E119A8](v28, a2);
        else
          v29 = *(id *)(a2 + 8 * v28 + 32);
        v30 = v29;
        objc_msgSend(v29, sel_floatValue, v96);
        v32 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v26 = sub_1B0EE4F38(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
        v34 = *((_QWORD *)v26 + 2);
        v33 = *((_QWORD *)v26 + 3);
        if (v34 >= v33 >> 1)
          v26 = sub_1B0EE4F38((char *)(v33 > 1), v34 + 1, 1, v26);
        ++v28;
        *((_QWORD *)v26 + 2) = v34 + 1;
        *(_DWORD *)&v26[4 * v34 + 32] = v32;

      }
      while (v25 != v28);
    }
    else
    {
      v27 = (void *)a1;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)v26 + 2) >= 0xEuLL)
      v35 = 14;
    else
      v35 = *((_QWORD *)v26 + 2);
    if (v35)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA218);
      v36 = sub_1B0EF32E4();
    }
    else
    {
      v36 = MEMORY[0x1E0DEE9E0];
    }
    v37 = v27;
    v118 = (_QWORD *)v36;
    swift_bridgeObjectRetain();
    v38 = v106;
    sub_1B0EE61FC((uint64_t)&unk_1E625B7F0, (uint64_t)v26, 1, &v118);
    if (v38)
      goto LABEL_80;
    swift_bridgeObjectRelease();
    v106 = v118;
    sub_1B0EED02C(&qword_1EEEDA188, &qword_1EEEDA178, MEMORY[0x1E0C9E6C8]);
    v39 = v37;
    sub_1B0EF30C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA190);
    v40 = swift_allocObject();
    v105 = xmmword_1B0F00640;
    *(_OWORD *)(v40 + 16) = xmmword_1B0F00640;
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA198);
    *(_QWORD *)(v40 + 56) = v41;
    v42 = sub_1B0EED02C(&qword_1EEEDA1A0, &qword_1EEEDA198, MEMORY[0x1E0C9E830]);
    *(_QWORD *)(v40 + 64) = v42;
    *(_QWORD *)(v40 + 32) = 0;
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1A8);
    *(_QWORD *)(v40 + 96) = v43;
    v44 = sub_1B0EED02C(&qword_1EEEDA1B0, &qword_1EEEDA1A8, MEMORY[0x1E0C9E7B0]);
    *(_OWORD *)(v40 + 72) = xmmword_1B0F00650;
    *(_QWORD *)(v40 + 136) = v41;
    *(_QWORD *)(v40 + 144) = v42;
    *(_QWORD *)(v40 + 104) = v44;
    *(_QWORD *)(v40 + 112) = 0;
    *(_QWORD *)(v40 + 176) = v41;
    *(_QWORD *)(v40 + 184) = v42;
    *(_QWORD *)(v40 + 152) = 0;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = v105;
    *(_QWORD *)(v45 + 56) = v41;
    *(_QWORD *)(v45 + 64) = v42;
    *(_QWORD *)(v45 + 32) = 0;
    *(_QWORD *)(v45 + 96) = v43;
    *(_QWORD *)(v45 + 104) = v44;
    *(_OWORD *)(v45 + 72) = xmmword_1B0F00660;
    *(_QWORD *)(v45 + 136) = v41;
    *(_QWORD *)(v45 + 144) = v42;
    *(_QWORD *)(v45 + 112) = 0;
    *(_QWORD *)(v45 + 176) = v41;
    *(_QWORD *)(v45 + 184) = v42;
    *(_QWORD *)(v45 + 152) = 0;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = v105;
    *(_QWORD *)(v46 + 56) = v41;
    *(_QWORD *)(v46 + 64) = v42;
    *(_QWORD *)(v46 + 32) = 0;
    *(_QWORD *)(v46 + 96) = v43;
    *(_QWORD *)(v46 + 104) = v44;
    *(_OWORD *)(v46 + 72) = xmmword_1B0F00670;
    *(_QWORD *)(v46 + 136) = v41;
    *(_QWORD *)(v46 + 144) = v42;
    *(_QWORD *)(v46 + 112) = 0;
    *(_QWORD *)(v46 + 176) = v41;
    *(_QWORD *)(v46 + 184) = v42;
    *(_QWORD *)(v46 + 152) = 0;
    v47 = v110;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1B8);
    v48 = v103;
    v49 = *(_QWORD *)(v103 + 72);
    v50 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
    v51 = swift_allocObject();
    v98 = xmmword_1B0F00620;
    *(_OWORD *)(v51 + 16) = xmmword_1B0F00620;
    v52 = *(void (**)(unint64_t, char *, uint64_t))(v48 + 16);
    v53 = v111;
    v52(v51 + v50, v47, v111);
    v52(v51 + v50 + v49, v108, v53);
    v118 = (_QWORD *)v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1C0);
    sub_1B0EED02C(&qword_1EEEDA1C8, &qword_1EEEDA1C0, MEMORY[0x1E0DEAF38]);
    v54 = sub_1B0EED02C(&qword_1EEEDA1D0, &qword_1EEEDA170, MEMORY[0x1E0C9E738]);
    sub_1B0EF30B0();
    v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = v98;
    v52(v55 + v50, v110, v53);
    v52(v55 + v50 + v49, v109, v53);
    v118 = (_QWORD *)v55;
    sub_1B0EF30B0();
    v56 = v102;
    sub_1B0EF30BC();
    v57 = sub_1B0EECFF4(0, &qword_1EEEDA1D8);
    *(_QWORD *)&v105 = v52;
    v52((unint64_t)v104, v56, v53);
    *(_QWORD *)&v98 = v54;
    a2 = v57;
    v58 = (void *)sub_1B0EF31E8();
    _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0((int64_t)v58, v106, 0.0);
    v23 = v59;

    v115 = MEMORY[0x1E0DEE9D8];
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      v60 = sub_1B0EF32C0();
    }
    else
    {
      v60 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    a1 = MEMORY[0x1E0DEE9D8];
    if (v60)
    {
      v96 = v57;
      v61 = 0;
      while (1)
      {
        if ((v23 & 0xC000000000000001) != 0)
        {
          v62 = (char *)MEMORY[0x1B5E119A8](v61, v23);
        }
        else
        {
          if (v61 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_67;
          v62 = (char *)*(id *)(v23 + 8 * v61 + 32);
        }
        v63 = v62;
        a1 = v61 + 1;
        if (__OFADD__(v61, 1))
          break;
        v64 = (Swift::Int *)&v62[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
        swift_beginAccess();
        UIType.init(rawValue:)(*v64);
        if (v117 == 14)
          goto LABEL_78;
        if (sub_1B0EE2104(v117, (uint64_t)v114))
        {

        }
        else
        {
          a2 = (unint64_t)&v115;
          sub_1B0EF3248();
          sub_1B0EF326C();
          sub_1B0EF3278();
          sub_1B0EF3254();
        }
        ++v61;
        if (a1 == v60)
        {
          v65 = v115;
          v57 = v96;
          a1 = MEMORY[0x1E0DEE9D8];
          goto LABEL_39;
        }
      }
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    v65 = MEMORY[0x1E0DEE9D8];
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v66 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v65, a3);
    swift_release();
    v67 = *(void (**)(char *, uint64_t))(v103 + 8);
    v68 = v111;
    v67(v102, v111);
    swift_bridgeObjectRelease();
    v69 = v99;
    sub_1B0EF30BC();
    ((void (*)(char *, char *, uint64_t))v105)(v104, v69, v68);
    a2 = v57;
    v70 = (void *)sub_1B0EF31E8();
    _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0((int64_t)v70, v106, 0.0);
    v72 = v71;

    v117 = a1;
    if (v72 >> 62)
    {
      swift_bridgeObjectRetain();
      a1 = sub_1B0EF32C0();
    }
    else
    {
      a1 = *(_QWORD *)((v72 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v73 = MEMORY[0x1E0DEE9D8];
    if (!a1)
      break;
    *(_QWORD *)&v105 = v66;
    v114 = v67;
    v74 = 0;
    v23 = v72 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if ((v72 & 0xC000000000000001) != 0)
      {
        v75 = (char *)MEMORY[0x1B5E119A8](v74, v72);
      }
      else
      {
        if (v74 >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_69;
        v75 = (char *)*(id *)(v72 + 8 * v74 + 32);
      }
      v76 = v75;
      v77 = v74 + 1;
      if (__OFADD__(v74, 1))
        break;
      v78 = (Swift::Int *)&v75[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      UIType.init(rawValue:)(*v78);
      if (v116 == 14)
        goto LABEL_79;
      if (sub_1B0EE2104(v116, v113))
      {

      }
      else
      {
        a2 = (unint64_t)&v117;
        sub_1B0EF3248();
        sub_1B0EF326C();
        sub_1B0EF3278();
        sub_1B0EF3254();
      }
      ++v74;
      if (v77 == a1)
      {
        v79 = v117;
        v67 = v114;
        v66 = v105;
        v73 = MEMORY[0x1E0DEE9D8];
        goto LABEL_55;
      }
    }
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    swift_bridgeObjectRetain();
    v25 = sub_1B0EF32C0();
  }
  v79 = MEMORY[0x1E0DEE9D8];
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v80 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v79, a3);
  swift_release();
  v67(v99, v111);
  swift_release();
  swift_bridgeObjectRelease();
  v117 = v66;
  sub_1B0EE698C(v80);
  v81 = v117;
  v117 = v73;
  if (!(v81 >> 62))
  {
    v82 = *(_QWORD *)((v81 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v82)
      goto LABEL_57;
LABEL_74:
    swift_bridgeObjectRelease();
    v91 = MEMORY[0x1E0DEE9D8];
LABEL_75:
    v92 = *(void (**)(char *, uint64_t))(v97 + 8);
    v93 = v112;
    v92(v107, v112);
    v92(v100, v93);
    v94 = v111;
    v67(v110, v111);
    v67(v109, v94);
    v67(v108, v94);
    v92(v101, v93);
    return v91;
  }
  swift_bridgeObjectRetain();
  v82 = sub_1B0EF32C0();
  swift_bridgeObjectRelease();
  if (!v82)
    goto LABEL_74;
LABEL_57:
  if (v82 >= 1)
  {
    v83 = v67;
    v84 = 0;
    do
    {
      if ((v81 & 0xC000000000000001) != 0)
        v85 = (id)MEMORY[0x1B5E119A8](v84, v81);
      else
        v85 = *(id *)(v81 + 8 * v84 + 32);
      v86 = v85;
      v87 = objc_allocWithZone((Class)type metadata accessor for AXMElementDetectorResult());
      v88 = v86;
      v89 = (void *)sub_1B0EE95C8((uint64_t)v88);

      v90 = v89;
      MEMORY[0x1B5E118D0]();
      if (*(_QWORD *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B0EF3188();
      ++v84;
      sub_1B0EF31A0();
      sub_1B0EF317C();

    }
    while (v82 != v84);
    swift_bridgeObjectRelease();
    v91 = v117;
    v67 = v83;
    goto LABEL_75;
  }
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1B0EEA488(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  unsigned __int8 *v8;
  unsigned int v9;
  char v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a1 + 16);
  a2();
  result = sub_1B0EF31C4();
  v11 = result;
  if (v6)
  {
    v8 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v9 = *v8++;
      sub_1B0EE60C8(&v10, v9, a4);
      --v6;
    }
    while (v6);
    return v11;
  }
  return result;
}

uint64_t sub_1B0EEA50C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    v4 = sub_1B0EF320C();
    v5 = 0;
    v6 = v4 + 56;
    v7 = a1 + 32;
    while (1)
    {
      v8 = *(unsigned __int8 *)(v7 + v5);
      sub_1B0EF3404();
      sub_1B0EF3410();
      result = sub_1B0EF341C();
      v10 = -1 << *(_BYTE *)(v4 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v6 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      v15 = *(_QWORD *)(v4 + 48);
      if (((1 << v11) & v13) != 0)
      {
        if (*(unsigned __int8 *)(v15 + v11) == v8)
          goto LABEL_3;
        v16 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v16;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v6 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          if (*(unsigned __int8 *)(v15 + v11) == v8)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v6 + 8 * v12) = v14 | v13;
      *(_BYTE *)(v15 + v11) = v8;
      v17 = *(_QWORD *)(v4 + 16);
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v4 + 16) = v19;
LABEL_3:
      if (++v5 == v2)
        return v4;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

char sub_1B0EEA648(uint64_t a1)
{
  void *v1;
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char *v8;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v11;
  CGFloat v12;
  CGFloat *v13;
  float *v14;
  Swift::Int *v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  objc_super v21;
  char v22;
  char v23;
  CGRect v24;

  v3 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = v1;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinX = CGRectGetMinX(v24);
  MinY = CGRectGetMinY(*v3);
  v11 = CGRectGetWidth(*v3);
  v12 = CGRectGetHeight(*v3);
  v13 = (CGFloat *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box];
  *v13 = MinX;
  v13[1] = MinY;
  v13[2] = v11;
  v13[3] = v12;
  v14 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  *(double *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence] = *v14;
  v15 = (Swift::Int *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  v16 = *v15;
  if (__OFADD__(*v15, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  *(_QWORD *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label] = *v15 + 1;
  LOBYTE(v16) = UITypeClickability.init(rawValue:)(v16);
  if (v23 == 17)
  {
LABEL_5:
    __break(1u);
    return v16;
  }
  v22 = v23;
  v17 = sub_1B0EF3128();
  v18 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName];
  *v18 = v17;
  v18[1] = v19;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for AXMClickabilityDetectorResult();
  LOBYTE(v16) = objc_msgSendSuper2(&v21, sel_init);
  return v16;
}

uint64_t sub_1B0EEA7D4(uint64_t a1, unint64_t a2, float a3)
{
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
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(unint64_t, char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void *v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  void *v63;
  Swift::Int *v64;
  unint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  void *v76;
  unint64_t v77;
  Swift::Int *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t result;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  __int128 v105;
  _QWORD *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  unint64_t v115;
  unsigned __int8 v116;
  uint64_t v117;
  _QWORD *v118;

  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA170);
  v103 = *(_QWORD *)(v111 - 8);
  v6 = MEMORY[0x1E0C80A78](v111);
  v99 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v104 = (char *)&v96 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v102 = (char *)&v96 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v110 = (char *)&v96 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v109 = (char *)&v96 - v15;
  MEMORY[0x1E0C80A78](v14);
  v108 = (char *)&v96 - v16;
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA178);
  v97 = *(_QWORD *)(v112 - 8);
  v17 = MEMORY[0x1E0C80A78](v112);
  v107 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v100 = (char *)&v96 - v20;
  MEMORY[0x1E0C80A78](v19);
  v101 = (char *)&v96 - v21;
  v22 = sub_1B0EEA50C((uint64_t)&unk_1E625B5E0, &qword_1EEEDA208);
  swift_bridgeObjectRetain();
  v23 = 0;
  v24 = sub_1B0EE8FCC((uint64_t)&unk_1E625B608, v22, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_1B0EE4BDC);
  v113 = v22;
  swift_bridgeObjectRelease();
  v114 = (void (*)(char *, uint64_t))sub_1B0EEA488(v24, (void (*)(void))sub_1B0EED06C, (uint64_t)&type metadata for UITypeClickability, &qword_1EEEDA208);
  swift_bridgeObjectRelease();
  if (a2 >> 62)
    goto LABEL_70;
  v25 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v26 = (char *)MEMORY[0x1E0DEE9D8];
    v106 = (_QWORD *)v23;
    if (v25)
    {
      if (v25 < 1)
      {
        __break(1u);
        goto LABEL_77;
      }
      v27 = (void *)a1;
      v28 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
          v29 = (id)MEMORY[0x1B5E119A8](v28, a2);
        else
          v29 = *(id *)(a2 + 8 * v28 + 32);
        v30 = v29;
        objc_msgSend(v29, sel_floatValue, v96);
        v32 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v26 = sub_1B0EE4F38(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
        v34 = *((_QWORD *)v26 + 2);
        v33 = *((_QWORD *)v26 + 3);
        if (v34 >= v33 >> 1)
          v26 = sub_1B0EE4F38((char *)(v33 > 1), v34 + 1, 1, v26);
        ++v28;
        *((_QWORD *)v26 + 2) = v34 + 1;
        *(_DWORD *)&v26[4 * v34 + 32] = v32;

      }
      while (v25 != v28);
    }
    else
    {
      v27 = (void *)a1;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)v26 + 2) >= 0x11uLL)
      v35 = 17;
    else
      v35 = *((_QWORD *)v26 + 2);
    if (v35)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA180);
      v36 = sub_1B0EF32E4();
    }
    else
    {
      v36 = MEMORY[0x1E0DEE9E0];
    }
    v37 = v27;
    v118 = (_QWORD *)v36;
    swift_bridgeObjectRetain();
    v38 = v106;
    sub_1B0EE65C4((uint64_t)&unk_1E625B608, (uint64_t)v26, 1, &v118);
    if (v38)
      goto LABEL_80;
    swift_bridgeObjectRelease();
    v106 = v118;
    sub_1B0EED02C(&qword_1EEEDA188, &qword_1EEEDA178, MEMORY[0x1E0C9E6C8]);
    v39 = v37;
    sub_1B0EF30C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA190);
    v40 = swift_allocObject();
    v105 = xmmword_1B0F00640;
    *(_OWORD *)(v40 + 16) = xmmword_1B0F00640;
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA198);
    *(_QWORD *)(v40 + 56) = v41;
    v42 = sub_1B0EED02C(&qword_1EEEDA1A0, &qword_1EEEDA198, MEMORY[0x1E0C9E830]);
    *(_QWORD *)(v40 + 64) = v42;
    *(_QWORD *)(v40 + 32) = 0;
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1A8);
    *(_QWORD *)(v40 + 96) = v43;
    v44 = sub_1B0EED02C(&qword_1EEEDA1B0, &qword_1EEEDA1A8, MEMORY[0x1E0C9E7B0]);
    *(_OWORD *)(v40 + 72) = xmmword_1B0F00680;
    *(_QWORD *)(v40 + 136) = v41;
    *(_QWORD *)(v40 + 144) = v42;
    *(_QWORD *)(v40 + 104) = v44;
    *(_QWORD *)(v40 + 112) = 0;
    *(_QWORD *)(v40 + 176) = v41;
    *(_QWORD *)(v40 + 184) = v42;
    *(_QWORD *)(v40 + 152) = 0;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = v105;
    *(_QWORD *)(v45 + 56) = v41;
    *(_QWORD *)(v45 + 64) = v42;
    *(_QWORD *)(v45 + 32) = 0;
    *(_QWORD *)(v45 + 96) = v43;
    *(_QWORD *)(v45 + 104) = v44;
    *(_OWORD *)(v45 + 72) = xmmword_1B0F00690;
    *(_QWORD *)(v45 + 136) = v41;
    *(_QWORD *)(v45 + 144) = v42;
    *(_QWORD *)(v45 + 112) = 0;
    *(_QWORD *)(v45 + 176) = v41;
    *(_QWORD *)(v45 + 184) = v42;
    *(_QWORD *)(v45 + 152) = 0;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = v105;
    *(_QWORD *)(v46 + 56) = v41;
    *(_QWORD *)(v46 + 64) = v42;
    *(_QWORD *)(v46 + 32) = 0;
    *(_QWORD *)(v46 + 96) = v43;
    *(_QWORD *)(v46 + 104) = v44;
    *(_OWORD *)(v46 + 72) = xmmword_1B0F006A0;
    *(_QWORD *)(v46 + 136) = v41;
    *(_QWORD *)(v46 + 144) = v42;
    *(_QWORD *)(v46 + 112) = 0;
    *(_QWORD *)(v46 + 176) = v41;
    *(_QWORD *)(v46 + 184) = v42;
    *(_QWORD *)(v46 + 152) = 0;
    v47 = v110;
    sub_1B0EF30D4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1B8);
    v48 = v103;
    v49 = *(_QWORD *)(v103 + 72);
    v50 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
    v51 = swift_allocObject();
    v98 = xmmword_1B0F00620;
    *(_OWORD *)(v51 + 16) = xmmword_1B0F00620;
    v52 = *(void (**)(unint64_t, char *, uint64_t))(v48 + 16);
    v53 = v111;
    v52(v51 + v50, v47, v111);
    v52(v51 + v50 + v49, v108, v53);
    v118 = (_QWORD *)v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEEDA1C0);
    sub_1B0EED02C(&qword_1EEEDA1C8, &qword_1EEEDA1C0, MEMORY[0x1E0DEAF38]);
    v54 = sub_1B0EED02C(&qword_1EEEDA1D0, &qword_1EEEDA170, MEMORY[0x1E0C9E738]);
    sub_1B0EF30B0();
    v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = v98;
    v52(v55 + v50, v110, v53);
    v52(v55 + v50 + v49, v109, v53);
    v118 = (_QWORD *)v55;
    sub_1B0EF30B0();
    v56 = v102;
    sub_1B0EF30BC();
    v57 = sub_1B0EECFF4(0, &qword_1EEEDA1D8);
    *(_QWORD *)&v105 = v52;
    v52((unint64_t)v104, v56, v53);
    *(_QWORD *)&v98 = v54;
    a2 = v57;
    v58 = (void *)sub_1B0EF31E8();
    _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0((int64_t)v58, v106, 0.0);
    v23 = v59;

    v115 = MEMORY[0x1E0DEE9D8];
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      v60 = sub_1B0EF32C0();
    }
    else
    {
      v60 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    a1 = MEMORY[0x1E0DEE9D8];
    if (v60)
    {
      v96 = v57;
      v61 = 0;
      while (1)
      {
        if ((v23 & 0xC000000000000001) != 0)
        {
          v62 = (char *)MEMORY[0x1B5E119A8](v61, v23);
        }
        else
        {
          if (v61 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_67;
          v62 = (char *)*(id *)(v23 + 8 * v61 + 32);
        }
        v63 = v62;
        a1 = v61 + 1;
        if (__OFADD__(v61, 1))
          break;
        v64 = (Swift::Int *)&v62[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
        swift_beginAccess();
        UITypeClickability.init(rawValue:)(*v64);
        if (v117 == 17)
          goto LABEL_78;
        if (sub_1B0EE2104(v117, (uint64_t)v114))
        {

        }
        else
        {
          a2 = (unint64_t)&v115;
          sub_1B0EF3248();
          sub_1B0EF326C();
          sub_1B0EF3278();
          sub_1B0EF3254();
        }
        ++v61;
        if (a1 == v60)
        {
          v65 = v115;
          v57 = v96;
          a1 = MEMORY[0x1E0DEE9D8];
          goto LABEL_39;
        }
      }
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    v65 = MEMORY[0x1E0DEE9D8];
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v66 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v65, a3);
    swift_release();
    v67 = *(void (**)(char *, uint64_t))(v103 + 8);
    v68 = v111;
    v67(v102, v111);
    swift_bridgeObjectRelease();
    v69 = v99;
    sub_1B0EF30BC();
    ((void (*)(char *, char *, uint64_t))v105)(v104, v69, v68);
    a2 = v57;
    v70 = (void *)sub_1B0EF31E8();
    _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0((int64_t)v70, v106, 0.0);
    v72 = v71;

    v117 = a1;
    if (v72 >> 62)
    {
      swift_bridgeObjectRetain();
      a1 = sub_1B0EF32C0();
    }
    else
    {
      a1 = *(_QWORD *)((v72 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v73 = MEMORY[0x1E0DEE9D8];
    if (!a1)
      break;
    *(_QWORD *)&v105 = v66;
    v114 = v67;
    v74 = 0;
    v23 = v72 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if ((v72 & 0xC000000000000001) != 0)
      {
        v75 = (char *)MEMORY[0x1B5E119A8](v74, v72);
      }
      else
      {
        if (v74 >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_69;
        v75 = (char *)*(id *)(v72 + 8 * v74 + 32);
      }
      v76 = v75;
      v77 = v74 + 1;
      if (__OFADD__(v74, 1))
        break;
      v78 = (Swift::Int *)&v75[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      UITypeClickability.init(rawValue:)(*v78);
      if (v116 == 17)
        goto LABEL_79;
      if (sub_1B0EE2104(v116, v113))
      {

      }
      else
      {
        a2 = (unint64_t)&v117;
        sub_1B0EF3248();
        sub_1B0EF326C();
        sub_1B0EF3278();
        sub_1B0EF3254();
      }
      ++v74;
      if (v77 == a1)
      {
        v79 = v117;
        v67 = v114;
        v66 = v105;
        v73 = MEMORY[0x1E0DEE9D8];
        goto LABEL_55;
      }
    }
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    swift_bridgeObjectRetain();
    v25 = sub_1B0EF32C0();
  }
  v79 = MEMORY[0x1E0DEE9D8];
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v80 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v79, a3);
  swift_release();
  v67(v99, v111);
  swift_release();
  swift_bridgeObjectRelease();
  v117 = v66;
  sub_1B0EE698C(v80);
  v81 = v117;
  v117 = v73;
  if (!(v81 >> 62))
  {
    v82 = *(_QWORD *)((v81 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v82)
      goto LABEL_57;
LABEL_74:
    swift_bridgeObjectRelease();
    v91 = MEMORY[0x1E0DEE9D8];
LABEL_75:
    v92 = *(void (**)(char *, uint64_t))(v97 + 8);
    v93 = v112;
    v92(v107, v112);
    v92(v100, v93);
    v94 = v111;
    v67(v110, v111);
    v67(v109, v94);
    v67(v108, v94);
    v92(v101, v93);
    return v91;
  }
  swift_bridgeObjectRetain();
  v82 = sub_1B0EF32C0();
  swift_bridgeObjectRelease();
  if (!v82)
    goto LABEL_74;
LABEL_57:
  if (v82 >= 1)
  {
    v83 = v67;
    v84 = 0;
    do
    {
      if ((v81 & 0xC000000000000001) != 0)
        v85 = (id)MEMORY[0x1B5E119A8](v84, v81);
      else
        v85 = *(id *)(v81 + 8 * v84 + 32);
      v86 = v85;
      v87 = objc_allocWithZone((Class)type metadata accessor for AXMClickabilityDetectorResult());
      v88 = v86;
      v89 = (void *)sub_1B0EEA648((uint64_t)v88);

      v90 = v89;
      MEMORY[0x1B5E118D0]();
      if (*(_QWORD *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B0EF3188();
      ++v84;
      sub_1B0EF31A0();
      sub_1B0EF317C();

    }
    while (v82 != v84);
    swift_bridgeObjectRelease();
    v91 = v117;
    v67 = v83;
    goto LABEL_75;
  }
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

unint64_t sub_1B0EEB508()
{
  unint64_t result;

  result = qword_1EEEDAD90;
  if (!qword_1EEEDAD90)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00F7C, &type metadata for AXBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDAD90);
  }
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1B0EED164(a1, &qword_1EEEDA168);
}

uint64_t sub_1B0EEB560(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1B5E12DAC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B0EEB5A0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEEDA050);
    v8 = a2;
    result = MEMORY[0x1B5E12DAC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B0EEB600(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEEDA070);
    v10 = sub_1B0EED02C(a2, &qword_1EEEDA060, a3);
    result = MEMORY[0x1B5E12DAC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for AXMElementDetectorResult()
{
  return objc_opt_self();
}

unint64_t sub_1B0EEB6A4()
{
  unint64_t result;

  result = qword_1EEEDAD98;
  if (!qword_1EEEDAD98)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00F2C, &type metadata for AXMElementDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDAD98);
  }
  return result;
}

uint64_t type metadata accessor for AXMClickabilityDetectorResult()
{
  return objc_opt_self();
}

unint64_t sub_1B0EEB708()
{
  unint64_t result;

  result = qword_1EEEDADA0[0];
  if (!qword_1EEEDADA0[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00EDC, &type metadata for AXMClickabilityDetectorResult.CodingKeys);
    atomic_store(result, qword_1EEEDADA0);
  }
  return result;
}

uint64_t sub_1B0EEB74C()
{
  return sub_1B0EEB560(&qword_1EEEDA128, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
}

unint64_t sub_1B0EEB77C()
{
  unint64_t result;

  result = qword_1EEEDA130;
  if (!qword_1EEEDA130)
  {
    result = MEMORY[0x1B5E12DAC](&protocol conformance descriptor for UIType, &type metadata for UIType);
    atomic_store(result, (unint64_t *)&qword_1EEEDA130);
  }
  return result;
}

uint64_t sub_1B0EEB7C0()
{
  return sub_1B0EED02C(&qword_1EEEDA138, &qword_1EEEDA140, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_1B0EEB7F0()
{
  unint64_t result;

  result = qword_1EEEDA148;
  if (!qword_1EEEDA148)
  {
    result = MEMORY[0x1B5E12DAC](&protocol conformance descriptor for UITypeClickability, &type metadata for UITypeClickability);
    atomic_store(result, (unint64_t *)&qword_1EEEDA148);
  }
  return result;
}

uint64_t sub_1B0EEB834()
{
  return sub_1B0EED02C(&qword_1EEEDA150, &qword_1EEEDA158, MEMORY[0x1E0DEAF50]);
}

uint64_t sub_1B0EEB860()
{
  return MEMORY[0x1E0DEA528];
}

unint64_t sub_1B0EEB870()
{
  unint64_t result;

  result = qword_1EEEDA160;
  if (!qword_1EEEDA160)
  {
    result = MEMORY[0x1B5E12DAC](&protocol conformance descriptor for AXModelType, &type metadata for AXModelType);
    atomic_store(result, (unint64_t *)&qword_1EEEDA160);
  }
  return result;
}

uint64_t sub_1B0EEB8B4()
{
  return type metadata accessor for AXBoundingBox();
}

uint64_t sub_1B0EEB8BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B0EF30A4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AXBoundingBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AXBoundingBox.id.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXBoundingBox.id.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXBoundingBox.id.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXBoundingBox.center.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXBoundingBox.center.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXBoundingBox.center.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXBoundingBox.size.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXBoundingBox.size.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXBoundingBox.size.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of AXBoundingBox.depth.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of AXBoundingBox.depth.setter(unint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(unint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1B0))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of AXBoundingBox.depth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.setter(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x1C8))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x1F8))(a1, a2 & 1);
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of AXBoundingBox.iou(other:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of AXBoundingBox.scale(xScale:yScale:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of AXBoundingBox.flipXY()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of AXBoundingBox.makeSquare()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of AXBoundingBox.transformed(by:)(_OWORD *a1)
{
  _QWORD *v1;
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  _OWORD v5[3];

  v2 = *(uint64_t (**)(_OWORD *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x228);
  v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  return v2(v5);
}

uint64_t dispatch thunk of AXBoundingBox.lerp(to:amount:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of static AXBoundingBox.postCompute(decoded:nmsThreshold:filterThresholds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 568))();
}

uint64_t dispatch thunk of static AXBoundingBox.postComputeClickability(decoded:nmsThreshold:filterThresholds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of AXBoundingBox.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of AXBoundingBox.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 592))();
}

uint64_t getEnumTagSinglePayload for UIType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UIType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_1B0EEC0B0 + 4 * byte_1B0F006C5[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_1B0EEC0E4 + 4 * byte_1B0F006C0[v4]))();
}

uint64_t sub_1B0EEC0E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC0EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0EEC0F4);
  return result;
}

uint64_t sub_1B0EEC100(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0EEC108);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_1B0EEC10C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC114(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIType()
{
  return &type metadata for UIType;
}

uint64_t getEnumTagSinglePayload for UITypeClickability(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UITypeClickability(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_1B0EEC210 + 4 * byte_1B0F006CF[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_1B0EEC244 + 4 * byte_1B0F006CA[v4]))();
}

uint64_t sub_1B0EEC244(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC24C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0EEC254);
  return result;
}

uint64_t sub_1B0EEC260(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0EEC268);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_1B0EEC26C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC274(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UITypeClickability()
{
  return &type metadata for UITypeClickability;
}

uint64_t method lookup function for AXMElementDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXMElementDetectorResult.__allocating_init(boundingBox:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultLabel()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultLabelName()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultConfidence()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t method lookup function for AXMClickabilityDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t _s16AXMediaUtilities24AXMElementDetectorResultC9resultBoxSo6CGRectVyFTj_0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

ValueMetadata *type metadata accessor for AXModelType()
{
  return &type metadata for AXModelType;
}

ValueMetadata *type metadata accessor for AXMClickabilityDetectorResult.CodingKeys()
{
  return &type metadata for AXMClickabilityDetectorResult.CodingKeys;
}

uint64_t _s16AXMediaUtilities29AXMClickabilityDetectorResultC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16AXMediaUtilities29AXMClickabilityDetectorResultC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0EEC470 + 4 * byte_1B0F006D9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B0EEC4A4 + 4 * byte_1B0F006D4[v4]))();
}

uint64_t sub_1B0EEC4A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC4AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0EEC4B4);
  return result;
}

uint64_t sub_1B0EEC4C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0EEC4C8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B0EEC4CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC4D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AXMElementDetectorResult.CodingKeys()
{
  return &type metadata for AXMElementDetectorResult.CodingKeys;
}

uint64_t sub_1B0EEC4F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B0EEC520(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B0EEC540(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AXBoundingBox.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AXBoundingBox.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0EEC648 + 4 * byte_1B0F006E3[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1B0EEC67C + 4 * byte_1B0F006DE[v4]))();
}

uint64_t sub_1B0EEC67C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC684(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0EEC68CLL);
  return result;
}

uint64_t sub_1B0EEC698(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0EEC6A0);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1B0EEC6A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC6AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0EEC6B8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B0EEC6C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXBoundingBox.CodingKeys()
{
  return &type metadata for AXBoundingBox.CodingKeys;
}

unint64_t sub_1B0EEC6DC()
{
  unint64_t result;

  result = qword_1EEEDB8B0[0];
  if (!qword_1EEEDB8B0[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00D44, &type metadata for AXBoundingBox.CodingKeys);
    atomic_store(result, qword_1EEEDB8B0);
  }
  return result;
}

unint64_t sub_1B0EEC724()
{
  unint64_t result;

  result = qword_1EEEDBAC0[0];
  if (!qword_1EEEDBAC0[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00DFC, &type metadata for AXMElementDetectorResult.CodingKeys);
    atomic_store(result, qword_1EEEDBAC0);
  }
  return result;
}

unint64_t sub_1B0EEC76C()
{
  unint64_t result;

  result = qword_1EEEDBCD0[0];
  if (!qword_1EEEDBCD0[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00EB4, &type metadata for AXMClickabilityDetectorResult.CodingKeys);
    atomic_store(result, qword_1EEEDBCD0);
  }
  return result;
}

unint64_t sub_1B0EEC7B4()
{
  unint64_t result;

  result = qword_1EEEDBDE0;
  if (!qword_1EEEDBDE0)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00E24, &type metadata for AXMClickabilityDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDBDE0);
  }
  return result;
}

unint64_t sub_1B0EEC7FC()
{
  unint64_t result;

  result = qword_1EEEDBDE8[0];
  if (!qword_1EEEDBDE8[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00E4C, &type metadata for AXMClickabilityDetectorResult.CodingKeys);
    atomic_store(result, qword_1EEEDBDE8);
  }
  return result;
}

unint64_t sub_1B0EEC844()
{
  unint64_t result;

  result = qword_1EEEDBE70;
  if (!qword_1EEEDBE70)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00D6C, &type metadata for AXMElementDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDBE70);
  }
  return result;
}

unint64_t sub_1B0EEC88C()
{
  unint64_t result;

  result = qword_1EEEDBE78;
  if (!qword_1EEEDBE78)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00D94, &type metadata for AXMElementDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDBE78);
  }
  return result;
}

unint64_t sub_1B0EEC8D4()
{
  unint64_t result;

  result = qword_1EEEDBF00;
  if (!qword_1EEEDBF00)
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00CB4, &type metadata for AXBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEEDBF00);
  }
  return result;
}

unint64_t sub_1B0EEC91C()
{
  unint64_t result;

  result = qword_1EEEDBF08[0];
  if (!qword_1EEEDBF08[0])
  {
    result = MEMORY[0x1B5E12DAC](&unk_1B0F00CDC, &type metadata for AXBoundingBox.CodingKeys);
    atomic_store(result, qword_1EEEDBF08);
  }
  return result;
}

uint64_t sub_1B0EEC960(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1952540008 && a2 == 0xE400000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C676E61 && a2 == 0xE500000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1952671090 && a2 == 0xE400000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x646E497373616C63 && a2 == 0xEA00000000007865 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C43794274616568 && a2 == 0xEB00000000737361 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6565537473726966 && a2 == 0xE90000000000006ELL || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6565537473616CLL && a2 == 0xE800000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6874706564 && a2 == 0xE500000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x64696F72746E6563 && a2 == 0xEA00000000006433 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001B0F10D30 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C61636973796870 && a2 == 0xEC000000657A6953)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_1B0EF33BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_1B0EECE3C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D614E6C6562616CLL && a2 == 0xE900000000000065 || (sub_1B0EF33BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1B0EF33BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_1B0EECFF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B0EED02C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5E12DAC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B0EED06C()
{
  unint64_t result;

  result = qword_1EEEDA200;
  if (!qword_1EEEDA200)
  {
    result = MEMORY[0x1B5E12DAC](&protocol conformance descriptor for UITypeClickability, &type metadata for UITypeClickability);
    atomic_store(result, (unint64_t *)&qword_1EEEDA200);
  }
  return result;
}

unint64_t sub_1B0EED0B0()
{
  unint64_t result;

  result = qword_1EEEDA220;
  if (!qword_1EEEDA220)
  {
    result = MEMORY[0x1B5E12DAC](&protocol conformance descriptor for UIType, &type metadata for UIType);
    atomic_store(result, (unint64_t *)&qword_1EEEDA220);
  }
  return result;
}

uint64_t sub_1B0EED0F4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B0EED114(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1B0EED164(a1, &qword_1EEEDA258);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1B0EED164(a1, (unint64_t *)&unk_1EEEDA260);
}

void sub_1B0EED164(uint64_t a1, unint64_t *a2)
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

uint64_t dispatch thunk of AXMClickabilityDetectorResult.__allocating_init(from:)()
{
  return dispatch thunk of AXMElementDetectorResult.__allocating_init(from:)();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.encode(to:)()
{
  return dispatch thunk of AXMElementDetectorResult.encode(to:)();
}

uint64_t __getRPScreenRecorderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:].cold.1(v0);
}

uint64_t __getVNDetectHorizonRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMVisionFeatureColorInfo setMainColors:weights:].cold.1(v0);
}

uint64_t __getVNDetectFaceExpressionsRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNCreateFaceprintRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCreateFaceprintRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNDetectFacePoseRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFacePoseRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMImageAestheticsNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNClassifyImageAestheticsRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __27__AXMService_xpcConnection__block_invoke_63_cold_1(v0);
}

uint64_t __getMLModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNCoreMLModelClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCoreMLModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNClassificationObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNClassificationObservationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNCoreMLRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCoreMLRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNImageScoreObservationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNImageBrightnessObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBrightnessObservationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNImageBlurObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBlurObservationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNImageBlurScoreRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBlurScoreRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMMobileAssetEvaluationNode mlModelClasses].cold.1(v0);
}

uint64_t __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMindNetNetwork processVImage:inputIsBGR:].cold.1(v0);
}

uint64_t ___ZL15getUIImageClassv_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMCameraFrameContext motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:].cold.1(v0);
}

uint64_t __getVNRecognizeTextRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMTaskDispatcher _queue_processNextTask].cold.1(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getPHAssetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHImageManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHImageRequestOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageRequestOptionsClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMRectangleDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNDetectRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMSpeechComponent handleRequest:completion:].cold.1(v0);
}

uint64_t __getPFSceneTaxonomyClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMNSFWDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:].cold.1(v0);
}

uint64_t __getVNSequenceRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[AXMObjectDetectorNode possibleObjectClassifications].cold.1(v0);
}

uint64_t __getVNRecognizeObjectsRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMAXElementDetectorNode _initializeClickabilityModel].cold.1(v0);
}

uint64_t __getVNDetectContoursRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMImageRegistrationNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNTranslationalImageRegistrationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.1(v0);
}

uint64_t __getVNCreateSceneprintRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:].cold.1(v0);
}

uint64_t __getMADVIDocumentRecognitionResultClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMDataSonifier renderSonification].cold.1(v0);
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "AX: EXPORT: 2 Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "AX: EXPORT: 1 Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "AX: EXPORT: 3 Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void UIAccessibilityMetadataDescriptionForImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error retrieving caption: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void UIAccessibilityAddMetadataDescriptionToImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error setting caption: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __getUIScreenClass_block_invoke_cold_1()
{
  uint8_t *v0;
  int v1;
  os_log_t v2;

  v0 = (uint8_t *)abort_report_np();
  return -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:].cold.1(v0, v1, v2);
}

uint64_t __getMADVISceneClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADVISceneClassificationResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVISceneClassificationResultClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMProminentObjectsDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v0);
}

uint64_t __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:].cold.1(v0);
}

uint64_t __getVNRecognizedTextClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return -[AXMVisionFaceNameHelper photoLibraryWithURL:].cold.1(v0, v1, v2);
}

uint64_t __getVCPMediaAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHPhotoLibraryClass_block_invoke_cold_1_0(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHPersonClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPersonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMVisionFeatureFaceLandmarks encodeWithCoder:].cold.1(v0);
}

uint64_t __getVNFaceLandmarks2DClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __27__AXMOutputManager_disable__block_invoke_cold_1(v0);
}

uint64_t __getVCPMediaAnalysisServiceClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getMADImageCaptionRequestClass_block_invoke_cold_1();
}

uint64_t __getMADImageCaptionRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADCaptionResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADCaptionResultClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:].cold.1(v0);
}

uint64_t __getMADVIFaceRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADVIFaceResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVIFaceResultClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(v0);
}

uint64_t __getVNSceneClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMSoundComponent transitionToState:completion:].cold.1(v0);
}

uint64_t __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return AXMWorkingDirectory_cold_1(v0, v1, v2);
}

void AXMWorkingDirectory_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Failed to create AXMediaUtilities working directory at path: %@. error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Unable to create security task for checking entitlement %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Unable to get entitlements for client task. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B0EF3098()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B0EF30A4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B0EF30B0()
{
  return MEMORY[0x1E0C9E680]();
}

uint64_t sub_1B0EF30BC()
{
  return MEMORY[0x1E0C9E6B8]();
}

uint64_t sub_1B0EF30C8()
{
  return MEMORY[0x1E0C9E740]();
}

uint64_t sub_1B0EF30D4()
{
  return MEMORY[0x1E0C9E760]();
}

uint64_t sub_1B0EF30E0()
{
  return MEMORY[0x1E0DE9E28]();
}

uint64_t sub_1B0EF30EC()
{
  return MEMORY[0x1E0DEA108]();
}

uint64_t sub_1B0EF30F8()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1B0EF3104()
{
  return MEMORY[0x1E0DEA4B0]();
}

uint64_t sub_1B0EF3110()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B0EF311C()
{
  return MEMORY[0x1E0CB19B0]();
}

uint64_t sub_1B0EF3128()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B0EF3134()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B0EF3140()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1B0EF314C()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1B0EF3158()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B0EF3164()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B0EF3170()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B0EF317C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B0EF3188()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B0EF3194()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B0EF31A0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B0EF31AC()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B0EF31B8()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1B0EF31C4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B0EF31D0()
{
  return MEMORY[0x1E0CB1C00]();
}

uint64_t sub_1B0EF31DC()
{
  return MEMORY[0x1E0DEB498]();
}

uint64_t sub_1B0EF31E8()
{
  return MEMORY[0x1E0C9E7E0]();
}

uint64_t sub_1B0EF31F4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B0EF3200()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B0EF320C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B0EF3218()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B0EF3224()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_1B0EF3230()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B0EF323C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B0EF3248()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B0EF3254()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B0EF3260()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B0EF326C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B0EF3278()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B0EF3284()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B0EF3290()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B0EF329C()
{
  return MEMORY[0x1E0DECC10]();
}

uint64_t sub_1B0EF32A8()
{
  return MEMORY[0x1E0DECC18]();
}

uint64_t sub_1B0EF32B4()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_1B0EF32C0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B0EF32CC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B0EF32D8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B0EF32E4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B0EF32F0()
{
  return MEMORY[0x1E0DECF70]();
}

uint64_t sub_1B0EF32FC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1B0EF3308()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B0EF3314()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1B0EF3320()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1B0EF332C()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1B0EF3338()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B0EF3344()
{
  return MEMORY[0x1E0DED0A8]();
}

uint64_t sub_1B0EF3350()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1B0EF335C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B0EF3368()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1B0EF3374()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1B0EF3380()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1B0EF338C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B0EF3398()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1B0EF33A4()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B0EF33B0()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1B0EF33BC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B0EF33C8()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1B0EF33D4()
{
  return MEMORY[0x1E0DEDA10]();
}

uint64_t sub_1B0EF33E0()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1B0EF33EC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B0EF33F8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B0EF3404()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B0EF3410()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B0EF341C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B0EF3428()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B0EF3434()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B0EF3440()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B0EF344C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x1E0DDD460]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0CF30C8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1E0CF3100]();
}

uint64_t AXLogAssetLoader()
{
  return MEMORY[0x1E0CF31C8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogDisplay()
{
  return MEMORY[0x1E0CF3200]();
}

uint64_t AXMediaLogCaptionDescriptions()
{
  return MEMORY[0x1E0CF3338]();
}

uint64_t AXMediaLogCommon()
{
  return MEMORY[0x1E0CF3340]();
}

uint64_t AXMediaLogDiagnostics()
{
  return MEMORY[0x1E0CF3348]();
}

uint64_t AXMediaLogElementVision()
{
  return MEMORY[0x1E0CF3350]();
}

uint64_t AXMediaLogEngineCache()
{
  return MEMORY[0x1E0CF3358]();
}

uint64_t AXMediaLogEnginePriority()
{
  return MEMORY[0x1E0CF3360]();
}

uint64_t AXMediaLogHaptics()
{
  return MEMORY[0x1E0CF3368]();
}

uint64_t AXMediaLogLanguageTranslation()
{
  return MEMORY[0x1E0CF3370]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1E0CF3378]();
}

uint64_t AXMediaLogOCR()
{
  return MEMORY[0x1E0CF3380]();
}

uint64_t AXMediaLogOutput()
{
  return MEMORY[0x1E0CF3388]();
}

uint64_t AXMediaLogResults()
{
  return MEMORY[0x1E0CF3390]();
}

uint64_t AXMediaLogScreenGrab()
{
  return MEMORY[0x1E0CF3398]();
}

uint64_t AXMediaLogService()
{
  return MEMORY[0x1E0CF33A0]();
}

uint64_t AXMediaLogSettings()
{
  return MEMORY[0x1E0CF33A8]();
}

uint64_t AXMediaLogSounds()
{
  return MEMORY[0x1E0CF33B0]();
}

uint64_t AXMediaLogSpeech()
{
  return MEMORY[0x1E0CF33B8]();
}

uint64_t AXMediaLogTextLayout()
{
  return MEMORY[0x1E0CF33C0]();
}

uint64_t AXMediaLogTextProcessing()
{
  return MEMORY[0x1E0CF33C8]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x1E0CF3488]();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return MEMORY[0x1E0CF3498]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1E0CF38E8]();
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x1E0C92218](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1E0CD25E0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB0](red, green, blue, alpha);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x1E0C9C398](c, allowsAntialiasing);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x1E0C9C4F8](c, components);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C610](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CB88](image);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC320](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

BOOL CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadataRef metadata, CFStringRef dictionaryName, CFStringRef propertyName, CFTypeRef value)
{
  return MEMORY[0x1E0CBC420](metadata, dictionaryName, propertyName, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9D520](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1E0D435C8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1E0D43600]();
}

uint64_t LXEntryGetPartialProbability()
{
  return MEMORY[0x1E0D43608]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1E0D43618]();
}

uint64_t LXEntryGetUsageCount()
{
  return MEMORY[0x1E0D43630]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1E0D43690]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1E0D436B8]();
}

CFStringRef MAImageCaptioningCopyCaption(CFURLRef url, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CC1C78](url, error);
}

BOOL MAImageCaptioningSetCaption(CFURLRef url, CFStringRef string, CFErrorRef *error)
{
  return MEMORY[0x1E0CC1C80](url, string, error);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1E0CA5970](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1E0CECCD8](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x1E0CECCE8](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t _AXSystemRootDirectory()
{
  return MEMORY[0x1E0DDDF18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E625AB88(__p);
}

uint64_t operator delete()
{
  return off_1E625AB90();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E625AB98(__sz);
}

uint64_t operator new()
{
  return off_1E625ABA0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD18]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD28]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x1E0D1FFF0]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1E0D20010]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1E0D20060]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C258](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C270](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C378](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E8](__A, __IA, __B, __C, __IC, __N);
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBD8](dest, color, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC00](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_InitWithCVPixelBuffer(vImage_Buffer *buffer, vImage_CGImageFormat *desiredFormat, CVPixelBufferRef cvPixelBuffer, vImageCVImageFormatRef cvImageFormat, const CGFloat *backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC30](buffer, desiredFormat, cvPixelBuffer, cvImageFormat, backgroundColor, *(_QWORD *)&flags);
}

vImageCVImageFormatRef vImageCVImageFormat_Create(uint32_t imageFormatType, const vImage_ARGBToYpCbCrMatrix *matrix, CFStringRef cvImageBufferChromaLocation, CGColorSpaceRef baseColorspace, int alphaIsOneHint)
{
  return (vImageCVImageFormatRef)MEMORY[0x1E0C8CC88](*(_QWORD *)&imageFormatType, matrix, cvImageBufferChromaLocation, baseColorspace, *(_QWORD *)&alphaIsOneHint);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D658](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D6E8](src, dest, tempBuffer, *(_QWORD *)&flags);
}

