@implementation MusicKit_SoftLinking_MPModelLibrarySearchRequest

- (MusicKit_SoftLinking_MPModelLibrarySearchRequest)initWithSearchTerm:(id)a3 scopes:(id)a4 limit:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  id *v15;
  MusicKit_SoftLinking_MPModelLibrarySearchRequest *v16;
  uint64_t v17;
  NSArray *scopes;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v9 = a3;
  v10 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v11 = (void *)getMPModelLibrarySearchRequestClass_softClass;
  v25 = getMPModelLibrarySearchRequestClass_softClass;
  if (!getMPModelLibrarySearchRequestClass_softClass)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __getMPModelLibrarySearchRequestClass_block_invoke;
    v21[3] = &unk_24CD1CC68;
    v21[4] = &v22;
    __getMPModelLibrarySearchRequestClass_block_invoke((uint64_t)v21);
    v11 = (void *)v23[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v22, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v13, "setSearchString:", v9);
  objc_msgSend(v10, "msv_map:", &__block_literal_global_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScopes:", v14);
  objc_msgSend(v13, "setMaximumResultsPerScope:", a5);
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibrarySearchRequest;
  v15 = -[MusicKit_SoftLinking_MPModelRequest _initWithUnderlyingRequest:](&v20, sel__initWithUnderlyingRequest_, v13);
  v16 = (MusicKit_SoftLinking_MPModelLibrarySearchRequest *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 2, a3);
    v17 = objc_msgSend(v10, "copy");
    scopes = v16->_scopes;
    v16->_scopes = (NSArray *)v17;

    v16->_limit = a5;
  }

  return v16;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if ((MRMediaRemoteIsMusicAppInstalled() & 1) != 0)
  {
    -[MusicKit_SoftLinking_MPModelRequest _underlyingRequest](self, "_underlyingRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__MusicKit_SoftLinking_MPModelLibrarySearchRequest_performWithCompletionHandler___block_invoke;
    v7[3] = &unk_24CD1CD08;
    v8 = v4;
    objc_msgSend(v5, "performWithResponseHandler:", v7);

  }
  else
  {
    MusicKit_Logging_Library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MusicKit_SoftLinking_MPModelLibrarySearchRequest performWithCompletionHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDD1540], "musicKit_defaultLibraryError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
  }

}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
}

- (void)performWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211B26000, log, OS_LOG_TYPE_ERROR, "Failed to perform MusicKit library search request because the Music application is not installed.", v1, 2u);
}

@end
