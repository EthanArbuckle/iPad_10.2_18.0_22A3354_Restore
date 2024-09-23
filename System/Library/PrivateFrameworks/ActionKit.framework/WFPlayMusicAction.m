@implementation WFPlayMusicAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFPlayMusicAction;
  -[WFPlayMusicAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPlayMusicAction;
  -[WFPlayMusicAction initializeParameters](&v6, sel_initializeParameters);
  -[WFPlayMusicAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMediaItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setAction:", self);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  WFMediaRouteDescriptor *v4;
  _QWORD v5[5];
  WFMediaRouteDescriptor *v6;

  -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRoute"), objc_opt_class());
  v4 = (WFMediaRouteDescriptor *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = -[WFMediaRouteDescriptor initWithRouteUID:groupUID:routeName:isLocalDevice:]([WFMediaRouteDescriptor alloc], "initWithRouteUID:groupUID:routeName:isLocalDevice:", 0, 0, 0, 1);
  if (!-[WFPlayMusicAction attemptContextualPlayback](self, "attemptContextualPlayback"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__WFPlayMusicAction_runAsynchronouslyWithInput___block_invoke;
    v5[3] = &unk_24F8B21D8;
    v5[4] = self;
    v6 = v4;
    -[WFPlayMusicAction getContentWithCompletionHandler:](self, "getContentWithCompletionHandler:", v5);

  }
}

- (BOOL)hasPlaybackArchive
{
  void *v2;
  void *v3;
  void *v4;

  -[WFPlayMusicAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMediaItems"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEC44B8]);
  return (char)v3;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (void)getContentWithCompletionHandler:(id)a3
{
  void (**v4)(id, WFPlayMusicActionContent *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  WFPlayMusicActionContent *v12;
  void *v13;
  WFPlayMusicActionContent *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, WFPlayMusicActionContent *, id);
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, WFPlayMusicActionContent *, id))a3;
  -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaItems"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackArchiveData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v8 = (void *)getMPPlaybackArchiveClass_softClass;
    v24 = getMPPlaybackArchiveClass_softClass;
    if (!getMPPlaybackArchiveClass_softClass)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getMPPlaybackArchiveClass_block_invoke;
      v20[3] = &unk_24F8BB430;
      v20[4] = &v21;
      __getMPPlaybackArchiveClass_block_invoke((uint64_t)v20);
      v8 = (void *)v22[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v21, 8);
    v19 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v9, v6, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    v12 = -[WFPlayMusicActionContent initWithPlaybackArchive:]([WFPlayMusicActionContent alloc], "initWithPlaybackArchive:", v10);
    v4[2](v4, v12, v11);

  }
  else if (v5)
  {
    objc_msgSend(v5, "collectionForPlayback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFPlayMusicActionContent initWithMediaCollection:]([WFPlayMusicActionContent alloc], "initWithMediaCollection:", v13);
    v4[2](v4, v14, 0);

  }
  else
  {
    -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaItems"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke;
      v17[3] = &unk_24F8B7658;
      v18 = v4;
      objc_msgSend(v15, "generateCollectionByCoercingToItemClasses:completionHandler:", v16, v17);

    }
    else
    {
      v4[2](v4, 0, 0);
    }

  }
}

- (id)mediaQueryFromMediaCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "itemsQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "itemsQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v6 = (void *)getMPMediaPropertyPredicateClass_softClass_10976;
    v34 = getMPMediaPropertyPredicateClass_softClass_10976;
    if (!getMPMediaPropertyPredicateClass_softClass_10976)
    {
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = (uint64_t)__getMPMediaPropertyPredicateClass_block_invoke_10977;
      v29 = &unk_24F8BB430;
      v30 = &v31;
      __getMPMediaPropertyPredicateClass_block_invoke_10977((uint64_t)&v26);
      v6 = (void *)v32[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v31, 8);
    v26 = 0;
    v27 = (uint64_t)&v26;
    v28 = 0x2020000000;
    v8 = (id *)getMPMediaItemPropertyIsPlayableSymbolLoc_ptr;
    v29 = (void *)getMPMediaItemPropertyIsPlayableSymbolLoc_ptr;
    if (!getMPMediaItemPropertyIsPlayableSymbolLoc_ptr)
    {
      v9 = MediaPlayerLibrary_10951();
      v8 = (id *)dlsym(v9, "MPMediaItemPropertyIsPlayable");
      *(_QWORD *)(v27 + 24) = v8;
      getMPMediaItemPropertyIsPlayableSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v26, 8);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyIsPlayable(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WFPlayMusicAction.m"), 35, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v10 = *v8;
    objc_msgSend(v7, "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc((Class)getMPMediaQueryClass());
    objc_msgSend(v3, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v13, "initWithEntities:entityType:", v14, 0);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(v5, "addFilterPredicate:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      }
      while (v16);
    }

  }
  return v5;
}

- (void)playContentViaMPCAssistant:(id)a3 routeDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  WFMediaPlaybackController *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "playbackArchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFPlayMusicAction shuffleMode](self, "shuffleMode");
  objc_msgSend(v6, "storeIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v12 = (void *)getMPCAssistantStoreTracklistPlaybackQueueClass_softClass;
    v41 = getMPCAssistantStoreTracklistPlaybackQueueClass_softClass;
    if (!getMPCAssistantStoreTracklistPlaybackQueueClass_softClass)
    {
      v33 = MEMORY[0x24BDAC760];
      v34 = 3221225472;
      v35 = __getMPCAssistantStoreTracklistPlaybackQueueClass_block_invoke;
      v36 = &unk_24F8BB430;
      v37 = &v38;
      __getMPCAssistantStoreTracklistPlaybackQueueClass_block_invoke((uint64_t)&v33);
      v12 = (void *)v39[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v38, 8);
    v14 = [v13 alloc];
    objc_msgSend(v6, "storeIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithContextID:storeItemIDs:collectionIdentifierSet:", 0, v15, 0);

    if ((unint64_t)(v9 - 1) >= 3)
      v17 = 1000;
    else
      v17 = v9 - 1;
    objc_msgSend(v16, "setShuffleType:", v17);
    goto LABEL_23;
  }
  objc_msgSend(v6, "mediaCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "mediaCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPlayMusicAction mediaQueryFromMediaCollection:](self, "mediaQueryFromMediaCollection:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v21 = (void *)getMPCAssistantQueryPlaybackQueueClass_softClass;
    v41 = getMPCAssistantQueryPlaybackQueueClass_softClass;
    if (!getMPCAssistantQueryPlaybackQueueClass_softClass)
    {
      v33 = v11;
      v34 = 3221225472;
      v35 = __getMPCAssistantQueryPlaybackQueueClass_block_invoke;
      v36 = &unk_24F8BB430;
      v37 = &v38;
      __getMPCAssistantQueryPlaybackQueueClass_block_invoke((uint64_t)&v33);
      v21 = (void *)v39[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v38, 8);
    v23 = (void *)objc_msgSend([v22 alloc], "initWithContextID:query:", 0, v20);
    v16 = v23;
    if ((unint64_t)(v9 - 1) >= 3)
      v24 = 1000;
    else
      v24 = v9 - 1;
    objc_msgSend(v23, "setShuffleType:", v24);

    goto LABEL_23;
  }
  if (v8)
  {
    if ((unint64_t)(v9 - 2) >= 2)
    {
      if (v9 != 1)
      {
LABEL_22:
        v16 = 0;
LABEL_23:
        v27 = objc_alloc_init(WFMediaPlaybackController);
        v29[0] = v11;
        v29[1] = 3221225472;
        v29[2] = __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke;
        v29[3] = &unk_24F8B22E8;
        v29[4] = self;
        v30 = v7;
        v31 = v6;
        v32 = v16;
        v28 = v16;
        -[WFMediaPlaybackController getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:](v27, "getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:", v8, v29);

        goto LABEL_24;
      }
      v25 = v8;
      v26 = 0;
    }
    else
    {
      v25 = v8;
      v26 = 1;
    }
    objc_msgSend(v25, "setBOOLValue:forOption:", v26, 1);
    goto LABEL_22;
  }
  -[WFPlayMusicAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_24:

}

- (void)sendPlaybackArchive:(id)a3 orPlaybackQueue:(id)a4 toDestination:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFPlayMusicAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke;
  v19[3] = &unk_24F8BA1A0;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  WFConfigureAudioRoutesForUserInterface(v14, v19);

}

- (void)playContentViaMusicPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getMPMusicPlayerControllerClass_softClass;
  v17 = getMPMusicPlayerControllerClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!getMPMusicPlayerControllerClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getMPMusicPlayerControllerClass_block_invoke;
    v13[3] = &unk_24F8BB430;
    v13[4] = &v14;
    __getMPMusicPlayerControllerClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "systemMusicPlayer");
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke;
  v10[3] = &unk_24F8B8B80;
  v10[4] = self;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v8 = v4;
  v9 = v11;
  -[WFPlayMusicAction playContent:withMusicPlayer:completionHandler:](self, "playContent:withMusicPlayer:completionHandler:", v8, v9, v10);

}

- (void)playContent:(id)a3 withMusicPlayer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  WFPlayMusicAction *v20;
  void (**v21)(id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v8, "storeIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "storeIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setQueueWithStoreIDs:", v12);
  }
  else
  {
    objc_msgSend(v8, "mediaCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "mediaCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setQueueWithItemCollection:", v12);
    }
    else
    {
      objc_msgSend(v9, "nowPlayingItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_6;
      objc_msgSend(getMPMediaQueryClass(), "songsQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
      {
        v10[2](v10, 0);

        goto LABEL_7;
      }
      objc_msgSend(v9, "setQueueWithQuery:", v12);
    }
  }

LABEL_6:
  -[WFPlayMusicAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke;
  v18[3] = &unk_24F8BA298;
  v19 = v9;
  v20 = self;
  v21 = v10;
  WFConfigureAudioRoutesForUserInterface(v14, v18);

LABEL_7:
}

- (void)setShuffleAndRepeatModesOnMusicPlayer:(id)a3
{
  int64_t v4;
  int64_t v5;
  id v6;

  v6 = a3;
  v4 = -[WFPlayMusicAction shuffleMode](self, "shuffleMode");
  if (v4)
    objc_msgSend(v6, "setShuffleMode:", v4);
  v5 = -[WFPlayMusicAction repeatMode](self, "repeatMode");
  if (v5)
    objc_msgSend(v6, "setRepeatMode:", v5);

}

- (int64_t)shuffleMode
{
  void *v2;
  int64_t v3;

  -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlayMusicActionShuffle"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Songs")) & 1) != 0)
  {
    v3 = 2;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Albums")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)repeatMode
{
  void *v2;
  int64_t v3;

  -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlayMusicActionRepeat"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("One")) & 1) != 0)
  {
    v3 = 2;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("All")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[WFPlayMusicAction variableSource](self, "variableSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setContent:forVariableWithName:", v6, CFSTR("Has Played Music"));

  v7.receiver = self;
  v7.super_class = (Class)WFPlayMusicAction;
  -[WFPlayMusicAction finishRunningWithError:](&v7, sel_finishRunningWithError_, v4);

}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Music"));
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaContainer");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v6, "mediaContainer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "type"),
          v10,
          v9,
          v11))
    {
      objc_msgSend(v7, "attributeByName:", CFSTR("mediaContainer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPlayMusicAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMediaItems"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "definition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serializedRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "mediaItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v17 = 0;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v7, "attributeByName:", CFSTR("mediaItems"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPlayMusicAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMediaItems"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "definition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "serializedRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v17
      && (objc_msgSend(v17, "objectForKey:", CFSTR("itemName")),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "isEqual:", v21),
          v21,
          v20,
          (v22 & 1) == 0))
    {
      v24 = CFSTR("WFMediaItems");
      v25[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFPlayMusicAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMediaItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "collectionFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "namedQueryReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "topHitSystemEntityCollectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  void *v7;
  BOOL v8;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("WFMediaItems"))
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("WFMediaItems"));
  }
  else
  {
    v6 = 0;
  }

  -[WFPlayMusicAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFPlayMusicAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEC4010], "sharedDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadEntriesFor:parameterKey:limit:collectionIdentifier:completionHandler:", objc_opt_class(), v6, 20, v8, v7);

  }
  else
  {
    WFLocalizedString(CFSTR("Suggestions Not Found"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("The specified action has no suggestions available"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BEC4270];
    v13 = *MEMORY[0x24BDD0FC8];
    v16[0] = *MEMORY[0x24BDD0FD8];
    v16[1] = v13;
    v17[0] = v9;
    v17[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);
  }

}

- (id)serializedParametersForContextualActionMediaIntent:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BEC3EA8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIntent:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3EB0]), "initWithValue:", v5);
  v10 = CFSTR("WFMediaItems");
  objc_msgSend(v6, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)attemptContextualPlayback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[WFPlayMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaItems"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "intent"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPlayMusicAction executePlayMediaIntent:](self, "executePlayMediaIntent:", v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)executePlayMediaIntent:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v4 = (objc_class *)MEMORY[0x24BEC3E18];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIntent:donateInteraction:groupIdentifier:", v5, 0, 0);

  objc_msgSend(v6, "setSkipResolveAndConfirm:", 1);
  -[WFPlayMusicAction setExecutor:](self, "setExecutor:", v6);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFPlayMusicAction_executePlayMediaIntent___block_invoke;
  v7[3] = &unk_24F8B2360;
  v7[4] = self;
  objc_msgSend(v6, "startWithCompletionHandler:", v7);

}

- (WFIntentExecutor)executor
{
  return self->executor;
}

- (void)setExecutor:(id)a3
{
  objc_storeStrong((id *)&self->executor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->executor, 0);
}

uint64_t __44__WFPlayMusicAction_executePlayMediaIntent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke_2;
  v4[3] = &unk_24F8B3B20;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepareToPlayWithCompletionHandler:", v4);

}

void __67__WFPlayMusicAction_playContent_withMusicPlayer_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315394;
      v6 = "-[WFPlayMusicAction playContent:withMusicPlayer:completionHandler:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_FAULT, "%s Error preparing to play music: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setShuffleAndRepeatModesOnMusicPlayer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "play");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke(id *a1, char a2)
{
  dispatch_time_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_2;
    block[3] = &unk_24F8BB0A0;
    v4 = a1[5];
    v5 = a1[4];
    v7 = v4;
    v8 = v5;
    v9 = a1[6];
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(a1[4], "finishRunningWithError:", 0);
  }
}

uint64_t __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "playbackState");
  v3 = *(void **)(a1 + 40);
  if (v2 == 1)
    return objc_msgSend(v3, "finishRunningWithError:", 0);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_3;
  v7[3] = &unk_24F8B2338;
  v7[4] = v3;
  return objc_msgSend(v3, "playContent:withMusicPlayer:completionHandler:", v5, v6, v7);
}

uint64_t __47__WFPlayMusicAction_playContentViaMusicPlayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id *v6;
  id *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = objc_alloc_init((Class)getMPCAssistantCommandClass());
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_2;
    v13[3] = &unk_24F8B2310;
    v5 = &v16;
    v6 = &v14;
    v16 = *(id *)(a1 + 56);
    v14 = v2;
    v7 = &v15;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v2, "sendPlaybackArchive:toDestination:completion:", v3, v4, v13);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_3;
    v9[3] = &unk_24F8B2310;
    v5 = &v12;
    v6 = &v10;
    v12 = *(id *)(a1 + 56);
    v10 = v2;
    v7 = &v11;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "sendPlaybackQueue:toDestination:completion:", v8, v4, v9);
  }

}

uint64_t __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "sendCommand:toDestination:withOptions:completion:", 0, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __82__WFPlayMusicAction_sendPlaybackArchive_orPlaybackQueue_toDestination_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "sendCommand:toDestination:withOptions:completion:", 0, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isLocalDevice") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "routeUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setOutputDeviceUIDs:", v5);

    }
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_2;
    v9[3] = &unk_24F8B22C0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    objc_msgSend(v6, "sendPlaybackArchive:orPlaybackQueue:toDestination:completion:", v7, v8, v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

uint64_t __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "finishRunningWithError:", a2);
  v5 = objc_msgSend(v3, "repeatMode");
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc_init((Class)getMPCAssistantCommandClass());
    v10 = *MEMORY[0x24BE65998];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sendCommand:toDestination:withOptions:completion:", 25, *(_QWORD *)(a1 + 40), v9, &__block_literal_global_141);
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __64__WFPlayMusicAction_playContentViaMPCAssistant_routeDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    getWFActionsLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = 136315394;
      v5 = "-[WFPlayMusicAction playContentViaMPCAssistant:routeDescriptor:]_block_invoke_3";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_FAULT, "%s Error when trying to change repeat mode which is expected for certain content e.g. radio stations: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFPlayMusicActionContent *v24;
  WFPlayMusicActionContent *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v7 = a3;
  v8 = a4;
  v9 = a2;
  v30 = v9;
  objc_msgSend(v9, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;

  v29 = v11;
  objc_msgSend(v11, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;

  v28 = v13;
  objc_msgSend(v13, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;

  if (objc_msgSend(v12, "numberOfItems"))
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_2;
    v26[3] = &unk_24F8B7C28;
    v27 = *(id *)(a1 + 32);
    objc_msgSend(v12, "getObjectRepresentations:forClass:", v26, objc_opt_class());

  }
  else if (objc_msgSend(v14, "numberOfItems"))
  {
    objc_msgSend(v14, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "if_map:", &__block_literal_global_135);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2050000000;
      v18 = (void *)getMPMediaItemCollectionClass_softClass;
      v35 = getMPMediaItemCollectionClass_softClass;
      if (!getMPMediaItemCollectionClass_softClass)
      {
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __getMPMediaItemCollectionClass_block_invoke;
        v31[3] = &unk_24F8BB430;
        v31[4] = &v32;
        __getMPMediaItemCollectionClass_block_invoke((uint64_t)v31);
        v18 = (void *)v33[3];
      }
      v19 = objc_retainAutorelease(v18);
      _Block_object_dispose(&v32, 8);
      objc_msgSend(v19, "collectionWithItems:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v25 = -[WFPlayMusicActionContent initWithMediaCollection:]([WFPlayMusicActionContent alloc], "initWithMediaCollection:", v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else if (objc_msgSend(v10, "numberOfItems"))
  {
    objc_msgSend(v10, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "collection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFPlayMusicActionContent initWithMediaCollection:]([WFPlayMusicActionContent alloc], "initWithMediaCollection:", v23);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  WFPlayMusicActionContent *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_10988);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[WFPlayMusicActionContent initWithStoreIDs:]([WFPlayMusicActionContent alloc], "initWithStoreIDs:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaItem");
}

uint64_t __53__WFPlayMusicAction_getContentWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __48__WFPlayMusicAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v10 || !v5)
  {
    objc_msgSend(v10, "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

      v8 = v10;
    }
    else
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "isLocalDevice");
      v8 = v10;
      if ((v9 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "playContentViaMusicPlayer:", v10);
        goto LABEL_9;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "playContentViaMPCAssistant:routeDescriptor:", v8, *(_QWORD *)(a1 + 40));
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
LABEL_9:

}

@end
