@implementation NLLexiconCursor

- (NLLexiconCursor)initWithLexicon:(id)a3 cursor:(_LXCursor *)a4
{
  id v7;
  NLLexiconCursor *v8;
  NLLexiconCursor *v9;
  NLLexiconCursor *v10;
  objc_super v12;

  v7 = a3;
  v8 = 0;
  if (v7 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)NLLexiconCursor;
    v9 = -[NLLexiconCursor init](&v12, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_lexicon, a3);
      v10->_cursor = (_LXCursor *)CFRetain(a4);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (NLLexiconCursor)initWithLexicon:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  const void *RootCursor;
  uint64_t v9;
  NLLexiconCursor *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "lexicon"))
  {
    RootCursor = (const void *)LXLexiconCreateRootCursor();
    if (objc_msgSend(v7, "length") && RootCursor)
    {
      v9 = LXCursorCreateByAdvancing();
      CFRelease(RootCursor);
      RootCursor = (const void *)v9;
    }
  }
  else
  {
    RootCursor = 0;
  }
  v10 = -[NLLexiconCursor initWithLexicon:cursor:](self, "initWithLexicon:cursor:", v6, RootCursor);
  if (RootCursor)
    CFRelease(RootCursor);

  return v10;
}

- (void)dealloc
{
  _LXCursor *cursor;
  objc_super v4;

  cursor = self->_cursor;
  if (cursor)
    CFRelease(cursor);
  v4.receiver = self;
  v4.super_class = (Class)NLLexiconCursor;
  -[NLLexiconCursor dealloc](&v4, sel_dealloc);
}

- (id)cursorByAdvancingWithString:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  NLLexiconCursor *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length") && self->_cursor && (v5 = LXCursorCreateByAdvancing()) != 0)
  {
    v6 = (const void *)v5;
    v7 = -[NLLexiconCursor initWithLexicon:cursor:]([NLLexiconCursor alloc], "initWithLexicon:cursor:", self->_lexicon, v5);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasEntries
{
  _LXCursor *cursor;

  cursor = self->_cursor;
  if (cursor)
    LOBYTE(cursor) = LXCursorHasEntries() != 0;
  return (char)cursor;
}

- (BOOL)hasChildren
{
  _LXCursor *cursor;

  cursor = self->_cursor;
  if (cursor)
    LOBYTE(cursor) = LXCursorHasChildren() != 0;
  return (char)cursor;
}

- (double)prefixProbability
{
  double result;

  if (!self->_cursor)
    return -30.0;
  LXCursorPrefixProbability();
  return result;
}

- (double)terminationProbability
{
  double result;

  if (!self->_cursor)
    return -30.0;
  LXCursorTerminationProbability();
  return result;
}

- (NSString)traversedString
{
  __CFString *v2;

  if (self->_cursor)
    v2 = (__CFString *)LXCursorCopyTraversedCharacters();
  else
    v2 = &stru_1E4A3BA10;
  return (NSString *)v2;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_cursor)
  {
    v6 = v4;
    LXCursorEnumerateChildren();

  }
}

void __47__NLLexiconCursor_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NLLexiconCursor *v3;

  v3 = -[NLLexiconCursor initWithLexicon:cursor:]([NLLexiconCursor alloc], "initWithLexicon:cursor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_enumerateEntriesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_cursor)
  {
    v6 = v4;
    LXCursorEnumerateEntries();

  }
}

void __47__NLLexiconCursor__enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    LXEntryGetTokenID();
    LXEntryGetMetaFlags();
    LXEntryGetProbability();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NLLexiconCursor_enumerateEntriesUsingBlock___block_invoke;
  v6[3] = &unk_1E4A3A7D8;
  v7 = v4;
  v5 = v4;
  -[NLLexiconCursor _enumerateEntriesUsingBlock:](self, "_enumerateEntriesUsingBlock:", v6);

}

void __46__NLLexiconCursor_enumerateEntriesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;

  +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateCompletionsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_cursor)
  {
    v6 = v4;
    LXCursorEnumerateEntriesRecursively();

  }
}

void __50__NLLexiconCursor_enumerateCompletionsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t TokenID;
  unsigned int MetaFlags;
  void *v6;

  v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    TokenID = LXEntryGetTokenID();
    MetaFlags = LXEntryGetMetaFlags();
    LXEntryGetProbability();
    +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", v3, TokenID, MetaFlags);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexicon, 0);
}

@end
