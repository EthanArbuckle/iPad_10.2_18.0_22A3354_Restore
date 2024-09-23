@implementation CKNotificationAudioViewController

- (void)loadMessage:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  +[CKNotificationContentViewController connectIfNeeded](CKNotificationContentViewController, "connectIfNeeded");
  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CKNotificationAudioViewController_loadMessage___block_invoke;
  v6[3] = &unk_1E274E128;
  v6[4] = self;
  objc_msgSend(v5, "loadMessageWithGUID:completionBlock:", v4, v6);

}

void __49__CKNotificationAudioViewController_loadMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CKAudioController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    v6 = [CKAudioController alloc];
    objc_msgSend(v15, "__ck_mediaObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKAudioController initWithMediaObjects:](v6, "initWithMediaObjects:", v7);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 968);
    *(_QWORD *)(v9 + 968) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "mediaObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 968);
    if (v12)
    {
      objc_msgSend(v14, "setDelegate:");
    }
    else
    {
      *(_QWORD *)(v13 + 968) = 0;

    }
  }

}

- (void)_audioMessageToggled
{
  CKAudioController *audioController;
  void *v4;

  audioController = self->_audioController;
  if (audioController)
  {
    if (-[CKAudioController isPlaying](audioController, "isPlaying"))
    {
      -[CKAudioController pause](self->_audioController, "pause");
    }
    else
    {
      -[CKNotificationAudioViewController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationAudioViewControllerDidStartPlaying");

      -[CKAudioController setShouldUseSpeaker:](self->_audioController, "setShouldUseSpeaker:", 0);
      -[CKAudioController play](self->_audioController, "play");
    }
  }
}

- (CKNotificationAudioViewControllerDelegate)delegate
{
  return (CKNotificationAudioViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioController, 0);
}

@end
