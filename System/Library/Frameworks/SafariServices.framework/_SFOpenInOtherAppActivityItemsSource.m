@implementation _SFOpenInOtherAppActivityItemsSource

- (_SFOpenInOtherAppActivityItemsSource)initWithFilePath:(id)a3
{
  id v4;
  _SFOpenInOtherAppActivityItemsSource *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFOpenInOtherAppActivityItemsSource;
  v5 = -[_SFOpenInOtherAppActivityItemsSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v4);
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

  }
  return v5;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_fileURL)
    objc_msgSend(v4, "addObject:");
  return v5;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1D0]))
  {
    -[_SFOpenInOtherAppActivityItemsSource activityViewControllerPlaceholderItems:](self, "activityViewControllerPlaceholderItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
