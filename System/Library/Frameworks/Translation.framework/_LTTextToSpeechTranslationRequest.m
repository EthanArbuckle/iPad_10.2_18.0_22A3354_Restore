@implementation _LTTextToSpeechTranslationRequest

- (id)loggingType
{
  return CFSTR("textToSpeech");
}

- (id)requestContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTTextToSpeechTranslationRequest;
  -[_LTTranslationRequest requestContext](&v7, sel_requestContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest outputFileURL](self, "outputFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputFileURL:", v4);

  v5 = 1;
  objc_msgSend(v3, "setCancelOnCleanup:", 1);
  objc_msgSend(v3, "setRoute:", 0);
  if (-[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"))
    goto LABEL_4;
  if (-[_LTTranslationRequest _forcedOnlineTranslation](self, "_forcedOnlineTranslation"))
  {
    v5 = 2;
LABEL_4:
    objc_msgSend(v3, "setRoute:", v5);
  }
  return v3;
}

- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  return -[_LTTextToSpeechTranslationRequest initWithSourceLocale:targetLocale:suggestedUniqueID:](self, "initWithSourceLocale:targetLocale:suggestedUniqueID:", a3, a4, 0);
}

- (_LTTextToSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTLocalePair *v11;
  _LTTextToSpeechTranslationRequest *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v10, v9);

  v12 = -[_LTTextToSpeechTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", v11, v8);
  return v12;
}

- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3
{
  return -[_LTTextToSpeechTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", a3, 0);
}

- (_LTTextToSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  _LTTextToSpeechTranslationRequest *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  _LTTextToSpeechTranslationRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTTextToSpeechTranslationRequest;
  v4 = -[_LTTranslationRequest initWithLocalePair:suggestedUniqueID:](&v9, sel_initWithLocalePair_suggestedUniqueID_, a3, a4);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v7 = v4;
  }

  return v4;
}

- (id)nativeAudioFormat
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &SupportedASBD);
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_DEFAULT, "Start text to speech translation with service", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___LTTextToSpeechTranslationRequest__startTranslationWithService_done___block_invoke;
  block[3] = &unk_2506936E0;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)_translationFailedWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationDidFinishWithError:", v7);

  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235438000, v5, OS_LOG_TYPE_INFO, "TextToSpeechTranslation did receive translation result", v9, 2u);
  }
  -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "translatorDidTranslate:", v4);

  }
}

- (void)translationDidFinishWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void (**done)(void);
  id v8;

  v8 = a3;
  -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTTextToSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationDidFinishWithError:", v8);

  }
  done = (void (**)(void))self->_done;
  if (done)
    done[2]();

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
