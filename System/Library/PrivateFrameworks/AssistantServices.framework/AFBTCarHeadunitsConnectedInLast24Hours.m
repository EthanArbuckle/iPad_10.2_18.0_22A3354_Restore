@implementation AFBTCarHeadunitsConnectedInLast24Hours

void __AFBTCarHeadunitsConnectedInLast24Hours_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "AFBTCarHeadunitsConnectedInLast24Hours_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Error fetching BT events: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

@end
