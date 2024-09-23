@implementation NEPuzzleHubLinkPresentationSource

- (NEPuzzleHubLinkPresentationSource)initWithTitle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  NEPuzzleHubLinkPresentationSource *v9;
  NEPuzzleHubLinkPresentationSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NEPuzzleHubLinkPresentationSource;
  v9 = -[NEPuzzleHubLinkPresentationSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (LPLinkMetadata)linkMetadata
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NELinkMetadataSource *v10;
  void *v11;
  NELinkMetadataSource *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://apple.news/puzzles"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v5 = (void *)*MEMORY[0x1E0CEC580];
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke;
  v16[3] = &unk_1E724B778;
  v16[4] = self;
  objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v6, v16);

  v8 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_3;
  v15[3] = &unk_1E724B778;
  v15[4] = self;
  objc_msgSend(v8, "registerItemForTypeIdentifier:loadHandler:", v9, v15);

  v10 = [NELinkMetadataSource alloc];
  -[NEPuzzleHubLinkPresentationSource title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:](v10, "initWithTitle:url:imageProvider:iconProvider:", v11, v3, v8, v4);

  -[NELinkMetadataSource linkMetadata](v12, "linkMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v13;
}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedNavImageAssetHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_2;
  v9[3] = &unk_1E724B728;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "downloadIfNeededWithCompletion:", v9);

}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_2(uint64_t a1)
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

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedNavImageHQAssetHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_4;
  v9[3] = &unk_1E724B728;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "downloadIfNeededWithCompletion:", v9);

}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_4(uint64_t a1)
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

- (NSString)title
{
  return self->_title;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
