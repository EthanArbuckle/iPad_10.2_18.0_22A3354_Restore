@implementation GEOTileDBSubscriptionMetadata

- (GEOTileDBSubscriptionMetadata)initWithDataStates:(id)a3 downloadState:(int64_t)a4
{
  id v6;
  GEOTileDBSubscriptionMetadata *v7;
  GEOTileDBSubscriptionMetadata *v8;
  uint64_t v9;
  NSArray *dataStates;
  GEOTileDBSubscriptionMetadata *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTileDBSubscriptionMetadata;
  v7 = -[GEOTileDBSubscriptionMetadata init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_downloadState = a4;
    v9 = objc_msgSend(v6, "copy");
    dataStates = v8->_dataStates;
    v8->_dataStates = (NSArray *)v9;

    v11 = v8;
  }

  return v8;
}

- (BOOL)isFullyLoadedForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4 version:(unint64_t)a5 associatedDataCount:(unint64_t *)a6 associatedDataSize:(unint64_t *)a7
{
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_dataStates;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    if (a4 | a3)
      v16 = 0;
    else
      v16 = a5 == 0;
    v17 = v16;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
        if (v19)
        {
          if (*(_DWORD *)(v19 + 16) == a3 && *(_DWORD *)(v19 + 20) == a4 && *(_QWORD *)(v19 + 8) == a5)
          {
            v22 = *(unsigned __int8 *)(v19 + 24);
            if (*(_BYTE *)(v19 + 24))
            {
              if (a6)
                *a6 = *(_QWORD *)(v19 + 32);
              if (a7)
                *a7 = *(_QWORD *)(v19 + 40);
            }
            v21 = v22 != 0;
            goto LABEL_28;
          }
        }
        else if ((v17 & 1) != 0)
        {
          goto LABEL_27;
        }
        ++v18;
      }
      while (v14 != v18);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v14 = v20;
      v21 = 0;
      if (v20)
        continue;
      break;
    }
  }
  else
  {
LABEL_27:
    v21 = 0;
  }
LABEL_28:

  return v21;
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStates, 0);
}

@end
