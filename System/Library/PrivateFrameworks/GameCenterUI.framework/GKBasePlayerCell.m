@implementation GKBasePlayerCell

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceWhenContainedInInstancesOfClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "phoneMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetricsOverrides:", v5);

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)itemHeightList
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v5 = *MEMORY[0x1E0D25B68] == 0;
    else
      v5 = 0;
    v6 = !v5;
  }
  else
  {
    v6 = 0;
  }
  return (id)objc_msgSend(a1, "itemHeightListForIdiom:", v6);
}

+ (id)itemHeightListForIdiom:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC4A88];
  if (a3 == 1)
  {
    v10[0] = CFSTR("GKFixedHeightSentinel");
    v10[1] = v3;
    v11[0] = &unk_1E5A5DDE8;
    v11[1] = &unk_1E5A5E6C0;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v11;
    v6 = v10;
  }
  else
  {
    v8[0] = CFSTR("GKFixedHeightSentinel");
    v8[1] = v3;
    v9[0] = &unk_1E5A5E6D0;
    v9[1] = &unk_1E5A5E6C0;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v9;
    v6 = v8;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)padMetrics
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkStandardConstraintMetricsForIdiom:", 1);
}

+ (id)phoneMetrics
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkStandardConstraintMetricsForIdiom:", 0);
}

+ (double)defaultRowHeight
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 1)
    return 65.0;
  if (*MEMORY[0x1E0D25B68])
    v4 = 1;
  else
    v4 = *MEMORY[0x1E0D253F8] == 0;
  result = 65.0;
  if (v4)
    return 90.0;
  return result;
}

- (CGRect)alignmentRectForText
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UILabel frame](self->_nameLabel, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel superview](self->_nameLabel, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBasePlayerCell convertRect:fromView:](self, "convertRect:fromView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (GKBasePlayerCell)initWithFrame:(CGRect)a3
{
  GKBasePlayerCell *v3;
  GKDashboardPlayerPhotoView *v4;
  uint64_t v5;
  GKDashboardPlayerPhotoView *iconView;
  uint64_t v7;
  UILabel *nameLabel;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKBasePlayerCell;
  v3 = -[GKCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKDashboardPlayerPhotoView alloc];
    v5 = -[GKDashboardPlayerPhotoView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    iconView = v3->_iconView;
    v3->_iconView = (GKDashboardPlayerPhotoView *)v5;

    -[GKDashboardPlayerPhotoView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKDashboardPlayerPhotoView setAvatarSize:](v3->_iconView, "setAvatarSize:", 0x10000);
    v7 = -[UICollectionReusableView _gkNewStandardTitleLabel](v3, "_gkNewStandardTitleLabel");
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v7;

    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_nameLabel);

    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_iconView);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68]))
    {
      objc_msgSend((id)objc_opt_class(), "padMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "phoneMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    objc_storeStrong((id *)&v3->_metricsOverrides, v13);

  }
  return v3;
}

- (void)setRepresentedItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[GKCollectionViewCell representedItem](self, "representedItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    -[GKBasePlayerCell iconView](self, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayer:", v4);

    v7.receiver = self;
    v7.super_class = (Class)GKBasePlayerCell;
    -[GKCollectionViewCell setRepresentedItem:](&v7, sel_setRepresentedItem_, v4);
  }

}

- (void)didUpdateModel
{
  void *v3;
  id v4;

  -[GKBasePlayerCell player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v3);

}

- (BOOL)canRemoveItem
{
  return 1;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKBasePlayerCell;
  -[GKCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[GKDashboardPlayerPhotoView setPlayer:](self->_iconView, "setPlayer:", 0);
}

- (void)setMetricsOverrides:(id)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  if (self->_metricsOverrides != v5)
  {
    objc_storeStrong((id *)&self->_metricsOverrides, a3);
    -[GKBasePlayerCell iconView](self, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_metricsOverrides, "objectForKeyedSubscript:", CFSTR("iconSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    if (v9 > 0.0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[GKCollectionViewCell staticContentView](self, "staticContentView", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
            objc_msgSend(v16, "firstItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17 == v6 && !objc_msgSend(v16, "relation"))
            {
              objc_msgSend(v16, "secondItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18 && (objc_msgSend(v16, "firstAttribute") == 8 || objc_msgSend(v16, "firstAttribute") == 7))
                objc_msgSend(v16, "setConstant:", v9);
            }
            else
            {

            }
            ++v15;
          }
          while (v13 != v15);
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v13 = v19;
        }
        while (v19);
      }

    }
  }

}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (GKDashboardPlayerPhotoView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (NSDictionary)metricsOverrides
{
  return self->_metricsOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsOverrides, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
