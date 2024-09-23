@implementation NSObject(MusicKit_SoftLinking_MPArtworkCatalog)

- (id)_musicKit_self_artworkCatalog
{
  id v2;

  getMPArtworkCatalogClass_0();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_artworkDataSourceShortDescription
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "artworkDataSourceShortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_artworkDataSourceIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "artworkDataSourceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_artworkTokenParameters
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "artworkTokenParameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_artworkDictionary
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getMPStoreArtworkRequestTokenClass_softClass_0;
  v13 = getMPStoreArtworkRequestTokenClass_softClass_0;
  if (!getMPStoreArtworkRequestTokenClass_softClass_0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getMPStoreArtworkRequestTokenClass_block_invoke_0;
    v9[3] = &unk_24CD1CC68;
    v9[4] = &v10;
    __getMPStoreArtworkRequestTokenClass_block_invoke_0((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "imageArtworkInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "responseArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)musicKit_visualIdenticalityIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualIdenticalityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "stringRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_existingColorAnalysis
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "existingColorAnalysisWithAlgorithm:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)musicKit_fittingSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fittingSize");
  v3 = v2;

  return v3;
}

- (void)musicKit_setFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog
{
  id v5;

  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFittingSize:", a2, a3);

}

- (void)musicKit_requestImageDataWithCompletion:()MusicKit_SoftLinking_MPArtworkCatalog
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestImageDataWithCompletion___block_invoke;
  v7[3] = &unk_24CD1D7C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestImageWithCompletion:", v7);

}

- (void)musicKit_requestColorAnalysisWithCompletionHandler:()MusicKit_SoftLinking_MPArtworkCatalog
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __102__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestColorAnalysisWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CD1D7E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestColorAnalysisWithAlgorithm:completion:", 1, v7);

}

@end
