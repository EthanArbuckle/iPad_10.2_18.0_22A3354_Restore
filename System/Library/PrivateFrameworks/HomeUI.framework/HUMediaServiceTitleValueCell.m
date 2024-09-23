@implementation HUMediaServiceTitleValueCell

- (HUMediaServiceTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUMediaServiceTitleValueCell *v4;
  uint64_t v5;
  UIImageView *serviceIconView;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceTitleValueCell;
  v4 = -[HUTitleValueCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    serviceIconView = v4->_serviceIconView;
    v4->_serviceIconView = (UIImageView *)v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_serviceIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_serviceIconView, "setContentHuggingPriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_serviceIconView, "setContentHuggingPriority:forAxis:", 0, v8);
    -[UIImageView layer](v4->_serviceIconView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 5.0);

    -[UIImageView setClipsToBounds:](v4->_serviceIconView, "setClipsToBounds:", 1);
    -[HUIconCell iconView](v4, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_serviceIconView);

  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  -[HUIconCell contentMetrics](self, "contentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconSize");
  v5 = v4;

  if (v5 != 32.0)
    -[HUMediaServiceTitleValueCell _updateContentMetrics](self, "_updateContentMetrics");
  -[HUMediaServiceTitleValueCell constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[HUMediaServiceTitleValueCell constraints](self, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v8);

  }
  -[HUMediaServiceTitleValueCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = 1148829696;
  v26 = v11;
  objc_msgSend(v11, "setPriority:", v12);
  v28[0] = v11;
  -[HUMediaServiceTitleValueCell serviceIconView](self, "serviceIconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell iconView](self, "iconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v15;
  -[HUMediaServiceTitleValueCell serviceIconView](self, "serviceIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell iconView](self, "iconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceTitleValueCell setConstraints:](self, "setConstraints:", v21);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[HUMediaServiceTitleValueCell constraints](self, "constraints");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v23);

  v27.receiver = self;
  v27.super_class = (Class)HUMediaServiceTitleValueCell;
  -[HUTitleValueCell updateConstraints](&v27, sel_updateConstraints);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceTitleValueCell;
  -[HUTitleValueCell updateUIWithAnimation:](&v4, sel_updateUIWithAnimation_, a3);
  -[HUMediaServiceTitleValueCell _loadServiceIconImage](self, "_loadServiceIconImage");
}

- (void)_loadServiceIconImage
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (!-[HUMediaServiceTitleValueCell iconImageLoadingInProgress](self, "iconImageLoadingInProgress"))
  {
    -[HUMediaServiceTitleValueCell setIconImageLoadingInProgress:](self, "setIconImageLoadingInProgress:", 1);
    v3 = objc_opt_class();
    -[HUIconCell item](self, "item");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
      v6 = v4;
      if (v5)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

    }
    v6 = 0;
LABEL_9:

    objc_msgSend(v6, "mediaService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "hf_fetchImageFromURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke;
    v13[3] = &unk_1E6F54DA0;
    v13[4] = self;
    v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v13);

  }
}

void __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setIconImageLoadingInProgress:", 0);
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load media service icon with error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 64.0, 64.0, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke_12;
    v14[3] = &unk_1E6F54FF8;
    *(double *)&v14[5] = v11;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "getImageForImageDescriptor:completion:", v13, v14);

  }
}

void __53__HUMediaServiceTitleValueCell__loadServiceIconImage__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(a2, "CGImage"), 0, *(double *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setIconImageLoadingInProgress:", 0);
}

- (void)_updateContentMetrics
{
  id v3;

  +[HUIconCellContentMetrics defaultMetrics](HUIconCellContentMetrics, "defaultMetrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIconSize:", 32.0, 32.0);
  -[HUIconCell setContentMetrics:](self, "setContentMetrics:", v3);

}

- (UIImageView)serviceIconView
{
  return self->_serviceIconView;
}

- (void)setServiceIconView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIconView, a3);
}

- (BOOL)iconImageLoadingInProgress
{
  return self->_iconImageLoadingInProgress;
}

- (void)setIconImageLoadingInProgress:(BOOL)a3
{
  self->_iconImageLoadingInProgress = a3;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_serviceIconView, 0);
}

@end
