@implementation CNLabeledCell

- (void)setLabelTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_labelTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_labelTextAttributes, a3);
    -[CNLabeledCell labelView](self, "labelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (ABText)labelView
{
  return 0;
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (NSDictionary)valueTextAttributes
{
  return self->_valueTextAttributes;
}

- (BOOL)allowsCellSelection
{
  return 1;
}

- (void)setLabelViewNeedsHuggingContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  self->_labelViewNeedsHuggingContent = a3;
  objc_opt_class();
  -[CNLabeledCell labelView](self, "labelView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;
  CNSetLabelNeedsHuggingContent(v6, v3);

}

- (id)constantConstraintsForHorizontalLayout
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
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  objc_super v67;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v67.receiver = self;
  v67.super_class = (Class)CNLabeledCell;
  -[CNContactCell constantConstraints](&v67, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 5, 0, v8, 17, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 7, 1, 0, 0, 0.0, 44.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  -[CNLabeledCell valueView](self, "valueView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell valueView](self, "valueView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell labelView](self, "labelView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v16, 6, 1.0, 16.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  -[CNLabeledCell chevron](self, "chevron");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell chevron](self, "chevron");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 10, 0, v22, 10, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell chevron](self, "chevron");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell valueView](self, "valueView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 5, 1, v26, 6, 1.0, 16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v27);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell chevron](self, "chevron");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 6, 0, v30, 18, 1.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);

  }
  -[CNLabeledCell valueView](self, "valueView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0CB3718];
  if (v32)
  {
    -[CNLabeledCell valueView](self, "valueView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 3, 0, v35, 15, 1.0, 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v36);

    objc_msgSend(v5, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1148813312;
    objc_msgSend(v37, "setPriority:", v38);

    v39 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell valueView](self, "valueView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 16, 0, v41, 4, 1.0, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v42);

    objc_msgSend(v5, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = 1148813312;
    objc_msgSend(v43, "setPriority:", v44);

    v45 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell labelView](self, "labelView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell valueView](self, "valueView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 11, 0, v47, 11, 1.0, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v48);

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell valueView](self, "valueView");
  }
  else
  {
    -[CNLabeledCell labelView](self, "labelView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 3, 0, v51, 15, 1.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v52);

    objc_msgSend(v5, "lastObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = 1148813312;
    objc_msgSend(v53, "setPriority:", v54);

    v55 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell contentView](self, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell labelView](self, "labelView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v56, 16, 0, v57, 4, 1.0, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v58);

    objc_msgSend(v5, "lastObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 1148813312;
    objc_msgSend(v59, "setPriority:", v60);

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell labelView](self, "labelView");
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v61, 10, 0, v62, 10, 1.0, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v63);

  objc_msgSend(v5, "lastObject");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v65) = 1148796928;
  objc_msgSend(v64, "setPriority:", v65);

  return v5;
}

- (id)constantConstraintsForVerticalLayout
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  objc_super v58;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v58.receiver = self;
  v58.super_class = (Class)CNLabeledCell;
  -[CNContactCell constantConstraints](&v58, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 5, 0, v8, 17, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, -1, v12, 18, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell valueView](self, "valueView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, v16, 6, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  objc_msgSend(v5, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1144750080;
  objc_msgSend(v18, "setPriority:", v19);

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell valueView](self, "valueView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell labelView](self, "labelView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 5, 0, v22, 5, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  -[CNLabeledCell rightMostView](self, "rightMostView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell valueView](self, "valueView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 == v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell valueView](self, "valueView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 6, 0, v28, 18, 1.0, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v29);

    objc_msgSend(v5, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1144750080;
    objc_msgSend(v30, "setPriority:", v31);

  }
  v32 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell rightMostView](self, "rightMostView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 6, 0, v34, 18, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v35);

  objc_msgSend(v5, "lastObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1144750080;
  objc_msgSend(v36, "setPriority:", v37);

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell labelView](self, "labelView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 3, 0, v40, 15, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v41);

  objc_msgSend(v5, "lastObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = 1148829696;
  objc_msgSend(v42, "setPriority:", v43);

  v44 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell valueView](self, "valueView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell labelView](self, "labelView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 3, 0, v46, 4, 1.0, 4.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v47);

  objc_msgSend(v5, "lastObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v49) = 1148846080;
  objc_msgSend(v48, "setPriority:", v49);

  v50 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell valueView](self, "valueView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledCell valueViewBottomMargin](self, "valueViewBottomMargin");
  objc_msgSend(v50, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 16, 0, v52, 4, 1.0, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v54);

  objc_msgSend(v5, "lastObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = 1132003328;
  objc_msgSend(v55, "setPriority:", v56);

  return v5;
}

- (CNLabeledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNLabeledCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIImageView *chevron;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNLabeledCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v4->_labelViewNeedsHuggingContent = objc_msgSend((id)objc_opt_class(), "wantsHorizontalLayout");
    v4->_valueViewNeedsHuggingContent = objc_msgSend((id)objc_opt_class(), "wantsHorizontalLayout");
    -[CNLabeledCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell labelView](v4, "labelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[CNLabeledCell valueView](v4, "valueView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CNLabeledCell contentView](v4, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabeledCell valueView](v4, "valueView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

    }
    if (objc_msgSend((id)objc_opt_class(), "wantsChevron"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForContactCardChevron");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
      chevron = v4->_chevron;
      v4->_chevron = (UIImageView *)v11;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_chevron, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v13) = 1148846080;
      -[UIImageView setContentHuggingPriority:forAxis:](v4->_chevron, "setContentHuggingPriority:forAxis:", 0, v13);
      LODWORD(v14) = 1148846080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_chevron, "setContentCompressionResistancePriority:forAxis:", 0, v14);
      -[CNLabeledCell addChevron](v4, "addChevron");

    }
  }
  return v4;
}

- (id)variableConstraintsForStandardLayout
{
  void *v3;
  void *v4;

  if ((objc_msgSend((id)objc_opt_class(), "wantsHorizontalLayout") & 1) != 0
    || (-[CNLabeledCell valueView](self, "valueView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[CNLabeledCell variableConstraintsForHorizontalLayout](self, "variableConstraintsForHorizontalLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNLabeledCell variableConstraintsForVerticalLayout](self, "variableConstraintsForVerticalLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (double)minCellHeight
{
  int v2;
  double result;

  v2 = objc_msgSend((id)objc_opt_class(), "wantsHorizontalLayout");
  result = 60.0;
  if (v2)
    return 44.0;
  return result;
}

+ (BOOL)wantsHorizontalLayout
{
  return 0;
}

- (ABText)valueView
{
  return 0;
}

- (id)variableConstraintsForVerticalLayout
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v20.receiver = self;
  v20.super_class = (Class)CNLabeledCell;
  -[CNContactCell variableConstraints](&v20, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNLabeledCell chevron](self, "chevron");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell chevron](self, "chevron");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CNLabeledCell labelView](self, "labelView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 10, 0, v11, 10, 1.0, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      v13 = (void *)MEMORY[0x1E0CB3718];
      -[CNLabeledCell chevron](self, "chevron");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabeledCell labelView](self, "labelView");
    }
    else
    {
      -[CNLabeledCell contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 10, 0, v15, 10, 1.0, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

      v13 = (void *)MEMORY[0x1E0CB3718];
      -[CNLabeledCell chevron](self, "chevron");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabeledCell valueView](self, "valueView");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 5, 0, v17, 6, 1.0, 16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  return v5;
}

- (UIView)rightMostView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNLabeledCell chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNLabeledCell chevron](self, "chevron");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNLabeledCell valueView](self, "valueView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CNLabeledCell valueView](self, "valueView");
    else
      -[CNLabeledCell labelView](self, "labelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v5;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (id)constantConstraints
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (objc_msgSend((id)objc_opt_class(), "wantsStandardConstraints"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CNLabeledCell;
    -[CNContactCell constantConstraints](&v8, sel_constantConstraints);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell constantConstraintsForStandardLayout](self, "constantConstraintsForStandardLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNLabeledCell;
    -[CNContactCell constantConstraints](&v7, sel_constantConstraints);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (objc_msgSend((id)objc_opt_class(), "wantsStandardConstraints"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CNLabeledCell;
    -[CNContactCell variableConstraints](&v8, sel_variableConstraints);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell variableConstraintsForStandardLayout](self, "variableConstraintsForStandardLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNLabeledCell;
    -[CNContactCell variableConstraints](&v7, sel_variableConstraints);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (BOOL)wantsStandardConstraints
{
  return 1;
}

- (id)constantConstraintsForStandardLayout
{
  void *v3;
  void *v4;

  if ((objc_msgSend((id)objc_opt_class(), "wantsHorizontalLayout") & 1) != 0
    || (-[CNLabeledCell valueView](self, "valueView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[CNLabeledCell constantConstraintsForHorizontalLayout](self, "constantConstraintsForHorizontalLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNLabeledCell constantConstraintsForVerticalLayout](self, "constantConstraintsForVerticalLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)wantsChevron
{
  return 0;
}

- (id)variableConstraintsForHorizontalLayout
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
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v13.receiver = self;
  v13.super_class = (Class)CNLabeledCell;
  -[CNContactCell variableConstraints](&v13, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNLabeledCell chevron](self, "chevron");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell rightMostView](self, "rightMostView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 6, 0, v10, 18, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

- (double)valueViewBottomMargin
{
  return 0.0;
}

- (UILabel)standardValueView
{
  id v3;
  void *v4;
  double v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  LODWORD(v5) = 1148829696;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v5);
  objc_msgSend(v4, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
  objc_msgSend(v4, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  CNSetLabelNeedsHuggingContent(v4, -[CNLabeledCell valueViewNeedsHuggingContent](self, "valueViewNeedsHuggingContent"));
  return (UILabel *)v4;
}

- (BOOL)valueViewNeedsHuggingContent
{
  return self->_valueViewNeedsHuggingContent;
}

- (UILabel)standardLabelView
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  CNSetLabelNeedsHuggingContent(v4, -[CNLabeledCell labelViewNeedsHuggingContent](self, "labelViewNeedsHuggingContent"));
  return (UILabel *)v4;
}

- (BOOL)labelViewNeedsHuggingContent
{
  return self->_labelViewNeedsHuggingContent;
}

- (void)setValueTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_valueTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_valueTextAttributes, a3);
    -[CNLabeledCell valueView](self, "valueView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CNLabeledCell;
  -[CNLabeledCell tintColorDidChange](&v6, sel_tintColorDidChange);
  v7 = *MEMORY[0x1E0DC1140];
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("labelTextAttributes"), v5);

}

- (void)addChevron
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNLabeledCell chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNLabeledCell chevron](self, "chevron");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CNLabeledCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabeledCell chevron](self, "chevron");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v7);

      -[CNLabeledCell needsUpdateConstraints](self, "needsUpdateConstraints");
    }
  }
}

- (void)removeChevron
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNLabeledCell chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNLabeledCell chevron](self, "chevron");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNLabeledCell chevron](self, "chevron");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      -[CNLabeledCell needsUpdateConstraints](self, "needsUpdateConstraints");
    }
  }
}

- (double)chevronWidth
{
  return 16.0;
}

- (void)setValueViewNeedsHuggingContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  self->_valueViewNeedsHuggingContent = a3;
  objc_opt_class();
  -[CNLabeledCell valueView](self, "valueView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;
  CNSetLabelNeedsHuggingContent(v6, v3);

}

- (NSString)labelString
{
  return 0;
}

- (NSString)valueString
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);
  objc_storeStrong((id *)&self->_labelTextAttributes, 0);
}

@end
