@implementation MPModelLibrarySearchResponse

- (MPModelLibrarySearchResponse)initWithRequest:(id)a3
{
  id v4;
  MPModelLibrarySearchResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelLibrarySearchResponse;
  v5 = -[MPModelLibraryResponse initWithRequest:](&v9, sel_initWithRequest_, v4);
  if (v5)
  {
    objc_msgSend(v4, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__mediaLibraryDidChangeNotification_, CFSTR("MPMediaLibraryDidChangeNotification"), v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__mediaLibraryDidChangeNotification_, CFSTR("MPMediaLibraryDisplayValuesDidChangeNotification"), v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__mediaLibraryDidChangeNotification_, CFSTR("MPMediaLibraryDynamicPropertiesDidChangeNotification"), v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__mediaLibraryDidChangeNotification_, CFSTR("MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__mediaLibraryDidChangeNotification_, CFSTR("MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification"), 0);
    objc_msgSend(v6, "beginGeneratingLibraryChangeNotifications");

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[MPModelResponse request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endGeneratingLibraryChangeNotifications");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)MPModelLibrarySearchResponse;
  -[MPModelLibraryResponse dealloc](&v6, sel_dealloc);
}

- (BOOL)hasMoreResultsForSectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MPModelResponse results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "hasMoreResultsForSectionAtIndex:", a3);

  return a3;
}

- (int64_t)searchWeightForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[MPModelResponse results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "searchWeightForIndexPath:", v4);

  return v7;
}

@end
