@implementation AFUIRecordSiriBeginEndBiomeEvent

void ___AFUIRecordSiriBeginEndBiomeEvent_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0CDB0], "siriUIStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE0CD60]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SESSIONID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VIEWMODE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_24D7A4738;
  if (v7)
    v10 = (const __CFString *)v7;
  else
    v10 = &stru_24D7A4738;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BEA8560]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v9 = (const __CFString *)v11;
  v13 = objc_msgSend(*(id *)(a1 + 40), "hasSuffix:", CFSTR("end")) ^ 1;
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v14 = (void *)objc_msgSend(v3, "initWithSessionID:UUID:viewMode:dismissalReason:starting:absoluteTimeStamp:", v4, v5, v10, v9, v13);

  if (v14)
    objc_msgSend(v2, "sendEvent:", v14);

}

@end
