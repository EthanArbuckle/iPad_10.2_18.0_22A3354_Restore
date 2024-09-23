@implementation ICHashtagController

- (void)updateHashtagsAssociations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ICHashtagsNode *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[ICHashtagController allowsHashtag](self, "allowsHashtag"))
  {
    -[ICHashtagController note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICHashtag allVisibleHashtagsInContext:](ICHashtag, "allVisibleHashtagsInContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICHashtagSuggestionItem suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:](ICHashtagSuggestionItem, "suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHashtagController setMaxNameLength:](self, "setMaxNameLength:", 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICHashtagController setHashtagSuggestionsDictionary:](self, "setHashtagSuggestionsDictionary:", v8);

    v9 = objc_alloc_init(ICHashtagsNode);
    -[ICHashtagController setHashtagsTree:](self, "setHashtagsTree:", v9);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 4 * objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHashtagController setHashtagsNames:](self, "setHashtagsNames:", v10);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "displayText", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ic_tokenSafeText");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICHashtagController associateHashtagSuggestion:withKey:](self, "associateHashtagSuggestion:withKey:", v16, v18);

          objc_msgSend(v16, "displayText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");

          v21 = -[ICHashtagController maxNameLength](self, "maxNameLength");
          if (v20 <= v21)
            v22 = v21;
          else
            v22 = v20;
          -[ICHashtagController setMaxNameLength:](self, "setMaxNameLength:", v22);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

  }
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void)setMaxNameLength:(unint64_t)a3
{
  self->_maxNameLength = a3;
}

- (void)setHashtagsTree:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagsTree, a3);
}

- (void)setHashtagsNames:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagsNames, a3);
}

- (void)setHashtagSuggestionsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagSuggestionsDictionary, a3);
}

- (void)setAttachmentInsertionController:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentInsertionController, a3);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (ICHashtagController)initWithNote:(id)a3
{
  id v4;
  ICHashtagController *v5;
  ICHashtagController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICHashtagController;
  v5 = -[ICHashtagController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_note, v4);
    -[ICHashtagController updateHashtagsAssociations](v6, "updateHashtagsAssociations");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_crossAppHashtagDidChange_, CFSTR("ICCrossAppHashtagDisplayTextUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel_accountWasDeleted_, CFSTR("ICAccountWasDeletedNotification"), 0);

  }
  return v6;
}

- (BOOL)allowsHashtag
{
  void *v3;
  int v4;
  void *v5;

  -[ICHashtagController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[ICHashtagController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSharedReadOnly") ^ 1;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICHashtagController;
  -[ICHashtagController dealloc](&v4, sel_dealloc);
}

- (id)checkForHashtagInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  void *v13;
  unint64_t v14;
  ICHashtagsCheckResults *v15;
  ICHashtagsCheckResults *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ICHashtagsCheckResults *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  ICHashtagsCheckResults *v36;
  _QWORD *v37;
  _QWORD *v38;
  BOOL v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  __int128 v43;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v12 = a3;
  if (-[ICHashtagController allowsHashtag](self, "allowsHashtag")
    && (objc_msgSend(v12, "string"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        v10 + v9 <= v14))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3010000000;
    v42[3] = &unk_1BDC8BD37;
    v43 = xmmword_1BDC15B20;
    v16 = objc_alloc_init(ICHashtagsCheckResults);
    v17 = (void *)objc_opt_class();
    objc_msgSend(v12, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isBeginningHashtagAtSelectionRange:inString:languageHasSpaces:", location, length, v18, v6);

    if (v19)
    {
      -[ICHashtagsCheckResults setRangeOfHashtag:](v16, "setRangeOfHashtag:", location - 1, 1);
      -[ICHashtagController note](self, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICHashtag allVisibleHashtagsInContext:](ICHashtag, "allVisibleHashtagsInContext:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICHashtagSuggestionItem suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:](ICHashtagSuggestionItem, "suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICHashtagsCheckResults setMatchingHashtagSuggestions:](v16, "setMatchingHashtagSuggestions:", v25);

      v15 = v16;
    }
    else
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x3032000000;
      v40[3] = __Block_byref_object_copy__2;
      v40[4] = __Block_byref_object_dispose__2;
      -[ICHashtagController hashtagsTree](self, "hashtagsTree");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __88__ICHashtagController_checkForHashtagInString_inRange_selectionRange_languageHasSpaces___block_invoke;
      v34[3] = &unk_1E76C79C8;
      v37 = v40;
      v38 = v42;
      v34[4] = self;
      v35 = v12;
      v39 = v6;
      v27 = v16;
      v36 = v27;
      objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", v10, v9, 2, v34);

      if (-[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag") != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag");
        v28 = -[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag");
        -[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag");
        -[ICHashtagsCheckResults setRangeOfHashtag:](v27, "setRangeOfHashtag:", v28 - 1, v29 + 1);
      }
      if (-[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag") == 0x7FFFFFFFFFFFFFFFLL
        || (-[ICHashtagsCheckResults rangeOfHashtag](v27, "rangeOfHashtag"), !v30))
      {
        v15 = 0;
      }
      else
      {
        -[ICHashtagsCheckResults matchingHashtagSuggestions](v27, "matchingHashtagSuggestions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (!v32)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "results.matchingHashtagSuggestions.count > 0", "-[ICHashtagController checkForHashtagInString:inRange:selectionRange:languageHasSpaces:]", 1, 0, CFSTR("No matching hashtags"));
        v15 = v27;
      }

      _Block_object_dispose(v40, 8);
    }

    _Block_object_dispose(v42, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __88__ICHashtagController_checkForHashtagInString_inRange_selectionRange_languageHasSpaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;

  objc_msgSend(a2, "ic_tokenSafeText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v35, "length");
  v8 = v35;
  if (v7)
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      objc_msgSend(v8, "ic_substringWithRange:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        break;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
      v14 = objc_msgSend(v11, "length");
      if (v14 <= 1)
        v15 = 1;
      else
        v15 = v14;
      v10 += v15;

      v16 = objc_msgSend(v35, "length");
      v9 = v13;
      v8 = v35;
      if (v10 >= v16)
        goto LABEL_10;
    }
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = xmmword_1BDC15B20;
    objc_msgSend(*(id *)(a1 + 32), "hashtagsTree");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v35;
    if (!v13)
      goto LABEL_14;
LABEL_10:
    v21 = objc_msgSend((id)objc_opt_class(), "range:appendingSubstringRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3, a4);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    *(_QWORD *)(v22 + 32) = v21;
    *(_QWORD *)(v22 + 40) = v23;
    v24 = (void *)objc_opt_class();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v24, "range:hasValidPrefixCharacterForString:languageHasSpaces:", *(_QWORD *)(v25 + 32), *(_QWORD *)(v25 + 40), v26, *(unsigned __int8 *)(a1 + 72));

    if ((_DWORD)v24)
    {
      v27 = (void *)objc_opt_class();
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      objc_msgSend(*(id *)(a1 + 40), "string");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = objc_msgSend(v27, "range:isPrefixedWithHashtagForString:", *(_QWORD *)(v28 + 32), *(_QWORD *)(v28 + 40), v29);

      if ((_DWORD)v27)
      {
        objc_msgSend(*(id *)(a1 + 48), "setRangeOfHashtag:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        objc_msgSend(v13, "possibleHashtagSuggestions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(*(id *)(a1 + 48), "setMatchingHashtagSuggestions:", v31);

      }
    }
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v13;
    v34 = v13;

    v8 = v35;
  }
LABEL_14:

}

- (void)crossAppHashtagDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICHashtagController_crossAppHashtagDidChange___block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __48__ICHashtagController_crossAppHashtagDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHashtagsAssociations");
}

- (void)associateHashtagSuggestion:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[ICHashtagController hashtagsNames](self, "hashtagsNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__2;
    v22 = __Block_byref_object_dispose__2;
    -[ICHashtagController hashtagsTree](self, "hashtagsTree");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__ICHashtagController_associateHashtagSuggestion_withKey___block_invoke;
    v15[3] = &unk_1E76C79F0;
    v17 = &v18;
    v11 = v6;
    v16 = v11;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v15);
    objc_msgSend((id)v19[5], "addHashtagSuggestion:", v11);
    -[ICHashtagController hashtagSuggestionsDictionary](self, "hashtagSuggestionsDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "addObject:", v11);
    else
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v11, 0);
    -[ICHashtagController hashtagSuggestionsDictionary](self, "hashtagSuggestionsDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v8);

    _Block_object_dispose(&v18, 8);
  }

}

void __58__ICHashtagController_associateHashtagSuggestion_withKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICHashtagsNode *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (ICHashtagsNode *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = objc_alloc_init(ICHashtagsNode);
    -[ICHashtagsNode setKey:](v4, "setKey:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addChild:", v4);
  }
  -[ICHashtagsNode addPossibleHashtagSuggestion:](v4, "addPossibleHashtagSuggestion:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)hashtagSuggestionsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICHashtagController hashtagSuggestionsDictionary](self, "hashtagSuggestionsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_tokenSafeText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (_NSRange)rangeOfLastCharacterInRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = a3.length != 0;
  if (a3.length)
    v4 = a3.length + a3.location - 1;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v3;
  result.location = v4;
  return result;
}

+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger v5;
  _NSRange result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    location = a4.location;
  else
    location = a3.location;
  v5 = a4.location + a4.length - location;
  result.length = v5;
  result.location = location;
  return result;
}

+ (BOOL)isBeginningHashtagAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  char v18;
  void *v19;
  __int16 v20;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (location && !length)
  {
    if (location - 1 >= objc_msgSend(v9, "length"))
    {
      v11 = 0;
    }
    else
    {
      v12 = objc_msgSend(v10, "characterAtIndex:", location - 1);
      v20 = v12;
      v18 = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v20, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99870], 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "ic_hashtagCharacterString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v12 == 35)
        v15 = 1;
      if (location < objc_msgSend(v10, "length"))
        v18 = objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", location, 0, v10);
      v16 = objc_msgSend(a1, "range:hasValidPrefixCharacterForString:languageHasSpaces:", location - 1, 0, v10, v5);
      if (v15)
        v11 = v18 & v16;
      else
        v11 = 0;

    }
  }

  return v11;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithHashtagForString:(id)a4
{
  int64_t location;
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;

  location = a3.location;
  v5 = a4;
  v6 = v5;
  v7 = location < 1;
  v8 = location - 1;
  v9 = !v7 && v8 < objc_msgSend(v5, "length") && objc_msgSend(v6, "characterAtIndex:", v8) == 35;

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5
{
  _BOOL8 v5;
  int64_t location;
  id v8;
  void *v9;
  unint64_t v10;
  char v11;

  v5 = a5;
  location = a3.location;
  v8 = a4;
  v9 = v8;
  if (location)
  {
    if (location < 1 || (v10 = location - 1, v10 >= objc_msgSend(v8, "length")))
      v11 = 0;
    else
      v11 = objc_msgSend(a1, "isValidPrefixCharacter:languageHasSpaces:", objc_msgSend(v9, "characterAtIndex:", v10), v5);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)isValidPrefixCharacter:(unsigned __int16)a3 languageHasSpaces:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  if (!a4)
    return 1;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "characterIsMember:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "characterIsMember:", v4);

  }
  return v6;
}

+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = v7;
  v9 = location + length;
  if (v9 < 0 || v9 >= (unint64_t)objc_msgSend(v7, "length"))
    v10 = 0;
  else
    v10 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v8, "characterAtIndex:", v9));

  return v10;
}

+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
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

+ (BOOL)shouldAutoConvertToTag
{
  void *v2;
  void *v3;
  char v4;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ICHashtagsShouldAutoConvertToTagDefaultsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (void)setShouldAutoConvertToTag:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", a3, CFSTR("ICHashtagsShouldAutoConvertToTagDefaultsKey"));
}

- (ICHashtagKeyboardDelegate)hashtagKeyboardDelegate
{
  return (ICHashtagKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_hashtagKeyboardDelegate);
}

- (void)setHashtagKeyboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hashtagKeyboardDelegate, a3);
}

- (ICHashtagKeyboardDelegate)hashtagTableKeyboardDelegate
{
  return (ICHashtagKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_hashtagTableKeyboardDelegate);
}

- (void)setHashtagTableKeyboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hashtagTableKeyboardDelegate, a3);
}

- (BOOL)isUpdatingKeyboard
{
  return self->_isUpdatingKeyboard;
}

- (void)setIsUpdatingKeyboard:(BOOL)a3
{
  self->_isUpdatingKeyboard = a3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)objc_loadWeakRetained((id *)&self->_attachmentInsertionController);
}

- (void)setNote:(id)a3
{
  objc_storeWeak((id *)&self->_note, a3);
}

- (_NSRange)editedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_editedRange.length;
  location = self->_editedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEditedRange:(_NSRange)a3
{
  self->_editedRange = a3;
}

- (ICTableColumnTextView)tableTextView
{
  return (ICTableColumnTextView *)objc_loadWeakRetained((id *)&self->_tableTextView);
}

- (void)setTableTextView:(id)a3
{
  objc_storeWeak((id *)&self->_tableTextView, a3);
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (ICHashtagAnalyticsDelegate)analyticsDelegate
{
  return (ICHashtagAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (NSMutableDictionary)hashtagSuggestionsDictionary
{
  return self->_hashtagSuggestionsDictionary;
}

- (NSMutableSet)hashtagsNames
{
  return self->_hashtagsNames;
}

- (ICHashtagsNode)hashtagsTree
{
  return self->_hashtagsTree;
}

- (unint64_t)maxNameLength
{
  return self->_maxNameLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtagsTree, 0);
  objc_storeStrong((id *)&self->_hashtagsNames, 0);
  objc_storeStrong((id *)&self->_hashtagSuggestionsDictionary, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_tableTextView);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_hashtagTableKeyboardDelegate);
  objc_destroyWeak((id *)&self->_hashtagKeyboardDelegate);
}

@end
