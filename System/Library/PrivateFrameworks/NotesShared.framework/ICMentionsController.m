@implementation ICMentionsController

- (void)updateMentionsAssociations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  ICMentionsParticipantNode *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id contactsRequestBlock;
  NSObject *v29;
  OS_dispatch_queue *v30;
  OS_dispatch_queue *contactsRequestQueue;
  dispatch_block_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  _QWORD block[4];
  id v40;
  uint64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *(*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  id location;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICMentionsController updateMentionsAssociations]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (-[ICMentionsController allowsMentions](self, "allowsMentions"))
  {
    -[ICMentionsController note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serverShareCheckingParent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v4;
    objc_msgSend(v4, "ic_acceptedParticipants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMentionsController setMaxNameLength:](self, "setMaxNameLength:", 0);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICMentionsController setParticipantDictionary:](self, "setParticipantDictionary:", v6);

    v7 = objc_alloc_init(ICMentionsParticipantNode);
    -[ICMentionsController setParticipantTree:](self, "setParticipantTree:", v7);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMentionsController setParticipantRecordNames:](self, "setParticipantRecordNames:", v8);

    v9 = (void *)MEMORY[0x1E0C99E20];
    v10 = objc_msgSend(v5, "count");
    objc_msgSend(v9, "setWithCapacity:", objc_msgSend(MEMORY[0x1E0C95130], "ic_mentionTokensPerParticipant") * v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMentionsController setParticipantNames:](self, "setParticipantNames:", v11);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v13)
    {
      v14 = v13;
      obj = v12;
      v38 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v38)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v16, "ic_mentionTokens");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v51;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v51 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                v24 = (void *)MEMORY[0x1C3B7AC74]();
                -[ICMentionsController associateParticipant:withKey:](self, "associateParticipant:withKey:", v16, v23);
                v25 = objc_msgSend(v23, "length");
                v26 = -[ICMentionsController maxNameLength](self, "maxNameLength");
                if (v25 <= v26)
                  v27 = v26;
                else
                  v27 = v25;
                -[ICMentionsController setMaxNameLength:](self, "setMaxNameLength:", v27);
                objc_autoreleasePoolPop(v24);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v20);
          }

        }
        v12 = obj;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v14);
    }

    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_28;
    if (self->_contactsRequestQueue)
    {
      contactsRequestBlock = self->_contactsRequestBlock;
      if (!contactsRequestBlock)
      {
LABEL_27:
        objc_initWeak(&location, self);
        v43 = 0;
        v44 = &v43;
        v45 = 0x3032000000;
        v46 = __Block_byref_object_copy__77;
        v47 = __Block_byref_object_dispose__78;
        block[0] = MEMORY[0x1E0C809B0];
        v48 = 0;
        block[2] = __50__ICMentionsController_updateMentionsAssociations__block_invoke;
        block[3] = &unk_1E76C9C90;
        block[1] = 3221225472;
        objc_copyWeak(&v42, &location);
        v41 = &v43;
        v40 = v12;
        v32 = dispatch_block_create((dispatch_block_flags_t)0, block);
        v33 = self->_contactsRequestBlock;
        self->_contactsRequestBlock = v32;

        v34 = _Block_copy(self->_contactsRequestBlock);
        v35 = (void *)v44[5];
        v44[5] = (uint64_t)v34;

        dispatch_async((dispatch_queue_t)self->_contactsRequestQueue, self->_contactsRequestBlock);
        objc_destroyWeak(&v42);
        _Block_object_dispose(&v43, 8);

        objc_destroyWeak(&location);
LABEL_28:
        -[ICMentionsController addAllKeywordToParticipantTree](self, "addAllKeywordToParticipantTree");

        return;
      }
      dispatch_block_cancel(contactsRequestBlock);
      v29 = self->_contactsRequestBlock;
      self->_contactsRequestBlock = 0;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.contactsRequests", v29);
      contactsRequestQueue = self->_contactsRequestQueue;
      self->_contactsRequestQueue = v30;

    }
    goto LABEL_27;
  }
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void)setContactsChangedObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_contactsChangedObserverToken, a3);
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

- (ICMentionsController)initWithNote:(id)a3
{
  id v4;
  ICMentionsController *v5;
  ICMentionsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICMentionsController;
  v5 = -[ICMentionsController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_note, v4);
    -[ICMentionsController updateMentionsAssociations](v6, "updateMentionsAssociations");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICMentionsController registerForContactsChangedNotification](v6, "registerForContactsChangedNotification");
  }

  return v6;
}

- (NSObject)contactsChangedObserverToken
{
  return self->_contactsChangedObserverToken;
}

- (BOOL)allowsMentions
{
  void *v3;
  void *v4;
  int v5;

  -[ICMentionsController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSharedViaICloud"))
  {
    -[ICMentionsController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSharedReadOnly") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICMentionsController contactsChangedObserverToken](self, "contactsChangedObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMentionsController contactsChangedObserverToken](self, "contactsChangedObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[ICMentionsController setContactsChangedObserverToken:](self, "setContactsChangedObserverToken:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ICMentionsController;
  -[ICMentionsController dealloc](&v6, sel_dealloc);
}

- (id)checkForMentionsInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  void *v13;
  unint64_t v14;
  ICMentionCheckResults *v15;
  ICMentionCheckResults *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ICMentionCheckResults *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  _QWORD v33[5];
  id v34;
  ICMentionCheckResults *v35;
  _QWORD *v36;
  _QWORD *v37;
  BOOL v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  __int128 v42;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v12 = a3;
  if (-[ICMentionsController allowsMentions](self, "allowsMentions")
    && (objc_msgSend(v12, "string"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        v10 + v9 <= v14))
  {
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3010000000;
    v41[3] = &unk_1BDC8BD37;
    v42 = xmmword_1BDC15B20;
    v16 = objc_alloc_init(ICMentionCheckResults);
    v17 = (void *)objc_opt_class();
    objc_msgSend(v12, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isBeginningExplicitMentionAtSelectionRange:inString:languageHasSpaces:", location, length, v18, v6);

    if (v19)
    {
      -[ICMentionCheckResults setRangeOfMention:](v16, "setRangeOfMention:", location - 1, 1);
      -[ICMentionCheckResults setIsPartialMention:](v16, "setIsPartialMention:", 1);
      -[ICMentionCheckResults setIsExplicitMention:](v16, "setIsExplicitMention:", 1);
      -[ICMentionCheckResults setIsAllMention:](v16, "setIsAllMention:", 1);
      -[ICMentionsController note](self, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverShareCheckingParent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v21, "ic_acceptedParticipants");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMentionCheckResults setMatchingParticipants:](v16, "setMatchingParticipants:", v24);

      -[ICMentionCheckResults setMentionString:](v16, "setMentionString:", &stru_1E76DB108);
      v15 = v16;

    }
    else
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__15;
      v39[4] = __Block_byref_object_dispose__15;
      -[ICMentionsController participantTree](self, "participantTree");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __90__ICMentionsController_checkForMentionsInString_inRange_selectionRange_languageHasSpaces___block_invoke;
      v33[3] = &unk_1E76C79C8;
      v36 = v39;
      v37 = v41;
      v33[4] = self;
      v34 = v12;
      v38 = v6;
      v26 = v16;
      v35 = v26;
      objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", v10, v9, 2, v33);

      if (-[ICMentionCheckResults isExplicitMention](v26, "isExplicitMention"))
      {
        -[ICMentionCheckResults rangeOfMention](v26, "rangeOfMention");
        v27 = -[ICMentionCheckResults rangeOfMention](v26, "rangeOfMention");
        -[ICMentionCheckResults rangeOfMention](v26, "rangeOfMention");
        -[ICMentionCheckResults setRangeOfMention:](v26, "setRangeOfMention:", v27 - 1, v28 + 1);
      }
      if (-[ICMentionCheckResults rangeOfMention](v26, "rangeOfMention") == 0x7FFFFFFFFFFFFFFFLL
        || (-[ICMentionCheckResults rangeOfMention](v26, "rangeOfMention"), !v29))
      {
        v15 = 0;
      }
      else
      {
        -[ICMentionCheckResults matchingParticipants](v26, "matchingParticipants");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count"))
        {

        }
        else
        {
          v31 = -[ICMentionCheckResults isAllMention](v26, "isAllMention");

          if (!v31)
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "results.matchingParticipants.count > 0 || results.isAllMention", "-[ICMentionsController checkForMentionsInString:inRange:selectionRange:languageHasSpaces:]", 1, 0, CFSTR("No matching participants found for mention"));
        }
        v15 = v26;
      }

      _Block_object_dispose(v39, 8);
    }

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __90__ICMentionsController_checkForMentionsInString_inRange_selectionRange_languageHasSpaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;

  v52 = a2;
  objc_msgSend(v52, "ic_tokenSafeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v7, "ic_substringWithRange:", v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        break;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v12);
      v13 = objc_msgSend(v10, "length");
      if (v13 <= 1)
        v14 = 1;
      else
        v14 = v13;
      v9 += v14;

      v8 = v12;
      if (v9 >= objc_msgSend(v7, "length"))
        goto LABEL_10;
    }
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = xmmword_1BDC15B20;
    objc_msgSend(*(id *)(a1 + 32), "participantTree");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "children");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_34;
LABEL_10:
    v19 = objc_msgSend((id)objc_opt_class(), "range:appendingSubstringRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3, a4);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    *(_QWORD *)(v20 + 32) = v19;
    *(_QWORD *)(v20 + 40) = v21;
    v22 = (void *)objc_opt_class();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v22, "range:hasValidPrefixCharacterForString:languageHasSpaces:", *(_QWORD *)(v23 + 32), *(_QWORD *)(v23 + 40), v24, *(unsigned __int8 *)(a1 + 72));

    if (!(_DWORD)v22)
      goto LABEL_33;
    v25 = (void *)objc_opt_class();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "range:isPrefixedWithAtForString:", *(_QWORD *)(v26 + 32), *(_QWORD *)(v26 + 40), v27);

    objc_msgSend(*(id *)(a1 + 48), "setRangeOfMention:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setIsExplicitMention:", v28);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setMentionString:", v30);

    v31 = (void *)objc_opt_class();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = objc_msgSend(v31, "range:hasValidPostfixCharacterForString:", *(_QWORD *)(v32 + 32), *(_QWORD *)(v32 + 40), v33);

    if ((_DWORD)v31)
    {
      objc_msgSend(v12, "participants");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
      {

LABEL_26:
        objc_msgSend(*(id *)(a1 + 48), "setIsPartialMention:", 0);
        objc_msgSend(*(id *)(a1 + 48), "setIsAllMention:", objc_msgSend(v12, "isAll"));
LABEL_29:
        objc_msgSend(v12, "participants");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        v47 = v46;
        v48 = (void *)objc_msgSend(v46, "copy");
        objc_msgSend(*(id *)(a1 + 48), "setMatchingParticipants:", v48);

LABEL_33:
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v50 = *(void **)(v49 + 40);
        *(_QWORD *)(v49 + 40) = v12;
        v51 = v12;

        goto LABEL_34;
      }
      if (objc_msgSend(v12, "isAll"))
      {
        objc_msgSend(v12, "participants");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (!v36)
          goto LABEL_26;
      }
      else
      {

      }
    }
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v12, "children");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (!v38)
        goto LABEL_26;
    }
    if ((v28 & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        if ((objc_msgSend(v52, "ic_containsNonWhitespaceCharacters") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "rangeOfMention");
          if (v39 >= 2)
          {
            objc_msgSend(v12, "possibleParticipants");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "count");

            if (v41 == 1)
            {
              v42 = objc_msgSend(*(id *)(a1 + 48), "rangeOfMention");
              objc_msgSend(*(id *)(a1 + 48), "rangeOfMention");
              objc_msgSend(*(id *)(a1 + 48), "setRangeOfMention:", v42, v43 - 1);
              objc_msgSend(*(id *)(a1 + 48), "setIsPartialMention:", 0);
LABEL_31:
              objc_msgSend(v12, "possibleParticipants");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend(v12, "participants");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

      if (v45)
      {
        objc_msgSend(*(id *)(a1 + 48), "setIsPartialMention:", 0);
        goto LABEL_29;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setIsPartialMention:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setIsAllMention:", objc_msgSend(v12, "isPossibleAll"));
    goto LABEL_31;
  }
LABEL_34:

}

void __50__ICMentionsController_updateMentionsAssociations__block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  if (WeakRetained && v6 == (void *)WeakRetained[2])
  {
    objc_msgSend(WeakRetained, "fetchContactNamesForParticipants:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v9, v2);
    v8 = v7;
    performBlockOnMainThread();

    objc_destroyWeak(&v9);
  }
  else
  {
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __50__ICMentionsController_updateMentionsAssociations__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v1 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40) == WeakRetained[2])
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(v1 + 32);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v6 = v1;
          objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v24 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v12, "ic_tokenSafeText");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "associateParticipant:withKey:", v5, v13);

                v14 = objc_msgSend(v12, "length");
                v15 = objc_msgSend(v3, "maxNameLength");
                if (v14 <= v15)
                  v16 = v15;
                else
                  v16 = v14;
                objc_msgSend(v3, "setMaxNameLength:", v16);
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v9);
          }

          v1 = v6;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

    v17 = (void *)v3[2];
    v3[2] = 0;

  }
  v18 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

- (void)associateParticipant:(id)a3 withKey:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[ICMentionsController participantNames](self, "participantNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__15;
    v26 = __Block_byref_object_dispose__15;
    -[ICMentionsController participantTree](self, "participantTree");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "length");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__ICMentionsController_associateParticipant_withKey___block_invoke;
    v19[3] = &unk_1E76C79F0;
    v21 = &v22;
    v11 = v6;
    v20 = v11;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v19);
    objc_msgSend((id)v23[5], "addParticipant:", v11);
    objc_msgSend(v11, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userRecordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      -[ICMentionsController participantRecordNames](self, "participantRecordNames");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
    -[ICMentionsController participantDictionary](self, "participantDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v17, "addObject:", v11);
    else
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v11, 0);
    -[ICMentionsController participantDictionary](self, "participantDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v17, v8);

    _Block_object_dispose(&v22, 8);
  }

}

void __53__ICMentionsController_associateParticipant_withKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICMentionsParticipantNode *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (ICMentionsParticipantNode *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = objc_alloc_init(ICMentionsParticipantNode);
    -[ICMentionsParticipantNode setKey:](v4, "setKey:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addChild:", v4);
  }
  -[ICMentionsParticipantNode addPossibleParticipant:](v4, "addPossibleParticipant:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (id)allKeyword
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All"), CFSTR("All"), 0, 1);
}

+ (id)allUserRecordName
{
  return (id)objc_msgSend(CFSTR("all"), "ic_tokenSafeText");
}

- (void)addAllKeywordToParticipantTree
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend((id)objc_opt_class(), "allKeyword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_tokenSafeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  -[ICMentionsController participantTree](self, "participantTree");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ICMentionsController_addAllKeywordToParticipantTree__block_invoke;
  v9[3] = &unk_1E76C9CB8;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v9);
  objc_msgSend((id)v11[5], "setIsAll:", 1);
  v6 = objc_msgSend(v4, "length");
  v7 = -[ICMentionsController maxNameLength](self, "maxNameLength");
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  -[ICMentionsController setMaxNameLength:](self, "setMaxNameLength:", v8);
  _Block_object_dispose(&v10, 8);

}

void __54__ICMentionsController_addAllKeywordToParticipantTree__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICMentionsParticipantNode *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (ICMentionsParticipantNode *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = objc_alloc_init(ICMentionsParticipantNode);
    -[ICMentionsParticipantNode setKey:](v4, "setKey:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addChild:", v4);
  }
  -[ICMentionsParticipantNode setIsPossibleAll:](v4, "setIsPossibleAll:", 1);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)participantsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "ic_tokenSafeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "allKeyword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_tokenSafeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[ICMentionsController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverShareCheckingParent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "participants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICMentionsController participantDictionary](self, "participantDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_tokenSafeText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "copy");

  }
  return v12;
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

+ (BOOL)isBeginningExplicitMentionAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  int v13;
  int v14;

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
      v12 = objc_msgSend(v10, "characterAtIndex:", location - 1) == 64
         || objc_msgSend(v10, "characterAtIndex:", location - 1) == 65312;
      if (location >= objc_msgSend(v10, "length"))
        v13 = 1;
      else
        v13 = objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", location, 0, v10);
      v14 = v13 & objc_msgSend(a1, "range:hasValidPrefixCharacterForString:languageHasSpaces:", location - 1, 0, v10, v5);
      if (v12)
        v11 = v14;
      else
        v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4
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
  v9 = !v7
    && v8 < objc_msgSend(v5, "length")
    && (objc_msgSend(v6, "characterAtIndex:", v8) == 64
     || objc_msgSend(v6, "characterAtIndex:", v8) == 65312);

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  int v10;
  uint64_t v11;
  char v12;
  unint64_t v13;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = objc_msgSend(a1, "range:isPrefixedWithAtForString:", location, length, v9);
  v11 = -2;
  if (!v10)
    v11 = -1;
  v12 = 1;
  if (location)
  {
    v13 = v11 + location;
    if ((v13 & 0x8000000000000000) == 0)
    {
      if (v13 >= objc_msgSend(v9, "length"))
        v12 = 0;
      else
        v12 = objc_msgSend(a1, "isValidPrefixCharacter:languageHasSpaces:", objc_msgSend(v9, "characterAtIndex:", v13), v5);
    }
  }

  return v12;
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

- (ICMentionsKeyboardDelegate)mentionsKeyboardDelegate
{
  return (ICMentionsKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_mentionsKeyboardDelegate);
}

- (void)setMentionsKeyboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsKeyboardDelegate, a3);
}

- (ICMentionsKeyboardDelegate)mentionsTableKeyboardDelegate
{
  return (ICMentionsKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_mentionsTableKeyboardDelegate);
}

- (void)setMentionsTableKeyboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsTableKeyboardDelegate, a3);
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

- (ICTableColumnTextView)tableTextView
{
  return (ICTableColumnTextView *)objc_loadWeakRetained((id *)&self->_tableTextView);
}

- (void)setTableTextView:(id)a3
{
  objc_storeWeak((id *)&self->_tableTextView, a3);
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

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (ICMentionsAnalyticsDelegate)analyticsDelegate
{
  return (ICMentionsAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (NSMutableDictionary)participantDictionary
{
  return self->_participantDictionary;
}

- (void)setParticipantDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_participantDictionary, a3);
}

- (NSMutableSet)participantRecordNames
{
  return self->_participantRecordNames;
}

- (void)setParticipantRecordNames:(id)a3
{
  objc_storeStrong((id *)&self->_participantRecordNames, a3);
}

- (NSMutableSet)participantNames
{
  return self->_participantNames;
}

- (void)setParticipantNames:(id)a3
{
  objc_storeStrong((id *)&self->_participantNames, a3);
}

- (ICMentionsParticipantNode)participantTree
{
  return self->_participantTree;
}

- (void)setParticipantTree:(id)a3
{
  objc_storeStrong((id *)&self->_participantTree, a3);
}

- (unint64_t)maxNameLength
{
  return self->_maxNameLength;
}

- (void)setMaxNameLength:(unint64_t)a3
{
  self->_maxNameLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantTree, 0);
  objc_storeStrong((id *)&self->_participantNames, 0);
  objc_storeStrong((id *)&self->_participantRecordNames, 0);
  objc_storeStrong((id *)&self->_participantDictionary, 0);
  objc_storeStrong((id *)&self->_contactsChangedObserverToken, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_tableTextView);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_mentionsTableKeyboardDelegate);
  objc_destroyWeak((id *)&self->_mentionsKeyboardDelegate);
  objc_storeStrong(&self->_contactsRequestBlock, 0);
  objc_storeStrong((id *)&self->_contactsRequestQueue, 0);
}

@end
