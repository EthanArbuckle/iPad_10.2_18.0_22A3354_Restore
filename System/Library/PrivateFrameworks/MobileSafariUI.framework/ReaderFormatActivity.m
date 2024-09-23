@implementation ReaderFormatActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return CFSTR("doc.text.magnifyingglass");
}

- (id)activityType
{
  return CFSTR("SafariActivityTypeReaderFormat");
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return objc_msgSend(a3, "isShowingReader");
}

- (id)_navigationControllerWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ReaderFormatViewController *v7;
  void *v8;
  ReaderFormatViewController *v9;
  void *v10;

  v4 = a3;
  -[_SFActivity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "provenanceForSafariActivity:", self);
  else
    v6 = 0;
  v7 = [ReaderFormatViewController alloc];
  objc_msgSend(v4, "readerContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ReaderFormatViewController initWithReaderContext:provenance:](v7, "initWithReaderContext:provenance:", v8, v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);

  return v10;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
  -[ReaderFormatActivity _navigationControllerWithTabDocument:](self, "_navigationControllerWithTabDocument:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0DC4330];
    v8 = v6;
    objc_msgSend(v7, "_mediumDetent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setDetents:", v10);

  }
  objc_msgSend(v4, "browserController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewControllerToPresentFrom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v5, 1, 0);

}

@end
