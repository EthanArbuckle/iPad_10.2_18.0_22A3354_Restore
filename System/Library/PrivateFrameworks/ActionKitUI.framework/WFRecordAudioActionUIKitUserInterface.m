@implementation WFRecordAudioActionUIKitUserInterface

- (void)showWithOutputFormat:(int64_t)a3 startImmediately:(BOOL)a4 recordingDuration:(double)a5 completionHandler:(id)a6
{
  id v11;
  void *v12;
  _QWORD block[7];
  BOOL v14;

  v11 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordAudioActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFRecordAudioActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke;
  block[3] = &unk_24E342970;
  v14 = a4;
  *(double *)&block[6] = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithFileRepresentation:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFRecordAudioActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFRecordAudioActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFRecordAudioActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFRecordAudioActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFRecordAudioActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFRecordAudioActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __81__WFRecordAudioActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithFileRepresentation:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  WFAudioRecorderViewController *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v2 = (void *)MEMORY[0x24BE19628];
  objc_msgSend((id)objc_opt_class(), "datedFilenameForFormat:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proposedTemporaryFileURLForFilename:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[WFAudioRecorderViewController initWithOutputFormat:destinationURL:]([WFAudioRecorderViewController alloc], "initWithOutputFormat:destinationURL:", *(_QWORD *)(a1 + 40), v4);
  -[WFAudioRecorderViewController setStartImmediately:](v5, "setStartImmediately:", *(unsigned __int8 *)(a1 + 56));
  -[WFAudioRecorderViewController setRecordingDuration:](v5, "setRecordingDuration:", *(double *)(a1 + 48));
  objc_initWeak(&location, v5);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_2;
  v6[3] = &unk_24E342948;
  objc_copyWeak(&v7, &location);
  v6[4] = *(_QWORD *)(a1 + 32);
  -[WFAudioRecorderViewController setCompletionHandler:](v5, "setCompletionHandler:", v6);
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_3;
  v12[3] = &unk_24E3433F8;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v12);

}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v1, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithFileRepresentation:error:", v3, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithFileRepresentation:error:", 0, *(_QWORD *)(a1 + 48));
  }
}

@end
