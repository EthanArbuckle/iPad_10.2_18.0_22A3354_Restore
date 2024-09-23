@implementation ICTableTextFindingResult

- (ICTableTextFindingResult)init
{
  ICTableTextFindingResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableTextFindingResult;
  result = -[ICTableTextFindingResult init](&v3, sel_init);
  if (result)
  {
    result->_row = 0x7FFFFFFFFFFFFFFFLL;
    result->_column = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICTableTextFindingResult;
  v5 = -[ICTextFindingResult compare:](&v17, sel_compare_, v4);
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = -[ICTableTextFindingResult row](self, "row");
      if (v7 >= objc_msgSend(v6, "row"))
      {
        v8 = -[ICTableTextFindingResult row](self, "row");
        if (v8 > objc_msgSend(v6, "row"))
        {
LABEL_5:
          v5 = 1;
LABEL_11:

          goto LABEL_12;
        }
        v9 = -[ICTableTextFindingResult column](self, "column");
        if (v9 >= objc_msgSend(v6, "column"))
        {
          v10 = -[ICTableTextFindingResult column](self, "column");
          if (v10 > objc_msgSend(v6, "column"))
            goto LABEL_5;
          v11 = -[ICTableTextFindingResult rangeInFindableString](self, "rangeInFindableString");
          if (v11 >= objc_msgSend(v6, "rangeInFindableString"))
          {
            v13 = -[ICTableTextFindingResult rangeInFindableString](self, "rangeInFindableString");
            if (v13 == objc_msgSend(v6, "rangeInFindableString"))
            {
              -[ICTableTextFindingResult inlineTextFindingResult](self, "inlineTextFindingResult");
              v5 = objc_claimAutoreleasedReturnValue();
              if (v5)
              {
                objc_msgSend(v6, "inlineTextFindingResult");
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14)
                {
                  -[ICTableTextFindingResult inlineTextFindingResult](self, "inlineTextFindingResult");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "inlineTextFindingResult");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v5 = objc_msgSend(v15, "compare:", v16);

                }
                else
                {
                  v5 = 0;
                }
              }
              goto LABEL_11;
            }
            goto LABEL_5;
          }
        }
      }
      v5 = -1;
      goto LABEL_11;
    }
    v5 = 0;
  }
LABEL_12:

  return v5;
}

- (id)tableAttachmentViewControllerForTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    objc_msgSend(v4, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = (void *)MEMORY[0x1E0D64D98];
    -[ICTableTextFindingResult attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textAttachmentWithAttachment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "tableViewControllerForAttachment:createIfNeeded:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v4, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v13 = (void *)MEMORY[0x1E0D64D98];
    -[ICTableTextFindingResult attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textAttachmentWithAttachment:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v6 && v10)
    {
      objc_msgSend(v6, "viewControllerForTextAttachment:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICDynamicCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  if (!v11)
  {
    v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ICTableTextFindingResult tableAttachmentViewControllerForTextView:].cold.1(v17);

  }
  return v11;
}

- (id)framesForHighlightInTextView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  void *v53;
  void *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableTextFindingResult tableAttachmentViewControllerForTextView:](self, "tableAttachmentViewControllerForTextView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ICTableTextFindingResult rangeInFindableString](self, "rangeInFindableString");
    v8 = v7;
    -[ICTableTextFindingResult findableString](self, "findableString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForRange:inFindableString:", v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableTextFindingResult inlineTextFindingResult](self, "inlineTextFindingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICTableTextFindingResult inlineTextFindingResult](self, "inlineTextFindingResult", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "framesForHighlightInTextView:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v6 + v8 <= (unint64_t)objc_msgSend(v9, "length", v9))
    {
      objc_msgSend(v5, "rectsForRange:inFindableString:", v6, v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v58 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          -[ICTableTextFindingResult attachment](self, "attachment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "rangeInNote");
          objc_msgSend(v4, "ic_rectForRange:", v22, v23);
          v25 = v24;
          v27 = v26;

          objc_msgSend(v20, "ic_rectValue");
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;
          objc_msgSend(v5, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "convertRect:toCoordinateSpace:", v36, v29, v31, v33, v35);
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;

          v63.origin.x = v38;
          v63.origin.y = v40;
          v63.size.width = v42;
          v63.size.height = v44;
          v64 = CGRectOffset(v63, v25, v27);
          x = v64.origin.x;
          y = v64.origin.y;
          width = v64.size.width;
          height = v64.size.height;
          objc_msgSend(v4, "textContainerInset");
          v50 = v49;
          objc_msgSend(v4, "textContainerInset");
          v52 = v51;
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v66 = CGRectOffset(v65, v50, v52);
          objc_msgSend(MEMORY[0x1E0CB3B18], "ic_valueWithRect:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v53);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v17);
    }

    v14 = (void *)objc_msgSend(v15, "copy");
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (void)selectInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  -[ICTableTextFindingResult tableAttachmentViewControllerForTextView:](self, "tableAttachmentViewControllerForTextView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForColumnAtIndex:", -[ICTableTextFindingResult column](self, "column"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForRowAtIndex:", -[ICTableTextFindingResult row](self, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "textViewManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textViewForColumn:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "columnTextStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "characterRangeForRowID:", v8);

    v13 = -[ICTableTextFindingResult rangeInFindableString](self, "rangeInFindableString") + v12;
    -[ICTableTextFindingResult rangeInFindableString](self, "rangeInFindableString");
    objc_msgSend(v10, "setSelectedRange:", v13, v14);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICTableTextFindingResult;
    -[ICTextFindingResult selectInTextView:](&v15, sel_selectInTextView_, v4);
  }

}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (NSAttributedString)findableString
{
  return self->_findableString;
}

- (void)setFindableString:(id)a3
{
  objc_storeStrong((id *)&self->_findableString, a3);
}

- (_NSRange)rangeInFindableString
{
  _NSRange *p_rangeInFindableString;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeInFindableString = &self->_rangeInFindableString;
  location = self->_rangeInFindableString.location;
  length = p_rangeInFindableString->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInFindableString:(_NSRange)a3
{
  self->_rangeInFindableString = a3;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (unint64_t)column
{
  return self->_column;
}

- (void)setColumn:(unint64_t)a3
{
  self->_column = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (ICInlineTextFindingResult)inlineTextFindingResult
{
  return self->_inlineTextFindingResult;
}

- (void)setInlineTextFindingResult:(id)a3
{
  objc_storeStrong((id *)&self->_inlineTextFindingResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineTextFindingResult, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_findableString, 0);
  objc_destroyWeak((id *)&self->_attachment);
}

- (void)tableAttachmentViewControllerForTextView:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Table attachment view controller not found for finding result", v1, 2u);
}

@end
