@implementation CDContextMonitorManager

void __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0D158A8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEventStreams");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke_2;
  v6[3] = &unk_1E26D55F0;
  v7 = v1;
  v2 = v1;
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)keyPathToEventStream;
  keyPathToEventStream = v3;

}

void __63___CDContextMonitorManager_initializeKeyPathEventStreamMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "eventStreamProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "knowledgeBaseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextMonitorManager cleanKBEventNameKey:](_CDContextMonitorManager, "cleanKBEventNameKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStreamProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);

}

@end
