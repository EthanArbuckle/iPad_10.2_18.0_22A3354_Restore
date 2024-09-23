@implementation AFConnectionClientServiceDelegate

- (AFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  AFConnectionClientServiceDelegate *v8;
  AFConnectionClientServiceDelegate *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *targetQueue;
  OS_dispatch_queue *v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AFConnectionClientServiceDelegate;
  v8 = -[AFConnectionClientServiceDelegate init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v10;
    }
    else
    {
      v12 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v12;
    }

  }
  return v9;
}

- (id)_connectionDelegate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)requestHandleCommand:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AFConnectionClientServiceDelegate *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke;
  block[3] = &unk_1E3A36E10;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *targetQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AFConnectionClientServiceDelegate *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__AFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke;
  v15[3] = &unk_1E3A346A0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(targetQueue, v15);

}

- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AFConnectionClientServiceDelegate *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke;
  block[3] = &unk_1E3A36E10;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)requestRequestedDismissAssistant
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__AFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

- (void)requestDidUpdateResponseMode:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

- (void)quickStopWasHandledWithActions:(unint64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

- (void)getBulletinContext:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__AFConnectionClientServiceDelegate_getBulletinContext___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)acousticIDRequestWillStart
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)musicWasDetected
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AFConnectionClientServiceDelegate_musicWasDetected__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)invalidateCurrentUserActivity
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)cacheImage:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AFConnectionClientServiceDelegate_cacheImage___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)extensionRequestWillStartForApplication:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__AFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__AFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)shouldSpeakChanged:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

- (void)audioSessionIDChanged:(unsigned int)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  unsigned int v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__AFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke;
  v4[3] = &unk_1E3A333B0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

- (void)aceConnectionWillRetryOnError:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *targetQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  kdebug_trace();
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__AFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke;
  v13[3] = &unk_1E3A2FF90;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(targetQueue, v13);

}

- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  NSObject *targetQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;

  v12 = a3;
  v13 = a7;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__AFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke;
  block[3] = &unk_1E3A2CCA8;
  block[4] = self;
  v18 = v12;
  v21 = a4;
  v22 = a5;
  v19 = v13;
  v20 = a6;
  v15 = v13;
  v16 = v12;
  dispatch_async(targetQueue, block);

}

- (void)speechRecordingStartpointDetectedWithReply:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__AFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__AFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke;
  block[3] = &unk_1E3A35410;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(targetQueue, block);

}

- (void)speechRecordingDidEndWithReply:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke;
  block[3] = &unk_1E3A35410;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

- (void)speechRecordingDidCancelWithReply:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)speechRecordingDidFail:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)willStopRecordingWithSignpostID:(unint64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

- (void)speechRecognized:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AFConnectionClientServiceDelegate_speechRecognized___block_invoke;
  block[3] = &unk_1E3A353E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *targetQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__AFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_1E3A369B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(targetQueue, v15);

}

- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__AFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)speechRecognizedPartialResult:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke;
  block[3] = &unk_1E3A353E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

- (void)speechRecognitionDidFail:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E3A353E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__AFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__AFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke;
  block[3] = &unk_1E3A2FF68;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(targetQueue, block);

}

- (void)audioPlaybackRequestWillStart:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)audioPlaybackRequestDidStart:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *targetQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__AFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke;
  v13[3] = &unk_1E3A2F350;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(targetQueue, v13);

}

- (void)startPlaybackDidFail:(int64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

- (void)audioSessionWillBecomeActive:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__AFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

- (void)audioSessionDidBecomeActive:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E3A33A28;
  objc_copyWeak(&v9, &to);
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

- (void)appLaunchFailedWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E3A33A28;
  objc_copyWeak(&v9, &to);
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

- (void)networkDidBecomeActive
{
  NSObject *targetQueue;
  _QWORD v4[4];
  id v5;
  id to;

  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__AFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &to);
  dispatch_async(targetQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

void __59__AFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_markNetworkDidBecomeActive");

}

void __73__AFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellDelegateFailedToLaunchAppWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

void __78__AFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellDelegateWillProcessAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

void __65__AFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidBecomeActive:", *(unsigned __int8 *)(a1 + 40));

}

void __66__AFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionWillBecomeActive:", *(unsigned __int8 *)(a1 + 40));

}

void __58__AFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateStartPlaybackDidFail:", *(_QWORD *)(a1 + 40));

}

void __80__AFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateWillProcessStartPlayback:intent:completion:", a1[7], a1[5], a1[6]);

}

void __71__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestDidStop:error:", a1[5], a1[6]);

}

void __66__AFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestDidStart:", *(_QWORD *)(a1 + 40));

}

void __67__AFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestWillStart:", *(_QWORD *)(a1 + 40));

}

void __77__AFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidEndInterruption:userInfo:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __82__AFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:", *(_QWORD *)(a1 + 40));

}

void __62__AFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_cancelRequestTimeoutForReason:", v3);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "_tellSpeechDelegateRecognitionDidFail:", *(_QWORD *)(a1 + 40));

}

void __67__AFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_extendExistingRequestTimeoutForReason:", v3);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "_tellSpeechDelegateSpeechRecognizedPartialResult:", *(_QWORD *)(a1 + 40));

}

void __86__AFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecognitionUpdateWillBeginForTask:", *(_QWORD *)(a1 + 40));

}

void __97__AFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:utterances:refId:", a1[5], a1[6], a1[7]);

}

void __84__AFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:refId:", a1[5], a1[6]);

}

void __54__AFConnectionClientServiceDelegate_speechRecognized___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_markSpeechRecognized");
  objc_msgSend(WeakRetained, "_extendRequestTimeoutForReason:durationInSeconds:", v2, 0.0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateSpeechRecognized:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "_beginInterstitialsForReason:", v2);

}

void __69__AFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_willStopRecordingWithSignpostID:", *(_QWORD *)(a1 + 40));

}

uint64_t __66__AFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_speechRecordingDidFailWithError:", a1[5]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__AFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_updateStateIfNotInSync");
  objc_msgSend(WeakRetained, "_checkAndSetIsCapturingSpeech:", 0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidCancel");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

void __68__AFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_extendRequestTimeoutForReason:durationInSeconds:", v2, 0.0);
  objc_msgSend(WeakRetained, "_checkAndSetIsCapturingSpeech:", 0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidEnd");
  objc_msgSend(WeakRetained, "_beginInterstitialsForReason:", v2);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __87__AFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateToPerformTwoShotPromptWithType:reply:", a1[6], a1[5]);

}

uint64_t __80__AFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidDetectStartpoint");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __119__AFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setRecordRoute:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(WeakRetained, "_markIsDucking");
  if (*(_BYTE *)(a1 + 65))
    objc_msgSend(WeakRetained, "_markIsTwoShot");
  v2 = WeakRetained;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_updateSpeechEndHostTime:");
    v2 = WeakRetained;
  }
  objc_msgSend(v2, "_tellSpeechDelegateRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __97__AFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setAudioSessionID:", *(unsigned int *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setRecordRoute:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:audioSessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateStateIfNotInSync");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

uint64_t __97__AFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v3 = objc_msgSend(WeakRetained, "_startInputAudioPowerUpdatesWithXPCWrapper:", a1[5]);

  v4 = objc_loadWeakRetained((id *)(a1[4] + 8));
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = 0;
  else
    v6 = a1[5];
  objc_msgSend(v4, "_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:", v6);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__AFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_aceConnectionWillRetryOnError:", *(_QWORD *)(a1 + 40));

}

void __59__AFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setAudioSessionID:", *(unsigned int *)(a1 + 40));

}

void __56__AFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 40));

}

void __82__AFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateExtensionRequestFinishedForApplication:error:", a1[5], a1[6]);

}

void __77__AFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateExtensionRequestWillStartForApplication:", *(_QWORD *)(a1 + 40));

}

void __48__AFConnectionClientServiceDelegate_cacheImage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateCacheImage:", *(_QWORD *)(a1 + 40));

}

void __66__AFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateInvalidateCurrentUserActivity");

}

void __68__AFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateSetUserActivityInfo:webpageURL:", a1[5], a1[6]);

}

void __75__AFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateDidFinishAcousticIDRequestWithSuccess:", *(unsigned __int8 *)(a1 + 40));

}

void __53__AFConnectionClientServiceDelegate_musicWasDetected__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateDidDetectMusic");

}

void __63__AFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateWillStartAcousticIDRequest");

}

void __56__AFConnectionClientServiceDelegate_getBulletinContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "_cachedBulletins");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

void __68__AFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[AFConnectionClientServiceDelegate quickStopWasHandledWithActions:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s %@ Got quick stop handled message with actions %tu taken.", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnection:didHandleQuickStopWithAction:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

void __70__AFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "requestDidAskForTimeoutExtension:", *(double *)(a1 + 40));

}

void __66__AFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[AFFeatureFlags isStateFeedbackEnabled](AFFeatureFlags, "isStateFeedbackEnabled"))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v7 = 136315650;
      v8 = "-[AFConnectionClientServiceDelegate requestDidUpdateResponseMode:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #modes %@ Got update to response mode : %@", (uint8_t *)&v7, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v5, "assistantConnection:didUpdateResponseMode:", WeakRetained, *(_QWORD *)(a1 + 40));

    }
  }
}

void __80__AFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[AFConnectionClientServiceDelegate requestRequestedDismissAssistantWithReason:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message with reason : %ld", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnection:dismissAssistantWithReason:", WeakRetained, *(_QWORD *)(a1 + 40));
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnectionDismissAssistant:", WeakRetained);
    goto LABEL_7;
  }
LABEL_8:

}

void __69__AFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[AFConnectionClientServiceDelegate requestRequestedDismissAssistant]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "assistantConnectionDismissAssistant:", WeakRetained);

  }
}

void __67__AFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_connectionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v4, "assistantConnection:openURL:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[AFConnectionClientServiceDelegate requestRequestedOpenURL:reply:]_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected nil URL", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __91__AFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_connectionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v4, "assistantConnection:openApplicationWithBundleID:URL:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[AFConnectionClientServiceDelegate requestRequestedOpenApplicationWithBundleID:URL:reply:]_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected nil bundle ID", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke(uint64_t a1)
{
  double ClientCommandDeliveryDelay;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  dispatch_time_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal
    && (ClientCommandDeliveryDelay = _AFPreferencesGetClientCommandDeliveryDelay(), ClientCommandDeliveryDelay > 0.0))
  {
    v3 = ClientCommandDeliveryDelay;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    v6 = v5;

    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v23 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
      v24 = 2112;
      v25 = v15;
      v26 = 2048;
      v27 = v3;
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s Delaying delivery of client command %@ by %f seconds...", buf, 0x20u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "_activeRequestUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v11 + 16);
    block[2] = __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_690;
    block[3] = &unk_1E3A2E230;
    block[1] = 3221225472;
    block[4] = v11;
    v18 = v9;
    v19 = v12;
    v21 = v6;
    v20 = *(id *)(a1 + 48);
    v14 = v9;
    dispatch_after(v10, v13, block);

  }
  else
  {
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v16, "_handleCommand:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __64__AFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_690(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_activeRequestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  v5 = AFSiriLogContextConnection;
  v6 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = (void *)MEMORY[0x1E0CB3898];
      v10 = v5;
      objc_msgSend(v9, "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v13 = v12 - *(double *)(a1 + 64);
      v15 = 136315650;
      v16 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      v19 = 2048;
      v20 = v13;
      _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s Delayed delivery of client command %@ by %f seconds.", (uint8_t *)&v15, 0x20u);

    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v7, "_handleCommand:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else if (v6)
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = 136315394;
    v16 = "-[AFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
    v17 = 2112;
    v18 = v14;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Dropping delayed client command %@ because request already ended.", (uint8_t *)&v15, 0x16u);
  }
}

void __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2;
  v4[3] = &unk_1E3A2C9D8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "_handleCommand:reply:", v3, v4);

}

uint64_t __68__AFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__AFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_startUIRequestWithInfo:completion:", a1[5], a1[6]);

}

void __71__AFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_startUIRequestWithText:completion:", a1[5], a1[6]);

}

@end
