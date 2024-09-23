@implementation WFiTunesPodcastObjectsFromDatabaseShows

id __WFiTunesPodcastObjectsFromDatabaseShows_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "storeId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "objectMatchingKey:value:", CFSTR("identifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v6 = objc_alloc(MEMORY[0x24BEC4220]);
    objc_msgSend(v3, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "feedURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithName:identifier:podcastUUID:feedURL:kind:", v7, v4, v8, v9, *MEMORY[0x24BEC49A0]);

  }
  return v5;
}

@end
