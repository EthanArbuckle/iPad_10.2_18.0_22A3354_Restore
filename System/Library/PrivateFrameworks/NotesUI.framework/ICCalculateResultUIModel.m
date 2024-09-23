@implementation ICCalculateResultUIModel

- (id)labelColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isValidCalculateAttachment") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICControlAccentColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICCalculateResultUIModel;
    -[ICInlineAttachmentUIModel labelColor](&v7, sel_labelColor);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "filteredStyleAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v9, v6);

  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateEqualsSignString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "rangeOfString:", v12);
  v15 = v14;

  v16 = objc_msgSend(v10, "length");
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v35 = v13 + v15;
    v34 = v16 - (v13 + v15);
    v18 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    v23 = (_QWORD *)MEMORY[0x1E0D63D50];
    v24 = *MEMORY[0x1E0D63D50];
    v38[0] = v18;
    v38[1] = v24;
    v39[0] = v22;
    v39[1] = v22;
    v25 = (_QWORD *)MEMORY[0x1E0D63920];
    v38[2] = *MEMORY[0x1E0D63920];
    v26 = objc_retainAutorelease(v22);
    v39[2] = objc_msgSend(v26, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttributes:range:", v27, v13, v15);
    v36[0] = v18;
    -[ICCalculateResultUIModel labelColor](self, "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    v36[1] = *v23;
    -[ICCalculateResultUIModel labelColor](self, "labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    v36[2] = *v25;
    -[ICCalculateResultUIModel labelColor](self, "labelColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37[2] = objc_msgSend(v30, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAttributes:range:", v31, v35, v34);
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_thinSpaceCharacterString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_appendString:", v32);

    v17 = (void *)objc_msgSend(v10, "copy");
  }

  return v17;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger v3;
  _BOOL8 v4;
  NSUInteger v5;
  _NSRange result;

  if (a3.location)
    v3 = a3.location + 3;
  else
    v3 = 2;
  v4 = a3.length > 1 && a3.location == 0;
  v5 = a3.length + v4;
  result.length = v5;
  result.location = v3;
  return result;
}

@end
