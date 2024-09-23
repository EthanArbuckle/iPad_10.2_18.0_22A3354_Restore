@implementation EMFAnchoredSearchManager

- (EMFAnchoredSearchManager)initWithLocaleData:(id)a3
{
  EMFAnchoredSearchManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMFAnchoredSearchManager;
  result = -[EMFAnchoredSearchManager init](&v5, sel_init);
  if (result)
    result->_localeData = (EMFEmojiLocaleData *)a3;
  return result;
}

- (EMFAnchoredSearchAnchorsLoader)anchorsLoader
{
  EMFAnchoredSearchAnchorsLoader *anchorsLoader;
  EMFAnchoredSearchAnchorsLoader *v3;
  EMFAnchoredSearchAnchorsLoader *v5;
  void *v6;
  void *v7;
  EMFAnchoredSearchAnchorsLoader *v8;
  EMFAnchoredSearchAnchorsLoader *v9;
  EMFAnchoredSearchAnchorsLoader *v10;

  anchorsLoader = self->_anchorsLoader;
  if (anchorsLoader)
  {
    v3 = anchorsLoader;
  }
  else
  {
    v5 = [EMFAnchoredSearchAnchorsLoader alloc];
    -[EMFAnchoredSearchManager localeData](self, "localeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EMFAnchoredSearchAnchorsLoader initWithLocaleIdentifier:](v5, "initWithLocaleIdentifier:", v7);

    v9 = self->_anchorsLoader;
    self->_anchorsLoader = v8;
    v10 = v8;

    v3 = self->_anchorsLoader;
  }
  return v3;
}

- (NSArray)localizedLeftHandAnchors
{
  void *v2;
  void *v3;

  -[EMFAnchoredSearchManager anchorsLoader](self, "anchorsLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftHandAnchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)localizedRightHandAnchors
{
  void *v2;
  void *v3;

  -[EMFAnchoredSearchManager anchorsLoader](self, "anchorsLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightHandAnchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  id v17;

  v17 = a3;
  v8 = a5;
  -[EMFAnchoredSearchManager localizedLeftHandAnchors](self, "localizedLeftHandAnchors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[EMFAnchoredSearchManager localizedLeftHandAnchors](self, "localizedLeftHandAnchors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  -[EMFAnchoredSearchManager localizedRightHandAnchors](self, "localizedRightHandAnchors");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!v11)
      goto LABEL_16;
    goto LABEL_13;
  }
  v13 = (void *)v12;
  -[EMFAnchoredSearchManager localizedRightHandAnchors](self, "localizedRightHandAnchors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
    v16 = v11;
  else
    v16 = 0;
  if (v16)
  {
    -[EMFAnchoredSearchManager _enumerateAnchoredReplacementCandidatesForContextOmnidirectional:withOptions:usingBlock:](self, "_enumerateAnchoredReplacementCandidatesForContextOmnidirectional:withOptions:usingBlock:", v17, a4, v8);
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_13:
    -[EMFAnchoredSearchManager _enumerateAnchoredReplacementCandidatesForContextLeft:withOptions:usingBlock:](self, "_enumerateAnchoredReplacementCandidatesForContextLeft:withOptions:usingBlock:", v17, a4, v8);
    goto LABEL_16;
  }
  if (v15)
    -[EMFAnchoredSearchManager _enumerateAnchoredReplacementCandidatesForContextRight:withOptions:usingBlock:](self, "_enumerateAnchoredReplacementCandidatesForContextRight:withOptions:usingBlock:", v17, a4, v8);
LABEL_16:

}

- (void)_enumerateAnchoredReplacementCandidatesForContextLeft:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  EMFContextBuilderLeftHand *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = objc_alloc_init(EMFContextBuilderLeftHand);
  v10 = objc_msgSend(v7, "length");
  -[EMFAnchoredSearchManager localizedLeftHandAnchors](self, "localizedLeftHandAnchors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E66FA1A8;
  v14[4] = self;
  v12 = v7;
  v15 = v12;
  v17 = v18;
  v13 = v8;
  v16 = v13;
  -[EMFContextBuilderLeftHand enumerateWindowsForContext:range:searchAnchors:usingBlock:](v9, "enumerateWindowsForContext:range:searchAnchors:usingBlock:", v12, 0, v10, v11, v14);

  _Block_object_dispose(v18, 8);
}

void __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1[4], "localeData");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "emojiLocaleDataRef");
  v3 = a1[5];
  v4 = a1[6];
  CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();

}

void __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  CFIndex v10;
  uint64_t v11;
  uint64_t CharacterAtIndex;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsIndexesInRange:") & 1) == 0)
  {
    v10 = a3 + a4;
    v11 = *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 56);
    if (a3 + a4 == v11
      || v10 == v11 - 1
      && (CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 32), v10),
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(CharacterAtIndex) = objc_msgSend(v13, "characterIsMember:", CharacterAtIndex),
          v13,
          (_DWORD)CharacterAtIndex))
    {
      +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v14, "mutableCopy");

      v15 = *(_QWORD *)(a1 + 72) - a3 + *(_QWORD *)(a1 + 80);
      if ((unint64_t)objc_msgSend(v16, "count") >= 2)
        objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_11);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsIndexesInRange:", a3, v15) & 1) == 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndexesInRange:", a3, v15);
        *a5 = 1;
      }

    }
  }
}

int64_t __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[EMFQueryResultSorter compareEmojiTokenGenderInclusiveFirst:withOtherToken:](EMFQueryResultSorter, "compareEmojiTokenGenderInclusiveFirst:withOtherToken:", a2, a3);
}

- (void)_enumerateAnchoredReplacementCandidatesForContextRight:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  EMFContextBuilderRightHand *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = objc_alloc_init(EMFContextBuilderRightHand);
  v10 = objc_msgSend(v7, "length");
  -[EMFAnchoredSearchManager localizedRightHandAnchors](self, "localizedRightHandAnchors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E66FA1A8;
  v14[4] = self;
  v12 = v7;
  v15 = v12;
  v17 = v18;
  v13 = v8;
  v16 = v13;
  -[EMFContextBuilderRightHand enumerateWindowsForContext:range:searchAnchors:usingBlock:](v9, "enumerateWindowsForContext:range:searchAnchors:usingBlock:", v12, 0, v10, v11, v14);

  _Block_object_dispose(v18, 8);
}

void __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1[4], "localeData");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "emojiLocaleDataRef");
  v3 = a1[5];
  v4 = a1[6];
  CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();

}

void __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  CFIndex v10;
  uint64_t CharacterAtIndex;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsIndexesInRange:") & 1) == 0)
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (a3 == v10
      || a3 == v10 + 1
      && (CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 32), v10),
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(CharacterAtIndex) = objc_msgSend(v12, "characterIsMember:", CharacterAtIndex),
          v12,
          (_DWORD)CharacterAtIndex))
    {
      +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v13, "mutableCopy");

      v14 = *(_QWORD *)(a1 + 72);
      v15 = a3 + a4 - v14;
      if ((unint64_t)objc_msgSend(v16, "count") >= 2)
        objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_9);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndexesInRange:", v14, v15);
      *a5 = 1;

    }
  }
}

int64_t __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[EMFQueryResultSorter compareEmojiTokenGenderInclusiveFirst:withOtherToken:](EMFQueryResultSorter, "compareEmojiTokenGenderInclusiveFirst:withOtherToken:", a2, a3);
}

- (void)_enumerateAnchoredReplacementCandidatesForContextOmnidirectional:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[EMFAnchoredSearchManager _enumerateAnchoredReplacementCandidatesForContextLeft:withOptions:usingBlock:](self, "_enumerateAnchoredReplacementCandidatesForContextLeft:withOptions:usingBlock:", v9, a4, v8);
  -[EMFAnchoredSearchManager _enumerateAnchoredReplacementCandidatesForContextRight:withOptions:usingBlock:](self, "_enumerateAnchoredReplacementCandidatesForContextRight:withOptions:usingBlock:", v9, a4, v8);

}

- (EMFEmojiLocaleData)localeData
{
  return self->_localeData;
}

- (void)setLocaleData:(id)a3
{
  self->_localeData = (EMFEmojiLocaleData *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorsLoader, 0);
}

@end
