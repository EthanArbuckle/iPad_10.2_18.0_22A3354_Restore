@implementation _CNAvatarView

- (void)setLikenessProviders:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_likenessProviders != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_likenessProviders, a3);
    -[_CNAvatarView setupSubviews](self, "setupSubviews");
    v5 = v6;
  }

}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[_CNAvatarView subviewsConstraints](self, "subviewsConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[_CNAvatarView subviewsConstraints](self, "subviewsConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAvatarView likenessProviders](self, "likenessProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30___CNAvatarView_setupSubviews__block_invoke;
  v9[3] = &unk_1E2049C28;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  -[_CNAvatarView setLikenessViews:](self, "setLikenessViews:", v8);
  -[_CNAvatarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  void *v3;
  _CNAvatarView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  -[_CNAvatarView likenessViews](v4, "likenessViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[_CNAvatarView likenessViews](v4, "likenessViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 6, 0, v4, 6, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v4, 4, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 7, 0, v8, 8, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    -[_CNAvatarView likenessViews](v4, "likenessViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") > 1)
      v9 = 0.666666667;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 7, 0, v4, 7, v9, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  -[_CNAvatarView likenessViews](v4, "likenessViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 >= 2)
  {
    -[_CNAvatarView likenessViews](v4, "likenessViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 5, 0, v4, 5, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 3, 0, v4, 3, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 7, 0, v18, 8, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 7, 0, v4, 7, 0.666666667, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  -[_CNAvatarView setSubviewsConstraints:](v4, "setSubviewsConstraints:", v3);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  v23.receiver = v4;
  v23.super_class = (Class)_CNAvatarView;
  -[_CNAvatarView updateConstraints](&v23, sel_updateConstraints);

}

- (_CNAvatarViewDelegate)delegate
{
  return (_CNAvatarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)likenessProviders
{
  return self->_likenessProviders;
}

- (NSArray)likenessViews
{
  return self->_likenessViews;
}

- (void)setLikenessViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSArray)subviewsConstraints
{
  return self->_subviewsConstraints;
}

- (void)setSubviewsConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsConstraints, 0);
  objc_storeStrong((id *)&self->_likenessViews, 0);
  objc_storeStrong((id *)&self->_likenessProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
