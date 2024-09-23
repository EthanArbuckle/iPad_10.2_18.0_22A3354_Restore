@implementation MPStoreLyricsRequest

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  id v3;
  int v4;
  __objc2_class **v5;
  char v6;

  v3 = a3;
  v4 = _os_feature_enabled_impl();
  v5 = off_1E3146D60;
  if (!v4)
    v5 = off_1E3146D68;
  v6 = -[__objc2_class supportsLyricsForURLBag:](*v5, "supportsLyricsForURLBag:", v3);

  return v6;
}

+ (BOOL)supportsLyricsForURLBagDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  int v6;
  __objc2_class **v7;
  char v8;

  v3 = (objc_class *)MEMORY[0x1E0DDC0C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithDictionary:", v4);

  v6 = _os_feature_enabled_impl();
  v7 = off_1E3146D60;
  if (!v6)
    v7 = off_1E3146D68;
  v8 = -[__objc2_class supportsLyricsForURLBag:](*v7, "supportsLyricsForURLBag:", v5);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 1, self->_song);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  _os_feature_enabled_impl();
  v5 = (void *)objc_opt_new();
  -[MPStoreLyricsRequest song](self, "song");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lyricsAdamID");
  if (v9)
  {
    objc_msgSend(v5, "setSongAdamID:", v9);
  }
  else
  {
    -[MPStoreLyricsRequest song](self, "song");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "universalStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "subscriptionAdamID");
    if (v13)
    {
      objc_msgSend(v5, "setSongAdamID:", v13);
    }
    else
    {
      -[MPStoreLyricsRequest song](self, "song");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "universalStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSongAdamID:", objc_msgSend(v14, "adamID"));

    }
  }

  -[MPStoreLyricsRequest song](self, "song");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke;
  v21[3] = &unk_1E3153C90;
  v22 = v15;
  v23 = v4;
  v16 = v15;
  v17 = v4;
  objc_msgSend(v5, "setResponseHandler:", v21);

  return v5;
}

- (MPModelSong)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
  objc_storeStrong((id *)&self->_song, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_2;
    v9[3] = &unk_1E31586B0;
    v10 = v8;
    v7 = (void *)objc_msgSend(v5, "copyWithIdentifiers:block:", v6, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MPIdentifierSet *v9;
  uint64_t v10;
  MPModelLyrics *v11;
  MPIdentifierSet *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongLyrics")))
  {
    objc_msgSend(v3, "lyrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_3;
  v19[3] = &unk_1E3163A58;
  v20 = *(id *)(a1 + 32);
  v6 = (void *)MEMORY[0x19403A810](v19);
  v14 = v5;
  v15 = 3221225472;
  v16 = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_4;
  v17 = &unk_1E3153C68;
  v18 = *(id *)(a1 + 32);
  v7 = (void *)MEMORY[0x19403A810](&v14);
  if (v4)
  {
    objc_msgSend(v4, "identifiers", v14, v15, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MPIdentifierSet *)objc_msgSend(v8, "copyWithSource:block:", CFSTR("StoreLyrics"), v6);
    v10 = objc_msgSend(v4, "copyWithIdentifiers:block:", v9, v7);
  }
  else
  {
    v11 = [MPModelLyrics alloc];
    v12 = [MPIdentifierSet alloc];
    +[MPModelLyricsKind identityKind](MPModelLyricsKind, "identityKind", v14, v15, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MPIdentifierSet initWithSource:modelKind:block:](v12, "initWithSource:modelKind:block:", CFSTR("StoreLyrics"), v8, v6);
    v10 = -[MPModelObject initWithIdentifiers:block:](v11, "initWithIdentifiers:block:", v9, v7);
  }
  v13 = (void *)v10;

  objc_msgSend(v3, "setLyrics:", v13);
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lyricsID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLyricsID:", v4);

}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lyricsContent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTTML:", v4);

}

@end
