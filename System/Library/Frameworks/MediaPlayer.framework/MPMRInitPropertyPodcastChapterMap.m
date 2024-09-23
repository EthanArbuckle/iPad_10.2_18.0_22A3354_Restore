@implementation MPMRInitPropertyPodcastChapterMap

void ___MPMRInitPropertyPodcastChapterMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentItemID:", v5);

}

@end
