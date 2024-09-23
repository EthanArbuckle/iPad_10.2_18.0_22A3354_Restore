@implementation CKVAnalytics

+ (void)sendDonateEvent:(unsigned __int16)a3 itemCount:(unint64_t)a4 appId:(id)a5 reason:(unsigned __int16)a6 result:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v7 = a7;
  v8 = a6;
  v10 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (v10)
  {
    v19[0] = CFSTR("type");
    CKVTaskIdDescription(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v19[1] = CFSTR("itemCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    v20[2] = v11;
    v19[2] = CFSTR("appId");
    v19[3] = CFSTR("reason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v14;
    v19[4] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16;
    AnalyticsSendEventLazy();

  }
  else
  {
    v18 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[CKVAnalytics sendDonateEvent:itemCount:appId:reason:result:]";
      _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s Cannot send event with undefined donate type", buf, 0xCu);
    }
  }

}

+ (void)sendDonateVerification:(unsigned __int16)a3 isConsistent:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v4 = a4;
  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("task");
  CKVTaskIdDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("isConsistent");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  AnalyticsSendEventLazy();

}

id __52__CKVAnalytics_sendDonateVerification_isConsistent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __62__CKVAnalytics_sendDonateEvent_itemCount_appId_reason_result___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
