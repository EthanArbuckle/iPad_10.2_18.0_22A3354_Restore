@implementation WFSpeakTextActionOperation

- (WFSpeakTextActionOperation)init
{
  WFSpeakTextActionOperation *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  WFSpeakTextActionOperation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFSpeakTextActionOperation;
  v2 = -[WFSpeakTextActionOperation init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.action.speaktext", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)speakTextUsingSynthesizer:(id)a3 voice:(id)a4 rate:(float)a5 pitch:(float)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  float v18;
  float v19;

  v10 = a3;
  v11 = a4;
  -[WFSpeakTextActionOperation queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__WFSpeakTextActionOperation_speakTextUsingSynthesizer_voice_rate_pitch___block_invoke;
  v15[3] = &unk_24F8BAAB8;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[WFSpeakTextActionOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WFSpeakTextActionOperation_cancel__block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfUtterance:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v8;
  _QWORD block[7];

  length = a4.length;
  location = a4.location;
  -[WFSpeakTextActionOperation queue](self, "queue", a3, a4.location, a4.length, a5);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__WFSpeakTextActionOperation_speechSynthesizer_willSpeakRangeOfUtterance_utterance___block_invoke;
  block[3] = &unk_24F8B40B8;
  block[4] = self;
  block[5] = location;
  block[6] = length;
  dispatch_async(v8, block);

}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[WFSpeakTextActionOperation queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WFSpeakTextActionOperation_speechSynthesizer_didFinishSpeakingUtterance___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  -[WFSpeakTextActionOperation queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__WFSpeakTextActionOperation_speechSynthesizer_didFailSpeakingUtterance_error___block_invoke;
  v9[3] = &unk_24F8BA480;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)cleanupSpeechSynthesizer
{
  NSObject *v3;
  void *v4;
  WFSpeechSynthesizer *synthesizer;

  -[WFSpeakTextActionOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:withOptions:error:", 0, 1, 0);

  synthesizer = self->_synthesizer;
  self->_synthesizer = 0;

}

- (void)callCompletionHandlersWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *completionHandlers;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSpeakTextActionOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
  completionHandlers = self->_completionHandlers;
  self->_completionHandlers = 0;

  objc_storeWeak((id *)&self->_progress, 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addCompletionHandlerIfRunning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFSpeakTextActionOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__WFSpeakTextActionOperation_addCompletionHandlerIfRunning___block_invoke;
  v7[3] = &unk_24F8BB5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSProgress)progress
{
  return (NSProgress *)objc_loadWeakRetained((id *)&self->_progress);
}

- (void)setProgress:(id)a3
{
  objc_storeWeak((id *)&self->_progress, a3);
}

- (WFSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_destroyWeak((id *)&self->_progress);
}

void __60__WFSpeakTextActionOperation_addCompletionHandlerIfRunning___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "synthesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (!v3)
    {
      v4 = objc_opt_new();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    v7 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v3, "addObject:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __79__WFSpeakTextActionOperation_speechSynthesizer_didFailSpeakingUtterance_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupSpeechSynthesizer");
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlersWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __75__WFSpeakTextActionOperation_speechSynthesizer_didFinishSpeakingUtterance___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupSpeechSynthesizer");
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlersWithError:", 0);
}

void __84__WFSpeakTextActionOperation_speechSynthesizer_willSpeakRangeOfUtterance_utterance___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", v1);

}

void __36__WFSpeakTextActionOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), 0);
  objc_msgSend(*(id *)(a1 + 32), "synthesizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

void __73__WFSpeakTextActionOperation_speakTextUsingSynthesizer_voice_rate_pitch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  WFSpeechSynthesizer *v4;
  uint64_t v5;
  void *v6;
  WFSpeechSynthesizer *v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "length");
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalUnitCount:", v2);

  v4 = objc_alloc_init(WFSpeechSynthesizer);
  -[WFSpeechSynthesizer setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;
  v7 = v4;

  -[WFSpeechSynthesizer speakUtterance:usingVoice:rate:pitch:](v7, "speakUtterance:usingVoice:rate:pitch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(float *)(a1 + 56), *(float *)(a1 + 60));
}

@end
