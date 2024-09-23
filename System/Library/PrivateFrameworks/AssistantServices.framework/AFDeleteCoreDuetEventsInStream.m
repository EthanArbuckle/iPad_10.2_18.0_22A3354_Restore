@implementation AFDeleteCoreDuetEventsInStream

void __AFDeleteCoreDuetEventsInStream_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(get_DKQueryClass(), "predicateForEventsWithStreamName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKEventStreamClass(), "eventStreamWithName:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AFFetchCoreDuetEventsWithStream(v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(get_DKKnowledgeStoreClass(), "knowledgeStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v5, "deleteObjects:error:", v4, &v10);
    v6 = v10;

    if (v6)
    {
      v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v12 = "AFDeleteCoreDuetEventsInStream_block_invoke";
        v13 = 2112;
        v14 = v9;
        _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Error deleting from duet: %@", buf, 0x16u);

      }
    }

  }
}

@end
