@implementation SFSafariSharingExtensionController

void __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v12)
  {
    (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v3, 0);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_DEFAULT, "completionHandler is nil, not doing anything with the result", v16, 2u);
    }
  }

}

void __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_50(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "Timed out waiting on JavaScript to return result", v14, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_50_cold_1(v4, v7, v8, v9, v10, v11, v12, v13);
  }
}

void __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "JavaScript returned result to client process", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_50_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Timeout timer fired, but a result was already returned", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
