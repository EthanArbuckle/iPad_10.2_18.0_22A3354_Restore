@implementation _UIDocumentPickerSortOrderView

- (_UIDocumentPickerSortOrderView)initWithFrame:(CGRect)a3
{
  _UIDocumentPickerSortOrderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)_UIDocumentPickerSortOrderView;
  v3 = -[_UIDocumentPickerSortOrderView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Date[sort option]"), CFSTR("Date"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Name[sort option]"), CFSTR("Name"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tags[sort option]"), CFSTR("Tags"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BDF6D78]);
    v28[0] = v5;
    v28[1] = v7;
    v28[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithItems:", v11);
    -[_UIDocumentPickerSortOrderView setSortOrder:](v3, "setSortOrder:", v12);

    -[_UIDocumentPickerSortOrderView sortOrder](v3, "sortOrder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerSortOrderView sortOrder](v3, "sortOrder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView addSubview:](v3, "addSubview:", v14);

    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView setListModeToggle:](v3, "setListModeToggle:", v15);

    -[_UIDocumentPickerSortOrderView listModeToggle](v3, "listModeToggle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UIButtonBarListIcon.png"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithRenderingMode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDocumentPickerSortOrderView listModeToggle](v3, "listModeToggle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:forState:", v18, 0);

    -[_UIDocumentPickerSortOrderView listModeToggle](v3, "listModeToggle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);

    -[_UIDocumentPickerSortOrderView listModeToggle](v3, "listModeToggle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView addSubview:](v3, "addSubview:", v21);

    -[_UIDocumentPickerSortOrderView sortOrder](v3, "sortOrder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", v3, sel_valueChanged_, 4096);

    -[_UIDocumentPickerSortOrderView listModeToggle](v3, "listModeToggle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", v3, sel__toggleListMode_, 64);

    -[_UIDocumentPickerSortOrderView updateForListMode](v3, "updateForListMode");
    -[_UIDocumentPickerSortOrderView heightAnchor](v3, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 44.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

  }
  return v3;
}

- (void)setNeedsLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerSortOrderView;
  -[_UIDocumentPickerSortOrderView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  unint64_t v7;
  _BOOL4 listModeToggleHidden;
  void *v9;
  void *v10;
  int v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[5];
  _QWORD v74[7];

  v74[5] = *MEMORY[0x24BDAC8D0];
  v72.receiver = self;
  v72.super_class = (Class)_UIDocumentPickerSortOrderView;
  -[_UIDocumentPickerSortOrderView layoutSubviews](&v72, sel_layoutSubviews);
  -[_UIDocumentPickerSortOrderView size](self, "size");
  v4 = v3;
  -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = 0x2554D5000uLL;
  if (v4 > (v6 + 13.0 + 13.0) * 2.0 + 263.0)
  {

    goto LABEL_4;
  }
  listModeToggleHidden = self->_listModeToggleHidden;

  if (listModeToggleHidden)
  {
LABEL_4:
    -[_UIDocumentPickerSortOrderView leftAlignedConstraints](self, "leftAlignedConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isActive");

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD1628];
      -[_UIDocumentPickerSortOrderView leftAlignedConstraints](self, "leftAlignedConstraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deactivateConstraints:", v13);

    }
    -[_UIDocumentPickerSortOrderView centeredConstraints](self, "centeredConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "centerXAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView centerXAnchor](self, "centerXAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:", v66);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v64;
      -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "centerYAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView centerYAnchor](self, "centerYAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v58);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v56;
      -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintGreaterThanOrEqualToConstant:", 263.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v73[2] = v50;
      -[_UIDocumentPickerSortOrderView trailingAnchor](self, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 13.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v73[3] = v18;
      -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView centerYAnchor](self, "centerYAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v73[4] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView setCenteredConstraints:](self, "setCenteredConstraints:", v23);

      v7 = 0x2554D5000uLL;
    }
    -[_UIDocumentPickerSortOrderView centeredConstraints](self, "centeredConstraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isActive");

    if ((v26 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x24BDD1628];
      -[_UIDocumentPickerSortOrderView centeredConstraints](self, "centeredConstraints");
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v29 = (void *)v28;
      objc_msgSend(v27, "activateConstraints:", v28);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[_UIDocumentPickerSortOrderView centeredConstraints](self, "centeredConstraints");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isActive");

  if (v34)
  {
    v35 = (void *)MEMORY[0x24BDD1628];
    -[_UIDocumentPickerSortOrderView centeredConstraints](self, "centeredConstraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "deactivateConstraints:", v36);

  }
  -[_UIDocumentPickerSortOrderView leftAlignedConstraints](self, "leftAlignedConstraints");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView leadingAnchor](self, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v67, 8.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v65;
    -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView centerYAnchor](self, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v57;
    -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintGreaterThanOrEqualToConstant:", 263.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v51;
    -[_UIDocumentPickerSortOrderView trailingAnchor](self, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 5.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v41;
    -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView centerYAnchor](self, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSortOrderView setLeftAlignedConstraints:](self, "setLeftAlignedConstraints:", v46);

    v7 = 0x2554D5000;
  }
  -[_UIDocumentPickerSortOrderView leftAlignedConstraints](self, "leftAlignedConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "isActive");

  if ((v49 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x24BDD1628];
    -[_UIDocumentPickerSortOrderView leftAlignedConstraints](self, "leftAlignedConstraints");
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  v30 = *((unsigned __int8 *)&self->super.super.super.super.isa + *(int *)(v7 + 2652));
  -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setHidden:", v30);

}

- (void)updateForListMode
{
  _BOOL8 v2;
  id v3;

  v2 = self->_listMode == 2;
  -[_UIDocumentPickerSortOrderView listModeToggle](self, "listModeToggle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", v2);

}

- (void)setValue:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", v3);

}

- (int)value
{
  void *v2;
  int v3;

  -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex");

  return v3;
}

- (void)valueChanged:(id)a3
{
  void *v4;

  -[_UIDocumentPickerSortOrderView sortOrder](self, "sortOrder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerSortOrderView setValue:](self, "setValue:", objc_msgSend(v4, "selectedSegmentIndex"));

  -[_UIDocumentPickerSortOrderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)setListMode:(int64_t)a3
{
  if (self->_listMode != a3)
  {
    self->_listMode = a3;
    -[_UIDocumentPickerSortOrderView updateForListMode](self, "updateForListMode");
  }
}

- (void)_toggleListMode:(id)a3
{
  uint64_t v4;

  if (self->_listMode == 1)
    v4 = 2;
  else
    v4 = 1;
  -[_UIDocumentPickerSortOrderView setListMode:](self, "setListMode:", v4);
  -[_UIDocumentPickerSortOrderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)setListModeToggleHidden:(BOOL)a3
{
  self->_listModeToggleHidden = a3;
  -[_UIDocumentPickerSortOrderView setNeedsLayout](self, "setNeedsLayout");
}

- (_UIDocumentPickerViewServiceViewController)serviceViewController
{
  return self->_serviceViewController;
}

- (void)setServiceViewController:(id)a3
{
  self->_serviceViewController = (_UIDocumentPickerViewServiceViewController *)a3;
}

- (int64_t)listMode
{
  return self->_listMode;
}

- (BOOL)listModeToggleHidden
{
  return self->_listModeToggleHidden;
}

- (UISegmentedControl)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(id)a3
{
  objc_storeStrong((id *)&self->_sortOrder, a3);
}

- (UIButton)listModeToggle
{
  return self->_listModeToggle;
}

- (void)setListModeToggle:(id)a3
{
  objc_storeStrong((id *)&self->_listModeToggle, a3);
}

- (NSArray)leftAlignedConstraints
{
  return self->_leftAlignedConstraints;
}

- (void)setLeftAlignedConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)centeredConstraints
{
  return self->_centeredConstraints;
}

- (void)setCenteredConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredConstraints, 0);
  objc_storeStrong((id *)&self->_leftAlignedConstraints, 0);
  objc_storeStrong((id *)&self->_listModeToggle, 0);
  objc_storeStrong((id *)&self->_sortOrder, 0);
}

@end
