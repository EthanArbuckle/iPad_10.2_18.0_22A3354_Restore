@implementation _MFAtomTextView

- (_MFAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _MFAtomTextView *v10;
  _MFAtomTextView *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MFAtomTextView;
  v10 = -[_MFAtomTextView initWithFrame:textContainer:](&v15, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v14.receiver = v10;
    v14.super_class = (Class)_MFAtomTextView;
    -[_MFAtomTextView undoManager](&v14, sel_undoManager);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disableUndoRegistration");

    v11->_textStorageEditingDepth = 0;
  }

  return v11;
}

- (NSArray)atoms
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24___MFAtomTextView_atoms__block_invoke;
  v6[3] = &unk_1E5A66030;
  v4 = v3;
  v7 = v4;
  -[_MFAtomTextView enumerateAtoms:](self, "enumerateAtoms:", v6);

  return (NSArray *)v4;
}

- (CGRect)convertGlyphRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_MFAtomTextView textContainerInset](self, "textContainerInset");
  v9 = y + v8;
  -[_MFAtomTextView textContainerInset](self, "textContainerInset");
  v11 = x + v10;
  v12 = v9;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)enumerateAtoms:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", 0, objc_msgSend(v4, "length"), v5);

}

- (void)enumerateAtomsInCharacterRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60___MFAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke;
  v10[3] = &unk_1E5A66338;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v10);

}

- (void)enumerateAtomAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44___MFAtomTextView_enumerateAtomAttachments___block_invoke;
  v9[3] = &unk_1E5A66338;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);

}

- (BOOL)isEditingTextStorage
{
  return self->_textStorageEditingDepth != 0;
}

- (void)batchTextStorageUpdates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  ++self->_textStorageEditingDepth;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEditing");

  v7[2]();
  --self->_textStorageEditingDepth;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing");

  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_recomputeTextContainerExclusionPaths");

}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextView;
  v3 = -[_MFAtomTextView becomeFirstResponder](&v8, sel_becomeFirstResponder);
  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4 != 0)
    objc_msgSend(v4, "atomTextViewDidBecomeFirstResponder:", self);

  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextView;
  v3 = -[_MFAtomTextView resignFirstResponder](&v8, sel_resignFirstResponder);
  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4 != 0)
    objc_msgSend(v4, "atomTextViewDidResignFirstResponder:", self);

  return v3;
}

- (id)selectionRectsForRange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_MFAtomTextView selectedRange](self, "selectedRange");
  v7 = v6;
  -[_MFAtomTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42___MFAtomTextView_selectionRectsForRange___block_invoke;
  v13[3] = &unk_1E5A66360;
  v15 = v5;
  v16 = v7;
  v13[4] = self;
  v9 = v4;
  v14 = v9;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", v5, v7, 0, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextView;
  -[_MFAtomTextView textStylingAtPosition:inDirection:](&v8, sel_textStylingAtPosition_inDirection_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0DC1100]);

  return v5;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    v6.receiver = self;
    v6.super_class = (Class)_MFAtomTextView;
    -[_MFAtomTextView setContentOffset:](&v6, sel_setContentOffset_, x, y);
  }
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MFAtomTextView;
  -[_MFAtomTextView makeTextWritingDirectionLeftToRight:](&v6, sel_makeTextWritingDirectionLeftToRight_, v4);
  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atomTextView:didChangeWritingDirection:", self, 0);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MFAtomTextView;
  -[_MFAtomTextView makeTextWritingDirectionRightToLeft:](&v6, sel_makeTextWritingDirectionRightToLeft_, v4);
  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atomTextView:didChangeWritingDirection:", self, 1);

}

- (int64_t)baseWritingDirection
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[_MFAtomTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = (_QWORD *)MEMORY[0x1E0DC1178];
  if (v4)
  {
    if (-[_MFAtomTextView selectedRange](self, "selectedRange") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_MFAtomTextView textStorage](self, "textStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributesAtIndex:effectiveRange:", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKey:", *v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_5;
    }
  }
  -[_MFAtomTextView typingAttributes](self, "typingAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
LABEL_5:
    v10 = objc_msgSend(v8, "baseWritingDirection");
  else
    v10 = -1;

  return v10;
}

- (void)copy:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
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
  __int16 v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[_MFAtomTextView selectedRange](self, "selectedRange", a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_MFAtomTextView selectedRange](self, "selectedRange");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 < v5 + v7)
    {
      v9 = *MEMORY[0x1E0DC10F8];
      do
      {
        v28 = -21846;
        -[_MFAtomTextView textStorage](self, "textStorage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "characterAtIndex:", v5);

        v28 = v12;
        if (v12 == 65532)
        {
          if (objc_msgSend(v8, "length"))
          {
            v13 = (void *)objc_msgSend(v8, "copy");
            objc_msgSend(v27, "addObject:", v13);
            objc_msgSend(v8, "setString:", &stru_1E5A6A588);

          }
          -[_MFAtomTextView textStorage](self, "textStorage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributesAtIndex:effectiveRange:", v5, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "recipient");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "uncommentedAddress");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v18);

              objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = CFSTR("kMFPasteboardTypeComposeRecipient");
              v32[0] = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v20);

            }
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v15);
        }

        ++v5;
        --v7;
      }
      while (v7);
    }
    if (objc_msgSend(v8, "length"))
    {
      v21 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v27, "addObject:", v21);

    }
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23;
    v30 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v24);

    objc_msgSend(v25, "setItems:", v26);
  }
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t k;
  id v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  unint64_t v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = CFSTR("kMFPasteboardTypeComposeRecipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsPasteboardTypes:inItemSet:", v5, 0);

  if (v6)
  {
    objc_msgSend(v4, "valuesForPasteboardType:inItemSet:", CFSTR("kMFPasteboardTypeComposeRecipient"), 0);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addRecipient:", v11);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v8);
    }

  }
  else
  {
    v40 = 0xAAAAAAAAAAAAAAAALL;
    v41 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v41 = v13;
    v15 = 1;
    do
    {
      objc_msgSend(v4, "valueForPasteboardType:", *(&v40 + v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (v16 == 0) & v15;
      v14 = 1;
      v15 = 0;
    }
    while ((v17 & 1) != 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);

      v16 = (void *)v18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v20, "count") > 1)
      {
        -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "dismissSearchResultsForComposeRecipientView:", v21);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v23 = v20;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v31 != v25)
                  objc_enumerationMutation(v23);
                objc_msgSend(v22, "composeRecipientView:didFinishEnteringAddress:", v21, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v24);
          }

        }
      }
      else
      {
        v34.receiver = self;
        v34.super_class = (Class)_MFAtomTextView;
        -[_MFAtomTextView paste:](&v34, sel_paste_, v28);
      }

      v16 = (void *)v19;
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)_MFAtomTextView;
      -[_MFAtomTextView paste:](&v29, sel_paste_, v28);
    }

    for (k = 8; k != -8; k -= 8)
  }

}

- (void)cut:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[_MFAtomTextView copy:](self, "copy:");
  -[_MFAtomTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_MFAtomTextView selectedRange](self, "selectedRange");
  objc_msgSend(v4, "deleteCharactersInRange:", v5, v6);

  -[_MFAtomTextView setSelectedRange:](self, "setSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (sel_paste_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    v14[2] = CFSTR("kMFPasteboardTypeComposeRecipient");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsPasteboardTypes:inItemSet:", v11, 0);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_MFAtomTextView;
    v7 = -[_MFAtomTextView canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double b;
  CGFloat d;
  double ty;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat width;
  CGFloat height;
  float64x2_t v39;
  float64x2_t v40;
  double v41;
  BOOL v42;
  void *v43;
  void *v44;
  double MaxY;
  double MaxX;
  double v48;
  double c;
  double tx;
  double a;
  void *v52;
  double x;
  double y;
  CGAffineTransform v55;
  CGAffineTransform v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;

  x = a3.x;
  y = a3.y;
  v5 = a4;
  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atomContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v57.receiver = self;
  v57.super_class = (Class)_MFAtomTextView;
  -[_MFAtomTextView hitTest:withEvent:](&v57, sel_hitTest_withEvent_, v5, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTest:withEvent:", v5, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = -[_MFAtomTextView selectedRange](self, "selectedRange");
  v13 = v12;
  if (v12)
  {
    v14 = v11;
    v52 = v7;
    -[_MFAtomTextView textStorage](self, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributesAtIndex:effectiveRange:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MFAtomTextView textStorage](self, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributesAtIndex:effectiveRange:", v13 + v14 - 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0DC10F8];
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0DC10F8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = v10;
    if (v20)
    {
      v23 = v10;
      if (v21)
      {
        objc_opt_class();
        v23 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v23 = v10;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "objectForKey:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "atomView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "frame");
            v27 = v26;
            v29 = v28;
            CGAffineTransformMakeTranslation(&v56, 0.0, -6.0);
            b = v56.b;
            d = v56.d;
            c = v56.c;
            ty = v56.ty;
            tx = v56.tx;
            a = v56.a;
            objc_msgSend(v18, "objectForKey:", v19);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = d;
            objc_msgSend(v33, "atomView");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "frame");
            v35 = v58.origin.x;
            v36 = v58.origin.y;
            width = v58.size.width;
            height = v58.size.height;
            MaxX = CGRectGetMaxX(v58);
            v59.origin.x = v35;
            v59.origin.y = v36;
            v59.size.width = width;
            v59.size.height = height;
            MaxY = CGRectGetMaxY(v59);
            CGAffineTransformMakeTranslation(&v55, 0.0, 6.0);
            v39.f64[0] = x;
            v39.f64[1] = y;
            v40 = vsubq_f64(vaddq_f64(*(float64x2_t *)&v55.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v55.c, MaxY), *(float64x2_t *)&v55.a, MaxX)), v39);
            v41 = sqrt(vaddvq_f64(vmulq_f64(v40, v40)));
            v42 = sqrt((tx + v29 * c + a * v27 - x) * (tx + v29 * c + a * v27 - x)+ (ty + v29 * v48 + b * v27 - y) * (ty + v29 * v48 + b * v27 - y)) <= 14.0|| v41 <= 14.0;
            v23 = v10;
            if (!v42)
            {
              if (v9)
                v43 = v9;
              else
                v43 = v10;
              v23 = v43;

            }
          }
        }
      }
    }

    v7 = v52;
  }
  else
  {
    if (v9)
      v44 = v9;
    else
      v44 = v10;
    v23 = v44;
    v16 = v10;
  }

  return v23;
}

- (BOOL)_delegateSupportsKeyboardEvents
{
  void *v2;
  void *v3;
  char v4;

  -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  if (-[_MFAtomTextView _delegateSupportsKeyboardEvents](self, "_delegateSupportsKeyboardEvents"))
  {
    -[_MFAtomTextView hostRecipientView](self, "hostRecipientView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 4)
    {
      objc_msgSend(v4, "_modifiedInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = (void *)*MEMORY[0x1E0DC4D90];
      if (v7 == (void *)*MEMORY[0x1E0DC4D90] || v7 == (void *)*MEMORY[0x1E0DC4E30])
      {
        if (objc_msgSend(v6, "composeRecipientViewShowingSearchResults:", v5))
        {
          if ((objc_msgSend(v4, "_isKeyDown") & 1) == 0)
          {
            if (v8 == v9)
              objc_msgSend(v6, "selectNextSearchResultForComposeRecipientView:", v5);
            else
              objc_msgSend(v6, "selectPreviousSearchResultForComposeRecipientView:", v5);
          }
          goto LABEL_29;
        }
        if (v8 == v9
          && objc_msgSend(v4, "_isKeyDown")
          && (objc_msgSend(v6, "presentSearchResultsForComposeRecipientView:", v5) & 1) != 0)
        {
LABEL_29:

          goto LABEL_26;
        }
      }
      else if (objc_msgSend(v7, "length") == 1
             && (objc_msgSend(v8, "characterAtIndex:", 0) == 13
              || objc_msgSend(v8, "characterAtIndex:", 0) == 9)
             && objc_msgSend(v6, "composeRecipientViewShowingSearchResults:", v5)
             && objc_msgSend(v6, "chooseSelectedSearchResultForComposeRecipientView:", v5))
      {
        if (objc_msgSend(v8, "characterAtIndex:", 0) == 9 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "composeRecipientViewReturnPressed:", v5);
        goto LABEL_29;
      }

    }
    v11.receiver = self;
    v11.super_class = (Class)_MFAtomTextView;
    -[_MFAtomTextView _handleKeyUIEvent:](&v11, sel__handleKeyUIEvent_, v4);
LABEL_26:

    goto LABEL_27;
  }
  v12.receiver = self;
  v12.super_class = (Class)_MFAtomTextView;
  -[_MFAtomTextView _handleKeyUIEvent:](&v12, sel__handleKeyUIEvent_, v4);
LABEL_27:

}

- (MFComposeRecipientTextView)hostRecipientView
{
  return (MFComposeRecipientTextView *)objc_loadWeakRetained((id *)&self->_hostRecipientView);
}

- (void)setHostRecipientView:(id)a3
{
  objc_storeWeak((id *)&self->_hostRecipientView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostRecipientView);
}

@end
