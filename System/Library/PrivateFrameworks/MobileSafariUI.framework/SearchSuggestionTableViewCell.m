@implementation SearchSuggestionTableViewCell

+ (id)_matchedTextAttributes
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (_matchedTextAttributes_onceToken != -1)
    dispatch_once(&_matchedTextAttributes_onceToken, &__block_literal_global_33);
  v2 = *MEMORY[0x1E0DC1140];
  v6[0] = *MEMORY[0x1E0DC1178];
  v6[1] = v2;
  v7[0] = _matchedTextAttributes_paragraphStyle;
  v7[1] = _matchedTextAttributes_color;
  v6[2] = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)_matchedTextAttributes_font, "_fontAdjustedForCurrentContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __55__SearchSuggestionTableViewCell__matchedTextAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  float v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_matchedTextAttributes_paragraphStyle;
  _matchedTextAttributes_paragraphStyle = v1;

  objc_msgSend((id)_matchedTextAttributes_paragraphStyle, "setLineBreakMode:", 4);
  v3 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E0D4F190]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_labelColorFromNumber:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_matchedTextAttributes_color;
  _matchedTextAttributes_color = v6;

  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E0D4F198]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v8, "_preferredFontForTextStyle:weight:", v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_matchedTextAttributes_font;
  _matchedTextAttributes_font = v12;

}

+ (id)_suggestedTextAttributes
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (_suggestedTextAttributes_onceToken != -1)
    dispatch_once(&_suggestedTextAttributes_onceToken, &__block_literal_global_41);
  v2 = *MEMORY[0x1E0DC1138];
  v6[0] = *MEMORY[0x1E0DC1140];
  v6[1] = v2;
  v7[0] = _suggestedTextAttributes_color;
  objc_msgSend((id)_suggestedTextAttributes_font, "_fontAdjustedForCurrentContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __57__SearchSuggestionTableViewCell__suggestedTextAttributes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  uint64_t v9;
  void *v10;
  id v11;

  v0 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_numberForKey:", *MEMORY[0x1E0D4F268]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safari_labelColorFromNumber:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_suggestedTextAttributes_color;
  _suggestedTextAttributes_color = v3;

  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_numberForKey:", *MEMORY[0x1E0D4F270]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v5, "_preferredFontForTextStyle:weight:", v6, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_suggestedTextAttributes_font;
  _suggestedTextAttributes_font = v9;

}

- (SearchSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SearchSuggestionTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CompletionArrowView *v11;
  CompletionArrowView *completionArrowView;
  void *v13;
  id v14;
  SearchSuggestionTableViewCell *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SearchSuggestionTableViewCell;
  v4 = -[SearchSuggestionTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchSuggestionTableViewCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchSuggestionTableViewCell imageView](v4, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchSuggestionTableViewCell imageView](v4, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredSymbolConfiguration:", v9);

    v11 = objc_alloc_init(CompletionArrowView);
    completionArrowView = v4->_completionArrowView;
    v4->_completionArrowView = v11;

    -[CompletionArrowView setParentCell:](v4->_completionArrowView, "setParentCell:", v4);
    -[CompletionArrowView addTarget:action:forControlEvents:](v4->_completionArrowView, "addTarget:action:forControlEvents:", v4, sel__accessoryButtonTapped_, 0x2000);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isLabelPreviousSearchesInCompletionListEnabled"))
      -[SearchSuggestionTableViewCell setHidesHistoryLastAccessedLabel:](v4, "setHidesHistoryLastAccessedLabel:", 1);
    -[SearchSuggestionTableViewCell setHidesCompletionArrowView:](v4, "setHidesCompletionArrowView:", 1);
    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)-[SearchSuggestionTableViewCell registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v13, v4, sel_preferredContentSizeCategoryDidChange);

    v15 = v4;
  }

  return v4;
}

- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled
{
  return objc_msgSend(MEMORY[0x1E0D89BE8], "isLabelPreviousSearchesInCompletionListEnabled");
}

- (BOOL)hidesImage
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SearchSuggestionTableViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)setHidesImage:(BOOL)a3
{
  void *v5;
  void *v6;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SearchSuggestionTableViewCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  if (!a3)
  -[SearchSuggestionTableViewCell setNeedsDisplay](self, "setNeedsDisplay");
  -[SearchSuggestionTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchSuggestionTableViewCell;
  -[SearchSuggestionTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SearchSuggestionTableViewCell setHidesCompletionArrowView:](self, "setHidesCompletionArrowView:", 1);
  if (-[SearchSuggestionTableViewCell _isLabelPreviousSearchesInCompletionListEnabled](self, "_isLabelPreviousSearchesInCompletionListEnabled"))
  {
    -[SearchSuggestionTableViewCell setHidesHistoryLastAccessedLabel:](self, "setHidesHistoryLastAccessedLabel:", 1);
  }
}

- (void)setHidesCompletionArrowView:(BOOL)a3
{
  CompletionArrowView *completionArrowView;

  if (self->_hidesCompletionArrowView != a3)
  {
    self->_hidesCompletionArrowView = a3;
    if (a3)
    {
      completionArrowView = 0;
    }
    else
    {
      -[CompletionArrowView sizeToFit](self->_completionArrowView, "sizeToFit");
      completionArrowView = self->_completionArrowView;
    }
    -[SearchSuggestionTableViewCell setAccessoryView:](self, "setAccessoryView:", completionArrowView);
  }
}

- (void)setHidesHistoryLastAccessedLabel:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_hidesHistoryLastAccessedLabel != a3)
  {
    self->_hidesHistoryLastAccessedLabel = a3;
    -[SearchSuggestionTableViewCell detailTextLabel](self, "detailTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a3)
      objc_msgSend(v4, "setText:", 0);
    else
      objc_msgSend(v4, "sizeToFit");

  }
}

- (void)setHistoryLastAccessedLabel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = [v4 alloc];
  v13[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForCurrentContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v10);

  -[SearchSuggestionTableViewCell detailTextLabel](self, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v11);

}

- (BOOL)usesDownBackwardCompletionArrow
{
  return -[CompletionArrowView usesDownBackwardCompletionArrow](self->_completionArrowView, "usesDownBackwardCompletionArrow");
}

- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3
{
  -[CompletionArrowView setUsesDownBackwardCompletionArrow:](self->_completionArrowView, "setUsesDownBackwardCompletionArrow:", a3);
}

- (void)setSearchSuggestion:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  SearchSuggestionTableViewCell *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3778]);
  +[SearchSuggestionTableViewCell _matchedTextAttributes](SearchSuggestionTableViewCell, "_matchedTextAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v6, v9);

  if (objc_msgSend(v10, "length"))
  {
    v27 = self;
    +[SearchSuggestionTableViewCell _suggestedTextAttributes](SearchSuggestionTableViewCell, "_suggestedTextAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v10, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rangesToHighlightInSearchSuggestion:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "rangeValue");
          v20 = v19;
          if (v19 + v18 > (unint64_t)objc_msgSend(v10, "length"))
          {
            v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v24 = v21;
              v25 = objc_msgSend(v10, "length");
              v26 = objc_msgSend(v6, "length");
              *(_DWORD *)buf = 134219011;
              v33 = v18;
              v34 = 2048;
              v35 = v20;
              v36 = 2117;
              v37 = v10;
              v38 = 2048;
              v39 = v25;
              v40 = 2048;
              v41 = v26;
              _os_log_error_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_ERROR, "Invalid range(loc=%lu, len=%lu) for attributedString %{sensitive}@ with length=%lu generated from suggestion with length=%lu", buf, 0x34u);

            }
            goto LABEL_13;
          }
          objc_msgSend(v10, "addAttributes:range:", v11, v18, v20);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_13:

    -[SearchSuggestionTableViewCell textLabel](v27, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttributedText:", v10);

  }
  else
  {
    v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SearchSuggestionTableViewCell setSearchSuggestion:withQuery:].cold.1(v23);
  }

}

- (void)preferredContentSizeCategoryDidChange
{
  if (!self->_hidesCompletionArrowView)
  {
    -[SearchSuggestionTableViewCell setHidesCompletionArrowView:](self, "setHidesCompletionArrowView:", 1);
    -[SearchSuggestionTableViewCell setHidesCompletionArrowView:](self, "setHidesCompletionArrowView:", 0);
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)SearchSuggestionTableViewCell;
  -[CompletionListTableViewCell layoutSubviews](&v15, sel_layoutSubviews);
  if ((-[SearchSuggestionTableViewCell _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") & 1) == 0)
  {
    -[SearchSuggestionTableViewCell textLabel](self, "textLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    -[SearchSuggestionTableViewCell layoutManager](self, "layoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchSuggestionTableViewCell frame](self, "frame");
    objc_msgSend(v4, "textRectForCell:rowWidth:forSizing:", self, 0, v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    CGRectGetWidth(v16);
    _SFRoundRectToPixels();
    objc_msgSend(v3, "setFrame:");
    -[SearchSuggestionTableViewCell detailTextLabel](self, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    CGRectGetWidth(v17);
    _SFRoundRectToPixels();
    objc_msgSend(v14, "setFrame:");

  }
}

- (void)_accessoryButtonTapped:(id)a3
{
  void (**accessoryActionHandler)(void);

  accessoryActionHandler = (void (**)(void))self->_accessoryActionHandler;
  if (accessoryActionHandler)
    accessoryActionHandler[2]();
}

- (BOOL)hidesCompletionArrowView
{
  return self->_hidesCompletionArrowView;
}

- (BOOL)hidesHistoryLastAccessedLabel
{
  return self->_hidesHistoryLastAccessedLabel;
}

- (id)accessoryActionHandler
{
  return self->_accessoryActionHandler;
}

- (void)setAccessoryActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessoryActionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryContainerStackView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_completionArrowView, 0);
}

- (void)setSearchSuggestion:(os_log_t)log withQuery:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Attributed string for search suggestion has 0 length", v1, 2u);
}

@end
