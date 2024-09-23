@implementation _LTTextTranslationRequest

- (id)loggingType
{
  return CFSTR("text");
}

- (id)_paragraphRequestForText:(id)a3
{
  id v4;
  _LTParagraphTranslationRequest *v5;
  void *v6;
  _LTParagraphTranslationRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _LTParagraphTranslationRequest *v13;
  _LTParagraphTranslationRequest *v14;
  _LTParagraphTranslationRequest *v15;
  _QWORD v17[4];
  id v18;
  _LTTextTranslationRequest *v19;
  id v20;
  _LTParagraphTranslationRequest *v21;
  _QWORD *v22;
  _QWORD v23[4];

  v4 = a3;
  v5 = [_LTParagraphTranslationRequest alloc];
  -[_LTTranslationRequest localePair](self, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTTranslationRequest initWithLocalePair:](v5, "initWithLocalePair:", v6);

  -[_LTTranslationRequest setTaskHint:](v7, "setTaskHint:", -[_LTTranslationRequest taskHint](self, "taskHint"));
  objc_msgSend(v4, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTParagraphTranslationRequest setText:](v7, "setText:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v10 = objc_msgSend(v4, "length");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54___LTTextTranslationRequest__paragraphRequestForText___block_invoke;
  v17[3] = &unk_2506943F0;
  v22 = v23;
  v11 = v4;
  v18 = v11;
  v19 = self;
  v12 = v9;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v17);
  -[_LTParagraphTranslationRequest setRanges:](v13, "setRanges:", v12);
  v14 = v21;
  v15 = v13;

  _Block_object_dispose(v23, 8);
  return v15;
}

- (void)setText:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _LTTranslationSession *v11;
  void *v12;
  _LTTranslationSession *v13;
  _LTTranslationSession *session;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _LTTextToSpeechTranslationRequest *v20;
  _LTTextToSpeechTranslationRequest *v21;
  _LTTextToSpeechTranslationRequest *request;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  -[_LTTextTranslationRequest text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paragraphs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    if (self->_session
      || (-[_LTTranslationRequest batchSessionUUID](self, "batchSessionUUID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[_LTTextTranslationRequest setText:].cold.1();
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [_LTTranslationSession alloc];
    -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_LTTranslationSession initForFutureServiceWithSessionID:selfLoggingInvocationId:](v11, "initForFutureServiceWithSessionID:selfLoggingInvocationId:", v10, v12);
    session = self->_session;
    self->_session = v13;

    v15 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_235438000, v15, OS_LOG_TYPE_INFO, "Created _LTTranslationSession for use in a _LTTextTranslationRequest. SessionID: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    v16 = (void *)objc_msgSend(v10, "copy");
    -[_LTTranslationRequest setBatchSessionUUID:](self, "setBatchSessionUUID:", v16);
  }
  else
  {
    v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      -[_LTTranslationRequest uniqueID](self, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v19;
      _os_log_impl(&dword_235438000, v18, OS_LOG_TYPE_INFO, "_LTTranslationRequest had text set, creating sub-request with suggested uniqueID: %{public}@", (uint8_t *)&v23, 0xCu);

    }
    v20 = [_LTTextToSpeechTranslationRequest alloc];
    -[_LTTranslationRequest localePair](self, "localePair");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationRequest uniqueID](self, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_LTTextToSpeechTranslationRequest initWithLocalePair:suggestedUniqueID:](v20, "initWithLocalePair:suggestedUniqueID:", v10, v16);
    request = self->_request;
    self->_request = v21;

  }
}

- (id)serviceDelegate
{
  void *request;

  request = self->_request;
  if (!request)
    request = self->_session;
  return request;
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *savedAttributes;
  NSMutableDictionary *v11;
  NSMutableDictionary *receivedParagraphs;
  NSArray *paragraphOrder;
  void *v14;
  id done;
  BOOL v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  NSArray *v32;
  void *v33;
  id v34;
  _LTTextToSpeechTranslationRequest **p_request;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id obj;
  _QWORD v44[4];
  id v45;
  id buf[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v42 = a4;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v6, OS_LOG_TYPE_INFO, "Text Translation: start with service", (uint8_t *)buf, 2u);
  }
  -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest localePair](self, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest setLogIdentifier:](self, "setLogIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  savedAttributes = self->_savedAttributes;
  self->_savedAttributes = v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  receivedParagraphs = self->_receivedParagraphs;
  self->_receivedParagraphs = v11;

  paragraphOrder = self->_paragraphOrder;
  self->_paragraphOrder = 0;

  v14 = (void *)objc_msgSend(v42, "copy");
  done = self->_done;
  self->_done = v14;

  self->_outstandingCount = 0;
  self->_translationFinished = 0;
  v16 = self->_session == 0;
  v17 = _LTOSLogTranslationEngine();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (v18)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_235438000, v17, OS_LOG_TYPE_INFO, "Fallback to text to speech translation", (uint8_t *)buf, 2u);
    }
    p_request = &self->_request;
    -[_LTTranslationRequest setTaskHint:](self->_request, "setTaskHint:", -[_LTTranslationRequest taskHint](self, "taskHint", 144));
    -[_LTTranslationRequest setForcedOfflineTranslation:](self->_request, "setForcedOfflineTranslation:", -[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"));
    -[_LTTranslationRequest setCensorSpeech:](self->_request, "setCensorSpeech:", -[_LTTranslationRequest censorSpeech](self, "censorSpeech"));
    -[_LTTextTranslationRequest text](self, "text");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTextToSpeechTranslationRequest setText:](self->_request, "setText:", v37);

    -[_LTTextToSpeechTranslationRequest setDelegate:](self->_request, "setDelegate:", self);
    -[_LTTranslationRequest appIdentifier](self, "appIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationRequest setAppIdentifier:](self->_request, "setAppIdentifier:", v38);

    -[_LTTranslationRequest setSourceOrigin:](self->_request, "setSourceOrigin:", -[_LTTranslationRequest sourceOrigin](self, "sourceOrigin"));
    -[_LTTranslationRequest setIsFinal:](self->_request, "setIsFinal:", -[_LTTranslationRequest isFinal](self, "isFinal"));
    -[_LTTranslationRequest set_supportsGenderDisambiguation:](self->_request, "set_supportsGenderDisambiguation:", -[_LTTranslationRequest _supportsGenderDisambiguation](self, "_supportsGenderDisambiguation"));
    -[_LTTranslationRequest setOverrideOngoingSessionIfNeeded:](self->_request, "setOverrideOngoingSessionIfNeeded:", -[_LTTranslationRequest overrideOngoingSessionIfNeeded](self, "overrideOngoingSessionIfNeeded"));
    -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationRequest setLogIdentifier:](*p_request, "setLogIdentifier:", v39);

    -[_LTTextToSpeechTranslationRequest _startTranslationWithService:done:](*p_request, "_startTranslationWithService:done:", v41, v42);
  }
  else
  {
    if (v18)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_235438000, v17, OS_LOG_TYPE_INFO, "Using paragraph translation", (uint8_t *)buf, 2u);
    }
    -[_LTTranslationRequest logIdentifier](self, "logIdentifier", 144);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationSession setLogIdentifier:](self->_session, "setLogIdentifier:", v19);

    -[_LTTranslationSession prepareWithService:](self->_session, "prepareWithService:", v41);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[_LTTextTranslationRequest text](self, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "paragraphs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v23;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(obj);
          -[_LTTextTranslationRequest _paragraphRequestForText:](self, "_paragraphRequestForText:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTaskHint:", -[_LTTranslationRequest taskHint](self, "taskHint"));
          objc_msgSend(v27, "setCensorSpeech:", -[_LTTranslationRequest censorSpeech](self, "censorSpeech"));
          objc_msgSend(v27, "setForcedOfflineTranslation:", -[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"));
          -[_LTTranslationRequest appIdentifier](self, "appIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setAppIdentifier:", v28);

          objc_msgSend(v27, "setSourceOrigin:", -[_LTTranslationRequest sourceOrigin](self, "sourceOrigin"));
          objc_msgSend(v27, "setIsFinal:", -[_LTTranslationRequest isFinal](self, "isFinal"));
          objc_msgSend(v27, "set_supportsGenderDisambiguation:", -[_LTTranslationRequest _supportsGenderDisambiguation](self, "_supportsGenderDisambiguation"));
          objc_msgSend(v27, "setOverrideOngoingSessionIfNeeded:", -[_LTTranslationRequest overrideOngoingSessionIfNeeded](self, "overrideOngoingSessionIfNeeded"));
          -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setLogIdentifier:", v29);

          objc_initWeak(buf, self);
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __63___LTTextTranslationRequest__startTranslationWithService_done___block_invoke;
          v44[3] = &unk_250694418;
          objc_copyWeak(&v45, buf);
          objc_msgSend(v27, "setCompletionHandler:", v44);
          objc_msgSend(v27, "uniqueID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v21, "addObject:", v30);

          objc_msgSend(v20, "addObject:", v27);
          objc_destroyWeak(&v45);
          objc_destroyWeak(buf);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v24);
    }

    v31 = self->_paragraphOrder;
    self->_paragraphOrder = v21;
    v32 = v21;

    *(Class *)((char *)&self->super.super.isa + v40) = (Class)-[NSArray count](v32, "count");
    v33 = (void *)objc_msgSend(v42, "copy");
    v34 = self->_done;
    self->_done = v33;

    -[_LTTranslationSession translate:](self->_session, "translate:", v20);
  }

}

- (void)_translationFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_LTTextTranslationRequest _translationFailedWithError:].cold.1();
  -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:](self, "_callCompletionHandlersWithResult:error:", 0, v4);

}

- (void)_constructFinalParagraphResult
{
  NSObject *v3;
  void *v4;
  NSArray *paragraphOrder;
  id v6;
  void *v7;
  _LTCombinedTranslationResult *v8;
  void *v9;
  _LTCombinedTranslationResult *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id buf[2];

  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v3, OS_LOG_TYPE_INFO, "Constructing final paragraph result", (uint8_t *)buf, 2u);
  }
  v4 = (void *)-[NSMutableDictionary copy](self->_receivedParagraphs, "copy");
  objc_initWeak(buf, self);
  paragraphOrder = self->_paragraphOrder;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __59___LTTextTranslationRequest__constructFinalParagraphResult__block_invoke;
  v14 = &unk_250694440;
  v6 = v4;
  v15 = v6;
  objc_copyWeak(&v16, buf);
  -[NSArray _ltCompactMap:](paragraphOrder, "_ltCompactMap:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [_LTCombinedTranslationResult alloc];
  -[_LTTranslationRequest localePair](self, "localePair", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_LTCombinedTranslationResult initWithParagraphResults:localePair:](v8, "initWithParagraphResults:localePair:", v7, v9);

  -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:](self, "_callCompletionHandlersWithResult:error:", v10, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);

}

- (void)_handleParagraphResponse:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *receivedParagraphs;
  void *v11;
  unint64_t outstandingCount;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    -[_LTTextTranslationRequest translationDidFinishWithError:](self, "translationDidFinishWithError:", a4);
  }
  else
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = (unint64_t)v9;
      _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "Received translated paragraph for ID: %{public}@", (uint8_t *)&v16, 0xCu);

    }
    receivedParagraphs = self->_receivedParagraphs;
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](receivedParagraphs, "setObject:forKeyedSubscript:", v6, v11);

    outstandingCount = self->_outstandingCount;
    if (outstandingCount)
    {
      self->_outstandingCount = outstandingCount - 1;
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = self->_outstandingCount;
        v16 = 134217984;
        v17 = v14;
        _os_log_impl(&dword_235438000, v13, OS_LOG_TYPE_INFO, "New outstanding count: %zd", (uint8_t *)&v16, 0xCu);
      }
      if (!self->_outstandingCount)
        -[_LTTextTranslationRequest _constructFinalParagraphResult](self, "_constructFinalParagraphResult");
    }
    else
    {
      v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[_LTTextTranslationRequest _handleParagraphResponse:error:].cold.1(v15, v6);
    }
  }

}

- (id)_alignmentAttributeKeyFromRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), a3, a4);
}

- (id)_getStoredAttributesForRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4
{
  void *v5;
  void *v6;

  -[_LTTextTranslationRequest _alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:](self, "_alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_savedAttributes, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_saveAttributes:(id)a3 forRequestUniqueID:(id)a4 alignmentIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[_LTTextTranslationRequest _alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:](self, "_alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_savedAttributes, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)_addAlignmentAttributesToResult:(id)a3 requestIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a3, "alignments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v23;
      *(_QWORD *)&v8 = 138740483;
      v20 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "identifier", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LTTextTranslationRequest _getStoredAttributesForRequestIdentifier:alignmentIdentifier:](self, "_getStoredAttributesForRequestIdentifier:alignmentIdentifier:", v6, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LTTextTranslationRequest _alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:](self, "_alignmentAttributeKeyFromRequestIdentifier:alignmentIdentifier:", v6, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = _LTOSLogTranslationEngine();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = v17;
            objc_msgSend(v12, "text");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v27 = v19;
            v28 = 2114;
            v29 = v16;
            v30 = 2114;
            v31 = v14;
            _os_log_impl(&dword_235438000, v18, OS_LOG_TYPE_INFO, "Alignment '%{sensitive}@' ID: %{public}@; attributes: %{public}@",
              buf,
              0x20u);

          }
          objc_msgSend(v12, "setSourceAttributes:", v14);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v9);
    }

  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _LTCombinedTranslationResult *v7;
  void *v8;
  _LTCombinedTranslationResult *v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_235438000, v5, OS_LOG_TYPE_INFO, "Received text to speech result", v10, 2u);
  }
  if (v4)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  v7 = [_LTCombinedTranslationResult alloc];
  -[_LTTranslationRequest localePair](self, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_LTCombinedTranslationResult initWithParagraphResults:localePair:](v7, "initWithParagraphResults:localePair:", v6, v8);

  -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:](self, "_callCompletionHandlersWithResult:error:", v9, 0);

}

- (void)translationDidFinishWithError:(id)a3
{
  id v4;
  void (**done)(void);
  NSObject *v6;

  v4 = a3;
  if (!self->_translationFinished)
  {
    self->_translationFinished = 1;
    done = (void (**)(void))self->_done;
    if (done)
      done[2]();
    if (v4)
    {
      -[_LTTranslationRequest logIdentifier](self->_request, "logIdentifier");

      v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_LTTextTranslationRequest _translationFailedWithError:].cold.1();
      -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:](self, "_callCompletionHandlersWithResult:error:", 0, v4);
    }
  }

}

- (void)_callCompletionHandlersWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _BYTE v22[18];
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_hasCalledCompletionHandler)
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:].cold.4((uint64_t)v6, (uint64_t)v7, v8);
  }
  else
  {
    self->_hasCalledCompletionHandler = 1;
    if (!self->_receivedParagraphs)
    {
      v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:].cold.3();
    }
    -[_LTTextTranslationRequest textTranslationHandler](self, "textTranslationHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "paragraphResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v6, "translatedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        *(_DWORD *)v22 = 134218498;
        *(_QWORD *)&v22[4] = objc_msgSend(v14, "length");
        *(_WORD *)&v22[12] = 1024;
        *(_DWORD *)&v22[14] = v12 != 0;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_235438000, v16, OS_LOG_TYPE_DEFAULT, "Calling _LTTextTranslationRequest.textTranslationHandler with translatedText of length %zu; has result: %{BOOL}i; error: %@",
          v22,
          0x1Cu);

      }
      -[_LTTextTranslationRequest textTranslationHandler](self, "textTranslationHandler", *(_QWORD *)v22);
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, id))v17)[2](v17, v14, v12, v7);

    }
    else
    {
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:].cold.2();
    }
    -[_LTTextTranslationRequest completionHandler](self, "completionHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = _LTOSLogTranslationEngine();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 67109378;
        *(_DWORD *)&v22[4] = v6 != 0;
        *(_WORD *)&v22[8] = 2112;
        *(_QWORD *)&v22[10] = v7;
        _os_log_impl(&dword_235438000, v20, OS_LOG_TYPE_DEFAULT, "Calling _LTTextTranslationRequest.completionHandler; has result: %{BOOL}i; error: %@",
          v22,
          0x12u);
      }
      -[_LTTextTranslationRequest completionHandler](self, "completionHandler");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v21)[2](v21, v6, v7);

    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:].cold.1();
    }
    -[_LTTextTranslationRequest _cleanUpTemporaryStorage](self, "_cleanUpTemporaryStorage");
  }

}

- (void)_cleanUpTemporaryStorage
{
  NSArray *paragraphOrder;
  NSMutableDictionary *receivedParagraphs;
  NSMutableDictionary *savedAttributes;

  paragraphOrder = self->_paragraphOrder;
  self->_paragraphOrder = 0;

  receivedParagraphs = self->_receivedParagraphs;
  self->_receivedParagraphs = 0;

  savedAttributes = self->_savedAttributes;
  self->_savedAttributes = 0;

}

- (NSString)sentence
{
  return self->_sentence;
}

- (void)setSentence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSAttributedString)text
{
  return self->_text;
}

- (NSArray)ignoringAttributes
{
  return self->_ignoringAttributes;
}

- (void)setIgnoringAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)textHandler
{
  return self->_textHandler;
}

- (void)setTextHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)translationHandler
{
  return self->_translationHandler;
}

- (void)setTranslationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)textTranslationHandler
{
  return self->_textTranslationHandler;
}

- (void)setTextTranslationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_textTranslationHandler, 0);
  objc_storeStrong(&self->_translationHandler, 0);
  objc_storeStrong(&self->_textHandler, 0);
  objc_storeStrong((id *)&self->_ignoringAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sentence, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_receivedParagraphs, 0);
  objc_storeStrong((id *)&self->_paragraphOrder, 0);
  objc_storeStrong((id *)&self->_savedAttributes, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setText:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_235438000, v0, OS_LOG_TYPE_FAULT, "Trying to set new text on a request that had a session (and may have already had text) set; this could lead to unexpected behavior",
    v1,
    2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_translationFailedWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Translation failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleParagraphResponse:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_235438000, v3, OS_LOG_TYPE_FAULT, "Received a paragraph response with ID %{public}@, but we didn't expect any paragraphs to be outstanding; this should never happen",
    v5,
    0xCu);

}

- (void)_callCompletionHandlersWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_235438000, v0, v1, "Not calling _LTTextTranslationRequest.completionHandler since the client hasn't set this property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_callCompletionHandlersWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_235438000, v0, v1, "Not calling _LTTextTranslationRequest.textTranslationHandler since the client hasn't set this property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_callCompletionHandlersWithResult:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
    "er was likely already called, or translation never started",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_callCompletionHandlersWithResult:(os_log_t)log error:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 != 0;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Attempted to call completionHandler even though it's already been called, will not call it again. Combined result exists: %{BOOL}i; error: %@",
    (uint8_t *)v3,
    0x12u);
  OUTLINED_FUNCTION_1();
}

@end
