@implementation MPArtworkDataSourceURLCache

void __65___MPArtworkDataSourceURLCache_setRepresentationSize_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  NSStringFromCGSize(*(CGSize *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, v3);

}

void __63___MPArtworkDataSourceURLCache_storeCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
