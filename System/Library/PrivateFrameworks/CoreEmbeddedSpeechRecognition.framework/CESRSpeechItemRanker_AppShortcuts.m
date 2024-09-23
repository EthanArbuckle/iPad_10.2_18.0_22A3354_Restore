@implementation CESRSpeechItemRanker_AppShortcuts

- (CESRSpeechItemRanker_AppShortcuts)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  CESRSpeechItemRanker_AppShortcuts *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *setDict;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CESRSpeechItemRanker_AppShortcuts;
  v5 = -[CESRSpeechItemRanker initWithInstance:speechProfileSite:categoryGroup:](&v9, sel_initWithInstance_speechProfileSite_categoryGroup_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    setDict = v5->_setDict;
    v5->_setDict = v6;

  }
  return v5;
}

- (BOOL)addSet:(id)a3
{
  id v4;
  int v5;
  NSMutableDictionary *setDict;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "itemType");
  if (v5 == 12010)
  {
    setDict = self->_setDict;
    objc_msgSend(v4, "descriptorWithKey:", *MEMORY[0x1E0D0D3C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](setDict, "setObject:forKey:", v4, v8);

  }
  return v5 == 12010;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  unsigned int v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  unsigned __int8 v30;
  BOOL v31;
  __int128 v33;
  id obj;
  uint64_t v35;
  id v37;
  void *v38;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE buf[24];
  _QWORD v54[2];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v4 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    -[CESRSpeechItemRanker_AppShortcuts sets](self, "sets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_INFO, "%s Ranking %lu AppShortcuts items", buf, 0x16u);

  }
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_setDict, "count"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = self->_setDict;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_setDict, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "changePublisherWithUseCase:", CFSTR("SpeechProfile"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "localItemInstanceCount");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKey:", v15, v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v8);
  }

  v16 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v38;
    _os_log_debug_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_DEBUG, "%s AppShortcuts item count table:\n%@", buf, 0x16u);
  }
  objc_msgSend(v38, "keysSortedByValueUsingComparator:", &__block_literal_global);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CESRSpeechItemRanker calculateItemLimit](self, "calculateItemLimit");
  v19 = objc_msgSend(v17, "count");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v17;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v20)
  {
    v22 = v18;
    v35 = *(_QWORD *)v46;
    *(_QWORD *)&v21 = 136315906;
    v33 = v21;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v38, "objectForKey:", v24, v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");

        if (v26 >= v22 / v19)
          v27 = v22 / v19;
        else
          v27 = v26;
        v28 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v33;
          *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v54[0]) = v22 / v19;
          WORD2(v54[0]) = 1024;
          *(_DWORD *)((char *)v54 + 6) = v27;
          _os_log_debug_impl(&dword_1B3E5F000, v28, OS_LOG_TYPE_DEBUG, "%s AppShortcuts adding item for app id %@ - fair quota: %u actual taken: %u", buf, 0x22u);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v54[0] = 0;
        -[NSMutableDictionary objectForKey:](self->_setDict, "objectForKey:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke_2;
        v41[3] = &unk_1E6733978;
        v43 = buf;
        v44 = v27;
        v42 = v37;
        v40.receiver = self;
        v40.super_class = (Class)CESRSpeechItemRanker_AppShortcuts;
        v30 = -[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:](&v40, sel_enumerateAllItemsOfSet_error_usingBlock_, v29, a3, v41);

        _Block_object_dispose(buf, 8);
        if ((v30 & 1) == 0)
        {
          v31 = 0;
          goto LABEL_27;
        }
        --v19;
        v22 -= v27;
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v20)
        continue;
      break;
    }
  }
  v31 = 1;
LABEL_27:

  return v31;
}

- (id)sets
{
  return (id)-[NSMutableDictionary allValues](self->_setDict, "allValues");
}

- (BOOL)hasSets
{
  return -[NSMutableDictionary count](self->_setDict, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setDict, 0);
}

@end
