@implementation WFAudioRecorderViewController

- (WFAudioRecorderViewController)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4
{
  id v6;
  WFAudioRecorderViewController *v7;
  uint64_t v8;
  WFAudioRecorder *audioRecorder;
  WFAudioRecorderViewController *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAudioRecorderViewController;
  v7 = -[WFAudioRecorderViewController init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE00F98]), "initWithOutputFormat:destinationURL:", a3, v6);
    audioRecorder = v7->_audioRecorder;
    v7->_audioRecorder = (WFAudioRecorder *)v8;

    -[WFAudioRecorder setDelegate:](v7->_audioRecorder, "setDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFAudioRecorderViewController;
  -[WFAudioRecorderViewController viewDidLoad](&v21, sel_viewDidLoad);
  WFLocalizedString(CFSTR("Tap to start recording."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAudioInputViewController statusLabel](self, "statusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[WFAudioInputViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("MicrophoneButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UIImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v9, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_inputButtonTapped, 64);
  objc_msgSend(v5, "addSubview:", v6);
  objc_storeWeak((id *)&self->_inputButton, v6);
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(v6, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -22.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v18);

}

- (void)handleTap
{
  void *v3;
  int v4;

  -[WFAudioRecorderViewController audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    -[WFAudioRecorderViewController setIsFinishing:](self, "setIsFinishing:", 1);
    -[WFAudioRecorderViewController finishRecording](self, "finishRecording");
  }
  else if (!-[WFAudioRecorderViewController isFinishing](self, "isFinishing"))
  {
    -[WFAudioRecorderViewController startRecording](self, "startRecording");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFAudioRecorderViewController;
  -[WFAudioRecorderViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[WFAudioRecorderViewController startImmediately](self, "startImmediately"))
    -[WFAudioRecorderViewController startRecording](self, "startRecording");
}

- (void)startRecording
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  WFLocalizedString(CFSTR("Tap to finish recording."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAudioInputViewController statusLabel](self, "statusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[WFAudioRecorderViewController recordingDuration](self, "recordingDuration");
  v6 = v5;
  -[WFAudioRecorderViewController audioRecorder](self, "audioRecorder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == 0.0)
  {
    objc_msgSend(v7, "startRecording");
  }
  else
  {
    -[WFAudioRecorderViewController recordingDuration](self, "recordingDuration");
    objc_msgSend(v7, "recordForDuration:");
  }

}

- (void)finishRecording
{
  id v2;

  -[WFAudioRecorderViewController audioRecorder](self, "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRecording");

}

- (void)inputButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  _QWORD v25[4];
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEC5148];
  -[WFAudioRecorderViewController inputButton](self, "inputButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceWithView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(v3, "setPresentationSource:", v6);

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "portName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v8, "availableInputs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "portName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v12);
        v20 = (void *)MEMORY[0x24BE19600];
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __50__WFAudioRecorderViewController_inputButtonTapped__block_invoke;
        v25[3] = &unk_24E3439C0;
        v26 = v8;
        v27 = v17;
        objc_msgSend(v20, "buttonWithTitle:subtitle:selected:style:handler:", v18, 0, v19, 0, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addButton:", v21);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BE19378], "cancelButtonWithHandler:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", v22);

  WFUserInterfaceFromViewController();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentAlert:", v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)audioRecorder:(id)a3 didProgressToTime:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BE00F98];
  -[WFAudioRecorderViewController recordingDuration](self, "recordingDuration", a3);
  objc_msgSend(v5, "formattedStringWithDuration:elapsedTime:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Tap to finish recording."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAudioInputViewController statusLabel](self, "statusLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)audioRecorder:(id)a3 didFinishWithDestinationURL:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  v7 = a5;
  -[WFAudioRecorderViewController completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFAudioRecorderViewController completionHandler](self, "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v10, v7);

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)startImmediately
{
  return self->_startImmediately;
}

- (void)setStartImmediately:(BOOL)a3
{
  self->_startImmediately = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (WFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecorder, a3);
}

- (UIButton)inputButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_inputButton);
}

- (void)setInputButton:(id)a3
{
  objc_storeWeak((id *)&self->_inputButton, a3);
}

- (BOOL)isFinishing
{
  return self->_isFinishing;
}

- (void)setIsFinishing:(BOOL)a3
{
  self->_isFinishing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputButton);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __50__WFAudioRecorderViewController_inputButtonTapped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredInput:error:", *(_QWORD *)(a1 + 40), 0);
}

@end
