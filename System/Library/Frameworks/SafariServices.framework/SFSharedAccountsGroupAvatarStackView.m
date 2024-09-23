@implementation SFSharedAccountsGroupAvatarStackView

- (SFSharedAccountsGroupAvatarStackView)initWithAvatarDiameter:(double)a3 avatarSpacing:(double)a4 maximumNumberOfAvatarsToDisplay:(unint64_t)a5
{
  SFSharedAccountsGroupAvatarStackView *v8;
  SFSharedAccountsGroupAvatarStackView *v9;
  SFSharedAccountsGroupAvatarStackView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFSharedAccountsGroupAvatarStackView;
  v8 = -[SFSharedAccountsGroupAvatarStackView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_avatarDiameter = a3;
    v8->_avatarSpacing = a4;
    v8->_maximumNumberOfAvatarsToDisplay = a5;
    v10 = v8;
  }

  return v9;
}

- (void)configureWithGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SFSharedAccountsGroupAvatarStackView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

  if (v4
    && (objc_msgSend(v4, "participants"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11 != 1))
  {
    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "groupMemberDataForGroup:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFSharedAccountsGroupAvatarStackView _imageViewsForGroupMemberData:](self, "_imageViewsForGroupMemberData:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "avatarImageForPrimaryAccountOwnerWithDiameter:", self->_avatarDiameter);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SFSharedAccountsGroupAvatarStackView _addAvatarImageViews:](self, "_addAvatarImageViews:", v15);

}

- (void)configureWithInvitedGroupMemberData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SFSharedAccountsGroupAvatarStackView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[SFSharedAccountsGroupAvatarStackView _imageViewsForGroupMemberData:](self, "_imageViewsForGroupMemberData:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupAvatarStackView _addAvatarImageViews:](self, "_addAvatarImageViews:", v10);

}

- (id)_imageViewsForGroupMemberData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t maximumNumberOfAvatarsToDisplay;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfAvatarsToDisplay = self->_maximumNumberOfAvatarsToDisplay;
  if (maximumNumberOfAvatarsToDisplay >= objc_msgSend(v7, "count"))
    v9 = objc_msgSend(v7, "count");
  else
    v9 = self->_maximumNumberOfAvatarsToDisplay;
  objc_msgSend(v7, "subarrayWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "count");
  v12 = v11 - objc_msgSend(v10, "count");
  v13 = self->_maximumNumberOfAvatarsToDisplay;
  v33 = v6;
  if (v12 >= v13 - objc_msgSend(v10, "count"))
    v14 = self->_maximumNumberOfAvatarsToDisplay;
  else
    v14 = objc_msgSend(v6, "count", v6);
  v15 = objc_msgSend(v10, "count", v33);
  if (v14 != v15)
  {
    v16 = v15 - v14;
    do
    {
      objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "placeholderAvatarImageWithDiameter:", self->_avatarDiameter);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
      objc_msgSend(v5, "addObject:", v19);

    }
    while (!__CFADD__(v16++, 1));
  }
  v21 = v5;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "avatarImageForGroupMember:diameter:", v27, self->_avatarDiameter);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v29);
        objc_msgSend(v21, "addObject:", v30);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  v31 = (void *)objc_msgSend(v21, "copy");
  return v31;
}

uint64_t __70__SFSharedAccountsGroupAvatarStackView__imageViewsForGroupMemberData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMeParticipant") ^ 1;
}

BOOL __70__SFSharedAccountsGroupAvatarStackView__imageViewsForGroupMemberData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_addAvatarImageViews:(id)a3
{
  id v4;
  double avatarDiameter;
  id v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
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
  id obj;
  id obja;
  SFSharedAccountsGroupAvatarStackView *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[8];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  avatarDiameter = self->_avatarDiameter;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v6 = v4;
  obj = v6;
  v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (!v34)
    goto LABEL_13;
  v6 = 0;
  v7 = avatarDiameter + ceil(avatarDiameter / 10.0);
  v33 = *(_QWORD *)v52;
  v31 = self;
  v32 = *MEMORY[0x1E0CD2C50];
  do
  {
    v8 = 0;
    v9 = v6;
    do
    {
      v48 = v9;
      if (*(_QWORD *)v52 != v33)
        objc_enumerationMutation(obj);
      v49 = v8;
      v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
      v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v12);

      objc_msgSend(v11, "_setCornerRadius:", v7 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCompositingFilter:", v13);

      -[SFSharedAccountsGroupAvatarStackView addSubview:](self, "addSubview:", v11);
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFSharedAccountsGroupAvatarStackView addSubview:](self, "addSubview:", v10);
      objc_msgSend(v10, "widthAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToConstant:", self->_avatarDiameter);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v46;
      objc_msgSend(v10, "heightAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToConstant:", self->_avatarDiameter);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v44;
      objc_msgSend(v10, "centerYAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSharedAccountsGroupAvatarStackView centerYAnchor](self, "centerYAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v41;
      -[SFSharedAccountsGroupAvatarStackView heightAnchor](self, "heightAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "heightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v55[3] = v38;
      objc_msgSend(v11, "centerXAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerXAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v36);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v55[4] = v35;
      objc_msgSend(v11, "centerYAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v55[5] = v17;
      objc_msgSend(v11, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55[6] = v19;
      objc_msgSend(v11, "heightAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToConstant:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55[7] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObjectsFromArray:", v22);

      if (v48)
      {
        objc_msgSend(v10, "centerXAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        self = v31;
        objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, v31->_avatarSpacing);
      }
      else
      {
        objc_msgSend(v10, "leadingAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        self = v31;
        -[SFSharedAccountsGroupAvatarStackView leadingAnchor](v31, "leadingAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObject:", v25, obj);

      v6 = v10;
      v8 = v49 + 1;
      v9 = v6;
    }
    while (v34 != v49 + 1);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  }
  while (v34);

  if (v6)
  {
    objc_msgSend(v6, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupAvatarStackView trailingAnchor](self, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v28);

LABEL_13:
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v50, obj);

}

@end
