@implementation QLLoopingMediaItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  objc_super v8;
  _QWORD v9[4];
  QLLoopingMediaItemViewController *v10;
  id v11;

  v9[1] = 3221225472;
  v9[2] = __96__QLLoopingMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v9[3] = &unk_24C7256A0;
  v10 = self;
  v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)QLLoopingMediaItemViewController;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v11;
  -[QLMediaItemBaseViewController loadPreviewControllerWithContents:context:completionHandler:](&v8, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, a4, v9);

}

void __96__QLLoopingMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShouldFit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "imageSize");
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLLoopingMediaItemViewController;
  -[QLMediaItemBaseViewController previewDidAppear:](&v5, sel_previewDidAppear_, a3);
  -[QLLoopingMediaItemViewController startObservingItem](self, "startObservingItem");
  v4.receiver = self;
  v4.super_class = (Class)QLLoopingMediaItemViewController;
  -[QLMediaItemBaseViewController play](&v4, sel_play);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject **v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject **v24;
  NSObject *v25;
  objc_super v26;
  uint8_t buf[16];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == &AVLoopPlayerCurrentItemObservationContext)
  {
    v14 = v11;
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      v24 = (NSObject **)MEMORY[0x24BE7BF48];
      v25 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4F5000, v25, OS_LOG_TYPE_DEBUG, "Play queue emptied out due to bad player item. End looping. #Media", buf, 2u);
      }
      -[QLLoopingMediaItemViewController pause](self, "pause");
      goto LABEL_20;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
      v28 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      objc_msgSend(v17, "seekToTime:completionHandler:", buf, 0);
      -[QLLoopingMediaItemViewController stopObservingItem](self, "stopObservingItem");
      objc_msgSend(v14, "insertItem:afterItem:", v17, 0);
      -[QLLoopingMediaItemViewController startObservingItem](self, "startObservingItem");
    }
    goto LABEL_14;
  }
  if (a6 == &AVLoopPlayerCurrentItemStatusObservationContext)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v18 || objc_msgSend(v14, "unsignedIntegerValue") != 2)
      goto LABEL_20;
    v17 = v11;
    v19 = (NSObject **)MEMORY[0x24BE7BF48];
    v20 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      objc_msgSend(v17, "currentItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_20D4F5000, v21, OS_LOG_TYPE_ERROR, "End looping since player item has failed with error %@ #Media", buf, 0xCu);

    }
    -[QLLoopingMediaItemViewController pause](self, "pause");
LABEL_14:

LABEL_20:
    goto LABEL_21;
  }
  v26.receiver = self;
  v26.super_class = (Class)QLLoopingMediaItemViewController;
  -[QLMediaItemBaseViewController observeValueForKeyPath:ofObject:change:context:](&v26, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_21:

}

- (void)dealloc
{
  objc_super v3;

  -[QLLoopingMediaItemViewController stopObservingItem](self, "stopObservingItem");
  v3.receiver = self;
  v3.super_class = (Class)QLLoopingMediaItemViewController;
  -[QLMediaItemBaseViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)play
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  -[QLLoopingMediaItemViewController startObservingItem](self, "startObservingItem");
  v6.receiver = self;
  v6.super_class = (Class)QLLoopingMediaItemViewController;
  v3 = -[QLMediaItemBaseViewController play](&v6, sel_play);
  if (v3)
  {
    -[QLItemViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewItemViewController:wantsFullScreen:", self, 1);

  }
  return v3;
}

- (BOOL)pause
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLLoopingMediaItemViewController;
  v3 = -[QLMediaItemBaseViewController pause](&v5, sel_pause);
  -[QLLoopingMediaItemViewController stopObservingItem](self, "stopObservingItem");
  return v3;
}

- (void)setupPlayerWithMediaAsset:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  Float64 Seconds;
  _BOOL4 v13;
  const char *v14;
  CMTime v15[2];
  CMTime time1;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  memset(&v15[1], 0, sizeof(CMTime));
  if (v4)
    objc_msgSend(v4, "duration");
  CMTimeMake(v15, 1, 100);
  time1 = v15[1];
  if (CMTimeCompare(&time1, v15) < 0 || !-[QLMediaItemBaseViewController playable](self, "playable"))
  {
    v9 = (NSObject **)MEMORY[0x24BE7BF48];
    v10 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      time1 = v15[1];
      v11 = v10;
      Seconds = CMTimeGetSeconds(&time1);
      v13 = -[QLMediaItemBaseViewController playable](self, "playable");
      v14 = "NO";
      if (v13)
        v14 = "YES";
      LODWORD(time1.value) = 134218242;
      *(Float64 *)((char *)&time1.value + 4) = Seconds;
      LOWORD(time1.flags) = 2080;
      *(_QWORD *)((char *)&time1.flags + 2) = v14;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_ERROR, "Can't loop. Asset duration too short (%1.3f sec) or not playable(isPlayable: %s) #Media", (uint8_t *)&time1, 0x16u);

    }
  }
  else
  {
    time1 = v15[1];
    for (i = (unint64_t)(1.0 / CMTimeGetSeconds(&time1) + 2.0); i; --i)
    {
      objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[QLLoopingMediaItemViewController player](self, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertItem:afterItem:", v7, 0);

      }
    }
    -[QLLoopingMediaItemViewController startObservingItem](self, "startObservingItem");
  }

}

- (void)startObservingItem
{
  if (!self->_addedObservers)
  {
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_queuePlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 2, &AVLoopPlayerCurrentItemObservationContext);
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_queuePlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.status"), 1, &AVLoopPlayerCurrentItemStatusObservationContext);
    self->_addedObservers = 1;
  }
}

- (void)stopObservingItem
{
  if (self->_addedObservers)
  {
    -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_queuePlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), &AVLoopPlayerCurrentItemObservationContext);
    -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_queuePlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), &AVLoopPlayerCurrentItemStatusObservationContext);
    self->_addedObservers = 0;
  }
}

- (id)player
{
  AVQueuePlayer *queuePlayer;
  AVQueuePlayer *v4;
  AVQueuePlayer *v5;

  queuePlayer = self->_queuePlayer;
  if (!queuePlayer)
  {
    v4 = (AVQueuePlayer *)objc_opt_new();
    v5 = self->_queuePlayer;
    self->_queuePlayer = v4;

    queuePlayer = self->_queuePlayer;
  }
  return queuePlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuePlayer, 0);
}

@end
