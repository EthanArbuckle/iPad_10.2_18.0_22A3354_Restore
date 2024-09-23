@implementation EMFIndexManager

- (EMFIndexManager)initWithBundle:(id)a3
{
  id v5;
  EMFIndexManager *v6;
  EMFIndexManager *v7;
  NSLock *v8;
  NSLock *defaultIndexLock;
  NSLock *v10;
  NSLock *stemmedIndexLock;
  EMFIndexManager *v12;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMFIndexManager;
    v6 = -[EMFIndexManager init](&v14, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_searchEngineBundle, a3);
      v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      defaultIndexLock = v7->_defaultIndexLock;
      v7->_defaultIndexLock = v8;

      v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      stemmedIndexLock = v7->_stemmedIndexLock;
      v7->_stemmedIndexLock = v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (EMFInvertedIndex)defaultIndex
{
  EMFInvertedIndex *v3;
  EMFInvertedIndex *defaultIndex;

  -[NSLock lock](self->_defaultIndexLock, "lock");
  if (!self->_triedLoadingDefaultIndex)
  {
    +[EMFIndexLoader defaultIndexForBundle:](EMFIndexLoader, "defaultIndexForBundle:", self->_searchEngineBundle);
    v3 = (EMFInvertedIndex *)objc_claimAutoreleasedReturnValue();
    defaultIndex = self->_defaultIndex;
    self->_defaultIndex = v3;

    self->_triedLoadingDefaultIndex = 1;
  }
  -[NSLock unlock](self->_defaultIndexLock, "unlock");
  return self->_defaultIndex;
}

- (EMFInvertedIndex)stemmedIndex
{
  EMFInvertedIndex *v3;
  EMFInvertedIndex *stemmedIndex;

  -[NSLock lock](self->_stemmedIndexLock, "lock");
  if (!self->_triedLoadingStemmedIndex)
  {
    +[EMFIndexLoader stemmedIndexForBundle:](EMFIndexLoader, "stemmedIndexForBundle:", self->_searchEngineBundle);
    v3 = (EMFInvertedIndex *)objc_claimAutoreleasedReturnValue();
    stemmedIndex = self->_stemmedIndex;
    self->_stemmedIndex = v3;

    self->_triedLoadingStemmedIndex = 1;
  }
  -[NSLock unlock](self->_stemmedIndexLock, "unlock");
  return self->_stemmedIndex;
}

- (void)preheatIndexes
{
  id v3;
  id v4;

  v3 = -[EMFIndexManager defaultIndex](self, "defaultIndex");
  v4 = -[EMFIndexManager stemmedIndex](self, "stemmedIndex");
}

- (void)setDefaultIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setStemmedIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stemmedIndex, 0);
  objc_storeStrong((id *)&self->_defaultIndex, 0);
  objc_storeStrong((id *)&self->_stemmedIndexLock, 0);
  objc_storeStrong((id *)&self->_defaultIndexLock, 0);
  objc_storeStrong((id *)&self->_searchEngineBundle, 0);
}

@end
