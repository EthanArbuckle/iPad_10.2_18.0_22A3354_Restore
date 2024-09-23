@implementation LPURLSuffixChecker

- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4
{
  __CFString *v6;
  unint64_t Length;
  _BYTE *CStringPtr;
  unint64_t maxLength;
  unint64_t var1;
  unint64_t v11;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 *v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  $BB8B2815F19B946069E0C78052E8954D *trie;
  unint64_t v20;
  unsigned __int16 *p_var1;
  $BB8B2815F19B946069E0C78052E8954D *v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int trieNodeCount;
  unsigned __int16 v27;
  $BB8B2815F19B946069E0C78052E8954D *v28;
  $BB8B2815F19B946069E0C78052E8954D *v29;
  BOOL v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char buffer[32];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  Length = CFStringGetLength(v6);
  if (Length > 0x20)
    goto LABEL_34;
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (CStringPtr)
    goto LABEL_5;
  if (!CFStringGetCString(v6, buffer, 32, 0x600u))
  {
LABEL_34:
    v30 = 0;
    goto LABEL_35;
  }
  CStringPtr = buffer;
LABEL_5:
  maxLength = self->_maxLength;
  if (maxLength <= Length)
    maxLength = Length;
  self->_maxLength = maxLength;
  if (*CStringPtr != 46)
    goto LABEL_34;
  var1 = a4->var1;
  if (Length >= var1)
    v11 = a4->var1;
  else
    v11 = Length;
  if (v11 >= 2)
  {
    v12 = &a4->var0[1];
    v13 = 1;
    do
    {
      v14 = (char)CStringPtr[v13];
      v15 = (v14 | 0x20) - 96;
      if ((v14 | 0x20u) - 123 < 0xFFFFFFE6)
        v15 = -1;
      if (v14 == 46)
        v16 = 0;
      else
        v16 = v15;
      if (v16 != v12->var0)
      {
        a4->var1 = v13;
        var1 = v13;
      }
      ++v13;
      if (Length >= var1)
        v17 = var1;
      else
        v17 = Length;
      ++v12;
    }
    while (v13 < v17);
  }
  v18 = var1 - 1;
  trie = self->_trie;
  a4->var1 = Length;
  v20 = Length - 1;
  if (Length - 1 <= var1 - 1)
  {
    v22 = trie;
  }
  else
  {
    p_var1 = &a4->var0[Length - 1].var1;
    v22 = trie;
    do
    {
      v23 = (char)CStringPtr[v20];
      if (v23 == 46)
      {
        v24 = 0;
      }
      else
      {
        v25 = v23 | 0x20;
        if ((v25 - 123) < 0xFFFFFFE6)
          goto LABEL_34;
        v24 = v25 - 96;
      }
      trieNodeCount = v22->var0[v24];
      v27 = v24;
      if (!v22->var0[v24])
      {
        trieNodeCount = self->_trieNodeCount;
        self->_trieNodeCount = trieNodeCount + 1;
        v22->var0[v24] = trieNodeCount;
        v28 = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_realloc(trie, 54 * (trieNodeCount + 1), 0x10000409C08D13AuLL);
        self->_trie = v28;
        v29 = &v28[trieNodeCount];
        *(_QWORD *)&v29->var0[23] = 0;
        *(_OWORD *)&v29->var0[8] = 0u;
        *(_OWORD *)&v29->var0[16] = 0u;
        *(_OWORD *)v29->var0 = 0u;
        trie = self->_trie;
      }
      *(p_var1 - 1) = v27;
      *p_var1 = trieNodeCount;
      p_var1 -= 2;
      v22 = &trie[trieNodeCount];
      --v20;
    }
    while (v20 > v18);
  }
  v32 = (char)CStringPtr[v18];
  LODWORD(v33) = (v32 | 0x20) - 96;
  if ((v32 | 0x20u) - 123 < 0xFFFFFFE6)
    v33 = 0xFFFFFFFFLL;
  else
    v33 = v33;
  if (v32 == 46)
    v34 = 0;
  else
    v34 = v33;
  v22->var0[v34] = a4->var0[v18].var1;
  v30 = 1;
LABEL_35:

  return v30;
}

- (void)addStringToFailedSuffixes:(id)a3
{
  id v4;
  NSMutableArray *failedSuffixes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  failedSuffixes = self->_failedSuffixes;
  v9 = v4;
  if (!failedSuffixes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_failedSuffixes;
    self->_failedSuffixes = v6;

    failedSuffixes = self->_failedSuffixes;
    v4 = v9;
  }
  objc_msgSend(v4, "substringFromIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](failedSuffixes, "addObject:", v8);

}

- (LPURLSuffixChecker)initWithSuffixes:(id)a3
{
  id v4;
  LPURLSuffixChecker *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  LPURLSuffixChecker *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[8];
  uint64_t v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)LPURLSuffixChecker;
  v5 = -[LPURLSuffixChecker init](&v19, sel_init);
  if (v5)
  {
    v5->_trie = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_calloc(0x36uLL, 2uLL, 0xF464328uLL);
    v5->_trieNodeCount = 2;
    memset(v17, 0, sizeof(v17));
    WORD1(v17[0]) = 1;
    v18 = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!-[LPURLSuffixChecker insertString:intoTrieWithCache:](v5, "insertString:intoTrieWithCache:", v10, v17, (_QWORD)v13))-[LPURLSuffixChecker addStringToFailedSuffixes:](v5, "addStringToFailedSuffixes:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      }
      while (v7);
    }

    v11 = v5;
  }

  return v5;
}

- (BOOL)hasSuffix:(id)a3
{
  return -[LPURLSuffixChecker hasSuffix:remainingPrefix:](self, "hasSuffix:remainingPrefix:", a3, 0);
}

- (BOOL)hasSuffix:(id)a3 remainingPrefix:(id *)a4
{
  const __CFString *v6;
  __CFString *v7;
  unint64_t Length;
  char *CStringPtr;
  unint64_t maxLength;
  $BB8B2815F19B946069E0C78052E8954D *trie;
  int v12;
  int v13;
  int v14;
  int v15;
  NSMutableArray *failedSuffixes;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30[128];
  char buffer[32];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFString *)a3;
  v7 = (__CFString *)v6;
  if (!v6)
    goto LABEL_34;
  Length = CFStringGetLength(v6);
  CStringPtr = (char *)CFStringGetCStringPtr(v7, 0x600u);
  if (CStringPtr)
    goto LABEL_5;
  if (CFStringGetCString(v7, buffer, 32, 0x600u))
  {
    CStringPtr = buffer;
LABEL_5:
    if (Length >= self->_maxLength)
      maxLength = self->_maxLength;
    else
      maxLength = Length;
    if (maxLength)
    {
      trie = self->_trie;
      while (1)
      {
        v12 = CStringPtr[Length - 1];
        if (v12 == 46)
        {
          v13 = 0;
        }
        else
        {
          v14 = v12 | 0x20;
          if ((v14 - 123) < 0xFFFFFFE6)
            goto LABEL_22;
          v13 = v14 - 96;
        }
        v15 = trie->var0[v13];
        if (!v15)
          goto LABEL_22;
        if (v15 == 1)
          break;
        trie = &self->_trie[v15];
        --Length;
        if (!--maxLength)
          goto LABEL_19;
      }
      if (a4)
      {
        -[__CFString substringToIndex:](v7, "substringToIndex:", Length);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_43:
      v23 = 1;
      goto LABEL_44;
    }
    trie = self->_trie;
LABEL_19:
    if (trie->var0[0] == 1)
    {
      if (a4)
        *a4 = 0;
      goto LABEL_43;
    }
  }
LABEL_22:
  failedSuffixes = self->_failedSuffixes;
  if (!failedSuffixes)
    goto LABEL_34;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = failedSuffixes;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v18)
    goto LABEL_33;
  v19 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v27 != v19)
        objc_enumerationMutation(v17);
      v21 = -[__CFString rangeOfString:options:](v7, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 15, (_QWORD)v26);
      v22 = v21;
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v21)
        {
          if (-[__CFString characterAtIndex:](v7, "characterAtIndex:", v21 - 1) != 46)
            continue;
          if (a4)
          {
            -[__CFString substringToIndex:](v7, "substringToIndex:", v22);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
        }
        else if (a4)
        {
          v24 = 0;
LABEL_41:
          *a4 = v24;
        }

        goto LABEL_43;
      }
    }
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v18)
      continue;
    break;
  }
LABEL_33:

LABEL_34:
  v23 = 0;
LABEL_44:

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_trie);
  v3.receiver = self;
  v3.super_class = (Class)LPURLSuffixChecker;
  -[LPURLSuffixChecker dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSuffixes, 0);
}

@end
