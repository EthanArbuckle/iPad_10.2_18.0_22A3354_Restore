@implementation GEOPlaceCollection(MUPlaceCollectionPullQuoteViewModel)

- (id)publisherName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "publisherAttribution");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)plainTextDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "publisherBlockQuote");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "plainTextDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)publisherIconForIsNightMode:()MUPlaceCollectionPullQuoteViewModel
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CC18D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publisherName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publisherAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "iconIdentifier");
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenScale");
  objc_msgSend(v5, "iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", v6, v8, 1, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
