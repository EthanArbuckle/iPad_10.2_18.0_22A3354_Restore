@implementation MPModelLibraryResponse

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
  v6.super_class = (Class)MPModelLibraryResponse;
  -[MPModelLibraryResponse dealloc](&v6, sel_dealloc);
}

- (void)setLibraryAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssertion, a3);
}

- (MPModelLibraryResponse)initWithRequest:(id)a3
{
  id v4;
  MPModelLibraryResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelLibraryResponse;
  v5 = -[MPModelResponse initWithRequest:](&v9, sel_initWithRequest_, v4);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryAssertion, 0);
  objc_storeStrong((id *)&self->_sectionKeepLocalStatusConfigurations, 0);
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MPModelLibraryKeepLocalStatusRequestOperation *v13;
  MPMediaLibraryView *v14;
  void *v15;
  MPMediaLibraryView *v16;
  void *v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v7 = a4;
  -[MPModelResponse request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequest.mm"), 397, CFSTR("Detailed keep local status only supported when request is sectioned."));

  }
  if ((objc_msgSend(v8, "wantsDetailedKeepLocalRequestableResponse") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequest.mm"), 398, CFSTR("Detailed keep local status only supported when request wantsDetailedKeepLocalRequestableResponse."));

  }
  -[MPModelResponse results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v11, "keepLocalEnableState");
  else
    v12 = 0;
  v13 = objc_alloc_init(MPModelLibraryKeepLocalStatusRequestOperation);
  v14 = [MPMediaLibraryView alloc];
  objc_msgSend(v8, "mediaLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v14, "initWithLibrary:filteringOptions:", v15, objc_msgSend(v8, "filteringOptions"));

  -[MPModelLibraryKeepLocalStatusRequestOperation setLibraryView:](v13, "setLibraryView:", v16);
  -[MPModelLibraryKeepLocalStatusRequestOperation setEnableState:](v13, "setEnableState:", v12);
  -[MPModelLibraryKeepLocalStatusRequestOperation setResponseHandler:](v13, "setResponseHandler:", v7);
  -[MPModelLibraryKeepLocalStatusRequestOperation setIdentifyingModelObject:](v13, "setIdentifyingModelObject:", v11);
  -[MPModelLibraryResponse sectionKeepLocalStatusConfigurations](self, "sectionKeepLocalStatusConfigurations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "downloadableItemsQuery");
  }
  else
  {
    v26 = 0;
    v27 = 0;
  }
  -[MPModelLibraryKeepLocalStatusRequestOperation setDownloadableItemsQuery:](v13, "setDownloadableItemsQuery:", &v26);
  v19 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  objc_msgSend(v18, "downloadablePlaylistItemEntityQueryBlock", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryKeepLocalStatusRequestOperation setDownloadablePlaylistItemEntityQueryBlock:](v13, "setDownloadablePlaylistItemEntityQueryBlock:", v22);

  return v13;
}

- (void)clearResults
{
  -[MPModelResponse setResults:](self, "setResults:", 0);
}

- (NSArray)sectionKeepLocalStatusConfigurations
{
  return self->_sectionKeepLocalStatusConfigurations;
}

- (void)setSectionKeepLocalStatusConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MPMediaLibraryConnectionAssertion)libraryAssertion
{
  return self->_libraryAssertion;
}

@end
