@implementation DOCTagsCollectionViewTagCell

- (DOCTagsCollectionViewTagCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DOCTagsCollectionViewTagCell *v7;
  DOCTagsCollectionItemContentView *v8;
  DOCTagsCollectionItemContentView *tagView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[7];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37[5] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)DOCTagsCollectionViewTagCell;
  v7 = -[DOCTagsCollectionViewTagCell initWithFrame:](&v36, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[DOCTagsCollectionItemContentView initWithFrame:]([DOCTagsCollectionItemContentView alloc], "initWithFrame:", x, y, width, height);
    tagView = v7->_tagView;
    v7->_tagView = v8;

    -[DOCTagsCollectionItemContentView setTranslatesAutoresizingMaskIntoConstraints:](v7->_tagView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagsCollectionViewTagCell contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    v27 = v10;
    v28 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v10, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell maxTagWidth](v7, "maxTagWidth");
    objc_msgSend(v30, "constraintLessThanOrEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    objc_msgSend(v10, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v23;
    objc_msgSend(v10, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v16;
    objc_msgSend(v10, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewTagCell tagView](v7, "tagView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v21);

  }
  return v7;
}

- (id)doc_tagsCollectionCellMenuTarget
{
  return self->_tagView;
}

- (double)maxTagWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValueForValue:", 125.0);
  v4 = v3;

  return v4;
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[DOCTagsCollectionViewTagCell tagView](self, "tagView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForFirstBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;

  -[DOCTagsCollectionViewTagCell tagView](self, "tagView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForLastBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DOCTagsCollectionItemContentView)tagView
{
  return self->_tagView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagView, 0);
}

@end
