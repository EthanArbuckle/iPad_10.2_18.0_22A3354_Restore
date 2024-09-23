@implementation MPModelLibraryStoreIDsImportChangeRequestOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v7[5];

  -[MPModelLibraryStoreIDsImportChangeRequestOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryStoreIDsImportChangeRequestOperation storeIDs](self, "storeIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryStoreIDsImportChangeRequestOperation referralObject](self, "referralObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPModelLibraryStoreIDsImportChangeRequestOperation shouldLibraryAdd](self, "shouldLibraryAdd");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MPModelLibraryStoreIDsImportChangeRequestOperation_execute__block_invoke;
  v7[3] = &unk_1E3163558;
  v7[4] = self;
  objc_msgSend(v3, "addStoreItemIDs:referralObject:andAddTracksToCloudLibrary:withCompletion:", v4, v5, v6, v7);

}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setReferralObject:(id)a3
{
  objc_storeStrong((id *)&self->_referralObject, a3);
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void)setStoreIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

void __61__MPModelLibraryStoreIDsImportChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
