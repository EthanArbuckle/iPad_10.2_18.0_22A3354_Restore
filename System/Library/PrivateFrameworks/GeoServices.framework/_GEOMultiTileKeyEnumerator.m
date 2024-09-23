@implementation _GEOMultiTileKeyEnumerator

- (_GEOMultiTileKeyEnumerator)initWithEnumerators:(id)a3
{
  id v4;
  _GEOMultiTileKeyEnumerator *v5;
  uint64_t v6;
  NSArray *enumerators;
  _GEOMultiTileKeyEnumerator *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOMultiTileKeyEnumerator;
  v5 = -[_GEOMultiTileKeyEnumerator init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    enumerators = v5->_enumerators;
    v5->_enumerators = (NSArray *)v6;

    v5->_currentEnumeratorIndex = 0;
    v8 = v5;
  }

  return v5;
}

- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3
{
  id v4;
  unint64_t currentEnumeratorIndex;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  currentEnumeratorIndex = self->_currentEnumeratorIndex;
  if (-[NSArray count](self->_enumerators, "count") <= currentEnumeratorIndex)
  {
    v12 = 1;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_enumerators, "objectAtIndexedSubscript:", self->_currentEnumeratorIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    if (v6)
    {
      v7 = MEMORY[0x1E0C809B0];
      do
      {
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __67___GEOMultiTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke;
        v14[3] = &unk_1E1C14108;
        v15 = v4;
        v16 = &v17;
        if (objc_msgSend(v6, "continueEnumeratingTileKeysWithBlock:", v14))
        {
          v8 = self->_currentEnumeratorIndex + 1;
          self->_currentEnumeratorIndex = v8;
          if (-[NSArray count](self->_enumerators, "count") <= v8)
          {
            v9 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](self->_enumerators, "objectAtIndexedSubscript:", self->_currentEnumeratorIndex);
            v9 = objc_claimAutoreleasedReturnValue();
          }

          v6 = (void *)v9;
        }

        if (*((_BYTE *)v18 + 24))
          v10 = 1;
        else
          v10 = v6 == 0;
      }
      while (!v10);
    }
    v11 = self->_currentEnumeratorIndex;
    v12 = -[NSArray count](self->_enumerators, "count") <= v11;
    _Block_object_dispose(&v17, 8);

  }
  return v12;
}

- (unint64_t)count
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_enumerators;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerators, 0);
}

@end
