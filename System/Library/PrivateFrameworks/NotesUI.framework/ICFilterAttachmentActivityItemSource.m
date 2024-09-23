@implementation ICFilterAttachmentActivityItemSource

- (id)initAttachmentItem:(id)a3
{
  id v4;
  ICFilterAttachmentActivityItemSource *v5;
  ICFilterAttachmentActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFilterAttachmentActivityItemSource;
  v5 = -[ICFilterAttachmentActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICFilterAttachmentActivityItemSource setAttachmentItem:](v5, "setAttachmentItem:", v4);

  return v6;
}

- (id)activityItemSourceForSelector:(SEL)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICFilterAttachmentActivityItemSource activityItemSourceForSelector:](self, "activityItemSourceForSelector:", sel_activityViewControllerPlaceholderItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "activityViewControllerPlaceholderItem:", v4);
  else
    -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CEB1B0]) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CEB1C0]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilenotes.lock-note")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1D8]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB220]) & 1) != 0)
  {
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1D0]))
  {
    -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachmentModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "canConvertToHTMLForSharing");

      if ((v14 & 1) != 0)
      {
LABEL_6:
        v8 = 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  -[ICFilterAttachmentActivityItemSource activityItemSourceForSelector:](self, "activityItemSourceForSelector:", sel_activityViewController_itemForActivityType_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "activityViewController:itemForActivityType:", v6, v7);
  else
    -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  v7 = a4;
  -[ICFilterAttachmentActivityItemSource activityItemSourceForSelector:](self, "activityItemSourceForSelector:", sel_activityViewController_dataTypeIdentifierForActivityType_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "activityViewController:dataTypeIdentifierForActivityType:", v6, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E5C2F8C0;
  }

  return v10;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[ICFilterAttachmentActivityItemSource attachmentItem](self, "attachmentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityViewController:attachmentNameForActivityType:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)attachmentItem
{
  return self->_attachmentItem;
}

- (void)setAttachmentItem:(id)a3
{
  objc_storeStrong(&self->_attachmentItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attachmentItem, 0);
}

@end
