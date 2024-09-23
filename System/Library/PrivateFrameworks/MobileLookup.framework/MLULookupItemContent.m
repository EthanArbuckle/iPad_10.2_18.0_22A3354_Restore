@implementation MLULookupItemContent

+ (id)contentWithURL:(id)a3 result:(__DDResult *)a4 documentProperties:(id)a5
{
  id v7;
  id v8;
  MLULookupItemDDContent *v9;
  MLULookupItemDDContent *v10;

  v7 = a5;
  v8 = a3;
  v9 = -[MLULookupItemDDContent initWithURL:result:documentProperties:]([MLULookupItemDDContent alloc], "initWithURL:result:documentProperties:", v8, a4, v7);

  if (-[MLULookupItemContent valid](v9, "valid"))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (id)contentWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  id v5;
  MLULookupItemAttachmentContent *v6;

  v5 = a3;
  v6 = -[MLULookupItemAttachmentContent initWithAttachments:currentAttachmentIndex:]([MLULookupItemAttachmentContent alloc], "initWithAttachments:currentAttachmentIndex:", v5, a4);

  return v6;
}

+ (id)contentWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  MLULookupItemRawTextContent *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = -[MLULookupItemRawTextContent initWithText:range:]([MLULookupItemRawTextContent alloc], "initWithText:range:", v6, location, length);

  return v7;
}

- (id)requiredEntitlements
{
  return 0;
}

- (id)children
{
  return 0;
}

- (BOOL)wantsSeamlessCommit
{
  return -[MLULookupItemContent commitType](self, "commitType") == 2;
}

- (void)setupViewControllerInCommitMode
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MLULookupItemContent previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MLULookupItemContent previewViewController](self, "previewViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissViewController);
    objc_msgSend(v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

    objc_msgSend(v8, "setNavigationBarHidden:", 0);
    objc_msgSend(v8, "setNeedsStatusBarAppearanceUpdate");

  }
}

- (BOOL)commitPreviewInController:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = -[MLULookupItemContent commitType](self, "commitType", a3);
  if (v4 == 2)
  {
    -[MLULookupItemContent setupViewControllerInCommitMode](self, "setupViewControllerInCommitMode");
    return 1;
  }
  else
  {
    if (v4 == 4)
    {
      -[MLULookupItemContent commitURL](self, "commitURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (objc_msgSend(v6, "canOpenURL:", v5))
        {
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *MEMORY[0x24BEB0CE8];
          v12[0] = MEMORY[0x24BDBD1C8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "openURL:withOptions:", v5, v9);

        }
      }

    }
    return 0;
  }
}

- (void)dismissViewController
{
  id v2;

  -[MLULookupItemContent previewViewController](self, "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global);

}

- (CNContact)contact
{
  return 0;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (unint64_t)commitType
{
  return self->_commitType;
}

- (void)setCommitType:(unint64_t)a3
{
  self->_commitType = a3;
}

- (UIViewController)commitViewController
{
  return self->_commitViewController;
}

- (void)setCommitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_commitViewController, a3);
}

- (NSURL)commitURL
{
  return self->_commitURL;
}

- (void)setCommitURL:(id)a3
{
  objc_storeStrong((id *)&self->_commitURL, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitURL, 0);
  objc_storeStrong((id *)&self->_commitViewController, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

@end
