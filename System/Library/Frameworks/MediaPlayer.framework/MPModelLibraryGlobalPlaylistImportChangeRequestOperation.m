@implementation MPModelLibraryGlobalPlaylistImportChangeRequestOperation

- (void)execute
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  MPModelLibraryGlobalPlaylistImportChangeRequestOperation *v10;

  -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation globalPlaylistID](self, "globalPlaylistID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation shouldLibraryAdd](self, "shouldLibraryAdd");
  -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke;
    v8[3] = &unk_1E31637A8;
    v9 = v3;
    v10 = self;
    objc_msgSend(v6, "addGlobalPlaylistWithID:andAddToCloudLibrary:completion:", v9, 1, v8);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke_2;
    v7[3] = &unk_1E3154E08;
    v7[4] = self;
    objc_msgSend(v5, "addNonLibraryOwnedPlaylistWithGlobalID:completion:", v3, v7);

  }
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (BOOL)shouldLibraryAdd
{
  return self->_shouldLibraryAdd;
}

- (void)setShouldLibraryAdd:(BOOL)a3
{
  self->_shouldLibraryAdd = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
}

void __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  MPMediaQuery *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = [MPMediaQuery alloc];
  v4 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", *(_QWORD *)(a1 + 32), CFSTR("cloudGlobalID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v3, "initWithFilterPredicates:", v6);

  objc_msgSend(*(id *)(a1 + 40), "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery setMediaLibrary:](v7, "setMediaLibrary:", v8);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 6);
  -[MPMediaQuery setEntityLimit:](v7, "setEntityLimit:", 1);
  -[MPMediaQuery setIgnoreRestrictionsPredicates:](v7, "setIgnoreRestrictionsPredicates:", 1);
  -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v7, "setShouldIncludeNonLibraryEntities:", 1);
  -[MPMediaQuery collections](v7, "collections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v13);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v13);

}

void __67__MPModelLibraryGlobalPlaylistImportChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

@end
