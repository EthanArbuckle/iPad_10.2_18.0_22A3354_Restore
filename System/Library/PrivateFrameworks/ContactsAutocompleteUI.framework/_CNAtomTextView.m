@implementation _CNAtomTextView

+ (id)os_log
{
  if (os_log_cn_once_token_8 != -1)
    dispatch_once(&os_log_cn_once_token_8, &__block_literal_global_688);
  return (id)os_log_cn_once_object_8;
}

- (_CNAtomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  _CNAtomTextView *v4;
  _CNAtomTextView *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNAtomTextView;
  v4 = -[_CNAtomTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)_CNAtomTextView;
    -[_CNAtomTextView undoManager](&v8, sel_undoManager);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableUndoRegistration");

    v5->_textStorageEditingDepth = 0;
    -[_CNAtomTextView setContentInsetAdjustmentBehavior:](v5, "setContentInsetAdjustmentBehavior:", 2);
    -[_CNAtomTextView setClipsToBounds:](v5, "setClipsToBounds:", 0);
  }
  return v5;
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
  v6[2] = __24___CNAtomTextView_atoms__block_invoke;
  v6[3] = &unk_1E62BFE38;
  v4 = v3;
  v7 = v4;
  -[_CNAtomTextView enumerateAtoms:](self, "enumerateAtoms:", v6);

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
  -[_CNAtomTextView textContainerInset](self, "textContainerInset");
  v9 = y + v8;
  -[_CNAtomTextView textContainerInset](self, "textContainerInset");
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
  id v4;
  id v5;

  v4 = a3;
  -[_CNAtomTextView textStorage](self, "textStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", 0, objc_msgSend(v5, "length"), v4);

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
  -[_CNAtomTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60___CNAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke;
  v10[3] = &unk_1E62C0188;
  v11 = v7;
  v9 = v7;
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
  -[_CNAtomTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44___CNAtomTextView_enumerateAtomAttachments___block_invoke;
  v9[3] = &unk_1E62C0188;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);

}

- (BOOL)isEditingTextStorage
{
  return self->_textStorageEditingDepth != 0;
}

- (void)batchTextStorageUpdates:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  ++self->_textStorageEditingDepth;
  v4 = (void (**)(_QWORD))a3;
  -[_CNAtomTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");

  v4[2](v4);
  --self->_textStorageEditingDepth;
  -[_CNAtomTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing");

  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_recomputeTextContainerExclusionPaths");

}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextView;
  v3 = -[_CNAtomTextView becomeFirstResponder](&v8, sel_becomeFirstResponder);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
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
  v8.super_class = (Class)_CNAtomTextView;
  v3 = -[_CNAtomTextView resignFirstResponder](&v8, sel_resignFirstResponder);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
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
  v5 = -[_CNAtomTextView selectedRange](self, "selectedRange");
  v7 = v6;
  -[_CNAtomTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42___CNAtomTextView_selectionRectsForRange___block_invoke;
  v13[3] = &unk_1E62C01B0;
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
  v8.super_class = (Class)_CNAtomTextView;
  -[_CNAtomTextView textStylingAtPosition:inDirection:](&v8, sel_textStylingAtPosition_inDirection_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0DC1100]);

  return v5;
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNAtomTextView;
  -[_CNAtomTextView makeTextWritingDirectionLeftToRight:](&v5, sel_makeTextWritingDirectionLeftToRight_, a3);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atomTextView:didChangeWritingDirection:", self, 0);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNAtomTextView;
  -[_CNAtomTextView makeTextWritingDirectionRightToLeft:](&v5, sel_makeTextWritingDirectionRightToLeft_, a3);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atomTextView:didChangeWritingDirection:", self, 1);

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

  -[_CNAtomTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = (_QWORD *)MEMORY[0x1E0DC1178];
  if (!v4)
    goto LABEL_9;
  if (-[_CNAtomTextView selectedRange](self, "selectedRange") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  -[_CNAtomTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_9:
    -[_CNAtomTextView typingAttributes](self, "typingAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      return -1;
  }
  v10 = objc_msgSend(v8, "baseWritingDirection");

  return v10;
}

- (void)copy:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  __int16 v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[_CNAtomTextView selectedRange](self, "selectedRange", a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNAtomTextView selectedRange](self, "selectedRange");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 < v6 + v8)
    {
      v11 = *MEMORY[0x1E0DC10F8];
      *(_QWORD *)&v10 = 138412290;
      v25 = v10;
      do
      {
        v28 = 0;
        -[_CNAtomTextView textStorage](self, "textStorage", v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "characterAtIndex:", v6);

        v28 = v14;
        if (v14 == 65532)
        {
          if (objc_msgSend(v9, "length"))
          {
            v15 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v5, "addObject:", v15);
            objc_msgSend(v9, "setString:", &stru_1E62C0368);

          }
          -[_CNAtomTextView textStorage](self, "textStorage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "attributesAtIndex:effectiveRange:", v6, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "objectForKey:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "recipient");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "pasteboardString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v20);

              if (objc_msgSend(v19, "supportsPasteboardUnarchiving"))
              {
                objc_msgSend(v19, "addRecipientToPasteboard:", v27);
                objc_msgSend((id)objc_opt_class(), "os_log");
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v25;
                  v30 = v19;
                  _os_log_impl(&dword_1B10FF000, v21, OS_LOG_TYPE_INFO, "Pasteboard archived recipient:%@", buf, 0xCu);
                }

              }
            }
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v17);
        }

        ++v6;
        --v8;
      }
      while (v8);
    }
    if (objc_msgSend(v9, "length"))
    {
      v22 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v5, "addObject:", v22);

    }
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v23);
    objc_msgSend(v27, "addObject:", v24);
    objc_msgSend(v26, "setItemProviders:", v27);

  }
}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  char v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t k;
  void *v41;
  id v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  __int128 buf;
  _BYTE v55[128];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "enabled"))
  {
    v6 = -[_CNAtomTextView isEditable](self, "isEditable");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = CFSTR("kCNPasteboardTypeComposeRecipient");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsPasteboardTypes:inItemSet:", v8, 0);

      if (v9)
      {
        objc_msgSend(v7, "valuesForPasteboardType:inItemSet:", CFSTR("kCNPasteboardTypeComposeRecipient"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v11)
        {
          v12 = v11;
          v41 = v7;
          v42 = v4;
          v13 = 0;
          v14 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v50 != v14)
                objc_enumerationMutation(v10);
              objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "os_log");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1B10FF000, v17, OS_LOG_TYPE_INFO, "Pasteboard recipient:%@", (uint8_t *)&buf, 0xCu);
              }

              if (v16)
              {
                objc_msgSend(v16, "address");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addRecipient:", v16);

                  v13 = 1;
                }
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          }
          while (v12);

          v7 = v41;
          v4 = v42;
          if ((v13 & 1) != 0)
            goto LABEL_48;
        }
        else
        {

        }
      }
      v20 = *MEMORY[0x1E0D137F8];
      objc_msgSend(v7, "itemProviders", v41, v42);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = (*(uint64_t (**)(uint64_t, void *))(v20 + 16))(v20, v21);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v7, "itemProviders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_cn_filter:", &__block_literal_global_712);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addRecipientsFromContactItemProviders:", v23);

LABEL_48:
          goto LABEL_49;
        }

      }
      *(_QWORD *)&buf = (id)*MEMORY[0x1E0CA5C20];
      v25 = (id)*MEMORY[0x1E0CA5C88];
      v26 = 0;
      *((_QWORD *)&buf + 1) = v25;
      v27 = 1;
      do
      {
        v28 = v27;
        objc_msgSend(v7, "valueForPasteboardType:", *(_QWORD *)&v55[8 * v26 - 8]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          break;
        v27 = 0;
        v26 = 1;
      }
      while ((v28 & 1) != 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v29, 4);

        v29 = (void *)v30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
        v31 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v32, "count") > 1)
        {
          -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "delegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v34, "dismissSearchResultsForComposeRecipientView:", v33);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v35 = v32;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v45;
              do
              {
                for (j = 0; j != v37; ++j)
                {
                  if (*(_QWORD *)v45 != v38)
                    objc_enumerationMutation(v35);
                  objc_msgSend(v34, "composeRecipientView:didFinishEnteringAddress:", v33, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
              }
              while (v37);
            }

          }
        }
        else
        {
          v48.receiver = self;
          v48.super_class = (Class)_CNAtomTextView;
          -[_CNAtomTextView paste:](&v48, sel_paste_, v4);
        }

        v29 = (void *)v31;
      }
      else
      {
        v43.receiver = self;
        v43.super_class = (Class)_CNAtomTextView;
        -[_CNAtomTextView paste:](&v43, sel_paste_, v4);
      }

      for (k = 8; k != -8; k -= 8)
      goto LABEL_48;
    }
  }
  else
  {

  }
LABEL_49:

}

- (void)delete:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNAtomTextView selectedRange](self, "selectedRange");
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __26___CNAtomTextView_delete___block_invoke;
  v21[3] = &unk_1E62BFE38;
  v9 = v4;
  v22 = v9;
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](self, "enumerateAtomsInCharacterRange:withBlock:", v5, v7, v21);
  -[_CNAtomTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_CNAtomTextView selectedRange](self, "selectedRange");
  objc_msgSend(v10, "deleteCharactersInRange:", v11, v12);

  -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v16 = v8;
  v17 = 3221225472;
  v18 = __26___CNAtomTextView_delete___block_invoke_2;
  v19 = &unk_1E62C0218;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  objc_msgSend(v9, "_cn_each:", &v16);
  objc_msgSend(v13, "delegate", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_CNAtomTextView text](self, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "composeRecipientView:textDidChange:", v13, v15);

  }
}

- (void)cut:(id)a3
{
  id v4;

  v4 = a3;
  -[_CNAtomTextView copy:](self, "copy:", v4);
  -[_CNAtomTextView delete:](self, "delete:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned __int8 v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_CNAtomTextView;
  v6 = -[_CNAtomTextView canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, a4);
  if (sel_paste_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CA5C20];
    v14[0] = *MEMORY[0x1E0CA5C88];
    v14[1] = v10;
    v14[2] = CFSTR("kCNPasteboardTypeComposeRecipient");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsPasteboardTypes:inItemSet:", v11, 0);

  }
  else
  {
    v7 = v6;
    if (sel_delete_ == a3)
    {
      if (CNComposeIsAppDesignedForVisionOS())
      {
        -[_CNAtomTextView selectedRange](self, "selectedRange");
        return v8 != 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return v7;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
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
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat width;
  CGFloat height;
  float64x2_t v38;
  float64x2_t v39;
  double v40;
  BOOL v41;
  void *v42;
  void *v43;
  double MaxY;
  double MaxX;
  double x;
  double y;
  CGAffineTransform v49;
  CGAffineTransform v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;

  x = a3.x;
  y = a3.y;
  v5 = a4;
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atomContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v51.receiver = self;
  v51.super_class = (Class)_CNAtomTextView;
  -[_CNAtomTextView hitTest:withEvent:](&v51, sel_hitTest_withEvent_, v5, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTest:withEvent:", v5, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  v11 = -[_CNAtomTextView selectedRange](self, "selectedRange");
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    -[_CNAtomTextView textStorage](self, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributesAtIndex:effectiveRange:", v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CNAtomTextView textStorage](self, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributesAtIndex:effectiveRange:", v14 + v13 - 1, 0);
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
            CGAffineTransformMakeTranslation(&v50, 0.0, -6.0);
            v30 = v50.tx + v29 * v50.c + v50.a * v27;
            v31 = v50.ty + v29 * v50.d + v50.b * v27;
            objc_msgSend(v18, "objectForKey:", v19);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "atomView");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "frame");
            v34 = v52.origin.x;
            v35 = v52.origin.y;
            width = v52.size.width;
            height = v52.size.height;
            MaxX = CGRectGetMaxX(v52);
            v53.origin.x = v34;
            v53.origin.y = v35;
            v53.size.width = width;
            v53.size.height = height;
            MaxY = CGRectGetMaxY(v53);
            CGAffineTransformMakeTranslation(&v49, 0.0, 6.0);
            v38.f64[0] = x;
            v38.f64[1] = y;
            v39 = vsubq_f64(vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v49.c, MaxY), *(float64x2_t *)&v49.a, MaxX)), v38);
            v40 = sqrt(vaddvq_f64(vmulq_f64(v39, v39)));
            v41 = sqrt((v30 - x) * (v30 - x) + (v31 - y) * (v31 - y)) <= 14.0 || v40 <= 14.0;
            v23 = v10;
            if (!v41)
            {
              if (v9)
                v42 = v9;
              else
                v42 = v10;
              v23 = v42;

            }
          }
        }
      }
    }

  }
  else
  {
    if (v9)
      v43 = v9;
    else
      v43 = v10;
    v23 = v43;
    v16 = v10;
  }

  return v23;
}

- (id)keyCommands
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30___CNAtomTextView_keyCommands__block_invoke;
  block[3] = &unk_1E62BF258;
  block[4] = self;
  if (keyCommands_onceToken != -1)
    dispatch_once(&keyCommands_onceToken, block);
  return (id)keyCommands_keyCommands;
}

- (void)upArrowPressed
{
  -[_CNAtomTextView notifyDelegateWithVoidSelector:](self, "notifyDelegateWithVoidSelector:", sel_selectPreviousSearchResultForComposeRecipientView_);
}

- (void)downArrowPressed
{
  BOOL v3;
  void *v4;
  id v5;

  v3 = -[_CNAtomTextView notifyDelegateWithVoidSelector:](self, "notifyDelegateWithVoidSelector:", sel_selectNextSearchResultForComposeRecipientView_);
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentSearchResultsForComposeRecipientView:", v5);

}

- (void)leftArrowPressed
{
  uint64_t v3;
  char **v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  v3 = -[_CNAtomTextView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &selRef_collapseSelectedSearchResultForComposeRecipientView_;
  if (v3)
    v4 = &selRef_expandSelectedSearchResultForComposeRecipientView_;
  if (!-[_CNAtomTextView notifyDelegateWithBooleanSelector:](self, "notifyDelegateWithBooleanSelector:", *v4))
  {
    v5 = -[_CNAtomTextView selectedRange](self, "selectedRange");
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    v8 = !v7;
    -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", v5 - v8, 0);
  }
}

- (void)rightArrowPressed
{
  uint64_t v3;
  char **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_CNAtomTextView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &selRef_expandSelectedSearchResultForComposeRecipientView_;
  if (v3)
    v4 = &selRef_collapseSelectedSearchResultForComposeRecipientView_;
  if (!-[_CNAtomTextView notifyDelegateWithBooleanSelector:](self, "notifyDelegateWithBooleanSelector:", *v4))
  {
    v5 = -[_CNAtomTextView selectedRange](self, "selectedRange");
    if (v6)
      v7 = v5 + v6;
    else
      v7 = v5 + 1;
    -[_CNAtomTextView setSelectedRange:](self, "setSelectedRange:", v7, 0);
  }
}

- (void)returnPressed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  char *v12;
  id v13;

  if (-[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults"))
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "chooseSelectedSearchResultForComposeRecipientView:context:", v8, 2);

      if ((v9 & 1) == 0)
      {
        -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "finishEnteringRecipient");

      }
      return;
    }
    v12 = sel_chooseSelectedSearchResultForComposeRecipientView_;
LABEL_10:
    -[_CNAtomTextView notifyDelegateWithVoidSelector:](self, "notifyDelegateWithVoidSelector:", v12);
    return;
  }
  if (-[_CNAtomTextView hostRecipientViewHasSearchTextOrTokensAndNoSearchResults](self, "hostRecipientViewHasSearchTextOrTokensAndNoSearchResults"))
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "finishEnteringRecipient");

    if ((v11 & 1) == 0)
    {
      v12 = sel_composeRecipientViewReturnPressed_;
      goto LABEL_10;
    }
  }
}

- (void)tabPressed
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  char *v11;
  void *v12;
  void *v13;
  char v14;
  _CNAtomTextView *v15;
  id v16;

  v3 = -[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults");
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chooseSelectedSearchResultForComposeRecipientView:context:", v9, 1);

      return;
    }
    v11 = sel_chooseSelectedSearchResultForComposeRecipientView_;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v4, "finishEnteringRecipient");

  if ((v10 & 1) == 0)
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = self;
      v11 = sel_composeRecipientViewTabPressed_;
LABEL_11:
      -[_CNAtomTextView notifyDelegateWithVoidSelector:](v15, "notifyDelegateWithVoidSelector:", v11);
      return;
    }
    v11 = sel_composeRecipientViewReturnPressed_;
LABEL_10:
    v15 = self;
    goto LABEL_11;
  }
}

- (void)commaPressed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  if (-[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults"))
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "chooseSelectedSearchResultForComposeRecipientView:context:", v8, 3);

      if ((v9 & 1) == 0)
      {
LABEL_4:
        -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "finishEnteringRecipient");

      }
    }
    else
    {
      -[_CNAtomTextView notifyDelegateWithVoidSelector:](self, "notifyDelegateWithVoidSelector:", sel_chooseSelectedSearchResultForComposeRecipientView_);
    }
  }
  else if (-[_CNAtomTextView hostRecipientViewHasSearchTextOrTokensAndNoSearchResults](self, "hostRecipientViewHasSearchTextOrTokensAndNoSearchResults"))
  {
    goto LABEL_4;
  }
}

- (void)escKeyPressed
{
  void *v3;
  void *v4;
  id v5;

  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissSearchResultsForComposeRecipientView:", v4);
  }
  else
  {
    -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearText");
  }

}

- (BOOL)notifyDelegateWithVoidSelector:(SEL)a3
{
  return -[_CNAtomTextView notifyDelegateWithSelector:checkReturnValue:](self, "notifyDelegateWithSelector:checkReturnValue:", a3, 0);
}

- (BOOL)notifyDelegateWithBooleanSelector:(SEL)a3
{
  return -[_CNAtomTextView notifyDelegateWithSelector:checkReturnValue:](self, "notifyDelegateWithSelector:checkReturnValue:", a3, 1);
}

- (BOOL)notifyDelegateWithSelector:(SEL)a3 checkReturnValue:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  char v15;

  v4 = a4;
  v15 = 0;
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults")
     || (sel_composeRecipientViewReturnPressed_ != a3 ? (v8 = sel_composeRecipientViewTabPressed_ == a3) : (v8 = 1), v8))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSelector:", a3);
    objc_msgSend(v11, "setTarget:", v7);
    objc_msgSend(v11, "setArgument:atIndex:", &v14, 2);
    objc_msgSend(v11, "invoke");
    if (v4)
      objc_msgSend(v11, "getReturnValue:", &v15);

    v12 = v15 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)hostRecipientViewHasSearchResults
{
  void *v2;
  void *v3;
  char v4;

  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "composeRecipientViewShowingSearchResults:", v2);
  else
    v4 = 0;

  return v4;
}

- (BOOL)hostRecipientViewHasSearchTextOrTokensAndNoSearchResults
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[_CNAtomTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults"))
    return 0;
  -[_CNAtomTextView hostRecipientView](self, "hostRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v3 = 1;
  }
  else
  {
    -[_CNAtomTextView atoms](self, "atoms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "count") != 0;

  }
  return v3;
}

- (CNComposeRecipientTextView)hostRecipientView
{
  return (CNComposeRecipientTextView *)objc_loadWeakRetained((id *)&self->_hostRecipientView);
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
