@implementation CompletionListTableViewCell

+ (double)imageWidthSpace
{
  return 48.0;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  char v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat MinX;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v54.receiver = self;
  v54.super_class = (Class)CompletionListTableViewCell;
  -[CompletionListTableViewCell layoutSubviews](&v54, sel_layoutSubviews);
  v3 = -[CompletionListTableViewCell _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[CompletionListTableViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v5, "size");
    v13 = v12;
    v15 = v14;
    +[CompletionListTableViewCell imageWidthSpace](CompletionListTableViewCell, "imageWidthSpace");
    v17 = v16;
    if (v3)
    {
      _SFRoundFloatToPixels();
      v19 = v18;
    }
    else
    {
      -[CompletionListTableViewCell contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      CGRectGetMaxX(v55);
      _SFRoundFloatToPixels();
      v19 = v21;

    }
    objc_msgSend(v4, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isSymbolImage");

    if ((v23 & 1) == 0)
    {
      _SFRoundFloatToPixels();
      v7 = v24;
      v11 = v15;
      v9 = v13;
    }
    objc_msgSend(v4, "setFrame:", v19, v7, v9, v11);
    -[CompletionListTableViewCell textLabel](self, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CompletionListTableViewCell detailTextLabel](self, "detailTextLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v35 = v34;
    v36 = v33;
    v38 = v37;
    if (v3)
    {
      -[CompletionListTableViewCell separatorInset](self, "separatorInset");
      -[CompletionListTableViewCell bounds](self, "bounds");
      v56.origin.x = v17;
      v56.origin.y = v27;
      v56.size.width = v29;
      v56.size.height = v31;
      CGRectGetMaxX(v56);
      v57.origin.x = v17;
      v57.origin.y = v35;
      v57.size.width = v36;
      v57.size.height = v38;
      CGRectGetMaxX(v57);
    }
    else
    {
      v53 = v33;
      v39 = fmax(v17, v9);
      -[CompletionListTableViewCell frame](self, "frame");
      v41 = v27;
      v42 = v40 - v39 - v29;
      -[CompletionListTableViewCell frame](self, "frame");
      v44 = v43 - v39;
      objc_msgSend(v32, "frame");
      v45 = v44 - CGRectGetWidth(v58);
      -[CompletionListTableViewCell separatorInset](self, "separatorInset");
      -[CompletionListTableViewCell bounds](self, "bounds");
      v47 = v46 + 16.0;
      v59.origin.x = v42;
      v59.origin.y = v41;
      v59.size.width = v29;
      v59.size.height = v31;
      MinX = CGRectGetMinX(v59);
      v49 = v31;
      if (MinX < v47)
      {
        v50 = v47;
        v51 = v41;
        v52 = v29;
        CGRectGetMaxX(*(CGRect *)(&v49 - 3));
      }
      v60.origin.x = v45;
      v60.origin.y = v35;
      v60.size.width = v53;
      v60.size.height = v38;
      if (CGRectGetMinX(v60) < v47)
      {
        v61.origin.x = v47;
        v61.origin.y = v35;
        v61.size.width = v53;
        v61.size.height = v38;
        CGRectGetMaxX(v61);
      }
    }
    _SFRoundRectToPixels();
    objc_msgSend(v25, "setFrame:");
    _SFRoundRectToPixels();
    objc_msgSend(v32, "setFrame:");

  }
}

@end
