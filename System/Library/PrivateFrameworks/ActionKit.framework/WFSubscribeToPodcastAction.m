@implementation WFSubscribeToPodcastAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

- (void)subscribeToPodcast:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = CFSTR("podcastFeedUrl");
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v20;
    v11 = &v19;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v17 = CFSTR("storeCollectionId");
    objc_msgSend(v5, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v18;
    v11 = &v17;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  +[WFPodcastUtilities generatePlaybackQueueURL:withQueryDictionary:](WFPodcastUtilities, "generatePlaybackQueueURL:withQueryDictionary:", CFSTR("subscribe"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFPodcastUtilities createPlaybackQueueWithURLs:setImmediatePlayback:](WFPodcastUtilities, "createPlaybackQueueWithURLs:setImmediatePlayback:", v14, 0);
  +[WFPodcastUtilities createLocalPlayerPathWithPlayerID:](WFPodcastUtilities, "createLocalPlayerPathWithPlayerID:", CFSTR("PodcastsFollowProxyPlayer"));
  v15 = v6;
  MRMediaRemoteSetAppPlaybackQueueForPlayer();

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

- (id)genericSubscribeFailedError
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
  WFLocalizedString(CFSTR("Unable to Follow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Unable to follow podcast because an unknown error occurred."));
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

- (id)errorSubscribingToPodcast:(unsigned int)a3
{
  void *v3;

  if (a3)
  {
    if (a3 == 1)
      -[WFSubscribeToPodcastAction contentNotFoundError](self, "contentNotFoundError");
    else
      -[WFSubscribeToPodcastAction genericSubscribeFailedError](self, "genericSubscribeFailedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[WFSubscribeToPodcastAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to subscribe to a podcast with %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to subscribe to a podcast?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __73__WFSubscribeToPodcastAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:promptingBehaviour:", *MEMORY[0x24BEC1730], 2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __60__WFSubscribeToPodcastAction_subscribeToPodcast_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  const void *v6;
  id v7;

  MRSystemAppPlaybackQueueDestroy();
  objc_msgSend(a3, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "errorSubscribingToPodcast:", objc_msgSend(v7, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(const void **)(a1 + 56);
  if (v6)
    CFRelease(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
  else
  {
    objc_msgSend(a2, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v7[3] = &unk_24F8B8C50;
    v8 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_4;
    v6[3] = &unk_24F8BB050;
    v6[4] = v8;
    objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v7, v6);

  }
}

void __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8B8C28;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "subscribeToPodcast:completion:", a2, v9);

}

uint64_t __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __57__WFSubscribeToPodcastAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
