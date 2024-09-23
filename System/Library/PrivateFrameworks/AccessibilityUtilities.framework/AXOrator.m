@implementation AXOrator

- (AXOrator)init
{
  AXOrator *v2;
  AXOrator *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXOrator;
  v2 = -[AXOrator init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXOrator setLastUtteranceSubstringRange:](v2, "setLastUtteranceSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[AXOrator setLastSpokenSubstringRange:](v3, "setLastSpokenSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[AXOrator setSpeakingContext:](v3, "setSpeakingContext:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXOrator setAdditionalContentToProcess:](v3, "setAdditionalContentToProcess:", v4);

    objc_initWeak(&location, v3);
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __16__AXOrator_init__block_invoke;
    v9[3] = &unk_1E24C58C0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v9, sel_quickSpeakSpeakingRate, v3);

    objc_destroyWeak(&v10);
    v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v7 = (void *)ModifySpeechJobsLock;
    ModifySpeechJobsLock = (uint64_t)v6;

    objc_destroyWeak(&location);
  }
  return v3;
}

void __16__AXOrator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_respeakUtteranceIfNeeded");

}

- (NSString)content
{
  void *v2;
  void *v3;

  -[AXOrator selectedContent](self, "selectedContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXLanguageTaggedContent *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    +[AXLanguageManager stringByReplacingFatWidthCharactersWithBasicCharacters:](AXLanguageManager, "stringByReplacingFatWidthCharactersWithBasicCharacters:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[AXLanguageTaggedContent initWithContent:]([AXLanguageTaggedContent alloc], "initWithContent:", v6);
    -[AXOrator setSelectedContent:](self, "setSelectedContent:", v7);
    AXLogSpokenContentTextProcessing();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Orator did set content. Will tag content now", v11, 2u);
    }

    -[AXOrator selectedContent](self, "selectedContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tagContent");

    -[AXOrator selectedContent](self, "selectedContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_contentIsSpeakable = -[AXOrator _canSpeakTaggedContent:](self, "_canSpeakTaggedContent:", v10);

    self->_isProcessingContentForSpeech = 1;
  }
  else
  {
    -[AXOrator setSelectedContent:](self, "setSelectedContent:", 0);
    self->_contentIsSpeakable = 0;
    self->_isProcessingContentForSpeech = 0;
  }
}

- (void)addAdditionalContentToSpeechQueue:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  AXLanguageTaggedContent *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[AXOrator isProcessingContentForSpeech](self, "isProcessingContentForSpeech");
  if (v4 && v5)
  {
    +[AXLanguageManager stringByReplacingFatWidthCharactersWithBasicCharacters:](AXLanguageManager, "stringByReplacingFatWidthCharactersWithBasicCharacters:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = -[AXLanguageTaggedContent initWithContent:]([AXLanguageTaggedContent alloc], "initWithContent:", v6);
    AXLogSpokenContentTextProcessing();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Orator added additional content to queue. Will tag content now", buf, 2u);
    }

    -[AXLanguageTaggedContent tagContent](v7, "tagContent");
    objc_msgSend((id)ModifySpeechJobsLock, "lock");
    if (-[AXOrator isProcessingContentForSpeech](self, "isProcessingContentForSpeech"))
    {
      -[AXLanguageTaggedContent tags](v7, "tags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXLanguageTaggedContent tags](v7, "tags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v11);

        -[AXOrator selectedContent](self, "selectedContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendLanguageTaggedContent:", v7);

      }
    }
    objc_msgSend((id)ModifySpeechJobsLock, "unlock");

    v4 = (id)v6;
  }
  -[AXOrator setIsFetchingAdditionalContent:](self, "setIsFetchingAdditionalContent:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AXOrator_addAdditionalContentToSpeechQueue___block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __46__AXOrator_addAdditionalContentToSpeechQueue___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;

  result = objc_msgSend(*(id *)(a1 + 32), "isSpeaking");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "additionalContentToProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
LABEL_5:

      return objc_msgSend(*(id *)(a1 + 32), "_speakNextItemInSequence");
    }
    objc_msgSend(*(id *)(a1 + 32), "speechSequenceItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      goto LABEL_5;
    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "isSpeaking");

    if ((v5 & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "_speakNextItemInSequence");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oratorDidFinishSpeaking:", *(_QWORD *)(a1 + 32));

    }
    return objc_msgSend(*(id *)(a1 + 32), "_clearAllContentState");
  }
  return result;
}

- (NSString)currentVoiceIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[AXOrator speechSequenceItems](self, "speechSequenceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXOrator _getLangCodeForItem:](self, "_getLangCodeForItem:", v5);
  }
  else
  {
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialectForSystemLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specificLanguageID");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXOrator lastUtteranceLanguageCode](self, "lastUtteranceLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXOrator lastUtteranceLanguageCode](self, "lastUtteranceLanguageCode");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXLanguageCanonicalFormToGeneralLanguage(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v10, *MEMORY[0x1E0CF37D8], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 error:(id *)a4
{
  return -[AXOrator startSpeakingWithPreferredLanguage:delayBeforeStart:error:](self, "startSpeakingWithPreferredLanguage:delayBeforeStart:error:", a3, a4, 0.0);
}

- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 delayBeforeStart:(double)a4 error:(id *)a5
{
  id v8;
  _BOOL4 contentIsSpeakable;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;

  v8 = a3;
  -[AXOrator setCurrentLanguageCode:](self, "setCurrentLanguageCode:", 0);
  -[AXOrator setPreferredLanguageWasSpecified:](self, "setPreferredLanguageWasSpecified:", 1);
  contentIsSpeakable = self->_contentIsSpeakable;
  if (self->_contentIsSpeakable)
  {
    if (!v8)
    {
      -[AXOrator setPreferredLanguageWasSpecified:](self, "setPreferredLanguageWasSpecified:", 0);
      -[AXOrator selectedContent](self, "selectedContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "primaryUnambiguousDialect");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[AXOrator selectedContent](self, "selectedContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryAmbiguousDialect");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v11, "specificLanguageID");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[AXOrator speechSynthesizer](self, "speechSynthesizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C89B98]);
      -[AXOrator setSpeechSynthesizer:](self, "setSpeechSynthesizer:", v14);

      -[AXOrator speechSynthesizer](self, "speechSynthesizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIsInternalSynth:", 1);

      v16 = *MEMORY[0x1E0CF37D8];
      -[AXOrator speechSynthesizer](self, "speechSynthesizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSpeechSource:", v16);

      -[AXOrator speechSynthesizer](self, "speechSynthesizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);

      -[AXOrator speechSynthesizer](self, "speechSynthesizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUsesApplicationAudioSession:", 0);

      -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
    }
    v20 = -[AXOrator speakingContext](self, "speakingContext");
    if (a5 && v20 == 1)
      self->_contentIsSpeakable = 0;
    -[AXOrator selectedContent](self, "selectedContent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserPreferredLangID:", v8);

    if (a4 == 0.0)
      -[AXOrator _startSpeakingSequence](self, "_startSpeakingSequence");
    else
      AXPerformBlockOnMainThreadAfterDelay();
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXOratorErrorDomain"), 1, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return contentIsSpeakable;
}

uint64_t __70__AXOrator_startSpeakingWithPreferredLanguage_delayBeforeStart_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSpeakingSequence");
}

- (BOOL)pauseSpeaking:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  -[AXOrator speakingContent](self, "speakingContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[AXOrator isSpeaking](self, "isSpeaking"))
    {
      -[AXOrator speechSynthesizer](self, "speechSynthesizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "pauseSpeakingAtBoundary:", 0);

      if (v7)
        v8 = 0;
      else
        v8 = 5;
    }
    else
    {
      v8 = 3;
    }
  }
  else
  {
    v8 = 2;
  }
  return -[AXOrator _successWithCode:error:](self, "_successWithCode:error:", v8, a3);
}

- (BOOL)stopSpeaking:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[AXOrator lastUtterance](self, "lastUtterance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXOrator _clearAllContentState](self, "_clearAllContentState");
  -[AXOrator setLastUtterance:](self, "setLastUtterance:", v4);
  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stopSpeakingAtBoundary:", 0);

  return v6;
}

- (BOOL)resumeSpeaking:(id *)a3
{
  return -[AXOrator resumeSpeakingAfterDelay:error:](self, "resumeSpeakingAfterDelay:error:", a3, 0.0);
}

- (BOOL)resumeSpeakingAfterDelay:(double)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];

  -[AXOrator speakingContent](self, "speakingContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[AXOrator isSpeaking](self, "isSpeaking"))
    {
      v8 = 4;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke;
      aBlock[3] = &unk_1E24C4C38;
      aBlock[4] = self;
      v9 = _Block_copy(aBlock);
      v10 = v9;
      if (a3 == 0.0)
        (*((void (**)(void *))v9 + 2))(v9);
      else
        AXPerformBlockOnMainThreadAfterDelay();

      v8 = 0;
    }
  }
  else
  {
    v8 = 2;
  }
  return -[AXOrator _successWithCode:error:](self, "_successWithCode:error:", v8, a4);
}

void __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldSpeakNextItemOnResume");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setShouldSpeakNextItemOnResume:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_speakNextItemInSequence");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oratorDidResumeSpeaking:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    objc_msgSend(v3, "speechSynthesizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "continueSpeaking");

    if ((v7 & 1) == 0)
    {
      AXLogOrator();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke_cold_1();

    }
  }
}

- (float)speechRate
{
  void *v2;
  float v3;
  float v4;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quickSpeakSpeakingRate");
  v4 = v3;

  return v4;
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (BOOL)isSpeaking
{
  void *v3;
  void *v4;
  int v5;

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSpeaking"))
  {
    -[AXOrator speechSynthesizer](self, "speechSynthesizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPaused") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (double)currentSpeechRateForAdjustment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  -[AXOrator lastUtteranceLanguageCode](self, "lastUtteranceLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLanguageCanonicalFormToGeneralLanguage(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[AXOrator _useLanguageSpecificSpeakingRate](self, "_useLanguageSpecificSpeakingRate");
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    objc_msgSend(v5, "quickSpeakSpeakingRateForLanguage:", v4);
  else
    objc_msgSend(v5, "quickSpeakSpeakingRate");
  v8 = v7;

  return v8;
}

- (BOOL)setSpeakingRate:(double)a3
{
  return -[AXOrator _changeSpeakingSpeed:usingLanugageSpecificRate:](self, "_changeSpeakingSpeed:usingLanugageSpecificRate:", -[AXOrator _useLanguageSpecificSpeakingRate](self, "_useLanguageSpecificSpeakingRate"), a3);
}

- (BOOL)speakFaster
{
  double v3;

  -[AXOrator currentSpeechRateForAdjustment](self, "currentSpeechRateForAdjustment");
  return -[AXOrator _changeSpeakingSpeed:usingLanugageSpecificRate:](self, "_changeSpeakingSpeed:usingLanugageSpecificRate:", -[AXOrator _useLanguageSpecificSpeakingRate](self, "_useLanguageSpecificSpeakingRate"), v3 + (float)(*MEMORY[0x1E0C899A0] - *MEMORY[0x1E0C899B8]) * 0.05);
}

- (BOOL)speakSlower
{
  double v3;

  -[AXOrator currentSpeechRateForAdjustment](self, "currentSpeechRateForAdjustment");
  return -[AXOrator _changeSpeakingSpeed:usingLanugageSpecificRate:](self, "_changeSpeakingSpeed:usingLanugageSpecificRate:", -[AXOrator _useLanguageSpecificSpeakingRate](self, "_useLanguageSpecificSpeakingRate"), v3 + (float)(*MEMORY[0x1E0C899A0] - *MEMORY[0x1E0C899B8]) * -0.05);
}

- (BOOL)fastForwardWithBoundary:(unint64_t)a3
{
  return -[AXOrator _skipByUnit:boundary:](self, "_skipByUnit:boundary:", 1, a3);
}

- (BOOL)rewindWithBoundary:(unint64_t)a3
{
  return -[AXOrator _skipByUnit:boundary:](self, "_skipByUnit:boundary:", 0, a3);
}

- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVSpeechUtterance *v14;
  AVSpeechUtterance *statusUtterance;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  float v28;
  void *v29;
  double v30;
  id v31;
  void *v32;
  id v33;

  v33 = a3;
  v31 = a4;
  if (speakStatusWithLanguage_rate__onceToken != -1)
    dispatch_once(&speakStatusWithLanguage_rate__onceToken, &__block_literal_global_25);
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "setDelegate:", self, v31);
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "setIsInternalSynth:", 1);
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "setUsesApplicationAudioSession:", 0);
  if (v33)
  {
    v6 = v33;
  }
  else
  {
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialectForSystemLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specificLanguageID");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)MEMORY[0x1E0CB34D0];
  AXAccessibilityBundlesDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("QuickSpeak.bundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  AXNSLocalizedStringForLocale();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89BA8], "speechUtteranceWithString:", v13);
  v14 = (AVSpeechUtterance *)objc_claimAutoreleasedReturnValue();
  statusUtterance = self->_statusUtterance;
  self->_statusUtterance = v14;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v6, *MEMORY[0x1E0CF37D8], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C89B88], "_voiceFromInternalVoiceListWithIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSpeechUtterance setVoice:](self->_statusUtterance, "setVoice:", v18);

  -[AVSpeechUtterance voice](self->_statusUtterance, "voice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C89B88], "voiceWithLanguage:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechUtterance setVoice:](self->_statusUtterance, "setVoice:", v20);

  }
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "quickSpeakSpeakingRateForLanguage:", v6);
  v23 = v22;
  v24 = v22;
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "systemLanguageID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v33, "hasPrefix:", v26);

  if (fabs(v24 + -3.40282347e38) < 0.001 || v27)
  {
    objc_msgSend(v21, "quickSpeakSpeakingRate");
    v23 = v28;
  }
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "audioSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCategory:withOptions:error:", *MEMORY[0x1E0C896C0], 2, 0);

  *(float *)&v30 = v23;
  -[AVSpeechUtterance setRate:](self->_statusUtterance, "setRate:", v30);
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "stopSpeakingAtBoundary:", 0);
  objc_msgSend((id)speakStatusWithLanguage_rate__QuickManager, "speakUtterance:", self->_statusUtterance);

}

void __41__AXOrator_speakStatusWithLanguage_rate___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)speakStatusWithLanguage_rate__QuickManager;
  speakStatusWithLanguage_rate__QuickManager = v0;

}

- (BOOL)contentIsSpeakable
{
  return self->_contentIsSpeakable;
}

- (BOOL)canResumeWithContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSpeaking"))
  {
    -[AXOrator speechSynthesizer](self, "speechSynthesizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isPaused"))
    {
      -[AXOrator speakingContent](self, "speakingContent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "content");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v4);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)clearSelectedContent
{
  -[AXOrator setSelectedContent:](self, "setSelectedContent:", 0);
}

- (void)_startSpeakingSequence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXOrator selectedContent](self, "selectedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXOrator setSpeakingContent:](self, "setSpeakingContent:", v3);

  -[AXOrator setSpeakingContentTokenRanges:](self, "setSpeakingContentTokenRanges:", 0);
  -[AXOrator speakingContent](self, "speakingContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[AXOrator setSpeechSequenceItems:](self, "setSpeechSequenceItems:", v6);

  -[AXOrator _updateSequenceForSpellOutBehavior](self, "_updateSequenceForSpellOutBehavior");
  -[AXOrator setShouldSpeakNextItemOnResume:](self, "setShouldSpeakNextItemOnResume:", 0);
  -[AXOrator _speakNextItemInSequence](self, "_speakNextItemInSequence");
}

- (void)_updateSequenceForSpellOutBehavior
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t j;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  AXOrator *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[AXOrator spellOutContent](self, "spellOutContent"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = self;
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          for (j = objc_msgSend(v9, "range"); ; j += v16)
          {
            v11 = objc_msgSend(v9, "range");
            if (j >= v11 + v12)
              break;
            objc_msgSend(v9, "content");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "rangeOfComposedCharacterSequenceAtIndex:", j);
            v16 = v15;

            v17 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v17, "setRange:", v14, v16);
            objc_msgSend(v3, "addObject:", v17);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    -[AXOrator setSpeechSequenceItems:](v18, "setSpeechSequenceItems:", v3);
  }
}

- (id)_getLangCodeForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  if (-[AXOrator preferredLanguageWasSpecified](self, "preferredLanguageWasSpecified"))
  {
    -[AXOrator speakingContent](self, "speakingContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userPreferredLangID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "canBeSpokenByLanguage:", v6);

    if (v7)
    {
      -[AXOrator speakingContent](self, "speakingContent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userPreferredLangID");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:

      v11 = (void *)v9;
      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "dialect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "specificLanguageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "wasPredicted") & 1) == 0)
  {
    -[AXOrator speakingContent](self, "speakingContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userPreferredLangID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "canBeSpokenByLanguage:", v13) & 1) != 0)
    {

LABEL_8:
      -[AXOrator speakingContent](self, "speakingContent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userPreferredLangID");
      v9 = objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v14 = objc_msgSend(v4, "canBeSpokenByLanguage:", v11);

    if ((v14 & 1) == 0)
      goto LABEL_8;
  }
LABEL_10:

  return v11;
}

- (void)_processAdditionalContentInPreparationForSpeech
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)ModifySpeechJobsLock, "lock");
  -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[AXOrator speechSequenceItems](self, "speechSequenceItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllObjects");
LABEL_4:

  }
  objc_msgSend((id)ModifySpeechJobsLock, "unlock");
}

- (void)_speakNextItemInSequence
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  float v40;
  double v41;
  float v43;
  void *v44;
  void *v45;
  unint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[AXOrator _processAdditionalContentInPreparationForSpeech](self, "_processAdditionalContentInPreparationForSpeech");
  if (self->_contentIsSpeakable)
  {
    -[AXOrator delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AXOrator speechSequenceItems](self, "speechSequenceItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5 > 4)
        goto LABEL_6;
      -[AXOrator setIsFetchingAdditionalContent:](self, "setIsFetchingAdditionalContent:", 1);
      -[AXOrator delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "oratorShouldFetchNextElements:shouldScrollOpaqueProviderIfNecessary:", self, 0);
    }

  }
LABEL_6:
  -[AXOrator speechSequenceItems](self, "speechSequenceItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

    -[AXOrator _getLangCodeForItem:](self, "_getLangCodeForItem:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "range");
    v14 = v13;
    -[AXOrator currentLanguageCode](self, "currentLanguageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      -[AXOrator setCurrentLanguageCode:](self, "setCurrentLanguageCode:", v11);
    v71 = v9;
    if (objc_msgSend(v9, "createdFromNewline"))
    {
      -[AXOrator setCurrentLanguageCode:](self, "setCurrentLanguageCode:", 0);
    }
    else
    {
      -[AXOrator currentLanguageCode](self, "currentLanguageCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", v11))
      {
        v20 = -[AXOrator spellOutContent](self, "spellOutContent");

        if (!v20)
        {
          v70 = v11;
          do
          {
            -[AXOrator speechSequenceItems](self, "speechSequenceItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (!v22)
              break;
            -[AXOrator speechSequenceItems](self, "speechSequenceItems");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndex:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[AXOrator currentLanguageCode](self, "currentLanguageCode");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v19, "canBeSpokenByLanguage:", v24);

            if (v25)
            {
              -[AXOrator speechSequenceItems](self, "speechSequenceItems");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "removeObjectAtIndex:", 0);

              objc_msgSend(v19, "range");
              v14 += v27;
            }
            objc_msgSend(v19, "contentSubstring");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v28, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v29 = v14;
              v30 = v12;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "contentSubstring");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "contentSubstring");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v32, "characterAtIndex:", objc_msgSend(v33, "length") - 1));

              v12 = v30;
              v14 = v29;
              v11 = v70;

              if (v34)
              {
                -[AXOrator setCurrentLanguageCode:](self, "setCurrentLanguageCode:", 0);
                goto LABEL_25;
              }
            }
            else
            {

            }
          }
          while ((v25 & 1) != 0);
        }
      }
      else
      {
LABEL_25:

      }
    }
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "systemLanguageID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v11, "hasPrefix:", v37);

    AXLanguageCanonicalFormToGeneralLanguage(v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "quickSpeakSpeakingRateForLanguage:", v39);
    v41 = v40;

    if (fabs(v41 + -3.40282347e38) < 0.001 || v38 != 0)
    {
      objc_msgSend(v35, "quickSpeakSpeakingRate");
      v41 = v43;
    }
    -[AXOrator speakingContent](self, "speakingContent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "content");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length");

    if (v14 + v12 > v46)
    {
      AXLogOrator();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        -[AXOrator speakingContent](self, "speakingContent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v74 = v12;
        v75 = 2048;
        v76 = v14;
        v77 = 2112;
        v78 = v48;
        _os_log_impl(&dword_18C62B000, v47, OS_LOG_TYPE_INFO, "Our substring range was greater than speaking content! (%lu,%lu) %@", buf, 0x20u);

      }
      goto LABEL_43;
    }
    -[AXOrator speakingContent](self, "speakingContent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "content");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "substringWithRange:", v12, v14);
    v51 = objc_claimAutoreleasedReturnValue();

    v69 = (void *)v51;
    objc_msgSend(MEMORY[0x1E0C89BA8], "speechUtteranceWithString:", v51);
    v52 = v12;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    AXLanguageCanonicalFormToGeneralLanguage(v11);
    v54 = objc_claimAutoreleasedReturnValue();

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v54, *MEMORY[0x1E0CF37D8], 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C89B88], "_voiceFromInternalVoiceListWithIdentifier:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setVoice:", v57);

    objc_msgSend(v53, "voice");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      objc_msgSend(MEMORY[0x1E0C89B88], "voiceWithLanguage:", v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setVoice:", v60);

    }
    *(float *)&v59 = v41;
    objc_msgSend(v53, "setRate:", v59);
    LODWORD(v61) = 1.0;
    objc_msgSend(v53, "setVolume:", v61);
    objc_msgSend(v53, "setProcessEmoticons:", 1);
    -[AXOrator speechSynthesizer](self, "speechSynthesizer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stopSpeakingAtBoundary:", 0);

    -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
    -[AXOrator speechSynthesizer](self, "speechSynthesizer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "speakUtterance:", v53);

    -[AXOrator setLastUtteranceLanguageCode:](self, "setLastUtteranceLanguageCode:", v54);
    -[AXOrator setLastUtteranceSubstringRange:](self, "setLastUtteranceSubstringRange:", v52, v14);
    -[AXOrator setLastUtteranceLanguageTag:](self, "setLastUtteranceLanguageTag:", v71);
    -[AXOrator lastUtterance](self, "lastUtterance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "rate");
    if (v41 == v65)
    {
      v68 = v69;
    }
    else
    {
      -[AXOrator delegate](self, "delegate");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_opt_respondsToSelector();

      v68 = v69;
      if ((v67 & 1) == 0)
      {
LABEL_42:
        -[AXOrator setLastUtterance:](self, "setLastUtterance:", v53);

        v11 = (void *)v54;
LABEL_43:

        return;
      }
      -[AXOrator delegate](self, "delegate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "oratorDidChangeSpeakingRate:", self);
    }

    goto LABEL_42;
  }
  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stopSpeakingAtBoundary:", 0);

  -[AXOrator delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[AXOrator delegate](self, "delegate");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "oratorDidFinishSpeaking:", self);

  }
}

- (BOOL)_useLanguageSpecificSpeakingRate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  float v9;
  BOOL v10;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXOrator lastUtteranceLanguageCode](self, "lastUtteranceLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLanguageCanonicalFormToGeneralLanguage(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemLanguageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hasPrefix:", v7) ^ 1;

  objc_msgSend(v3, "quickSpeakSpeakingRateForLanguage:", v5);
  if (fabs(v9 + -3.40282347e38) >= 0.001)
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

- (BOOL)_changeSpeakingSpeed:(double)a3 usingLanugageSpecificRate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  char v18;
  void *v19;

  v4 = a4;
  AXLogOrator();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXOrator _changeSpeakingSpeed:usingLanugageSpecificRate:].cold.1(v7, a3, v8, v9);

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (*MEMORY[0x1E0C899A0] >= a3 && (v12 = *MEMORY[0x1E0C899B8], v12 <= a3))
  {
    if (v4)
    {
      -[AXOrator lastUtteranceLanguageCode](self, "lastUtteranceLanguageCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AXLanguageCanonicalFormToGeneralLanguage(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v16 = a3;
      objc_msgSend(v11, "setQuickSpeakSpeakingRate:forLanguage:", v15, v16);

    }
    else
    {
      *(float *)&v12 = a3;
      objc_msgSend(v10, "setQuickSpeakSpeakingRate:", v12);
    }
    -[AXOrator _respeakUtteranceIfNeeded](self, "_respeakUtteranceIfNeeded");
    -[AXOrator delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[AXOrator delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oratorDidChangeSpeakingRate:", self);

    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_speechSequenceItemsStartingAtContentLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[AXOrator speakingContent](self, "speakingContent", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "range");
        if (a3 < v13 || a3 - v13 >= v14)
        {
          if (objc_msgSend(v12, "range") > a3)
            objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          v16 = (void *)objc_msgSend(v12, "copy");
          v17 = objc_msgSend(v16, "range");
          objc_msgSend(v16, "setRange:", a3, v18 - a3 + v17);
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)_respeakUtteranceIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_18C62B000, v0, v1, "Did not need to respeak utterance.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (int64_t)_currentTokenIndex:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  _QWORD v18[6];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[24];
  uint64_t v25;
  NSRange v26;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSpeaking");

  if ((v6 & 1) != 0)
  {
    if (-[AXOrator lastSpokenSubstringRange](self, "lastSpokenSubstringRange") == 0x7FFFFFFFFFFFFFFFLL)
    {
      AXLogOrator();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "We tried to skip a unit in the currently spoken text, but hadn't tried to speak a substring yet.  This is possible but probably requires extremely fast timing.  If not, something may be wrong", buf, 2u);
      }

      -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", 0, 0);
    }
    AXLogOrator();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v26.location = -[AXOrator lastSpokenSubstringRange](self, "lastSpokenSubstringRange");
      NSStringFromRange(v26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXOrator _currentTokenIndex:].cold.1(v9, (uint64_t)buf, v8);
    }

    -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
      v12 = 0;
    else
      v12 = 2;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __31__AXOrator__currentTokenIndex___block_invoke;
    v18[3] = &unk_1E24C7760;
    v19 = v3;
    v18[4] = self;
    v18[5] = &v20;
    objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", v12, v18);

  }
  else
  {
    if (v3)
    {
      -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v21[3] = v14;

    }
    else
    {
      v21[3] = 0;
    }
    AXLogOrator();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AXOrator _currentTokenIndex:].cold.2();

  }
  v16 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v16;
}

unint64_t __31__AXOrator__currentTokenIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t result;

  v8 = objc_msgSend(a2, "rangeValue");
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_4;
  v9 = v7;
  result = objc_msgSend(*(id *)(a1 + 32), "lastSpokenSubstringRange");
  if (result >= v8 + v9)
  {
    if (*(_BYTE *)(a1 + 48))
      return result;
LABEL_4:
    result = objc_msgSend(*(id *)(a1 + 32), "lastSpokenSubstringRange");
    if (result < v8)
      return result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

- (void)_speakNextTokenFromCurrentTokenIndex:(int64_t)a3 forward:(BOOL)a4 boundary:(unint64_t)a5
{
  _BOOL4 v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v17;
  AXOrator *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;

  v6 = a4;
  v9 = -[AXOrator numberOfTokensToSkip](self, "numberOfTokensToSkip");
  if (v6)
    v10 = v9;
  else
    v10 = -(uint64_t)v9;
  v11 = v10 + a3;
  -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 < v13)
  {
    if (v11 <= 0)
    {
      -[AXOrator delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        -[AXOrator setIsFetchingAdditionalContent:](self, "setIsFetchingAdditionalContent:", 1);
        -[AXOrator delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "oratorShouldFetchNextElements:shouldScrollOpaqueProviderIfNecessary:", self, 1);

      }
      if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)ModifySpeechJobsLock, "lock");
        -[AXOrator speakingContent](self, "speakingContent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "tags");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");

        -[AXOrator setSpeechSequenceItems:](self, "setSpeechSequenceItems:", v29);
        -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeAllObjects");

        objc_msgSend((id)ModifySpeechJobsLock, "unlock");
        goto LABEL_21;
      }
    }
    else
    {
      -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "rangeValue");

      v17 = v16 <= a5;
      if (!v6)
        v17 = v16 >= a5;
      if (v17)
      {
        objc_msgSend((id)ModifySpeechJobsLock, "lock");
        v18 = self;
        v19 = v16;
LABEL_20:
        -[AXOrator _speechSequenceItemsStartingAtContentLocation:](v18, "_speechSequenceItemsStartingAtContentLocation:", v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXOrator setSpeechSequenceItems:](self, "setSpeechSequenceItems:", v32);

        -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeAllObjects");

        objc_msgSend((id)ModifySpeechJobsLock, "unlock");
        goto LABEL_21;
      }
    }
LABEL_17:
    AXLogOrator();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[AXOrator _speakNextTokenFromCurrentTokenIndex:forward:boundary:].cold.2();

    objc_msgSend((id)ModifySpeechJobsLock, "lock");
    v18 = self;
    v19 = a5;
    goto LABEL_20;
  }
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXOrator setSpeechSequenceItems:](self, "setSpeechSequenceItems:", v20);

  -[AXOrator delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[AXOrator setIsFetchingAdditionalContent:](self, "setIsFetchingAdditionalContent:", 1);
    -[AXOrator delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oratorShouldFetchNextElements:shouldScrollOpaqueProviderIfNecessary:", self, 1);

  }
LABEL_21:
  AXLogOrator();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[AXOrator _speakNextTokenFromCurrentTokenIndex:forward:boundary:].cold.1(self, v34);

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isPaused");

  if (v36)
    -[AXOrator setShouldSpeakNextItemOnResume:](self, "setShouldSpeakNextItemOnResume:", 1);
  else
    -[AXOrator _speakNextItemInSequence](self, "_speakNextItemInSequence");
}

- (BOOL)_skipByUnit:(BOOL)a3 boundary:(unint64_t)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  NSRange v21;

  v5 = a3;
  AXLogOrator();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXOrator _skipByUnit:boundary:].cold.5();

  -[AXOrator speakingContent](self, "speakingContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_13;
  -[AXOrator setCurrentLanguageCode:](self, "setCurrentLanguageCode:", 0);
  -[AXOrator _tokenizeContentIfNeeded](self, "_tokenizeContentIfNeeded");
  AXLogOrator();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXOrator _skipByUnit:boundary:].cold.4(self, v9);

  -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    _AXAssert();
  -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
    goto LABEL_13;
  v14 = -[AXOrator _currentTokenIndex:](self, "_currentTokenIndex:", v5);
  AXLogOrator();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AXOrator _skipByUnit:boundary:].cold.3();

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21.location = -[AXOrator lastSpokenSubstringRange](self, "lastSpokenSubstringRange");
    NSStringFromRange(v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();

LABEL_13:
    AXLogOrator();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AXOrator _skipByUnit:boundary:].cold.1();
    v18 = 0;
    goto LABEL_16;
  }
  -[AXOrator _speakNextTokenFromCurrentTokenIndex:forward:boundary:](self, "_speakNextTokenFromCurrentTokenIndex:forward:boundary:", v14, v5, a4);
  AXLogOrator();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[AXOrator _skipByUnit:boundary:].cold.2();
  v18 = 1;
LABEL_16:

  return v18;
}

- (void)_tokenizeContentIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  _QWORD aBlock[4];
  id v28;

  objc_msgSend((id)ModifySpeechJobsLock, "lock");
  -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXOrator speakingContentTokenRanges](self, "speakingContentTokenRanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeValue");
    v8 = v7;

    v9 = v6 + v8;
    -[AXOrator speakingContent](self, "speakingContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v9 > v12)
      goto LABEL_10;
    -[AXOrator content](self, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length") - v9;
  }
  else
  {
    -[AXOrator speakingContent](self, "speakingContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "length");

    v9 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__AXOrator__tokenizeContentIfNeeded__block_invoke;
  aBlock[3] = &unk_1E24C7788;
  v17 = v16;
  v28 = v17;
  v18 = _Block_copy(aBlock);
  -[AXOrator speakingContent](self, "speakingContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXOrator speakingContent](self, "speakingContent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 1;
  objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v22, "length"), 1, v18);

  if ((unint64_t)objc_msgSend(v17, "count") <= 4)
  {
    objc_msgSend(v17, "removeAllObjects");
    -[AXOrator speakingContent](self, "speakingContent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "content");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", v9, v14, 1028, v18);

    v26 = objc_msgSend(v17, "count");
    if (v26 / 5 <= 1)
      v23 = 1;
    else
      v23 = v26 / 5;
  }
  -[AXOrator setSpeakingContentTokenRanges:](self, "setSpeakingContentTokenRanges:", v17);
  -[AXOrator setNumberOfTokensToSkip:](self, "setNumberOfTokensToSkip:", v23);

LABEL_10:
  objc_msgSend((id)ModifySpeechJobsLock, "unlock");
}

void __36__AXOrator__tokenizeContentIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = (void *)MEMORY[0x1E0CB3500];
  v10 = a2;
  objc_msgSend(v9, "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "length");
  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a5, a6);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
}

- (void)setAudioSessionInactiveTimeout:(double)a3
{
  id v4;

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSessionInactiveTimeout:", a3);

}

- (void)_clearAllContentState
{
  void *v3;

  -[AXOrator setSpeakingContent:](self, "setSpeakingContent:", 0);
  -[AXOrator setSpeakingContentTokenRanges:](self, "setSpeakingContentTokenRanges:", 0);
  -[AXOrator setSpeechSequenceItems:](self, "setSpeechSequenceItems:", 0);
  -[AXOrator setLastUtteranceLanguageCode:](self, "setLastUtteranceLanguageCode:", 0);
  -[AXOrator setLastUtteranceSubstringRange:](self, "setLastUtteranceSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[AXOrator setLastUtteranceLanguageTag:](self, "setLastUtteranceLanguageTag:", 0);
  -[AXOrator setLastUtterance:](self, "setLastUtterance:", 0);
  -[AXOrator setShouldSpeakNextItemOnResume:](self, "setShouldSpeakNextItemOnResume:", 0);
  objc_msgSend((id)ModifySpeechJobsLock, "lock");
  -[AXOrator setIsProcessingContentForSpeech:](self, "setIsProcessingContentForSpeech:", 0);
  -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend((id)ModifySpeechJobsLock, "unlock");
}

- (void)_updateAudioSessionCategory
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x1E0C89690];
  v4 = 2 * ((-[AXOrator speakingContext](self, "speakingContext") & 0xFFFFFFFFFFFFFFFELL) == 2);
  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetActiveOptions:", 1);

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioSessionCategory:", v3);

  -[AXOrator speechSynthesizer](self, "speechSynthesizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAudioSessionCategoryOptions:", v4);

}

- (BOOL)_canSpeakTaggedContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v3, "ambiguousLangMaps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v3, "unambiguousLangMaps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "count") != 0;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_successWithCode:(int64_t)a3 error:(id *)a4
{
  void *v6;
  id v7;

  if (a4)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXOratorErrorDomain"), a3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = objc_retainAutorelease(v6);
    *a4 = v7;

  }
  return a3 == 0;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;

  v5 = a4;
  AXAssertMainThreadCallback();
  -[AXOrator lastUtterance](self, "lastUtterance");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[AXOrator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = v18;
  if ((v7 & 1) != 0 && v18 == v5)
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

LABEL_5:
      v8 = v18;
      goto LABEL_7;
    }
    -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v8 = v18;
    if (!v11)
    {
      -[AXOrator setIsFetchingAdditionalContent:](self, "setIsFetchingAdditionalContent:", 1);
      -[AXOrator delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "oratorShouldFetchNextElements:shouldScrollOpaqueProviderIfNecessary:", self, 1);

      -[AXOrator _processAdditionalContentInPreparationForSpeech](self, "_processAdditionalContentInPreparationForSpeech");
      goto LABEL_5;
    }
  }
LABEL_7:
  if (v8 == v5)
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      -[AXOrator additionalContentToProcess](self, "additionalContentToProcess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "count"))
      {
        v17 = -[AXOrator isFetchingAdditionalContent](self, "isFetchingAdditionalContent");

        if (!v17)
          -[AXOrator _clearAllContentState](self, "_clearAllContentState");
        goto LABEL_15;
      }

    }
LABEL_15:
    -[AXOrator _speakNextItemInSequence](self, "_speakNextItemInSequence");
    goto LABEL_16;
  }
  if (!v8)
  {
    -[AXOrator speechSequenceItems](self, "speechSequenceItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      goto LABEL_15;
  }
LABEL_16:
  -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");

}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  void *v5;
  char v6;
  void *v7;

  AXAssertMainThreadCallback();
  -[AXOrator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXOrator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oratorDidPauseSpeaking:", self);

  }
  -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  void *v5;
  char v6;
  void *v7;

  AXAssertMainThreadCallback();
  -[AXOrator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXOrator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oratorDidResumeSpeaking:", self);

  }
  -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  void *v5;
  char v6;
  id v7;

  AXAssertMainThreadCallback();
  -[AXOrator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXOrator delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oratorDidStartSpeaking:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = a4;
  AXAssertMainThreadCallback();
  -[AXOrator _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
  -[AXOrator lastUtterance](self, "lastUtterance");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10 == v5)
  {
    -[AXOrator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[AXOrator delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oratorDidCancelSpeaking:", self);

    }
    -[AXOrator _clearAllContentState](self, "_clearAllContentState");
    v6 = v10;
  }

}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;
  NSRange v27;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  dispatch_get_current_queue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C80D38];

  if (v9 != v10)
    _AXAssert();
  -[AXOrator lastUtterance](self, "lastUtterance");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v8)
  {
    AXLogOrator();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:].cold.3((uint64_t)v8, self, v12);
    goto LABEL_15;
  }
  if (-[AXOrator lastUtteranceSubstringRange](self, "lastUtteranceSubstringRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    AXLogOrator();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v24.location = location;
      v24.length = length;
      -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:].cold.1(v24, (uint64_t)v8, v12);
    }
    goto LABEL_15;
  }
  v13 = -[AXOrator lastUtteranceSubstringRange](self, "lastUtteranceSubstringRange") + location;
  v14 = -[AXOrator lastUtteranceSubstringRange](self, "lastUtteranceSubstringRange");
  if (v13 + length > v14 + v15)
  {
    v25.location = v13;
    v25.length = length;
    NSStringFromRange(v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26.location = -[AXOrator lastUtteranceSubstringRange](self, "lastUtteranceSubstringRange");
    NSStringFromRange(v26);
    v22 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();

  }
  -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", v13, length, v22, v23);
  AXLogOrator();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v27.location = v13;
    v27.length = length;
    -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:].cold.2(v27, v17);
  }

  -[AXOrator delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[AXOrator delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    -[AXOrator speakingContent](self, "speakingContent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "content");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject orator:willSpeakRange:ofContent:](v12, "orator:willSpeakRange:ofContent:", self, v13, length, v21);

LABEL_15:
  }

}

- (AXOratorDelegate)delegate
{
  return (AXOratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_NSRange)lastSpokenSubstringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lastSpokenSubstringRange.length;
  location = self->_lastSpokenSubstringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastSpokenSubstringRange:(_NSRange)a3
{
  self->_lastSpokenSubstringRange = a3;
}

- (int64_t)speakingContext
{
  return self->_speakingContext;
}

- (void)setSpeakingContext:(int64_t)a3
{
  self->_speakingContext = a3;
}

- (AXLanguageTaggedContent)selectedContent
{
  return self->_selectedContent;
}

- (void)setSelectedContent:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContent, a3);
}

- (BOOL)spellOutContent
{
  return self->_spellOutContent;
}

- (void)setSpellOutContent:(BOOL)a3
{
  self->_spellOutContent = a3;
}

- (double)audioSessionInactiveTimeout
{
  return self->_audioSessionInactiveTimeout;
}

- (AXLanguageTaggedContent)speakingContent
{
  return self->_speakingContent;
}

- (void)setSpeakingContent:(id)a3
{
  objc_storeStrong((id *)&self->_speakingContent, a3);
}

- (NSArray)speakingContentTokenRanges
{
  return self->_speakingContentTokenRanges;
}

- (void)setSpeakingContentTokenRanges:(id)a3
{
  objc_storeStrong((id *)&self->_speakingContentTokenRanges, a3);
}

- (unint64_t)numberOfTokensToSkip
{
  return self->_numberOfTokensToSkip;
}

- (void)setNumberOfTokensToSkip:(unint64_t)a3
{
  self->_numberOfTokensToSkip = a3;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  return self->_speechSynthesizer;
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (NSMutableArray)speechSequenceItems
{
  return self->_speechSequenceItems;
}

- (void)setSpeechSequenceItems:(id)a3
{
  objc_storeStrong((id *)&self->_speechSequenceItems, a3);
}

- (NSString)lastUtteranceLanguageCode
{
  return self->_lastUtteranceLanguageCode;
}

- (void)setLastUtteranceLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_lastUtteranceLanguageCode, a3);
}

- (_NSRange)lastUtteranceSubstringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lastUtteranceSubstringRange.length;
  location = self->_lastUtteranceSubstringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastUtteranceSubstringRange:(_NSRange)a3
{
  self->_lastUtteranceSubstringRange = a3;
}

- (AVSpeechUtterance)lastUtterance
{
  return self->_lastUtterance;
}

- (void)setLastUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_lastUtterance, a3);
}

- (AXLanguageTag)lastUtteranceLanguageTag
{
  return self->_lastUtteranceLanguageTag;
}

- (void)setLastUtteranceLanguageTag:(id)a3
{
  objc_storeStrong((id *)&self->_lastUtteranceLanguageTag, a3);
}

- (BOOL)shouldSpeakNextItemOnResume
{
  return self->_shouldSpeakNextItemOnResume;
}

- (void)setShouldSpeakNextItemOnResume:(BOOL)a3
{
  self->_shouldSpeakNextItemOnResume = a3;
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)setCurrentLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguageCode, a3);
}

- (BOOL)preferredLanguageWasSpecified
{
  return self->_preferredLanguageWasSpecified;
}

- (void)setPreferredLanguageWasSpecified:(BOOL)a3
{
  self->_preferredLanguageWasSpecified = a3;
}

- (BOOL)isProcessingContentForSpeech
{
  return self->_isProcessingContentForSpeech;
}

- (void)setIsProcessingContentForSpeech:(BOOL)a3
{
  self->_isProcessingContentForSpeech = a3;
}

- (BOOL)isFetchingAdditionalContent
{
  return self->_isFetchingAdditionalContent;
}

- (void)setIsFetchingAdditionalContent:(BOOL)a3
{
  self->_isFetchingAdditionalContent = a3;
}

- (NSMutableArray)additionalContentToProcess
{
  return self->_additionalContentToProcess;
}

- (void)setAdditionalContentToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_additionalContentToProcess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalContentToProcess, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_lastUtteranceLanguageTag, 0);
  objc_storeStrong((id *)&self->_lastUtterance, 0);
  objc_storeStrong((id *)&self->_lastUtteranceLanguageCode, 0);
  objc_storeStrong((id *)&self->_speechSequenceItems, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_speakingContentTokenRanges, 0);
  objc_storeStrong((id *)&self->_speakingContent, 0);
  objc_storeStrong((id *)&self->_selectedContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioSessionTimer, 0);
  objc_storeStrong((id *)&self->_statusUtterance, 0);
}

void __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18C62B000, v0, OS_LOG_TYPE_ERROR, "Unable to continue speaking from synthesizer.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_changeSpeakingSpeed:(uint64_t)a3 usingLanugageSpecificRate:(uint64_t)a4 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, a1, a4, "Changing speaking rate to %f...", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)_currentTokenIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, a3, (uint64_t)a3, "Last spoken substring range was %{private}@.", (uint8_t *)a2);

}

- (void)_currentTokenIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, v0, v1, "Finished all content, so picking the last token. %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_speakNextTokenFromCurrentTokenIndex:(void *)a1 forward:(NSObject *)a2 boundary:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "speechSequenceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, a2, v6, "Next speech sequence item was %{private}@.", v7);

  OUTLINED_FUNCTION_4();
}

- (void)_speakNextTokenFromCurrentTokenIndex:forward:boundary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_18C62B000, v0, v1, "Skipped to boundary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_skipByUnit:boundary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, v0, v1, "Failed to %{public}@.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_skipByUnit:boundary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, v0, v1, "Succeeded at %{public}@.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_skipByUnit:boundary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, v0, v1, "Current token index was %ld.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_skipByUnit:(void *)a1 boundary:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "speakingContentTokenRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, a2, v4, "Speaking content ranges were %{private}@.", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)_skipByUnit:boundary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, v0, v1, "%{public}@...", v2);
  OUTLINED_FUNCTION_5();
}

- (void)speechSynthesizer:(NSRange)a1 willSpeakRangeOfSpeechString:(uint64_t)a2 utterance:(NSObject *)a3 .cold.1(NSRange a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  v7 = 2113;
  v8 = a2;
  _os_log_error_impl(&dword_18C62B000, a3, OS_LOG_TYPE_ERROR, "Synthesizer will speak range %{private}@ of %{private}@, but we did not track the last utterance range.  It could be that we tried to stop speaking before getting this callback.", v6, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)speechSynthesizer:(NSRange)a1 willSpeakRangeOfSpeechString:(NSObject *)a2 utterance:.cold.2(NSRange a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_18C62B000, a2, v4, "Spoke range %{private}@.", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)speechSynthesizer:(uint64_t)a1 willSpeakRangeOfSpeechString:(void *)a2 utterance:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "lastUtterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a1;
  v8 = 2113;
  v9 = v5;
  _os_log_debug_impl(&dword_18C62B000, a3, OS_LOG_TYPE_DEBUG, "Finished speaking for utterance %{private}@, but last utterance was %{private}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4();
}

@end
