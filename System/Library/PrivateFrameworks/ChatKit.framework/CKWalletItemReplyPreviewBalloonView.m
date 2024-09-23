@implementation CKWalletItemReplyPreviewBalloonView

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKColoredBalloonView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[CKWalletItemReplyPreviewBalloonView %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CKWalletItemReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  CKWalletItemReplyPreviewBalloonView *v3;
  CKWalletItemReplyPreviewBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKBalloonView doubleTapGestureRecognizer](v3, "doubleTapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v4, sel_layoutSubviews);
  -[CKWalletItemReplyPreviewBalloonView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKWalletItemReplyPreviewBalloonView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](&v18, sel_sizeThatFits_textAlignmentInsets_, a4);
  -[CKWalletItemReplyPreviewBalloonView linkView](self, "linkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;

  if (width < v9 || height < v11)
  {
    v13 = width / v9;
    v14 = 0.0;
    if (v9 == 0.0)
      v13 = 0.0;
    if (v11 != 0.0)
      v14 = height / v11;
    v15 = fmin(v13, v14);
    v9 = ceil(v9 * v15);
    v11 = ceil(v11 * v15);
  }
  v16 = v9;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)prepareForDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v3, sel_prepareForDisplay);
  -[CKWalletItemReplyPreviewBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_linkView, 0);
}

- (void)setMediaObject:(id)a3
{
  CKMediaObject *v5;
  char isKindOfClass;
  char v7;
  uint64_t v8;
  void *v9;
  LPLinkView *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  LPLinkView *linkView;
  CKMediaObject *v21;

  v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    if (-[LPLinkView isDescendantOfView:](self->_linkView, "isDescendantOfView:", self))
      -[LPLinkView removeFromSuperview](self->_linkView, "removeFromSuperview");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v21;
    if ((isKindOfClass & 1) != 0 || (objc_opt_class(), v7 = objc_opt_isKindOfClass(), v5 = v21, (v7 & 1) != 0))
    {
      -[CKMediaObject presentationPropertiesForReplyPreview](v5, "presentationPropertiesForReplyPreview");
      v8 = objc_claimAutoreleasedReturnValue();
      v5 = v21;
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (LPLinkView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithPresentationProperties:URL:", v8, 0);
        -[LPLinkView _setPreferredSizeClass:](v10, "_setPreferredSizeClass:", 6);
        -[LPLinkView _setApplyCornerRadius:](v10, "_setApplyCornerRadius:", 0);
        -[LPLinkView _setDisableTapGesture:](v10, "_setDisableTapGesture:", 1);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "thumbnailContentAlignmentInsetsForOrientation:", -[CKBalloonView orientation](self, "orientation"));
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        -[LPLinkView setContentInset:](v10, "setContentInset:", v13, v15, v17, v19);
        linkView = self->_linkView;
        self->_linkView = v10;

        -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
        v5 = v21;
      }
    }
  }

}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  objc_super v6[5];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKColoredBalloonView configureForMessagePart:](&v7, sel_configureForMessagePart_, v4);
  if (v4)
    objc_msgSend(v4, "balloonDescriptor");
  else
    memset(v6, 0, sizeof(v6));
  -[CKColoredBalloonView setBalloonDescriptor:](self, "setBalloonDescriptor:", v6);
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKWalletItemReplyPreviewBalloonView setMediaObject:](self, "setMediaObject:", v5);

}

@end
