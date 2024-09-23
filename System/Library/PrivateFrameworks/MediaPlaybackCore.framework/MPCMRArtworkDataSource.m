@implementation MPCMRArtworkDataSource

- (MPCMRArtworkDataSource)initWithController:(id)a3
{
  id v4;
  MPCMRArtworkDataSource *v5;
  MPCMRArtworkDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCMRArtworkDataSource;
  v5 = -[MPCMRArtworkDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFittingSize");
  v7 = v6;
  v9 = v8;
  -[MPCMRArtworkDataSource controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "contentItemArtworkCacheStateForArtworkIdentifier:size:", v11, v7, v9);

  if (v12)
  {
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentItemArtworkForContentItemIdentifier:artworkIdentifier:size:", v13, v14, v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDDC6E8];
    objc_msgSend(v4, "visualIdenticalityIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "representationForVisualIdentity:withSize:image:", v17, v18, v7, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)objc_msgSend(a3, "token");
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  double v23;
  double v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledFittingSize");
  v10 = v9;
  v12 = v11;
  -[MPCMRArtworkDataSource controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentItemArtworkForContentItemIdentifier:artworkIdentifier:size:", v14, v15, v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__MPCMRArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v20[3] = &unk_24CABAAF0;
  v21 = v6;
  v22 = v7;
  v23 = v10;
  v24 = v12;
  v17 = v6;
  v18 = v7;
  v19 = (id)objc_msgSend(v16, "onCompletion:", v20);

}

- (MPCMediaRemoteController)controller
{
  return (MPCMediaRemoteController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

void __80__MPCMRArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDDC6E8];
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "visualIdenticalityIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representationForVisualIdentity:withSize:image:", v11, v9, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v8);
}

@end
