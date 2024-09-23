@implementation CKMentionsController

- (CKMentionsController)initWithEntryTextView:(id)a3 conversation:(id)a4
{
  id v7;
  id v8;
  CKMentionsController *v9;
  CKMentionsController *v10;
  void *v11;
  int v12;
  CKMentionsAnimationController *v13;
  void *v14;
  uint64_t v15;
  CKMentionsAnimationController *mentionsAnimationController;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKMentionsController;
  v9 = -[CKMentionsController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textView, a3);
    objc_storeStrong((id *)&v10->_conversation, a4);
    objc_msgSend(v7, "setMentionsDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isTextKit2Enabled");

    if (v12)
    {
      v13 = [CKMentionsAnimationController alloc];
      -[CKMentionsController textView](v10, "textView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CKMentionsAnimationController initWithEntryTextView:](v13, "initWithEntryTextView:", v14);
      mentionsAnimationController = v10->_mentionsAnimationController;
      v10->_mentionsAnimationController = (CKMentionsAnimationController *)v15;

      -[CKMentionsAnimationController setDelegate:](v10->_mentionsAnimationController, "setDelegate:", v10);
    }
  }

  return v10;
}

- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4
{
  id v5;
  id v6;
  void *v8;
  unint64_t v9;

  v5 = a3;
  -[CKMentionsController mentionSuggestionView](self, "mentionSuggestionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 0;
  -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a3;
  -[CKMentionsController mentionSuggestionView](self, "mentionSuggestionView");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {
    -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)v7;
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (id)suggestionView:(id)a3 indexPathOfEntityWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__34;
  v19 = __Block_byref_object_dispose__34;
  v20 = 0;
  -[CKMentionsController mentionSuggestionView](self, "mentionSuggestionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__CKMentionsController_suggestionView_indexPathOfEntityWithIdentifier___block_invoke;
    v12[3] = &unk_1E2750AA0;
    v13 = v7;
    v14 = &v15;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __71__CKMentionsController_suggestionView_indexPathOfEntityWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a2, "defaultIMHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)suggestionView:(id)a3 didSelectEntity:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CKMentionsController didSelectEntityCompletionHandler](self, "didSelectEntityCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMentionsController didSelectEntityCompletionHandler](self, "didSelectEntityCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[CKMentionsController setDidSelectEntityCompletionHandler:](self, "setDidSelectEntityCompletionHandler:", 0);
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
  else
  {
    -[CKMentionsController suggestionViewDidSelectEntity:](self, "suggestionViewDidSelectEntity:", v7);
  }

}

- (CKMentionSuggestionView)mentionSuggestionView
{
  CKMentionSuggestionView *v3;
  CKMentionSuggestionView *mentionSuggestionView;
  void *v5;

  if (!self->_mentionSuggestionView
    && -[CKMentionsController shouldShowMentionSuggestions](self, "shouldShowMentionSuggestions"))
  {
    v3 = objc_alloc_init(CKMentionSuggestionView);
    mentionSuggestionView = self->_mentionSuggestionView;
    self->_mentionSuggestionView = v3;

    -[CKMentionSuggestionView setClipsToBounds:](self->_mentionSuggestionView, "setClipsToBounds:", 1);
    -[CKMentionSuggestionView setDataSource:](self->_mentionSuggestionView, "setDataSource:", self);
    -[CKMentionSuggestionView setDelegate:](self->_mentionSuggestionView, "setDelegate:", self);
    -[CKMentionsController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  return self->_mentionSuggestionView;
}

- (_NSRange)_rangeFromUITextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v4 = a3;
  -[CKMentionsController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v7, v8);

  -[CKMentionsController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "offsetFromPosition:toPosition:", v11, v12);
  v14 = v9;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (CGRect)anchorRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[9];
  _QWORD v57[5];
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  CGRect result;

  -[CKMentionsController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainerInset");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTextKit2Enabled");

  if (v10)
  {
    -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention");
    if (!v11)
    {
      v26 = *MEMORY[0x1E0C9D648];
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_6;
    }
    objc_msgSend(v3, "textLayoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationFromLocation:withOffset:", v14, -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention");
    objc_msgSend(v12, "locationFromLocation:withOffset:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v15, v17);
    objc_msgSend(v12, "documentRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ensureLayoutForRange:", v19);

    v58 = 0;
    v59 = (double *)&v58;
    v60 = 0x4010000000;
    v61 = &unk_18E8EEE6F;
    v62 = 0u;
    v63 = 0u;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __34__CKMentionsController_anchorRect__block_invoke;
    v57[3] = &unk_1E2750AC8;
    v57[4] = &v58;
    objc_msgSend(v12, "enumerateTextSegmentsInRange:type:options:usingBlock:", v18, 0, 0, v57);
    v20 = v59[4];
    v21 = v59[5];
    v22 = v59[6];
    v23 = v59[7];
    -[CKMentionsController textView](self, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toView:", v24, v7 + v20, v5 + v21, v22, v23);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    objc_msgSend(v3, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention");
    objc_msgSend(v12, "boundingRectForGlyphRange:inTextContainer:", v33, v34, v8);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v58 = 0;
    v59 = (double *)&v58;
    v60 = 0x4010000000;
    v61 = &unk_18E8EEE6F;
    *(_QWORD *)&v62 = v35;
    *((_QWORD *)&v62 + 1) = v37;
    *(_QWORD *)&v63 = v39;
    *((_QWORD *)&v63 + 1) = v41;
    v43 = -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention");
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __34__CKMentionsController_anchorRect__block_invoke_2;
    v56[3] = &unk_1E2750AF0;
    v56[5] = v36;
    v56[6] = v38;
    v56[7] = v40;
    v56[8] = v42;
    v56[4] = &v58;
    objc_msgSend(v12, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v43, v44, 0x7FFFFFFFFFFFFFFFLL, 0, v8, v56);
    v45 = v59;
    v46 = v5 + v59[5];
    v59[4] = v7 + v59[4];
    v45[5] = v46;
    -[CKMentionsController textView](self, "textView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toView:", v47, v45[4], v45[5], v45[6], v45[7]);
    v26 = v48;
    v28 = v49;
    v30 = v50;
    v32 = v51;

    _Block_object_dispose(&v58, 8);
  }

LABEL_6:
  v52 = v26;
  v53 = v28;
  v54 = v30;
  v55 = v32;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

uint64_t __34__CKMentionsController_anchorRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

BOOL __34__CKMentionsController_anchorRect__block_invoke_2(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;
  double *v13;

  result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    v13 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (CKPaddleOverlayView)paddleOverlayView
{
  CKPaddleOverlayView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CKPaddleOverlayView *v14;
  CKPaddleOverlayView *paddleOverlayView;

  if (!self->_paddleOverlayView
    && -[CKMentionsController shouldShowMentionSuggestions](self, "shouldShowMentionSuggestions"))
  {
    v3 = [CKPaddleOverlayView alloc];
    -[CKMentionsController mentionSuggestionView](self, "mentionSuggestionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionsController anchorRect](self, "anchorRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CKMentionsController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CKPaddleOverlayView initWithOverlayView:atAnchorRect:inView:delegate:](v3, "initWithOverlayView:atAnchorRect:inView:delegate:", v4, v13, self, v6, v8, v10, v12);
    paddleOverlayView = self->_paddleOverlayView;
    self->_paddleOverlayView = v14;

  }
  return self->_paddleOverlayView;
}

- (BOOL)isValidPrefixCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  if (!-[CKMentionsController languageHasSpaces](self, "languageHasSpaces"))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "characterIsMember:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "characterIsMember:", v3);

  }
  return v5;
}

- (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4
{
  int64_t location;
  id v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  location = a3.location;
  v6 = a4;
  v7 = v6;
  if (!location || (v8 = location - 1, location == 1))
    v9 = 1;
  else
    v9 = (objc_msgSend(v6, "characterAtIndex:", location - 1) != 64
       || location >= 2 && (v8 = location - 2, location - 2 < (unint64_t)objc_msgSend(v7, "length")))
      && -[CKMentionsController isValidPrefixCharacter:](self, "isValidPrefixCharacter:", objc_msgSend(v7, "characterAtIndex:", v8));

  return v9;
}

- (BOOL)allowsMentions
{
  void *v2;
  char v3;

  -[CKMentionsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsMentions");

  return v3;
}

- (void)checkForMentions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKMentionsController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  LODWORD(v4) = +[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions");
  -[CKMentionsController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
    -[CKMentionsController resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:](self, "resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:", v6, v5, &__block_literal_global_94);
  else
    -[CKMentionsController checkForMentionsInAttributedString:inTextView:](self, "checkForMentionsInAttributedString:inTextView:", v6, v5);

}

- (void)_enumerateNode:(id)a3 parentNodes:(id)a4 enumerator:(id)a5
{
  id v8;
  unsigned int (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(id, _QWORD, void *))a5;
  objc_msgSend(a4, "arrayByAddingObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "children", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
      if (!v9[2](v9, v17, v10))
        break;
      -[CKMentionsController _enumerateNode:parentNodes:enumerator:](self, "_enumerateNode:parentNodes:enumerator:", v17, v10, v9);
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_nodeIdForMentionNode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  CKMentionAutoCompleteNodeId *v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__34;
    v15 = __Block_byref_object_dispose__34;
    v16 = 0;
    v16 = objc_alloc_init(CKMentionAutoCompleteNodeId);
    -[CKMentionsController entityTree](self, "entityTree");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__CKMentionsController__nodeIdForMentionNode___block_invoke;
    v8[3] = &unk_1E2750B18;
    v9 = v4;
    v10 = &v11;
    -[CKMentionsController _enumerateNode:parentNodes:enumerator:](self, "_enumerateNode:parentNodes:enumerator:", v5, MEMORY[0x1E0C9AA60], v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __46__CKMentionsController__nodeIdForMentionNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(id *)(a1 + 32);
  if (v8 == v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v13, "key");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "nodeIdByAppendingKey:", v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v5, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nodeIdByAppendingKey:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  return v8 != v5;
}

- (id)_nodeForMentionNodeId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMentionsController entityTree](self, "entityTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "keys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v11, "childWithKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v13 = v11;

          goto LABEL_11;
        }
        v5 = (void *)v12;

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = v5;
LABEL_11:

  return v13;
}

- (void)dismissPaddleOverlayIfNecessaryForText:(id)a3
{
  id v4;

  v4 = a3;
  if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
  {
    if (-[CKMentionsController currentTappedCharacterIndex](self, "currentTappedCharacterIndex") != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((objc_msgSend(v4, "attribute:existsInRange:", *MEMORY[0x1E0D381C0], 0, objc_msgSend(v4, "length")) & 1) == 0)
LABEL_5:
    -[CKMentionsController setShowMentionSuggestions:animated:completion:](self, "setShowMentionSuggestions:animated:completion:", 0, 1, 0);
LABEL_6:

}

- (void)checkForMentionsInAttributedString:(id)a3 inTextView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  CKMentionsController *v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[2];

  v6 = a3;
  v7 = a4;
  if (-[CKMentionsController allowsMentions](self, "allowsMentions"))
  {
    if (!-[CKMentionsController isUpdatingMentionAttributedText](self, "isUpdatingMentionAttributedText"))
    {
      objc_msgSend(v7, "markedTextRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v29[0] = -[CKMentionsController lastFoundMentionRange](self, "lastFoundMentionRange");
        v29[1] = v9;
        +[CKMentionsUtilities configureAttributedStringForMentionsChecking:excludingRange:](CKMentionsUtilities, "configureAttributedStringForMentionsChecking:excludingRange:", v6, v29);
        -[CKMentionsController dismissPaddleOverlayIfNecessaryForText:](self, "dismissPaddleOverlayIfNecessaryForText:", v6);
        v27[0] = 0;
        v27[1] = v27;
        v27[2] = 0x3032000000;
        v27[3] = __Block_byref_object_copy__34;
        v27[4] = __Block_byref_object_dispose__34;
        v28 = 0;
        -[CKMentionsController entityTree](self, "entityTree");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x3010000000;
        v25[3] = &unk_18E8EEE6F;
        v26 = xmmword_18E7C9230;
        objc_msgSend(v7, "attributedText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __70__CKMentionsController_checkForMentionsInAttributedString_inTextView___block_invoke;
        v19[3] = &unk_1E2750B40;
        v14 = v6;
        v23 = v27;
        v24 = v25;
        v20 = v14;
        v21 = self;
        v15 = v7;
        v22 = v15;
        objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 2, v19);

        v17 = objc_msgSend(v15, "selectedRange");
        v18 = v16;
        -[CKMentionsController confirmAutomaticMention:inTextView:selectedRange:](self, "confirmAutomaticMention:inTextView:selectedRange:", v14, v15, &v17);
        -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v15, v14, v17, v18);

        _Block_object_dispose(v25, 8);
        _Block_object_dispose(v27, 8);

      }
    }
  }

}

void __70__CKMentionsController_checkForMentionsInAttributedString_inTextView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v7 = a2;
  v50 = 0;
  v51 = 0;
  v8 = *MEMORY[0x1E0D381F0];
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D381F0], a3, &v50);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "mentionsSafeText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
      goto LABEL_22;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v11, "substringWithRange:", v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v18);

      ++v14;
      v15 = v18;
      if (objc_msgSend(v11, "length") <= v14)
        goto LABEL_11;
    }
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = xmmword_18E7C9230;
    objc_msgSend(*(id *)(a1 + 40), "entityTree");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_22;
LABEL_11:
    v23 = +[CKMentionsUtilities range:appendingSubstringRange:](CKMentionsUtilities, "range:appendingSubstringRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3, a4);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    *(_QWORD *)(v24 + 32) = v23;
    *(_QWORD *)(v24 + 40) = v25;
    objc_msgSend(v18, "entities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "count"))
      goto LABEL_20;
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v28, "range:hasValidPrefixCharacterForString:", *(_QWORD *)(v27 + 32), *(_QWORD *)(v27 + 40), v29);

    if (!(_DWORD)v28)
    {
LABEL_21:
      v46 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v47 = *(void **)(v46 + 40);
      *(_QWORD *)(v46 + 40) = v18;
      v48 = v18;

      goto LABEL_22;
    }
    objc_msgSend(v18, "entities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    objc_msgSend(*(id *)(a1 + 32), "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = +[CKMentionsUtilities range:isPrefixedWithAtForString:](CKMentionsUtilities, "range:isPrefixedWithAtForString:", *(_QWORD *)(v32 + 32), *(_QWORD *)(v32 + 40), v33);

    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v36 = objc_msgSend(*(id *)(a1 + 48), "selectedRange");
    v38 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", *(_QWORD *)(v35 + 32), *(_QWORD *)(v35 + 40), v36, v37);
    v39 = objc_msgSend(*(id *)(a1 + 40), "attributedString:shouldAddAutoCompleteAttributeForRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "_nodeIdForMentionNode:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == 1 && v34 && v39)
    {
      v40 = *(_QWORD *)(a1 + 32);
      v41 = *(_QWORD *)(a1 + 48);
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v43 = *(_QWORD *)(v42 + 32);
      v44 = *(_QWORD *)(v42 + 40);
      BYTE1(v49) = 1;
      LOBYTE(v49) = v38;
    }
    else
    {
      if (!v34 || !v38)
      {
        if (v38)
          +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        goto LABEL_20;
      }
      v40 = *(_QWORD *)(a1 + 32);
      v41 = *(_QWORD *)(a1 + 48);
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v43 = *(_QWORD *)(v45 + 32);
      v44 = *(_QWORD *)(v45 + 40);
      LOWORD(v49) = 1;
    }
    +[CKMentionsUtilities configureAttributedString:inTextView:forDirectMentionInRange:forChildNode:nodeId:addingVisualStyling:shouldAddAutoComplete:](CKMentionsUtilities, "configureAttributedString:inTextView:forDirectMentionInRange:forChildNode:nodeId:addingVisualStyling:shouldAddAutoComplete:", v40, v41, v43, v44, v18, v26, v49);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "entityHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v11);

  if (v13)
    +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v50, v51, 0);
  else
    +[CKMentionsUtilities removeMentionsAtIndex:onAttributedString:inTextView:](CKMentionsUtilities, "removeMentionsAtIndex:onAttributedString:inTextView:", a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_22:

}

- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = objc_msgSend(v9, "selectedRange");
  -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v9, v6, v7, v8);

}

- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4 selectedRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  CKMentionsController *v24;
  id v25;
  NSUInteger v26;
  NSUInteger v27;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  -[CKMentionsController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CKMentionsController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqual:", v12);

    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isTextKit2Enabled");

      if (v15)
      {
        -[CKMentionsController mentionsAnimationController](self, "mentionsAnimationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateMentionAttributes:", v8);

      }
      else
      {
        -[CKMentionsController textView](self, "textView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layoutManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "updateMentionAttributes:", v8);
      }
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __85__CKMentionsController_updateTextViewIfNecessary_withAttributedString_selectedRange___block_invoke;
      v23 = &unk_1E2750B68;
      v24 = self;
      v25 = v8;
      v26 = location;
      v27 = length;
      v17 = (void (**)(_QWORD))_Block_copy(&v20);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v20, v21, v22, v23, v24))
        v17[2](v17);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v17);

    }
  }

}

uint64_t __85__CKMentionsController_updateTextViewIfNecessary_withAttributedString_selectedRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "setIsUpdatingMentionAttributedText:", 1);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttributedText:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextKit2Enabled");

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "mentionsAnimationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "updateMentionAttributes:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setNeedsDisplayInRect:");

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateTypingAttributesIfNeededForTextView:", v12);

  return objc_msgSend(*(id *)(a1 + 32), "setIsUpdatingMentionAttributedText:", 0);
}

- (void)updateTypingAttributesIfNeededForTextView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryFieldTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v13, "typingAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entryFieldTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1140]);

    objc_msgSend(v13, "setTypingAttributes:", v9);
  }

}

- (void)didFinishAnimatingMentionWithAnimationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  -[CKMentionsController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = *MEMORY[0x1E0D381C8];
  v9 = objc_msgSend(v7, "length");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__CKMentionsController_didFinishAnimatingMentionWithAnimationIdentifier___block_invoke;
  v19[3] = &unk_1E27508C8;
  v18 = v4;
  v20 = v18;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 2, v19);
  -[CKMentionsController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isTextKit2Enabled");

    if (v14)
    {
      -[CKMentionsAnimationController updateMentionAttributes:](self->_mentionsAnimationController, "updateMentionAttributes:", v10);
    }
    else
    {
      -[CKMentionsController textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "updateMentionAttributes:", v10);
    }
  }
  -[CKMentionsController textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController updateTextViewIfNecessary:withAttributedString:](self, "updateTextViewIfNecessary:withAttributedString:", v17, v10);

}

uint64_t __73__CKMentionsController_didFinishAnimatingMentionWithAnimationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0D381C8], a3, a4);
    *a5 = 1;
  }
  return result;
}

- (void)resetStyleInAttributedString:(id)a3 inTextView:(id)a4 andApplyStyleUsingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (-[CKMentionsController allowsMentions](self, "allowsMentions"))
  {
    if (!-[CKMentionsController isUpdatingMentionAttributedText](self, "isUpdatingMentionAttributedText"))
    {
      objc_msgSend(v9, "markedTextRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[CKMentionsController conversation](self, "conversation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "chat");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "supportsCapabilities:", 128);

        if ((v14 & 1) != 0)
        {
          v26[0] = -[CKMentionsController lastFoundMentionRange](self, "lastFoundMentionRange");
          v26[1] = v15;
          +[CKMentionsUtilities configureAttributedStringForMentionsChecking:excludingRange:](CKMentionsUtilities, "configureAttributedStringForMentionsChecking:excludingRange:", v8, v26);
          -[CKMentionsController dismissPaddleOverlayIfNecessaryForText:](self, "dismissPaddleOverlayIfNecessaryForText:", v8);
          v16 = *MEMORY[0x1E0D381F0];
          objc_msgSend(v8, "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __88__CKMentionsController_resetStyleInAttributedString_inTextView_andApplyStyleUsingBlock___block_invoke;
          v23[3] = &unk_1E2750B90;
          v23[4] = self;
          v19 = v8;
          v24 = v19;
          v20 = v9;
          v25 = v20;
          objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v18, 2, v23);

          v10[2](v10);
          v21 = objc_msgSend(v20, "selectedRange");
          -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v20, v19, v21, v22);

        }
        else
        {
          +[CKMentionsUtilities hideMentionsInAttributedString:inTextView:](CKMentionsUtilities, "hideMentionsInAttributedString:inTextView:", v8, v9);
          -[CKMentionsController updateTextViewIfNecessary:withAttributedString:](self, "updateTextViewIfNecessary:withAttributedString:", v9, v8);
        }
      }
    }
  }

}

void __88__CKMentionsController_resetStyleInAttributedString_inTextView_andApplyStyleUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_msgSend(*(id *)(a1 + 32), "entityHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v10);

    if (v9)
      +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3, a4, 0);
    else
      +[CKMentionsUtilities removeMentionsAtIndex:onAttributedString:inTextView:](CKMentionsUtilities, "removeMentionsAtIndex:onAttributedString:inTextView:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = v10;
  }

}

- (void)insertionPointEnteredRange:(_NSRange)a3 forMention:(id)a4 withEntities:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CKMentionsController *v21;
  id v22;
  NSUInteger v23;
  NSUInteger v24;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  -[CKMentionsController setLastFoundMentionRange:](self, "setLastFoundMentionRange:", location, length);
  -[CKMentionsController setCurrentMentionSuggestions:](self, "setCurrentMentionSuggestions:", v10);
  -[CKMentionsController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  -[CKMentionsController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke;
  v18[3] = &unk_1E2750BB8;
  v23 = location;
  v24 = length;
  v19 = v13;
  v20 = v10;
  v21 = self;
  v22 = v9;
  v15 = v9;
  v16 = v10;
  v17 = v13;
  -[CKMentionsController resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:](self, "resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:", v17, v14, v18);

}

void __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[0] = 0;
  v18[1] = 0;
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D381F0], v2, v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v5, "range:hasValidPrefixCharacterForString:", v2, v3, v6);

      if ((_DWORD)v5)
      {
        v7 = objc_msgSend(*(id *)(a1 + 56), "characterAtIndex:", 0);
        objc_msgSend(*(id *)(a1 + 48), "textView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "selectedRange");
        v11 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", v2, v3, v9, v10);

        if (v7 == 64 && v11)
        {
          v12 = v3 - 1;
          if (!v12)
            __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke_cold_1();
          objc_msgSend(*(id *)(a1 + 48), "_nodeIdForMentionNode:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "textView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v17) = 1;
          +[CKMentionsUtilities configureAttributedString:inTextView:forDirectMentionInRange:forChildNode:nodeId:addingVisualStyling:shouldAddAutoComplete:](CKMentionsUtilities, "configureAttributedString:inTextView:forDirectMentionInRange:forChildNode:nodeId:addingVisualStyling:shouldAddAutoComplete:", v14, v15, v2 + 1, v12, 0, v13, v17);

          goto LABEL_11;
        }
        if (v11)
        {
          v16 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "textView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", v16, v13, v2, v3);
LABEL_11:

        }
      }
    }
  }
}

- (void)showMentionSuggestionsForEntities:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[CKMentionsController setCurrentMentionSuggestions:](self, "setCurrentMentionSuggestions:", v7);
    -[CKMentionsController setRangeOfTappedMention:](self, "setRangeOfTappedMention:", location, length);
    -[CKMentionsController setShowMentionSuggestions:animated:completion:](self, "setShowMentionSuggestions:animated:completion:", 1, 1, 0);
  }

}

- (void)didTapMentionAtCharacterIndex:(double)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  -[CKMentionsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapabilities:", 128);

  if (v7)
  {
    -[CKMentionsController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v18 = 0;
    v19 = 0;
    v11 = (id)objc_msgSend(v10, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D381C0], (unint64_t)a3, &v18, 0, objc_msgSend(v10, "length"));
    if ((objc_msgSend(v10, "attribute:existsInRange:", *MEMORY[0x1E0D381F0], v18, v19) & 1) == 0)
    {
      objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D38218], v18, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(v10, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "substringWithRange:", v18, v19);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
      {
        -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CKMentionsController entitiesForKey:](self, "entitiesForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

      }
      -[CKMentionsController showMentionSuggestionsForEntities:replacementRange:](self, "showMentionSuggestionsForEntities:replacementRange:", v16, v18, v19);

    }
  }
}

- (void)configureAttributedString:(id)a3 inTextView:(id)a4 forMentionOverrideInRange:(_NSRange)a5 shouldOverride:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v11 = a3;
  *(_QWORD *)&v22 = objc_msgSend(a4, "selectedRange");
  *((_QWORD *)&v22 + 1) = v12;
  v21 = v22;
  if (location < objc_msgSend(v11, "length"))
  {
    -[CKMentionsController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionsController replaceAttributedText:inTextView:atIndex:updatedSelectedRange:replacementRange:](self, "replaceAttributedText:inTextView:atIndex:updatedSelectedRange:replacementRange:", v11, v13, location, &v22, &v21);

    if (length >= 2)
    {
      v14 = location + length;
      v15 = objc_msgSend(v11, "length");
      if (v14 >= v15 - 1)
        v14 = v15 - 1;
      -[CKMentionsController textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMentionsController replaceAttributedText:inTextView:atIndex:updatedSelectedRange:replacementRange:](self, "replaceAttributedText:inTextView:atIndex:updatedSelectedRange:replacementRange:", v11, v16, v14, &v22, &v21);

    }
  }
  -[CKMentionsController textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v17, v11, v22);

  if (v6)
  {
    objc_msgSend(v11, "attributedSubstringFromRange:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length") && objc_msgSend(v19, "characterAtIndex:", 0) == 64)
      objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0D38210], v19, v21);

  }
  -[CKMentionsController textView](self, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController checkForMentionsInAttributedString:inTextView:](self, "checkForMentionsInAttributedString:inTextView:", v11, v20);

}

- (void)replaceAttributedText:(id)a3 inTextView:(id)a4 atIndex:(unint64_t)a5 updatedSelectedRange:(_NSRange *)a6 replacementRange:(_NSRange *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;

  v11 = a3;
  v12 = a4;
  v20 = 0;
  v21 = 0;
  objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D381F0], a5, &v20, 0, objc_msgSend(v11, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D38208], v20, 0, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    v16 = v20;
    if (v15 && a7->location > v20)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
      objc_msgSend(v11, "deleteCharactersInRange:", v20, v21);
      objc_msgSend(v11, "insertAttributedString:atIndex:", v17, v20);
      v18 = v20;
      a6->location = objc_msgSend(v17, "length") + v18;
      v19 = objc_msgSend(v17, "length");
      v21 = v19;
      a7->location = v20;
      a7->length = v19;

      v16 = v20;
    }
    +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v11, v12, v16, v21);

  }
}

- (BOOL)shouldUpdateMentionsInRange:(_NSRange)a3 withReplacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  BOOL v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (-[CKMentionsController allowsMentions](self, "allowsMentions")
    && (location | length || objc_msgSend(v7, "length")))
  {
    -[CKMentionsController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKMentionsController shouldUpdateMentionsInTextView:inRange:withReplacementText:](self, "shouldUpdateMentionsInTextView:inRange:withReplacementText:", v8, location, length, v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)shouldUpdateMentionsInTextView:(id)a3 inRange:(_NSRange)a4 withReplacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  BOOL v17;
  uint64_t v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_msgSend(v10, "length");
  v14 = objc_msgSend(v10, "length");

  if (v14)
    v15 = 0;
  else
    v15 = length > 1;
  v16 = v15;
  if (!v13
    && length == 1
    && +[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v12, location, 1))
  {
    v17 = 0;
    v18 = 1;
LABEL_14:
    -[CKMentionsController configureAttributedString:inTextView:forMentionOverrideInRange:shouldOverride:](self, "configureAttributedString:inTextView:forMentionOverrideInRange:shouldOverride:", v12, v9, location, length, v18);
    goto LABEL_16;
  }
  if (!v16)
  {
    v17 = 1;
    goto LABEL_16;
  }
  v17 = 1;
  if (+[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v12, location, length))
  {
    v18 = 0;
    goto LABEL_14;
  }
LABEL_16:

  return v17;
}

- (BOOL)attributedString:(id)a3 shouldAddAutoCompleteAttributeForRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  length = a4.length;
  location = a4.location;
  v6 = *MEMORY[0x1E0D38210];
  v7 = a3;
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", v6, location, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "substringWithRange:", location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v8, "isEqualToString:", v10) ^ 1;
  else
    LOBYTE(v11) = 1;

  return v11;
}

- (void)insertMentionByName:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = -[CKMentionsController allowsMentions](self, "allowsMentions");
  v5 = v19;
  if (v4)
  {
    objc_msgSend(v19, "mentionsSafeText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length") && objc_msgSend(v6, "length"))
    {
      -[CKMentionsController textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMentionsController entitiesForKey:](self, "entitiesForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v19);
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "defaultIMHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          v13 = objc_msgSend(v19, "length");
          objc_msgSend(v9, "ck_removeAnimatedTextEffectsFromRange:", 0, v13);
          objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0D381F0], v12, 0, v13);
          +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", v9, v7, 0, v13, 1);
        }

      }
      else
      {
        +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", v9, v7, 0, objc_msgSend(v19, "length"));
      }
      if (-[CKMentionsController languageHasSpaces](self, "languageHasSpaces"))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" "));
        +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v14, v7, 0, 1);
        objc_msgSend(v9, "appendAttributedString:", v14);
        objc_msgSend(v7, "attributedText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        v17 = objc_msgSend(v7, "selectedRange");
        objc_msgSend(v16, "insertAttributedString:atIndex:", v9, v17 + v18);
        objc_msgSend(v7, "setAttributedText:", v16);
        -[CKMentionsController updateTextViewIfNecessary:withAttributedString:](self, "updateTextViewIfNecessary:withAttributedString:", v7, v16);

      }
    }

    v5 = v19;
  }

}

- (void)insertMentionWithEntity:(id)a3 replacementRange:(_NSRange)a4 fallbackName:(id)a5 source:(unsigned __int8)a6
{
  int v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a5;
  -[CKMentionsController setShowMentionSuggestions:animated:completion:](self, "setShowMentionSuggestions:animated:completion:", 0, 1, 0);
  -[CKMentionsController textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "ck_removeAnimatedTextEffectsFromRange:", location, length);
  v16 = v12;
  v17 = v16;
  if (v6)
  {
    objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D38218], location, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v17 = v16;
    if (v18)
    {
      v17 = v18;

    }
  }
  if (!v17)
    -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:].cold.1();
  objc_msgSend(v15, "attributedSubstringFromRange:", location, length);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "replaceCharactersInRange:withString:", location, length, v17);
  v33 = location;
  v34 = objc_msgSend(v17, "length");
  +[CKMentionsUtilities replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:](CKMentionsUtilities, "replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:", v15, v11, v17, location, v34, &v33);
  -[CKMentionsController textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMentionsUtilities configureAttributedString:inTextView:withOriginalText:inRange:](CKMentionsUtilities, "configureAttributedString:inTextView:withOriginalText:inRange:", v15, v22, v21, v33, v34);

  -[CKMentionsController textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", v15, v23, v33, v34, 1);

  -[CKMentionsController textView](self, "textView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedRange");
  v26 = v25;

  v27 = v34 + v33;
  if (v6)
  {
    if (v27 == objc_msgSend(v15, "length") && -[CKMentionsController languageHasSpaces](self, "languageHasSpaces"))
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" "));
      v32 = v34 + v33;
      -[CKMentionsController textView](self, "textView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v28, v29, 0, 1);

      objc_msgSend(v15, "insertAttributedString:atIndex:", v28, v32);
      v27 = objc_msgSend(v15, "length");

    }
    else
    {
      v27 = v34 + v33;
    }
  }
  -[CKMentionsController textView](self, "textView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v30, v15, v27, v26);

  -[CKMentionsController textView](self, "textView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController checkForMentionsInAttributedString:inTextView:](self, "checkForMentionsInAttributedString:inTextView:", v15, v31);

}

- (void)suggestionViewDidSelectEntity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CKMentionsController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention");
  v8 = v7;
  if (v7 > objc_msgSend(v11, "length"))
    v8 = objc_msgSend(v11, "length");
  if (v8 + v6 > (unint64_t)objc_msgSend(v11, "length"))
    v8 = objc_msgSend(v11, "length") - v6;
  objc_msgSend(v11, "attributedSubstringFromRange:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:](self, "insertMentionWithEntity:replacementRange:fallbackName:source:", v4, v6, v8, v10, 1);
}

- (void)acceptAutomaticMentionConfirmation
{
  void *v3;
  void *v4;
  id v5;

  if (!+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
  {
    -[CKMentionsController textView](self, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    -[CKMentionsController confirmAutomaticMention:inTextView:isSending:selectedRange:](self, "confirmAutomaticMention:inTextView:isSending:selectedRange:", v4, v5, 1, 0);
    -[CKMentionsController updateTextViewIfNecessary:withAttributedString:](self, "updateTextViewIfNecessary:withAttributedString:", v5, v4);

  }
}

- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 selectedRange:(_NSRange *)a5
{
  -[CKMentionsController confirmAutomaticMention:inTextView:isSending:selectedRange:](self, "confirmAutomaticMention:inTextView:isSending:selectedRange:", a3, a4, 0, a5);
}

- (void)_enumerateAllAutomaticConfirmedMentionsInAttributedString:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D39840];
  v8 = a3;
  objc_msgSend(v7, "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTextKit2Enabled");

  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke;
    v16[3] = &unk_1E2750BE0;
    v16[4] = self;
    v17 = v6;
    v11 = v6;
    objc_msgSend(v8, "ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock:", v16);

    v12 = v17;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke_2;
    v14[3] = &unk_1E2750C08;
    v15 = v6;
    v13 = v6;
    objc_msgSend(v8, "ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock:", v14);

    v12 = v15;
  }

}

void __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CKMentionAutoCompleteNodeId *v8;
  void *v9;
  CKMentionAutoCompleteAttribute *v10;
  id v11;

  v3 = *MEMORY[0x1E0D381D8];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D381E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D381E0]);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (void *)v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = -[CKMentionAutoCompleteNodeId initWithKeys:]([CKMentionAutoCompleteNodeId alloc], "initWithKeys:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_nodeForMentionNodeId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKMentionAutoCompleteAttribute initWithMentionEntityNode:originalText:displayText:]([CKMentionAutoCompleteAttribute alloc], "initWithMentionEntityNode:originalText:displayText:", v9, v5, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 isSending:(BOOL)a5 selectedRange:(_NSRange *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKMentionsController *v16;
  id v17;
  _NSRange *v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__CKMentionsController_confirmAutomaticMention_inTextView_isSending_selectedRange___block_invoke;
  v14[3] = &unk_1E2750C30;
  v19 = a5;
  v15 = v11;
  v16 = self;
  v17 = v10;
  v18 = a6;
  v12 = v10;
  v13 = v11;
  -[CKMentionsController _enumerateAllAutomaticConfirmedMentionsInAttributedString:usingBlock:](self, "_enumerateAllAutomaticConfirmedMentionsInAttributedString:usingBlock:", v12, v14);

}

void __83__CKMentionsController_confirmAutomaticMention_inTextView_isSending_selectedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  _BOOL8 v30;
  __objc2_class **v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a3;
  v33 = a4;
  v7 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    v8 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", a3, a4, v9, v10);
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "mentionEntityNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "attributedString:nextCharacterRangeFromRange:containsPossibleChild:", v12, a3, a4, v13);

  if (!v8 && (v14 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "displayText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "localizedCompare:", v17);

    v19 = *(void **)(a1 + 48);
    if (v18)
    {
      objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E0D381D0], a3, a4);
    }
    else
    {
      objc_msgSend(v19, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D38210], a3, 0, a3, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v16);

      if ((v21 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E0D381D0], a3, a4);
        objc_msgSend(v7, "mentionEntityNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "entities");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "anyObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v7, "originalText");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKMentionsUtilities replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:](CKMentionsUtilities, "replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:", v27, v26, v28, a3, a4, &v32);

        v29 = *(_QWORD **)(a1 + 56);
        if (v29)
          *v29 += v33 - a4;
        if (*(_BYTE *)(a1 + 64))
        {
          v30 = 0;
          v31 = off_1E2733000;
        }
        else
        {
          v31 = off_1E2733000;
          +[CKMentionsUtilities configureAttributedString:inTextView:withOriginalText:inRange:](CKMentionsUtilities, "configureAttributedString:inTextView:withOriginalText:inRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v25, v32, v33);
          v30 = *(_BYTE *)(a1 + 64) == 0;
        }
        -[__objc2_class configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](v31[148], "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v32, v33, v30);

      }
    }

  }
}

- (BOOL)attributedString:(id)a3 nextCharacterRangeFromRange:(_NSRange)a4 containsPossibleChild:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  NSUInteger v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = location + length;
  if (objc_msgSend(v8, "length") >= v10 + 1)
  {
    objc_msgSend(v8, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringWithRange:", v10, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mentionsSafeText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "possibleEntities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "containsObject:", v19);

    if (v20)
    {
      objc_msgSend(v9, "entities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "anyObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultIMHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "entities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultIMHandle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[CKEntity string:hasPrefix:](CKEntity, "string:hasPrefix:", v24, v14)
        || +[CKEntity string:hasPrefix:](CKEntity, "string:hasPrefix:", v28, v14))
      {
        LOBYTE(v11) = 1;
        goto LABEL_10;
      }

    }
    if (!v16)
    {
      LOBYTE(v11) = 0;
      goto LABEL_12;
    }
    objc_msgSend(v16, "possibleEntities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v24, "containsObject:", v29) ^ 1;

LABEL_10:
LABEL_12:

    goto LABEL_13;
  }
  LOBYTE(v11) = 0;
LABEL_13:

  return v11;
}

- (void)reloadMentionsData
{
  -[CKMentionsController updateMentionsAssociations](self, "updateMentionsAssociations");
  -[CKMentionsController checkForMentions](self, "checkForMentions");
}

- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v7)(_QWORD);
  int v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);

  v5 = a3;
  v7 = (void (**)(_QWORD))a5;
  v8 = objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isPredictionBarEnabled");
  -[CKMentionsController currentMentionSuggestions](self, "currentMentionSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8)
    v11 = v10 > 1;
  else
    v11 = 1;
  if (!v11)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
LABEL_12:
    if (v7)
    {
LABEL_13:
      v7[2](v7);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!-[CKMentionsController allowsMentions](self, "allowsMentions")
    || -[CKMentionsController showingMentionsSuggestions](self, "showingMentionsSuggestions") == v5)
  {
    goto LABEL_12;
  }
  -[CKMentionsController setShowingMentionsSuggestions:](self, "setShowingMentionsSuggestions:", v5);
  -[CKMentionsController setPreventShowingCalloutMenu:](self, "setPreventShowingCalloutMenu:", v5);
  if (!v5)
  {
    -[CKPaddleOverlayView dismiss](self->_paddleOverlayView, "dismiss");
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textInputTraitsDidChange");

    -[CKMentionsController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[CKMentionsController textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[CKMentionsController textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  v14 = CKIsRunningInMacCatalyst() == 0;
  -[CKMentionsController paddleOverlayView](self, "paddleOverlayView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__CKMentionsController_setShowMentionSuggestions_animated_completion___block_invoke;
  v19[3] = &unk_1E274C308;
  v20 = v7;
  objc_msgSend(v15, "showPaddleAnimated:completion:", v14, v19);

LABEL_14:
}

uint64_t __70__CKMentionsController_setShowMentionSuggestions_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateMentionsAssociations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CKMentionEntityNode *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[CKMentionsController allowsMentions](self, "allowsMentions"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[CKMentionsController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));
    -[CKMentionsController setEntityHandles:](self, "setEntityHandles:", v6);

    if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
    {
      -[CKMentionsController _populateSupplementalLexiconAsynchronously](self, "_populateSupplementalLexiconAsynchronously");
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[CKMentionsController conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v38 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "defaultIMHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "ID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v14, "length"))
            {
              -[CKMentionsController entityHandles](self, "entityHandles");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v10);
      }
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CKMentionsController setEntityDictionary:](self, "setEntityDictionary:", v16);

      v17 = objc_alloc_init(CKMentionEntityNode);
      -[CKMentionsController setEntityTree:](self, "setEntityTree:", v17);

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[CKMentionsController conversation](self, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v8);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(v23, "isMentionable"))
            {
              v31 = 0u;
              v32 = 0u;
              v29 = 0u;
              v30 = 0u;
              objc_msgSend(v23, "mentionTokens", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v30;
                do
                {
                  for (k = 0; k != v26; ++k)
                  {
                    if (*(_QWORD *)v30 != v27)
                      objc_enumerationMutation(v24);
                    -[CKMentionsController associateEntity:withKey:](self, "associateEntity:withKey:", v23, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                }
                while (v26);
              }

            }
          }
          v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v20);
      }
    }

  }
}

- (void)_populateSupplementalLexiconAsynchronously
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  CKMentionsController *v35;
  id obj;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  CKMentionsController *v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  void *v54;
  _BYTE v55[128];
  _QWORD v56[10];

  v56[7] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptReplyPreviewContextContactImageDiameter");
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0C97460];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, v5, v5, v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0C97450]);
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v9, "initWithSettings:", v10);

  v11 = *MEMORY[0x1E0C966D0];
  v56[0] = *MEMORY[0x1E0C966C0];
  v56[1] = v11;
  v12 = *MEMORY[0x1E0C967D0];
  v56[2] = *MEMORY[0x1E0C967B8];
  v56[3] = v12;
  v13 = *MEMORY[0x1E0C967E8];
  v56[4] = *MEMORY[0x1E0C967D8];
  v56[5] = v13;
  objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("com.apple.Messages.CKMessageEntryView.renderingQueue", v16);

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (_IMWillLog())
  {
    -[CKMentionsController conversation](self, "conversation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recipients");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v20, "count");
    _IMAlwaysLog();

  }
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v49 = 0u;
  v35 = self;
  -[CKMentionsController conversation](self, "conversation", v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recipients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v22;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v27, "cnContactWithKeys:", v37);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "copy");

        v53 = CFSTR("CKSupplementalItemEntityAttributeName");
        v54 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke;
        block[3] = &unk_1E274D1B0;
        v44 = v29;
        v45 = v38;
        v46 = v39;
        v47 = v30;
        v48 = v18;
        v31 = v30;
        v32 = v29;
        dispatch_group_async(v15, v17, block);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v24);
  }

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke_2;
  v40[3] = &unk_1E274A108;
  v41 = v18;
  v42 = v35;
  v33 = v18;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v40);

}

void __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (_IMWillLog())
    _IMAlwaysLog();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAF08]), "initWithContact:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarImageForContacts:scope:", v4, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIcon:", v5);

  objc_msgSend(v2, "setUserInfo:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v2);

}

uint64_t __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke_2(uint64_t a1)
{
  if (_IMWillLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "count");
    _IMAlwaysLog();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_updateMentionsLexiconWithItems:", *(_QWORD *)(a1 + 32));
}

- (void)_updateMentionsLexiconWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAF00]), "initWithItems:searchPrefixes:", v4, 1);

  -[CKMentionsController setMentionsLexicon:](self, "setMentionsLexicon:", v5);
  -[CKMentionsController mentionsLexicon](self, "mentionsLexicon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSupplementalLexicon:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSupplementalLexiconAmbiguousItemIcon:", v8);

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textInputTraitsDidChange");

}

- (void)associateEntity:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__34;
    v23 = __Block_byref_object_dispose__34;
    v24 = 0;
    -[CKMentionsController entityTree](self, "entityTree");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__CKMentionsController_associateEntity_withKey___block_invoke;
    v16[3] = &unk_1E2750C58;
    v18 = &v19;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v16);
    objc_msgSend((id)v20[5], "addEntity:", v9);
    objc_msgSend(v9, "defaultIMHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      -[CKMentionsController entityHandles](self, "entityHandles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

    }
    -[CKMentionsController entityDictionary](self, "entityDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "addObject:", v9);
    else
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v9, 0);
    -[CKMentionsController entityDictionary](self, "entityDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v7);

    _Block_object_dispose(&v19, 8);
  }

}

void __48__CKMentionsController_associateEntity_withKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  CKMentionEntityNode *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (CKMentionEntityNode *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = objc_alloc_init(CKMentionEntityNode);
    -[CKMentionEntityNode setKey:](v4, "setKey:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addChild:", v4);
  }
  -[CKMentionEntityNode addPossibleEntity:](v4, "addPossibleEntity:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)entitiesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKMentionsController entityDictionary](self, "entityDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionsSafeText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didSetAttributedTextOfTextView
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextKit2Enabled");

  if (v4)
  {
    -[CKMentionsController mentionsAnimationController](self, "mentionsAnimationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didSetAttributedTextOfTextView");

  }
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BOOL4 v10;

  -[CKMentionsController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    -[CKMentionsController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectedRange");

    if (v6)
      v7 = v6 - 1;
    else
      v7 = 0;
    v8 = objc_msgSend(v4, "length");
    if (v7 >= v8 - 1)
      v9 = v8 - 1;
    else
      v9 = v7;
    v10 = !+[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v4, v9, 1);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = -[CKMentionsController _rangeFromUITextRange:](self, "_rangeFromUITextRange:", a5);
  v11 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CKSupplementalItemEntityAttributeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:](self, "insertMentionWithEntity:replacementRange:fallbackName:source:", v13, v9, v11, v8, 0);
  if (-[CKMentionsController allowsMentions](self, "allowsMentions"))
  {
    if (!-[CKMentionsController isUpdatingMentionAttributedText](self, "isUpdatingMentionAttributedText"))
      -[CKMentionsController setShowMentionSuggestions:animated:completion:](self, "setShowMentionSuggestions:animated:completion:", 0, 1, 0);
    -[CKMentionsController checkForMentions](self, "checkForMentions");
  }

}

- (void)insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = -[CKMentionsController _rangeFromUITextRange:](self, "_rangeFromUITextRange:", a3);
  v12 = v11;
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_119);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[CKMentionsController insertionPointEnteredRange:forMention:withEntities:](self, "insertionPointEnteredRange:forMention:withEntities:", v10, v12, v9, v14);
  if (!-[CKMentionsController showingMentionsSuggestions](self, "showingMentionsSuggestions"))
  {
    v13 = -[CKMentionsController currentTappedCharacterIndex](self, "currentTappedCharacterIndex");
    if (v13 >= v10 && v13 - v10 < v12)
    {
      -[CKMentionsController didTapMentionAtCharacterIndex:](self, "didTapMentionAtCharacterIndex:", (double)v13);
      -[CKMentionsController setCurrentTappedCharacterIndex:](self, "setCurrentTappedCharacterIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
  }

}

id __76__CKMentionsController_insertionPointEnteredRange_string_supplementalItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CKSupplementalItemEntityAttributeName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)insertionPointExitedRangeWithSupplementalItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKMentionsController setLastFoundMentionRange:](self, "setLastFoundMentionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CKMentionsController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  -[CKMentionsController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsController resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:](self, "resetStyleInAttributedString:inTextView:andApplyStyleUsingBlock:", v6, v5, &__block_literal_global_120);

}

- (void)chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a5;
  v10 = -[CKMentionsController _rangeFromUITextRange:](self, "_rangeFromUITextRange:", a4);
  v12 = v11;
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_121_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2;
  v20 = &unk_1E2750CC8;
  v21 = v8;
  v22 = v9;
  v14 = v8;
  v15 = v9;
  v16 = _Block_copy(&v17);
  -[CKMentionsController setDidSelectEntityCompletionHandler:](self, "setDidSelectEntityCompletionHandler:", v16, v17, v18, v19, v20);
  -[CKMentionsController showMentionSuggestionsForEntities:replacementRange:](self, "showMentionSuggestionsForEntities:replacementRange:", v13, v10, v12);

}

id __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CKSupplementalItemEntityAttributeName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_3;
    v9[3] = &unk_1E2750CA0;
    v10 = v3;
    v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9, v8);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2_cold_1();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }

}

BOOL __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKSupplementalItemEntityAttributeName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (void)cancelChooseSupplementalItemToInsert
{
  -[CKMentionsController setDidSelectEntityCompletionHandler:](self, "setDidSelectEntityCompletionHandler:", 0);
  -[CKMentionsController setShowMentionSuggestions:animated:completion:](self, "setShowMentionSuggestions:animated:completion:", 0, 1, 0);
  -[CKMentionsController checkForMentions](self, "checkForMentions");
}

- (void)localeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEAAD8], "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    v9 = v3;
    objc_msgSend(v3, "primaryLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKMentionsUtilities languagesWithoutSpaces](CKMentionsUtilities, "languagesWithoutSpaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_languageHasSpaces = objc_msgSend(v8, "containsObject:", v7) ^ 1;

    v3 = v9;
  }
  else
  {
    self->_languageHasSpaces = 0;
  }

}

- (void)mentionsAnimationController:(id)a3 didFinishMentionAnimationWithIdentifier:(id)a4
{
  -[CKMentionsController didFinishAnimatingMentionWithAnimationIdentifier:](self, "didFinishAnimatingMentionWithAnimationIdentifier:", a4);
}

- (void)didDismissPaddleOverlayView:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  CKMentionSuggestionView *mentionSuggestionView;
  CKPaddleOverlayView *v7;

  v7 = (CKPaddleOverlayView *)a3;
  -[CKMentionsController setPreventShowingCalloutMenu:](self, "setPreventShowingCalloutMenu:", 0);
  if (self->_paddleOverlayView == v7)
  {
    self->_paddleOverlayView = 0;

  }
  if (self->_mentionSuggestionView)
  {
    -[CKMentionsController didSelectEntityCompletionHandler](self, "didSelectEntityCompletionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKMentionsController didSelectEntityCompletionHandler](self, "didSelectEntityCompletionHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[CKMentionsController setDidSelectEntityCompletionHandler:](self, "setDidSelectEntityCompletionHandler:", 0);
      v5[2](v5, 0);

    }
    -[CKMentionsController setShowingMentionsSuggestions:](self, "setShowingMentionsSuggestions:", 0);
    mentionSuggestionView = self->_mentionSuggestionView;
    self->_mentionSuggestionView = 0;

  }
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (unint64_t)currentTappedCharacterIndex
{
  return self->currentTappedCharacterIndex;
}

- (void)setCurrentTappedCharacterIndex:(unint64_t)a3
{
  self->currentTappedCharacterIndex = a3;
}

- (BOOL)preventShowingCalloutMenu
{
  return self->_preventShowingCalloutMenu;
}

- (void)setPreventShowingCalloutMenu:(BOOL)a3
{
  self->_preventShowingCalloutMenu = a3;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (BOOL)showingMentionsSuggestions
{
  return self->_showingMentionsSuggestions;
}

- (void)setShowingMentionsSuggestions:(BOOL)a3
{
  self->_showingMentionsSuggestions = a3;
}

- (CKMessageEntryTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void)setPaddleOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_paddleOverlayView, a3);
}

- (void)setMentionSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_mentionSuggestionView, a3);
}

- (NSArray)currentMentionSuggestions
{
  return self->_currentMentionSuggestions;
}

- (void)setCurrentMentionSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_currentMentionSuggestions, a3);
}

- (_NSRange)rangeOfTappedMention
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfTappedMention.length;
  location = self->_rangeOfTappedMention.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfTappedMention:(_NSRange)a3
{
  self->_rangeOfTappedMention = a3;
}

- (id)didSelectEntityCompletionHandler
{
  return self->_didSelectEntityCompletionHandler;
}

- (void)setDidSelectEntityCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isUpdatingMentionAttributedText
{
  return self->_isUpdatingMentionAttributedText;
}

- (void)setIsUpdatingMentionAttributedText:(BOOL)a3
{
  self->_isUpdatingMentionAttributedText = a3;
}

- (_NSRange)lastFoundMentionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lastFoundMentionRange.length;
  location = self->_lastFoundMentionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastFoundMentionRange:(_NSRange)a3
{
  self->_lastFoundMentionRange = a3;
}

- (CKMentionEntityNode)entityTree
{
  return self->_entityTree;
}

- (void)setEntityTree:(id)a3
{
  objc_storeStrong((id *)&self->_entityTree, a3);
}

- (NSMutableSet)entityHandles
{
  return self->_entityHandles;
}

- (void)setEntityHandles:(id)a3
{
  objc_storeStrong((id *)&self->_entityHandles, a3);
}

- (NSMutableDictionary)entityDictionary
{
  return self->_entityDictionary;
}

- (void)setEntityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_entityDictionary, a3);
}

- (_UISupplementalLexicon)mentionsLexicon
{
  return self->_mentionsLexicon;
}

- (void)setMentionsLexicon:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsLexicon, a3);
}

- (CKMentionsAnimationController)mentionsAnimationController
{
  return self->_mentionsAnimationController;
}

- (void)setMentionsAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsAnimationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionsAnimationController, 0);
  objc_storeStrong((id *)&self->_mentionsLexicon, 0);
  objc_storeStrong((id *)&self->_entityDictionary, 0);
  objc_storeStrong((id *)&self->_entityHandles, 0);
  objc_storeStrong((id *)&self->_entityTree, 0);
  objc_storeStrong(&self->_didSelectEntityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentMentionSuggestions, 0);
  objc_storeStrong((id *)&self->_mentionSuggestionView, 0);
  objc_storeStrong((id *)&self->_paddleOverlayView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

void __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke_cold_1()
{
  __assert_rtn("-[CKMentionsController insertionPointEnteredRange:forMention:withEntities:]_block_invoke", "CKMentionsController.m", 661, "rangeOfMention.length - 1");
}

- (void)insertMentionWithEntity:replacementRange:fallbackName:source:.cold.1()
{
  __assert_rtn("-[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:]", "CKMentionsController.m", 853, "inputText");
}

void __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2_cold_1()
{
  __assert_rtn("-[CKMentionsController chooseSupplementalItemToInsert:replacementRange:completionHandler:]_block_invoke_2", "CKMentionsController.m", 1265, "indexOfMatch != NSNotFound");
}

@end
