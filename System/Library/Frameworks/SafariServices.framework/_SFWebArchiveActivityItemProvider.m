@implementation _SFWebArchiveActivityItemProvider

- (_SFWebArchiveActivityItemProvider)initWithWebArchiveProvider:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFWebArchiveActivityItemProvider *v13;
  _SFWebArchiveActivityItemProvider *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "canGenerateWebArchive"))
  {
    objc_msgSend(v6, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)_SFWebArchiveActivityItemProvider;
    self = -[_SFActivityItemProvider initWithURL:pageTitle:webView:](&v16, sel_initWithURL_pageTitle_webView_, v8, v9, v7);

    if (self)
    {
      objc_storeStrong((id *)&self->_webArchiveProvider, a3);
      v10 = (void *)MEMORY[0x1E0C99E60];
      v17[0] = *MEMORY[0x1E0CEB1C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFActivityItemProvider setExcludedActivityTypes:](self, "setExcludedActivityTypes:", v12);

      v13 = self;
    }

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E0CA5CC8];
}

- (id)_webArchiveItemProvider
{
  _SFWebArchiveProvider *v3;
  id v4;
  uint64_t v5;
  _SFWebArchiveProvider *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  _SFWebArchiveProvider *v13;
  _SFWebArchiveActivityItemProvider *v14;

  if (!-[_SFWebArchiveProvider canGenerateWebArchive](self->_webArchiveProvider, "canGenerateWebArchive"))
    return 0;
  v3 = self->_webArchiveProvider;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v5 = *MEMORY[0x1E0CA5CC8];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke;
  v12 = &unk_1E4AC0D00;
  v13 = v3;
  v14 = self;
  v6 = v3;
  objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v5, &v9);
  objc_msgSend(v4, "setPreferredPresentationStyle:", 2, v9, v10, v11, v12);
  -[_SFWebArchiveProvider suggestedFilenameWithExtension](self->_webArchiveProvider, "suggestedFilenameWithExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedName:", v7);

  return v4;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  LPFileMetadata *v13;
  LPFileMetadata *linkPreviewFileMetadata;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  if (-[_SFWebArchiveProvider canGenerateWebArchive](self->_webArchiveProvider, "canGenerateWebArchive"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v5 = (void *)getLPLinkMetadataClass_softClass;
    v25 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __getLPLinkMetadataClass_block_invoke;
      v20 = &unk_1E4ABFC78;
      v21 = &v22;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v17);
      v5 = (void *)v23[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v22, 8);
    v7 = objc_alloc_init(v6);
    if (v7)
    {
      -[_SFActivityItemProvider url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOriginalURL:", v8);

      v22 = 0;
      v23 = &v22;
      v24 = 0x2050000000;
      v9 = (void *)getLPFileMetadataClass_softClass;
      v25 = getLPFileMetadataClass_softClass;
      if (!getLPFileMetadataClass_softClass)
      {
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __getLPFileMetadataClass_block_invoke;
        v20 = &unk_1E4ABFC78;
        v21 = &v22;
        __getLPFileMetadataClass_block_invoke((uint64_t)&v17);
        v9 = (void *)v23[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v22, 8);
      v11 = objc_alloc_init(v10);
      -[_SFWebArchiveProvider suggestedFilenameWithoutExtension](self->_webArchiveProvider, "suggestedFilenameWithoutExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setName:", v12);

      objc_msgSend(v11, "setType:", *MEMORY[0x1E0CA5CC8]);
      objc_msgSend(v7, "setSpecialization:", v11);
      objc_msgSend(v7, "specialization");
      v13 = (LPFileMetadata *)objc_claimAutoreleasedReturnValue();
      linkPreviewFileMetadata = self->_linkPreviewFileMetadata;
      self->_linkPreviewFileMetadata = v13;

      v15 = v7;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPreviewFileMetadata, 0);
  objc_storeStrong((id *)&self->_webArchiveProvider, 0);
}

@end
