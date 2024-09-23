@implementation MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest

- (MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest)init
{
  MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest *v2;
  void *v3;
  objc_class *v4;
  MPModelLibraryDownloadQueueRequest *v5;
  MPModelLibraryDownloadQueueRequest *underlyingDownloadQueueRequest;
  MPModelLibraryDownloadQueueRequest *v7;
  void *v8;
  id v9;
  void *v10;
  MPModelLibraryDownloadQueueRequest *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest;
  v2 = -[MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest init](&v14, sel_init);
  if (v2)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)getMPModelLibraryDownloadQueueRequestClass_softClass;
    v23 = getMPModelLibraryDownloadQueueRequestClass_softClass;
    if (!getMPModelLibraryDownloadQueueRequestClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getMPModelLibraryDownloadQueueRequestClass_block_invoke;
      v18 = &unk_1E9C05688;
      v19 = &v20;
      __getMPModelLibraryDownloadQueueRequestClass_block_invoke((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    v5 = (MPModelLibraryDownloadQueueRequest *)objc_alloc_init(v4);
    underlyingDownloadQueueRequest = v2->_underlyingDownloadQueueRequest;
    v2->_underlyingDownloadQueueRequest = v5;

    v7 = v2->_underlyingDownloadQueueRequest;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v8 = (void *)getMPModelSongClass_softClass_0;
    v23 = getMPModelSongClass_softClass_0;
    if (!getMPModelSongClass_softClass_0)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getMPModelSongClass_block_invoke_0;
      v18 = &unk_1E9C05688;
      v19 = &v20;
      __getMPModelSongClass_block_invoke_0((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v9, "kindWithVariants:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryDownloadQueueRequest setItemKind:](v7, "setItemKind:", v10);

    v11 = v2->_underlyingDownloadQueueRequest;
    objc_msgSend(MEMORY[0x1E0CCDE60], "_supportedPropertiesForModelObjectType:", 30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryDownloadQueueRequest setItemProperties:](v11, "setItemProperties:", v12);

    -[MPModelLibraryDownloadQueueRequest setLabel:](v2->_underlyingDownloadQueueRequest, "setLabel:", CFSTR("MusicKit - Download Queue"));
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  MPModelLibraryDownloadQueueResponse *underlyingUpdatedResponse;
  void *v5;
  objc_super v6;

  if (self->_underlyingUpdatedResponse)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    underlyingUpdatedResponse = self->_underlyingUpdatedResponse;
    getMPModelResponseDidInvalidateNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", underlyingUpdatedResponse, v5, self->_underlyingUpdatedResponse);

  }
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest;
  -[MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest dealloc](&v6, sel_dealloc);
}

+ (NSString)downloadQueueDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPModelLibraryDownloadQueueDidChangeNotification");
}

- (void)_handleDownloadQueueDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPModelLibraryDownloadQueueDidChangeNotification"), self, v6);
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  MPModelLibraryDownloadQueueRequest *underlyingDownloadQueueRequest;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  underlyingDownloadQueueRequest = self->_underlyingDownloadQueueRequest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9C05DB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPModelLibraryDownloadQueueRequest performWithResponseHandler:](underlyingDownloadQueueRequest, "performWithResponseHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingUpdatedResponse, 0);
  objc_storeStrong((id *)&self->_underlyingDownloadQueueRequest, 0);
}

@end
