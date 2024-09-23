@implementation HKMaximumSizeView

- (HKMaximumSizeView)initWithView:(id)a3 maximumSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  HKMaximumSizeView *v8;
  HKMaximumSizeView *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMaximumSizeView;
  v8 = -[HKMaximumSizeView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 1.0, 1.0);
  v9 = v8;
  if (v8)
  {
    -[HKMaximumSizeView addSubview:](v8, "addSubview:", v7);
    -[HKMaximumSizeView _buildConstraintsForView:](v9, "_buildConstraintsForView:", v7);
    -[HKMaximumSizeView setMaximumSize:](v9, "setMaximumSize:", width, height);
  }

  return v9;
}

- (void)_buildConstraintsForView:(id)a3
{
  id v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *maximumWidthConstraint;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *maximumHeightConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *hardHorizontalConstraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *hardVerticalConstraints;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *softHorizontalConstraints;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  NSArray *softVerticalConstraints;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintLessThanOrEqualToConstant:", 10.0);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  maximumWidthConstraint = self->_maximumWidthConstraint;
  self->_maximumWidthConstraint = v6;

  objc_msgSend(v4, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToConstant:", 10.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = v9;

  objc_msgSend(v4, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView leadingAnchor](self, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v13;
  objc_msgSend(v4, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hardHorizontalConstraints = self->_hardHorizontalConstraints;
  self->_hardHorizontalConstraints = v17;

  objc_msgSend(v4, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v21;
  objc_msgSend(v4, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hardVerticalConstraints = self->_hardVerticalConstraints;
  self->_hardVerticalConstraints = v25;

  objc_msgSend(v4, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView leadingAnchor](self, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v28;
  objc_msgSend(v4, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView trailingAnchor](self, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v31;
  objc_msgSend(v4, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView centerXAnchor](self, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
  softHorizontalConstraints = self->_softHorizontalConstraints;
  self->_softHorizontalConstraints = v35;

  objc_msgSend(v4, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView topAnchor](self, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v39;
  objc_msgSend(v4, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView bottomAnchor](self, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  objc_msgSend(v4, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMaximumSizeView centerYAnchor](self, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  softVerticalConstraints = self->_softVerticalConstraints;
  self->_softVerticalConstraints = v46;

}

- (void)setMaximumSize:(CGSize)a3
{
  double height;
  double width;
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

  height = a3.height;
  width = a3.width;
  -[HKMaximumSizeView maximumWidthConstraint](self, "maximumWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (width <= 0.0)
  {
    objc_msgSend(v6, "setActive:", 0);

    -[HKMaximumSizeView softHorizontalConstraints](self, "softHorizontalConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v10, 0);

    -[HKMaximumSizeView hardHorizontalConstraints](self, "hardHorizontalConstraints");
  }
  else
  {
    objc_msgSend(v6, "setConstant:", width);

    -[HKMaximumSizeView maximumWidthConstraint](self, "maximumWidthConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[HKMaximumSizeView hardHorizontalConstraints](self, "hardHorizontalConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v9, 0);

    -[HKMaximumSizeView softHorizontalConstraints](self, "softHorizontalConstraints");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v11, 1);

  -[HKMaximumSizeView maximumHeightConstraint](self, "maximumHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (height <= 0.0)
  {
    objc_msgSend(v12, "setActive:", 0);

    -[HKMaximumSizeView softVerticalConstraints](self, "softVerticalConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v16, 0);

    -[HKMaximumSizeView hardVerticalConstraints](self, "hardVerticalConstraints");
  }
  else
  {
    objc_msgSend(v12, "setConstant:", height);

    -[HKMaximumSizeView maximumHeightConstraint](self, "maximumHeightConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[HKMaximumSizeView hardVerticalConstraints](self, "hardVerticalConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v15, 0);

    -[HKMaximumSizeView softVerticalConstraints](self, "softVerticalConstraints");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMaximumSizeView _setConstraints:active:](self, "_setConstraints:active:", v17, 1);

  -[HKMaximumSizeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setConstraints:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setActive:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (void)setMaximumWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_maximumWidthConstraint, a3);
}

- (NSLayoutConstraint)maximumHeightConstraint
{
  return self->_maximumHeightConstraint;
}

- (void)setMaximumHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_maximumHeightConstraint, a3);
}

- (NSArray)hardHorizontalConstraints
{
  return self->_hardHorizontalConstraints;
}

- (void)setHardHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_hardHorizontalConstraints, a3);
}

- (NSArray)hardVerticalConstraints
{
  return self->_hardVerticalConstraints;
}

- (void)setHardVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_hardVerticalConstraints, a3);
}

- (NSArray)softHorizontalConstraints
{
  return self->_softHorizontalConstraints;
}

- (void)setSoftHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_softHorizontalConstraints, a3);
}

- (NSArray)softVerticalConstraints
{
  return self->_softVerticalConstraints;
}

- (void)setSoftVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_softVerticalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_softHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_hardVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_hardHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
}

@end
