@implementation CDLogging

void __30___CDLogging_knowledgeChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.knowledge", ");
  v1 = (void *)knowledgeChannel_knowledgeChannel;
  knowledgeChannel_knowledgeChannel = (uint64_t)v0;

  if (!knowledgeChannel_knowledgeChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __30___CDLogging_knowledgeChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32___CDLogging_interactionChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.interaction", ");
  v1 = (void *)interactionChannel_interactionChannel;
  interactionChannel_interactionChannel = (uint64_t)v0;

  if (!interactionChannel_interactionChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __32___CDLogging_interactionChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __34___CDLogging_mediaAnalysisChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.interaction", "mediaanalysis");
  v1 = (void *)mediaAnalysisChannel_mediaAnalysisChannel;
  mediaAnalysisChannel_mediaAnalysisChannel = (uint64_t)v0;

  if (!mediaAnalysisChannel_mediaAnalysisChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __34___CDLogging_mediaAnalysisChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __36___CDLogging_instrumentationChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.instrumentation", ");
  v1 = (void *)instrumentationChannel_instrumentationChannel;
  instrumentationChannel_instrumentationChannel = (uint64_t)v0;

  if (!instrumentationChannel_instrumentationChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __36___CDLogging_instrumentationChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __27___CDLogging_autoSUChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.autosu", ");
  v1 = (void *)autoSUChannel_autoSUChannel;
  autoSUChannel_autoSUChannel = (uint64_t)v0;

  if (!autoSUChannel_autoSUChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __27___CDLogging_autoSUChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __28___CDLogging_contextChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.context", ");
  v1 = (void *)contextChannel_contextChannel;
  contextChannel_contextChannel = (uint64_t)v0;

  if (!contextChannel_contextChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __28___CDLogging_contextChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38___CDLogging_spotlightReceiverChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.spotlightReceiver", ");
  v1 = (void *)spotlightReceiverChannel_spotlightReceiverChannel;
  spotlightReceiverChannel_spotlightReceiverChannel = (uint64_t)v0;

  if (!spotlightReceiverChannel_spotlightReceiverChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __38___CDLogging_spotlightReceiverChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35___CDLogging_dataCollectionChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.dataCollection", ");
  v1 = (void *)dataCollectionChannel_dataCollectionChannel;
  dataCollectionChannel_dataCollectionChannel = (uint64_t)v0;

  if (!dataCollectionChannel_dataCollectionChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __35___CDLogging_dataCollectionChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35___CDLogging_admissionCheckChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.admissionCheck", ");
  v1 = (void *)admissionCheckChannel_admissionCheckChannel;
  admissionCheckChannel_admissionCheckChannel = (uint64_t)v0;

  if (!admissionCheckChannel_admissionCheckChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __35___CDLogging_admissionCheckChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __33___CDLogging_communicatorChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.admissionCheck", "communicator");
  v1 = (void *)communicatorChannel_communicatorChannel;
  communicatorChannel_communicatorChannel = (uint64_t)v0;

  if (!communicatorChannel_communicatorChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __33___CDLogging_communicatorChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __25___CDLogging_syncChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.knowledge.sync", ");
  v1 = (void *)syncChannel_syncChannel;
  syncChannel_syncChannel = (uint64_t)v0;

  if (!syncChannel_syncChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __25___CDLogging_syncChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31___CDLogging_knowledgeSignpost__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.knowledge", "signpost");
  v1 = (void *)knowledgeSignpost_knowledgeSignpost;
  knowledgeSignpost_knowledgeSignpost = (uint64_t)v0;

  if (!knowledgeSignpost_knowledgeSignpost)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __31___CDLogging_knowledgeSignpost__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __33___CDLogging_interactionSignpost__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.coreduet.interaction", "signpost");
  v1 = (void *)interactionSignpost_interactionSignpost;
  interactionSignpost_interactionSignpost = (uint64_t)v0;

  if (!interactionSignpost_interactionSignpost)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __33___CDLogging_interactionSignpost__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

__CFString *__42___CDLogging_descriptionOfArray_redacted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(v3, "redactedDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("redacted");
  }

  return v4;
}

void __30___CDLogging_knowledgeChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t knowledgeChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __32___CDLogging_interactionChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t interactionChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __34___CDLogging_mediaAnalysisChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t mediaanalysis", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __36___CDLogging_instrumentationChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t instrumentationChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __27___CDLogging_autoSUChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t autoSUChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __28___CDLogging_contextChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t contextChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __38___CDLogging_spotlightReceiverChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t spotlightReceiverChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __35___CDLogging_dataCollectionChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t dataCollectionChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __35___CDLogging_admissionCheckChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t admissionCheckChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __33___CDLogging_communicatorChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t communicatorChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __25___CDLogging_syncChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t syncChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __31___CDLogging_knowledgeSignpost__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t knowledgeSignpost", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __33___CDLogging_interactionSignpost__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t interactionSignpost", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
