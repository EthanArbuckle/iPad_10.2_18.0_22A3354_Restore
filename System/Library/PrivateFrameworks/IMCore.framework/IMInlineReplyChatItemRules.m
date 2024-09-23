@implementation IMInlineReplyChatItemRules

- (IMInlineReplyChatItemRules)initWithChat:(id)a3 threadIdentifier:(id)a4
{
  id v6;
  IMInlineReplyChatItemRules *v7;
  IMInlineReplyChatItemRules *v8;
  void *v9;
  uint64_t OriginatorRange;
  uint64_t v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMInlineReplyChatItemRules;
  v7 = -[IMTranscriptChatItemRules _initWithChat:](&v13, sel__initWithChat_, a3);
  v8 = v7;
  if (v7)
  {
    -[IMInlineReplyChatItemRules setThreadIdentifier:](v7, "setThreadIdentifier:", v6);
    IMMessageThreadIdentifierGetOriginatorGUID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMInlineReplyChatItemRules setThreadOriginatorMessageGUID:](v8, "setThreadOriginatorMessageGUID:", v9);

    OriginatorRange = IMMessageThreadIdentifierGetOriginatorRange();
    -[IMInlineReplyChatItemRules setThreadOriginatorRange:](v8, "setThreadOriginatorRange:", OriginatorRange, v11);
  }

  return v8;
}

- (BOOL)_supportsContiguousChatItems
{
  return 1;
}

- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 messageItem:(id)a4
{
  return a3;
}

- (BOOL)_hasEarlierMessagesToLoad
{
  void *v3;
  void *v4;
  char v5;

  -[IMTranscriptChatItemRules inlineReplyController](self, "inlineReplyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[IMTranscriptChatItemRules inlineReplyController](self, "inlineReplyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasEarlierMessagesToLoad");

  return v5;
}

- (BOOL)_hasRecentMessagesToLoad
{
  void *v3;
  void *v4;
  char v5;

  -[IMTranscriptChatItemRules inlineReplyController](self, "inlineReplyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[IMTranscriptChatItemRules inlineReplyController](self, "inlineReplyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasRecentMessagesToLoad");

  return v5;
}

- (id)_filteredChatItemsForNewChatItems:(id)a3
{
  id v4;
  void (**v5)(void *, void *);
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[5];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A20B6D64;
  aBlock[3] = &unk_1E4720B40;
  aBlock[4] = self;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v4;
    v6 = v4;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      v24 = *(_QWORD *)v32;
      v25 = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v5[2](v5, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v7, "addObject:", v14);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v13;
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              v26 = v15;
              objc_msgSend(v15, "aggregateAttachmentParts");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v28;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v28 != v19)
                      objc_enumerationMutation(v16);
                    v5[2](v5, *(void **)(*((_QWORD *)&v27 + 1) + 8 * j));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v21)
                      objc_msgSend(v7, "addObject:", v21);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
                }
                while (v18);
              }

              v11 = v24;
              v8 = v25;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v10);
    }

    v4 = v23;
  }
  else
  {
    v5[2](v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)_shouldAppendServiceForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  return 0;
}

- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4
{
  return 0;
}

- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  return 0;
}

- (BOOL)_shouldAppendReplyCountIfNeeded
{
  return 0;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)threadOriginatorMessageGUID
{
  return self->_threadOriginatorMessageGUID;
}

- (void)setThreadOriginatorMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_NSRange)threadOriginatorRange
{
  _NSRange *p_threadOriginatorRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_threadOriginatorRange = &self->_threadOriginatorRange;
  location = self->_threadOriginatorRange.location;
  length = p_threadOriginatorRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setThreadOriginatorRange:(_NSRange)a3
{
  self->_threadOriginatorRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadOriginatorMessageGUID, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end
