@implementation MPModelLibrarySDKAddToPlaylistChangeRequest

- (MPModelLibrarySDKAddToPlaylistChangeRequest)initWithProductID:(id)a3 isCloudID:(BOOL)a4 playlist:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPModelLibrarySDKAddToPlaylistChangeRequest *v13;
  uint64_t v14;
  NSString *productID;
  uint64_t v16;
  id completionHandler;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPModelLibrarySDKAddToPlaylistChangeRequest;
  v13 = -[MPModelLibrarySDKAddToPlaylistChangeRequest init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    productID = v13->_productID;
    v13->_productID = (NSString *)v14;

    v13->_isCloudID = a4;
    objc_storeStrong((id *)&v13->_playlist, a5);
    v16 = MEMORY[0x19403A810](v12);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v16;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_productID, "copy");
    v6 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v5;

    *(_BYTE *)(v4 + 8) = self->_isCloudID;
    objc_storeStrong((id *)(v4 + 24), self->_playlist);
    v7 = MEMORY[0x19403A810](self->_completionHandler);
    v8 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v7;

  }
  return (id)v4;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibrarySDKAddToPlaylistChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibrarySDKAddToPlaylistChangeRequestOperation);
  -[MPModelLibrarySDKAddToPlaylistChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibrarySDKAddToPlaylistChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (NSString)productID
{
  return self->_productID;
}

- (BOOL)isCloudID
{
  return self->_isCloudID;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end
