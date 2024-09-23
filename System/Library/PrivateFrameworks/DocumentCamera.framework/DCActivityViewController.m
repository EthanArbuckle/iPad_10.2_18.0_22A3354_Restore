@implementation DCActivityViewController

- (void)_performActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DCActivityViewController inhibitPDFGenerationForActivityType:](self, "inhibitPDFGenerationForActivityType:", v5);

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)DCActivityViewController;
    -[DCActivityViewController _performActivity:](&v11, sel__performActivity_, v4);
  }
  else
  {
    -[DCActivityViewController documentInfoCollection](self, "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCActivityViewController imageCache](self, "imageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCActivityViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__DCActivityViewController__performActivity___block_invoke;
    v12[3] = &unk_24C5B8640;
    v12[4] = self;
    v13 = v4;
    +[DCDocCamPDFGenerator generatePDFsIfNecessaryForDocumentInfoCollection:imageCache:displayWindow:presentingViewController:completionHandler:](DCDocCamPDFGenerator, "generatePDFsIfNecessaryForDocumentInfoCollection:imageCache:displayWindow:presentingViewController:completionHandler:", v7, v8, v10, self, v12);

  }
}

void __45__DCActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  objc_super v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "writeGalleryPDFDataToPasteboardIfNecessaryForActivity:documentInfoCollection:", v4, v5);

    if ((v6 & 1) == 0)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8.receiver = *(id *)(a1 + 32);
      v8.super_class = (Class)DCActivityViewController;
      objc_msgSendSuper2(&v8, sel__performActivity_, v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancel");
  }
}

- (BOOL)inhibitPDFGenerationForActivityType:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[DCActivityViewController ignoreAttachmentsForCopyToPasteboard](self, "ignoreAttachmentsForCopyToPasteboard")
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7480]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[DCActivityViewController activityTypesThatInhibitPDFGeneration](self, "activityTypesThatInhibitPDFGeneration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 documentInfoCollection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(a3, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF7480]);

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    +[DCDocCamPDFGenerator pdfURLForDocumentInfoCollection:](DCDocCamPDFGenerator, "pdfURLForDocumentInfoCollection:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x24BDC1808]);
      objc_msgSend(v8, "addObject:", v12);
    }
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v8);

  }
  return v7;
}

- (id)activityTypesThatInhibitPDFGeneration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.documentcamera.markup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfoCollection, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (BOOL)ignoreAttachmentsForCopyToPasteboard
{
  return self->_ignoreAttachmentsForCopyToPasteboard;
}

- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3
{
  self->_ignoreAttachmentsForCopyToPasteboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
}

@end
