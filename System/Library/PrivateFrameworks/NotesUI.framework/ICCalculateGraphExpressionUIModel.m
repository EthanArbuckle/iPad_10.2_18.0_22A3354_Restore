@implementation ICCalculateGraphExpressionUIModel

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
    v7.super_class = (Class)ICCalculateGraphExpressionUIModel;
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
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
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
    v18 = v16 - v13;
    v34[0] = *MEMORY[0x1E0DC1140];
    v19 = v34[0];
    -[ICCalculateGraphExpressionUIModel labelColor](self, "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    v34[1] = *MEMORY[0x1E0D63D50];
    -[ICCalculateGraphExpressionUIModel labelColor](self, "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v21;
    v34[2] = *MEMORY[0x1E0D63920];
    -[ICCalculateGraphExpressionUIModel labelColor](self, "labelColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35[2] = objc_msgSend(v22, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAttributes:range:", v23, 0, v18);
    objc_msgSend(v6, "objectForKeyedSubscript:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;

    v28 = *MEMORY[0x1E0D63D50];
    v32[0] = v19;
    v32[1] = v28;
    v33[0] = v27;
    v33[1] = v27;
    v32[2] = *MEMORY[0x1E0D63920];
    v29 = objc_retainAutorelease(v27);
    v33[2] = objc_msgSend(v29, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttributes:range:", v30, v13, v15);
    v17 = (void *)objc_msgSend(v10, "copy");

  }
  return v17;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  length = 4;
  v4 = a3.length + 3;
  if (a3.length != 2)
    length = a3.length + 3;
  if (a3.length <= 1)
    length = a3.length;
  v5 = a3.location + 3;
  v6 = 4;
  if (a3.length != 2)
    v6 = a3.length + 3;
  if (a3.length <= 1)
    v6 = a3.length;
  if (!a3.location)
  {
    v5 = 1;
    v4 = v6;
  }
  if (a3.location == 1)
    v7 = 3;
  else
    v7 = v5;
  if (a3.location == 1)
    v8 = length;
  else
    v8 = v4;
  result.length = v8;
  result.location = v7;
  return result;
}

@end
