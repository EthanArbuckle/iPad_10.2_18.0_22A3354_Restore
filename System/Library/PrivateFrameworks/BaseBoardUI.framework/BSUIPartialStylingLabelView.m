@implementation BSUIPartialStylingLabelView

- (BSUIPartialStylingLabelView)initWithTokenType:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = &__block_literal_global_2;
  if (a3 != 1)
    v3 = 0;
  if (a3)
    v4 = v3;
  else
    v4 = &__block_literal_global_1;
  return -[BSUIPartialStylingLabelView initWithRangeFindingBlock:](self, "initWithRangeFindingBlock:", v4);
}

- (BSUIPartialStylingLabelView)initWithRangeFindingBlock:(id)a3
{
  return (BSUIPartialStylingLabelView *)-[BSUIPartialStylingLabelView _initWithFrame:rangeFindingBlock:](self, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (_QWORD)_initWithFrame:(double)a3 rangeFindingBlock:(double)a4
{
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v11 = a2;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)BSUIPartialStylingLabelView;
    v12 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a3, a4, a5, a6);
    a1 = v12;
    if (v12)
    {
      v13 = -[BSUIPartialStylingLabelView _newLabel](v12);
      v14 = (void *)a1[56];
      a1[56] = v13;

      objc_msgSend(a1, "setUserInteractionEnabled:", 0);
      v15 = objc_msgSend(v11, "copy");
      v16 = (void *)a1[52];
      a1[52] = v15;

    }
  }

  return a1;
}

- (void)_newLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "addSubview:", v3);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  return v3;
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_contentLabel, "setTextColor:", a3);
}

- (void)setFont:(id)a3
{
  id v4;

  v4 = a3;
  -[UILabel setFont:](self->_contentLabel, "setFont:");
  -[UILabel setFont:](self->_tokenTypeLabel, "setFont:", v4);

}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *rawText;
  NSAttributedString *rawAttributedText;
  id v7;

  v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    rawText = self->_rawText;
    self->_rawText = v4;

    rawAttributedText = self->_rawAttributedText;
    self->_rawAttributedText = 0;

    -[BSUIPartialStylingLabelView _updateLabelsWithRawText:]((uint64_t)self, self->_rawText);
  }

}

- (void)_updateLabelsWithRawText:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
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
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;

  v3 = a2;
  if (a1)
  {
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    v8 = objc_opt_class();
    v9 = v5;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v7 | v11)
    {
      v12 = *(_QWORD *)(a1 + 416);
      v30 = 0;
      (*(void (**)(void))(v12 + 16))();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (objc_msgSend(v13, "count"))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __56__BSUIPartialStylingLabelView__updateLabelsWithRawText___block_invoke;
        v27[3] = &unk_1E4348FE0;
        v28 = (id)v11;
        v29 = (id)v7;
        v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF63A8](v27);
        v16 = *(void **)(a1 + 448);
        ((void (**)(_QWORD, void *))v15)[2](v15, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAttributedText:", v17);

        v18 = *(void **)(a1 + 424);
        if (!v18)
        {
          v19 = -[BSUIPartialStylingLabelView _newLabel]((void *)a1);
          v20 = *(void **)(a1 + 424);
          *(_QWORD *)(a1 + 424) = v19;

          v21 = *(void **)(a1 + 424);
          objc_msgSend(*(id *)(a1 + 448), "font");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setFont:", v22);

          objc_msgSend(*(id *)(a1 + 424), "setNumberOfLines:", objc_msgSend(*(id *)(a1 + 448), "numberOfLines"));
          objc_msgSend(*(id *)(a1 + 424), "setTextAlignment:", objc_msgSend(*(id *)(a1 + 448), "textAlignment"));
          objc_msgSend(*(id *)(a1 + 424), "setLineBreakMode:", objc_msgSend(*(id *)(a1 + 448), "lineBreakMode"));
          objc_msgSend(*(id *)(a1 + 424), "setAdjustsFontSizeToFitWidth:", objc_msgSend(*(id *)(a1 + 448), "adjustsFontSizeToFitWidth"));
          v18 = *(void **)(a1 + 424);
        }
        ((void (**)(_QWORD, id))v15)[2](v15, v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAttributedText:", v23);

        v24 = v28;
      }
      else
      {
        v26 = *(void **)(a1 + 448);
        if (v7)
          objc_msgSend(v26, "setText:", v7);
        else
          objc_msgSend(v26, "setAttributedText:", v11);
        objc_msgSend(*(id *)(a1 + 424), "removeFromSuperview");
        v24 = *(void **)(a1 + 424);
        *(_QWORD *)(a1 + 424) = 0;
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 448), "setText:", 0);
      objc_msgSend(*(id *)(a1 + 448), "setAttributedText:", 0);
      objc_msgSend(*(id *)(a1 + 424), "removeFromSuperview");
      v25 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = 0;

    }
  }

}

id __49__BSUIPartialStylingLabelView_initWithTokenType___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a2;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    -[NSString _bsui_rangesOfEmojiTokens:](v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_class();
    v11 = v6;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (v13)
    {
      objc_msgSend(v13, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _bsui_rangesOfEmojiTokens:](v14, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id __49__BSUIPartialStylingLabelView_initWithTokenType___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a2;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    v34 = __Block_byref_object_dispose__1;
    if (a3)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;
    v35 = v9;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3010000000;
    v28 = 0;
    v29 = 0;
    v27 = &unk_1A0254B5A;
    v11 = objc_msgSend(v8, "length");
    v12 = *MEMORY[0x1E0CEA050];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__NSAttributedString_BSUIPartialStylingAdditions___bsui_rangesOfTextAttachments___block_invoke;
    v23[3] = &unk_1E4349030;
    v23[4] = &v36;
    v23[5] = &v30;
    v23[6] = &v24;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v23);
    if (v31[5])
    {
      v13 = v25[4];
      v14 = v25[5];
      if (v14 + v13 < (unint64_t)objc_msgSend(v8, "length"))
      {
        v15 = v25[4];
        v16 = v25[5];
        v17 = objc_msgSend(v8, "length");
        v18 = v16 + v15;
        v19 = (void *)v31[5];
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v18, v17 - (v25[4] + v25[5]));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

      }
      v21 = (void *)v31[5];
      if (v21)
        *a3 = objc_retainAutorelease(v21);
    }
    v10 = (id)v37[5];
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BSUIPartialStylingLabelView)initWithFrame:(CGRect)a3
{
  return (BSUIPartialStylingLabelView *)-[BSUIPartialStylingLabelView _initWithFrame:rangeFindingBlock:](self, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIFont)font
{
  return -[UILabel font](self->_contentLabel, "font");
}

- (NSString)text
{
  return self->_rawText;
}

- (NSAttributedString)attributedText
{
  return self->_rawAttributedText;
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *rawAttributedText;
  NSString *rawText;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v7, "copy");
    rawAttributedText = self->_rawAttributedText;
    self->_rawAttributedText = v4;

    rawText = self->_rawText;
    self->_rawText = 0;

    -[BSUIPartialStylingLabelView _updateLabelsWithRawText:]((uint64_t)self, self->_rawAttributedText);
  }

}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_contentLabel, "textColor");
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_contentLabel, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_contentLabel, "setNumberOfLines:");
  -[UILabel setNumberOfLines:](self->_tokenTypeLabel, "setNumberOfLines:", a3);
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  double result;

  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_contentLabel, "_firstLineBaselineOffsetFromBoundsTop");
  return result;
}

- (double)_baselineOffsetFromBottom
{
  double result;

  -[UILabel _baselineOffsetFromBottom](self->_contentLabel, "_baselineOffsetFromBottom");
  return result;
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_contentLabel, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_contentLabel, "setTextAlignment:");
  -[UILabel setTextAlignment:](self->_tokenTypeLabel, "setTextAlignment:", a3);
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_contentLabel, "lineBreakMode");
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_contentLabel, "setLineBreakMode:");
  -[UILabel setLineBreakMode:](self->_tokenTypeLabel, "setLineBreakMode:", a3);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_contentLabel, "adjustsFontSizeToFitWidth");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_contentLabel, "setAdjustsFontSizeToFitWidth:");
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_tokenTypeLabel, "setAdjustsFontSizeToFitWidth:", v3);
}

- (BOOL)_textAlignmentFollowsWritingDirection
{
  return -[UILabel _textAlignmentFollowsWritingDirection](self->_contentLabel, "_textAlignmentFollowsWritingDirection");
}

- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UILabel _setTextAlignmentFollowsWritingDirection:](self->_contentLabel, "_setTextAlignmentFollowsWritingDirection:");
  -[UILabel _setTextAlignmentFollowsWritingDirection:](self->_tokenTypeLabel, "_setTextAlignmentFollowsWritingDirection:", v3);
}

id __56__BSUIPartialStylingLabelView__updateLabelsWithRawText___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = objc_msgSend(v3, "mutableCopy", v16);
  else
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", *(_QWORD *)(a1 + 40), v16);
  v5 = (void *)v4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v17;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = *MEMORY[0x1E0CEA0A0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v23 = v8;
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "rangeValue");
        objc_msgSend(v5, "addAttributes:range:", v12, v13, v14);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  return v5;
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_rawAttributedText, 0);
  objc_storeStrong((id *)&self->_rawText, 0);
  objc_storeStrong((id *)&self->_tokenTypeLabel, 0);
  objc_storeStrong(&self->_rangeFindingBlock, 0);
}

@end
