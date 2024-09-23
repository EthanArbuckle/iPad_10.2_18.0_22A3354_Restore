@implementation MPModelLibraryAlbumAppDataChangeRequestOperation

- (void)execute
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  _QWORD v26[2];

  v3 = MEMORY[0x1E0C809B0];
  v26[1] = *MEMORY[0x1E0C80C00];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke;
  v24[3] = &unk_1E31637D0;
  v24[4] = self;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v24, a2);
  -[MPModelLibraryAlbumAppDataChangeRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumAppData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createAppDataDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v8)
  {
    -[MPModelLibraryAlbumAppDataChangeRequestOperation request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "library");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "persistentID");

    objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D50AD8], v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D511C8];
    objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyInLibrary:predicate:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v26[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0D507A8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v3;
      v21[1] = 3221225472;
      v21[2] = __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke_2;
      v21[3] = &unk_1E3162588;
      v22 = v4;
      objc_msgSend(v18, "setValues:forProperties:async:withCompletionBlock:", v19, v20, 1, v21);

    }
    else
    {
      v4[2](v4, 0, 0);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v9);
  }

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryAlbumAppDataChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

uint64_t __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[34];
  if (v5)
  {
    (*(void (**)(_QWORD, uint64_t))(v5 + 16))(v4[34], a3);
    v4 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v4, "finish");
}

uint64_t __59__MPModelLibraryAlbumAppDataChangeRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
