@implementation ICBrickTextAttachmentView

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityUserInputLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "size");
  if (v5 <= 0.0)
  {
    v15 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "computedSize");
    v10 = v9;
    v12 = v11;

    objc_msgSend(v4, "lineFragmentPadding");
    v14 = v7 + v13 * -2.0;
    if (v14 >= v10)
      v15 = v10;
    else
      v15 = v14;
  }

  v16 = v15;
  v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)sharedInit:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICBrickTextAttachmentView;
  -[ICAttachmentView sharedInit:](&v9, sel_sharedInit_, a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64AF0]), "initWithType:", 2);
  -[ICBrickTextAttachmentView setAttachmentBrickView:](self, "setAttachmentBrickView:", v4);

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = -[ICAttachmentView insideSystemPaper](self, "insideSystemPaper");
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsideSystemPaper:", v6);

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBrickTextAttachmentView addSubview:](self, "addSubview:", v8);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)ICBrickTextAttachmentView;
  -[ICAttachmentView dealloc](&v4, sel_dealloc);
}

- (void)setupConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3718];
  v11 = CFSTR("brick");
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[brick]-0-|"), 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 10, 0, self, 10, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)requestAttachmentContentUpdate
{
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[ICBrickTextAttachmentView updateCornerRadius](self, "updateCornerRadius");
}

- (void)didChangeAttachment
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICBrickTextAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttachment:", v3);

  v5.receiver = self;
  v5.super_class = (Class)ICBrickTextAttachmentView;
  -[ICBrickTextAttachmentView didChangeAttachment](&v5, sel_didChangeAttachment);
  -[ICBrickTextAttachmentView updateCornerRadius](self, "updateCornerRadius");
}

- (void)didChangeAttachmentTitle
{
  id v2;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTitle");

}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBrickTextAttachmentView;
  v4 = a3;
  -[ICBrickTextAttachmentView setHighlightPatternRegexFinder:](&v6, sel_setHighlightPatternRegexFinder_, v4);
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightPatternRegexFinder:", v4);

}

- (void)setHighlightColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBrickTextAttachmentView;
  v4 = a3;
  -[ICBrickTextAttachmentView setHighlightColor:](&v6, sel_setHighlightColor_, v4);
  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightColor:", v4);

}

- (id)quickLookTransitionView
{
  void *v2;
  void *v3;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quickLookTransitionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageForPrinting
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICBrickTextAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesLinkPresentation");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D64C68]);
    -[ICBrickTextAttachmentView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithAttachment:", v6);

    objc_msgSend(v7, "setForcesLightMode:", -[ICBrickTextAttachmentView shouldForceLightContent](self, "shouldForceLightContent"));
    objc_msgSend(v7, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICBrickTextAttachmentView layoutIfNeeded](self, "layoutIfNeeded");
    v9 = (id)-[ICBrickTextAttachmentView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 1);
    -[ICBrickTextAttachmentView ic_imageRenderedFromLayer](self, "ic_imageRenderedFromLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)updateCornerRadius
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[ICBrickTextAttachmentView attachmentBrickView](self, "attachmentBrickView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveLayoutCornerRadius");
  v4 = v3;
  -[ICBrickTextAttachmentView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (BOOL)shouldForceLightContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[ICAttachmentView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tk2TextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (v4)
  {
    objc_msgSend(v4, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "styler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isForPrint");

  }
  else
  {
    -[ICAttachmentView textContainer](self, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isRenderingImageForPrint");
  }

  return v8;
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentBrickView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentBrickView, 0);
}

@end
