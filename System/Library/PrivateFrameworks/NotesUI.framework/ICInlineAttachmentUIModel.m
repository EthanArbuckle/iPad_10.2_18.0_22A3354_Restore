@implementation ICInlineAttachmentUIModel

- (ICInlineAttachmentUIModel)initWithAttachment:(id)a3
{
  id v4;
  ICInlineAttachmentUIModel *v5;
  ICInlineAttachmentUIModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICInlineAttachmentUIModel;
  v5 = -[ICInlineAttachmentUIModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_attachment, v4);

  return v6;
}

- (UIColor)labelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "ICUnknownInlineAttachmentTextColor");
}

+ (id)attributesForInlineAttachmentUIModel
{
  if (attributesForInlineAttachmentUIModel_onceToken != -1)
    dispatch_once(&attributesForInlineAttachmentUIModel_onceToken, &__block_literal_global_85);
  return (id)attributesForInlineAttachmentUIModel_attributes;
}

void __65__ICInlineAttachmentUIModel_attributesForInlineAttachmentUIModel__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D63C70], "allowedAttributesForModel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeObject:", *MEMORY[0x1E0D63950]);
  v2 = *MEMORY[0x1E0DC1140];
  v7[0] = *MEMORY[0x1E0DC1138];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0DC11A8];
  v7[2] = *MEMORY[0x1E0DC1248];
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v4);

  v5 = objc_msgSend(v1, "copy");
  v6 = (void *)attributesForInlineAttachmentUIModel_attributes;
  attributesForInlineAttachmentUIModel_attributes = v5;

}

+ (id)filteredStyleAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "attributesForInlineAttachmentUIModel", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x1E0DC1160];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(v12, "isEqualToString:", v10);

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v12);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  void (**v6)(id, id, uint64_t);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;

  v6 = (void (**)(id, id, uint64_t))a4;
  v7 = a3;
  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayText");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E5C2F8C0;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  if (v6)
  {
    -[ICInlineAttachmentUIModel attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12, objc_msgSend(v13, "attachmentType"));
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v14;
  }
  -[ICInlineAttachmentUIModel labelColor](self, "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "filteredStyleAttributes:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC1140]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D63D50]);
  v18 = objc_retainAutorelease(v15);
  v19 = objc_msgSend(v18, "CGColor");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D63920]);
  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  v21 = (void *)objc_msgSend(v17, "copy");
  v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v12, v21);

  return v22;
}

- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, uint64_t);
  void *v27;
  ICInlineAttachmentUIModel *v28;
  id v29;
  double v30;
  double v31;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v14 = fmin(v11 * 0.6 + 1.0, 1.0);
  }
  else if (v13)
  {
    objc_msgSend(v13, "alphaComponent");
    v14 = v15;
  }
  else
  {
    v14 = 1.0;
  }
  v16 = (void *)objc_msgSend(v6, "mutableCopy");
  v17 = *MEMORY[0x1E0D63D50];
  v18 = objc_msgSend(v16, "ic_range");
  v20 = v19;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __84__ICInlineAttachmentUIModel_highlightingAttributedString_withSurroundingAttributes___block_invoke;
  v27 = &unk_1E5C23D00;
  v30 = v11;
  v31 = v14;
  v28 = self;
  v29 = v16;
  v21 = v16;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v20, 0, &v24);
  v22 = (void *)objc_msgSend(v21, "copy", v24, v25, v26, v27, v28);

  return v22;
}

void __84__ICInlineAttachmentUIModel_highlightingAttributedString_withSurroundingAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v7 = a2;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*(double *)(a1 + 48) != 0.0)
  {
    v20 = v7;
    if (objc_msgSend(*(id *)(a1 + 32), "fadesColorDuringHighlight"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 == v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
        v9 = objc_claimAutoreleasedReturnValue();

        v20 = (id)v9;
      }

      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_colorBlendedWithColor:fraction:", v10, fabs(*(double *)(a1 + 48)));
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v11;
    }
    else
    {
      v7 = v20;
    }
  }
  v21 = v7;
  if (*(double *)(a1 + 56) < 1.0)
  {
    objc_msgSend(v7, "alphaComponent");
    objc_msgSend(v21, "colorWithAlphaComponent:", v12 * *(double *)(a1 + 56));
    v13 = objc_claimAutoreleasedReturnValue();

    v21 = (id)v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63908], a3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (v15)
  {
    v16 = (void *)v15;
    v17 = *(void **)(a1 + 40);
    v18 = *MEMORY[0x1E0DC1140];
    ICColorForEmphasisColorType(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v18, v19, a3, a4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v21, a3, a4);
  }

}

- (id)highlightingAttributedString:(id)a3 withRegexMatches:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "ICFindInNoteHighlightColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:attributeName:", v6, v8, *MEMORY[0x1E0DC1100]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)fadesColorDuringHighlight
{
  return 1;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (ICInlineAttachment)attachment
{
  return (ICInlineAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);
}

@end
