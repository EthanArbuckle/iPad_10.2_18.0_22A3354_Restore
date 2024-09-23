@implementation MPModelLibrarySDKAddToPlaylistChangeRequestOperation

- (void)execute
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  -[MPModelLibrarySDKAddToPlaylistChangeRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isCloudID");
  objc_msgSend(v3, "playlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if ((objc_msgSend(v6, "userEditableComponents") & 1) == 0)
    {
      if (self->_responseHandler)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v38 = *MEMORY[0x1E0CB2D50];
          v39 = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v28 = 5;
LABEL_23:
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), v28, v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))self->_responseHandler + 2))();

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    objc_msgSend(v8, "libraryDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "identifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "library");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "persistentID");

        v17 = objc_msgSend(v4, "longLongValue");
        if (v17)
        {
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke_2;
          v32[3] = &unk_1E3163100;
          v32[4] = self;
          objc_msgSend(v13, "sdk_addItemWithSagaIdentifier:toPlaylistWithIdentifier:completionBlock:", v17, v16, v32);
LABEL_31:

          goto LABEL_32;
        }
        if (self->_responseHandler)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v36 = *MEMORY[0x1E0CB2D50];
            v37 = v22;
            v23 = (void *)MEMORY[0x1E0C99D80];
            v24 = &v37;
            v25 = &v36;
            goto LABEL_18;
          }
          goto LABEL_28;
        }
        goto LABEL_30;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "identifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "library");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "persistentID");

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke;
      v33[3] = &unk_1E3163100;
      v33[4] = self;
      objc_msgSend(v13, "sdk_addItemWithOpaqueIdentifier:toPlaylistWithIdentifier:completionBlock:", v4, v20, v33);
      goto LABEL_31;
    }
    if (self->_responseHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = v22;
        v23 = (void *)MEMORY[0x1E0C99D80];
        v24 = &v35;
        v25 = &v34;
LABEL_18:
        objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 5, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))self->_responseHandler + 2))();

        goto LABEL_30;
      }
LABEL_28:
      v26 = 0;
      goto LABEL_29;
    }
LABEL_30:
    -[MPAsyncOperation finish](self, "finish");
    goto LABEL_31;
  }
  if (self->_responseHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      v40 = *MEMORY[0x1E0CB2D50];
      v41[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = 1;
    goto LABEL_23;
  }
LABEL_24:
  -[MPAsyncOperation finish](self, "finish");
LABEL_32:

}

- (MPModelLibrarySDKAddToPlaylistChangeRequest)request
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

void __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[35])
  {
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MPErrorDomain"));

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v11 = *MEMORY[0x1E0CB2D50];
          v12[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v10;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 16))();
    v4 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "finishWithError:", v3);

}

void __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[35])
  {
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MPErrorDomain"));

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v11 = *MEMORY[0x1E0CB2D50];
          v12[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v10;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 16))();
    v4 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "finish");

}

@end
