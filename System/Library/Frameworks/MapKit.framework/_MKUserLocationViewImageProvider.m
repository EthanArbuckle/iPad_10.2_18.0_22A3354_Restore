@implementation _MKUserLocationViewImageProvider

- (_MKUserLocationViewImageProvider)initWithUserLocationView:(id)a3
{
  id v4;
  _MKUserLocationViewImageProvider *v5;
  _MKUserLocationViewImageProvider *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _MKUserLocationViewImageProvider *v10;
  _MKUserLocationViewImageProvider *v11;
  _QWORD block[4];
  _MKUserLocationViewImageProvider *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_MKUserLocationViewImageProvider;
  v5 = -[_MKUserLocationViewImageProvider init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    geo_dispatch_queue_create_with_qos();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = v6->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___MKUserLocationViewImageProvider_initWithUserLocationView___block_invoke;
    block[3] = &unk_1E20D7D98;
    v10 = v6;
    v14 = v10;
    dispatch_async(v9, block);
    v11 = v10;

  }
  return v6;
}

- (void)_updateImage
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = objc_msgSend(MEMORY[0x1E0C97298], "_mapkit_isAuthorized");
  MKGetUserLocationViewLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Process is authorized for Contacts access", buf, 2u);
    }

    -[_MKUserLocationViewImageProvider _updateContactImage](self, "_updateContactImage");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Process is not authorized for Contacts access. Using default silhouette", v6, 2u);
    }

    -[_MKUserLocationViewImageProvider _updateDefaultImage](self, "_updateDefaultImage");
  }
}

- (void)_updateContactImage
{
  CNContactStore *v3;
  CNContactStore *contactStore;
  void *v5;
  void *v6;
  CNContactStore *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  char v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!self->_contactStore)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = self->_contactStore;
    self->_contactStore = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contactsChanged_, *MEMORY[0x1E0C96870], self->_contactStore);

  }
  objc_msgSend(getCNMonogrammerClass(), "descriptorForRequiredKeysIncludingImage:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_contactStore;
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18 = 0;
    MKGetUserLocationViewLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_INFO, "Generating monogram for contact: %@", buf, 0xCu);
    }

    -[_MKUserLocationViewImageProvider _monogrammer](self, "_monogrammer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "monogramForContact:isContactImage:", v9, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55___MKUserLocationViewImageProvider__updateContactImage__block_invoke;
      block[3] = &unk_1E20DCB50;
      block[4] = self;
      v16 = v12;
      v17 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      MKGetUserLocationViewLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_INFO, "Fetching contact monogram returned nil. Using default silhouette", buf, 2u);
      }

      -[_MKUserLocationViewImageProvider _updateDefaultImage](self, "_updateDefaultImage");
    }

  }
  else
  {
    MKGetUserLocationViewLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "Fetching 'Me' contact returned nil. Using default silhouette", buf, 2u);
    }

    -[_MKUserLocationViewImageProvider _updateDefaultImage](self, "_updateDefaultImage");
  }

}

- (void)_updateDefaultImage
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[_MKUserLocationViewImageProvider _monogrammer](self, "_monogrammer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "silhouetteMonogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___MKUserLocationViewImageProvider__updateDefaultImage__block_invoke;
  v6[3] = &unk_1E20D7E58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)_monogrammer
{
  CNMonogrammer *monogrammer;
  CNMonogrammer *v4;
  CNMonogrammer *v5;

  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    v4 = (CNMonogrammer *)objc_msgSend(objc_alloc((Class)getCNMonogrammerClass()), "initWithStyle:diameter:", 0, *(double *)&_MKBalloonCalloutInnerDiameter);
    v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }
  return monogrammer;
}

- (_MKUserLocationViewImageProvider)init
{
  _MKUserLocationViewImageProvider *result;

  result = (_MKUserLocationViewImageProvider *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)_contactsChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___MKUserLocationViewImageProvider__contactsChanged___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
