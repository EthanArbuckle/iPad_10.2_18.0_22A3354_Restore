@implementation CHStringOVSChecker

- (CHStringOVSChecker)initWithTrie:(_CFBurstTrie *)a3 staticLexicon:(_LXLexicon *)a4 customLexicon:(_LXLexicon *)a5 flags:(unsigned int)a6 stringNormalizationFunction:(void *)a7
{
  CHStringOVSChecker *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHStringOVSChecker;
  v12 = -[CHStringOVSChecker init](&v14, sel_init);
  if (v12)
  {
    if (a3)
      v12->_ovsTrie = (_CFBurstTrie *)CFBurstTrieRetain();
    if (a4)
      v12->_staticLexicon = (_LXLexicon *)CFRetain(a4);
    if (a5)
      v12->_customLexicon = (_LXLexicon *)CFRetain(a5);
    v12->_flagsFilter = a6;
    v12->_stringNormalizationFunction = a7;
  }
  return v12;
}

- (BOOL)isInappropriateLexiconEntry:(_LXEntry *)a3
{
  return a3 && (self->_flagsFilter & LXEntryGetMetaFlags()) != 0;
}

- (BOOL)isInappropriateString:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  _LXLexicon *customLexicon;
  _CFBurstTrie *ovsTrie;
  BOOL v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t i;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = a3;
  if (self->_staticLexicon)
  {
    v5 = sub_1BE802204((uint64_t)self, v4);
    v6 = v5;
    if (!self->_customLexicon)
      goto LABEL_7;
    v5 = 1;
  }
  else
  {
    v6 = 0;
    customLexicon = self->_customLexicon;
    v5 = customLexicon != 0;
    if (!customLexicon)
      goto LABEL_7;
  }
  if (!v6)
    v5 = sub_1BE802204((uint64_t)self, v4);
LABEL_7:
  ovsTrie = self->_ovsTrie;
  if (ovsTrie)
    v9 = 1;
  else
    v9 = v5;
  if (ovsTrie && !v5)
  {
    v10 = v4;
    v15 = v10;
    if (v10 && (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)&stru_1E77F6F28, v12, v13, v14) & 1) == 0)
    {
      objc_msgSend_lowercaseString(v15, v16, v17, v18, v19, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      for (i = 0; objc_msgSend_length(v21, v22, v23, v24, v25, v26) > i; ++i)
      {
        v33 = objc_msgSend_characterAtIndex_(v21, v29, i, v30, v31, v32);
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v34, (uint64_t)CFSTR("%C"), v35, v36, v37, (unsigned __int16)((v33 >> 1) | ((_WORD)v33 << 15)));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v27, v39, (uint64_t)v38, v40, v41, v42);

      }
      objc_msgSend_length(v15, v43, v44, v45, v46, v47);
      v9 = CFBurstTrieContains() != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isInappropriateTokenID:(unsigned int)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  char v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  char isInappropriateLexiconEntry;

  v4 = LXLexiconCopyEntryForTokenID();
  if (v4
    && (v9 = (const void *)v4,
        v10 = objc_msgSend_isInappropriateLexiconEntry_(self, v5, v4, v6, v7, v8),
        CFRelease(v9),
        (v10 & 1) != 0))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v11 = LXLexiconCopyEntryForTokenID();
    if (v11)
    {
      v16 = (const void *)v11;
      isInappropriateLexiconEntry = objc_msgSend_isInappropriateLexiconEntry_(self, v12, v11, v13, v14, v15);
      CFRelease(v16);
      LOBYTE(v11) = isInappropriateLexiconEntry;
    }
  }
  return v11;
}

- (void)dealloc
{
  _LXLexicon *staticLexicon;
  _LXLexicon *customLexicon;
  objc_super v5;

  if (self->_ovsTrie)
  {
    CFBurstTrieRelease();
    self->_ovsTrie = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  customLexicon = self->_customLexicon;
  if (customLexicon)
  {
    CFRelease(customLexicon);
    self->_customLexicon = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CHStringOVSChecker;
  -[CHStringOVSChecker dealloc](&v5, sel_dealloc);
}

@end
