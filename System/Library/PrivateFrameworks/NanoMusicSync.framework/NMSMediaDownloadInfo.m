@implementation NMSMediaDownloadInfo

- (NMSMediaDownloadInfo)initWithItems:(id)a3
{
  id v4;
  NMSMediaDownloadInfo *v5;
  uint64_t v6;
  NSMutableOrderedSet *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaDownloadInfo;
  v5 = -[NMSMediaDownloadInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    items = v5->_items;
    v5->_items = (NSMutableOrderedSet *)v6;

  }
  return v5;
}

- (BOOL)containsItem:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_items, "containsObject:", a3);
}

- (unint64_t)totalItemCount
{
  return -[NSMutableOrderedSet count](self->_items, "count");
}

- (unint64_t)totalItemSize
{
  unint64_t result;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = self->_totalItemSize;
  if (!result)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_items;
    v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          self->_totalItemSize += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "size", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    return self->_totalItemSize;
  }
  return result;
}

- (void)enumerateMediaItemsUsingBlock:(id)a3
{
  id v4;
  NSMutableOrderedSet *items;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaDownloadInfo_enumerateMediaItemsUsingBlock___block_invoke;
  v7[3] = &unk_24D647520;
  v8 = v4;
  v6 = v4;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __54__NMSMediaDownloadInfo_enumerateMediaItemsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)mediaLibraryItemIdentifiers
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[NSMutableOrderedSet count](self->_items, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NMSMediaDownloadInfo_mediaLibraryItemIdentifiers__block_invoke;
  v7[3] = &unk_24D647548;
  v8 = v3;
  v4 = v3;
  -[NMSMediaDownloadInfo enumerateMediaItemsUsingBlock:](self, "enumerateMediaItemsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __51__NMSMediaDownloadInfo_mediaLibraryItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "mediaLibraryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "mediaLibraryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)externalLibraryItemIdentifiers
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[NSMutableOrderedSet count](self->_items, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaDownloadInfo_externalLibraryItemIdentifiers__block_invoke;
  v7[3] = &unk_24D647548;
  v8 = v3;
  v4 = v3;
  -[NMSMediaDownloadInfo enumerateMediaItemsUsingBlock:](self, "enumerateMediaItemsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __54__NMSMediaDownloadInfo_externalLibraryItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "externalLibraryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "externalLibraryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)NMSMediaDownloadInfo;
  -[NMSMediaDownloadInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - itemCount: %lu - items: %@ - itemSize %llu>"), v4, -[NSMutableOrderedSet count](self->_items, "count"), self->_items, self->_totalItemSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTotalItemSize:(unint64_t)a3
{
  self->_totalItemSize = a3;
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
