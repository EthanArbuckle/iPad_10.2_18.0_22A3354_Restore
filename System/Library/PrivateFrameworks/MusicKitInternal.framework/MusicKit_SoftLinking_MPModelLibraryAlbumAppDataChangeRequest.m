@implementation MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest)init
{
  MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest *v2;
  void *v3;
  objc_class *v4;
  MPModelLibraryAlbumAppDataChangeRequest *v5;
  MPModelLibraryAlbumAppDataChangeRequest *underlyingChangeRequest;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest;
  v2 = -[MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryAlbumAppDataChangeRequestClass_softClass;
    v13 = getMPModelLibraryAlbumAppDataChangeRequestClass_softClass;
    if (!getMPModelLibraryAlbumAppDataChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke;
      v9[3] = &unk_1E9C05688;
      v9[4] = &v10;
      __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryAlbumAppDataChangeRequest *)objc_alloc_init(v4);
    underlyingChangeRequest = v2->_underlyingChangeRequest;
    v2->_underlyingChangeRequest = v5;

  }
  return v2;
}

- (void)performWithAlbum:(id)a3 appData:(id)a4 completionHandler:(id)a5
{
  id v8;
  MPModelLibraryAlbumAppDataChangeRequest *underlyingChangeRequest;
  id v10;
  void *v11;
  MPModelLibraryAlbumAppDataChangeRequest *v12;
  void *v13;
  MPModelLibraryAlbumAppDataChangeRequest *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  underlyingChangeRequest = self->_underlyingChangeRequest;
  v10 = a4;
  objc_msgSend(a3, "_underlyingModelObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryAlbumAppDataChangeRequest setModelObject:](underlyingChangeRequest, "setModelObject:", v11);

  v12 = self->_underlyingChangeRequest;
  objc_msgSend(v10, "_underlyingAlbumAppData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryAlbumAppDataChangeRequest setAlbumAppData:](v12, "setAlbumAppData:", v13);
  v14 = self->_underlyingChangeRequest;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest_performWithAlbum_appData_completionHandler___block_invoke;
  v18[3] = &unk_1E9C06240;
  v19 = v8;
  v15 = v8;
  v16 = (void *)-[MPModelLibraryAlbumAppDataChangeRequest newOperationWithResponseHandler:](v14, "newOperationWithResponseHandler:", v18);
  objc_msgSend(MEMORY[0x1E0CCDDE8], "deviceLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performOperation:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingChangeRequest, 0);
}

@end
