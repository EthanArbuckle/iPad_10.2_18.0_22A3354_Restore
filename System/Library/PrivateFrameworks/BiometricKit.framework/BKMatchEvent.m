@implementation BKMatchEvent

+ (id)matchEventWithDictionary:(id)a3 device:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BKMatchEvent *v9;
  BKMatchEvent *v10;
  void *v11;
  void *v12;
  BKIdentity *v13;
  void *v14;
  BKIdentity *v15;
  BKMatchEvent *v16;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136316162;
    v20 = "dictionary";
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = &unk_1AF575226;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKMatchEvent.m";
    v27 = 1024;
    v28 = 17;
    goto LABEL_16;
  }
  v9 = objc_alloc_init(BKMatchEvent);
  if (!v9)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136316162;
    v20 = "matchEvent";
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = &unk_1AF575226;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKMatchEvent.m";
    v27 = 1024;
    v28 = 20;
LABEL_16:
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
LABEL_17:
    setError((id)1, a5);
    v10 = 0;
LABEL_19:
    v16 = 0;
    goto LABEL_5;
  }
  v10 = v9;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchEventTimeStamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKMatchEvent setTimeStamp:](v10, "setTimeStamp:", objc_msgSend(v11, "unsignedLongValue"));

  if (!-[BKMatchEvent timeStamp](v10, "timeStamp"))
  {
    setError((id)2, a5);
    goto LABEL_19;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchEventResult"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKMatchEvent setResult:](v10, "setResult:", objc_msgSend(v12, "BOOLValue"));

  v13 = [BKIdentity alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchEventMatchedIdentity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BKIdentity initWithServerIdentity:device:](v13, "initWithServerIdentity:device:", v14, v8);
  -[BKMatchEvent setMatchedIdentity:](v10, "setMatchedIdentity:", v15);

  v10 = v10;
  v16 = v10;
LABEL_5:

  return v16;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (BKIdentity)matchedIdentity
{
  return self->_matchedIdentity;
}

- (void)setMatchedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_matchedIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedIdentity, 0);
}

@end
