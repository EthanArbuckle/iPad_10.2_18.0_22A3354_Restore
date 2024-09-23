@implementation BLTBulletinStorageSection

- (BLTBulletinStorageSection)initWithMaxContextSize:(unint64_t)a3
{
  BLTBulletinStorageSection *v4;
  BLTBulletinStorageSection *v5;
  uint64_t v6;
  NSMutableArray *bulletins;
  uint64_t v8;
  NSMutableDictionary *bulletinIDToBulletin;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BLTBulletinStorageSection;
  v4 = -[BLTBulletinStorageSection init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxContextSize = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    bulletins = v5->_bulletins;
    v5->_bulletins = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    bulletinIDToBulletin = v5->_bulletinIDToBulletin;
    v5->_bulletinIDToBulletin = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (id)addOrReplaceBulletin:(id)a3
{
  id v4;
  NSMutableDictionary *bulletinIDToBulletin;
  void *v6;
  BLTBulletinStorageBulletin *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v18;
  unint64_t maxContextSize;
  unint64_t totalContextSize;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  bulletinIDToBulletin = self->_bulletinIDToBulletin;
  objc_msgSend(v4, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bulletinIDToBulletin, "objectForKeyedSubscript:", v6);
  v7 = (BLTBulletinStorageBulletin *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self->_totalContextSize -= -[BLTBulletinStorageBulletin contextSize](v7, "contextSize");
    -[NSMutableArray removeObject:](self->_bulletins, "removeObject:", v7);
  }
  else
  {
    v7 = objc_alloc_init(BLTBulletinStorageBulletin);
    v8 = self->_bulletinIDToBulletin;
    objc_msgSend(v4, "bulletinID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  -[BLTBulletinStorageBulletin setBulletin:](v7, "setBulletin:", v4);
  self->_totalContextSize += -[BLTBulletinStorageBulletin contextSize](v7, "contextSize");
  -[NSMutableArray insertObject:atIndex:](self->_bulletins, "insertObject:atIndex:", v7, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_bulletins, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, -[NSMutableArray count](self->_bulletins, "count"), 1024, &__block_literal_global_15));
  v10 = 0;
  if (self->_totalContextSize > self->_maxContextSize)
  {
    blt_notification_size_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "sectionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      totalContextSize = self->_totalContextSize;
      maxContextSize = self->_maxContextSize;
      v21 = 138412802;
      v22 = v18;
      v23 = 2048;
      v24 = maxContextSize;
      v25 = 2048;
      v26 = totalContextSize;
      _os_log_error_impl(&dword_2173D9000, v11, OS_LOG_TYPE_ERROR, "Section %@ exceeded max size (%lu). Total size is %lu", (uint8_t *)&v21, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    while (self->_totalContextSize > self->_maxContextSize && -[NSMutableArray count](self->_bulletins, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_bulletins, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bulletin");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

      -[NSMutableArray removeFirstObject](self->_bulletins, "removeFirstObject");
      v14 = self->_bulletinIDToBulletin;
      objc_msgSend(v12, "bulletin");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bulletinID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v16);

      self->_totalContextSize -= objc_msgSend(v12, "contextSize");
    }
  }

  return v10;
}

uint64_t __50__BLTBulletinStorageSection_addOrReplaceBulletin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateOrRecencyDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateOrRecencyDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)removeBulletin:(id)a3
{
  id v4;
  NSMutableDictionary *bulletinIDToBulletin;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  bulletinIDToBulletin = self->_bulletinIDToBulletin;
  v10 = v4;
  objc_msgSend(v4, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bulletinIDToBulletin, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_bulletinIDToBulletin;
    objc_msgSend(v10, "bulletinID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    -[NSMutableArray removeObject:](self->_bulletins, "removeObject:", v7);
    self->_totalContextSize -= objc_msgSend(v7, "contextSize");
  }

}

- (unint64_t)totalContextSize
{
  return self->_totalContextSize;
}

- (unint64_t)maxContextSize
{
  return self->_maxContextSize;
}

- (NSMutableArray)bulletins
{
  return self->_bulletins;
}

- (NSMutableDictionary)bulletinIDToBulletin
{
  return self->_bulletinIDToBulletin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinIDToBulletin, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
}

@end
