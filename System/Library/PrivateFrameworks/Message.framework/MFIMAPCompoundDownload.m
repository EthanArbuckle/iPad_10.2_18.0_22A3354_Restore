@implementation MFIMAPCompoundDownload

- (id)subdownloads
{
  void *v3;

  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  if (self->_subdownloads)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_subdownloads);
  else
    v3 = 0;
  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)addSubdownload:(id)a3
{
  id v4;
  NSMutableArray *subdownloads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  subdownloads = self->_subdownloads;
  if (subdownloads)
  {
    if (-[NSMutableArray indexOfObjectIdenticalTo:](subdownloads, "indexOfObjectIdenticalTo:", v4) == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](self->_subdownloads, "addObject:", v4);
  }
  else
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v8, 1);
    v7 = self->_subdownloads;
    self->_subdownloads = v6;

  }
  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");

}

- (void)removeSubdownload:(id)a3
{
  id v4;

  v4 = a3;
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  -[NSMutableArray removeObjectIdenticalTo:](self->_subdownloads, "removeObjectIdenticalTo:", v4);
  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");

}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_subdownloads && (objc_msgSend(v6, "isFull") & 1) == 0)
  {
    -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_subdownloads;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isComplete", (_QWORD)v13) & 1) == 0)
          objc_msgSend(v12, "addCommandsToPipeline:withCache:", v6, v7);
        if ((objc_msgSend(v6, "isFull") & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            goto LABEL_5;
          break;
        }
      }
    }

    -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  }

}

- (void)processResults
{
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  -[NSMutableArray makeObjectsPerformSelector:](self->_subdownloads, "makeObjectsPerformSelector:", a2);
  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
}

- (BOOL)isComplete
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_subdownloads)
    return 1;
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_subdownloads;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isComplete", (_QWORD)v9) & 1) == 0)
        {
          v7 = 0;
          goto LABEL_12;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_12:

  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  return v7;
}

- (BOOL)isSuccessful
{
  NSMutableArray *subdownloads;
  char v4;

  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  subdownloads = self->_subdownloads;
  if (subdownloads)
    v4 = -[NSMutableArray ef_all:](subdownloads, "ef_all:", &__block_literal_global_33);
  else
    v4 = 1;
  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  return v4;
}

uint64_t __38__MFIMAPCompoundDownload_isSuccessful__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuccessful");
}

- (unint64_t)expectedLength
{
  NSMutableArray *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_subdownloads)
    return 0;
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_subdownloads;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v12;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "expectedLength", (_QWORD)v11);
      v9 = 0xFFFFFFFFLL;
      if (v8 == 0xFFFFFFFFLL)
        break;
      v5 += v8;
      if (v4 == ++v7)
      {
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v9 = v5;
        if (v4)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  return v9;
}

- (unint64_t)bytesFetched
{
  NSMutableArray *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_subdownloads)
    return 0;
  -[MFIMAPCompoundDownload mf_lock](self, "mf_lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_subdownloads;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "bytesFetched", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[MFIMAPCompoundDownload mf_unlock](self, "mf_unlock");
  return v4;
}

- (unint64_t)lengthOfDataBeforeLineConversion
{
  NSMutableArray *subdownloads;
  NSMutableArray *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  subdownloads = self->_subdownloads;
  if (!subdownloads)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = subdownloads;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "lengthOfDataBeforeLineConversion", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdownloads, 0);
}

@end
