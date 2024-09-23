@implementation _ICLexiconUtilities

+ (BOOL)lexiconContainsEntry:(_LXLexicon *)a3 forString:(id)a4
{
  id v4;
  char v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a4;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  LXLexiconEnumerateEntriesForString();
  v5 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v5;
}

+ (id)sortKeyEquivalents:(_LXLexicon *)a3 forString:(id)a4
{
  void *v4;
  id v5;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a4;
  objc_msgSend(v4, "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LXLexiconEnumerateEntriesForString();

  return v7;
}

+ (_LXEntry)copyEntry:(_LXLexicon *)a3 forString:(id)a4
{
  id v4;
  _LXEntry *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  LXLexiconEnumerateEntriesForString();
  v5 = (_LXEntry *)v8[3];
  _Block_object_dispose(&v7, 8);

  return v5;
}

@end
