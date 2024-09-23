@implementation TrieNode

- (id)copy
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_trie);
  +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, self->_node, self->_offset);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Trie)trie
{
  return (Trie *)objc_loadWeakRetained((id *)&self->_trie);
}

- (void)setTrie:(id)a3
{
  objc_storeWeak((id *)&self->_trie, a3);
}

- (int)node
{
  return self->_node;
}

- (void)setNode:(int)a3
{
  self->_node = a3;
}

- (int)offset
{
  return self->_offset;
}

- (void)setOffset:(int)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trie);
}

+ (id)nodeWithTrie:(uint64_t)a3 node:(uint64_t)a4 offset:
{
  id v6;
  void *v7;

  v6 = a2;
  objc_opt_self();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTrie:", v6);

  objc_msgSend(v7, "setNode:", a3);
  objc_msgSend(v7, "setOffset:", a4);
  return v7;
}

- (id)objectForByte:(uint64_t)a1 leaf:(int)a2 create:
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TrieNode updateForByte:leaf:create:]((uint64_t)v5, 0, 1, a2))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)updateForByte:(uint64_t)a3 leaf:(int)a4 create:
{
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  int v32;
  _DWORD *v33;
  _DWORD *v35;
  int v36;
  int v37;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v8 = objc_msgSend(WeakRetained, "nodes");
  v9 = *(int *)(a1 + 8);
  v10 = *(int *)(a1 + 12);
  v11 = v8 + 12 * (int)v9;
  v12 = *(unsigned __int8 *)(v11 + 3);
  v13 = (*(_DWORD *)(a1 + 8) == 0) & ~(_DWORD)a3;
  if (*(_DWORD *)(a1 + 12))
    v13 = 0;
  v37 = v13;
  if (v13 == 1 && *(int *)(objc_msgSend(WeakRetained, "firstByteCache") + 4 * a2) >= 1)
  {
    v14 = 1;
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(objc_msgSend(WeakRetained, "firstByteCache") + 4 * a2);
    *(_DWORD *)(a1 + 12) = 1;
    goto LABEL_39;
  }
  if ((int)v10 < v12)
  {
    if ((a3 & 1) == 0
      && *(unsigned __int8 *)(objc_msgSend(WeakRetained, "characters") + (*(_DWORD *)v11 & 0xFFFFFF) + v10) == (_DWORD)a2)
    {
      v15 = v10 + 1;
      *(_DWORD *)(a1 + 8) = v9;
      goto LABEL_38;
    }
    if (a4)
    {
      v20 = *(_DWORD *)v11;
      *(_BYTE *)(v11 + 3) = v10;
      v21 = objc_msgSend(WeakRetained, "nodeCount");
      v22 = v9;
      v23 = v21;
      v24 = (v20 - ((_DWORD)v10 << 24)) & 0xFF000000 | (*(_DWORD *)v11 + (_DWORD)v10) & 0xFFFFFF;
      v25 = 3 * v22;
      objc_msgSend(WeakRetained, "writeNode:", v24 | ((unint64_t)*(unsigned int *)(v8 + 12 * v22 + 4) << 32), 0);
      *(_DWORD *)(objc_msgSend(WeakRetained, "nodes") + 4 * v25 + 4) = v23;
      v14 = -[TrieNode updateForByte:leaf:create:](a1, a2, a3, 1);
      goto LABEL_39;
    }
LABEL_25:
    v14 = 0;
    goto LABEL_39;
  }
  v16 = v8 + 12 * (int)v9;
  v17 = *(unsigned int *)(v16 + 4);
  v35 = (_DWORD *)(v16 + 4);
  v36 = v9;
  if (*(int *)(v16 + 4) >= 1)
  {
    while (1)
    {
      v18 = v17;
      v19 = *(_DWORD *)(v8 + 12 * v17);
      if ((a3 & 1) != 0)
      {
        if (!HIBYTE(v19))
          goto LABEL_26;
      }
      else if (HIBYTE(v19)
             && *(unsigned __int8 *)(objc_msgSend(WeakRetained, "characters") + (*(_QWORD *)&v19 & 0xFFFFFFLL)) == (_DWORD)a2)
      {
LABEL_26:
        v14 = 1;
        *(_DWORD *)(a1 + 8) = v18;
        *(_DWORD *)(a1 + 12) = 1;
        goto LABEL_39;
      }
      v17 = *(unsigned int *)(v8 + 12 * v18 + 8);
      if ((int)v17 <= 0)
        goto LABEL_22;
    }
  }
  v18 = 0;
LABEL_22:
  if (!a4)
    goto LABEL_25;
  if ((a3 & 1) != 0)
  {
    v26 = objc_msgSend(WeakRetained, "nodeCount");
    objc_msgSend(WeakRetained, "writeNode:", 0, 0);
  }
  else
  {
    if (!*v35)
    {
      v28 = HIBYTE(*(_DWORD *)v11);
      if (v28)
      {
        if (v28 != 255)
        {
          v27 = *(_DWORD *)v11;
          if ((v27 & 0xFFFFFF) + v28 == objc_msgSend(WeakRetained, "characterCount"))
          {
            objc_msgSend(WeakRetained, "writeCharacter:", a2);
            *(_BYTE *)(v11 + 3) = ((*(unsigned __int8 *)(v11 + 3) << 24) + 0x1000000) >> 24;
            *(_DWORD *)(a1 + 8) = v36;
            v15 = v10 + 1;
            goto LABEL_38;
          }
        }
      }
    }
    v26 = objc_msgSend(WeakRetained, "nodeCount");
    objc_msgSend(WeakRetained, "writeNode:", objc_msgSend(WeakRetained, "characterCount") & 0xFFFFFF | 0x1000000, 0);
    objc_msgSend(WeakRetained, "writeCharacter:", a2);
  }
  v29 = objc_msgSend(WeakRetained, "nodes");
  v30 = v29 + 12 * v36;
  v32 = *(_DWORD *)(v30 + 4);
  v31 = (_DWORD *)(v30 + 4);
  v33 = (_DWORD *)(v29 + 12 * v18 + 8);
  if (!v32)
    v33 = v31;
  *v33 = v26;
  if (v37)
    *(_DWORD *)(objc_msgSend(WeakRetained, "firstByteCache") + 4 * a2) = v26;
  *(_DWORD *)(a1 + 8) = v26;
  v15 = 1;
LABEL_38:
  *(_DWORD *)(a1 + 12) = v15;
  v14 = 1;
LABEL_39:

  return v14;
}

- (_DWORD)object
{
  _DWORD *v1;
  id WeakRetained;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v1 = (_DWORD *)a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = objc_msgSend(WeakRetained, "nodes");
    v4 = v1[2];
    if (v4 < 1 || *(_BYTE *)(v3 + 12 * v4 + 3))
    {
      -[TrieNode objectForByte:leaf:create:]((uint64_t)v1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TrieNode object]();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(int *)(v3 + 12 * v4 + 4);
      if (!(_DWORD)v5)
      {
        v1 = 0;
        goto LABEL_8;
      }
      objc_msgSend(WeakRetained, "objects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v1 = (_DWORD *)v7;

LABEL_8:
  }
  return v1;
}

- (void)setObject:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v4 = objc_msgSend(WeakRetained, "nodes");
    v5 = *(_DWORD *)(a1 + 8);
    if (v5 < 1 || (v6 = v4, *(_BYTE *)(v4 + 12 * v5 + 3)))
    {
      -[TrieNode objectForByte:leaf:create:](a1, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TrieNode setObject:](v9, v10);
    }
    else
    {
      v7 = *(int *)(v4 + 12 * v5 + 4);
      objc_msgSend(WeakRetained, "objects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((_DWORD)v7)
      {
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, v7);
      }
      else
      {
        *(_DWORD *)(v6 + 12 * *(int *)(a1 + 8) + 4) = objc_msgSend(v8, "count");

        objc_msgSend(WeakRetained, "objects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);
      }
    }

  }
}

- (uint64_t)visit:(int)a3 create:
{
  id v5;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  BOOL v15;

  v5 = a2;
  v6 = v5;
  if (a1
    && (v7 = objc_retainAutorelease(v5),
        v8 = (unsigned __int8 *)objc_msgSend(v7, "UTF8String"),
        v9 = objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4),
        v9 <= 0x200))
  {
    if ((_DWORD)v9)
    {
      v11 = v9 - 1;
      do
      {
        v12 = *v8++;
        v13 = -[TrieNode updateForByte:leaf:create:](a1, v12, 0, a3);
        v10 = v13;
        v15 = v11-- != 0;
      }
      while ((_DWORD)v13 && v15);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectForKey:(int)a3 create:
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;

  if (a1)
  {
    v5 = (id *)(a1 + 16);
    v6 = a2;
    WeakRetained = objc_loadWeakRetained(v5);
    +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[TrieNode visit:create:]((uint64_t)v8, v6, a3);
    if (v9)
      v10 = v8;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)objectForKeyedSubscript:(id *)a1
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  char v7;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2 + 2);
    v5 = WeakRetained;
    if (WeakRetained && *((_BYTE *)WeakRetained + 8))
    {
      v6 = objc_loadWeakRetained(v2 + 2);
      v7 = objc_msgSend(v6, "compressed");

      if ((v7 & 1) != 0)
      {
LABEL_7:
        -[TrieNode objectForKey:create:]((uint64_t)v2, v3, 0);
        v2 = (id *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
      v5 = objc_loadWeakRetained(v2 + 2);
      -[Trie compress]((void **)v5);
    }

    goto LABEL_7;
  }
  return v2;
}

@end
