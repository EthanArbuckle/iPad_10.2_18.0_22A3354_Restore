void sub_2345951DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMADServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaAnalysisServicesLibrary();
  result = objc_getClass("MADService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMADServiceClass_block_invoke_cold_1();
  getMADServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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

uint64_t SCIsAnalyticsEnabled()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  __int128 *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v18 = 0;
  *((_QWORD *)&v18 + 1) = &v18;
  v19 = 0x2050000000;
  v0 = (void *)getSTCommunicationClientClass_softClass;
  v20 = getSTCommunicationClientClass_softClass;
  if (!getSTCommunicationClientClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getSTCommunicationClientClass_block_invoke;
    v16 = &unk_2505B7D20;
    v17 = &v18;
    __getSTCommunicationClientClass_block_invoke((uint64_t)buf);
    v0 = *(void **)(*((_QWORD *)&v18 + 1) + 24);
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v18, 8);
  v2 = objc_alloc_init(v1);
  v12 = 0;
  objc_msgSend(v2, "currentConfigurationWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isCommunicationSafetyAnalyticsEnabled");

    if ((v5 & 1) != 0)
      return 1;
  }
  else
  {
    if (v4)
    {
      +[SCLog client](SCLog, "client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        SCIsAnalyticsEnabled_cold_1((uint64_t)v4, v7);
    }
    else
    {
      +[SCLog client](SCLog, "client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_234593000, v7, OS_LOG_TYPE_DEFAULT, "Unavailable CommSafety configuration from ScreenTime", buf, 2u);
      }
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.communicationSafetySettings"));
  v9 = v8;
  if (v8)
  {
    v6 = objc_msgSend(v8, "BOOLForKey:", CFSTR("analyticsEnabled"));
  }
  else
  {
    +[SCLog client](SCLog, "client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18) = 138412290;
      *(_QWORD *)((char *)&v18 + 4) = CFSTR("com.apple.communicationSafetySettings");
      _os_log_impl(&dword_234593000, v10, OS_LOG_TYPE_DEFAULT, "Unable to access user preferences domain %@", (uint8_t *)&v18, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

void sub_234595958(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  id v17;
  NSObject *v18;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    +[SCLog client](SCLog, "client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_234593000, v18, OS_LOG_TYPE_DEFAULT, "Exception fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x234595888);
  }
  _Unwind_Resume(a1);
}

Class __getSTCommunicationClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STCommunicationClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTCommunicationClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSTCommunicationClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_234596190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_234596FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_23459731C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234597640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2345979E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234597D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2345980E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2345986A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234598760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMADImageSafetyClassificationRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaAnalysisServicesLibrary();
  result = objc_getClass("MADImageSafetyClassificationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1();
  getMADImageSafetyClassificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMADVideoSafetyClassificationRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaAnalysisServicesLibrary();
  result = objc_getClass("MADVideoSafetyClassificationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1();
  getMADVideoSafetyClassificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

int SCError(void)
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v10;
  _QWORD v11[2];

  v2 = v0;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1540];
  v4 = v1;
  v5 = [v3 alloc];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.SensitiveContentAnalysis"), v2, v6);
  return (int)v7;
}

id SCErrorCausedBy(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x24BDD1540];
    v7 = a2;
    v8 = [v6 alloc];
    v9 = *MEMORY[0x24BDD1398];
    v14[0] = *MEMORY[0x24BDD0FC8];
    v14[1] = v9;
    v15[0] = v7;
    v15[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.SensitiveContentAnalysis"), a1, v10);
  }
  else
  {
    v12 = a2;
    SCError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

id SCSensitivityAnalyzer.VideoAnalysisHandler.progress.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

void SCSensitivityAnalyzer.VideoAnalysisHandler.progress.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*SCSensitivityAnalyzer.VideoAnalysisHandler.progress.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.hasSensitiveContent()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = v0;
  return swift_task_switch();
}

uint64_t sub_234599024()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = v0[17];
  v2 = *(void **)(v1
                + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer);
  v3 = sub_234599BE8();
  v0[18] = v3;
  v0[14] = sub_234599248;
  v0[15] = v1;
  v4 = MEMORY[0x24BDAC760];
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 1107296256;
  v0[12] = sub_2345992D4;
  v0[13] = &block_descriptor;
  v5 = _Block_copy(v0 + 10);
  v0[19] = v5;
  swift_retain();
  swift_release();
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = sub_23459915C;
  v6 = swift_continuation_init();
  v0[10] = v4;
  v0[11] = 0x40000000;
  v0[12] = sub_234599328;
  v0[13] = &block_descriptor_1;
  v0[14] = v6;
  objc_msgSend(v2, sel_analyzeVideoFile_progressHandler_completionHandler_, v3, v5, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23459915C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2345991BC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  _Block_release(*(const void **)(v0 + 152));

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_2345991FC()
{
  uint64_t v0;
  const void *v1;
  void *v2;

  v1 = *(const void **)(v0 + 152);
  v2 = *(void **)(v0 + 144);
  swift_willThrow();
  _Block_release(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_234599248(double a1)
{
  uint64_t v1;
  id result;

  result = (id)swift_beginAccess();
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
    return objc_msgSend(*(id *)(v1 + 16), sel_setCompletedUnitCount_, (uint64_t)a1);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2345992D4(uint64_t a1, double a2)
{
  void (*v3)(uint64_t, double);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, double))(a1 + 32);
  v4 = swift_retain();
  v3(v4, a2);
  return swift_release();
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

uint64_t sub_234599328(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256166E28);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2345993B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  v7 = v6 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  v8 = sub_234599BF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a3, v8);
  *(_QWORD *)(v6 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer) = a2;
  return v6;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  v2 = sub_234599BF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer));
  return v0;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  v2 = sub_234599BF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer));
  return swift_deallocClassInstance();
}

uint64_t SCSensitivityAnalyzer.videoAnalysis(forFileAt:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v3 = sub_234599BF4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 100);
  objc_msgSend(v7, sel_setCompletedUnitCount_, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v8 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL, v6, v3);
  *(_QWORD *)(v8 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer) = v1;
  v9 = v1;
  return v8;
}

uint64_t type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler()
{
  uint64_t result;

  result = qword_256166E70;
  if (!qword_256166E70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_234599634()
{
  return type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler();
}

uint64_t sub_23459963C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_234599BF4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SCSensitivityAnalyzer.VideoAnalysisHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234940FBC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void SCIsAnalyticsEnabled_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_234593000, a2, OS_LOG_TYPE_ERROR, "Error fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getSTCommunicationClientClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[SCSensitivityAnalyzer _mapMOScanningPolicyEnumValue:].cold.1(v0);
}

void __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1(v0);
}

void __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1(v0);
}

void __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_234599BE8();
}

uint64_t sub_234599BE8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_234599BF4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

