@implementation QLErrorItemViewController

- (void)loadView
{
  QLErrorView *v3;
  QLErrorView *v4;
  id v5;

  v3 = [QLErrorView alloc];
  -[QLErrorItemViewController title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIContentUnavailableView initWithFrame:title:style:](v3, "initWithFrame:title:style:", v5, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[QLErrorItemViewController setView:](self, "setView:", v4);

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v23, "previewTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isEqualToString:", &stru_24C72A1F8) & 1) == 0)
  {
    -[QLErrorItemViewController errorView](self, "errorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
  objc_msgSend(v23, "originalContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (v12 = (void *)MEMORY[0x24BDF8238],
        objc_msgSend(v23, "originalContentType"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "typeWithIdentifier:", v13),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v11)
    && (objc_msgSend(v11, "isDynamic") & 1) == 0)
  {
    objc_msgSend(v11, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLErrorItemViewController errorView](self, "errorView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMessage:", v15);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v23, "itemSize");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v17, "longLongValue"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (v14)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@\n%@"), v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLErrorItemViewController errorView](self, "errorView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setMessage:", v21);

    }
    else
    {
      -[QLErrorItemViewController errorView](self, "errorView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMessage:", v18);
    }

  }
  -[QLErrorItemViewController _updateLabelsWithCurrentErrorIfNeeded](self, "_updateLabelsWithCurrentErrorIfNeeded");
  if (v7)
    v7[2](v7, 0);

}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  -[QLErrorItemViewController _updateLabelsWithCurrentErrorIfNeeded](self, "_updateLabelsWithCurrentErrorIfNeeded");
}

- (void)_updateLabelsWithCurrentErrorIfNeeded
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[QLItemViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[QLErrorItemViewController error](self, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "domain");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5 == CFSTR("com.apple.quicklook.QLErrorItemViewController"))
    {
      -[QLErrorItemViewController error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "code");

      if (v8 != 1)
        return;
      QLLocalizedStringFromTable();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[QLErrorItemViewController errorView](self, "errorView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v9);
    }
    else
    {
      v6 = v5;
    }

  }
}

- (NSError)error
{
  return self->_error;
}

- (QLItem)previewItem
{
  return (QLItem *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPreviewItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
