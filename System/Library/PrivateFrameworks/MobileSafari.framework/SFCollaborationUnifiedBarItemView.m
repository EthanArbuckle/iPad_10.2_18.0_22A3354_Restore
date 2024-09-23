@implementation SFCollaborationUnifiedBarItemView

- (void)setCollaborationButton:(id)a3
{
  _SWCollaborationButtonView *v5;
  _SWCollaborationButtonView *collaborationButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = (_SWCollaborationButtonView *)a3;
  collaborationButton = self->_collaborationButton;
  if (collaborationButton != v5)
  {
    -[_SWCollaborationButtonView removeFromSuperview](collaborationButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    if (v5)
    {
      -[_SWCollaborationButtonView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFUnifiedBarItemView contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v5);
      v15 = (void *)MEMORY[0x1E0CB3718];
      -[_SWCollaborationButtonView centerXAnchor](v5, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerXAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      -[_SWCollaborationButtonView centerYAnchor](v5, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerYAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activateConstraints:", v14);

      -[SFCollaborationUnifiedBarItemView setPointerStyleProvider:](self, "setPointerStyleProvider:", &__block_literal_global_49);
    }
  }

}

id __60__SFCollaborationUnifiedBarItemView_setCollaborationButton___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC3B38];
  v5 = (void *)MEMORY[0x1E0DC3B30];
  v6 = a3;
  objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)preferredWidth
{
  double result;

  -[_SWCollaborationButtonView systemLayoutSizeFittingSize:](self->_collaborationButton, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  return result;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
}

@end
