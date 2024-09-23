@implementation ICNoteEditorPillOrnamentViewController

- (ICNoteEditorPillOrnamentViewController)initWithRootViewController:(id)a3
{
  ICNoteEditorPillOrnamentViewController *v3;
  UIToolbar *v4;
  UIToolbar *toolbar;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  v3 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v7, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 0.5, 0.0, 0.5, 1.0, 0.0, -20.0, 0.0);
  if (v3)
  {
    v4 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E0DC3E68]);
    toolbar = v3->_toolbar;
    v3->_toolbar = v4;

    -[UIToolbar setItems:](v3->_toolbar, "setItems:", MEMORY[0x1E0C9AA60]);
  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  -[ICNoteEditorPillOrnamentViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[ICPillOrnamentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorPillOrnamentViewController toolbar](self, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[ICNoteEditorPillOrnamentViewController toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addAnchorsToFillSuperview");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  -[ICNoteEditorPillOrnamentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 445.0, 68.0);
}

- (NSArray)toolbarItems
{
  void *v2;
  void *v3;

  -[ICNoteEditorPillOrnamentViewController toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorPillOrnamentViewController toolbar](self, "toolbar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v4);

}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
