@implementation CalculateUnitsTrie

- (CalculateUnitsTrie)init
{
  CalculateUnitsTrie *v2;
  void *v3;
  uint64_t v4;
  Trie *trie;
  Trie *v6;
  id v7;
  uint64_t v8;
  CalculateUnitsTrieNode *root;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CalculateUnitsTrie;
  v2 = -[CalculateUnitsTrie init](&v11, sel_init);
  if (v2)
  {
    +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ranks");
    v4 = objc_claimAutoreleasedReturnValue();
    trie = v2->_trie;
    v2->_trie = (Trie *)v4;

    v6 = v2->_trie;
    if (v6)
      v7 = -[TrieNode copy](v6->_root, "copy");
    else
      v7 = 0;
    +[CalculateUnitsTrieNode nodeWithTrieNode:](CalculateUnitsTrieNode, "nodeWithTrieNode:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    root = v2->_root;
    v2->_root = (CalculateUnitsTrieNode *)v8;

  }
  return v2;
}

- (CalculateUnitsTrie)initWithLocales:(id)a3
{
  id v5;
  CalculateUnitsTrie *v6;
  void *v7;
  uint64_t v8;
  Trie *trie;
  Trie *v10;
  id v11;
  uint64_t v12;
  CalculateUnitsTrieNode *root;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CalculateUnitsTrie;
  v6 = -[CalculateUnitsTrie init](&v15, sel_init);
  if (v6)
  {
    +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ranksWithLocales:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    trie = v6->_trie;
    v6->_trie = (Trie *)v8;

    v10 = v6->_trie;
    if (v10)
      v11 = -[TrieNode copy](v10->_root, "copy");
    else
      v11 = 0;
    +[CalculateUnitsTrieNode nodeWithTrieNode:](CalculateUnitsTrieNode, "nodeWithTrieNode:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    root = v6->_root;
    v6->_root = (CalculateUnitsTrieNode *)v12;

    objc_storeStrong((id *)&v6->_locales, a3);
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  return -[CalculateUnitsTrieNode objectForKey:](self->_root, "objectForKey:", a3);
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[CalculateUnitsTrieNode objectForKeyedSubscript:](self->_root, "objectForKeyedSubscript:", a3);
}

- (NSSet)conversionVerbs
{
  NSSet *conversionVerbs;
  NSArray *locales;
  NSArray *v5;
  NSArray *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSSet *v16;
  NSSet *v17;

  conversionVerbs = self->_conversionVerbs;
  if (!conversionVerbs)
  {
    locales = self->_locales;
    if (locales)
    {
      v5 = locales;
    }
    else
    {
      +[Localize systemLocales](Localize, "systemLocales");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    v7 = -[NSArray count](v5, "count");
    if (v7 >= 3)
      v8 = 3;
    else
      v8 = v7;
    v9 = (void *)objc_opt_new();
    if (v8)
    {
      v10 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "conversionVerbsWithLocale:from:", v11, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          break;
        +[AvailableUnitRanks shared](AvailableUnitRanks, "shared");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "conversionVerbsWithLocale:from:", v11, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_13;
LABEL_14:

        if (v8 == ++v10)
          goto LABEL_15;
      }
      v14 = (void *)v13;

LABEL_13:
      objc_msgSend(v9, "addObjectsFromArray:", v14);

      goto LABEL_14;
    }
LABEL_15:
    v16 = (NSSet *)objc_msgSend(v9, "copy");
    v17 = self->_conversionVerbs;
    self->_conversionVerbs = v16;

    conversionVerbs = self->_conversionVerbs;
  }
  return conversionVerbs;
}

- (CalculateUnitsTrieNode)root
{
  return self->_root;
}

- (Trie)trie
{
  return self->_trie;
}

- (void)setTrie:(id)a3
{
  objc_storeStrong((id *)&self->_trie, a3);
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_storeStrong((id *)&self->_locales, a3);
}

- (void)setConversionVerbs:(id)a3
{
  objc_storeStrong((id *)&self->_conversionVerbs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionVerbs, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_trie, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

@end
