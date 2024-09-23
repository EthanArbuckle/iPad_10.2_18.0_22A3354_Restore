@implementation Z15tokenIsStopWordP13

int *___Z15tokenIsStopWordP13_LocalizationPK10__CFLocalePhi_block_invoke(int *result, uint64_t a2)
{
  int *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = result;
    v3 = *__error();
    v4 = _SILogForLogForCategory(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *((_QWORD *)v2 + 4);
      v6 = 136315650;
      v7 = "tokenIsStopWord_block_invoke";
      v8 = 1024;
      v9 = 1143;
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1B8270000, v4, OS_LOG_TYPE_ERROR, "%s:%d: [Pommes_Suggestions] error loading localization for %@", (uint8_t *)&v6, 0x1Cu);
    }
    result = __error();
    *result = v3;
  }
  return result;
}

int *___Z15tokenIsStopWordP13_LocalizationPK10__CFLocalePhi_block_invoke_8(int *result, uint64_t a2)
{
  int *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = result;
    v3 = *__error();
    v4 = _SILogForLogForCategory(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *((_QWORD *)v2 + 4);
      v6 = 136315650;
      v7 = "tokenIsStopWord_block_invoke";
      v8 = 1024;
      v9 = 1154;
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1B8270000, v4, OS_LOG_TYPE_ERROR, "%s:%d: [Pommes_Suggestions] error loading localization for %@", (uint8_t *)&v6, 0x1Cu);
    }
    result = __error();
    *result = v3;
  }
  return result;
}

@end
