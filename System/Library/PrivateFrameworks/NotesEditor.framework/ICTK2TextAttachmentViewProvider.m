@implementation ICTK2TextAttachmentViewProvider

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  return self->_updatedLocationForRecycledViewProvider;
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_updatedLocationForRecycledViewProvider, a3);
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  v5 = a3;
  objc_opt_class();
  -[NSTextAttachmentViewProvider view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightPatternRegexFinder:", v5);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "tableViewControllerForAttachment:createIfNeeded:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(0, "highlightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlightColor:", v9);

  }
  else
  {
    objc_opt_class();
    objc_msgSend(v13, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "newlyCreatedViewForTextContainer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTK2TextAttachmentViewProvider highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlightPatternRegexFinder:", v6);
  }

  objc_msgSend(v13, "attachmentViewDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v12);

  -[NSTextAttachmentViewProvider setView:](self, "setView:", v8);
}

- (ICTK2TextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v11;
  ICTK2TextAttachmentViewProvider *v12;
  ICTK2TextAttachmentViewProvider *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ICTK2TextAttachmentViewProvider;
  v12 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v15, sel_initWithTextAttachment_parentView_textLayoutManager_location_, a3, a4, a5, v11);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_updatedLocationForRecycledViewProvider, a6);

  return v13;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_updatedLocationForRecycledViewProvider, 0);
}

@end
