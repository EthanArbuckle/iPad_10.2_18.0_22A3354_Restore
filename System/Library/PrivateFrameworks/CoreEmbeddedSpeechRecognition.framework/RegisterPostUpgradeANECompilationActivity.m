@implementation RegisterPostUpgradeANECompilationActivity

void ___RegisterPostUpgradeANECompilationActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:](CoreEmbeddedSpeechRecognizer, "compileAllAssetsWithType:completion:", 3, &__block_literal_global_198);
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "_RegisterPostUpgradeANECompilationActivity_block_invoke_2";
    _os_log_debug_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Done triggering post-upgrade ANE compilation", (uint8_t *)&v5, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[2](v3);
LABEL_4:

}

uint64_t ___RegisterPostUpgradeANECompilationActivity_block_invoke_3()
{
  +[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:](CoreEmbeddedSpeechRecognizer, "compileAllAssetsWithType:completion:", 7, 0);
  return +[CoreEmbeddedSpeechAnalyzer resetCache](CoreEmbeddedSpeechAnalyzer, "resetCache");
}

void ___RegisterPostUpgradeANECompilationActivity_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2;
  xpc_object_t v3;
  _xpc_activity_s *activity;

  activity = a2;
  v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80860], 1);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_activity_set_criteria(activity, v3);

  }
}

@end
