@implementation _CDDataCollectionAnonymizer

- (id)initWithSalt:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_CDDataCollectionAnonymizer;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDDataCollectionAnonymizer *v4;
  NSData *salt;

  v4 = +[_CDDataCollectionAnonymizer allocWithZone:](_CDDataCollectionAnonymizer, "allocWithZone:", a3);
  if (self)
    salt = self->_salt;
  else
    salt = 0;
  return -[_CDDataCollectionAnonymizer initWithSalt:]((id *)&v4->super.isa, salt);
}

- (id)anonymizeArray:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[_CDDataCollectionAnonymizer anonymizeObject:](a1, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_QWORD)anonymizeObject:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[_CDHashUtilities sha256Hash:withSalt:](_CDHashUtilities, "sha256Hash:withSalt:", v3, a1[1]);
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_CDDataCollectionAnonymizer anonymizeArray:]((uint64_t)a1, v3);
          v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            a1 = 0;
            goto LABEL_11;
          }
          -[_CDDataCollectionAnonymizer anonymizeDictionary:](a1, v3);
          v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    a1 = v4;
  }
LABEL_11:

  return a1;
}

- (id)anonymizeDictionary:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDDataCollectionAnonymizer anonymizeObject:](a1, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "setObject:forKey:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
}

@end
