@implementation QLActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_24C72A1F8;
}

- (id)mainItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "shareableURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "fetcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shareableItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  void *v4;
  void *v5;
  NSObject **v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  -[QLActivityItemProvider mainItem](self, "mainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  if (v5)
  {
    -[QLActivityItemProvider mainItem](self, "mainItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  else
  {
    v8 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v8 = *v6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_ERROR, "No URL to pass to activityViewControllerPlaceholderItems. #Sharing", (uint8_t *)&v17, 2u);
    }
  }
  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewItemURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLActivityItemProvider _pdfPreviewDataAtURL:](self, "_pdfPreviewDataAtURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "addObject:", v11);
  }
  else
  {
    -[QLActivityItemProvider mainItem](self, "mainItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[QLActivityItemProvider printer](self, "printer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[QLActivityItemProvider printer](self, "printer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

      }
    }
  }
  v12 = *v6;
  if (!*v6)
  {
    QLSInitLogging();
    v12 = *v6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEFAULT, "Returning activity items %@ #Sharing", (uint8_t *)&v17, 0xCu);
  }

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject **v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF74D8]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF74A0]))
  {
    objc_msgSend(v6, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLActivityItemProvider printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "printInteractionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrintInfo:", v9);

    -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "previewItemURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLActivityItemProvider _pdfPreviewDataAtURL:](self, "_pdfPreviewDataAtURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
LABEL_5:
      v15 = v14;
LABEL_15:

      goto LABEL_16;
    }
    -[QLItem previewItemContentType](self->_activityPreviewItem, "previewItemContentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6CE0], "printableUTIs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "containsObject:", v16))
    {

    }
    else
    {
      -[QLActivityItemProvider printer](self, "printer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[QLActivityItemProvider printer](self, "printer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
    }
    v15 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF7480]))
  {
    -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previewItemURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLActivityItemProvider _pdfPreviewDataAtURL:](self, "_pdfPreviewDataAtURL:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v15 = 0;
LABEL_16:

      if (v15)
        goto LABEL_18;
      goto LABEL_17;
    }
    objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v13;
    v29[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_17:
  -[QLActivityItemProvider mainItem](self, "mainItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v21 = (NSObject **)MEMORY[0x24BE7BF48];
  v22 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v22 = *v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v24 = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_INFO, "Returning activity item for activity type %@ : %@ #Printing", (uint8_t *)&v24, 0x16u);
  }

  return v15;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return &stru_24C72A1F8;
}

- (id)printInfo
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItemContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(MEMORY[0x24BE7BFB8], "isIWorkDocumentType:", v4);
  v7 = objc_msgSend(MEMORY[0x24BE7BFB8], "isSpreadSheetDocumentType:", v4);
  v8 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x24BDF8528]);
  v9 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x24BDF8410]);
  objc_msgSend(MEMORY[0x24BDF6CD8], "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewItemTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJobName:", v12);

  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "previewItemURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLActivityItemProvider _pdfPreviewDataAtURL:](self, "_pdfPreviewDataAtURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v10, "setScaleUp:", v6);
  if (v9)
    objc_msgSend(v10, "setOutputType:", 1);
  if ((v8 | v6 & v7) == 1)
    objc_msgSend(v10, "setOrientation:", 1);

  return v10;
}

- (id)_pdfPreviewDataAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (_pdfPreviewDataAtURL__onceToken != -1)
  {
    dispatch_once(&_pdfPreviewDataAtURL__onceToken, &__block_literal_global);
    if (v5)
      goto LABEL_3;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if (!v4)
    goto LABEL_14;
LABEL_3:
  objc_msgSend((id)_pdfPreviewDataAtURL__sharedPDFPreviewCache, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    if (!v6)
    {
      -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "previewItemContentType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11
        && (objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v11),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            QLPreviewCopyEmbeddedPDF(),
            v6 = (id)objc_claimAutoreleasedReturnValue(),
            v12,
            v6))
      {
        objc_msgSend((id)_pdfPreviewDataAtURL__sharedPDFPreviewCache, "setObject:forKey:", v6, v5);
      }
      else
      {
        v13 = (void *)_pdfPreviewDataAtURL__sharedPDFPreviewCache;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, v5);

        v6 = 0;
      }

    }
    v6 = v6;
    v9 = v6;
  }

LABEL_15:
  return v9;
}

void __47__QLActivityItemProvider__pdfPreviewDataAtURL___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_pdfPreviewDataAtURL__sharedPDFPreviewCache;
  _pdfPreviewDataAtURL__sharedPDFPreviewCache = (uint64_t)v0;

}

- (id)activityViewControllerSuggestionFileURL:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "previewItemType");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[QLActivityItemProvider activityPreviewItem](self, "activityPreviewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareableURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (QLPreviewPrinter)printer
{
  return (QLPreviewPrinter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrinter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (QLItem)activityPreviewItem
{
  return (QLItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivityPreviewItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityPreviewItem, 0);
  objc_storeStrong((id *)&self->_printer, 0);
}

@end
