@implementation IMDPhotosSyndicationLibraryChangeListener

+ (id)sharedInstance
{
  if (qword_1ED935CB0 != -1)
    dispatch_once(&qword_1ED935CB0, &unk_1E922C488);
  return (id)qword_1ED935DE8;
}

- (IMDPhotosSyndicationLibraryChangeListener)init
{
  IMDPhotosSyndicationLibraryChangeListener *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  PHPhotoLibrary *syndicationLibrary;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *changeObservationQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMDPhotosSyndicationLibraryChangeListener;
  v2 = -[IMDPhotosSyndicationLibraryChangeListener init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "photoAnalysisInSpotlightEnabled");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "wellKnownPhotoLibraryURLForIdentifier:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F8]), "initWithPhotoLibraryURL:", v5);
      syndicationLibrary = v2->_syndicationLibrary;
      v2->_syndicationLibrary = (PHPhotoLibrary *)v6;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create("com.apple.imagent.SyndicationLibraryChangeObserver", v8);
      changeObservationQueue = v2->_changeObservationQueue;
      v2->_changeObservationQueue = (OS_dispatch_queue *)v9;

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IMDPhotosSyndicationLibraryChangeListener stopListening](self, "stopListening");
  v3.receiver = self;
  v3.super_class = (Class)IMDPhotosSyndicationLibraryChangeListener;
  -[IMDPhotosSyndicationLibraryChangeListener dealloc](&v3, sel_dealloc);
}

- (void)startListening
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  PHPhotoLibrary *syndicationLibrary;
  int v8;
  PHPhotoLibrary *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "photoAnalysisInSpotlightEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        syndicationLibrary = self->_syndicationLibrary;
        v8 = 138412290;
        v9 = syndicationLibrary;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Started listening for changes to the syndication library. syndicationLibrary: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    -[PHPhotoLibrary registerChangeObserver:](self->_syndicationLibrary, "registerChangeObserver:", self);
  }
}

- (void)stopListening
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  PHPhotoLibrary *syndicationLibrary;
  int v8;
  PHPhotoLibrary *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "photoAnalysisInSpotlightEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        syndicationLibrary = self->_syndicationLibrary;
        v8 = 138412290;
        v9 = syndicationLibrary;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Stopped listening to changes to the syndication library. syndicationLibrary: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    -[PHPhotoLibrary unregisterChangeObserver:](self->_syndicationLibrary, "unregisterChangeObserver:", self);
  }
}

- (PHFetchOptions)analysisFetchOptions
{
  PHFetchOptions *analysisFetchOptions;
  PHFetchOptions *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PHFetchOptions **p_analysisFetchOptions;
  PHFetchOptions *v11;
  id v13;
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  analysisFetchOptions = self->_analysisFetchOptions;
  if (!analysisFetchOptions)
  {
    v13 = 0;
    objc_initWeak(&v13, self->_syndicationLibrary);
    v4 = (PHFetchOptions *)objc_alloc_init(MEMORY[0x1E0CD1570]);
    v5 = objc_loadWeakRetained(&v13);
    -[PHFetchOptions setPhotoLibrary:](v4, "setPhotoLibrary:", v5);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setSortDescriptors:](v4, "setSortDescriptors:", v7);

    v8 = *MEMORY[0x1E0CD1A50];
    v14[0] = *MEMORY[0x1E0CD1978];
    v14[1] = v8;
    v14[2] = *MEMORY[0x1E0CD19F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setFetchPropertySets:](v4, "setFetchPropertySets:", v9);

    v11 = self->_analysisFetchOptions;
    p_analysisFetchOptions = &self->_analysisFetchOptions;
    *p_analysisFetchOptions = v4;

    objc_destroyWeak(&v13);
    analysisFetchOptions = *p_analysisFetchOptions;
  }
  return analysisFetchOptions;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled(v4);
  if ((_DWORD)v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Syndication library changed. Ingesting new analysis data. change: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v4, "totalChangeCount");
      *(_DWORD *)buf = 134217984;
      v14 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Total change count: %lu.", buf, 0xCu);
    }

  }
  -[IMDPhotosSyndicationLibraryChangeListener changeObservationQueue](self, "changeObservationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D150FD98;
  v11[3] = &unk_1E9228750;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (PHPhotoLibrary)syndicationLibrary
{
  return self->_syndicationLibrary;
}

- (OS_dispatch_queue)changeObservationQueue
{
  return self->_changeObservationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObservationQueue, 0);
  objc_storeStrong((id *)&self->_syndicationLibrary, 0);
  objc_storeStrong((id *)&self->_analysisFetchOptions, 0);
}

@end
