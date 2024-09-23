@implementation WFGetPodcastsFromLibraryAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB6B0;
  v3[4] = self;
  +[WFPodcastUtilities getPodcastsFromLibraryFetchingDetailsFromServer:withCompletion:](WFPodcastUtilities, "getPodcastsFromLibraryFetchingDetailsFromServer:withCompletion:", 1, v3);
}

- (id)origin
{
  return (id)objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC1730]);
}

void __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_24F8B7CA8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "if_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItems:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
}

id __61__WFGetPodcastsFromLibraryAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE19450];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithObject:origin:disclosureLevel:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
