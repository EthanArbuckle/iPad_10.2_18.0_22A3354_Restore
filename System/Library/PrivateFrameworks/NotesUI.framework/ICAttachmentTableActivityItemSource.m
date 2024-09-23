@implementation ICAttachmentTableActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0CB3498]);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF445E78]();
  objc_opt_class();
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1B0]);
  v13 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB230]);
  objc_msgSend(v11, "table");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0 || v13)
  {
    objc_msgSend(v14, "joinedAttributedStringForColumns:rows:", 0, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    if (v12)
    {
      objc_msgSend(v21, "dataUsingEncoding:", 4);
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
  }
  else
  {
    objc_msgSend(v11, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributedStringWithNSTextTablesForColumns:rows:context:", 0, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v18;
    v20 = v19;
  }

  objc_autoreleasePoolPop(v8);
  return v20;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICAttachmentTableActivityItemSource;
  v5 = a4;
  -[ICAttachmentActivityItemSource activityViewController:dataTypeIdentifierForActivityType:](&v10, sel_activityViewController_dataTypeIdentifierForActivityType_, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEB1B0], v10.receiver, v10.super_class);

  if (v7)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

@end
