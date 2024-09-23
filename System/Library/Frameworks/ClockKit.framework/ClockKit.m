uint64_t CLKInternalBuild()
{
  if (CLKInternalBuild_onceToken != -1)
    dispatch_once(&CLKInternalBuild_onceToken, &__block_literal_global_158);
  return CLKInternalBuild_internal;
}

BOOL CLKRunningInProcess(uint64_t a1)
{
  if ((a1 & 0x40) != 0)
  {
    if (CLKIsBridge_onceToken != -1)
      dispatch_once(&CLKIsBridge_onceToken, &__block_literal_global_18);
    if (CLKIsBridge___result)
      return 1;
  }
  if ((a1 & 0x100) != 0)
  {
    if (CLKIsCreateWatchFace_onceToken != -1)
      dispatch_once(&CLKIsCreateWatchFace_onceToken, &__block_literal_global_21);
    if (CLKIsCreateWatchFace___result)
      return 1;
  }
  if ((a1 & 0x1000) != 0)
  {
    if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken != -1)
      dispatch_once(&CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken, &__block_literal_global_24);
    if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result)
      return 1;
  }
  if ((a1 & 0x200) != 0)
  {
    if (CLKIsNTKCLITool_onceToken != -1)
      dispatch_once(&CLKIsNTKCLITool_onceToken, &__block_literal_global_28);
    if (CLKIsNTKCLITool___result)
      return 1;
  }
  if ((a1 & 0x400) != 0)
  {
    if (CLKIsNTKXCTests_onceToken != -1)
      dispatch_once(&CLKIsNTKXCTests_onceToken, &__block_literal_global_31);
    if (CLKIsNTKXCTests___result)
      return 1;
  }
  if ((a1 & 0x800) != 0)
  {
    if (CLKIsGreenfieldTool_onceToken != -1)
      dispatch_once(&CLKIsGreenfieldTool_onceToken, &__block_literal_global_36);
    if (CLKIsGreenfieldTool___result)
      return 1;
  }
  if ((a1 & 4) != 0)
  {
    if (CLKIsUVPreviewApp_onceToken != -1)
      dispatch_once(&CLKIsUVPreviewApp_onceToken, &__block_literal_global_47);
    if (CLKIsUVPreviewApp___isUVPreview)
      return 1;
  }
  if ((a1 & 2) != 0)
  {
    if (CLKIsFaceSnapshotService_onceToken != -1)
      dispatch_once(&CLKIsFaceSnapshotService_onceToken, &__block_literal_global_42);
    if (CLKIsFaceSnapshotService___isFaceSnapshotService)
      return 1;
  }
  if ((a1 & 1) == 0)
    return a1 == 0;
  if (CLKIsNTKDaemon_onceToken != -1)
    dispatch_once(&CLKIsNTKDaemon_onceToken, &__block_literal_global_39);
  return CLKIsNTKDaemon___isDaemon || a1 == 0;
}

void sub_2114F6EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Block_object_dispose(&a9, 8);
  _Block_object_dispose(&a13, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), "UTF8String");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_1_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2114F7640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2114F8580(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CLKLoggingObjectForDomain(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (CLKLoggingObjectForDomain_onceToken != -1)
    dispatch_once(&CLKLoggingObjectForDomain_onceToken, &__block_literal_global_9);
  v2 = (void *)CLKLoggingObjectForDomain___logObjects;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t CLKIsClockFaceApp()
{
  if (CLKIsClockFaceApp_onceToken != -1)
    dispatch_once(&CLKIsClockFaceApp_onceToken, &__block_literal_global_14);
  return CLKIsClockFaceApp___isClockFaceApp;
}

uint64_t CLKIsBridge()
{
  if (CLKIsBridge_onceToken != -1)
    dispatch_once(&CLKIsBridge_onceToken, &__block_literal_global_18);
  return CLKIsBridge___result;
}

id CLKComplicationServerInterface()
{
  if (CLKComplicationServerInterface_onceToken != -1)
    dispatch_once(&CLKComplicationServerInterface_onceToken, &__block_literal_global);
  return (id)CLKComplicationServerInterface_interface;
}

id CLKComplicationClientInterface()
{
  if (CLKComplicationClientInterface_onceToken != -1)
    dispatch_once(&CLKComplicationClientInterface_onceToken, &__block_literal_global_53);
  return (id)CLKComplicationClientInterface_interface;
}

id CLKDateHandlerAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKDateHandlerAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF8F78;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationPrivacyBehaviorAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationPrivacyBehaviorAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF8FA0;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationTemplateAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTemplateAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF8FC8;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationTimeTravelDirectionsAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimeTravelDirectionsAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF8FA0;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationTimelineAnimationBehaviorBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineAnimationBehaviorBlock_block_invoke;
  v15[3] = &unk_24CBF8FA0;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationTimelineEntryAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineEntryAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF8FF0;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationTimelineEntryArrayAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineEntryArrayAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF9018;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

id CLKComplicationWidgetMigrationConfigurationAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CLKAssertionBlockSentinel *v10;
  id v11;
  CLKAssertionBlockSentinel *v12;
  void *v13;
  _QWORD v15[4];
  CLKAssertionBlockSentinel *v16;
  id v17;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  -[CLKAssertionBlockSentinel setMessage:](v10, "setMessage:", v8);

  -[CLKAssertionBlockSentinel setFatal:](v10, "setFatal:", a3);
  -[CLKAssertionBlockSentinel setFallbackBlock:](v10, "setFallbackBlock:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationWidgetMigrationConfigurationAssertionBlock_block_invoke;
  v15[3] = &unk_24CBF9040;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2114FBA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2114FC924(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2114FD19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_2114FE290(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2114FE614(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2114FEBC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
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

void sub_2114FF844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_2114FFF0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2115008F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a72;
  uint64_t v72;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose((const void *)(v72 - 216), 8);
  _Block_object_dispose((const void *)(v72 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_211501240(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_211503198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(exception_object);
    CLKLoggingObjectForDomain(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "reason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLKComplicationTemplate complicationTemplateWithJSONObjectRepresentation:bundle:purpose:].cold.1(v14, v11 - 128, v13);
    }

    objc_end_catch();
    JUMPOUT(0x211502E5CLL);
  }
  _Unwind_Resume(exception_object);
}

void _SquareImageSizeScaled(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, double a6)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a1;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setRoundingBehavior:", a2);
  if (a5)
  {
    if (v16)
      objc_msgSend(v13, "scaledValue:withOverrides:", a6);
    else
      objc_msgSend(v13, "scaledValue:", a6);
    *a5 = v14;
    a5[1] = v14;
  }
  if (a4)
  {
    if (!a3)
      objc_msgSend(v13, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
    if (v16)
      objc_msgSend(v13, "scaledValue:withOverrides:", a6);
    else
      objc_msgSend(v13, "scaledValue:", a6);
    *a4 = v15;
    a4[1] = v15;
  }

}

void _ModularLargeImageSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v7, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    *(double *)a3 = ___ModularLargeImageSize_block_invoke(v8, v12);
    *(_QWORD *)(a3 + 8) = v9;
  }
  if (a2)
  {
    v10 = v12;
    if (!a1)
    {
      v8 = objc_msgSend(v12, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
      v10 = v12;
    }
    *(double *)a2 = ___ModularLargeImageSize_block_invoke(v8, v10);
    *(_QWORD *)(a2 + 8) = v11;
  }

}

void _UtilitarianFlatImageSizeForDevice(void *a1, uint64_t a2, _OWORD *a3, _OWORD *a4)
{
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_UtilitarianFlatImageSizeForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&_UtilitarianFlatImageSizeForDevice___cachedDevice);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&_UtilitarianFlatImageSizeForDevice___cachedDevice);
    if (v9 == obj)
    {
      v10 = objc_msgSend(obj, "version");
      v11 = _UtilitarianFlatImageSizeForDevice___previousCLKDeviceVersion;

      if (v10 == v11)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v12 = objc_storeWeak(&_UtilitarianFlatImageSizeForDevice___cachedDevice, obj);
  _UtilitarianFlatImageSizeForDevice___previousCLKDeviceVersion = objc_msgSend(obj, "version");

  ___UtilitarianFlatImageSizeForDevice_block_invoke(v13, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_UtilitarianFlatImageSizeForDevice___lock);
  if (a4)
    *a4 = xmmword_254AB8468;
  if (a3)
    *a3 = *(_OWORD *)&_UtilitarianFlatImageSizeForDevice__imageSize[2 * a2];

}

void sub_2115123B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  id WeakRetained;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  os_unfair_lock_lock((os_unfair_lock_t)&CLKComplicationGraphicExtraLargeCircularScalingFactor___lock);
  WeakRetained = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v1 = WeakRetained;
  +[CLKDevice currentDevice](CLKDevice, "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
  if (v2 != v3)
  {

LABEL_5:
    +[CLKDevice currentDevice](CLKDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice, v7);

    v8 = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
    CLKComplicationGraphicExtraLargeCircularScalingFactor___previousCLKDeviceVersion = objc_msgSend(v8, "version");

    +[CLKDevice currentDevice](CLKDevice, "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __CLKComplicationGraphicExtraLargeCircularScalingFactor_block_invoke((uint64_t)v9, (uint64_t)v9);

    goto LABEL_6;
  }
  +[CLKDevice currentDevice](CLKDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "version");
  v6 = CLKComplicationGraphicExtraLargeCircularScalingFactor___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKComplicationGraphicExtraLargeCircularScalingFactor___lock);
  return *(double *)&CLKComplicationGraphicExtraLargeCircularScalingFactor_scalingFactor;
}

uint64_t ComplicationDisplayLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ComplicationDisplayLibraryCore_frameworkLibrary)
    ComplicationDisplayLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ComplicationDisplayLibraryCore_frameworkLibrary;
  if (!ComplicationDisplayLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_21151B00C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _GetNextSegment(void *a1, unint64_t a2, __CFString **a3, unint64_t *a4, _QWORD *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t NextSegment;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v22;
  uint64_t v23;
  unint64_t v24;
  __CFString *v25;

  v9 = a1;
  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("Ω-♨︎-Д-⚽︎-猫"));
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NextSegment = 0;
  }
  else
  {
    v13 = v10;
    v14 = v11;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCharactersToBeSkipped:", 0);
    v25 = &stru_24CBFCB28;
    objc_msgSend(v15, "scanUpToString:intoString:", CFSTR("Ω-♨︎-Д-⚽︎-猫"), &v25);
    v16 = v25;
    objc_msgSend(v15, "scanString:intoString:", CFSTR("Ω-♨︎-Д-⚽︎-猫"), 0);
    v24 = 0;
    if (objc_msgSend(v15, "scanInteger:", &v24)
      && (v24 & 0x8000000000000000) == 0
      && v24 < a2
      && objc_msgSend(v15, "scanString:intoString:", CFSTR("止"), 0))
    {
      *a4 = v24;
      v17 = objc_retainAutorelease(v16);
      *a3 = v17;
      *a5 = objc_msgSend(v15, "scanLocation");
      NextSegment = 1;
    }
    else
    {
      v18 = v13 + v14;
      v23 = 0;
      objc_msgSend(v9, "substringFromIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v16;
      NextSegment = _GetNextSegment(v19, a2, &v22, a4, &v23);
      v17 = v22;

      if ((_DWORD)NextSegment)
      {
        objc_msgSend(v9, "substringToIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", v17);
        *a3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

        *a5 = v23 + v18;
      }
    }

  }
  return NextSegment;
}

void sub_21151C7DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21151C858(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5(void *a1)
{
  return a1;
}

uint64_t _EnumerateCalendarUnitsBackwardWithBlock(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned __int8 v6;

  v3 = result;
  v6 = 0;
  v4 = 0x38u;
  do
  {
    if ((*(_QWORD *)((_BYTE *)&__allAllowedUnits + v4) & ~v3) != 0)
    {
      v5 = 0;
      if (!v4)
        return result;
    }
    else
    {
      result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      v5 = v6;
      if (!v4)
        return result;
    }
    v4 -= 8;
  }
  while (!v5);
  return result;
}

void sub_21151FFFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21152043C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _EnumerateCalendarUnitsWithBlock(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  unsigned __int8 v6;

  v3 = result;
  v4 = 0;
  v6 = 0;
  do
  {
    if ((__allAllowedUnits[v4] & ~v3) != 0)
    {
      v5 = 0;
    }
    else
    {
      result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      v5 = v6;
    }
    if (v4 > 6)
      break;
    ++v4;
  }
  while (!v5);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_2115243B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2115244A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2115252F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21152536C(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

double CLKValueForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5)
{
  switch(objc_msgSend(a1, "sizeClass"))
  {
    case 0:
      return a2;
    case 1:
      a2 = a3;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a4;
      break;
    default:
      a2 = a5;
      break;
  }
  return a2;
}

double CLKSizeForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  switch(objc_msgSend(a1, "sizeClass"))
  {
    case 0:
      return a2;
    case 1:
      a2 = a4;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a6;
      break;
    default:
      a2 = a8;
      break;
  }
  return a2;
}

double CLKPointForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  switch(objc_msgSend(a1, "sizeClass"))
  {
    case 0:
      return a2;
    case 1:
      a2 = a4;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a6;
      break;
    default:
      a2 = a8;
      break;
  }
  return a2;
}

uint64_t CLKValueForLuxoDeviceMetrics(void *a1)
{
  return objc_msgSend(a1, "sizeClass");
}

uint64_t CLKScaledValueWithCompactLuxoDeviceMetrics(void *a1)
{
  id v1;
  unint64_t v2;
  double v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "sizeClass");
  if (v2 > 7)
    goto LABEL_5;
  if (((1 << v2) & 0x96) == 0)
  {
    if (!v2)
    {
      v3 = 0.839506173;
      goto LABEL_6;
    }
LABEL_5:
    v3 = 1.13580247;
  }
LABEL_6:
  objc_msgSend(v1, "screenScale", v3);

  return UIRoundToScale();
}

uint64_t CLKRoundForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRoundToScale();
}

uint64_t CLKScaledPointWithCompactLuxoDeviceMetrics(void *a1)
{
  id v1;

  v1 = a1;
  CLKScaledValueWithCompactLuxoDeviceMetrics(v1);
  CLKScaledValueWithCompactLuxoDeviceMetrics(v1);
  objc_msgSend(v1, "screenScale");

  return UIPointRoundToScale();
}

uint64_t CLKPointRoundForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIPointRoundToScale();
}

uint64_t CLKSizeForLuxoDeviceMetrics(void *a1)
{
  return objc_msgSend(a1, "sizeClass");
}

uint64_t CLKPointForLuxoDeviceMetrics(void *a1)
{
  return objc_msgSend(a1, "sizeClass");
}

uint64_t CLKRectCenteredIntegralRectForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectCenteredIntegralRectScale();
}

uint64_t CLKRectCenteredXInRectForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectCenteredXInRectScale();
}

uint64_t CLKRectCenteredYInRectForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectCenteredYInRectScale();
}

uint64_t CLKRectCenteredAboutPointForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectCenteredAboutPointScale();
}

uint64_t CLKRectIntegralForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectIntegralWithScale();
}

uint64_t CLKFloorForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIFloorToScale();
}

uint64_t CLKCeilForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UICeilToScale();
}

uint64_t CLKSizeRoundForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UISizeRoundToScale();
}

BOOL CLKFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

BOOL CLKPointEqualsPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.00000011920929;
  return vabdd_f64(a2, a4) < 0.00000011920929 && v4;
}

BOOL CLKSizeEqualsSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.00000011920929;
  return vabdd_f64(a2, a4) < 0.00000011920929 && v4;
}

uint64_t CLKRectEqualsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v17;
  _BOOL4 v19;

  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5))
    return 1;
  v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 0.00000011920929 || v17 >= 0.00000011920929)
    return 0;
  v19 = vabdd_f64(a3, a7) < 0.00000011920929;
  return vabdd_f64(a4, a8) < 0.00000011920929 && v19;
}

BOOL CLKSizeIsEmpty(double a1, double a2)
{
  _BOOL4 v2;

  v2 = fabs(a1) < 0.00000011920929;
  return fabs(a2) < 0.00000011920929 && v2;
}

double CLKAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CLKReversePoint(double a1, double a2)
{
  return a2;
}

double CLKReverseSize(double a1, double a2)
{
  return a2;
}

double CLKReverseVector(double a1, double a2)
{
  return a2;
}

double CLKInterpolateBetweenFloatsClipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * fmin(fmax(a3, 0.0), 1.0);
}

double CLKInterpolateBetweenFloatsUnclipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

void CLKWrapRadians(long double a1)
{
  fmod(a1, 6.28318548);
}

double CLKInterpolateShortestPathBetweenAnglesUnclipped(double a1, double a2, double a3)
{
  double v5;

  v5 = fmod(a2 - a1 + 3.14159265, 6.28318531) + -3.14159265;
  if (v5 < -3.14159265)
    v5 = v5 + 6.28318531;
  return a1 + v5 * a3;
}

double CLKInterpolateShortestPathBetweenAnglesClipped(double a1, double a2, double a3)
{
  double v4;
  double v5;

  v4 = fmin(fmax(a3, 0.0), 1.0);
  v5 = fmod(a2 - a1 + 3.14159265, 6.28318531) + -3.14159265;
  if (v5 < -3.14159265)
    v5 = v5 + 6.28318531;
  return a1 + v5 * v4;
}

double CLKReverseInterpolateFromFloats(double a1, double a2, double a3)
{
  return fmin(fmax(1.0 / (a2 - a1) * (a3 - a1), 0.0), 1.0);
}

double CLKCompressFraction(double a1, double a2, double a3)
{
  double result;
  double v5;
  double v6;
  double v7;

  result = 0.0;
  v5 = fmin(fmax(a2, 0.0), 1.0);
  v6 = fmin(fmax(a3, 0.0), 1.0);
  if (v6 < v5)
    v6 = v5;
  v7 = v6 - v5;
  if (v7 != 0.0)
    return fmin(fmax((fmin(fmax(a1, 0.0), 1.0) - v5) / v7, 0.0), 1.0);
  return result;
}

double CLKMapFractionIntoRange(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4;
}

double CLKInterpolateBetweenPointsUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double CLKInterpolateBetweenPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenVectors(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenSizesUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double CLKInterpolateBetweenSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * fmin(fmax(a9, 0.0), 1.0);
}

double CLKInterpolateBetweenRectsUnclipped(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * a9;
}

double CLKInterpolateBetweenTransform@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>, double a4@<D0>)
{
  double result;
  float64x2_t v5;

  result = fmin(fmax(a4, 0.0), 1.0);
  v5 = vmlaq_n_f64(a1[1], vsubq_f64(a2[1], a1[1]), result);
  *a3 = vmlaq_n_f64(*a1, vsubq_f64(*a2, *a1), result);
  a3[1] = v5;
  a3[2] = vmlaq_n_f64(a1[2], vsubq_f64(a2[2], a1[2]), result);
  return result;
}

double CLKAlterRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

double CLKSmoothStep(double a1)
{
  return a1 * a1 * 3.0 + a1 * a1 * a1 * -2.0;
}

double CLKSecondHalfSmoothStep(double a1)
{
  return a1 * a1 * a1 * (a1 * a1 * a1) * 3.0 + a1 * a1 * a1 * (a1 * a1 * a1 * (a1 * a1 * a1)) * -2.0;
}

double CLKFirstHalfSmoothStep(double a1)
{
  double v1;

  v1 = (1.0 - a1) * ((1.0 - a1) * (1.0 - a1));
  return 1.0 - (v1 * v1 * 3.0 + v1 * (v1 * v1) * -2.0);
}

uint64_t CLKSizeCenteredAboutPointForDevice(void *a1)
{
  objc_msgSend(a1, "screenScale");
  return UIRectCenteredAboutPointScale();
}

uint64_t CLKSizeCenteredInRectForDevice(void *a1)
{
  id v1;

  v1 = a1;
  UIRectGetCenter();
  objc_msgSend(v1, "screenScale");

  return UIRectCenteredAboutPointScale();
}

double CLKPixelAlignRectForDevice(void *a1, double a2)
{
  double v3;
  double v4;

  objc_msgSend(a1, "screenScale");
  if (v3 == 0.0)
    v4 = 2.0;
  else
    v4 = v3;
  return round(a2 * v4) / v4;
}

BOOL CLKRectIsPixelAlignedForDevice(void *a1, double a2, double a3, double a4, double a5)
{
  double v9;

  objc_msgSend(a1, "screenScale");
  if (v9 == 0.0)
    v9 = 2.0;
  return vabdd_f64(a2, round(a2 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a3, round(a3 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a4, round(a4 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a5, round(a5 * v9) / v9) < 0.00000011920929;
}

void CLKFrameFromCenterBoundsAndTransform(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v14;
  CGFloat Height;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  v24.origin.x = a4;
  v24.origin.y = a5;
  v24.size.width = a6;
  v24.size.height = a7;
  v14 = CGRectGetWidth(v24) * -0.5;
  v25.origin.x = a4;
  v25.origin.y = a5;
  v25.size.width = a6;
  v25.size.height = a7;
  Height = CGRectGetHeight(v25);
  v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v22.a = *(_OWORD *)a1;
  *(_OWORD *)&v22.c = v16;
  *(_OWORD *)&v22.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v23, &v22, v14, Height * -0.5);
  v17 = *(_OWORD *)&v23.c;
  *(_OWORD *)a1 = *(_OWORD *)&v23.a;
  *(_OWORD *)(a1 + 16) = v17;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v23.tx;
  *(double *)&v17 = a3 + *(double *)(a1 + 40);
  *(double *)(a1 + 32) = a2 + *(double *)(a1 + 32);
  *(_QWORD *)(a1 + 40) = v17;
  v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v23.a = *(_OWORD *)a1;
  *(_OWORD *)&v23.c = v18;
  *(_OWORD *)&v23.tx = *(_OWORD *)(a1 + 32);
  v19 = a4;
  *(CGFloat *)&v18 = a5;
  v20 = a6;
  v21 = a7;
  CGRectApplyAffineTransform(*(CGRect *)((char *)&v18 - 8), &v23);
}

double CLKRadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

double CLKDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void CLKClockRadiansToPolarRadians(double a1)
{
  fmod(6.28318531 - a1 + 1.57079633, 6.28318548);
}

void CLKPolarRadiansToClockRadians(double a1)
{
  fmod(6.28318531 - a1 + 1.57079633, 6.28318548);
}

void CLKNormalizeAngle(long double a1)
{
  fmod(a1, 360.0);
}

id CLKInterpolateBetweenColors(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a1;
  v6 = a2;
  if (CLKEqualObjects(v5, v6))
  {
    v7 = v5;
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
    v8 = fmin(fmax(a3, 0.0), 1.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v18 + (v14 - v18) * v8, v17 + (v13 - v17) * v8, v16 + (v12 - v16) * v8, v15 + (v11 - v15) * v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

uint64_t CLKDeviceCategoryForSizeClass(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return qword_211565958[a1];
}

uint64_t CLKDeviceUUIDForNRDevice(void *a1, const char *a2)
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
}

BOOL CLKDeviceIsNRDevicePaired(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
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

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t _isWeekdayDayTemplate(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("EEE d")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("EEEE d")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("ccccc d"));
  }

  return v2;
}

uint64_t CLKComplicationFamilyFromString(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  if (v3
    && (_BoxedComplicationFamiliesByName(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKey:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if (a2)
      *a2 = objc_msgSend(v5, "integerValue");

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id _BoxedComplicationFamiliesByName()
{
  if (_BoxedComplicationFamiliesByName_onceToken != -1)
    dispatch_once(&_BoxedComplicationFamiliesByName_onceToken, &__block_literal_global_156);
  return (id)_BoxedComplicationFamiliesByName_complicationFamiliesByName;
}

id CLKStringForComplicationFamily(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = CFSTR("unknown-family");
  _BoxedComplicationFamiliesByName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __CLKStringForComplicationFamily_block_invoke;
  v5[3] = &unk_24CBFA288;
  v5[4] = &v6;
  v5[5] = a1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_21152E09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

BOOL CLKIsComplicationFamilySupportedOnDevice(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  return (unint64_t)(a1 - 8) > 4 || objc_msgSend(a2, "deviceCategory", v2, v3) != 1;
}

uint64_t CLKIsCreateWatchFace()
{
  if (CLKIsCreateWatchFace_onceToken != -1)
    dispatch_once(&CLKIsCreateWatchFace_onceToken, &__block_literal_global_21);
  return CLKIsCreateWatchFace___result;
}

uint64_t CLKIsCLKCompanionWatchFaceLibraryServiceProcess()
{
  if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken != -1)
    dispatch_once(&CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken, &__block_literal_global_24);
  return CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result;
}

uint64_t CLKIsNTKCLITool()
{
  if (CLKIsNTKCLITool_onceToken != -1)
    dispatch_once(&CLKIsNTKCLITool_onceToken, &__block_literal_global_28);
  return CLKIsNTKCLITool___result;
}

uint64_t CLKIsNTKXCTests()
{
  if (CLKIsNTKXCTests_onceToken != -1)
    dispatch_once(&CLKIsNTKXCTests_onceToken, &__block_literal_global_31);
  return CLKIsNTKXCTests___result;
}

uint64_t CLKIsGreenfieldTool()
{
  if (CLKIsGreenfieldTool_onceToken != -1)
    dispatch_once(&CLKIsGreenfieldTool_onceToken, &__block_literal_global_36);
  return CLKIsGreenfieldTool___result;
}

uint64_t CLKIsNTKDaemon()
{
  if (CLKIsNTKDaemon_onceToken != -1)
    dispatch_once(&CLKIsNTKDaemon_onceToken, &__block_literal_global_39);
  return CLKIsNTKDaemon___isDaemon;
}

uint64_t CLKIsFaceSnapshotService()
{
  if (CLKIsFaceSnapshotService_onceToken != -1)
    dispatch_once(&CLKIsFaceSnapshotService_onceToken, &__block_literal_global_42);
  return CLKIsFaceSnapshotService___isFaceSnapshotService;
}

uint64_t CLKIsUVPreviewApp()
{
  if (CLKIsUVPreviewApp_onceToken != -1)
    dispatch_once(&CLKIsUVPreviewApp_onceToken, &__block_literal_global_47);
  return CLKIsUVPreviewApp___isUVPreview;
}

uint64_t CLKIsBeingDebugged()
{
  pid_t v0;

  v0 = getpid();
  return CLKPIDIsBeingDebugged(v0);
}

uint64_t CLKPIDIsBeingDebugged(int a1)
{
  size_t v2;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int v34[2];
  int v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  LODWORD(v4) = 0;
  *(_QWORD *)v34 = 0xE00000001;
  v35 = 1;
  v36 = a1;
  v2 = 648;
  if (sysctl(v34, 4u, v3, &v2, 0, 0))
    CLKPIDIsBeingDebugged_cold_1();
  return (v4 >> 11) & 1;
}

BOOL CLKIsValidComplicationDynamicFontSize(unint64_t a1)
{
  return a1 < 5;
}

BOOL CLKIsValidComplicationColumnAlignment(unint64_t a1)
{
  return a1 < 2;
}

BOOL CLKIsValidComplicationRingStyle(unint64_t a1)
{
  return a1 < 2;
}

BOOL CLKIsValidForegroundHighlightMode(unint64_t a1)
{
  return a1 < 3;
}

const __CFString *CLKComplicationFamilyDescription(unint64_t a1)
{
  if (a1 > 0xC)
    return &stru_24CBFCB28;
  else
    return off_24CBFA480[a1];
}

uint64_t CLKComplicationIconAssetName(unint64_t a1)
{
  if (a1 > 0xC)
    return 0;
  else
    return (uint64_t)*(&off_24CBFA4E8 + a1);
}

NSArray *CLKAllComplicationFamilies(void)
{
  return (NSArray *)&unk_24CC181A8;
}

double _CLKWidgetGroupHorizontalMargin(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_CLKWidgetGroupHorizontalMargin___lock);
  WeakRetained = objc_loadWeakRetained(&_CLKWidgetGroupHorizontalMargin___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_CLKWidgetGroupHorizontalMargin___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_CLKWidgetGroupHorizontalMargin___cachedDevice, v1);
    _CLKWidgetGroupHorizontalMargin___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    ___CLKWidgetGroupHorizontalMargin_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _CLKWidgetGroupHorizontalMargin___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CLKWidgetGroupHorizontalMargin___lock);
  v9 = *(double *)&_CLKWidgetGroupHorizontalMargin__widgeGroupHorizontalMargin;

  return v9;
}

double _CLKWidgetGroupBottomMargin(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_CLKWidgetGroupBottomMargin___lock);
  WeakRetained = objc_loadWeakRetained(&_CLKWidgetGroupBottomMargin___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_CLKWidgetGroupBottomMargin___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_CLKWidgetGroupBottomMargin___cachedDevice, v1);
    _CLKWidgetGroupBottomMargin___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    ___CLKWidgetGroupBottomMargin_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _CLKWidgetGroupBottomMargin___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CLKWidgetGroupBottomMargin___lock);
  v9 = *(double *)&_CLKWidgetGroupBottomMargin__widgeGroupBottomMargin;

  return v9;
}

double CLKWidgetGroupSafeAreaInsets(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupSafeAreaInsets___lock);
  WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupSafeAreaInsets___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKWidgetGroupSafeAreaInsets___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKWidgetGroupSafeAreaInsets___cachedDevice, v1);
    CLKWidgetGroupSafeAreaInsets___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKWidgetGroupSafeAreaInsets_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKWidgetGroupSafeAreaInsets___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupSafeAreaInsets___lock);
  v9 = *(double *)&CLKWidgetGroupSafeAreaInsets__safeAreaInsets_0;

  return v9;
}

double CLKWidgetGroupNestedContentDiameter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupNestedContentDiameter___lock);
  WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupNestedContentDiameter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKWidgetGroupNestedContentDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKWidgetGroupNestedContentDiameter___cachedDevice, v1);
    CLKWidgetGroupNestedContentDiameter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKWidgetGroupNestedContentDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKWidgetGroupNestedContentDiameter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupNestedContentDiameter___lock);
  v9 = *(double *)&CLKWidgetGroupNestedContentDiameter__diameter;

  return v9;
}

double CLKWidgetGroupSquareContentCornerRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupSquareContentCornerRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice, v1);
    CLKWidgetGroupSquareContentCornerRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKWidgetGroupSquareContentCornerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKWidgetGroupSquareContentCornerRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupSquareContentCornerRadius___lock);
  v9 = *(double *)&CLKWidgetGroupSquareContentCornerRadius__cornerRadius;

  return v9;
}

id _AlternatePunctuationAttributes()
{
  if (_AlternatePunctuationAttributes_onceToken != -1)
    dispatch_once(&_AlternatePunctuationAttributes_onceToken, &__block_literal_global_11);
  return (id)_AlternatePunctuationAttributes___altPunctAttr;
}

void sub_211530A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_211530C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2115331B0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

double CLKContrastRatioForColors(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  v4 = _CLKRelativeLuminanceForColor(a1);
  v5 = _CLKRelativeLuminanceForColor(v3);

  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6 + 0.05;
  if (v4 >= v5)
    v8 = v5;
  else
    v8 = v4;
  return v7 / (v8 + 0.05);
}

double _CLKRelativeLuminanceForColor(void *a1)
{
  double v1;
  double v2;
  double v3;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v5 = 0;
  v6 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
  if (v8 <= 0.03928)
    v1 = v8 / 12.92;
  else
    v1 = pow((v8 + 0.055) / 1.055, 2.4);
  if (v7 <= 0.03928)
    v2 = v7 / 12.92;
  else
    v2 = pow((v7 + 0.055) / 1.055, 2.4);
  if (v6 <= 0.03928)
    v3 = v6 / 12.92;
  else
    v3 = pow((v6 + 0.055) / 1.055, 2.4);
  return v2 * 0.7152 + v1 * 0.2126 + v3 * 0.0722;
}

BOOL CLKIsBlackColor(void *a1)
{
  _BOOL8 result;
  double v2;
  double v3;
  double v4;

  v4 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v4, &v3, &v2, 0);
  result = 0;
  if (v4 == 0.0 && v3 == 0.0)
    return v2 == 0.0;
  return result;
}

void sub_211534078(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_211534170(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_21153426C(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_211534364(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_21153445C(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_211535014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_e8_48n12_8_8_s0_t8w32(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)(a1 + 48) = *(id *)(a2 + 48);
  result = *(__n128 *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void __destroy_helper_block_e8_48n4_8_s0(uint64_t a1)
{

}

void CLKClockTimerDateForNow(uint64_t a1@<X8>)
{
  id v2;

  +[CLKClockTimer now](CLKClockTimer, "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CLKClockTimerDateForDate(v2, a1);

}

double CLKClockTimerDateForDate@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHour:minute:second:nanosecond:fromDate:", &v12, &v11, &v10, &v9, v3);

  v5 = (double)v9;
  v6 = v12;
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v6;
  v7 = v10;
  result = v5 / 1000000000.0;
  *(_QWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = result;
  return result;
}

void CLKClockTimerDateConvertTo12Hour(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  unint64_t v5;

  v4 = *(id *)a1;
  v5 = *(_QWORD *)(a1 + 8) % 0xCuLL;
  if (!v5)
    v5 = 12;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)a2 = v4;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);

}

id _CLKFormatTimeIntervalSeconds(_BYTE *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long double a9, char a10)
{
  void *v15;
  id v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  id v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  id v40;
  __CFString *v41;
  __CFString *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v57;

  +[_CLKTimeFormatData instanceForCurrentLocale](_CLKTimeFormatData, "instanceForCurrentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CLKTimeFormatSentinel listenForLocaleChangesIfNecessary](_CLKTimeFormatSentinel, "listenForLocaleChangesIfNecessary");
  v16 = v15;
  v17 = fmod(a9, 1.0);
  v18 = (unint64_t)a9;
  v19 = (unint64_t)a9 / 0x3C;
  if ((unint64_t)a9 > 0xE0F)
    v20 = 1;
  else
    v20 = a2;
  objc_msgSend(v16, "singleWidthNumberFormatter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    objc_msgSend(v16, "doubleWidthNumberFormatter");
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  v57 = a8;
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18 / 0xE10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromNumber:", v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = &stru_24CBFCB28;
    if (!a5)
      goto LABEL_10;
  }
  objc_msgSend(v16, "doubleWidthNumberFormatter");
  v25 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v25;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19 - 60 * ((unint64_t)((v19 * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromNumber:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v28 = v18 - 60 * v19;
    objc_msgSend(v16, "doubleWidthNumberFormatter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringFromNumber:", v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = &stru_24CBFCB28;
  }
  if (a3)
  {
    objc_msgSend(v16, "doubleWidthNumberFormatter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(v17 * 100.0));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromNumber:", v33);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = &stru_24CBFCB28;
  }
  v35 = objc_retainAutorelease(v24);
  v36 = objc_retainAutorelease(v27);
  v37 = objc_retainAutorelease(v31);
  v38 = objc_retainAutorelease(v34);

  v39 = v35;
  v40 = v36;
  v41 = v37;
  v42 = v38;
  if (v20)
  {
    if (!a4 || a7)
    {
      objc_msgSend(v16, "formatHourMin");
      v43 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((a3 & 1) != 0)
        objc_msgSend(v16, "formatHourMinSecSubsec");
      else
        objc_msgSend(v16, "formatHourMinSec");
      v43 = objc_claimAutoreleasedReturnValue();
    }
  }
  else if ((a4 & 1) != 0)
  {
    if (a7 || (a3 & 1) == 0)
    {
      objc_msgSend(v16, "formatMinSec");
      v43 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v16, "formatMinSecSubsec");
      v43 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v16, "formatMin");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v43;
  if (a1)
    *a1 = v20;
  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HH%@"), v43);
    v45 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v45;
  }
  objc_msgSend(v44, "stringByReplacingOccurrencesOfString:withString:", CFSTR("HH"), CFSTR("%1$@"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "stringByReplacingOccurrencesOfString:withString:", CFSTR("H"), CFSTR("%1$@"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mm"), CFSTR("%2$@"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("m"), CFSTR("%2$@"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ss"), CFSTR("%3$@"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SS"), CFSTR("%4$@"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    if (-[__CFString length](v42, "length"))
    {

      v42 = CFSTR("−−");
    }
    if (a9 >= 60.0 && -[__CFString length](v41, "length") && (a10 & 1) == 0)
    {

      v41 = CFSTR("−−");
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v51, v39, v40, v41, v42);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

id CLKFormatTimeIntervalSecondsForLowFidelity(int a1, _BYTE *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 1, a7, 0);
}

id CLKFormatTimeIntervalSecondsForLowerFidelity(int a1, _BYTE *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 1, a7, 1);
}

id CLKFormatTimeIntervalSeconds(int a1, _BYTE *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 0, a7, 0);
}

id CLKFormatTimeInterval(_BYTE *a1, int a2, int a3, int a4, long double a5)
{
  return _CLKFormatTimeIntervalSeconds(a1, 0, a2, 1, 0, a3, a4, 0, a5, 0);
}

id CLKFormatTimeIntervalFull(int a1, int a2, int a3, long double a4)
{
  return _CLKFormatTimeIntervalSeconds(0, a1, a2, 1, a3, a3, 0, 0, a4, 0);
}

id _MonospaceNumbersFeatureSettings()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEBE1A0];
  v5[0] = *MEMORY[0x24BEBE1B0];
  v5[1] = v0;
  v6[0] = &unk_24CC17728;
  v6[1] = &unk_24CC17740;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _StylisticSet(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 - 21) < 0xFFFFFFFFFFFFFFECLL)
    return MEMORY[0x24BDBD1A8];
  v2 = *MEMORY[0x24BEBE1A0];
  v7[0] = *MEMORY[0x24BEBE1B0];
  v7[1] = v2;
  v8[0] = &unk_24CC176C8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2 * a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

double CLKKernValueForDesignSpecTrackingValue(void *a1, double a2)
{
  const __CTFont *v3;
  double v4;
  double v5;
  double v6;

  v3 = a1;
  v4 = a2 / (double)CTFontGetUnitsPerEm(v3);
  -[__CTFont pointSize](v3, "pointSize");
  v6 = v5;

  return v6 * v4;
}

void sub_211539698(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_211539710(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void _ForceDateFormatterLocaleToUseNumberSystem(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a1;
  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsFromLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mutableCopy");

  CLKLocaleNumberSystemIdentifier(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("numbers"));

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const void *)_CFLocaleCopyAsIfCurrent();
  objc_msgSend(v4, "setLocale:", v10);

  CFRelease(v10);
}

id _BasicTimeFormat()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("j:mm"), 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_21153AAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id CLKActiveComplicationsFromActivePairedDevice()
{
  void *v0;
  void *v1;

  +[CLKDevice activeNRDevice](CLKDevice, "activeNRDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLKActiveComplicationsFromPairedDevice(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLKActiveComplicationsFromPairedDevice(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _BYTE v16[24];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  *(_QWORD *)v16 = 0;
  *(_QWORD *)&v16[8] = v16;
  *(_QWORD *)&v16[16] = 0x2020000000;
  v2 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  v17 = (const __CFString *)getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    v3 = (void *)NanoRegistryLibrary();
    v2 = dlsym(v3, "NRWatchOSVersionForRemoteDevice");
    *(_QWORD *)(*(_QWORD *)&v16[8] + 24) = v2;
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(v16, 8);
  if (!v2)
    goto LABEL_18;
  v4 = ((uint64_t (*)(id))v2)(v1);

  *(_QWORD *)v16 = 0;
  *(_QWORD *)&v16[8] = v16;
  *(_QWORD *)&v16[16] = 0x2020000000;
  v5 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  v17 = (const __CFString *)getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    v6 = (void *)NanoRegistryLibrary();
    v5 = dlsym(v6, "NRVersionIsGreaterThanOrEqual");
    *(_QWORD *)(*(_QWORD *)&v16[8] + 24) = v5;
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(v16, 8);
  if (!v5)
  {
LABEL_18:
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    __break(1u);
  }
  v7 = ((uint64_t (*)(uint64_t, uint64_t))v5)(v4, 0x40000);
  if (v7)
    v8 = CFSTR("CLKActiveComplications");
  else
    v8 = CFSTR("activeComplications");
  if (v7)
    v9 = CFSTR("com.apple.ClockKit.activeComplications");
  else
    v9 = CFSTR("com.apple.sockpuppet.activeComplications");
  CLKLoggingObjectForDomain(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412802;
    *(_QWORD *)&v16[4] = v1;
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v9;
    *(_WORD *)&v16[22] = 2112;
    v17 = v8;
    _os_log_impl(&dword_2114F4000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving active complication list from NPS for (%@). domain=%@ key=%@", v16, 0x20u);
  }

  v11 = (void *)objc_msgSend(objc_alloc((Class)getNPSDomainAccessorClass()), "initWithDomain:pairedDevice:", v9, v1);
  v12 = (id)objc_msgSend(v11, "synchronize");
  objc_msgSend(v11, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain(1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412546;
    *(_QWORD *)&v16[4] = CFSTR("CLKActiveComplications");
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v13;
    _os_log_impl(&dword_2114F4000, v14, OS_LOG_TYPE_DEFAULT, "Retrieved NPS %@ (%@)", v16, 0x16u);
  }

  return v13;
}

void sub_21153B370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getNPSDomainAccessorClass()
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
  v0 = (void *)getNPSDomainAccessorClass_softClass;
  v7 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNPSDomainAccessorClass_block_invoke;
    v3[3] = &unk_24CBF9D00;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21153B434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CLKSetActiveComplicationsForLocalDevice(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE buf[24];
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = CFSTR("CLKActiveComplications");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v1;
    _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Setting NPS %@ to (%@)", buf, 0x16u);
  }

  v3 = (void *)objc_msgSend(objc_alloc((Class)getNPSDomainAccessorClass()), "initWithDomain:", CFSTR("com.apple.ClockKit.activeComplications"));
  objc_msgSend(v3, "setObject:forKey:", v1, CFSTR("CLKActiveComplications"));
  v4 = (id)objc_msgSend(v3, "synchronize");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getNPSManagerClass_softClass;
  v12 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getNPSManagerClass_block_invoke;
    v14 = &unk_24CBF9D00;
    v15 = &v9;
    __getNPSManagerClass_block_invoke((uint64_t)buf);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("CLKActiveComplications"), v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:cloudEnabled:", CFSTR("com.apple.ClockKit.activeComplications"), v8, 1);

}

void sub_21153B614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("NPSDomainAccessor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSDomainAccessorClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  void *v0;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

CLKFullColorSymbolImageProvider *__getNPSManagerClass_block_invoke(uint64_t a1)
{
  CLKFullColorSymbolImageProvider *result;
  CLKFullColorSymbolImageProvider *v3;
  SEL v4;
  id v5;

  NanoPreferencesSyncLibrary();
  result = (CLKFullColorSymbolImageProvider *)objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CLKFullColorSymbolImageProvider *)__getNPSManagerClass_block_invoke_cold_1();
    return -[CLKFullColorSymbolImageProvider initWithSystemName:](v3, v4, v5);
  }
  return result;
}

void sub_21153E4EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_21153E578(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_21153E614(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_21153E6B0(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_21153FA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_21153FCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id _AssetBundleSuffixesForSizeClass()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &stru_24CBFCB28);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", CFSTR("-sunscreen"));
  return v0;
}

void sub_211541678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_211541B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ValidateTemplate(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isCompatibleWithFamily:", a2) & 1) != 0)
    {
      v5 = objc_msgSend(v4, "validateWithError:", 0);
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        _ValidateTemplate_cold_1(a2, v4, v6);

      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t _ValidateEntry(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "validateWithError:", 0))
    v4 = objc_msgSend(v3, "validateComplicationFamily:", a2);
  else
    v4 = 0;

  return v4;
}

uint64_t _ValidateEntries(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ValidateEntries_block_invoke;
  v6[3] = &unk_24CBFAF70;
  v6[4] = &v7;
  v6[5] = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_211543818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id CLKget_AVAudioSessionMediaServicesWereResetNotification()
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
  v0 = (id *)getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr;
  v7 = getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr;
  if (!getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary();
    v0 = (id *)dlsym(v1, "AVAudioSessionMediaServicesWereResetNotification");
    v5[3] = (uint64_t)v0;
    getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

__n128 CLKget_kCMTimeZero@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  void *v3;
  __n128 result;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (__n128 *)getkCMTimeZeroSymbolLoc_ptr;
  v9 = getkCMTimeZeroSymbolLoc_ptr;
  if (!getkCMTimeZeroSymbolLoc_ptr)
  {
    v3 = (void *)CoreMediaLibrary();
    v2 = (__n128 *)dlsym(v3, "kCMTimeZero");
    v7[3] = (uint64_t)v2;
    getkCMTimeZeroSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

__n128 CLKget_kCMTimeInvalid@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  void *v3;
  __n128 result;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (__n128 *)getkCMTimeInvalidSymbolLoc_ptr;
  v9 = getkCMTimeInvalidSymbolLoc_ptr;
  if (!getkCMTimeInvalidSymbolLoc_ptr)
  {
    v3 = (void *)CoreMediaLibrary();
    v2 = (__n128 *)dlsym(v3, "kCMTimeInvalid");
    v7[3] = (uint64_t)v2;
    getkCMTimeInvalidSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

__n128 getkCMTimePositiveInfinity@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  void *v3;
  __n128 result;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (__n128 *)getkCMTimePositiveInfinitySymbolLoc_ptr;
  v9 = getkCMTimePositiveInfinitySymbolLoc_ptr;
  if (!getkCMTimePositiveInfinitySymbolLoc_ptr)
  {
    v3 = (void *)CoreMediaLibrary();
    v2 = (__n128 *)dlsym(v3, "kCMTimePositiveInfinity");
    v7[3] = (uint64_t)v2;
    getkCMTimePositiveInfinitySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

id CLKget_AVSynchronizedLayerClass()
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
  v0 = (void *)getAVSynchronizedLayerClass_softClass;
  v7 = getAVSynchronizedLayerClass_softClass;
  if (!getAVSynchronizedLayerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVSynchronizedLayerClass_block_invoke;
    v3[3] = &unk_24CBF9D00;
    v3[4] = &v4;
    __getAVSynchronizedLayerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_211544E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CMTimeMakeWithSeconds(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getCMTimeMakeWithSecondsSymbolLoc_ptr;
  v11 = getCMTimeMakeWithSecondsSymbolLoc_ptr;
  if (!getCMTimeMakeWithSecondsSymbolLoc_ptr)
  {
    v5 = (void *)CoreMediaLibrary();
    v4 = dlsym(v5, "CMTimeMakeWithSeconds");
    v9[3] = (uint64_t)v4;
    getCMTimeMakeWithSecondsSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(uint64_t, double))v4)(a1, a2);
}

void sub_211544FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211545388(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionClass()
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
  v0 = (void *)getAVAudioSessionClass_softClass;
  v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_24CBF9D00;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21154547C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionCategoryAmbient()
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
  v0 = (id *)getAVAudioSessionCategoryAmbientSymbolLoc_ptr;
  v7 = getAVAudioSessionCategoryAmbientSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryAmbientSymbolLoc_ptr)
  {
    v1 = (void *)AVFoundationLibrary();
    v0 = (id *)dlsym(v1, "AVAudioSessionCategoryAmbient");
    v5[3] = (uint64_t)v0;
    getAVAudioSessionCategoryAmbientSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _CMTimeCompare(__int128 *a1, __int128 *a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;

  *(_QWORD *)&v10 = 0;
  *((_QWORD *)&v10 + 1) = &v10;
  v11 = 0x2020000000;
  v4 = getCMTimeCompareSymbolLoc_ptr;
  v12 = getCMTimeCompareSymbolLoc_ptr;
  if (!getCMTimeCompareSymbolLoc_ptr)
  {
    v5 = (void *)CoreMediaLibrary();
    v4 = dlsym(v5, "CMTimeCompare");
    *(_QWORD *)(*((_QWORD *)&v10 + 1) + 24) = v4;
    getCMTimeCompareSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v7);
  }
  v10 = *a1;
  v11 = *((_QWORD *)a1 + 2);
  v8 = *a2;
  v9 = *((_QWORD *)a2 + 2);
  return ((uint64_t (*)(__int128 *, __int128 *))v4)(&v10, &v8);
}

void sub_21154678C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t CoreMediaLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreMediaLibraryCore_frameworkLibrary)
    CoreMediaLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreMediaLibraryCore_frameworkLibrary;
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAVSynchronizedLayerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary();
  result = objc_getClass("AVSynchronizedLayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVSynchronizedLayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVSynchronizedLayerClass_block_invoke_cold_1();
    return __getAVPlayerLayerClass_block_invoke(v3);
  }
  return result;
}

Class __getAVPlayerLayerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary();
  result = objc_getClass("AVPlayerLayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerLayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVPlayerLayerClass_block_invoke_cold_1();
    return (Class)__getAVAudioSessionClass_block_invoke(v3);
  }
  return result;
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary();
  result = objc_getClass("AVAudioSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVAudioSessionClass_block_invoke_cold_1();
    return (Class)__getAVQueuePlayerClass_block_invoke(v3);
  }
  return result;
}

Class __getAVQueuePlayerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary();
  result = objc_getClass("AVQueuePlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVQueuePlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVQueuePlayerClass_block_invoke_cold_1();
    return (Class)__getAVURLAssetClass_block_invoke(v3);
  }
  return result;
}

Class __getAVURLAssetClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AVFoundationLibrary();
  result = objc_getClass("AVURLAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVURLAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVURLAssetClass_block_invoke_cold_1();
    return (Class)__getAVPlayerItemClass_block_invoke(v3);
  }
  return result;
}

CLKTimeIntervalTextProvider *__getAVPlayerItemClass_block_invoke(uint64_t a1)
{
  CLKTimeIntervalTextProvider *result;
  CLKTimeIntervalTextProvider *v3;
  SEL v4;
  NSDate *v5;
  NSDate *v6;

  AVFoundationLibrary();
  result = (CLKTimeIntervalTextProvider *)objc_getClass("AVPlayerItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CLKTimeIntervalTextProvider *)__getAVPlayerItemClass_block_invoke_cold_1();
    return -[CLKTimeIntervalTextProvider initWithStartDate:endDate:](v3, v4, v5, v6);
  }
  return result;
}

void sub_211547AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CLKForcedTime()
{
  id v0;
  void *v1;
  id v2;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!CLKInternalBuild())
    return 0;
  if (CLKForcedTime_onceToken != -1)
    dispatch_once(&CLKForcedTime_onceToken, &__block_literal_global_21);
  if ((CLKForcedTime_needsUpdate & 1) == 0)
  {
    v0 = (id)__forcedTime;
    v1 = (void *)CFPreferencesCopyAppValue(CFSTR("com.apple.ClockKit.forcedTime"), (CFStringRef)*MEMORY[0x24BDBD568]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v1;
    else
      v2 = 0;
    v4 = (void *)__forcedTime;
    __forcedTime = (uint64_t)v2;

    CLKForcedTime_needsUpdate = 1;
    if (__forcedTime)
    {
      CLKLoggingObjectForDomain(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = __forcedTime;
        v6 = "Using forced time: %@";
        v7 = v5;
        v8 = 12;
LABEL_15:
        _os_log_impl(&dword_2114F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
      }
    }
    else
    {
      if (!v0)
      {
LABEL_17:

        return (id)__forcedTime;
      }
      CLKLoggingObjectForDomain(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        v6 = "No longer using forced time";
        v7 = v5;
        v8 = 2;
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
  return (id)__forcedTime;
}

id CLKStartOfDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id CLKStartOfNextDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "startOfDayForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id CLKStartOfPreviousDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -1, v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "startOfDayForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id CLKStartOfNthDayForDate(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDBCE48];
    v4 = a1;
    objc_msgSend(v3, "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, a2, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "startOfDayForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

double CLKPercentageOfDayDoneForDate(void *a1)
{
  id v1;
  void *v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v1 = a1;
  v2 = v1;
  v3 = 0.0;
  if (v1)
  {
    CLKStartOfDayForDate(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5;

    CLKStartOfNextDayForDate(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    if (v9 - v6 > 0.0)
      v3 = (v10 - v6) / (v9 - v6);
  }

  return v3;
}

id CLKEndOfDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 28, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 1026);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 64, -1, v6, 1026);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

BOOL CLKIsDateAfter5PM(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "component:fromDate:", 32, v2);

  return v4 > 16;
}

id CLKDateFor5PMOnDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 28, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setHour:", 17);
    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id CLKDateFor9AMOnDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 60, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setHour:", 9);
    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t CLKDatesHaveSameTimeDesignatorPeriod(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (CLKDatesHaveSameTimeDesignatorPeriod_onceToken != -1)
    dispatch_once(&CLKDatesHaveSameTimeDesignatorPeriod_onceToken, &__block_literal_global_8_0);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isSameDayAsDate:inCalendar:", v4, v5);

  if (v6)
  {
    objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "setOverrideDate:", v3);
    objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "designatorText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "setOverrideDate:", v4);
    objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "designatorText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id CLKRoundDateToNearestInterval(void *a1, uint64_t a2, int a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  if (a1)
  {
    v5 = (void *)MEMORY[0x24BDBCE48];
    v6 = a1;
    objc_msgSend(v5, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startOfDayForDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    objc_msgSend(v6, "timeIntervalSince1970");
    v12 = v11;

    v13 = llround((v12 - v10) / (double)a2);
    if (a3)
      v13 = (uint64_t)(v12 - v10) / a2;
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 128, v13 * a2, v8, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

id CLKRoundDateToMinuteGranularity(void *a1, unint64_t a2)
{
  uint64_t v2;

  if (a2 <= 1)
    v2 = 1;
  else
    v2 = a2;
  return CLKRoundDateToNearestInterval(a1, 60 * v2, 0);
}

id CLKRoundDateDownToNearestHour(void *a1)
{
  return CLKRoundDateToNearestInterval(a1, 3600, 1);
}

id CLKRoundDateDownToNearestMinute(void *a1)
{
  return CLKRoundDateToNearestInterval(a1, 60, 1);
}

id CLKRoundDateDownToNearestSecond(void *a1)
{
  void *v1;
  double v2;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:", floor(v2));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

double CLKHourMinuteSecondAnglesForTime(double *a1, double *a2, double *a3, uint64_t a4, void *a5)
{
  double result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  objc_msgSend(a5, "getHour:minute:second:nanosecond:fromDate:", &v12, &v11, &v10, &v9, a4);
  if (a1)
  {
    result = ((double)v10 + (double)v11 * 60.0 + (double)(v12 % 12) * 60.0 * 60.0) / 43200.0 * 6.28318531;
    *a1 = result;
  }
  if (a2)
  {
    result = ((double)v10 + (double)v11 * 60.0) / 3600.0 * 6.28318531;
    *a2 = result;
  }
  if (a3)
  {
    result = ((double)v10 / 60.0 + (double)v9 / 6.0e10) * 6.28318531;
    *a3 = result;
  }
  return result;
}

void CLKSetCompanionDisplayDate(id obj)
{
  objc_storeStrong((id *)&__overrideCompanionDisplayDate, obj);
}

id CLKCompanionDisplayDate()
{
  if (CLKCompanionDisplayDate_onceToken != -1)
    dispatch_once(&CLKCompanionDisplayDate_onceToken, &__block_literal_global_12_1);
  if (__overrideCompanionDisplayDate)
    return (id)__overrideCompanionDisplayDate;
  else
    return (id)CLKCompanionDisplayDate__date;
}

id CLKWatchFaceLibraryServerInterface()
{
  if (CLKWatchFaceLibraryServerInterface_onceToken != -1)
    dispatch_once(&CLKWatchFaceLibraryServerInterface_onceToken, &__block_literal_global_22);
  return (id)CLKWatchFaceLibraryServerInterface_interface;
}

void _CLKSetViewBoundsAndPositionFromFrame(void *a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a1;
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "setBounds:");
  objc_msgSend(v14, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoint");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "setCenter:", a2 + v11 * a4, a3 + v13 * a5);
}

void sub_21154C4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CLKSceneSizeForDevice(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKSceneSizeForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&CLKSceneSizeForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKSceneSizeForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKSceneSizeForDevice___cachedDevice, v1);
    CLKSceneSizeForDevice___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKSceneSizeForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKSceneSizeForDevice___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKSceneSizeForDevice___lock);
  v9 = *(double *)&CLKSceneSizeForDevice_width;

  return v9;
}

double CLKDialDiameterForDeviceWithRoundingBehavior(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a1, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoundingBehavior:", a2);
  v8[0] = &unk_24CC17860;
  v8[1] = &unk_24CC17890;
  v9[0] = &unk_24CC17B98;
  v9[1] = &unk_24CC17BB8;
  v8[2] = &unk_24CC17878;
  v8[3] = &unk_24CC178A8;
  v9[2] = &unk_24CC17BC8;
  v9[3] = &unk_24CC17BD8;
  v8[4] = &unk_24CC178C0;
  v9[4] = &unk_24CC17BE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 155.0);
  v6 = v5;

  return v6;
}

double CLKDialDiameterForDevice(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKDialDiameterForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&CLKDialDiameterForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKDialDiameterForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKDialDiameterForDevice___cachedDevice, v1);
    CLKDialDiameterForDevice___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    CLKDialDiameterForDevice__dialDiameter = CLKDialDiameterForDeviceWithRoundingBehavior((uint64_t)v1, 2);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKDialDiameterForDevice___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKDialDiameterForDevice___lock);
  v8 = *(double *)&CLKDialDiameterForDevice__dialDiameter;

  return v8;
}

double CLKLargeDialDiameterForDevice(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKLargeDialDiameterForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&CLKLargeDialDiameterForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKLargeDialDiameterForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKLargeDialDiameterForDevice___cachedDevice, v1);
    CLKLargeDialDiameterForDevice___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKLargeDialDiameterForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKLargeDialDiameterForDevice___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKLargeDialDiameterForDevice___lock);
  v9 = *(double *)&CLKLargeDialDiameterForDevice__largeDialDiameter;

  return v9;
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

uint64_t OUTLINED_FUNCTION_4_2()
{
  return objc_opt_class();
}

id CLKLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CLKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24CBFCB28, CFSTR("ClockKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CLKBundle()
{
  if (CLKBundle_onceToken != -1)
    dispatch_once(&CLKBundle_onceToken, &__block_literal_global_175);
  return (id)CLKBundle___bundle;
}

id CLKWorldClockLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CLKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24CBFCB28, CFSTR("WorldClockFormats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CLKGreenfieldLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CLKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24CBFCB28, CFSTR("ClockKit-greenfield"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  if (CLKLocaleCurrentNumberSystem_onceToken != -1)
    dispatch_once(&CLKLocaleCurrentNumberSystem_onceToken, &__block_literal_global_26);
  return numberSystem;
}

void _CLKUpdateNumberSystem()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  int v4;
  id v5;

  v0 = (void *)MEMORY[0x24BE5C368];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberingSystemForLocaleID:", v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("arab")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("deva")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("beng")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("guru")) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("gujr")) & 1) != 0)
  {
    v3 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("telu")) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mlym")) & 1) != 0)
  {
    v3 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("knda")) & 1) != 0)
  {
    v3 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("orya")) & 1) != 0)
  {
    v3 = 9;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("olck")) & 1) != 0)
  {
    v3 = 10;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("arabext")) & 1) != 0)
  {
    v3 = 11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mtei")) & 1) != 0)
  {
    v3 = 12;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mymr")) & 1) != 0)
  {
    v3 = 13;
  }
  else
  {
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("khmr"));
    v3 = 14;
    if (!v4)
      v3 = 0;
  }
  numberSystem = v3;

}

const __CFString *CLKLocaleNumberSystemIdentifier(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("latn");
  else
    return off_24CBFB5D0[a1 - 1];
}

const __CFString *CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("en");
  else
    return off_24CBFB640[a1 - 1];
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("latn")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("arab")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("deva")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("beng")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("guru")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("gujr")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("telu")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mlym")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("knda")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("orya")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("olck")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("arabext")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mtei")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mymr")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("khmr")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

const __CFString *CLKLocaleNumberSystemPrefix()
{
  if (CLKLocaleCurrentNumberSystem_onceToken != -1)
    dispatch_once(&CLKLocaleCurrentNumberSystem_onceToken, &__block_literal_global_26);
  if ((unint64_t)(numberSystem - 1) > 0xD)
    return CFSTR("Latn");
  else
    return off_24CBFB6B0[numberSystem - 1];
}

uint64_t CLKLayoutIsRTL()
{
  if (CLKLayoutIsRTL_onceToken != -1)
    dispatch_once(&CLKLayoutIsRTL_onceToken, &__block_literal_global_102);
  return isLayoutRTL;
}

void _CLKUpdateIsLayoutRTL()
{
  void *v0;
  BOOL v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v0;
  if (v0)
  {
    v1 = objc_msgSend(v0, "effectiveUserInterfaceLayoutDirection") == 1;
    v2 = v6;
    v3 = v1;
    isLayoutRTL = v3;
  }
  else
  {
    if (*MEMORY[0x24BEBDF78])
    {
      isLayoutRTL = objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") != 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      isLayoutRTL = objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v5) == 2;
    }
    v2 = 0;
  }

}

uint64_t CLKLanguageIsTallScript()
{
  if (CLKLanguageIsTallScript_onceToken != -1)
    dispatch_once(&CLKLanguageIsTallScript_onceToken, &__block_literal_global_103);
  return languageIsTallScript;
}

void _CLKUpdateLanguageIsTallScript()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  languageIsTallScript = objc_msgSend(&unk_24CC181F0, "containsObject:", v1);
}

BOOL CLKCurrentLocaleIs24HourMode()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = CLKLocaleIs24HourMode(v0);

  return v1;
}

BOOL CLKLocaleIs24HourMode(void *a1)
{
  const __CFLocale *v1;
  uint64_t v2;
  void *v3;
  __CFDateFormatter *v4;
  const __CFString *Format;
  _BOOL8 v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!v1 || (const __CFLocale *)v2 == v1)
  {
    os_unfair_lock_lock(&CLKLocaleIs24HourMode_lock);
    if ((void *)CLKLocaleIs24HourMode_cachedLocale != v3)
    {
      objc_storeStrong((id *)&CLKLocaleIs24HourMode_cachedLocale, v3);
      CLKLocaleIs24HourMode_cachedIs24Hour = objc_msgSend(MEMORY[0x24BDBCEA0], "_usesTwelveHourClock") ^ 1;
    }
    os_unfair_lock_unlock(&CLKLocaleIs24HourMode_lock);
    v6 = CLKLocaleIs24HourMode_cachedIs24Hour != 0;
  }
  else
  {
    v4 = CFDateFormatterCreate(0, v1, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    Format = CFDateFormatterGetFormat(v4);
    v6 = (_BOOL8)Format;
    if (Format)
      v6 = CFStringFind(Format, CFSTR("H"), 0).location != -1
        || CFStringFind((CFStringRef)v6, CFSTR("k"), 0).location != -1;
    CFRelease(v4);
  }

  return v6;
}

uint64_t CLKIsCurrentLocaleCJK()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (CLKIsCurrentLocaleCJK_onceToken != -1)
    dispatch_once(&CLKIsCurrentLocaleCJK_onceToken, &__block_literal_global_108);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend((id)CLKIsCurrentLocaleCJK__cjkSet, "containsObject:", v1);
  return v2;
}

uint64_t CLKIsCurrentLocaleNonLatin()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (CLKIsCurrentLocaleNonLatin_onceToken != -1)
    dispatch_once(&CLKIsCurrentLocaleNonLatin_onceToken, &__block_literal_global_116);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend((id)CLKIsCurrentLocaleNonLatin__nonLatinSet, "containsObject:", v1);
  return v2;
}

uint64_t CLKDesignatorRequiresWhitespace()
{
  if (CLKDesignatorRequiresWhitespace_onceToken != -1)
    dispatch_once(&CLKDesignatorRequiresWhitespace_onceToken, &__block_literal_global_121);
  return CLKDesignatorRequiresWhitespace_requiresWhitespace;
}

uint64_t CLKUsesFauxSmallCaps()
{
  if (CLKUsesFauxSmallCaps_onceToken != -1)
    dispatch_once(&CLKUsesFauxSmallCaps_onceToken, &__block_literal_global_126);
  return CLKUsesFauxSmallCaps_fauxSmallCaps;
}

BOOL CLKSmallCapsAllowed()
{
  if (CLKSmallCapsAllowed_onceToken != -1)
    dispatch_once(&CLKSmallCapsAllowed_onceToken, &__block_literal_global_129);
  return (CLKSmallCapsAllowed_smallCapsAllowed & 1) == 0;
}

BOOL CLKDropLeftRedundantDesignator()
{
  if (CLKDropLeftRedundantDesignator_onceToken != -1)
    dispatch_once(&CLKDropLeftRedundantDesignator_onceToken, &__block_literal_global_134);
  return (CLKDropLeftRedundantDesignator_dropLeft & 1) == 0;
}

uint64_t CLKRemovesPunctuationFromWeekdayDay()
{
  if (CLKRemovesPunctuationFromWeekdayDay_onceToken != -1)
    dispatch_once(&CLKRemovesPunctuationFromWeekdayDay_onceToken, &__block_literal_global_137);
  return CLKRemovesPunctuationFromWeekdayDay_removesPunctuation;
}

uint64_t CLKEqualObjects(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

void CLKValidateArray(void *a1, uint64_t a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: putative array is a %@"), objc_opt_class());
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __CLKValidateArray_block_invoke;
  v4[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24lu32l8;
  v4[4] = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void CLKRecursivelyValidateArray(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a1;
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: putative array is a %@"), objc_opt_class());
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __CLKRecursivelyValidateArray_block_invoke;
  v6[3] = &unk_24CBFB4E8;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void sub_211550DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CLKRecursivelyValidateDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a1;
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Dictionary validation failed: putative dictionary is a %@"), objc_opt_class());
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __CLKRecursivelyValidateDictionary_block_invoke;
  v6[3] = &unk_24CBFB538;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void sub_2115510E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void CLKRequestConcreteImplementation(void *a1)
{
  id v1;

  v1 = a1;
  if (CLKInternalBuild_onceToken != -1)
    dispatch_once(&CLKInternalBuild_onceToken, &__block_literal_global_158);
  if (CLKInternalBuild_internal)
    NSRequestConcreteImplementation();

}

void sub_21155126C(_Unwind_Exception *exception_object, int a2, ...)
{
  id v2;
  NSObject *v3;
  void *v4;
  va_list va;

  va_start(va, a2);
  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    CLKLoggingObjectForDomain(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "reason");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRequestConcreteImplementation_cold_1(v4, (uint64_t)va, v3);
    }

    objc_end_catch();
    JUMPOUT(0x211551220);
  }
  _Unwind_Resume(exception_object);
}

void _CLKGenerateSimulatedCrash(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void (*v16)(uint64_t, uint64_t, id);
  _Unwind_Exception *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v10 = a1;
  v11 = a2;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, &a9);
  CLKLoggingObjectForDomain(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    _CLKGenerateSimulatedCrash_cold_2(v12, v13);

  v14 = getpid();
  v15 = v12;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v16 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  v22 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v18[3] = &unk_24CBF9D00;
    v18[4] = &v19;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v18);
    v16 = (void (*)(uint64_t, uint64_t, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v16)
  {
    v17 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v17);
  }
  v16(v14, 464371934, v15);

}

id CLKUniqueBundle(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD1488];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "_initUniqueWithURL:", v2);

  return v3;
}

id CLKBuildVersion()
{
  if (CLKBuildVersion_onceToken != -1)
    dispatch_once(&CLKBuildVersion_onceToken, &__block_literal_global_163);
  return (id)CLKBuildVersion___buildVersion;
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
  }
  else
  {
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (!CrashReporterSupportLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SimulateCrash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CLKDebugCompanionDisplayDateOverride()
{
  if (CLKDebugCompanionDisplayDateOverride_onceToken != -1)
    dispatch_once(&CLKDebugCompanionDisplayDateOverride_onceToken, &__block_literal_global_27);
  return (id)CLKDebugCompanionDisplayDateOverride___overrideDate;
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.kind.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.extensionBundleIdentifier.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.intent.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1)
                                                                            + 0x50)
                                                                - 8)
                                                    + 16))(a1, &v1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x70)]);
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.localizedDisplayName.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x78));
  swift_bridgeObjectRetain();
  return v1;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  id v16;
  id v17;

  v8 = v7;
  v16 = objc_allocWithZone(v8);
  v17 = sub_211551F0C(a1, a2, a3, a4, a5, a6, a7);
  (*(void (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)v8 + 10) - 8) + 8))(a5);
  return v17;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  id v10;

  v9 = *MEMORY[0x24BEE4EA0] & *v7;
  v10 = sub_211551F0C(a1, a2, a3, a4, a5, a6, a7);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 80) - 8) + 8))(a5);
  return v10;
}

uint64_t sub_211551A50(void *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *MEMORY[0x24BEE4EA0];

  type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration(0, *(_QWORD *)((v3 & v2) + 0x50), *(_QWORD *)((v3 & v2) + 0x58), v4);
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_211551AB8(uint64_t a1, uint64_t a2, void *a3)
{
  sub_211551A50(a3);
  return 0;
}

id sub_211551AE0()
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_211551C30();
  v1 = objc_allocWithZone((Class)CLKComplicationIntentWidgetMigrationConfiguration);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21155B964();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_21155B964();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_21155B964();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v1, sel_initWithKind_extensionBundleIdentifier_intent_localizedDisplayName_, v2, v3, v0, v4);

  return v5;
}

id sub_211551C00(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = sub_211551AE0();

  return v2;
}

id sub_211551C30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  _QWORD v13[4];

  v1 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x50);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v12 - v3;
  v6 = (char *)v0 + *(_QWORD *)(v5 + 112);
  swift_bridgeObjectRetain();
  sub_21155B88C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v6, v1);
  swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_21155B880();
  v7 = objc_allocWithZone(MEMORY[0x24BDD9BE8]);
  v8 = (void *)sub_21155B964();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_0(v13, v13[3]);
  v9 = sub_21155BA84();
  __swift_project_boxed_opaque_existential_0(v12, v12[3]);
  v10 = objc_msgSend(v7, sel_initWithAppBundleIdentifier_linkAction_linkActionMetadata_, v8, v9, sub_21155BA84());
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v10;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(private:)()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_initPrivate);
}

void CLKComplicationAppIntentWidgetMigrationConfiguration.init(private:)()
{
  sub_211551FE4();
}

void sub_211551E04()
{
  sub_211551FE4();
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_211551E6C(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1)
                                                                                                 + 0x70)]);
  return swift_bridgeObjectRelease();
}

id sub_211551F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  objc_class *v17;
  objc_super v19;

  v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v11 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v7);
  v12 = &v7[v11[12]];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v7[*(_QWORD *)((*v10 & *(_QWORD *)v7) + 0x68)];
  *(_QWORD *)v13 = a3;
  *((_QWORD *)v13 + 1) = a4;
  v14 = v11[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(&v7[*(_QWORD *)((*v10 & *(_QWORD *)v7) + 0x70)], a5, v14);
  v15 = &v7[*(_QWORD *)((*v10 & *(_QWORD *)v7) + 0x78)];
  *(_QWORD *)v15 = a6;
  *((_QWORD *)v15 + 1) = a7;
  v17 = (objc_class *)type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration(0, v14, v11[11], v16);
  v19.receiver = v7;
  v19.super_class = v17;
  return objc_msgSendSuper2(&v19, sel_initPrivate);
}

void sub_211551FE4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CLKComplicationAppIntentWidgetMigrationConfiguration);
}

uint64_t sub_211552020()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CLKComplicationAppIntentWidgetMigrationConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void type metadata accessor for CLKComplicationFamily(uint64_t a1)
{
  sub_211552144(a1, &qword_254AB8348);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_211552144(a1, &qword_254AB8350);
}

uint64_t sub_2115520E8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_211552108(uint64_t result, int a2, int a3)
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
  sub_211552144(a1, &qword_254AB8358);
}

void sub_211552144(uint64_t a1, unint64_t *a2)
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

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BDC0E0](a1, v6, a5);
}

CGPoint __swiftcall CLKDeviceMetrics.scaledPoint(_:overrides:)(CGPoint _, Swift::OpaquePointer overrides)
{
  double v2;
  double v3;
  CGPoint result;

  sub_211552228((uint64_t)overrides._rawValue, (SEL *)&selRef_valueWithCGPoint_, (SEL *)&selRef_scaledPoint_withOverrides_, _.x, _.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGSize __swiftcall CLKDeviceMetrics.scaledSize(_:overrides:)(CGSize _, Swift::OpaquePointer overrides)
{
  double v2;
  double v3;
  CGSize result;

  sub_211552228((uint64_t)overrides._rawValue, (SEL *)&selRef_valueWithCGSize_, (SEL *)&selRef_scaledSize_withOverrides_, _.width, _.height);
  result.height = v3;
  result.width = v2;
  return result;
}

void sub_211552228(uint64_t a1, SEL *a2, SEL *a3, double a4, double a5)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  id v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v59;
  SEL *v60;
  uint64_t v61;
  int64_t v62;

  v61 = a1 + 64;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a1 + 64);
  v62 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  v13 = MEMORY[0x24BEE4B00];
  v60 = a2;
LABEL_4:
  while (2)
  {
    v14 = v13 & 0xC000000000000001;
    if (v13 < 0)
      v15 = v13;
    else
      v15 = v13 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      while (1)
      {
        if (v11)
        {
          v16 = __clz(__rbit64(v11));
          v11 &= v11 - 1;
          v17 = v16 | (v12 << 6);
        }
        else
        {
          v18 = v12 + 1;
          if (__OFADD__(v12, 1))
          {
            __break(1u);
            goto LABEL_56;
          }
          if (v18 >= v62)
            goto LABEL_54;
          v19 = *(_QWORD *)(v61 + 8 * v18);
          ++v12;
          if (!v19)
          {
            v12 = v18 + 1;
            if (v18 + 1 >= v62)
              goto LABEL_54;
            v19 = *(_QWORD *)(v61 + 8 * v12);
            if (!v19)
            {
              v12 = v18 + 2;
              if (v18 + 2 >= v62)
                goto LABEL_54;
              v19 = *(_QWORD *)(v61 + 8 * v12);
              if (!v19)
              {
                v12 = v18 + 3;
                if (v18 + 3 >= v62)
                  goto LABEL_54;
                v19 = *(_QWORD *)(v61 + 8 * v12);
                if (!v19)
                {
                  v12 = v18 + 4;
                  if (v18 + 4 >= v62)
                    goto LABEL_54;
                  v19 = *(_QWORD *)(v61 + 8 * v12);
                  if (!v19)
                  {
                    v20 = v18 + 5;
                    if (v20 >= v62)
                    {
LABEL_54:
                      swift_release();
                      sub_211554090(0, (unint64_t *)&qword_254AB8360);
                      sub_211554090(0, &qword_254AB8368);
                      sub_2115540C8();
                      v57 = (void *)sub_21155B958();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v59, *a3, v57, a4, a5);

                      return;
                    }
                    v19 = *(_QWORD *)(v61 + 8 * v20);
                    if (!v19)
                    {
                      while (1)
                      {
                        v12 = v20 + 1;
                        if (__OFADD__(v20, 1))
                          goto LABEL_60;
                        if (v12 >= v62)
                          goto LABEL_54;
                        v19 = *(_QWORD *)(v61 + 8 * v12);
                        ++v20;
                        if (v19)
                          goto LABEL_26;
                      }
                    }
                    v12 = v20;
                  }
                }
              }
            }
          }
LABEL_26:
          v11 = (v19 - 1) & v19;
          v17 = __clz(__rbit64(v19)) + (v12 << 6);
        }
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v17);
        v22 = (double *)(*(_QWORD *)(a1 + 56) + 16 * v17);
        v23 = *v22;
        v24 = v22[1];
        v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, v21);
        v26 = objc_msgSend((id)objc_opt_self(), *a2, v23, v24);
        if (v26)
        {
          v32 = v26;
          if (v14)
          {
            v33 = sub_21155BA18();
            if (__OFADD__(v33, 1))
            {
LABEL_57:
              __break(1u);
              goto LABEL_58;
            }
            v13 = sub_211552DC0(v15, v33 + 1);
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v36 = sub_211553240((uint64_t)v25);
          v37 = *(_QWORD *)(v13 + 16);
          v38 = (v35 & 1) == 0;
          v39 = v37 + v38;
          if (!__OFADD__(v37, v38))
          {
            v40 = v35;
            if (*(_QWORD *)(v13 + 24) >= v39)
            {
              a2 = v60;
              if ((isUniquelyReferenced_nonNull_native & 1) != 0)
              {
LABEL_44:
                if ((v40 & 1) != 0)
                {
                  v49 = *(_QWORD *)(v13 + 56);
                  v50 = *(void **)(v49 + 8 * v36);
                  *(_QWORD *)(v49 + 8 * v36) = v32;

                }
                else
                {
                  *(_QWORD *)(v13 + 8 * (v36 >> 6) + 64) |= 1 << v36;
                  v51 = 8 * v36;
                  *(_QWORD *)(*(_QWORD *)(v13 + 48) + v51) = v25;
                  *(_QWORD *)(*(_QWORD *)(v13 + 56) + v51) = v32;
                  v52 = *(_QWORD *)(v13 + 16);
                  v53 = __OFADD__(v52, 1);
                  v54 = v52 + 1;
                  if (v53)
                    goto LABEL_59;
                  *(_QWORD *)(v13 + 16) = v54;
                  v55 = v25;
                }

LABEL_52:
                swift_bridgeObjectRelease();
                goto LABEL_4;
              }
              sub_211553F04();
            }
            else
            {
              sub_2115532D4(v39, isUniquelyReferenced_nonNull_native);
              v41 = sub_211553240((uint64_t)v25);
              if ((v40 & 1) != (v42 & 1))
                goto LABEL_61;
              v36 = v41;
            }
            a2 = v60;
            goto LABEL_44;
          }
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        if (v14)
          break;
        swift_bridgeObjectRetain();
        v29 = sub_211553240((uint64_t)v25);
        v31 = v30;
        swift_bridgeObjectRelease();
        if ((v31 & 1) != 0)
        {
          a2 = v60;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_211553F04();
            a2 = v60;
          }

          v56 = *(void **)(*(_QWORD *)(v13 + 56) + 8 * v29);
          sub_211553B5C(v29, v13);

          goto LABEL_52;
        }

        a2 = v60;
      }
      v27 = v25;
      swift_bridgeObjectRetain();
      v28 = sub_21155BA24();

      if (v28)
        break;

      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    v43 = sub_21155BA18();
    v44 = sub_211552DC0(v15, v43);
    swift_retain();
    v45 = sub_211553240((uint64_t)v27);
    v47 = v46;
    swift_release();
    if ((v47 & 1) != 0)
    {

      v48 = *(void **)(*(_QWORD *)(v44 + 56) + 8 * v45);
      sub_211553B5C(v45, v44);

      swift_bridgeObjectRelease();
      v13 = v44;
      a2 = v60;
      continue;
    }
    break;
  }
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  sub_211554090(0, (unint64_t *)&qword_254AB8360);
  sub_21155BA9C();
  __break(1u);
}

void CLKDeviceMetrics.scaledValue(_:overrides:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  double v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  id v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  int64_t v53;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v53 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v9 = MEMORY[0x24BEE4B00];
  v52 = v4;
LABEL_6:
  while (2)
  {
    v11 = v9 & 0xC000000000000001;
    if (v9 < 0)
      v12 = v9;
    else
      v12 = v9 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      while (1)
      {
        if (v7)
        {
          v13 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          v14 = v13 | (v8 << 6);
        }
        else
        {
          v15 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_54;
          }
          if (v15 >= v53)
            goto LABEL_52;
          v16 = *(_QWORD *)(v4 + 8 * v15);
          ++v8;
          if (!v16)
          {
            v8 = v15 + 1;
            if (v15 + 1 >= v53)
              goto LABEL_52;
            v16 = *(_QWORD *)(v4 + 8 * v8);
            if (!v16)
            {
              v8 = v15 + 2;
              if (v15 + 2 >= v53)
                goto LABEL_52;
              v16 = *(_QWORD *)(v4 + 8 * v8);
              if (!v16)
              {
                v8 = v15 + 3;
                if (v15 + 3 >= v53)
                  goto LABEL_52;
                v16 = *(_QWORD *)(v4 + 8 * v8);
                if (!v16)
                {
                  v8 = v15 + 4;
                  if (v15 + 4 >= v53)
                    goto LABEL_52;
                  v16 = *(_QWORD *)(v4 + 8 * v8);
                  if (!v16)
                  {
                    v17 = v15 + 5;
                    if (v17 >= v53)
                    {
LABEL_52:
                      swift_release();
                      sub_211554090(0, (unint64_t *)&qword_254AB8360);
                      sub_2115540C8();
                      v50 = (void *)sub_21155B958();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v51, sel_scaledValue_withOverrides_, v50, a2);

                      return;
                    }
                    v16 = *(_QWORD *)(v4 + 8 * v17);
                    if (!v16)
                    {
                      while (1)
                      {
                        v8 = v17 + 1;
                        if (__OFADD__(v17, 1))
                          goto LABEL_58;
                        if (v8 >= v53)
                          goto LABEL_52;
                        v16 = *(_QWORD *)(v4 + 8 * v8);
                        ++v17;
                        if (v16)
                          goto LABEL_28;
                      }
                    }
                    v8 = v17;
                  }
                }
              }
            }
          }
LABEL_28:
          v7 = (v16 - 1) & v16;
          v14 = __clz(__rbit64(v16)) + (v8 << 6);
        }
        v18 = 8 * v14;
        v19 = *(double *)(*(_QWORD *)(a1 + 56) + v18);
        v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, *(_QWORD *)(*(_QWORD *)(a1 + 48) + v18));
        v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v19);
        if (v21)
        {
          v27 = v21;
          if (v11)
          {
            v28 = sub_21155BA18();
            if (__OFADD__(v28, 1))
            {
LABEL_55:
              __break(1u);
              goto LABEL_56;
            }
            v9 = sub_211553010(v12, v28 + 1);
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v31 = sub_211553240((uint64_t)v20);
          v32 = *(_QWORD *)(v9 + 16);
          v33 = (v30 & 1) == 0;
          v34 = v32 + v33;
          if (!__OFADD__(v32, v33))
          {
            v35 = v30;
            if (*(_QWORD *)(v9 + 24) >= v34)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                sub_211554120();
            }
            else
            {
              sub_211553580(v34, isUniquelyReferenced_nonNull_native);
              v36 = sub_211553240((uint64_t)v20);
              if ((v35 & 1) != (v37 & 1))
                goto LABEL_59;
              v31 = v36;
            }
            v4 = v52;
            if ((v35 & 1) != 0)
            {
              v10 = *(_QWORD *)(v9 + 56);

              *(_QWORD *)(v10 + 8 * v31) = v27;
            }
            else
            {
              *(_QWORD *)(v9 + 8 * (v31 >> 6) + 64) |= 1 << v31;
              v44 = 8 * v31;
              *(_QWORD *)(*(_QWORD *)(v9 + 48) + v44) = v20;
              *(_QWORD *)(*(_QWORD *)(v9 + 56) + v44) = v27;
              v45 = *(_QWORD *)(v9 + 16);
              v46 = __OFADD__(v45, 1);
              v47 = v45 + 1;
              if (v46)
                goto LABEL_57;
              *(_QWORD *)(v9 + 16) = v47;
              v48 = v20;
            }
LABEL_5:

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11)
          break;
        swift_bridgeObjectRetain();
        v24 = sub_211553240((uint64_t)v20);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_211554120();

          v49 = *(void **)(*(_QWORD *)(v9 + 56) + 8 * v24);
          sub_211553B5C(v24, v9);

          goto LABEL_5;
        }

      }
      v22 = v20;
      swift_bridgeObjectRetain();
      v23 = sub_21155BA24();

      if (v23)
        break;

      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    v38 = sub_21155BA18();
    v39 = sub_211553010(v12, v38);
    swift_retain();
    v40 = sub_211553240((uint64_t)v22);
    v42 = v41;
    swift_release();
    if ((v42 & 1) != 0)
    {

      v43 = *(void **)(*(_QWORD *)(v39 + 56) + 8 * v40);
      sub_211553B5C(v40, v39);

      swift_bridgeObjectRelease();
      v9 = v39;
      continue;
    }
    break;
  }
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  sub_211554090(0, (unint64_t *)&qword_254AB8360);
  sub_21155BA9C();
  __break(1u);
}

id CLKDeviceMetrics.with(roundingBehavior:_:)(uint64_t a1, void (*a2)(id))
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_roundingBehavior);
  a2(objc_msgSend(v2, sel_setRoundingBehavior_, a1));
  return objc_msgSend(v2, sel_setRoundingBehavior_, v5);
}

id CLKDeviceMetrics.value(luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:)(double a1, double a2, double a3, double a4)
{
  void *v4;

  return objc_msgSend(v4, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_, 0.0, 0.0, a1, a2, a3, a4);
}

id CLKDeviceMetrics.value(luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  void *v7;

  return objc_msgSend(v7, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_agave_avoniaCompact_avoniaRegular_, 0.0, 0.0, a1, a2, a3, a4, a5, a6, *(_QWORD *)&a7);
}

id CLKDeviceMetrics.value(luxoCompact:aloeCompact:luxoRegular:aloeRegular:agave:)(double a1, double a2, double a3, double a4)
{
  void *v4;

  return objc_msgSend(v4, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_, 0.0, 0.0, a1, a3, a2, a4);
}

id CLKDeviceMetrics.value(luxoCompact:aloeCompact:luxoRegular:aloeRegular:agave:avoniaCompact:avoniaRegular:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  void *v7;

  return objc_msgSend(v7, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_agave_avoniaCompact_avoniaRegular_, 0.0, 0.0, a1, a3, a2, a4, a5, a6, *(_QWORD *)&a7);
}

uint64_t sub_211552DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8388);
    v2 = sub_21155BA60();
    v18 = v2;
    sub_21155BA0C();
    v3 = sub_21155BA30();
    if (v3)
    {
      v4 = v3;
      sub_211554090(0, (unint64_t *)&qword_254AB8360);
      do
      {
        swift_dynamicCast();
        sub_211554090(0, &qword_254AB8368);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_2115532D4(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_21155B9C4();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_21155BA30();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_211553010(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8380);
    v2 = sub_21155BA60();
    v18 = v2;
    sub_21155BA0C();
    v3 = sub_21155BA30();
    if (v3)
    {
      v4 = v3;
      sub_211554090(0, (unint64_t *)&qword_254AB8360);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_211553580(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_21155B9C4();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_21155BA30();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

unint64_t sub_211553240(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21155B9C4();
  return sub_211553D0C(a1, v2);
}

unint64_t sub_211553270(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21155BAA8();
  sub_21155B9A0();
  v4 = sub_21155BAC0();
  return sub_211553E24(a1, a2, v4);
}

uint64_t sub_2115532D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8388);
  v37 = a2;
  v6 = sub_21155BA54();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v36 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1))
          goto LABEL_38;
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          v3 = v36;
          if ((v37 & 1) != 0)
          {
            v35 = 1 << *(_BYTE *)(v5 + 32);
            if (v35 >= 64)
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            else
              *v9 = -1 << v35;
            *(_QWORD *)(v5 + 16) = 0;
          }
          break;
        }
        v24 = v9[v15];
        if (!v24)
        {
          v25 = v15 + 1;
          if (v15 + 1 >= v12)
            goto LABEL_31;
          v24 = v9[v25];
          if (!v24)
          {
            while (1)
            {
              v15 = v25 + 1;
              if (__OFADD__(v25, 1))
                break;
              if (v15 >= v12)
                goto LABEL_31;
              v24 = v9[v15];
              ++v25;
              if (v24)
                goto LABEL_20;
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v15 << 6);
      }
      v26 = 8 * v22;
      v27 = *(void **)(*(_QWORD *)(v5 + 48) + v26);
      v28 = *(void **)(*(_QWORD *)(v5 + 56) + v26);
      if ((v37 & 1) == 0)
      {
        v29 = v27;
        v30 = v28;
      }
      result = sub_21155B9C4();
      v16 = -1 << *(_BYTE *)(v7 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          v33 = v18 == v32;
          if (v18 == v32)
            v18 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 8 * v19;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v20) = v27;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v20) = v28;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_211553580(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8380);
  v6 = sub_21155BA54();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_21155B9C4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_211553850(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8378);
  v6 = a2;
  v7 = sub_21155BA54();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_211554304(v37, *((unint64_t *)&v37 + 1));
      }
      sub_21155BAA8();
      sub_21155B9A0();
      result = sub_21155BAC0();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v17 == v27;
          if (v17 == v27)
            v17 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

void sub_211553B5C(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_21155B9F4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_21155B9C4();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_211553D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_211554090(0, (unint64_t *)&qword_254AB8360);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_21155B9D0();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_21155B9D0();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_211553E24(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21155BA90() & 1) == 0)
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
      while (!v14 && (sub_21155BA90() & 1) == 0);
    }
  }
  return v6;
}

id sub_211553F04()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8388);
  v2 = *v0;
  v3 = sub_21155BA48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    if (!v21)
      break;
LABEL_23:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_211554090(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2115540C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254AB8370;
  if (!qword_254AB8370)
  {
    v1 = sub_211554090(255, (unint64_t *)&qword_254AB8360);
    result = MEMORY[0x212BDC134](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254AB8370);
  }
  return result;
}

id sub_211554120()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8380);
  v2 = *v0;
  v3 = sub_21155BA48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BDC11C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_211554304(uint64_t a1, unint64_t a2)
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

void *sub_211554348()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8378);
  v2 = *v0;
  v3 = sub_21155BA48();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (void *)sub_211554304(v24, *((unint64_t *)&v24 + 1));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t static Interpolatable.interpolate(start:end:fraction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;

  v30 = a4;
  v31 = a5;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - v14;
  v16 = sub_21155B9DC();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v20 = (char *)&v30 - v19;
  v21 = (char *)&v30 + *(int *)(v18 + 48) - v19;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v22((char *)&v30 - v19, a1, v16);
  v22(v21, a2, v16);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(a2) = v23(v20, 1, a3);
  v24 = v23(v21, 1, a3);
  if ((_DWORD)a2 != 1)
  {
    v27 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    if (v24 == 1)
    {
      v26 = v31;
      v27(v31, v20, a3);
    }
    else
    {
      v27((uint64_t)v15, v20, a3);
      v27((uint64_t)v13, v21, a3);
      v26 = v31;
      (*(void (**)(char *, char *, uint64_t, double))(v30 + 8))(v15, v13, a3, a6);
      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v13, a3);
      v28(v15, a3);
    }
    goto LABEL_8;
  }
  if (v24 != 1)
  {
    v26 = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v31, v21, a3);
LABEL_8:
    v25 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v26, v25, 1, a3);
  }
  v25 = 1;
  v26 = v31;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v26, v25, 1, a3);
}

uint64_t static Interpolatable.trilinearInterpolation(a:b:c:x:y:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v16 = sub_21155B9DC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v25 - v21;
  static Interpolatable.interpolate(start:end:fraction:)(a1, a2, a4, a5, (uint64_t)&v25 - v21, a7);
  static Interpolatable.interpolate(start:end:fraction:)(a2, a3, a4, a5, (uint64_t)v20, a7);
  static Interpolatable.interpolate(start:end:fraction:)((uint64_t)v22, (uint64_t)v20, a4, a5, a6, a8);
  v23 = *(void (**)(char *, uint64_t))(v17 + 8);
  v23(v20, v16);
  return ((uint64_t (*)(char *, uint64_t))v23)(v22, v16);
}

uint64_t static CGSize.interpolate(start:end:fraction:)()
{
  return sub_211554878(CLKInterpolateBetweenSizes);
}

void sub_211554860(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  sub_211554888(a1, a2, CLKInterpolateBetweenSizes, a3, a4);
}

uint64_t static CGPoint.interpolate(start:end:fraction:)()
{
  return sub_211554878(CLKInterpolateBetweenPoints);
}

void sub_21155487C(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  sub_211554888(a1, a2, CLKInterpolateBetweenPoints, a3, a4);
}

void sub_211554888(double *a1@<X0>, double *a2@<X1>, double (*a3)(double, double, double, double, double)@<X4>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v6;

  *(double *)a4 = a3(*a1, a1[1], *a2, a2[1], a5);
  *(_QWORD *)(a4 + 8) = v6;
}

void sub_2115548BC(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>, double a4@<D0>)
{
  *a3 = CLKInterpolateBetweenFloatsClipped(*a1, *a2, a4);
}

id static UIColor.interpolate(start:end:fraction:)(void *a1, void *a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13[2];

  v13[1] = *(double *)MEMORY[0x24BDAC8D0];
  v12 = 0.0;
  v13[0] = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, v13, &v12, &v11, &v10);
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(a2, sel_getRed_green_blue_alpha_, &v9, &v8, &v7, &v6);
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (1.0 - a3) * v13[0] + v9 * a3, (1.0 - a3) * v12 + v8 * a3, (1.0 - a3) * v11 + v7 * a3, (1.0 - a3) * v10 + v6 * a3);
}

id sub_211554A20@<X0>(void **a1@<X0>, void **a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>)
{
  id result;

  result = static UIColor.interpolate(start:end:fraction:)(*a1, *a2, a4);
  *a3 = result;
  return result;
}

uint64_t dispatch thunk of static Interpolatable.interpolate(start:end:fraction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

NSArray *sub_211554A58@<X0>(NSArray **a1@<X8>)
{
  NSArray *result;

  result = _sSo21CLKComplicationFamilyV8ClockKitE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t static CLKWidgetConstants.Redaction.firstLineLength.getter()
{
  return 16;
}

uint64_t static CLKWidgetConstants.Redaction.secondLineLength.getter()
{
  return 11;
}

uint64_t static CLKWidgetConstants.Redaction.shortFirstLineLength.getter()
{
  return 11;
}

uint64_t static CLKWidgetConstants.Redaction.shortSecondLineLength.getter()
{
  return 7;
}

char *sub_211554A9C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_211557444(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

NSArray *_sSo21CLKComplicationFamilyV8ClockKitE8allCasesSayABGvgZ_0()
{
  NSArray *result;
  NSArray *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  result = CLKAllComplicationFamilies();
  if (!result)
    goto LABEL_17;
  v1 = result;
  sub_211554CFC();
  v2 = sub_21155B9AC();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21155BA3C();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
    return (NSArray *)MEMORY[0x24BEE4AF8];
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_14;
LABEL_4:
  v11 = MEMORY[0x24BEE4AF8];
  result = (NSArray *)sub_211554A9C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v5 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x212BDB780](v4, v2);
      else
        v6 = *(id *)(v2 + 8 * v4 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_integerValue);

      v10 = *(_QWORD *)(v11 + 16);
      v9 = *(_QWORD *)(v11 + 24);
      if (v10 >= v9 >> 1)
        sub_211554A9C((char *)(v9 > 1), v10 + 1, 1);
      ++v4;
      *(_QWORD *)(v11 + 16) = v10 + 1;
      *(_QWORD *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
    return (NSArray *)v5;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_211554C4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254AB8390;
  if (!qword_254AB8390)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254AB8398);
    result = MEMORY[0x212BDC134](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254AB8390);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BDC128](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CLKWidgetConstants()
{
  return &type metadata for CLKWidgetConstants;
}

ValueMetadata *type metadata accessor for CLKWidgetConstants.Redaction()
{
  return &type metadata for CLKWidgetConstants.Redaction;
}

unint64_t sub_211554CFC()
{
  unint64_t result;

  result = qword_254AB8360;
  if (!qword_254AB8360)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254AB8360);
  }
  return result;
}

uint64_t KeyedHashingEncoder.requiresSecureCoding.getter()
{
  return 0;
}

Swift::Void __swiftcall KeyedHashingEncoder.finishEncoding()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
}

uint64_t KeyedHashingEncoder.encodedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v27 = sub_21155B928();
  v1 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_21155B994();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21155B94C();
  v24 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
  sub_21155B940();
  v8 = (uint64_t *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  v9 = *v8;
  swift_bridgeObjectRetain_n();
  v10 = sub_2115576C4(v9);
  swift_bridgeObjectRelease();
  v36 = v10;
  sub_21155765C(&v36);
  v23 = 0;
  v26 = v1;
  swift_bridgeObjectRelease();
  v28 = v36;
  v11 = v36[2];
  if (v11)
  {
    v29 = v5;
    v30 = v7;
    v34 = v11;
    v12 = v28[6];
    v13 = v28[7];
    swift_bridgeObjectRetain();
    sub_211554304(v12, v13);
    v14 = v31;
    sub_21155B988();
    sub_21155B97C();
    v16 = v15;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
    if (v16 >> 60 != 15)
      __asm { BR              X9 }
    __break(1u);
  }
  swift_release();
  v17 = v25;
  sub_21155B934();
  v18 = v27;
  v37 = v27;
  v38 = sub_211557814(&qword_254AB83B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC62D8]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
  v20 = v26;
  (*(void (**)(uint64_t *, char *, uint64_t))(v26 + 16))(boxed_opaque_existential_1, v17, v18);
  __swift_project_boxed_opaque_existential_0(&v36, v37);
  sub_21155B8D4();
  v21 = v35;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  return v21;
}

BOOL sub_2115556A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2115556BC()
{
  sub_21155BAA8();
  sub_21155BAB4();
  return sub_21155BAC0();
}

uint64_t sub_211555700()
{
  return sub_21155BAB4();
}

uint64_t sub_211555728()
{
  sub_21155BAA8();
  sub_21155BAB4();
  return sub_21155BAC0();
}

unint64_t sub_211555768(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8378);
  v2 = (_QWORD *)sub_21155BA6C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_211554304(v7, v8);
    result = sub_211553270(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
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

uint64_t KeyedHashingEncoder.isFinished.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state);
}

void KeyedHashingEncoder.encodeValue(ofObjCType:at:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)*MEMORY[0x24BDD0E18];
  v1 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v2 = v0;
  v3 = (void *)sub_21155B964();
  v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

void KeyedHashingEncoder.encode(_:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)*MEMORY[0x24BDD0E18];
  v1 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v2 = v0;
  v3 = (void *)sub_21155B964();
  v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)*MEMORY[0x24BDD0E18];
  v1 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v2 = v0;
  v3 = (void *)sub_21155B964();
  v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

uint64_t KeyedHashingEncoder.encodeRootObject(_:)(uint64_t a1)
{
  _BYTE v2[32];

  sub_211557904(a1, (uint64_t)v2);
  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v2, 0xD000000000000021, 0x800000021156A000);
  return sub_211557940((uint64_t)v2);
}

uint64_t KeyedHashingEncoder.encode(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  objc_class *v9;
  _BYTE *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char isUniquelyReferenced_nonNull_native;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  _OWORD v32[2];

  v4 = v3;
  ObjectType = swift_getObjectType();
  if ((*(_BYTE *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v25 = (void *)sub_21155B964();
    v26 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
LABEL_13:
    v27 = (void *)sub_21155B964();
    v28 = objc_msgSend(v26, sel_initWithName_reason_userInfo_, v25, v27, 0);

    objc_msgSend(v28, sel_raise);
    abort();
  }
  v9 = (objc_class *)ObjectType;
  sub_211557980(a1, (uint64_t)&v30);
  if (!v31)
  {
    sub_211557940((uint64_t)&v30);
    swift_bridgeObjectRetain();
    v13 = sub_21155883C(byte_24CBFB760, 16);
    v15 = v14;
    v16 = (_QWORD *)(v4 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v30 = *v16;
    *v16 = 0x8000000000000000;
    sub_2115572D0(v13, v15, a2, a3, isUniquelyReferenced_nonNull_native);
    *v16 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  sub_2115588E8(&v30, v32);
  v10 = objc_msgSend(objc_allocWithZone(v9), sel_init);
  sub_211557904((uint64_t)v32, (uint64_t)&v30);
  v11 = sub_2115588F8();
  if (!swift_dynamicCast())
    goto LABEL_11;
  v12 = (void *)v29;
  if (objc_msgSend((id)v29, sel_replacementObjectForCoder_, v10))
  {
    sub_21155B9E8();
    swift_unknownObjectRelease();
    sub_2115588E8(&v29, &v30);
  }
  else
  {
    v31 = v11;
    *(_QWORD *)&v30 = v29;
    v19 = (id)v29;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB83D0);
  if (!swift_dynamicCast())
  {
LABEL_11:
    v25 = (void *)sub_21155B964();
    v26 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    goto LABEL_13;
  }
  objc_msgSend((id)v29, sel_encodeWithCoder_, v10);
  v10[OBJC_IVAR___CLKKeyedHashingEncoder_state] = 1;
  swift_bridgeObjectRetain();
  v20 = KeyedHashingEncoder.encodedData.getter();
  v22 = v21;
  v23 = (_QWORD *)(v4 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  v24 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v29 = *v23;
  *v23 = 0x8000000000000000;
  sub_2115572D0(v20, v22, a2, a3, v24);
  *v23 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
}

uint64_t KeyedHashingEncoder.allowsKeyedCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Bool _, Swift::String forKey)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v6;
  char isUniquelyReferenced_nonNull_native;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  if ((*(_BYTE *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v8 = (void *)sub_21155B964();
    v9 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v10 = (void *)sub_21155B964();
    v11 = objc_msgSend(v9, sel_initWithName_reason_userInfo_, v8, v10, 0);

    objc_msgSend(v11, sel_raise);
    abort();
  }
  object = forKey._object;
  countAndFlagsBits = forKey._countAndFlagsBits;
  v6 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v6;
  *v6 = 0x8000000000000000;
  sub_2115572D0(_, 0x1000000000000, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  *v6 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t _s8ClockKit19KeyedHashingEncoderC10encodeCInt_6forKeyys5Int32V_SStF_0(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char isUniquelyReferenced_nonNull_native;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unsigned int __src;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v12 = (void *)sub_21155B964();
    v13 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v14 = (void *)sub_21155B964();
    v15 = objc_msgSend(v13, sel_initWithName_reason_userInfo_, v12, v14, 0);

    objc_msgSend(v15, sel_raise);
    abort();
  }
  __src = bswap32(a1);
  swift_bridgeObjectRetain();
  v6 = sub_21155877C(&__src, v18);
  v8 = v7 & 0xFFFFFFFFFFFFFFLL;
  v9 = (uint64_t *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v9;
  *v9 = 0x8000000000000000;
  sub_2115572D0(v6, v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_21155656C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char isUniquelyReferenced_nonNull_native;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t __src;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v12 = (void *)sub_21155B964();
    v13 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v14 = (void *)sub_21155B964();
    v15 = objc_msgSend(v13, sel_initWithName_reason_userInfo_, v12, v14, 0);

    objc_msgSend(v15, sel_raise);
    abort();
  }
  __src = bswap64(a1);
  swift_bridgeObjectRetain();
  v6 = sub_21155877C(&__src, v18);
  v8 = v7 & 0xFFFFFFFFFFFFFFLL;
  v9 = (uint64_t *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v9;
  *v9 = 0x8000000000000000;
  sub_2115572D0(v6, v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Int _, Swift::String forKey)
{
  sub_21155656C(_, forKey._countAndFlagsBits, (uint64_t)forKey._object);
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Float _, Swift::String forKey)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  Swift::Float __src;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v10 = (void *)sub_21155B964();
    v11 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v12 = (void *)sub_21155B964();
    v13 = objc_msgSend(v11, sel_initWithName_reason_userInfo_, v10, v12, 0);

    objc_msgSend(v13, sel_raise);
    abort();
  }
  object = forKey._object;
  countAndFlagsBits = forKey._countAndFlagsBits;
  __src = _;
  swift_bridgeObjectRetain();
  v5 = sub_21155877C(&__src, v16);
  v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  v8 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *v8;
  *v8 = 0x8000000000000000;
  sub_2115572D0(v5, v7, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  *v8 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Double _, Swift::String forKey)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  Swift::Double __src;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v10 = (void *)sub_21155B964();
    v11 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v12 = (void *)sub_21155B964();
    v13 = objc_msgSend(v11, sel_initWithName_reason_userInfo_, v10, v12, 0);

    objc_msgSend(v13, sel_raise);
    abort();
  }
  object = forKey._object;
  countAndFlagsBits = forKey._countAndFlagsBits;
  __src = _;
  swift_bridgeObjectRetain();
  v5 = sub_21155877C(&__src, v16);
  v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  v8 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *v8;
  *v8 = 0x8000000000000000;
  sub_2115572D0(v5, v7, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  *v8 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t KeyedHashingEncoder.encodeBytes(_:length:forKey:)(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = sub_21155B94C();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_21155B928();
  result = MEMORY[0x24BDAC7A8](v6);
  if ((*(_BYTE *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state) & 1) != 0)
  {
    v10 = (void *)sub_21155B964();
    v11 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
    v12 = (void *)sub_21155B964();
    v13 = objc_msgSend(v11, sel_initWithName_reason_userInfo_, v10, v12, 0);

    objc_msgSend(v13, sel_raise);
    abort();
  }
  if (a1)
  {
    sub_21155883C(a1, a2);
    v9 = v8;
    sub_211557814(&qword_254AB83B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    sub_21155B91C();
    __asm { BR              X10 }
  }
  return result;
}

void KeyedHashingEncoder.encodeConditionalObject(_:forKey:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)*MEMORY[0x24BDD0E18];
  v1 = objc_allocWithZone(MEMORY[0x24BDBCE88]);
  v2 = v0;
  v3 = (void *)sub_21155B964();
  v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

id KeyedHashingEncoder.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2115572D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_211553270(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_211554348();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;
      result = sub_2115577D0(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
      *(_QWORD *)v21 = a1;
      *(_QWORD *)(v21 + 8) = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_211553850(v17, a5 & 1);
  v23 = sub_211553270(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21155BA9C();
  __break(1u);
  return result;
}

char *sub_211557444(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254AB8420);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_21155753C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8408);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8410);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21155765C(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_211558768(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_2115579C8(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_2115576C4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8408);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 1;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  v6 = sub_21155847C(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_211558C14();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_2115577A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_211554304(a1, a2);
  return a1;
}

uint64_t sub_2115577BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2115577D0(a1, a2);
  return a1;
}

uint64_t sub_2115577D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_211557814(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BDC134](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_BYTE *sub_211557890@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_21155877C(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_211558B1C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_211558B94((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_211557904(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_211557940(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB83C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_211557980(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AB83C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2115579C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  char v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;

  v3 = a1[1];
  result = sub_21155BA78();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_211558074(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v103 = result;
  v100 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v106 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_117:
      result = v10;
      v102 = v7;
      if (v11 >= 2)
      {
        v92 = *v100;
        do
        {
          v93 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v92)
            goto LABEL_159;
          v94 = result;
          v95 = *(_QWORD *)(result + 32 + 16 * v93);
          v96 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_211558144((char *)(v92 + 32 * v95), (char *)(v92 + 32 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v92 + 32 * v96, v106);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_211558468(v94);
            v94 = result;
          }
          if (v93 >= *(_QWORD *)(v94 + 16))
            goto LABEL_148;
          v97 = (_QWORD *)(v94 + 32 + 16 * v93);
          *v97 = v95;
          v97[1] = v96;
          v98 = *(_QWORD *)(v94 + 16);
          if (v11 > v98)
            goto LABEL_149;
          memmove((void *)(v94 + 32 + 16 * (v11 - 1)), (const void *)(v94 + 32 + 16 * v11), 16 * (v98 - v11));
          result = v94;
          *(_QWORD *)(v94 + 16) = v98 - 1;
          v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v102 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8410);
    result = sub_21155B9B8();
    *(_QWORD *)(result + 16) = v6;
    v102 = result;
    v106 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v101 = *a1 + 8;
  v99 = *a1 - 32;
  v10 = MEMORY[0x24BEE4AF8];
  v104 = v3;
  v105 = v9;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 32 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_21155BA90();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v101 + 32 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_21155BA90();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 4;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 32 * v18;
        v24 = 32 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = (_OWORD *)(v9 + v24);
            v28 = v9 + v23;
            v29 = *(_QWORD *)(v9 + v24);
            v30 = *(_QWORD *)(v9 + v24 + 8);
            v31 = *(_OWORD *)(v9 + v24 + 16);
            v32 = *(_OWORD *)(v9 + v23 - 16);
            *v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(_QWORD *)(v28 - 32) = v29;
            *(_QWORD *)(v28 - 24) = v30;
            *(_OWORD *)(v28 - 16) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v103)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_211558370(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v43 = *(_QWORD *)(v10 + 16);
    v42 = *(_QWORD *)(v10 + 24);
    v11 = v43 + 1;
    if (v43 >= v42 >> 1)
    {
      result = (uint64_t)sub_211558370((char *)(v42 > 1), v43 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v44 = v10 + 32;
    v45 = (uint64_t *)(v10 + 32 + 16 * v43);
    *v45 = v12;
    v45[1] = v8;
    if (v43)
    {
      v9 = v105;
      while (1)
      {
        v46 = v11 - 1;
        if (v11 >= 4)
        {
          v51 = v44 + 16 * v11;
          v52 = *(_QWORD *)(v51 - 64);
          v53 = *(_QWORD *)(v51 - 56);
          v57 = __OFSUB__(v53, v52);
          v54 = v53 - v52;
          if (v57)
            goto LABEL_134;
          v56 = *(_QWORD *)(v51 - 48);
          v55 = *(_QWORD *)(v51 - 40);
          v57 = __OFSUB__(v55, v56);
          v49 = v55 - v56;
          v50 = v57;
          if (v57)
            goto LABEL_135;
          v58 = v11 - 2;
          v59 = (uint64_t *)(v44 + 16 * (v11 - 2));
          v61 = *v59;
          v60 = v59[1];
          v57 = __OFSUB__(v60, v61);
          v62 = v60 - v61;
          if (v57)
            goto LABEL_136;
          v57 = __OFADD__(v49, v62);
          v63 = v49 + v62;
          if (v57)
            goto LABEL_138;
          if (v63 >= v54)
          {
            v81 = (uint64_t *)(v44 + 16 * v46);
            v83 = *v81;
            v82 = v81[1];
            v57 = __OFSUB__(v82, v83);
            v84 = v82 - v83;
            if (v57)
              goto LABEL_144;
            v74 = v49 < v84;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v75 = *(_QWORD *)(v10 + 32);
            v76 = *(_QWORD *)(v10 + 40);
            v57 = __OFSUB__(v76, v75);
            v68 = v76 - v75;
            v69 = v57;
            goto LABEL_98;
          }
          v48 = *(_QWORD *)(v10 + 32);
          v47 = *(_QWORD *)(v10 + 40);
          v57 = __OFSUB__(v47, v48);
          v49 = v47 - v48;
          v50 = v57;
        }
        if ((v50 & 1) != 0)
          goto LABEL_137;
        v58 = v11 - 2;
        v64 = (uint64_t *)(v44 + 16 * (v11 - 2));
        v66 = *v64;
        v65 = v64[1];
        v67 = __OFSUB__(v65, v66);
        v68 = v65 - v66;
        v69 = v67;
        if (v67)
          goto LABEL_139;
        v70 = (uint64_t *)(v44 + 16 * v46);
        v72 = *v70;
        v71 = v70[1];
        v57 = __OFSUB__(v71, v72);
        v73 = v71 - v72;
        if (v57)
          goto LABEL_141;
        if (__OFADD__(v68, v73))
          goto LABEL_143;
        if (v68 + v73 >= v49)
        {
          v74 = v49 < v73;
LABEL_104:
          if (v74)
            v46 = v58;
          goto LABEL_106;
        }
LABEL_98:
        if ((v69 & 1) != 0)
          goto LABEL_140;
        v77 = (uint64_t *)(v44 + 16 * v46);
        v79 = *v77;
        v78 = v77[1];
        v57 = __OFSUB__(v78, v79);
        v80 = v78 - v79;
        if (v57)
          goto LABEL_142;
        if (v80 < v68)
          goto LABEL_15;
LABEL_106:
        v85 = v46 - 1;
        if (v46 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9)
          goto LABEL_157;
        v86 = v9;
        v87 = (uint64_t *)(v44 + 16 * v85);
        v88 = *v87;
        v89 = (_QWORD *)(v44 + 16 * v46);
        v90 = v89[1];
        result = sub_211558144((char *)(v86 + 32 * *v87), (char *)(v86 + 32 * *v89), v86 + 32 * v90, v106);
        if (v1)
          goto LABEL_114;
        if (v90 < v88)
          goto LABEL_131;
        if (v46 > *(_QWORD *)(v10 + 16))
          goto LABEL_132;
        *v87 = v88;
        *(_QWORD *)(v44 + 16 * v85 + 8) = v90;
        v91 = *(_QWORD *)(v10 + 16);
        if (v46 >= v91)
          goto LABEL_133;
        v11 = v91 - 1;
        result = (uint64_t)memmove((void *)(v44 + 16 * v46), v89 + 2, 16 * (v91 - 1 - v46));
        *(_QWORD *)(v10 + 16) = v91 - 1;
        v74 = v91 > 2;
        v9 = v105;
        if (!v74)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v105;
LABEL_15:
    v3 = v104;
    if (v8 >= v104)
    {
      v7 = v102;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v103))
    goto LABEL_153;
  if (v12 + v103 >= v3)
    v33 = v3;
  else
    v33 = v12 + v103;
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      v34 = v99 + 32 * v8;
      do
      {
        v35 = (uint64_t *)(v9 + 32 * v8);
        result = *v35;
        v36 = v35[1];
        v37 = v12;
        v38 = v34;
        do
        {
          if (result == *(_QWORD *)v38 && v36 == *(_QWORD *)(v38 + 8))
            break;
          result = sub_21155BA90();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *(_QWORD *)(v38 + 32);
          v36 = *(_QWORD *)(v38 + 40);
          v40 = *(_OWORD *)(v38 + 48);
          v41 = *(_OWORD *)(v38 + 16);
          *(_OWORD *)(v38 + 32) = *(_OWORD *)v38;
          *(_OWORD *)(v38 + 48) = v41;
          *(_QWORD *)v38 = result;
          *(_QWORD *)(v38 + 8) = v36;
          *(_OWORD *)(v38 + 16) = v40;
          v38 -= 32;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 32;
      }
      while (v8 != v33);
      v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_211558074(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 32 * a3 - 32;
LABEL_5:
    v9 = (uint64_t *)(v7 + 32 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = v8;
    while (1)
    {
      v13 = result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8);
      if (v13 || (result = sub_21155BA90(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *(_QWORD *)(v12 + 32);
      v10 = *(_QWORD *)(v12 + 40);
      v14 = *(_OWORD *)(v12 + 48);
      v15 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
      *(_OWORD *)(v12 + 48) = v15;
      *(_QWORD *)v12 = result;
      *(_QWORD *)(v12 + 8) = v10;
      *(_OWORD *)(v12 + 16) = v14;
      v12 -= 32;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_211558144(char *__dst, char *__src, unint64_t a3, char *a4)
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
  BOOL v15;
  char *v16;
  __int128 v17;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  __int128 v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 31;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 5;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 31;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 5;
  if (v10 >= v12 >> 5)
  {
    if (a4 != __src || &__src[32 * v13] <= a4)
      memmove(a4, __src, 32 * v13);
    v14 = &v4[32 * v13];
    if (v7 >= v6 || v11 < 32)
      goto LABEL_48;
    v18 = (char *)(a3 - 32);
    while (1)
    {
      v19 = v18 + 32;
      v20 = v6 - 32;
      v21 = *((_QWORD *)v14 - 4) == *((_QWORD *)v6 - 4) && *((_QWORD *)v14 - 3) == *((_QWORD *)v6 - 3);
      if (v21 || (sub_21155BA90() & 1) == 0)
      {
        v20 = v14 - 32;
        if (v19 != v14)
        {
          v14 -= 32;
LABEL_45:
          v23 = *((_OWORD *)v20 + 1);
          *(_OWORD *)v18 = *(_OWORD *)v20;
          *((_OWORD *)v18 + 1) = v23;
          goto LABEL_46;
        }
        v22 = v18 >= v14;
        v14 -= 32;
        if (v22)
          goto LABEL_45;
      }
      else
      {
        if (v19 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        v22 = v18 >= v6;
        v6 -= 32;
        if (v22)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v18 -= 32;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[32 * v10] <= a4)
    memmove(a4, __dst, 32 * v10);
  v14 = &v4[32 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_21155BA90() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 32;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 32;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 32;
    if (v15)
      goto LABEL_21;
LABEL_20:
    v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)v7 = *(_OWORD *)v16;
    *((_OWORD *)v7 + 1) = v17;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0])
    memmove(v6, v4, 32 * ((v14 - v4) / 32));
  return 1;
}

char *sub_211558370(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AB8418);
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

char *sub_211558468(uint64_t a1)
{
  return sub_211558370(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_21155847C(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v26 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = 16 * v15;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v15);
    v21 = v20[1];
    v22 = (uint64_t *)(*(_QWORD *)(a4 + 56) + v19);
    v24 = *v22;
    v23 = v22[1];
    *v10 = *v20;
    v10[1] = v21;
    v10[2] = v24;
    v10[3] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      sub_211554304(v24, v23);
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain();
    result = (_QWORD *)sub_211554304(v24, v23);
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v25;
      result = v26;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2115586A4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_21155B8A4();
  if (!result || (result = sub_21155B8BC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_21155B8B0();
      sub_21155B94C();
      sub_211557814(&qword_254AB83B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
      return sub_21155B904();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_211558768(_QWORD *a1)
{
  return sub_21155753C(0, a1[2], 0, a1);
}

uint64_t sub_21155877C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_21155883C(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_21155877C(__src, &__src[a2]);
  sub_21155B8C8();
  swift_allocObject();
  sub_21155B898();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_21155B8E0();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

_OWORD *sub_2115588E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2115588F8()
{
  unint64_t result;

  result = qword_254AB83C8;
  if (!qword_254AB83C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254AB83C8);
  }
  return result;
}

uint64_t type metadata accessor for KeyedHashingEncoder()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KeyedHashingEncoder.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for KeyedHashingEncoder.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211558A3C + 4 * byte_211565F75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_211558A70 + 4 * asc_211565F70[v4]))();
}

uint64_t sub_211558A70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211558A78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211558A80);
  return result;
}

uint64_t sub_211558A8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211558A94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_211558A98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211558AA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211558AAC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_211558AB8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KeyedHashingEncoder.State()
{
  return &type metadata for KeyedHashingEncoder.State;
}

unint64_t sub_211558AD8()
{
  unint64_t result;

  result = qword_254AB8400;
  if (!qword_254AB8400)
  {
    result = MEMORY[0x212BDC134](&unk_211566010, &type metadata for KeyedHashingEncoder.State);
    atomic_store(result, (unint64_t *)&qword_254AB8400);
  }
  return result;
}

uint64_t sub_211558B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21155B8C8();
  swift_allocObject();
  result = sub_21155B898();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21155B8E0();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_211558B94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21155B8C8();
  swift_allocObject();
  result = sub_21155B898();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_211558C14()
{
  return swift_release();
}

void CLKPIDIsBeingDebugged_cold_1()
{
  __assert_rtn("CLKPIDIsBeingDebugged", "CLKDefines.m", 428, "junk == 0");
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return -[CLKIntentReference initWithIntent:].cold.1(v0, v1, v2);
}

void _ValidateTemplate_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CLKStringForComplicationFamily(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKStringForComplicationFamily(objc_msgSend(a2, "compatibleFamily"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_2114F4000, a3, OS_LOG_TYPE_FAULT, "Data handler called with incompatible template for complication family. Expected template for '%@', but received one for '%@'.", (uint8_t *)&v7, 0x16u);

}

uint64_t __getAVSynchronizedLayerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getAVPlayerLayerClass_block_invoke_cold_1();
}

uint64_t __getAVPlayerLayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVAudioSessionClass_block_invoke_cold_1(v0);
}

uint64_t __getAVAudioSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVQueuePlayerClass_block_invoke_cold_1(v0);
}

uint64_t __getAVQueuePlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVURLAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVURLAssetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVPlayerItemClass_block_invoke_cold_1(v0);
}

uint64_t __getAVPlayerItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CLKTimeIntervalTextProvider _validate].cold.1(v0);
}

void CLKRequestConcreteImplementation_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a3, (uint64_t)a3, "Error: %@", (uint8_t *)a2);

}

void _CLKGenerateSimulatedCrash_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, v3, "Simulated exception: %s", (uint8_t *)&v4);
}

uint64_t sub_21155B880()
{
  return MEMORY[0x24BDB4DE0]();
}

uint64_t sub_21155B88C()
{
  return MEMORY[0x24BDB4E90]();
}

uint64_t sub_21155B898()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_21155B8A4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21155B8B0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21155B8BC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21155B8C8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21155B8D4()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_21155B8E0()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21155B8EC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21155B8F8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21155B904()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_21155B910()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_21155B91C()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_21155B928()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_21155B934()
{
  return MEMORY[0x24BDC6AD8]();
}

uint64_t sub_21155B940()
{
  return MEMORY[0x24BDC6AF0]();
}

uint64_t sub_21155B94C()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_21155B958()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21155B964()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21155B970()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21155B97C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21155B988()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21155B994()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21155B9A0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21155B9AC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21155B9B8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21155B9C4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21155B9D0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21155B9DC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21155B9E8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21155B9F4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21155BA00()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21155BA0C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_21155BA18()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_21155BA24()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_21155BA30()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_21155BA3C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21155BA48()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21155BA54()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21155BA60()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_21155BA6C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21155BA78()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21155BA84()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21155BA90()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21155BA9C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21155BAA8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21155BAB4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21155BAC0()
{
  return MEMORY[0x24BEE4328]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x24BDBBD78](formatter);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x24BDC4920](font);
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x24BDC4948](font);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x24BDD9950]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x24BE6B498]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t UICeilToScale()
{
  return MEMORY[0x24BEBE038]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x24BEBE160]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x24BEBE610]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x24BEBE650]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BEBE660]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BEBE678]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BEBE688]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BEBE748]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFLocaleCopyAsIfCurrent()
{
  return MEMORY[0x24BDBCFF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x24BEDA360]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_read_extract()
{
  return MEMORY[0x24BEDA4A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x24BEDA4F8]();
}

uint64_t archive_read_support_filter_gzip()
{
  return MEMORY[0x24BEDA538]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x24BEDA550]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x24BDB0838]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

