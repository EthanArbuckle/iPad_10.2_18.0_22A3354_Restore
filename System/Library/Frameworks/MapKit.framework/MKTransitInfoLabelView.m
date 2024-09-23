@implementation MKTransitInfoLabelView

- (MKTransitInfoLabelView)init
{
  return -[MKTransitInfoLabelView initWithMapItem:](self, "initWithMapItem:", 0);
}

- (MKTransitInfoLabelView)initWithMapItem:(id)a3
{
  return -[MKTransitInfoLabelView initWithMapItem:maxWidth:](self, "initWithMapItem:maxWidth:", a3, -1.0);
}

- (MKTransitInfoLabelView)initWithMapItem:(id)a3 maxWidth:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  MKTransitInfoLabelView *v10;

  objc_msgSend(a3, "_transitInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelItems");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  v10 = -[MKTransitInfoLabelView initWithLabelItems:iconSize:shieldSize:spaceBetweenShields:maxWidth:](self, "initWithLabelItems:iconSize:shieldSize:spaceBetweenShields:maxWidth:", v9, 0x8000000000000000, 0x8000000000000000, 4.0, a4);

  return v10;
}

- (MKTransitInfoLabelView)initWithLabelItems:(id)a3 iconSize:(int64_t)a4 shieldSize:(int64_t)a5 spaceBetweenShields:(double)a6 maxWidth:(double)a7
{
  id v12;
  MKTransitInfoLabelView *v13;
  MKTransitInfoLabelView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id textForTruncationGenerator;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v12 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MKTransitInfoLabelView;
  v13 = -[MKTransitInfoLabelView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v14 = v13;
  if (v13)
  {
    v13->_hasCustomShieldSize = a5 != 0x8000000000000000;
    v13->_hasCustomIconSize = a4 != 0x8000000000000000;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14->_hasCustomShieldSize)
      a5 = objc_msgSend((id)objc_opt_class(), "shieldSizeForContentSizeCategory:", v16);
    if (!v14->_hasCustomIconSize)
      a4 = objc_msgSend((id)objc_opt_class(), "iconSizeForContentSizeCategory:", v16);
    v14->_iconSize = a4;
    v14->_shieldSize = a5;
    v14->_maxWidth = a7;
    v14->_spaceBetweenShields = a6;
    v14->_spaceBetweenIcons = 5.0;
    v17 = objc_msgSend(&__block_literal_global_8, "copy");
    textForTruncationGenerator = v14->_textForTruncationGenerator;
    v14->_textForTruncationGenerator = (id)v17;

    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "smallAttributionFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitInfoLabelView _setFont:custom:](v14, "_setFont:custom:", v20, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v14, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    -[MKTransitInfoLabelView setLabelItems:](v14, "setLabelItems:", v12);
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)MKTransitInfoLabelView;
  -[MKTransitInfoLabelView dealloc](&v4, sel_dealloc);
}

- (void)setMapItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "_transitInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelItems");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  -[MKTransitInfoLabelView setLabelItems:](self, "setLabelItems:", v7);

  -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
}

- (void)setLabelItems:(id)a3
{
  NSArray *v4;
  NSArray *labelItems;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_labelItems, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    labelItems = self->_labelItems;
    self->_labelItems = v4;

    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
  }

}

- (void)setShieldSize:(int64_t)a3
{
  self->_hasCustomShieldSize = 1;
  if (self->_shieldSize != a3)
  {
    self->_shieldSize = a3;
    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
  }
}

- (void)setSpaceBetweenShields:(double)a3
{
  if (a3 >= 0.0 && self->_spaceBetweenShields != a3)
  {
    self->_spaceBetweenShields = a3;
    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
  }
}

- (void)setMaxWidth:(double)a3 textForTruncationGenerator:(id)a4
{
  id v6;
  id textForTruncationGenerator;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v6 = a4;
  textForTruncationGenerator = self->_textForTruncationGenerator;
  v14 = v6;
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    if (textForTruncationGenerator == v6)
    {
LABEL_9:
      -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
      v6 = v14;
      goto LABEL_10;
    }
LABEL_5:
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x18D778DB8](v8);
      v11 = self->_textForTruncationGenerator;
      self->_textForTruncationGenerator = v10;
    }
    else
    {
      v11 = (id)objc_msgSend(&__block_literal_global_8, "copy");
      v12 = (void *)MEMORY[0x18D778DB8]();
      v13 = self->_textForTruncationGenerator;
      self->_textForTruncationGenerator = v12;

    }
    goto LABEL_9;
  }
  if (textForTruncationGenerator != v6)
    goto LABEL_5;
LABEL_10:

}

- (void)_setupLabelInfo
{
  id v3;

  -[MKTransitInfoLabelView _generateText](self, "_generateText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MKTransitInfoLabelView setAttributedText:](self, "setAttributedText:", v3);

}

- (id)_generateText
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *labelItems;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[3];
  char v45;

  if (-[NSArray count](self->_labelItems, "count"))
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitInfoLabelView _stringAttributes](self, "_stringAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    if (MKApplicationLayoutDirectionIsRightToLeft())
      v6 = CFSTR("\u200F");
    else
      v6 = CFSTR("\u200E");
    v39 = (id)objc_msgSend(v5, "initWithString:attributes:", v6, v4);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__4;
    v32[4] = __Block_byref_object_dispose__4;
    v33 = 0;
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_commaListDelimiter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v4);

    -[MKTransitInfoLabelView font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "capHeight");
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    labelItems = self->_labelItems;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __39__MKTransitInfoLabelView__generateText__block_invoke;
    v21[3] = &unk_1E20D8CF0;
    v21[4] = self;
    v15 = v13;
    v22 = v15;
    v26 = v40;
    v27 = v44;
    v28 = v42;
    v31 = v12;
    v16 = v3;
    v23 = v16;
    v29 = &v34;
    v17 = v9;
    v24 = v17;
    v18 = v4;
    v25 = v18;
    v30 = v32;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](labelItems, "enumerateObjectsWithOptions:usingBlock:", 0, v21);
    v19 = (id)v35[5];

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

void __39__MKTransitInfoLabelView__generateText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __39__MKTransitInfoLabelView__generateText__block_invoke_2;
  v25[3] = &unk_1E20D8CC8;
  v8 = *(void **)(a1 + 40);
  v25[4] = *(_QWORD *)(a1 + 32);
  v26 = v8;
  v31 = *(_OWORD *)(a1 + 72);
  v32 = *(_QWORD *)(a1 + 88);
  v9 = v7;
  v27 = v9;
  v35 = *(_QWORD *)(a1 + 112);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 96);
  v28 = v10;
  v33 = v11;
  v29 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 104);
  v30 = v12;
  v34 = v13;
  v36 = a4;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D778DB8](v25);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v15);
          v14[2](v14, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20), a3, 1, v18 + v20);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
        v18 += v20;
      }
      while (v17);
    }

  }
  else
  {
    ((void (**)(_QWORD, id, uint64_t, _QWORD, uint64_t))v14)[2](v14, v9, a3, 0, 0x7FFFFFFFFFFFFFFFLL);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  }

}

void __39__MKTransitInfoLabelView__generateText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  id v9;
  UIImage *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  MKImageTextAttachment *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  MKEmptyTextAttachment *v49;
  BOOL v50;
  MKEmptyTextAttachment *v51;
  id v52;

  v52 = a2;
  if (objc_msgSend(v52, "conformsToProtocol:", &unk_1EE0797A0))
  {
    v9 = v52;
    if (objc_msgSend(v9, "type") == 1 || objc_msgSend(v9, "type") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_imageForLabelItem:", v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "type") == 3)
      {
        v11 = 0;
        v12 = 1;
      }
      else
      {
        objc_msgSend(v9, "labelArtwork");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v13, "artworkSourceType") == 2;

        v11 = 0;
      }
    }
    else
    {
      if (objc_msgSend(v9, "type") == 2)
      {
        objc_msgSend(v9, "labelString");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }
      else
      {
        v12 = 0;
        v11 = 0;
      }
      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v52;
      v10 = 0;
LABEL_37:
      v14 = 0;
LABEL_38:
      if (objc_msgSend(v11, "length") && (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v11) & 1) == 0)
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "appendAttributedString:", *(_QWORD *)(a1 + 64));
        v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, *(_QWORD *)(a1 + 72));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
        if (v22)
          goto LABEL_57;
      }
      goto LABEL_70;
    }
    if (objc_msgSend(v52, "conformsToProtocol:", &unk_1EE036880))
    {
      objc_msgSend(*(id *)(a1 + 32), "_imageForArtworkDataSource:", v52);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v12 = objc_msgSend(v52, "artworkSourceType") == 2;
    }
    else
    {
      if (!objc_msgSend(v52, "conformsToProtocol:", &unk_1EE036AF0))
      {
        v10 = 0;
        v11 = 0;
        goto LABEL_37;
      }
      objc_msgSend(*(id *)(a1 + 32), "_imageForShieldDataSource:", v52);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v11 = 0;
    }
  }
  if (!v10)
    goto LABEL_37;
  UIImagePNGRepresentation(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14) & 1) != 0)
    goto LABEL_38;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = 5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    v16 = 6;
  v17 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
  v50 = v12;
  if (a4)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        v18 = v17 * 0.5;
      else
        v18 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
    }
    else
    {
      v18 = 0.0;
    }
    v23 = 5;
    if (v12)
      v23 = 6;
    v19 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v23]);
    if (a5 + 1 == objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      if (a3 + 1 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 864), "count"))
        v19 = 0.0;
    }
    else
    {
      v19 = v19 * 0.5;
    }
  }
  else
  {
    v19 = 0.0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      v18 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
    else
      v18 = 0.0;
    v20 = 5;
    if (v12)
      v20 = 6;
    v21 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v20]);
    if (a3 + 1 != objc_msgSend(*(id *)(v15 + 864), "count", v17))
      v19 = v21;
  }
  v51 = -[MKEmptyTextAttachment initWithWidth:]([MKEmptyTextAttachment alloc], "initWithWidth:", v18);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:");
  v24 = objc_claimAutoreleasedReturnValue();
  v49 = -[MKEmptyTextAttachment initWithWidth:]([MKEmptyTextAttachment alloc], "initWithWidth:", v19);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage size](v10, "size");
  objc_msgSend(*(id *)(a1 + 32), "maxShieldHeight");
  if (v26 > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "maxShieldHeight");
  UIRoundToViewScale();
  v28 = -[MKImageTextAttachment initWithImage:verticalOffset:]([MKImageTextAttachment alloc], "initWithImage:verticalOffset:", v10, v27);
  objc_msgSend(*(id *)(a1 + 32), "maxShieldHeight");
  if (v29 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "maxShieldHeight");
    -[MKImageTextAttachment setMaxHeight:](v28, "setMaxHeight:");
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v22, "appendAttributedString:", v24);
  objc_msgSend(v22, "appendAttributedString:", v30);
  objc_msgSend(v22, "appendAttributedString:", v25);
  v48 = (void *)v24;
  v31 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAttribute:value:range:", v31, v32, 0, objc_msgSend(v22, "length"));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v50;

  if (v22)
  {
LABEL_57:
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    if (*(double *)(*(_QWORD *)(a1 + 32) + 824) <= 0.0)
    {
      objc_msgSend(v33, "appendAttributedString:", v22);
    }
    else
    {
      objc_msgSend(v33, "size");
      v35 = v34;
      objc_msgSend(v22, "size");
      v37 = v36;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 864), "count");
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 840) + 16))();
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
        v39 = (__CFString *)v38;
      else
        v39 = CFSTR("…");
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v39, *(_QWORD *)(a1 + 72));
      v41 = v40;
      v42 = v35 + v37;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
      {
        v43 = *(double *)(*(_QWORD *)(a1 + 32) + 824);
        objc_msgSend(v40, "size");
        if (v42 > v43 - v44)
        {
          v45 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "mutableCopy");
          v46 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
          v47 = *(void **)(v46 + 40);
          *(_QWORD *)(v46 + 40) = v45;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "appendAttributedString:", v41);
        }
      }
      if (v42 <= *(double *)(*(_QWORD *)(a1 + 32) + 824))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "appendAttributedString:", v22);
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
        **(_BYTE **)(a1 + 128) = 1;
      }

    }
  }
LABEL_70:

}

- (void)setIconSize:(int64_t)a3
{
  self->_hasCustomIconSize = 1;
  if (self->_iconSize != a3)
  {
    self->_iconSize = a3;
    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
  }
}

- (void)setSpaceBetweenIcons:(double)a3
{
  if (a3 >= 0.0 && self->_spaceBetweenIcons != a3)
  {
    self->_spaceBetweenIcons = a3;
    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");
  }
}

- (id)_stringAttributes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MKTransitInfoLabelView font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAttributesForFont:lineBreakMode:", v4, -[MKTransitInfoLabelView lineBreakMode](self, "lineBreakMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_imageForLabelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGContext *CurrentContext;
  CGSize v23;
  CGRect v24;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    objc_msgSend(v4, "labelArtwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitInfoLabelView _imageForArtworkDataSource:](self, "_imageForArtworkDataSource:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = objc_msgSend(v4, "type");

    if (v7 == 3)
    {
      -[MKTransitInfoLabelView font](self, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_mapkit_lineHeight");
      v10 = v9;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nativeScale");
      v12 = 1.0;
      if (v13 > 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nativeScale");
        v12 = v15;

      }
      v16 = 1.0 / v12;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
      v19 = v18;
      v23.width = v16;
      v23.height = v10;
      UIGraphicsBeginImageContextWithOptions(v23, 0, v19);

      objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFill");

      CurrentContext = UIGraphicsGetCurrentContext();
      v24.origin.y = v10 * 0.125;
      v24.size.height = v10 * 0.75;
      v24.origin.x = 0.0;
      v24.size.width = v16;
      CGContextFillRect(CurrentContext, v24);
      UIGraphicsGetImageFromCurrentImageContext();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)_imageForArtworkDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[MKTransitInfoLabelView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "scale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  v12 = objc_msgSend(v4, "artworkSourceType");
  v13 = 3;
  if (v12 == 2)
    v13 = 2;
  v14 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v13]);
  -[MKTransitInfoLabelView artworkCache](self, "artworkCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageForArtwork:size:featureType:scale:nightMode:", v4, v14, 2, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_imageForShieldDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  MKTransitArtwork *v12;
  void *v13;
  MKTransitArtwork *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[MKTransitInfoLabelView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "scale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  v12 = [MKTransitArtwork alloc];
  objc_msgSend(v4, "shieldText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MKTransitArtwork initWithShield:accessibilityText:](v12, "initWithShield:accessibilityText:", v4, v13);

  -[MKTransitInfoLabelView artworkCache](self, "artworkCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageForArtwork:size:featureType:scale:nightMode:", v14, -[MKTransitInfoLabelView shieldSize](self, "shieldSize"), 2, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (MKArtworkDataSourceCache)artworkCache
{
  MKArtworkDataSourceCache *artworkCache;
  MKArtworkDataSourceCache *v4;
  MKArtworkDataSourceCache *v5;

  artworkCache = self->_artworkCache;
  if (!artworkCache)
  {
    +[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance");
    v4 = (MKArtworkDataSourceCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_artworkCache;
    self->_artworkCache = v4;

    artworkCache = self->_artworkCache;
  }
  return artworkCache;
}

+ (id)stringAttributesForFont:(id)a3 lineBreakMode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineSpacing:", 2.0);
  objc_msgSend(v7, "setLineBreakMode:", a4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0CEA0D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CEA098]);

  return v9;
}

- (void)setFont:(id)a3
{
  -[MKTransitInfoLabelView _setFont:custom:](self, "_setFont:custom:", a3, 1);
}

- (void)_setFont:(id)a3 custom:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  if (a4)
    self->_hasCustomFont = 1;
  v5 = a3;
  -[MKTransitInfoLabelView font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoLabelView;
  -[MKTransitInfoLabelView setFont:](&v9, sel_setFont_, v5);

  -[MKTransitInfoLabelView font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");

}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_hasCustomFont)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "smallAttributionFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitInfoLabelView _setFont:custom:](self, "_setFont:custom:", v4, 0);

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_hasCustomShieldSize)
    self->_shieldSize = objc_msgSend((id)objc_opt_class(), "shieldSizeForContentSizeCategory:", v6);
  if (!self->_hasCustomIconSize)
    self->_iconSize = objc_msgSend((id)objc_opt_class(), "iconSizeForContentSizeCategory:", v6);
  -[MKTransitInfoLabelView _setupLabelInfo](self, "_setupLabelInfo");

}

+ (int64_t)shieldSizeForContentSizeCategory:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB400]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3C8]) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3C0]))
  {
    v4 = 6;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

+ (int64_t)iconSizeForContentSizeCategory:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB400]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3C8]) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB3C0]))
  {
    v4 = 6;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (double)spaceBetweenShields
{
  return self->_spaceBetweenShields;
}

- (double)maxShieldHeight
{
  return self->_maxShieldHeight;
}

- (void)setMaxShieldHeight:(double)a3
{
  self->_maxShieldHeight = a3;
}

- (void)setArtworkCache:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);
  objc_storeStrong(&self->_textForTruncationGenerator, 0);
}

@end
