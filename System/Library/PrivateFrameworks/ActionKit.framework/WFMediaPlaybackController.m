@implementation WFMediaPlaybackController

- (WFMediaPlaybackController)init
{
  WFMediaPlaybackController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  WFMediaPlaybackController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFMediaPlaybackController;
  v2 = -[WFMediaPlaybackController init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.shortcuts.WFMediaController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)getLocalPlaybackCapabilityWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)getCurrentlyPlayingMediaWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]";
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_INFO, "%s Starting fetching currently playing song information...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke;
  v7[3] = &unk_24F8B0678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WFMediaPlaybackController getActivePlayerPathWithCompletion:](self, "getActivePlayerPathWithCompletion:", v7);

}

- (void)getPreferredPlaybackOriginWithCompletion:(id)a3
{
  uint64_t LocalOrigin;
  id v5;

  v5 = a3;
  LocalOrigin = MRMediaRemoteGetLocalOrigin();
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(v5, LocalOrigin, 1);

}

- (void)getPreferredMediaControlOriginWithCompletion:(id)a3
{
  uint64_t LocalOrigin;
  id v5;

  v5 = a3;
  LocalOrigin = MRMediaRemoteGetLocalOrigin();
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(v5, LocalOrigin, 1);

}

- (void)queueMediaItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v8 = a5;
  v9 = a3;
  objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getMPModelSongClass(), "kindWithVariants:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke;
  v18 = &unk_24F8B06F0;
  v19 = v11;
  v20 = v10;
  v12 = v10;
  v13 = v11;
  objc_msgSend(v9, "if_map:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaPlaybackController queueItemsWithIdentifierSets:inAdditionMode:completion:](self, "queueItemsWithIdentifierSets:inAdditionMode:completion:", v14, a4, v8, v15, v16, v17, v18);
}

- (void)queueiTunesStoreItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a3;
  objc_msgSend(getMPModelSongClass(), "kindWithVariants:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke;
  v13[3] = &unk_24F8B0768;
  v14 = v10;
  v11 = v10;
  objc_msgSend(v9, "if_map:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaPlaybackController queueItemsWithIdentifierSets:inAdditionMode:completion:](self, "queueItemsWithIdentifierSets:inAdditionMode:completion:", v12, a4, v8);
}

- (void)queueItemsWithIdentifierSets:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  unint64_t v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaPlaybackController.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierSets"));

  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(getMPModelSongClass(), "kindWithVariants:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v12 = (void *)getMPModelLibraryRequestClass_softClass;
    v31 = getMPModelLibraryRequestClass_softClass;
    v13 = MEMORY[0x24BDAC760];
    if (!getMPModelLibraryRequestClass_softClass)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __getMPModelLibraryRequestClass_block_invoke;
      v27[3] = &unk_24F8BB430;
      v27[4] = &v28;
      __getMPModelLibraryRequestClass_block_invoke((uint64_t)v27);
      v12 = (void *)v29[3];
    }
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v28, 8);
    v15 = objc_alloc_init(v14);
    objc_msgSend(v15, "setItemKind:", v11);
    objc_msgSend(getMPPropertySetClass(), "emptyPropertySet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItemProperties:", v16);

    objc_msgSend(v15, "setAllowedItemIdentifiers:", v9);
    getMPCPlayerRequestClass();
    objc_msgSend(v9, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playbackIntentWithStartItemIdentifiers:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setShuffleMode:", -1);
    v19 = objc_alloc_init((Class)getMPCPlayerRequestClass());
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __84__WFMediaPlaybackController_queueItemsWithIdentifierSets_inAdditionMode_completion___block_invoke;
    v23[3] = &unk_24F8B0790;
    v25 = v10;
    v26 = a4;
    v24 = v18;
    v20 = v18;
    v21 = (id)objc_msgSend(v19, "performWithCompletion:", v23);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)clearQueueWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init((Class)getMPCPlayerRequestClass());
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WFMediaPlaybackController_clearQueueWithCompletion___block_invoke;
  v7[3] = &unk_24F8B07B8;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "performWithCompletion:", v7);

}

- (void)getActivePlayerPathWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]";
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_INFO, "%s Querying active player path...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__WFMediaPlaybackController_getActivePlayerPathWithCompletion___block_invoke;
  v7[3] = &unk_24F8B07E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WFMediaPlaybackController getPreferredMediaControlOriginWithCompletion:](self, "getPreferredMediaControlOriginWithCompletion:", v7);

}

- (void)getRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Getting remote control endpoints for UIDs: %@", buf, 0x16u);
  }

  getWFActionsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]";
    _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s Nullifying existing reconSession.", buf, 0xCu);
  }

  -[WFMediaPlaybackController setReconSession:](self, "setReconSession:", 0);
  -[WFMediaPlaybackController setReconSession:](self, "setReconSession:", MRAVReconnaissanceSessionCreateWithEndpointFeatures());
  -[WFMediaPlaybackController reconSession](self, "reconSession");
  MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints();
  -[WFMediaPlaybackController reconSession](self, "reconSession");
  MRAVReconnaissanceSessionSetReturnPartialResults();
  -[WFMediaPlaybackController reconSession](self, "reconSession");
  v11 = v7;
  v10 = v7;
  MRAVReconnaissanceSessionBeginEndpointsSearch();

}

- (void)connectToEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t LocalOrigin;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[WFMediaPlaybackController connectToEndpoint:completion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Connecting to endpoint: %@", (uint8_t *)&v13, 0x16u);
  }

  if (v6 && !objc_msgSend(v6, "isLocalEndpoint"))
  {
    objc_msgSend(v6, "externalDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "externalDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMediaPlaybackController connectToExternalDevice:completion:](self, "connectToExternalDevice:completion:", v11, v7);
    }
    else
    {
      getWFActionsLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "-[WFMediaPlaybackController connectToEndpoint:completion:]";
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_ERROR, "%s No device for endpoint %{public}@", (uint8_t *)&v13, 0x16u);
      }

      -[WFMediaPlaybackController createSendCommandError:](self, "createSendCommandError:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v11);
    }

  }
  else
  {
    LocalOrigin = MRMediaRemoteGetLocalOrigin();
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, LocalOrigin, 0);
  }

}

- (void)connectToExternalDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Connecting to external device: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__WFMediaPlaybackController_connectToExternalDevice_completion___block_invoke;
  v12[3] = &unk_24F8B0830;
  objc_copyWeak(&v14, (id *)buf);
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  -[WFMediaPlaybackController queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConnectionStateCallback:withQueue:", v12, v10);

  v15 = *MEMORY[0x24BE64FD0];
  v16 = CFSTR("WFMediaPlaybackController");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectWithOptions:userInfo:", 0, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (id)createSendCommandError:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("WFMediaPlaybackControllerErrorDomain"), a3, v5);

  return v6;
}

- (void)sendCommand:(unsigned int)a3 origin:(void *)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v8 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  getWFActionsLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)MRMediaRemoteCopyCommandDescription();
    v14 = 136315394;
    v15 = "-[WFMediaPlaybackController sendCommand:origin:options:completion:]";
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_INFO, "%s Sending command: %@", (uint8_t *)&v14, 0x16u);

  }
  if (a4)
    -[WFMediaPlaybackController sendCommand:playerPath:options:completion:](self, "sendCommand:playerPath:options:completion:", v8, MRNowPlayingPlayerPathCreate(), v10, v11);
  else
    -[WFMediaPlaybackController sendCommand:options:completion:](self, "sendCommand:options:completion:", v8, v10, v11);

}

- (void)sendCommand:(unsigned int)a3 playerPath:(void *)a4 options:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;

  v8 = a6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFMediaPlaybackController_sendCommand_playerPath_options_completion___block_invoke;
  aBlock[3] = &unk_24F8B1E38;
  v14 = v8;
  v9 = v8;
  v10 = a5;
  v11 = _Block_copy(aBlock);
  -[WFMediaPlaybackController queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteSendCommandToPlayer();

}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  unsigned int v18;

  v8 = a5;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __60__WFMediaPlaybackController_sendCommand_options_completion___block_invoke;
  v16 = &unk_24F8B0858;
  v18 = a3;
  v17 = v8;
  v9 = v8;
  v10 = a4;
  v11 = _Block_copy(&v13);
  -[WFMediaPlaybackController queue](self, "queue", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteSendCommandWithReply();

}

- (void)sendCommandToDevicesWithUIDs:(unsigned int)a3 deviceUIDs:(id)a4 options:(id)a5 sendTwice:(BOOL)a6 completion:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;
  id v27;
  int v28;
  BOOL v29;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (objc_msgSend(v12, "count"))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2;
    v20[3] = &unk_24F8B0920;
    v21 = v13;
    v22 = v14;
    v23 = v10;
    v20[4] = self;
    v24 = a6;
    v15 = v13;
    v16 = v14;
    -[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:](self, "getRemoteControlEndpointsMatchingUIDs:completion:", v12, v20);

    v17 = v22;
  }
  else
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke;
    v25[3] = &unk_24F8B0880;
    v29 = a6;
    v28 = v10;
    v25[4] = self;
    v26 = v13;
    v27 = v14;
    v18 = v13;
    v19 = v14;
    -[WFMediaPlaybackController sendCommand:origin:options:completion:](self, "sendCommand:origin:options:completion:", v10, 0, v18, v25);

    v17 = v26;
  }

}

- (void)playPauseOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 2, a3, 0, 0, a4);
}

- (void)playOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 0, a3, 0, 0, a4);
}

- (void)pauseOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 1, a3, 0, 0, a4);
}

- (void)skipForwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = (void *)*MEMORY[0x24BE659C0];
  v8 = v14;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 17, v11, v13, 0, v10);
}

- (void)skipBackwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = (void *)*MEMORY[0x24BE659C0];
  v8 = v14;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 18, v11, v13, 0, v10);
}

- (void)skipToPositionOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = (void *)*MEMORY[0x24BE65940];
  v8 = v14;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 24, v11, v13, 0, v10);
}

- (void)goToNextTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 4, a3, 0, 0, a4);
}

- (void)goToPreviousTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 5, a3, 0, 0, a4);
}

- (void)goToBeginningOfTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
  -[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:](self, "sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:completion:", 5, a3, 0, 0, a4);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)reconSession
{
  return self->_reconSession;
}

- (void)setReconSession:(void *)a3
{
  self->_reconSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 60))
    return objc_msgSend(*(id *)(a1 + 32), "sendCommand:origin:options:completion:", *(unsigned int *)(a1 + 56), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  dispatch_group_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  _BYTE *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t v36;
  id v37;
  _QWORD aBlock[4];
  NSObject *v39;
  uint64_t v40;
  id v41;
  _BYTE *v42;
  int v43;
  char v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v7, "count") || !objc_msgSend(v8, "count"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v46 = __Block_byref_object_copy__2893;
      v47 = __Block_byref_object_dispose__2894;
      v48 = 0;
      v10 = dispatch_group_create();
      v11 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_153;
      aBlock[3] = &unk_24F8B08D0;
      v42 = buf;
      v12 = v10;
      v13 = *(_QWORD *)(a1 + 32);
      v39 = v12;
      v40 = v13;
      v43 = *(_DWORD *)(a1 + 56);
      v41 = *(id *)(a1 + 40);
      v44 = *(_BYTE *)(a1 + 60);
      v14 = _Block_copy(aBlock);
      v34[0] = v11;
      v34[1] = 3221225472;
      v34[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_4;
      v34[3] = &unk_24F8B08F8;
      v15 = v12;
      v16 = *(_QWORD *)(a1 + 32);
      v35 = v15;
      v36 = v16;
      v17 = v14;
      v37 = v17;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v34);
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_5;
      block[3] = &unk_24F8BB590;
      v32 = *(id *)(a1 + 48);
      v33 = buf;
      dispatch_group_notify(v15, v18, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      getWFActionsLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:compl"
                             "etion:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_22D353000, v19, OS_LOG_TYPE_INFO, "%s Found no endpoints for provided UIDs, only devices: %@", buf, 0x16u);
      }

      if (v9)
      {
        objc_msgSend(v9, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");

      }
      else
      {
        v21 = (void *)objc_opt_new();
      }
      v25 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedPluralString(CFSTR("These devices can't be controlled remotely."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v26, objc_msgSend(v8, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDD0FC8]);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFMediaPlaybackControllerErrorDomain"), objc_msgSend(v9, "code"), v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    getWFActionsLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:complet"
                           "ion:]_block_invoke_2";
      _os_log_impl(&dword_22D353000, v22, OS_LOG_TYPE_INFO, "%s Found no endpoints and no devices for provided UIDs.", buf, 0xCu);
    }

    if (v9)
    {
      objc_msgSend(v9, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

    }
    else
    {
      v24 = (void *)objc_opt_new();
    }
    WFLocalizedString(CFSTR("No endpoints were found."));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDD0FC8]);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFMediaPlaybackControllerErrorDomain"), objc_msgSend(v9, "code"), v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_153(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  char v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;

  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2_154;
    aBlock[3] = &unk_24F8B4F78;
    v22 = *(_QWORD *)(a1 + 56);
    v21 = *(id *)(a1 + 32);
    v9 = _Block_copy(aBlock);
    v10 = *(unsigned int *)(a1 + 64);
    v12 = *(void **)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_3;
    v14[3] = &unk_24F8B08A8;
    v19 = *(_BYTE *)(a1 + 68);
    v18 = v10;
    v14[4] = v12;
    v17 = a3;
    v15 = v11;
    v16 = v9;
    v13 = v9;
    objc_msgSend(v12, "sendCommand:origin:options:completion:", v10, a3, v15, v14);

  }
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  objc_msgSend(*(id *)(a1 + 40), "connectToEndpoint:completion:", v4, *(_QWORD *)(a1 + 48));

}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2_154(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 68))
    return objc_msgSend(*(id *)(a1 + 32), "sendCommand:origin:options:completion:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __60__WFMediaPlaybackController_sendCommand_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "firstObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = (int)v4,
        v4,
        v5))
  {
    if (v5 == 2)
    {
      v6 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
      v7 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0BA0];
      v17[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WFMediaPlaybackControllerErrorDomain"), 2, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MRMediaRemoteCopyCommandDescription();
      getWFActionsLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 136315650;
        v11 = "-[WFMediaPlaybackController sendCommand:options:completion:]_block_invoke";
        v12 = 2114;
        v13 = v6;
        v14 = 1024;
        v15 = v5;
        _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s %{public}@ received a non-success status: '%u'", (uint8_t *)&v10, 0x1Cu);
      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__WFMediaPlaybackController_sendCommand_playerPath_options_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WFMediaPlaybackControllerErrorDomain"), a2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__WFMediaPlaybackController_connectToExternalDevice_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2 == 3)
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315650;
      v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
      v14 = 2114;
      v15 = WeakRetained;
      v16 = 2114;
      v17 = a3;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s Connection failed %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(WeakRetained, "setConnectionStateCallback:withQueue:", 0, 0);
  }
  else if (a2 == 2)
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEBUG, "%s Successfully connected to external device.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(WeakRetained, "customOrigin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      getWFActionsLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
        v14 = 2114;
        v15 = WeakRetained;
        _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_ERROR, "%s No origin for %{public}@", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "createSendCommandError:", 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    objc_msgSend(WeakRetained, "setConnectionStateCallback:withQueue:", 0, 0);

  }
}

void __78__WFMediaPlaybackController_getRemoteControlEndpointsMatchingUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  if (v7)
  {
    if (objc_msgSend(v7, "code") == 26
      && (objc_msgSend(v7, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = (void *)*MEMORY[0x24BE65728],
          v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE65728]),
          v11,
          v10,
          v12))
    {
      v13 = objc_msgSend(v8, "count");
      getWFActionsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (!v13)
      {
        if (!v15)
          goto LABEL_13;
        v20 = 136315138;
        v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        v16 = "%s Search for remote control endpoints timed out with no results.";
        v17 = v14;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 12;
        goto LABEL_12;
      }
      if (v15)
      {
        v20 = 136315394;
        v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        v22 = 2114;
        v23 = (uint64_t)v8;
        v16 = "%s Search for remote control endpoints timed out with partial results. Found endpoints: %{public}@";
LABEL_9:
        v17 = v14;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 22;
LABEL_12:
        _os_log_impl(&dword_22D353000, v17, v18, v16, (uint8_t *)&v20, v19);
      }
    }
    else
    {
      getWFActionsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315394;
        v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        v22 = 2114;
        v23 = (uint64_t)v7;
        v16 = "%s Search for remote control endpoints failed with error: %{public}@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    getWFActionsLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v20 = 136315650;
      v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
      v22 = 2048;
      v23 = objc_msgSend(v8, "count");
      v24 = 2048;
      v25 = objc_msgSend(v9, "count");
      v16 = "%s Search for remote control endpoints succeeded. Found %lu endpoints, %lu devices.";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
      v19 = 32;
      goto LABEL_12;
    }
  }
LABEL_13:

  (*(void (**)(_QWORD, id, id, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8, v9, v7);
}

void __63__WFMediaPlaybackController_getActivePlayerPathWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]_block_invoke";
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Preferred media control origin is local, falling back to [MPCPlayerPath deviceActivePlayerPath]...", (uint8_t *)&v10, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(getMPCPlayerPathClass(), "deviceActivePlayerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, 1);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "bundleIdentifierForMediaPlaybackApplication:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getMPCPlayerPathClass(), "pathWithCustomOrigin:bundleID:playerID:", a2, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]_block_invoke";
      v12 = 2112;
      v13 = a2;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s Preferred media control origin is not local (%@)—constructed player path with bundle ID %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __54__WFMediaPlaybackController_clearQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(a2, "tracklist");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearUpNextItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(getMPCPlayerChangeRequestClass(), "performRequest:completion:", v5, *(_QWORD *)(a1 + 32));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __84__WFMediaPlaybackController_queueItemsWithIdentifierSets_inAdditionMode_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12)
  {
    v10 = *(void (**)(void))(a1[5] + 16);
LABEL_10:
    v10();
    goto LABEL_11;
  }
  v6 = a1[6];
  if (v6 == 1)
  {
    objc_msgSend(v12, "tracklist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertAtEndOfTracklistWithPlaybackIntent:", a1[4]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
LABEL_9:
      v10 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_10;
    }
    objc_msgSend(v12, "tracklist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertAfterPlayingItemWithPlaybackIntent:", a1[4]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  if (!v11)
    goto LABEL_9;
  objc_msgSend(getMPCPlayerChangeRequestClass(), "performRequest:completion:", v11, a1[5]);

LABEL_11:
}

id __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = objc_alloc((Class)getMPIdentifierSetClass());
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_2;
  v9[3] = &unk_24F8B0740;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithModelKind:block:", v5, v9);

  return v7;
}

void __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_3;
  v3[3] = &unk_24F8B0718;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "longLongValue"));

}

id __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = objc_alloc((Class)getMPIdentifierSetClass());
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_2;
  v9[3] = &unk_24F8B06C8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithModelKind:block:", v5, v9);

  return v7;
}

void __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_3;
  v6[3] = &unk_24F8B06A0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v6);

}

void __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));

}

void __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  char v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  _BYTE buf[24];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("remote companion");
    *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_DWORD *)buf = 136315651;
    if (a3)
      v7 = CFSTR("local");
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v29 = (uint64_t)v7;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Resolved active player path: %{private}@, %{public}@", buf, 0x20u);
  }

  if (v5)
  {
    v8 = objc_alloc((Class)getMPPropertySetClass());
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v9 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr;
    v29 = getMPModelRelationshipGenericSongSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericSongSymbolLoc_ptr)
    {
      v10 = MediaPlayerLibrary();
      v9 = (id *)dlsym(v10, "MPModelRelationshipGenericSong");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
      getMPModelRelationshipGenericSongSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(buf, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelRelationshipGenericSong(void)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaPlaybackController.m"), 54, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v11 = *v9;
    v12 = v11;
    if (a3)
    {
      v26 = v11;
      objc_msgSend(getMPPropertySetClass(), "emptyPropertySet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = v11;
      objc_msgSend((id)objc_opt_class(), "songPropertySet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    v16 = (void *)objc_msgSend(v8, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v14);

    v17 = objc_alloc_init((Class)getMPCPlayerRequestClass());
    objc_msgSend(v17, "setPlayerPath:", v5);
    objc_msgSend(v17, "setPlayingItemProperties:", v16);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke_116;
    v21[3] = &unk_24F8B0650;
    v22 = *(id *)(a1 + 40);
    v23 = a3;
    v18 = (id)objc_msgSend(v17, "performWithCompletion:", v21);

  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
  }

}

void __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  __int128 v24;
  double v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315651;
    *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v33 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s MPCPlayerRequest responded: %{private}@ with error: %{public}@", buf, 0x20u);
  }

  objc_msgSend(v5, "tracklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "metadataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
    goto LABEL_21;
  }
  getWFActionsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Fetched now playing media: %{private}@", buf, 0x16u);
  }

  if (!*(_BYTE *)(a1 + 40))
  {
    getWFActionsLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
      _os_log_impl(&dword_22D353000, v19, OS_LOG_TYPE_INFO, "%s Making a MPMediaItem from model object", buf, 0xCu);
    }

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v20 = (void *)getMPMediaItemClass_softClass;
    v31 = getMPMediaItemClass_softClass;
    if (!getMPMediaItemClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPMediaItemClass_block_invoke;
      v33 = &unk_24F8BB430;
      v34 = &v28;
      __getMPMediaItemClass_block_invoke((uint64_t)buf);
      v20 = (void *)v29[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v28, 8);
    objc_msgSend(v21, "itemFromModelObject:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_10;
LABEL_17:
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    goto LABEL_18;
  }
  objc_msgSend(v10, "song");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "persistentID");

  getWFActionsLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(_QWORD *)&buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_22D353000, v16, OS_LOG_TYPE_INFO, "%s Making a local MPMediaItem from pid %{private}lld", buf, 0x16u);
  }

  objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemWithPersistentID:verifyExistence:", v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_17;
LABEL_10:
  objc_msgSend(v9, "duration");
LABEL_18:
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", v24, (_QWORD)v26);
  v23 = *(double *)&v27 + (v22 - v25) * *((float *)&v27 + 2);
  if (v23 >= *((double *)&v26 + 1))
    v23 = *((double *)&v26 + 1);
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(fmax(v23, 0.0));

LABEL_21:
}

+ (id)bundleIdentifierForMediaPlaybackApplication:(unint64_t)a3
{
  const char *v3;
  id *v4;

  switch(a3)
  {
    case 2uLL:
      v4 = (id *)MEMORY[0x24BEC1718];
LABEL_7:
      v3 = (const char *)*v4;
      goto LABEL_8;
    case 1uLL:
      v4 = (id *)MEMORY[0x24BEC1708];
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(a1, "bundleIdentifierForMediaPlaybackApplication:", 1);
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

+ (id)songPropertySet
{
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  id *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  id *v43;
  void *v44;
  id v45;
  void *v46;
  id *v47;
  void *v48;
  id v49;
  id *v50;
  void *v51;
  id v52;
  id *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[2];
  id v100;
  _QWORD v101[3];
  _QWORD v102[6];
  id v103;
  _QWORD v104[3];
  id v105;
  id v106[3];

  v106[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v3 = (id *)getMPModelPropertyGenreNameSymbolLoc_ptr;
  v98 = getMPModelPropertyGenreNameSymbolLoc_ptr;
  if (!getMPModelPropertyGenreNameSymbolLoc_ptr)
  {
    v4 = MediaPlayerLibrary();
    v3 = (id *)dlsym(v4, "MPModelPropertyGenreName");
    v96[3] = (uint64_t)v3;
    getMPModelPropertyGenreNameSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v95, 8);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyGenreName(void)");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("WFMediaPlaybackController.m"), 75, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v106[0] = *v3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = v106[0];
  objc_msgSend(v5, "arrayWithObjects:count:", v106, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v7, 0);
  v8 = objc_alloc((Class)getMPPropertySetClass());
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v9 = (id *)getMPModelPropertyAlbumTitleSymbolLoc_ptr;
  v98 = getMPModelPropertyAlbumTitleSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumTitleSymbolLoc_ptr)
  {
    v10 = MediaPlayerLibrary();
    v9 = (id *)dlsym(v10, "MPModelPropertyAlbumTitle");
    v96[3] = (uint64_t)v9;
    getMPModelPropertyAlbumTitleSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v95, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyAlbumTitle(void)");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("WFMediaPlaybackController.m"), 68, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v11 = *v9;
  v104[0] = v11;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v12 = (id *)getMPModelPropertyAlbumDiscCountSymbolLoc_ptr;
  v98 = getMPModelPropertyAlbumDiscCountSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumDiscCountSymbolLoc_ptr)
  {
    v13 = MediaPlayerLibrary();
    v12 = (id *)dlsym(v13, "MPModelPropertyAlbumDiscCount");
    v96[3] = (uint64_t)v12;
    getMPModelPropertyAlbumDiscCountSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v95, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyAlbumDiscCount(void)");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("WFMediaPlaybackController.m"), 69, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v14 = *v12;
  v104[1] = v14;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v15 = (id *)getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr;
  v98 = getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr)
  {
    v16 = MediaPlayerLibrary();
    v15 = (id *)dlsym(v16, "MPModelPropertyAlbumReleaseDateComponents");
    v96[3] = (uint64_t)v15;
    getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v95, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyAlbumReleaseDateComponents(void)");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, CFSTR("WFMediaPlaybackController.m"), 70, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v17 = *v15;
  v104[2] = v17;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v18 = (id *)getMPModelPropertyAlbumTrackCountSymbolLoc_ptr;
  v98 = getMPModelPropertyAlbumTrackCountSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumTrackCountSymbolLoc_ptr)
  {
    v19 = MediaPlayerLibrary();
    v18 = (id *)dlsym(v19, "MPModelPropertyAlbumTrackCount");
    v96[3] = (uint64_t)v18;
    getMPModelPropertyAlbumTrackCountSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v95, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyAlbumTrackCount(void)");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, CFSTR("WFMediaPlaybackController.m"), 71, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v105 = *v18;
  v20 = (void *)MEMORY[0x24BDBCE30];
  v21 = v105;
  objc_msgSend(v20, "arrayWithObjects:count:", v104, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = (void *)objc_msgSend(v8, "initWithProperties:relationships:", v22, 0);
  v23 = objc_alloc((Class)getMPPropertySetClass());
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v24 = (id *)getMPModelPropertyArtistNameSymbolLoc_ptr;
  v98 = getMPModelPropertyArtistNameSymbolLoc_ptr;
  if (!getMPModelPropertyArtistNameSymbolLoc_ptr)
  {
    v25 = MediaPlayerLibrary();
    v24 = (id *)dlsym(v25, "MPModelPropertyArtistName");
    v96[3] = (uint64_t)v24;
    getMPModelPropertyArtistNameSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v95, 8);
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertyArtistName(void)");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, CFSTR("WFMediaPlaybackController.m"), 64, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v103 = *v24;
  v26 = (void *)MEMORY[0x24BDBCE30];
  v27 = v103;
  objc_msgSend(v26, "arrayWithObjects:count:", &v103, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)objc_msgSend(v23, "initWithProperties:relationships:", v28, 0);
  v91 = objc_alloc((Class)getMPPropertySetClass());
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v29 = (id *)getMPModelPropertySongTitleSymbolLoc_ptr;
  v98 = getMPModelPropertySongTitleSymbolLoc_ptr;
  if (!getMPModelPropertySongTitleSymbolLoc_ptr)
  {
    v30 = MediaPlayerLibrary();
    v29 = (id *)dlsym(v30, "MPModelPropertySongTitle");
    v96[3] = (uint64_t)v29;
    getMPModelPropertySongTitleSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v95, 8);
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongTitle(void)");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("WFMediaPlaybackController.m"), 55, CFSTR("%s"), dlerror());

    goto LABEL_62;
  }
  v90 = *v29;
  v102[0] = v90;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v31 = (id *)getMPModelPropertySongDurationSymbolLoc_ptr;
  v98 = getMPModelPropertySongDurationSymbolLoc_ptr;
  if (!getMPModelPropertySongDurationSymbolLoc_ptr)
  {
    v32 = MediaPlayerLibrary();
    v31 = (id *)dlsym(v32, "MPModelPropertySongDuration");
    v96[3] = (uint64_t)v31;
    getMPModelPropertySongDurationSymbolLoc_ptr = (uint64_t)v31;
  }
  _Block_object_dispose(&v95, 8);
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongDuration(void)");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, CFSTR("WFMediaPlaybackController.m"), 56, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v33 = *v31;
  v102[1] = v33;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v34 = (id *)getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  v98 = getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongDiscNumberSymbolLoc_ptr)
  {
    v35 = MediaPlayerLibrary();
    v34 = (id *)dlsym(v35, "MPModelPropertySongDiscNumber");
    v96[3] = (uint64_t)v34;
    getMPModelPropertySongDiscNumberSymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v95, 8);
  if (!v34)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongDiscNumber(void)");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInFunction:file:lineNumber:description:", v77, CFSTR("WFMediaPlaybackController.m"), 57, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v36 = *v34;
  v102[2] = v36;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v37 = (id *)getMPModelPropertySongExplicitSymbolLoc_ptr;
  v98 = getMPModelPropertySongExplicitSymbolLoc_ptr;
  if (!getMPModelPropertySongExplicitSymbolLoc_ptr)
  {
    v38 = MediaPlayerLibrary();
    v37 = (id *)dlsym(v38, "MPModelPropertySongExplicit");
    v96[3] = (uint64_t)v37;
    getMPModelPropertySongExplicitSymbolLoc_ptr = (uint64_t)v37;
  }
  _Block_object_dispose(&v95, 8);
  if (!v37)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongExplicit(void)");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, CFSTR("WFMediaPlaybackController.m"), 58, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v39 = *v37;
  v102[3] = v39;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v40 = (id *)getMPModelPropertySongTrackNumberSymbolLoc_ptr;
  v98 = getMPModelPropertySongTrackNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongTrackNumberSymbolLoc_ptr)
  {
    v41 = MediaPlayerLibrary();
    v40 = (id *)dlsym(v41, "MPModelPropertySongTrackNumber");
    v96[3] = (uint64_t)v40;
    getMPModelPropertySongTrackNumberSymbolLoc_ptr = (uint64_t)v40;
  }
  _Block_object_dispose(&v95, 8);
  if (!v40)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongTrackNumber(void)");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, CFSTR("WFMediaPlaybackController.m"), 59, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v42 = *v40;
  v102[4] = v42;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v43 = (id *)getMPModelPropertySongArtworkSymbolLoc_ptr;
  v98 = getMPModelPropertySongArtworkSymbolLoc_ptr;
  if (!getMPModelPropertySongArtworkSymbolLoc_ptr)
  {
    v44 = MediaPlayerLibrary();
    v43 = (id *)dlsym(v44, "MPModelPropertySongArtwork");
    v96[3] = (uint64_t)v43;
    getMPModelPropertySongArtworkSymbolLoc_ptr = (uint64_t)v43;
  }
  _Block_object_dispose(&v95, 8);
  if (!v43)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelPropertySongArtwork(void)");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, CFSTR("WFMediaPlaybackController.m"), 60, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v45 = *v43;
  v102[5] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v102, 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v47 = (id *)getMPModelRelationshipSongArtistSymbolLoc_ptr;
  v98 = getMPModelRelationshipSongArtistSymbolLoc_ptr;
  if (!getMPModelRelationshipSongArtistSymbolLoc_ptr)
  {
    v48 = MediaPlayerLibrary();
    v47 = (id *)dlsym(v48, "MPModelRelationshipSongArtist");
    v96[3] = (uint64_t)v47;
    getMPModelRelationshipSongArtistSymbolLoc_ptr = (uint64_t)v47;
  }
  _Block_object_dispose(&v95, 8);
  if (!v47)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelRelationshipSongArtist(void)");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInFunction:file:lineNumber:description:", v85, CFSTR("WFMediaPlaybackController.m"), 63, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v49 = *v47;
  v99[0] = v49;
  v101[0] = v92;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v50 = (id *)getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  v98 = getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  if (!getMPModelRelationshipSongAlbumSymbolLoc_ptr)
  {
    v51 = MediaPlayerLibrary();
    v50 = (id *)dlsym(v51, "MPModelRelationshipSongAlbum");
    v96[3] = (uint64_t)v50;
    getMPModelRelationshipSongAlbumSymbolLoc_ptr = (uint64_t)v50;
  }
  _Block_object_dispose(&v95, 8);
  if (!v50)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelRelationshipSongAlbum(void)");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", v87, CFSTR("WFMediaPlaybackController.m"), 67, CFSTR("%s"), dlerror(), v90);

    goto LABEL_62;
  }
  v52 = *v50;
  v99[1] = v52;
  v101[1] = v93;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v53 = (id *)getMPModelRelationshipSongGenreSymbolLoc_ptr;
  v98 = getMPModelRelationshipSongGenreSymbolLoc_ptr;
  if (!getMPModelRelationshipSongGenreSymbolLoc_ptr)
  {
    v54 = MediaPlayerLibrary();
    v53 = (id *)dlsym(v54, "MPModelRelationshipSongGenre");
    v96[3] = (uint64_t)v53;
    getMPModelRelationshipSongGenreSymbolLoc_ptr = (uint64_t)v53;
  }
  _Block_object_dispose(&v95, 8);
  if (!v53)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPModelRelationshipSongGenre(void)");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInFunction:file:lineNumber:description:", v89, CFSTR("WFMediaPlaybackController.m"), 74, CFSTR("%s"), dlerror(), v90);

LABEL_62:
    __break(1u);
  }
  v100 = *v53;
  v101[2] = v94;
  v55 = (void *)MEMORY[0x24BDBCE70];
  v56 = v100;
  objc_msgSend(v55, "dictionaryWithObjects:forKeys:count:", v101, v99, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)objc_msgSend(v91, "initWithProperties:relationships:", v46, v57);
  return v58;
}

- (void)getPreferredPlaybackDestinationForPlaybackArchive:(id)a3 completionBlock:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:]";
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Querying preferred playback MPCAssistant destination...", buf, 0xCu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __109__WFMediaPlaybackController_MPCAssistant__getPreferredPlaybackDestinationForPlaybackArchive_completionBlock___block_invoke;
  v8[3] = &unk_24F8B1AE8;
  v9 = v5;
  v7 = v5;
  -[WFMediaPlaybackController getPreferredPlaybackOriginWithCompletion:](self, "getPreferredPlaybackOriginWithCompletion:", v8);

}

- (void)getPreferredMediaControlDestinationForOutputDeviceUIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, void *);
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlock:]";
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Querying preferred media control MPCAssistant destination...", buf, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlock:]";
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s Output device UIDs are given. Returning local destination, with the UIDs set", buf, 0xCu);
    }

    objc_msgSend(getMPCAssistantMutableRemoteControlDestinationClass(), "nowPlayingApplicationDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOutputDeviceUIDs:", v6);
    v7[2](v7, v10);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __114__WFMediaPlaybackController_MPCAssistant__getPreferredMediaControlDestinationForOutputDeviceUIDs_completionBlock___block_invoke;
    v11[3] = &unk_24F8B1AE8;
    v12 = v7;
    -[WFMediaPlaybackController getPreferredMediaControlOriginWithCompletion:](self, "getPreferredMediaControlOriginWithCompletion:", v11);
    v10 = v12;
  }

}

void __114__WFMediaPlaybackController_MPCAssistant__getPreferredMediaControlDestinationForOutputDeviceUIDs_completionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("remote companion");
    v10 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlo"
          "ck:]_block_invoke";
    v9 = 136315650;
    if (a3)
      v7 = CFSTR("local");
    v11 = 2112;
    v12 = a2;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Constructing playback destination for origin %@ (%{public}@), player bundle ID nil (MR will pick whatever player is active)", (uint8_t *)&v9, 0x20u);
  }

  v8 = (void *)objc_msgSend(objc_alloc((Class)getMPCAssistantMutableRemoteControlDestinationClass()), "initWithAppBundleID:playerID:origin:", 0, 0, a2);
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8);

}

void __109__WFMediaPlaybackController_MPCAssistant__getPreferredPlaybackDestinationForPlaybackArchive_completionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[WFMediaPlaybackController bundleIdentifierForMediaPlaybackApplication:](WFMediaPlaybackController, "bundleIdentifierForMediaPlaybackApplication:", a3 ^ 1u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("remote companion");
    v11 = 136315906;
    v12 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:]_block_invoke";
    v13 = 2112;
    v14 = a2;
    if (a3)
      v8 = CFSTR("local");
    v15 = 2114;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Constructing playback destination for origin %@ (%{public}@), player bundle ID %@", (uint8_t *)&v11, 0x2Au);
  }

  v9 = (void *)objc_msgSend(objc_alloc((Class)getMPCAssistantMutableRemoteControlDestinationClass()), "initWithAppBundleID:playerID:origin:", v6, 0, a2);
  (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, v10);

}

@end
