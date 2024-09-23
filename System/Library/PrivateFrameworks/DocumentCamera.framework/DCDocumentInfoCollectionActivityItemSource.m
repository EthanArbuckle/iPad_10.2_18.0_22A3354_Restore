@implementation DCDocumentInfoCollectionActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[DCActivityItemSource docInfoCollection](self, "docInfoCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCDocCamPDFGenerator versionPDFPathForDocumentInfoCollection:](DCDocCamPDFGenerator, "versionPDFPathForDocumentInfoCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x24BDC1768];
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  char v8;
  uint64_t v9;

  -[DCActivityItemSource docInfoCollection](self, "docInfoCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)*MEMORY[0x24BDC1808], (CFStringRef)*MEMORY[0x24BDC1658]);
  if (v6)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "stringByAppendingPathExtension:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }

  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = a4;
  -[DCActivityItemSource docInfoCollection](self, "docInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCDocCamPDFGenerator versionPDFPathForDocumentInfoCollection:](DCDocCamPDFGenerator, "versionPDFPathForDocumentInfoCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF7480]);
  if ((_DWORD)v5)
  {

    v9 = 0;
  }
  return v9;
}

@end
