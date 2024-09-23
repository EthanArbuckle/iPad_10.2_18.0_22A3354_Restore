@implementation MTEpisode

uint64_t __46__MTEpisode_NMSDownloadableItem__downloadInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "podcast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "duration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
  result = objc_msgSend(*(id *)(a1 + 32), "byteSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __49__MTEpisode_NMSDownloadableItem___sizeEstimation__block_invoke()
{
  NMSPodcastSizeEstimation *v0;
  void *v1;

  v0 = objc_alloc_init(NMSPodcastSizeEstimation);
  v1 = (void *)_sizeEstimation_sizeEstimation;
  _sizeEstimation_sizeEstimation = (uint64_t)v0;

}

@end
