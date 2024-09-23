@implementation NEPuzzleTagLinkPresentationSource

- (NEPuzzleTagLinkPresentationSource)initWithPuzzleTag:(id)a3
{
  id v5;
  NEPuzzleTagLinkPresentationSource *v6;
  NEPuzzleTagLinkPresentationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEPuzzleTagLinkPresentationSource;
  v6 = -[NEPuzzleTagLinkPresentationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_puzzleTag, a3);

  return v7;
}

- (LPLinkMetadata)linkMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NELinkMetadataSource *v11;
  void *v12;
  _QWORD v14[5];

  -[NEPuzzleTagLinkPresentationSource puzzleTag](self, "puzzleTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameForSharing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  -[NEPuzzleTagLinkPresentationSource puzzleTag](self, "puzzleTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nss_NewsURLForTagID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke;
  v14[3] = &unk_1E724B778;
  v14[4] = self;
  objc_msgSend(v9, "registerItemForTypeIdentifier:loadHandler:", v10, v14);

  v11 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:]([NELinkMetadataSource alloc], "initWithTitle:url:imageProvider:iconProvider:", v4, v8, v9, v9);
  -[NELinkMetadataSource linkMetadata](v11, "linkMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v12;
}

void __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "puzzleTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedNavImageAssetHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke_2;
  v9[3] = &unk_1E724B728;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "downloadIfNeededWithCompletion:", v9);

}

void __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  UIImage *image;

  v2 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(*(id *)(a1 + 32), "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  image = (UIImage *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  UIImagePNGRepresentation(image);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (FCPuzzleTypeProviding)puzzleTag
{
  return self->_puzzleTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleTag, 0);
}

@end
