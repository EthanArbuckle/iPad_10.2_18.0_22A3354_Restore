@implementation MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest)initWithModelObject:(id)a3 requestActionType:(int64_t)a4
{
  id v6;
  MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest *v7;
  int64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  MPModelLibraryFavoriteEntityChangeRequest *v14;
  MPModelLibraryFavoriteEntityChangeRequest *underlyingFavoriteEntityChangeRequest;
  MPModelLibraryFavoriteEntityChangeRequest *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest;
  v7 = -[MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest init](&v19, sel_init);
  if (v7)
  {
    v8 = +[MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest _underlyingFavoriteEntityChangeRequestActionFrom:](MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest, "_underlyingFavoriteEntityChangeRequestActionFrom:", a4);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v9 = (void *)getMPModelLibraryFavoriteEntityRequestActionClass_softClass;
    v28 = getMPModelLibraryFavoriteEntityRequestActionClass_softClass;
    if (!getMPModelLibraryFavoriteEntityRequestActionClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke;
      v23 = &unk_1E9C05688;
      v24 = &v25;
      __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke((uint64_t)&v20);
      v9 = (void *)v26[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v25, 8);
    v11 = (void *)objc_msgSend([v10 alloc], "initWithChangeAction:", v8);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getMPModelLibraryFavoriteEntityChangeRequestClass_softClass;
    v28 = getMPModelLibraryFavoriteEntityChangeRequestClass_softClass;
    if (!getMPModelLibraryFavoriteEntityChangeRequestClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke;
      v23 = &unk_1E9C05688;
      v24 = &v25;
      __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke((uint64_t)&v20);
      v12 = (void *)v26[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    v14 = (MPModelLibraryFavoriteEntityChangeRequest *)objc_alloc_init(v13);
    underlyingFavoriteEntityChangeRequest = v7->_underlyingFavoriteEntityChangeRequest;
    v7->_underlyingFavoriteEntityChangeRequest = v14;

    v16 = v7->_underlyingFavoriteEntityChangeRequest;
    objc_msgSend(v6, "_underlyingModelObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryFavoriteEntityChangeRequest setModelObject:](v16, "setModelObject:", v17);

    -[MPModelLibraryFavoriteEntityChangeRequest setRequestAction:](v7->_underlyingFavoriteEntityChangeRequest, "setRequestAction:", v11);
  }

  return v7;
}

- (MPModelLibraryFavoriteEntityChangeRequest)_underlyingFavoriteEntityChangeRequest
{
  return self->_underlyingFavoriteEntityChangeRequest;
}

+ (int64_t)_underlyingFavoriteEntityChangeRequestActionFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingFavoriteEntityChangeRequest, 0);
}

@end
