@implementation _SFPrintActivityItemProvider

- (_SFPrintActivityItemProvider)initWithPrintController:(id)a3 webView:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SFPrintActivityItemProvider *v10;
  void *v11;
  _SFPrintActivityItemProvider *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)_SFPrintActivityItemProvider;
  v10 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v14, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v9, 0, 0, v8);

  if (v10 && objc_msgSend(v7, "setUpPrintController"))
  {
    objc_storeStrong((id *)&v10->_printController, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CEB1C0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityItemProvider setExcludedActivityTypes:](v10, "setExcludedActivityTypes:", v11);

    v12 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)item
{
  UIPrintPageRenderer *printPageRenderer;
  UIPrintPageRenderer *v4;
  UIPrintPageRenderer *v5;

  printPageRenderer = self->_printPageRenderer;
  if (!printPageRenderer)
  {
    -[_SFPrintController updatePrintInfo](self->_printController, "updatePrintInfo");
    -[_SFPrintController printRenderer](self->_printController, "printRenderer");
    v4 = (UIPrintPageRenderer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_printPageRenderer;
    self->_printPageRenderer = v4;

    printPageRenderer = self->_printPageRenderer;
  }
  return printPageRenderer;
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
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  if (self->_canVendPDFRepresentation)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v5 = (void *)getLPLinkMetadataClass_softClass_0;
    v25 = getLPLinkMetadataClass_softClass_0;
    if (!getLPLinkMetadataClass_softClass_0)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __getLPLinkMetadataClass_block_invoke_0;
      v20 = &unk_1E4ABFC78;
      v21 = &v22;
      __getLPLinkMetadataClass_block_invoke_0((uint64_t)&v17);
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
      v9 = (void *)getLPFileMetadataClass_softClass_0;
      v25 = getLPFileMetadataClass_softClass_0;
      if (!getLPFileMetadataClass_softClass_0)
      {
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __getLPFileMetadataClass_block_invoke_0;
        v20 = &unk_1E4ABFC78;
        v21 = &v22;
        __getLPFileMetadataClass_block_invoke_0((uint64_t)&v17);
        v9 = (void *)v23[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v22, 8);
      v11 = objc_alloc_init(v10);
      -[_SFPrintController suggestedPDFFileName](self->_printController, "suggestedPDFFileName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setName:", v12);

      objc_msgSend(v11, "setType:", *MEMORY[0x1E0CA5C00]);
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

- (NSItemProvider)pdfItemProvider
{
  NSItemProvider *pdfItemProvider;
  NSItemProvider *v4;
  NSItemProvider *v5;
  NSItemProvider *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  if (!self->_canVendPDFRepresentation)
    return (NSItemProvider *)0;
  pdfItemProvider = self->_pdfItemProvider;
  if (!pdfItemProvider)
  {
    v4 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v5 = self->_pdfItemProvider;
    self->_pdfItemProvider = v4;

    v6 = self->_pdfItemProvider;
    v7 = *MEMORY[0x1E0CA5C00];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke;
    v10[3] = &unk_1E4AC53E8;
    v10[4] = self;
    -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](v6, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, v10);
    -[_SFPrintController suggestedPDFFileName](self->_printController, "suggestedPDFFileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSItemProvider setSuggestedName:](self->_pdfItemProvider, "setSuggestedName:", v8);

    pdfItemProvider = self->_pdfItemProvider;
  }
  return pdfItemProvider;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (self->_canVendPDFRepresentation)
  {
    -[_SFPrintActivityItemProvider pdfItemProvider](self, "pdfItemProvider", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    -[_SFPrintActivityItemProvider item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_SFPrintActivityItemProvider item](self, "item", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[_SFActivityItemProvider excludedActivityTypes](self, "excludedActivityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = *MEMORY[0x1E0CEB1E8];
    v18[0] = *MEMORY[0x1E0CEB220];
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_canVendPDFRepresentation && (objc_msgSend(v12, "containsObject:", v5) & 1) == 0)
    {
      -[_SFPrintActivityItemProvider pdfItemProvider](self, "pdfItemProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v14 = &v17;
    }
    else
    {
      -[_SFPrintActivityItemProvider item](self, "item");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
      v14 = &v16;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (BOOL)hasReservedPrintInteractionController
{
  return self->_hasReservedPrintInteractionController;
}

- (BOOL)canVendPDFRepresentation
{
  return self->_canVendPDFRepresentation;
}

- (void)setCanVendPDFRepresentation:(BOOL)a3
{
  self->_canVendPDFRepresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_linkPreviewFileMetadata, 0);
  objc_storeStrong((id *)&self->_pdfItemProvider, 0);
  objc_storeStrong((id *)&self->_printPageRenderer, 0);
}

@end
