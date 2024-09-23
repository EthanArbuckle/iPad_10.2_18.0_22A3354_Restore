@implementation HKQuantitySeriesTableViewCell

- (HKQuantitySeriesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKQuantitySeriesTableViewCell *v4;
  HKQuantitySeriesTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKQuantitySeriesTableViewCell;
  v4 = -[HKQuantitySeriesTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    -[HKQuantitySeriesTableViewCell _configureLabels](v4, "_configureLabels");
    -[HKQuantitySeriesTableViewCell traitCollection](v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantitySeriesTableViewCell _configureLayoutForTraitCollection:](v5, "_configureLayoutForTraitCollection:", v6);

  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesTableViewCell;
  v4 = a3;
  -[HKQuantitySeriesTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesTableViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[HKQuantitySeriesTableViewCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantitySeriesTableViewCell _configureLayoutForTraitCollection:](self, "_configureLayoutForTraitCollection:", v8);

  }
}

+ (id)reuseIdentifier
{
  return CFSTR("HKQuantitySeriesTableViewCell");
}

- (void)_configureLabels
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1144750080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1144750080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);

  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 0);

  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1132068864;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1132068864;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v13);

}

- (void)_configureLayoutForTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3718];
  v5 = a3;
  -[HKQuantitySeriesTableViewCell currentConstraints](self, "currentConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v6);

  -[HKQuantitySeriesTableViewCell setCurrentConstraints:](self, "setCurrentConstraints:", 0);
  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v7);
  if ((_DWORD)v5)
    -[HKQuantitySeriesTableViewCell _makeAccessibilityConstraints](self, "_makeAccessibilityConstraints");
  else
    -[HKQuantitySeriesTableViewCell _makeConstraints](self, "_makeConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesTableViewCell setCurrentConstraints:](self, "setCurrentConstraints:", v8);

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[HKQuantitySeriesTableViewCell currentConstraints](self, "currentConstraints");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v10);

}

- (id)_makeConstraints
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
  id v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  _BYTE v53[128];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  -[HKQuantitySeriesTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v39;
  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v5;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v9;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v4;
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v31;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v49;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v14);
        LODWORD(v16) = 1148829696;
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v19++), "setPriority:", v16);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v17);
  }

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v40;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v32;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v23, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v24;
  -[HKQuantitySeriesTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v28);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_makeAccessibilityConstraints
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
  id v15;
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
  _QWORD v36[9];

  v36[7] = *MEMORY[0x1E0C80C00];
  -[HKQuantitySeriesTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v28;
  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v24;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesTableViewCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v20, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v19;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v5;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v9;
  -[HKQuantitySeriesTableViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
}

@end
