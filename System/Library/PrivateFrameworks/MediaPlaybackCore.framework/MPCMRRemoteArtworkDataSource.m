@implementation MPCMRRemoteArtworkDataSource

- (MPCMRRemoteArtworkDataSource)initWithController:(id)a3
{
  id v4;
  MPCMRRemoteArtworkDataSource *v5;
  MPCMRRemoteArtworkDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCMRRemoteArtworkDataSource;
  v5 = -[MPCMRRemoteArtworkDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeArtworkCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "areRepresentationsAvailableForCatalog:", v4);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  objc_msgSend(a4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storeArtworkCatalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRepresentation:bestRepresentationForArtworkCatalog:", v5, v7);

  }
  else
  {
    v9 = v5 != 0;
  }

  return v9;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeArtworkCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingRepresentationForArtworkCatalog:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "token");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeArtworkCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelLoadingRepresentationForArtworkCatalog:", v3);

  }
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeArtworkCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualIdenticalityIdentifierForCatalog:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeArtworkCatalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadRepresentationForArtworkCatalog:completionHandler:", v9, v7);

  }
  else
  {
    objc_msgSend(v6, "scaledFittingSize");
    v12 = v11;
    v14 = v13;
    -[MPCMRRemoteArtworkDataSource controller](self, "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentItemRemoteArtworkForContentItemIdentifier:artworkIdentifier:size:artworkFormat:", v16, v17, *MEMORY[0x24BDDC480], v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __86__MPCMRRemoteArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
    v20[3] = &unk_24CABAAC8;
    v23 = v7;
    v21 = v6;
    v22 = v8;
    v19 = (id)objc_msgSend(v18, "onCompletion:", v20);

  }
}

- (MPCMediaRemoteController)controller
{
  return (MPCMediaRemoteController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

void __86__MPCMRRemoteArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7 = *MEMORY[0x24BDDC480];
    v24 = *MEMORY[0x24BDDC480];
    v25[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      v20 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "artworkURLTemplateData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD1608];
        objc_msgSend(v10, "artworkURLTemplateData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "JSONObjectWithData:options:error:", v13, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C0]), "initWithArtworkResponseDictionary:", v14);

          if (v15)
            goto LABEL_11;
        }
      }
      objc_msgSend(v10, "artworkURLString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v10, "artworkURLString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLWithString:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
LABEL_13:

LABEL_15:
          objc_msgSend(*(id *)(a1 + 32), "fittingSize");
          objc_msgSend(v20, "setFittingSize:");
          objc_msgSend(*(id *)(a1 + 32), "destinationScale");
          objc_msgSend(v20, "setDestinationScale:");
          objc_msgSend(*(id *)(a1 + 40), "setStoreArtworkCatalog:", v20);
          objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "loadRepresentationForArtworkCatalog:completionHandler:", v20, *(_QWORD *)(a1 + 48));

          goto LABEL_16;
        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C0]), "initWithArtworkURL:", v20);

        if (v15)
        {
LABEL_11:
          objc_msgSend(MEMORY[0x24BDDCC08], "tokenWithImageArtworkInfo:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6D8]), "initWithToken:dataSource:", v21, v22);

          goto LABEL_13;
        }
      }
    }
    v20 = 0;
    goto LABEL_13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_16:

}

@end
