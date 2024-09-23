@implementation NETrie

- (NETrie)initWithDomains:(id)a3 reverse:(BOOL)a4 partialSearchAllowed:(BOOL)a5 partialSearchTerminator:(char)a6
{
  id v10;
  NETrie *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  NETrie *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  NSObject *v26;
  NSObject *v27;
  const char *v29;
  int v30;
  int nodes_free_next;
  int child_maps_free_next;
  int bytes_free_next;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[4];
  _BYTE v45[10];
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NETrie;
  v11 = -[NETrie init](&v43, sel_init);
  if (!v11)
  {
LABEL_29:
    v19 = v11;
    goto LABEL_30;
  }
  if (v10 && objc_msgSend(v10, "count"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v12);
          v15 += objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "length");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "count");
    objc_msgSend(v12, "count");
    if (ne_trie_init())
    {
      v34 = v10;
      v11->_reverse = a4;
      v11->_partialSearchAllowed = a5;
      v11->_partialSearchTerminator = a6;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v20 = v12;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            v25 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j));
            objc_msgSend(v25, "UTF8String");
            objc_msgSend(v25, "length");
            if (ne_trie_insert() == 0xFFFF)
            {
              ne_log_obj();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v45 = v25;
                _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "NETrie - failed insert for %@", buf, 0xCu);
              }

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
        }
        while (v22);
      }

      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v30 = objc_msgSend(v20, "count");
        nodes_free_next = v11->_trie.nodes_free_next;
        child_maps_free_next = v11->_trie.child_maps_free_next;
        bytes_free_next = v11->_trie.bytes_free_next;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v45 = v30;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = nodes_free_next;
        v46 = 1024;
        v47 = child_maps_free_next;
        v48 = 1024;
        v49 = bytes_free_next;
        _os_log_debug_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEBUG, "NETrie - initialized with %d domains (Nodes used = %d, child maps used = %d, bytes used = %d", buf, 0x1Au);
      }

      v10 = v34;
      goto LABEL_29;
    }
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "NETrie - failed init";
LABEL_34:
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "NETrie - No domain";
      goto LABEL_34;
    }
  }

  v19 = 0;
LABEL_30:

  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "NETrie - dealloc", buf, 2u);
  }

  if (self->_trie.memory)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NETrie - dealloc - free memory", buf, 2u);
    }

    free(self->_trie.memory);
  }
  *(_OWORD *)&self->_trie.child_maps_mem_size = 0u;
  *(_OWORD *)&self->_trie.is_mmap = 0u;
  *(_OWORD *)&self->_trie.nodes_count = 0u;
  *(_OWORD *)&self->_trie.trie_memory_size = 0u;
  *(_OWORD *)&self->_trie.nodes = 0u;
  *(_OWORD *)&self->_trie.bytes = 0u;
  *(_OWORD *)&self->_trie.magic = 0u;
  v5.receiver = self;
  v5.super_class = (Class)NETrie;
  -[NETrie dealloc](&v5, sel_dealloc);
}

- (BOOL)search:(const char *)a3 length:(int)a4
{
  BOOL v4;
  uint64_t v6;

  v4 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
    return ne_trie_search() != 0xFFFF;
  return v4;
}

- (BOOL)searchWithString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "UTF8String");
    objc_msgSend(v5, "length");
    v6 = ne_trie_search() != 0xFFFF;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
