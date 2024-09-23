@implementation CDMVocTrie

- (CDMVocTrie)initWithTriePath:(id)a3
{
  id v4;
  CDMVocTrie *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  OVMarisaTrie *v9;
  void *v10;
  uint64_t v11;
  OVMarisaTrie *vocTextTrieReadOnly;
  OVMarisaTrie *v13;
  void *v14;
  uint64_t v15;
  OVMarisaTrie *vocLabelTrieReadOnly;
  OVMarisaTrie *v17;
  void *v18;
  uint64_t v19;
  OVMarisaTrie *vocSemanticTrieReadOnly;
  OVMarisaTrie *v21;
  void *v22;
  uint64_t v23;
  OVMarisaTrie *vocUsoTrieReadOnly;
  OVMarisaTrie *v25;
  void *v26;
  uint64_t v27;
  OVMarisaTrie *vocUsoNodeIndexTrieReadOnly;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  CDMVocTrie *v32;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CDMVocTrie;
  v5 = -[CDMVocTrie init](&v34, sel_init);
  if (v5)
  {
    if (!v4)
    {
      NSTemporaryDirectory();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByStandardizingPath");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[CDMVocTrie getTrieURLs:](CDMVocTrie, "getTrieURLs:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMVocTrie initWithTriePath:]";
      v37 = 2112;
      v38 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Reading VOC trie from %@", buf, 0x16u);
    }

    v9 = [OVMarisaTrie alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[OVMarisaTrie initWithURL:](v9, "initWithURL:", v10);
    vocTextTrieReadOnly = v5->vocTextTrieReadOnly;
    v5->vocTextTrieReadOnly = (OVMarisaTrie *)v11;

    v13 = [OVMarisaTrie alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[OVMarisaTrie initWithURL:](v13, "initWithURL:", v14);
    vocLabelTrieReadOnly = v5->vocLabelTrieReadOnly;
    v5->vocLabelTrieReadOnly = (OVMarisaTrie *)v15;

    v17 = [OVMarisaTrie alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[OVMarisaTrie initWithURL:](v17, "initWithURL:", v18);
    vocSemanticTrieReadOnly = v5->vocSemanticTrieReadOnly;
    v5->vocSemanticTrieReadOnly = (OVMarisaTrie *)v19;

    v21 = [OVMarisaTrie alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[OVMarisaTrie initWithURL:](v21, "initWithURL:", v22);
    vocUsoTrieReadOnly = v5->vocUsoTrieReadOnly;
    v5->vocUsoTrieReadOnly = (OVMarisaTrie *)v23;

    v25 = [OVMarisaTrie alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[OVMarisaTrie initWithURL:](v25, "initWithURL:", v26);
    vocUsoNodeIndexTrieReadOnly = v5->vocUsoNodeIndexTrieReadOnly;
    v5->vocUsoNodeIndexTrieReadOnly = (OVMarisaTrie *)v27;

    if (!v5->vocTextTrieReadOnly || !v5->vocLabelTrieReadOnly || !v5->vocSemanticTrieReadOnly)
    {
      CDMOSLoggerForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        _os_log_error_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: CDMVocTrie failing to init without required assets", buf, 0xCu);
      }

      v32 = 0;
      goto LABEL_19;
    }
    if (v5->vocUsoTrieReadOnly && v5->vocUsoNodeIndexTrieReadOnly)
    {
      CDMOSLoggerForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        v30 = "%s CDMVocTrie Using VOC 2.0 assets that contains USO";
LABEL_22:
        _os_log_debug_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_DEBUG, v30, buf, 0xCu);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        v30 = "%s CDMVocTrie Using VOC 1.0 assets that does not contain USO, still relying on CDMVocMapper";
        goto LABEL_22;
      }
    }

    v32 = v5;
LABEL_19:

    goto LABEL_20;
  }
  v32 = 0;
LABEL_20:

  return v32;
}

- (id)entriesForText:(id)a3
{
  id v4;
  void *v5;
  OVMarisaTrie *vocTextTrieReadOnly;
  _QWORD v8[4];
  id v9;
  CDMVocTrie *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  vocTextTrieReadOnly = self->vocTextTrieReadOnly;
  if (vocTextTrieReadOnly && self->vocLabelTrieReadOnly)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__CDMVocTrie_entriesForText___block_invoke;
    v8[3] = &unk_24DCACCE0;
    v9 = v4;
    v10 = self;
    v11 = v5;
    -[OVMarisaTrie lookupKey:resultBlock:](vocTextTrieReadOnly, "lookupKey:resultBlock:", v9, v8);

  }
  return v5;
}

- (id)usoGraphForLabel:(id)a3 semantic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OVMarisaTrie *vocUsoTrieReadOnly;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8029;
  v18 = __Block_byref_object_dispose__8030;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  vocUsoTrieReadOnly = self->vocUsoTrieReadOnly;
  if (vocUsoTrieReadOnly)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__CDMVocTrie_usoGraphForLabel_semantic___block_invoke;
    v13[3] = &unk_24DCACD08;
    v13[4] = &v14;
    -[OVMarisaTrie lookupKey:resultBlock:](vocUsoTrieReadOnly, "lookupKey:resultBlock:", v8, v13);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CDMVocTrie usoGraphForLabel:semantic:]";
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s no uso trie loaded", buf, 0xCu);
    }

  }
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

- (int)getUsoNodeIndex:(id)a3 semantic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OVMarisaTrie *vocUsoNodeIndexTrieReadOnly;
  int v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (self->vocUsoNodeIndexTrieReadOnly)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    vocUsoNodeIndexTrieReadOnly = self->vocUsoNodeIndexTrieReadOnly;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __39__CDMVocTrie_getUsoNodeIndex_semantic___block_invoke;
    v12[3] = &unk_24DCACD08;
    v12[4] = &v13;
    -[OVMarisaTrie lookupKey:resultBlock:](vocUsoNodeIndexTrieReadOnly, "lookupKey:resultBlock:", v8, v12);

    v10 = *((_DWORD *)v14 + 6);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (int64_t)getLabelTrieCount
{
  return (int64_t *)-[OVMarisaTrie count](self->vocLabelTrieReadOnly, "count");
}

- (int64_t)getTextTrieCount
{
  return (int64_t *)-[OVMarisaTrie count](self->vocTextTrieReadOnly, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vocUsoNodeIndexTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocUsoTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocSemanticTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocLabelTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocTextTrieReadOnly, 0);
}

uint64_t __39__CDMVocTrie_getUsoNodeIndex_semantic___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, 4);
}

void __40__CDMVocTrie_usoGraphForLabel_semantic___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE9E180];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithData:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v8
    || (objc_msgSend(v8, "nodes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        !v10))
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[CDMVocTrie usoGraphForLabel:semantic:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s uso graph can't be converted", (uint8_t *)&v14, 0xCu);
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
}

void __29__CDMVocTrie_entriesForText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    *(_DWORD *)buf = 0;
    objc_msgSend(a2, "getBytes:length:", buf, 4);
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v3 + 16);
    v6 = *(unsigned int *)buf;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __29__CDMVocTrie_entriesForText___block_invoke_15;
    v9[3] = &unk_24DCACCB8;
    v9[4] = v3;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "reverseLookupKey:dataLength:resultBlock:", v6, 4, v9);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[CDMVocTrie entriesForText:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: VOC trie look up returns nil data for text:%@", buf, 0x16u);
    }

  }
}

void __29__CDMVocTrie_entriesForText___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  CDMVocEntry *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;

  v5 = a2;
  if (v5)
  {
    v10 = 0;
    objc_msgSend(a3, "getBytes:length:", &v10, 4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reverseLookupRow:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[CDMVocEntry initWithText:label:semantic:]([CDMVocEntry alloc], "initWithText:label:semantic:", *(_QWORD *)(a1 + 40), v5, v6);
      objc_msgSend(*(id *)(a1 + 32), "usoGraphForLabel:semantic:", v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "getUsoNodeIndex:semantic:", v5, v6);
        -[CDMVocEntry setUsoGraph:](v7, "setUsoGraph:", v8);
        -[CDMVocEntry setNodeIndex:](v7, "setNodeIndex:", v9);
      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

    }
  }

}

+ (id)getTrieURLs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("vocText.trie"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("vocLabel.trie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("vocSemantic.trie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("vocUso.trie"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("vocUsoNodeIndex.trie"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, v9, v10, v11, v12, 0);

  return v13;
}

@end
