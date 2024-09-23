@implementation NLParsecDataManager

+ (BOOL)supportsDomain:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("activities"));
}

- (void)dealloc
{
  NSMutableArray *m_entries;
  objc_super v4;

  m_entries = self->m_entries;
  if (m_entries)

  v4.receiver = self;
  v4.super_class = (Class)NLParsecDataManager;
  -[NLParsecDataManager dealloc](&v4, sel_dealloc);
}

- (void)addEntry:(id)a3 domain:(id)a4 metaData:(id)a5
{
  float v9;
  float v10;
  float v11;
  NLPOIEntryImpl *v12;

  if (!self->m_entries)
    self->m_entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(NLPOIEntryImpl);
  -[NLPOIEntryImpl setName:](v12, "setName:", a3);
  -[NLPOIEntryImpl setDomain:](v12, "setDomain:", a4);
  -[NLPOIEntryImpl setCategory:](v12, "setCategory:", objc_msgSend(a5, "valueForKey:", CFSTR("c")));
  objc_msgSend((id)objc_msgSend(a5, "valueForKey:", CFSTR("p")), "floatValue");
  -[NLPOIEntryImpl setScore:](v12, "setScore:");
  if ((unint64_t)-[NSMutableArray count](self->m_entries, "count") < 0x64)
    goto LABEL_6;
  objc_msgSend((id)-[NSMutableArray lastObject](self->m_entries, "lastObject"), "score");
  v10 = v9;
  -[NLPOIEntryImpl score](v12, "score");
  if (v10 < v11)
  {
    -[NSMutableArray removeLastObject](self->m_entries, "removeLastObject");
LABEL_6:
    -[NLParsecDataManager insertEntry:](self, "insertEntry:", v12);
  }

}

- (void)insertEntry:(id)a3
{
  uint64_t v5;
  NSMutableArray *m_entries;

  v5 = -[NSMutableArray count](self->m_entries, "count");
  m_entries = self->m_entries;
  if (v5)
    -[NSMutableArray insertObject:atIndex:](self->m_entries, "insertObject:atIndex:", a3, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->m_entries, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, -[NSMutableArray count](m_entries, "count"), 1024, &__block_literal_global_3));
  else
    -[NSMutableArray addObject:](m_entries, "addObject:", a3);
}

uint64_t __35__NLParsecDataManager_insertEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "score");
  v5 = (void *)objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "score");
  return objc_msgSend(v5, "compare:", objc_msgSend(v6, "numberWithFloat:"));
}

- (NSData)serializableData
{
  void *v3;
  void *v4;
  NSMutableArray *m_entries;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSData *v11;
  NSObject *ParsecLogHandle;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->m_entries)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToMemory");
  objc_msgSend(v3, "open");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82BA8]), "initWithOutputStream:", v3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  m_entries = self->m_entries;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](m_entries, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(m_entries);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v4, "writeMessage:", v10) & 1) == 0)
        {
          ParsecLogHandle = getParsecLogHandle();
          if (os_log_type_enabled(ParsecLogHandle, OS_LOG_TYPE_ERROR))
            -[NLParsecDataManager serializableData].cold.1(v10, ParsecLogHandle);
          goto LABEL_13;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](m_entries, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
    v11 = (NSData *)objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0C99868]);
  }
  else
  {
LABEL_13:
    v11 = 0;
  }
  objc_msgSend(v3, "close");

  return v11;
}

+ (void)enumerateEntriesForSerializedData:(id)a3 withBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NLPOIEntry *v10;
  id v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", a3);
  objc_msgSend(v5, "open");
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D82BA0]), "initWithStream:", v5);
  v6 = objc_msgSend(v11, "setClassOfNextMessage:", objc_opt_class());
  v7 = (void *)MEMORY[0x1A1B0E3B0](v6);
  v8 = objc_msgSend(v11, "nextMessage");
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = -[NLPOIEntry initWithProtoBuf:]([NLPOIEntry alloc], "initWithProtoBuf:", v9);

      (*((void (**)(id, NLPOIEntry *))a4 + 2))(a4, v10);
      objc_autoreleasePoolPop(v7);
      v7 = (void *)MEMORY[0x1A1B0E3B0]();
      v9 = (void *)objc_msgSend(v11, "nextMessage");
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "close");

}

+ (void)notifyStoredSerializedDataChanged
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "postNotificationName:object:", CFSTR("NLParsecDataChangedNotification"), 0);
}

- (id)getEntries
{
  return self->m_entries;
}

+ (unsigned)maxNumberOfPOIsAllowed
{
  return 100;
}

- (void)serializableData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A1802000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize hints data: %@", (uint8_t *)&v2, 0xCu);
}

@end
