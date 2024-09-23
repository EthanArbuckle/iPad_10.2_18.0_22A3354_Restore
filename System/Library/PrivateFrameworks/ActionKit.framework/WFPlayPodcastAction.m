@implementation WFPlayPodcastAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[WFPlayPodcastAction attemptContextualPlayback](self, "attemptContextualPlayback"))
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke;
    v6[3] = &unk_24F8BA0E8;
    v6[4] = self;
    objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

  }
}

- (void)playQueue:(_MRSystemAppPlaybackQueue *)a3 onPlayerPath:(void *)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _MRSystemAppPlaybackQueue *v13;
  void *v14;

  v8 = a5;
  -[WFPlayPodcastAction userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke;
  v11[3] = &unk_24F8B1E60;
  v13 = a3;
  v14 = a4;
  v12 = v8;
  v10 = v8;
  WFConfigureAudioRoutesForUserInterface(v9, v11);

}

- (id)getPlaybackURLForContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = CFSTR("storeTrackId");
    objc_msgSend(v3, "episode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastQueryDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  +[WFPodcastUtilities generatePlaybackQueueURL:withQueryDictionary:](WFPodcastUtilities, "generatePlaybackQueueURL:withQueryDictionary:", CFSTR("playPodcast"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contentNotFoundError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Podcast Not Found"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The specified podcast could not be found."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)genericPlayPodcastFailedError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Unable to Play Podcast"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Unable to play podcast because an unknown error occurred."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)errorPlayingPodcast:(unsigned int)a3
{
  void *v3;

  if (a3)
  {
    if (a3 == 1)
      -[WFPlayPodcastAction contentNotFoundError](self, "contentNotFoundError");
    else
      -[WFPlayPodcastAction genericPlayPodcastFailedError](self, "genericPlayPodcastFailedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Podcast"));
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeByName:", CFSTR("mediaContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPlayPodcastAction parameterForKey:](self, "parameterForKey:", CFSTR("WFPodcastShow"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wf_parameterStateForIntentValue:parameterDefinition:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serializedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v16 = CFSTR("WFPodcastShow");
      v17[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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

  -[WFPlayPodcastAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFPodcastShow"));
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
  if (v4 == CFSTR("WFPodcastShow"))
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("WFPodcastShow"));
  }
  else
  {
    v6 = 0;
  }

  -[WFPlayPodcastAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v5);
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
  -[WFPlayPodcastAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v6);
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
  v3 = (objc_class *)MEMORY[0x24BEC3F68];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIntent:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3F78]), "initWithValue:", v5);
  v10 = CFSTR("WFPodcastShow");
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

  -[WFPlayPodcastAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPodcastShow"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPlayPodcastAction executePlayMediaIntent:](self, "executePlayMediaIntent:", v5);

  }
  return v4 != 0;
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
  -[WFPlayPodcastAction setExecutor:](self, "setExecutor:", v6);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WFPlayPodcastAction_executePlayMediaIntent___block_invoke;
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

uint64_t __46__WFPlayPodcastAction_executePlayMediaIntent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  MRMediaRemoteSetAppPlaybackQueueForPlayer();

}

void __57__WFPlayPodcastAction_playQueue_onPlayerPath_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsignedIntValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _MRSystemAppPlaybackQueue *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _MRSystemAppPlaybackQueue *v15;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "numberOfItems");
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    objc_msgSend(v3, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_24F8B1DC0;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "if_compactMap:", v16);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFPodcastUtilities generatePlaybackQueueURL:withQueryDictionary:](WFPodcastUtilities, "generatePlaybackQueueURL:withQueryDictionary:", CFSTR("playPodcasts"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  v9 = +[WFPodcastUtilities createPlaybackQueueWithURLs:setImmediatePlayback:](WFPodcastUtilities, "createPlaybackQueueWithURLs:setImmediatePlayback:", v8, 1);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
  v12[3] = &unk_24F8B1E10;
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  v14 = v10;
  v15 = v9;
  v11 = v8;
  +[WFPodcastUtilities createPreferredPlayerPathWithCompletion:](WFPodcastUtilities, "createPreferredPlayerPathWithCompletion:", v12);

}

uint64_t __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getPlaybackURLForContentItem:", a2);
}

uint64_t __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 136315650;
    v17 = "-[WFPlayPodcastAction runAsynchronouslyWithInput:]_block_invoke_3";
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = a2;
    _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Attempting to play podcasts %@ on playback path %@...", buf, 0x20u);
  }

  v6 = (void *)a1[5];
  v7 = a1[6];
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_115;
  v12 = &unk_24F8B1DE8;
  v14 = a2;
  v15 = v7;
  v13 = v6;
  return objc_msgSend(v6, "playQueue:onPlayerPath:completion:");
}

void __50__WFPlayPodcastAction_runAsynchronouslyWithInput___block_invoke_115(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CFRelease(*(CFTypeRef *)(a1 + 40));
  getWFActionsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[WFPlayPodcastAction runAsynchronouslyWithInput:]_block_invoke";
    v9 = 1026;
    v10 = a2;
    _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Finished attempting playback with MediaRemote status code %{public}u", (uint8_t *)&v7, 0x12u);
  }

  MRSystemAppPlaybackQueueDestroy();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "errorPlayingPodcast:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishRunningWithError:", v6);

}

@end
