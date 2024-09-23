@implementation _LTSpeakRequest

- (_LTSpeakRequest)initWithLocalePair:(id)a3
{
  _LTSpeakRequest *v3;
  _LTSpeakRequest *v4;
  _LTSpeakRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTSpeakRequest;
  v3 = -[_LTTranslationRequest initWithLocalePair:](&v7, sel_initWithLocalePair_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_ttsPlaybackRate = 1.0;
    v3->_muteTTSBasedOnRingerSwitchIfPossible = 0;
    v5 = v3;
  }

  return v4;
}

- (_LTSpeakRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 handlerQueue:(id)a5
{
  id v9;
  _LTSpeakRequest *v10;
  _LTSpeakRequest *v11;
  _LTSpeakRequest *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_LTSpeakRequest;
  v10 = -[_LTTranslationRequest initWithSourceLocale:targetLocale:](&v14, sel_initWithSourceLocale_targetLocale_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_handlerQueue, a5);
    v12 = v11;
  }

  return v11;
}

- (id)requestContext
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LTSpeakRequest;
  -[_LTTranslationRequest requestContext](&v6, sel_requestContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoute:", 0);
  if (-[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"))
  {
    v4 = 1;
LABEL_5:
    objc_msgSend(v3, "setRoute:", v4);
    goto LABEL_6;
  }
  if (-[_LTTranslationRequest _forcedOnlineTranslation](self, "_forcedOnlineTranslation"))
  {
    v4 = 2;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v3, "setTtsPlaybackRate:", self->_ttsPlaybackRate);
  objc_msgSend(v3, "setMuteTTSBasedOnRingerSwitchIfPossible:", self->_muteTTSBasedOnRingerSwitchIfPossible);
  objc_msgSend(v3, "setCancelOnCleanup:", 1);
  return v3;
}

- (void)_withHandlerQueue:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_LTSpeakRequest handlerQueue](self, "handlerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_LTSpeakRequest handlerQueue](self, "handlerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37___LTSpeakRequest__withHandlerQueue___block_invoke;
    block[3] = &unk_250693F80;
    v8 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[_LTSpeakRequest text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSpeakRequest requestContext](self, "requestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53___LTSpeakRequest__startTranslationWithService_done___block_invoke;
  v11[3] = &unk_250693FA8;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "speak:withContext:completion:", v8, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)ttsAudioStarted:(id)a3 duration:(double)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44___LTSpeakRequest_ttsAudioStarted_duration___block_invoke;
  v8[3] = &unk_250693FD0;
  objc_copyWeak(v10, &location);
  v7 = v6;
  v9 = v7;
  v10[1] = *(id *)&a4;
  -[_LTSpeakRequest _withHandlerQueue:](self, "_withHandlerQueue:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (double)ttsPlaybackRate
{
  return self->_ttsPlaybackRate;
}

- (void)setTtsPlaybackRate:(double)a3
{
  self->_ttsPlaybackRate = a3;
}

- (BOOL)muteTTSBasedOnRingerSwitchIfPossible
{
  return self->_muteTTSBasedOnRingerSwitchIfPossible;
}

- (void)setMuteTTSBasedOnRingerSwitchIfPossible:(BOOL)a3
{
  self->_muteTTSBasedOnRingerSwitchIfPossible = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)audioStartHandler
{
  return self->_audioStartHandler;
}

- (void)setAudioStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_audioStartHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
