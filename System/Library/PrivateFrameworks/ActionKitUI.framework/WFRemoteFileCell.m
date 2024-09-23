@implementation WFRemoteFileCell

- (WFRemoteFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFRemoteFileCell *v4;
  WFRemoteFileCell *v5;
  void *v6;
  WFRemoteFileCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRemoteFileCell;
  v4 = -[WFRemoteFileCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFRemoteFileCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    -[WFRemoteFileCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 49.0, 0.0, 0.0);
    v7 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CGRect v33;
  CGRect remainder;
  objc_super v35;
  CGRect v36;
  CGRect v37;

  v35.receiver = self;
  v35.super_class = (Class)WFRemoteFileCell;
  -[WFRemoteFileCell layoutSubviews](&v35, sel_layoutSubviews);
  -[WFRemoteFileCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v10;

  memset(&v33, 0, sizeof(v33));
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  CGRectDivide(v36, &v33, &remainder, 5.0, CGRectMinXEdge);
  CGRectDivide(remainder, &v33, &remainder, 44.0, CGRectMinXEdge);
  v37 = CGRectInset(v33, 5.0, 5.0);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  -[WFRemoteFileCell imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  -[WFRemoteFileCell textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;

  v22 = remainder.origin.x;
  v23 = remainder.size.width;
  -[WFRemoteFileCell textLabel](self, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v22, v19, v23, v21);

  -[WFRemoteFileCell detailTextLabel](self, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;

  v30 = remainder.origin.x;
  v31 = remainder.size.width;
  -[WFRemoteFileCell detailTextLabel](self, "detailTextLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v30, v27, v31, v29);

}

- (void)setFile:(id)a3 checked:(BOOL)a4 dateFormatter:(id)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v6 = a4;
  v32 = a3;
  v8 = a5;
  v9 = objc_msgSend(v32, "wfIsDirectory");
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("Folder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v32, "wfFileType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentIcon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v32, "wfPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v10, "UIImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileCell imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v15);

  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v32, "wfFileSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longLongValue");

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v21 = v9;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    objc_msgSend(v17, "addObject:", v20);
  objc_msgSend(v32, "wfLastModifiedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "length"))
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("modified %@"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringWithFormat:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v27);

  }
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileCell detailTextLabel](self, "detailTextLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v28);

  v30 = 3;
  if (!v6)
    v30 = 0;
  if (v9)
    v31 = 1;
  else
    v31 = v30;
  -[WFRemoteFileCell setAccessoryType:](self, "setAccessoryType:", v31);

}

@end
