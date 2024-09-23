@implementation MFIMAPCommandPipeline

- (void)addFetchCommandForUid:(unsigned int)a3 fetchItem:(id)a4 expectedLength:(unint64_t)a5 bodyDataConsumer:(id)a6 consumerSection:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *fetchUnits;
  _MFIMAPFetchUnit *v16;
  unint64_t chunkSize;
  unint64_t v18;
  id v19;

  v10 = *(_QWORD *)&a3;
  v19 = a4;
  v12 = a6;
  v13 = a7;
  -[MFIMAPCommandPipeline mf_lock](self, "mf_lock");
  if (!self->_fetchUnits)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fetchUnits = self->_fetchUnits;
    self->_fetchUnits = v14;

  }
  v16 = objc_alloc_init(_MFIMAPFetchUnit);
  -[_MFIMAPFetchUnit setUid:](v16, "setUid:", v10);
  -[_MFIMAPFetchUnit setFetchItem:](v16, "setFetchItem:", v19);
  -[_MFIMAPFetchUnit setBodyDataConsumer:](v16, "setBodyDataConsumer:", v12);
  -[_MFIMAPFetchUnit setConsumerSection:](v16, "setConsumerSection:", v13);
  -[NSMutableArray addObject:](self->_fetchUnits, "addObject:", v16);
  chunkSize = self->_chunkSize;
  v18 = self->_expectedSize + a5;
  self->_expectedSize = v18;
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFE | (v18 >= chunkSize);
  -[MFIMAPCommandPipeline mf_unlock](self, "mf_unlock");

}

- (unint64_t)expectedSize
{
  return self->_expectedSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_chunkSize = a3;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setFull:(BOOL)a3
{
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFE | a3;
}

- (BOOL)isFull
{
  return *((_BYTE *)self + 24) & 1;
}

- (void)_removeFetchUnitMatchingResponse:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "fetchResultWithType:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "uid");

  if (v5 && -[NSMutableArray count](self->_fetchUnits, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_fetchUnits, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "uid") == v5 && objc_msgSend(v6, "matchesFetchResponse:", v7))
      -[NSMutableArray removeObjectAtIndex:](self->_fetchUnits, "removeObjectAtIndex:", 0);

  }
}

- (id)failureResponsesFromSendingCommandsWithConnection:(id)a3
{
  unint64_t v4;
  unint64_t i;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  MFIMAPResponseConsumer *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  MFIMAPResponseConsumer *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  int v25;
  _MFIMAPCommandParameters *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _MFIMAPCommandParameters *v31;
  double Current;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSMutableArray *v44;
  NSMutableArray *fetchUnits;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MFIMAPCommandPipeline mf_lock](self, "mf_lock");
  v4 = -[NSMutableArray count](self->_fetchUnits, "count");
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_fetchUnits, "objectAtIndex:", i, v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v54, "uid");
      objc_msgSend(v54, "fetchItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bodyDataConsumer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7
        || (objc_msgSend(v54, "consumerSection"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = v8 == 0,
            v8,
            v7,
            v9))
      {
        v10 = 0;
      }
      else
      {
        v10 = objc_alloc_init(MFIMAPResponseConsumer);
        objc_msgSend(v54, "bodyDataConsumer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "consumerSection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFIMAPResponseConsumer addConsumer:forSection:](v10, "addConsumer:forSection:", v11, v12);

      }
      v13 = i + 1;
      if (i + 1 >= v4)
      {
        v14 = 0;
        v25 = 1;
      }
      else
      {
        v14 = 0;
        v15 = v10;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_fetchUnits, "objectAtIndex:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "uid") == v6)
          {
            -[NSMutableArray removeObjectAtIndex:](self->_fetchUnits, "removeObjectAtIndex:", v13);
            -[NSMutableArray insertObject:atIndex:](self->_fetchUnits, "insertObject:atIndex:", v16, ++i);
            objc_msgSend(v16, "fetchItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v55);

            if ((v18 & 1) == 0)
            {
              if (!v14)
              {
                v14 = (void *)objc_msgSend(CFSTR("("), "mutableCopyWithZone:", 0);
                objc_msgSend(v14, "appendString:", v55);
              }
              objc_msgSend(v14, "appendString:", CFSTR(" "));
              objc_msgSend(v16, "fetchItem");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "appendString:", v19);

              objc_msgSend(v16, "bodyDataConsumer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v16, "consumerSection");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21 == 0;

                if (!v22)
                {
                  if (!v15)
                    v15 = objc_alloc_init(MFIMAPResponseConsumer);
                  objc_msgSend(v16, "bodyDataConsumer");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "consumerSection");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MFIMAPResponseConsumer addConsumer:forSection:](v15, "addConsumer:forSection:", v23, v24);

                }
              }
            }
          }

          ++v13;
        }
        while (v4 != v13);
        if (v14)
        {
          objc_msgSend(v14, "appendString:", CFSTR(")"));
          v25 = 0;
        }
        else
        {
          v25 = 1;
        }
        v10 = v15;
      }
      v26 = [_MFIMAPCommandParameters alloc];
      EFStringWithInt();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      v29 = v55;
      if (!v25)
        v29 = v14;
      v66[0] = v27;
      v66[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_MFIMAPCommandParameters initWithCommand:arguments:](v26, "initWithCommand:arguments:", 21, v30);

      -[_MFIMAPCommandParameters setResponseConsumer:](v31, "setResponseConsumer:", v10);
      objc_msgSend(v53, "addObject:", v31);

    }
  }
  if (objc_msgSend(v53, "count", v51))
  {
    *((_BYTE *)self + 24) |= 2u;
    objc_msgSend(v52, "mf_lock");
    Current = CFAbsoluteTimeGetCurrent();
    v33 = (id)objc_msgSend(v52, "_responseFromSendingCommands:", v53);
    objc_msgSend(v52, "setReadBufferSizeFromElapsedTime:bytesRead:", self->_expectedSize, CFAbsoluteTimeGetCurrent() - Current);
    objc_msgSend(v52, "mf_unlock");
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v34 = v53;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "untaggedResponses");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v39 = v38;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v57;
            do
            {
              for (k = 0; k != v40; ++k)
              {
                if (*(_QWORD *)v57 != v41)
                  objc_enumerationMutation(v39);
                v43 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
                if (objc_msgSend(v43, "isUntagged") && objc_msgSend(v43, "responseType") == 17)
                  -[MFIMAPCommandPipeline _removeFetchUnitMatchingResponse:](self, "_removeFetchUnitMatchingResponse:", v43);
              }
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
            }
            while (v40);
          }

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v35);
    }

    *((_BYTE *)self + 24) &= ~2u;
  }
  if (-[NSMutableArray count](self->_fetchUnits, "count"))
  {
    v44 = self->_fetchUnits;
    fetchUnits = self->_fetchUnits;
    self->_fetchUnits = 0;

  }
  else
  {
    v44 = 0;
  }
  self->_expectedSize = 0;
  *((_BYTE *)self + 24) &= ~1u;
  -[MFIMAPCommandPipeline mf_unlock](self, "mf_unlock");
  objc_msgSend(v52, "didFinishCommands:", v53);
  v46 = -[NSMutableArray count](v44, "count");
  if (v46)
  {
    v47 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](v44, "objectAtIndex:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v48, "copyFailedFetchResponse");
      if (v49)
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](v44, "replaceObjectAtIndex:withObject:", v47++, v49);
      }
      else
      {
        -[NSMutableArray removeObjectAtIndex:](v44, "removeObjectAtIndex:", v47);
        --v46;
      }

    }
    while (v47 < v46);
  }
  if (!-[NSMutableArray count](v44, "count"))
  {

    v44 = 0;
  }

  return v44;
}

- (BOOL)isSending
{
  return (*((unsigned __int8 *)self + 24) >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchUnits, 0);
}

@end
