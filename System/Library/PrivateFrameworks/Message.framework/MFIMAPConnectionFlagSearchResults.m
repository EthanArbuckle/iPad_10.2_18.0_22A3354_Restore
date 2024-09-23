@implementation MFIMAPConnectionFlagSearchResults

- (MFIMAPConnectionFlagSearchResults)init
{
  MFIMAPConnectionFlagSearchResults *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *uidsWithFlagMaskSet;
  NSMutableDictionary *v5;
  NSMutableDictionary *uidsWithoutFlagMaskSet;
  MFIMAPConnectionFlagSearchResults *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFIMAPConnectionFlagSearchResults;
  v2 = -[MFIMAPConnectionFlagSearchResults init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uidsWithFlagMaskSet = v2->_uidsWithFlagMaskSet;
    v2->_uidsWithFlagMaskSet = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uidsWithoutFlagMaskSet = v2->_uidsWithoutFlagMaskSet;
    v2->_uidsWithoutFlagMaskSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)description
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_uidsWithFlagMaskSet;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_uidsWithFlagMaskSet, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        MFDescriptionForMessageFlags(objc_msgSend(v8, "unsignedLongLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ set %@"), v10, v9);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_uidsWithoutFlagMaskSet;
  v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_uidsWithoutFlagMaskSet, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        MFDescriptionForMessageFlags(objc_msgSend(v15, "unsignedLongLongValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ unset %@"), v17, v16, (_QWORD)v19);

      }
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v12);
  }

  return v3;
}

- (unint64_t)_flagsForUID:(unint64_t)a3
{
  NSMutableDictionary *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_uidsWithFlagMaskSet;
  v6 = 0;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_uidsWithFlagMaskSet, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "unsignedLongLongValue");
        if (objc_msgSend(v11, "containsIndex:", a3))
          v6 |= v12;
        else
          v6 &= ~v12;

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_uidsWithoutFlagMaskSet;
  v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_uidsWithoutFlagMaskSet, "objectForKey:", v17, (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "unsignedLongLongValue");
        if (objc_msgSend(v18, "containsIndex:", a3))
          v6 &= ~v19;
        else
          v6 |= v19;

      }
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  return v6;
}

- (id)_indexSetFromUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "integerValue", (_QWORD)v10));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)cacheStateForUIDs:(id)a3 mask:(unint64_t)a4 existenceSetsFlag:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a5;
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnectionFlagSearchResults _indexSetFromUIDs:](self, "_indexSetFromUIDs:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 16;
  if (v5)
    v10 = 8;
  v11 = *(id *)((char *)&self->super.isa + v10);
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "addIndexes:", v9);
  else
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v8);
  v14 = 8;
  if (v5)
    v14 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v14), "removeObjectForKey:", v8);

}

- (id)copyResponseForUID:(unint64_t)a3
{
  MFIMAPResponse *v5;
  MFIMAPFetchResult *v6;
  MFIMAPFetchResult *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MFIMAPResponse);
  -[MFIMAPResponse setResponseType:](v5, "setResponseType:", 17);
  v6 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 8);
  v7 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 10);
  -[MFIMAPFetchResult setUid:](v6, "setUid:", a3);
  -[MFIMAPFetchResult setMessageFlags:](v7, "setMessageFlags:", -[MFIMAPConnectionFlagSearchResults _flagsForUID:](self, "_flagsForUID:", a3));
  v10[0] = v6;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPResponse setFetchResults:](v5, "setFetchResults:", v8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uidsWithoutFlagMaskSet, 0);
  objc_storeStrong((id *)&self->_uidsWithFlagMaskSet, 0);
}

@end
