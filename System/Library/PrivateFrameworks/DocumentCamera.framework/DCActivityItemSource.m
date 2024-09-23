@implementation DCActivityItemSource

- (DCActivityItemSource)initWithDocumentInfoCollection:(id)a3
{
  id v4;
  DCActivityItemSource *v5;
  DCActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DCActivityItemSource;
  v5 = -[DCActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DCActivityItemSource setDocInfoCollection:](v5, "setDocInfoCollection:", v4);

  return v6;
}

- (NSString)attachmentTypeUTI
{
  return (NSString *)(id)*MEMORY[0x24BDC17C0];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return &stru_24C5B9710;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;

  -[DCActivityItemSource docInfoCollection](self, "docInfoCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scanned Documents"), CFSTR("Scanned Documents"), CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("pdf"));

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("pdf"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (ICDocCamDocumentInfoCollection)docInfoCollection
{
  return (ICDocCamDocumentInfoCollection *)objc_loadWeakRetained((id *)&self->_docInfoCollection);
}

- (void)setDocInfoCollection:(id)a3
{
  objc_storeWeak((id *)&self->_docInfoCollection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_docInfoCollection);
}

@end
