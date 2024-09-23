@implementation CPMLBestAppShim

+ (id)bestShim
{
  return (id)objc_msgSend(a1, "bestShimWithDBPath:withModelPath:withPListPath:", &stru_24F4E43F8, &stru_24F4E43F8, &stru_24F4E43F8);
}

+ (id)bestShimWithDBPath:(id)a3 withModelPath:(id)a4 withPListPath:(id)a5
{
  if (bestShimWithDBPath_withModelPath_withPListPath__token != -1)
    dispatch_once(&bestShimWithDBPath_withModelPath_withPListPath__token, &__block_literal_global);
  return (id)bestShimWithDBPath_withModelPath_withPListPath__instance;
}

void __66__CPMLBestAppShim_bestShimWithDBPath_withModelPath_withPListPath___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  CPMLBestAppShim *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v1 = (void *)kCPMLExpertProposalNoDetail;
  kCPMLExpertProposalNoDetail = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v3 = (void *)kCPMLExpertProposalMoot;
  kCPMLExpertProposalMoot = (uint64_t)v2;

  v4 = objc_alloc_init(CPMLBestAppShim);
  v5 = (void *)bestShimWithDBPath_withModelPath_withPListPath__instance;
  bestShimWithDBPath_withModelPath_withPListPath__instance = (uint64_t)v4;

}

- (id)rankItems:(id)a3 withMetaInfo:(id)a4 withNumOfRankItem:(unint64_t)a5
{
  void *v6;
  void *v7;
  CPMLBestShimContext *v8;
  void *v9;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_4, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "removeObjectsInRange:", a5, objc_msgSend(v6, "count") - a5);
  v8 = objc_alloc_init(CPMLBestShimContext);
  v9 = (void *)objc_msgSend(v7, "copy");
  -[CPMLBestShimContext setOrderedSuggestions:](v8, "setOrderedSuggestions:", v9);

  return v8;
}

uint64_t __60__CPMLBestAppShim_rankItems_withMetaInfo_withNumOfRankItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("CPMLLastModifiedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v5, "valueForKey:", CFSTR("CPMLLastModifiedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v7 <= v9)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("CPMLLastModifiedDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    objc_msgSend(v5, "valueForKey:", CFSTR("CPMLLastModifiedDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v12 >= v14)
      v10 = 0;
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)feedback:(id)a3 withItemsVisited:(id)a4
{
  NSLog(CFSTR("We appreciate your feedback!\n"), a2, a3, a4);
}

@end
