@implementation ICAttachmentViewController

- (ICAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentViewController initWithNibName:bundle:]", 1, 0, CFSTR("ICAttachmentViewController should never be initialized from nib."));

  return 0;
}

- (ICAttachmentViewController)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentViewController initWithCoder:]", 1, 0, CFSTR("ICAttachmentViewController should never be archived."));

  return 0;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  id v8;
  id v9;
  ICAttachmentViewController *v10;
  ICAttachmentViewController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentViewController;
  v10 = -[ICAttachmentViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    objc_msgSend(v8, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_layoutManager, v9);
  }

  return v11;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5
{
  id v8;
  id v9;
  ICAttachmentViewController *v10;
  ICAttachmentViewController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentViewController;
  v10 = -[ICAttachmentViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    objc_msgSend(v8, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_textLayoutManager, v9);
  }

  return v11;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4
{
  return -[ICAttachmentViewController initWithTextAttachment:forManualRendering:layoutManager:](self, "initWithTextAttachment:forManualRendering:layoutManager:", a3, a4, 0);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICAttachmentViewController textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v12 = v4;
  }
  else
  {
    -[ICAttachmentViewController layoutManager](self, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = -[ICAttachmentViewController forManualRendering](self, "forManualRendering");
  -[ICAttachmentViewController textAttachment](self, "textAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "newlyCreatedViewForManualRenderingInTextContainer:", v12);
  else
    objc_msgSend(v9, "newlyCreatedViewForTextContainer:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController setView:](self, "setView:", v11);

}

- (ICTextAttachment)textAttachment
{
  ICTextAttachment **p_textAttachment;
  void *WeakRetained;
  void *v5;
  void *v6;

  p_textAttachment = &self->_textAttachment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (WeakRetained)
    goto LABEL_4;
  if (-[ICAttachmentViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_opt_class();
    -[ICAttachmentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "textAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_textAttachment, v6);

LABEL_4:
  }
  return (ICTextAttachment *)objc_loadWeakRetained((id *)p_textAttachment);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeakRetained((id *)&self->_textLayoutManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textLayoutManager);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_destroyWeak((id *)&self->_attachment);
}

@end
