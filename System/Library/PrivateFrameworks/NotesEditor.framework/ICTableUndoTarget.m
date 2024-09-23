@implementation ICTableUndoTarget

- (ICTableUndoTarget)init
{
  -[ICTableUndoTarget doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableUndoTarget)initWithProvider:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  ICTableUndoTarget *v9;
  ICTableUndoTarget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTableUndoTarget;
  v9 = -[ICTableUndoTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeWeak((id *)&v10->_tableAttachmentViewController, v8);
  }

  return v10;
}

- (ICTableAttachmentViewController)tableAttachmentViewControllerForUndo
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableUndoTarget tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_opt_class();
    -[ICTableUndoTarget provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (ICTableAttachmentViewController *)v3;
}

- (void)applyUndoGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableUndoTarget tableAttachmentViewControllerForUndo](self, "tableAttachmentViewControllerForUndo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyUndoGroup:", v4);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ICTableUndoTarget;
  -[ICTableUndoTarget description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableUndoTarget tableAttachmentViewController](self, "tableAttachmentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableUndoTarget provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, %@, %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ICTableAttachmentProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAttachmentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
