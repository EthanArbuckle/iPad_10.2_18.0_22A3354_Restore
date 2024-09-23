@implementation AFLocalSetVolumeActionNoCheck

void ___AFLocalSetVolumeActionNoCheck_block_invoke(uint64_t a1, __CFError *a2)
{
  NSObject *v3;
  id v5;
  CFIndex Code;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFError *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextDaemon;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "_AFLocalSetVolumeActionNoCheck_block_invoke";
      v13 = 2112;
      v14 = a2;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Media Remote error %@", (uint8_t *)&v11, 0x16u);
    }
    v5 = objc_alloc(MEMORY[0x1E0D87FE8]);
    Code = CFErrorGetCode(a2);
    if ((unint64_t)(Code - 17) > 3)
      v7 = (_QWORD *)MEMORY[0x1E0D88EF0];
    else
      v7 = (_QWORD *)qword_1E3A34CF0[Code - 17];
    v8 = (id)objc_msgSend(v5, "initWithErrorCode:", *v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "_AFLocalSetVolumeActionNoCheck_block_invoke";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Media Remote reported success", (uint8_t *)&v11, 0xCu);
    }
    v8 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  }
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v9, 0);

}

@end
