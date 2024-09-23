@implementation CKDetailsShowMoreContactsStandardCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CKDetailsShowMoreContactsStandardCell;
  -[CKDetailsCell layoutSubviews](&v44, sel_layoutSubviews);
  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell topSeperator](self, "topSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v40 = v6;
  v42 = v5;
  v8 = v7;

  -[CKDetailsShowMoreContactsStandardCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailsContactAvatarLabelSpacing");
  v14 = v11 + v13;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailsViewContactImageDiameter");
  v17 = v14 + v16;

  v18 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKDetailsShowMoreContactsStandardCell textLabel](self, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[CKDetailsShowMoreContactsStandardCell textLabel](self, "textLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = v17;
  v30 = v17;
  if (v18)
  {
    -[CKDetailsShowMoreContactsStandardCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMargins");
    v30 = v32;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "detailsContactAvatarLabelSpacing");
    v35 = v34;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "detailsViewContactImageDiameter");
    v29 = v21 - (v35 + v37);

  }
  -[CKDetailsShowMoreContactsStandardCell textLabel](self, "textLabel", v40, v42);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v29, v23, v25, v27);

  -[CKDetailsCell topSeperator](self, "topSeperator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v30, v43, v8 - v17, v41);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass](CKDetailsContactsTableViewCell, "cellClass", a3.width, a3.height));
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "sizeThatFits:", width, 3.40282347e38);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
