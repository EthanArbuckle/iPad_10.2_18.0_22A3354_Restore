@implementation CNComposeRecipientTableViewCell

+ (id)identifier
{
  return CFSTR("CNRecipientTableViewCellIdentifier");
}

+ (double)additionalSeparatorInset
{
  char v3;
  double result;
  objc_super v5;

  v3 = objc_msgSend(a1, "avatarsAreHidden");
  result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CNComposeRecipientTableViewCell;
    objc_msgSendSuper2(&v5, sel_additionalSeparatorInset, 0.0);
  }
  return result;
}

- (CNComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNComposeRecipientTableViewCell *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  CNComposeRecipientTableViewCell *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTableViewCell;
  v4 = -[CNComposeTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    if (CNComposeApplicationPreferredContentSizeIsLargerThanLarge())
    {
      -[CNComposeTableViewCell detailLabel](v4, "detailLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNumberOfLines:", 0);

      -[CNComposeTableViewCell detailLabel](v4, "detailLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 1.0;
      objc_msgSend(v6, "_setHyphenationFactor:", v7);

      -[CNComposeTableViewCell titleLabel](v4, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNumberOfLines:", 0);

      -[CNComposeTableViewCell titleLabel](v4, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 1.0;
      objc_msgSend(v9, "_setHyphenationFactor:", v10);

    }
    v11 = (void *)objc_opt_new();
    +[CNComposeRecipientActionButton systemButtonWithImage:target:action:](CNComposeRecipientActionButton, "systemButtonWithImage:target:action:", v11, v4, sel_actionButtonTapped);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "requireIntrinsicSizeForView:", v12);
    -[CNComposeRecipientTableViewCell setActionButton:](v4, "setActionButton:", v12);
    -[NUITableViewContainerCell containerView](v4, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertArrangedSubview:atIndex:", v12, 1);

    -[CNComposeRecipientTableViewCell setShouldHighlightCompleteMatches:](v4, "setShouldHighlightCompleteMatches:", 1);
    v14 = v4;

  }
  return v4;
}

+ (BOOL)avatarsAreHidden
{
  void *v2;
  NSString *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D8]) == NSOrderedDescending;

  return v4;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTableViewCell;
  v4 = a3;
  -[CNComposeTableViewCell containerViewDidLayoutArrangedSubviews:](&v6, sel_containerViewDidLayoutArrangedSubviews_, v4);
  -[NUITableViewContainerCell containerView](self, "containerView", v6.receiver, v6.super_class);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[CNComposeRecipientTableViewCell applyActionButtonTouchInsets](self, "applyActionButtonTouchInsets");
}

- (void)applyActionButtonTouchInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double MinX;
  double MaxX;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL4 IsIdentity;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_touchInsets");

    -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intrinsicContentSize");
    v7 = v6;

    -[NUITableViewContainerCell containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v11 = v7 * -0.5;

    if (-[CNComposeRecipientTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      MinX = CGRectGetMinX(v25);
    }
    else
    {
      -[NUITableViewContainerCell containerView](self, "containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      MaxX = CGRectGetMaxX(v26);
      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      MinX = MaxX - CGRectGetMaxX(v27);

    }
    v16 = v10 + v11;

    -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "transform");
    else
      memset(&v24, 0, sizeof(v24));
    IsIdentity = CGAffineTransformIsIdentity(&v24);

    v20 = -v16;
    if (IsIdentity)
      v21 = -MinX;
    else
      v21 = -v16;
    if (IsIdentity)
      v22 = v20;
    else
      v22 = -MinX;
    -[CNComposeRecipientTableViewCell actionButton](self, "actionButton", *(_OWORD *)&v24.a, *(_OWORD *)&v24.c, *(_OWORD *)&v24.tx);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setTouchInsets:", v22, v21, v22, v21);

  }
}

+ (id)_attributedStringForGroupMembersOfRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v34 = (void *)objc_opt_new();
  v32 = v10;
  v33 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v10, "sortedChildren");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "compositeName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          objc_msgSend(v18, "compositeName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "attributedStringWithBoldedRangesForMatchedStrings:inString:font:boldAllMatches:", v11, v21, v12, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v22);

        }
        objc_msgSend(v18, "shortName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24)
        {
          objc_msgSend(v18, "shortName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "attributedStringWithBoldedRangesForMatchedStrings:inString:font:boldAllMatches:", v11, v25, v12, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v26);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }

  objc_msgSend(a1, "_attributedStringForListOfGroupMemberNames:numberTruncated:", v34, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "size");
  if (v28 <= a5)
  {
    v30 = v27;
    v29 = v33;
  }
  else
  {
    v29 = v33;
    objc_msgSend(a1, "_attributedStringForListOfGroupMemberNames:numberTruncated:", v33, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

+ (id)_attributedStringForListOfGroupMemberNames:(id)a3 numberTruncated:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
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
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (a4)
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v6, "count");
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9 <= a4)
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("N_MEMBERS"), &stru_1E62C0368, CFSTR("Localized"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v13, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("N_MORE"), &stru_1E62C0368, CFSTR("Localized"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v17);
    objc_msgSend(v8, "arrayByAddingObject:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_msgSend(v7, "count");
    v21 = (void *)objc_opt_new();
    if (v20 == 2)
    {
      objc_msgSend(v7, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendAttributedString:", v22);

      v23 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SHORT_BINARY_RECIPIENT_SEPARATOR"), &stru_1E62C0368, CFSTR("Localized"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v23, "initWithString:", v25);
      objc_msgSend(v21, "appendAttributedString:", v26);

      objc_msgSend(v7, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendAttributedString:", v27);

      v19 = (void *)objc_msgSend(v21, "copy");
    }
    else
    {
      v50 = v7;
      v51 = v6;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v28 = v7;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0x1E0CB3000uLL;
        v32 = 0x1E0CB3000uLL;
        v52 = v28;
        v53 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v55 != v53)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v28, "lastObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34 == v35)
            {
              v36 = objc_alloc(*(Class *)(v31 + 1176));
              objc_msgSend(*(id *)(v32 + 1232), "bundleForClass:", objc_opt_class());
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SHORT_BINARY_RECIPIENT_SEPARATOR"), &stru_1E62C0368, CFSTR("Localized"));
              v38 = v30;
              v39 = v32;
              v40 = v31;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = (void *)objc_msgSend(v36, "initWithString:", v41);
              objc_msgSend(v21, "appendAttributedString:", v42);

              v31 = v40;
              v32 = v39;
              v30 = v38;
              v28 = v52;

            }
            objc_msgSend(v21, "appendAttributedString:", v34);
            objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v28, "count") - 2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34 != v35 && v34 != v43)
            {
              v45 = objc_alloc(*(Class *)(v31 + 1176));
              objc_msgSend(*(id *)(v32 + 1232), "bundleForClass:", objc_opt_class());
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("ADDRESS_SEPARATOR"), &stru_1E62C0368, CFSTR("Localized"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v45, "initWithString:", v47);
              objc_msgSend(v21, "appendAttributedString:", v48);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v30);
      }

      v19 = (void *)objc_msgSend(v21, "copy");
      v7 = v50;
      v6 = v51;
    }
  }

  return v19;
}

+ (id)_attributedTitleForRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "compositeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isGroup") & 1) == 0 && (!v13 || !objc_msgSend(v13, "length")))
  {
    objc_msgSend(v10, "placeholderName");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  if (objc_msgSend(v10, "isGroup"))
  {
    objc_msgSend(v10, "displayString");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v16 = (void *)v15,
          objc_msgSend(v10, "displayString"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "length"),
          v17,
          v16,
          !v18))
    {
      objc_msgSend(a1, "_attributedStringForGroupMembersOfRecipient:matchedStrings:constrainedToWidth:font:", v10, v11, v12, a5);
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v25 = (void *)v26;
      goto LABEL_14;
    }
  }
  if (objc_msgSend(v10, "kind") != 6 && objc_msgSend(v10, "kind") != 7)
  {
    objc_msgSend(a1, "attributedStringWithBoldedRangesForMatchedStrings:inString:font:boldAllMatches:", v11, v13, v12, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v19 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v12, "fontDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fontDescriptorWithSymbolicTraits:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fontWithDescriptor:size:", v21, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB3778]);
  v28 = *MEMORY[0x1E0DC1138];
  v29[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", v13, v24);

LABEL_14:
  return v25;
}

- (void)updateLabelsContrainedToWidth:(double)a3
{
  uint64_t i;
  CNComposeRecipientTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CNComposeRecipientTableViewCell *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v5 = self;
  v69 = *MEMORY[0x1E0C80C00];
  -[CNComposeTableViewCell recipient](self, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v6, "completelyMatchedAttributedStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v63 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_opt_class();
  -[CNComposeTableViewCell titleLabel](v5, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_attributedTitleForRecipient:matchedStrings:constrainedToWidth:font:", v6, v7, v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeTableViewCell titleLabel](v5, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttributedText:", v16);

  -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v19;
  v57 = v6;
  if (objc_msgSend(v6, "isGroup"))
  {
    objc_msgSend(v6, "children");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v6, "compositeName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend((id)objc_opt_class(), "_attributedStringForGroupMembersOfRecipient:matchedStrings:constrainedToWidth:font:", v6, v7, v19, a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("GROUP_NO_MEMBERS_NAME"), &stru_1E62C0368, CFSTR("Localized"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v30, "initWithString:", v15);

    }
  }
  else
  {
    if (-[CNComposeRecipientTableViewCell shouldHighlightCompleteMatches](v5, "shouldHighlightCompleteMatches"))
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v6, "completelyMatchedAttributedStrings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v24)
      {
        v15 = (void *)v24;
        v54 = v5;
        v25 = *(_QWORD *)v59;
        while (2)
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(_QWORD *)v59 != v25)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j), "attributesAtIndex:effectiveRange:", 0, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKey:", CFSTR("CNComposeRecipientStringMatchType"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("CNComposeRecipientStringMatchAddress"));

            if (!v29)
            {
              i = 0;
              goto LABEL_25;
            }
          }
          v15 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
          if (v15)
            continue;
          break;
        }
        i = 1;
LABEL_25:
        v19 = v56;
        v6 = v57;
        v5 = v54;
      }
      else
      {
        i = 1;
      }

    }
    else
    {
      i = 0;
    }
    if (objc_msgSend(v6, "kind") == 6 || objc_msgSend(v6, "kind") == 7)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("STEWIE_ADDRESS_DETAIL"), &stru_1E62C0368, CFSTR("Localized-Stewie"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v32, "initWithString:", v15);

    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v6, "address");
      v35 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v35;
      if (v35)
        v36 = (const __CFString *)v35;
      else
        v36 = CFSTR("…");
      v23 = (void *)objc_msgSend(v34, "initWithString:", v36);
    }

    if ((_DWORD)i)
    {
      objc_msgSend(v6, "originContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "searchTerm");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v39 = (void *)objc_opt_class();
        objc_msgSend(v6, "originContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "searchTerm");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "string");
        i = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "attributedStringWithBoldedRangesForMatchedStrings:inString:font:boldAllMatches:", v17, i, v19, 0);
        v41 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v41;
      }
    }
  }
  -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v23;
  objc_msgSend(v42, "setAttributedText:", v23);

  -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "text");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "length");
  if (v44)
  {
    -[CNComposeTableViewCell titleLabel](v5, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "text");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v45;
    objc_msgSend(v45, "stringByTrimmingCharactersInSet:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    i = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)i, "stringByTrimmingCharactersInSet:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v46;
    v47 = objc_msgSend(v46, "isEqualToString:", v15);
  }
  else
  {
    v47 = 1;
  }
  -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", v47);

  if (v44)
  {

  }
}

+ (id)attributedStringWithBoldedRangesForMatchedStrings:(id)a3 inString:(id)a4 font:(id)a5 boldAllMatches:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  _QWORD v42[3];

  v6 = a6;
  v42[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v11, "fontDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") & 0xFFFFFFFDLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontWithDescriptor:size:", v15, 0.0);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3778]);
  v18 = *MEMORY[0x1E0DC1138];
  v41 = *MEMORY[0x1E0DC1138];
  v42[0] = v16;
  v31 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v10, v19);

  v21 = (void *)MEMORY[0x1E0DC1350];
  v32 = v11;
  objc_msgSend(v11, "fontDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontWithDescriptor:size:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v27 = objc_msgSend(v10, "rangeOfString:", v26);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (j = v27;
                j != 0x7FFFFFFFFFFFFFFFLL;
                j = objc_msgSend(v10, "rangeOfString:options:range:", v26, 0, j + 1, objc_msgSend(v10, "length") + ~j))
          {
            objc_msgSend(v20, "addAttribute:value:range:", v18, v24, j, v28);
            if (!v6)
              break;
          }
        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v35);
  }

  return v20;
}

- (void)setRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  CNAUIMessagesImagesFacade *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id location;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  objc_super v36;

  v4 = a3;
  objc_msgSend(v4, "autocompleteResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeTableViewCell recipient](self, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autocompleteResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  -[CNComposeTableViewCell recipient](self, "recipient");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 && v11 != v4)
  {
    v36.receiver = self;
    v36.super_class = (Class)CNComposeRecipientTableViewCell;
    -[CNComposeTableViewCell setRecipient:](&v36, sel_setRecipient_, v4);
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTableViewCell setDisplaySessionUUID:](self, "setDisplaySessionUUID:", v31[5]);
    objc_initWeak(&location, self);
    -[CNComposeRecipientTableViewCell delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48__CNComposeRecipientTableViewCell_setRecipient___block_invoke;
    v27[3] = &unk_1E62BFA68;
    objc_copyWeak(&v28, &location);
    v27[4] = &v30;
    v13 = objc_msgSend(v12, "willProvideOverrideImageDataForCell:completionBlock:", self, v27);

    if ((v13 & 1) != 0)
    {
LABEL_13:
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v30, 8);

      goto LABEL_26;
    }
    if (objc_msgSend(v4, "isGroup"))
    {
      v14 = objc_alloc_init(CNAUIMessagesImagesFacade);
      objc_msgSend(v4, "autocompleteResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAUIMessagesImagesFacade imageForResult:](v14, "imageForResult:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_11:
        -[CNComposeRecipientTableViewCell assignImageToController:](self, "assignImageToController:", v16);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      if (objc_msgSend(v4, "kind") != 6)
      {
        if (objc_msgSend(v4, "kind") == 7)
        {
          +[CNAutocompleteAvatarUtilities roadsideImage](CNAutocompleteAvatarUtilities, "roadsideImage");
          v14 = (CNAUIMessagesImagesFacade *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[CNComposeRecipientTableViewCell assignImageToController:](self, "assignImageToController:", v14);
            goto LABEL_12;
          }
        }
        goto LABEL_18;
      }
      -[CNComposeRecipientTableViewCell traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceStyle");
      v19 = CFSTR("SOS_50_light");
      if (v18 == 2)
        v19 = CFSTR("SOS_50_dark");
      v14 = v19;

      v20 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", v14, v21, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_11;
    }

LABEL_18:
    -[CNComposeRecipientTableViewCell assembleContactAvatarsForRecipient:](self, "assembleContactAvatarsForRecipient:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTableViewCell assignContactAvatarsToController:](self, "assignContactAvatarsToController:", v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v30, 8);

  }
  if (v11 == v4
    || ((v10 ^ 1) & 1) != 0
    || (objc_msgSend(v4, "address"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
  {
    objc_msgSend(v4, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = !CNComposeApplicationPreferredContentSizeIsLargerThanLarge();
    else
      v25 = 1;
    -[CNComposeTableViewCell detailLabel](self, "detailLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", v25);

  }
LABEL_26:

}

void __48__CNComposeRecipientTableViewCell_setRecipient___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "displaySessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

  if (v4 == v5)
  {
    if (v8)
    {
      objc_msgSend(WeakRetained, "assignImageDataToController:", v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "recipient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "assembleContactAvatarsForRecipient:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "assignContactAvatarsToController:", v7);

    }
  }

}

- (void)assignImageToController:(id)a3
{
  id v4;

  UIImagePNGRepresentation((UIImage *)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTableViewCell assignImageDataToController:](self, "assignImageDataToController:", v4);

}

- (void)assignImageDataToController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97360];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setImageData:", v5);

  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTableViewCell assignContactAvatarsToController:](self, "assignContactAvatarsToController:", v7);

}

- (void)assignContactAvatarsToController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CGRect v7;

  v4 = a3;
  -[CNComposeRecipientTableViewCell avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContacts:", v4);

  -[CNComposeTableViewCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[CNComposeRecipientTableViewCell updateLabelsContrainedToWidth:](self, "updateLabelsContrainedToWidth:", CGRectGetWidth(v7));

}

- (id)assembleContactAvatarsForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v34 = (id)objc_opt_new();
  if (v3)
  {
    v30 = v3;
    if ((objc_msgSend(v3, "isGroup") & 1) != 0)
    {
      objc_msgSend(v3, "sortedChildren");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_cn_take:", objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v48[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v5;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v42;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
          v8 = (void *)objc_opt_new();
          v9 = (void *)objc_opt_new();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v7, "children");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v7;
          v36 = v6;
          if (objc_msgSend(v10, "count"))
          {
            objc_msgSend(v7, "children");
          }
          else
          {
            v45 = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v38 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v16, "address");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "kind");
                v19 = (void *)MEMORY[0x1E0C97338];
                if (v18)
                {
                  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v17);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "labeledValueWithLabel:value:", 0, v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "addObject:", v21);

                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v17);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "addObject:", v20);
                }

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v13);
          }

          v22 = (void *)objc_opt_new();
          objc_msgSend(v35, "nameComponents");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            v25 = v23;
          }
          else
          {
            v26 = (void *)MEMORY[0x1E0D13AD8];
            objc_msgSend(v35, "compositeName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "componentsFromString:", v27);
            v25 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v25, "overrideComponentsInContact:", v22);
          objc_msgSend(v22, "setEmailAddresses:", v8);
          objc_msgSend(v22, "setPhoneNumbers:", v9);
          objc_msgSend(v34, "addObject:", v22);
          if (!objc_msgSend(v34, "count"))
          {
            v28 = objc_alloc_init(MEMORY[0x1E0C97360]);
            objc_msgSend(v34, "addObject:", v28);

          }
          v6 = v36 + 1;
        }
        while (v36 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v33);
    }

    v3 = v30;
  }

  return v34;
}

- (void)setActionType:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  void *v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  _QWORD v27[5];
  CGAffineTransform v28;
  CGAffineTransform v29;

  v4 = a4;
  self->_actionType = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

  v10 = 0;
  v11 = CFSTR("chevron.forward.circle");
  switch(a3)
  {
    case 1uLL:

      v7 = 0;
      v10 = 0;
      v11 = CFSTR("info.circle");
      goto LABEL_5;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      v10 = 1;
      goto LABEL_5;
    case 4uLL:
      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton", CFSTR("chevron.forward.circle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 0);

      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CEA650];
      -[CNComposeTableViewCell titleLabel](self, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "font");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pointSize");
      objc_msgSend(v14, "configurationWithPointSize:weight:scale:", 6, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreferredSymbolConfiguration:forImageInState:", v17, 0);

      v10 = 0;
      v11 = CFSTR("chevron.forward");
LABEL_5:
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:forState:", v18, 0);

      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setButtonColor:", v7);

      -[CNComposeRecipientTableViewCell updateButtonColor](self, "updateButtonColor");
      v21 = -[CNComposeRecipientTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      memset(&v29, 0, sizeof(v29));
      if (v10)
      {
        CGAffineTransformMakeRotation(&v29, dbl_1B1144D20[v21 == 0]);
        if (!v4)
        {
LABEL_7:
          v26 = v29;
          -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v26;
          objc_msgSend(v22, "setTransform:", &v25);

          goto LABEL_10;
        }
      }
      else
      {
        v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v29.c = v23;
        *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        if (!v4)
          goto LABEL_7;
      }
      v27[1] = 3221225472;
      v28 = v29;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[2] = __58__CNComposeRecipientTableViewCell_setActionType_animated___block_invoke;
      v27[3] = &unk_1E62BFA90;
      v27[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v27, 0);
LABEL_10:

      v9 = 0;
LABEL_11:
      -[CNComposeRecipientTableViewCell actionButton](self, "actionButton", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", v9);

      -[CNComposeTableViewCell layoutMarginsDidChange](self, "layoutMarginsDidChange");
      return;
    default:
      goto LABEL_11;
  }
}

void __58__CNComposeRecipientTableViewCell_setActionType_animated___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "actionButton", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

- (void)updateButtonColor
{
  void *v3;
  void *v4;
  id v5;

  -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)setupAvatarViewControllerWithSettings:(id)a3
{
  objc_class *v4;
  id v5;
  CNAvatarViewController *v6;
  CNAvatarViewController *avatarViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (!self->_avatarViewController)
  {
    v4 = (objc_class *)MEMORY[0x1E0C97470];
    v5 = a3;
    v6 = (CNAvatarViewController *)objc_msgSend([v4 alloc], "initWithSettings:", v5);

    avatarViewController = self->_avatarViewController;
    self->_avatarViewController = v6;

    v8 = (void *)objc_opt_class();
    -[CNAvatarViewController view](self->_avatarViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requireIntrinsicSizeForView:", v9);

    -[NUITableViewContainerCell containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarViewController view](self->_avatarViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertArrangedSubview:atIndex:", v11, 0);

    v12 = objc_msgSend((id)objc_opt_class(), "avatarsAreHidden");
    -[CNAvatarViewController view](self->_avatarViewController, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v12);

  }
}

- (double)trailingButtonWidth
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    -[CNComposeRecipientTableViewCell actionButton](self, "actionButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intrinsicContentSize");
    v4 = v6;

  }
  return v4;
}

- (void)actionButtonTapped
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = -[CNComposeRecipientTableViewCell actionType](self, "actionType");
  -[CNComposeRecipientTableViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    objc_msgSend(v4, "didTapInfoButtonForCell:", self);
  else
    objc_msgSend(v4, "didTapDisambiguationChevronForCell:", self);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[CNComposeRecipientTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[CNComposeRecipientTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCell;
  -[CNComposeRecipientTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (BOOL)supportsAvatarView
{
  return 1;
}

- (BOOL)canExpandRecipient
{
  return -[CNComposeRecipientTableViewCell actionType](self, "actionType") == 2;
}

- (BOOL)canCollapseRecipient
{
  return -[CNComposeRecipientTableViewCell actionType](self, "actionType") == 3;
}

- (CNComposeRecipientTableViewCellDelegate)delegate
{
  return (CNComposeRecipientTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (CNComposeRecipientActionButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
