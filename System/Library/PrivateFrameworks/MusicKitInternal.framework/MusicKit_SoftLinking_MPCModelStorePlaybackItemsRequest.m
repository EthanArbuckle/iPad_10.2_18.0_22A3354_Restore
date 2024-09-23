@implementation MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest

- (MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest)initWithStoreIDs:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest *v5;
  void *v6;
  objc_class *v7;
  id v8;
  MPCModelStorePlaybackItemsRequest *underlyingRequest;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest;
  v5 = -[MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getMPCModelStorePlaybackItemsRequestClass_softClass;
    v16 = getMPCModelStorePlaybackItemsRequestClass_softClass;
    if (!getMPCModelStorePlaybackItemsRequestClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getMPCModelStorePlaybackItemsRequestClass_block_invoke;
      v12[3] = &unk_1E9C05688;
      v12[4] = &v13;
      __getMPCModelStorePlaybackItemsRequestClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = objc_alloc_init(v7);
    objc_msgSend(v8, "setStoreIDs:", v4);
    underlyingRequest = v5->_underlyingRequest;
    v5->_underlyingRequest = (MPCModelStorePlaybackItemsRequest *)v8;

  }
  return v5;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  MPCModelStorePlaybackItemsRequest *underlyingRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingRequest = self->_underlyingRequest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9C056E0;
  v8 = v4;
  v6 = v4;
  -[MPCModelStorePlaybackItemsRequest performWithResponseHandler:](underlyingRequest, "performWithResponseHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end
