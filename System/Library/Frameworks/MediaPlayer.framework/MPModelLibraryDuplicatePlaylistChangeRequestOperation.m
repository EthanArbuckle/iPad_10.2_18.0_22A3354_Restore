@implementation MPModelLibraryDuplicatePlaylistChangeRequestOperation

- (void)execute
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MPMediaPlaylist *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  MPMediaPlaylist *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  MPModelLibraryDuplicatePlaylistChangeRequestOperation *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryDuplicatePlaylistChangeRequestOperation request](self, "request");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "mediaLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "playlist");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v27, "playlistPersistentID");
  if (!v3)
  {
    objc_msgSend(v24, "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "persistentID");

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryDuplicatePlaylistChangeRequestOperation.m"), 31, CFSTR("MPModelLibraryDuplicatePlaylistChangeRequest requires either a playlist or persistent ID"));

      v3 = 0;
    }
  }
  v26 = -[MPMediaPlaylist initWithPersistentID:]([MPMediaPlaylist alloc], "initWithPersistentID:", v3);
  -[MPMediaPlaylist items](v26, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "persistentID");
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = self;
            _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Original playlist has a track without a persistent ID!", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PLAYLIST_COPY_TITLE_ADDITION"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaPlaylist name](v26, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" %@"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addPlaylistWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v18)
  {
    if (v20)
    {
      v21 = objc_msgSend(v18, "persistentID");
      *(_DWORD *)buf = 138543874;
      v40 = self;
      v41 = 2048;
      v42 = v21;
      v43 = 2114;
      v44 = v17;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Created new playlist with persistent ID %lld: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke;
    v29[3] = &unk_1E315BC90;
    objc_copyWeak(&v34, (id *)buf);
    v29[4] = self;
    v30 = v18;
    v31 = v17;
    v32 = v26;
    v33 = v25;
    objc_msgSend(v30, "replaceItemsWithPersistentIDs:completion:", v7, v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Failed to set track list on new playlist"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryDuplicatePlaylistChangeRequestOperation _finishWithError:newPlaylist:](self, "_finishWithError:newPlaylist:", v22, 0);

  }
}

- (void)_addPlaylistToCloudLibraryIfNeeded:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  MPModelLibraryDuplicatePlaylistChangeRequestOperation *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isCloudLibraryEnabled"))
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "persistentID");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke;
    v16[3] = &unk_1E315BCB8;
    v20 = v10;
    v17 = v8;
    v18 = self;
    v19 = v9;
    objc_msgSend(v14, "createPlaylistWithPersistentID:properties:trackList:completionHandler:", v15, v19, 0, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)_finishWithError:(id)a3 newPlaylist:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[MPModelLibraryDuplicatePlaylistChangeRequestOperation responseHandler](self, "responseHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
    ((void (**)(_QWORD, uint64_t, id))v7)[2](v7, objc_msgSend(v6, "persistentID"), v8);
  -[MPAsyncOperation finishWithError:](self, "finishWithError:", v8);

}

- (MPModelLibraryDuplicatePlaylistChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:](MPCloudControllerItemIDList, "cloudItemIDListForPlaylist:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke_2;
    v9[3] = &unk_1E31624C0;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v6, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v7, v4, v8, v9);

  }
}

uint64_t __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("name"));
    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", CFSTR("cloudIsVisible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("cloudIsVisible"));

    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", CFSTR("cloudIsPublic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("cloudIsPublic"));

    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", CFSTR("coverArtworkRecipe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("coverArtworkRecipe"));
    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", CFSTR("descriptionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("descriptionInfo"));
    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", CFSTR("parentPersistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "longLongValue"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("parentPersistentID"));
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke_19;
    v16[3] = &unk_1E31636C0;
    v17 = WeakRetained;
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v11, "_addPlaylistToCloudLibraryIfNeeded:withProperties:completion:", v12, v5, v16);

  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to set track list on new playlist", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Failed to set track list on new playlist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_finishWithError:newPlaylist:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke_19(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPMediaLibraryArtworkRequest *v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:newPlaylist:", a2, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v12 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:]([MPMediaLibraryArtworkRequest alloc], "initWithLibrary:identifier:entityType:artworkType:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "persistentID"), 1, 5);
    -[MPMediaLibraryArtworkRequest fetchableArtworkSource](v12, "fetchableArtworkSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "intValue") == 100)
    {
      +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "originalFileURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = *(void **)(a1 + 40);
          v9 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(v6, "path");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "imageWithContentsOfFile:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setUserSelectedArtworkImage:", v11);

        }
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:newPlaylist:", 0, *(_QWORD *)(a1 + 40));

  }
}

@end
