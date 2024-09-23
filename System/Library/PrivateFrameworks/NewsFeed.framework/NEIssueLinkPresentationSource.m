@implementation NEIssueLinkPresentationSource

- (NEIssueLinkPresentationSource)initWithIssue:(id)a3
{
  id v5;
  NEIssueLinkPresentationSource *v6;
  NEIssueLinkPresentationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEIssueLinkPresentationSource;
  v6 = -[NEIssueLinkPresentationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_issue, a3);

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
  void *v9;
  void *v10;
  void *v11;
  NELinkMetadataSource *v12;
  void *v13;

  -[NEIssueLinkPresentationSource issue](self, "issue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIssueLinkPresentationSource titleFromIssue:](self, "titleFromIssue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEIssueLinkPresentationSource issue](self, "issue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIssueLinkPresentationSource subtitleFromIssue:](self, "subtitleFromIssue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEIssueLinkPresentationSource issue](self, "issue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIssueLinkPresentationSource urlFromIssue:](self, "urlFromIssue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIssueLinkPresentationSource issue](self, "issue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIssueLinkPresentationSource imageItemProviderFromIssue:](self, "imageItemProviderFromIssue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:]([NELinkMetadataSource alloc], "initWithTitle:url:imageProvider:iconProvider:", v9, v8, v11, v11);
  -[NELinkMetadataSource linkMetadata](v12, "linkMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v13;
}

- (id)titleFromIssue:(id)a3
{
  return (id)objc_msgSend(a3, "title");
}

- (id)subtitleFromIssue:(id)a3
{
  return (id)objc_msgSend(a3, "coverDate");
}

- (id)imageItemProviderFromIssue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke;
  v8[3] = &unk_1E724B778;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v5, v8);

  return v4;
}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;

  v4 = a2;
  v2 = v4;
  v3 = (id)FCFetchThumbnailForIssue();

}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_3;
  v7[3] = &unk_1E724B728;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  UIImage *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithContentsOfFile:", v3);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)urlFromIssue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nss_NewsURLForIssueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FCIssue)issue
{
  return self->_issue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issue, 0);
}

@end
