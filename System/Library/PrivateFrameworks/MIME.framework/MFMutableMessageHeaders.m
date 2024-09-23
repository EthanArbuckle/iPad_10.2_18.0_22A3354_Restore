@implementation MFMutableMessageHeaders

- (id)mutableCopy
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMutableMessageHeaders;
  v3 = -[MFMessageHeaders mutableCopy](&v9, sel_mutableCopy);
  v4 = -[NSMutableDictionary mutableCopy](self->_headersAdded, "mutableCopy");
  v5 = (void *)v3[3];
  v3[3] = v4;

  v6 = -[NSMutableArray mutableCopy](self->_headersRemoved, "mutableCopy");
  v7 = (void *)v3[4];
  v3[4] = v6;

  return v3;
}

- (id)headersDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_headersAdded, "count")
    || -[NSMutableArray count](self->_headersRemoved, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MFMutableMessageHeaders allHeaderKeys](self, "allHeaderKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          -[MFMessageHeaders headersForKey:](self, "headersForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v9, v8);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v5);
    }

    return v3;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MFMutableMessageHeaders;
    -[MFMessageHeaders headersDictionary](&v15, sel_headersDictionary);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)allHeaderKeys
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *headersAdded;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaders data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaders _decodeHeaderKeysFromData:](self, "_decodeHeaderKeysFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  if (self->_headersRemoved)
    objc_msgSend(v3, "removeObjectsInArray:");
  headersAdded = self->_headersAdded;
  if (headersAdded)
  {
    -[NSMutableDictionary allKeys](headersAdded, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  return v3;
}

- (BOOL)hasHeaderForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *headersRemoved;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && (objc_msgSend(v4, "lowercaseString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[NSMutableArray indexOfObject:](headersRemoved, "indexOfObject:", v7),
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_headersAdded, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)MFMutableMessageHeaders;
      v10 = -[MFMessageHeaders hasHeaderForKey:](&v12, sel_hasHeaderForKey_, v5);
    }
  }

  return v10;
}

- (id)firstHeaderForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *headersRemoved;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && (objc_msgSend(v4, "lowercaseString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[NSMutableArray indexOfObject:](headersRemoved, "indexOfObject:", v7),
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_headersAdded, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)MFMutableMessageHeaders;
      -[MFMessageHeaders firstHeaderForKey:](&v12, sel_firstHeaderForKey_, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (void)removeHeaderForKey:(id)a3
{
  uint64_t v4;
  NSMutableArray *headersRemoved;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  objc_msgSend(a3, "lowercaseString");
  v4 = objc_claimAutoreleasedReturnValue();
  headersRemoved = self->_headersRemoved;
  v8 = (id)v4;
  if (!headersRemoved)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_headersRemoved;
    self->_headersRemoved = v6;

    headersRemoved = self->_headersRemoved;
    v4 = (uint64_t)v8;
  }
  -[NSMutableArray addObject:](headersRemoved, "addObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_headersAdded, "removeObjectForKey:", v8);

}

- (void)setHeader:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *headersAdded;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  NSMutableArray *headersRemoved;
  NSObject *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", v9, 2);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        MFLogGeneral();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1ABB13000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Error: tried to set a header with a newline.  Ignoring invalid value.", v17, 2u);
        }

        goto LABEL_13;
      }

    }
    objc_msgSend(v7, "lowercaseString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    headersAdded = self->_headersAdded;
    if (!headersAdded)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = self->_headersAdded;
      self->_headersAdded = v12;

      headersAdded = self->_headersAdded;
    }
    -[NSMutableDictionary setObject:forKey:](headersAdded, "setObject:forKey:", v6, v8);
    v14 = -[NSMutableArray indexOfObject:](self->_headersRemoved, "indexOfObject:", v8);
    headersRemoved = self->_headersRemoved;
    if (headersRemoved && v14 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](headersRemoved, "removeObjectAtIndex:");
LABEL_13:

  }
}

- (void)_appendHeaderKey:(id)a3 value:(id)a4 toData:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[MFMessageHeaders _capitalizedKeyForKey:](self, "_capitalizedKeyForKey:", v15);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "mf_appendCString:", objc_msgSend(v10, "ef_lossyDefaultCStringBytes"));

  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("From ")) & 1) == 0)
    objc_msgSend(v9, "mf_appendCString:", ": ");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = *MEMORY[0x1E0D1E538];
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D1E538])
      && objc_msgSend(v8, "rangeOfString:", CFSTR("<")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "mf_appendCString:", "<");
    }
    objc_msgSend(v8, "mf_encodedHeaderDataWithEncodingHint:", -[MFMessageHeaders preferredEncoding](self, "preferredEncoding"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v11))
      v13 = objc_msgSend(v8, "rangeOfString:", CFSTR(">")) == 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = 0;
    v14 = (id)v12;
    if (!v12)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v8;
    v13 = 0;
    if (!v14)
    {
LABEL_17:
      if (v13)
        objc_msgSend(v9, "mf_appendCString:", ">");
      goto LABEL_19;
    }
LABEL_16:
    objc_msgSend(v9, "appendData:", v14);
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    __assert_rtn("-[MFMutableMessageHeaders _appendHeaderKey:value:toData:]", "MutableMessageHeaders.m", 133, "0 && \"Tried to append an array that we don't understand.\");
  v14 = 0;
LABEL_19:
  objc_msgSend(v9, "mf_appendCString:", "\n");

}

- (void)_appendAddedHeaderKey:(id)a3 value:(id)a4 toData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          -[MFMutableMessageHeaders _appendHeaderKey:value:toData:](self, "_appendHeaderKey:value:toData:", v8, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v10, (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  else
  {
    -[MFMutableMessageHeaders _appendHeaderKey:value:toData:](self, "_appendHeaderKey:value:toData:", v8, v9, v10);
  }

}

- (id)_copyHeaderValueForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *headersRemoved;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && (objc_msgSend(v4, "lowercaseString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[NSMutableArray indexOfObject:](headersRemoved, "indexOfObject:", v7),
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0;
    -[NSMutableDictionary objectForKey:](self->_headersAdded, "objectForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v11);
            v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copy");
            objc_msgSend(v9, "addObject:", v15);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v12);
      }

    }
    else if (v10)
    {
      v16 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v9, "addObject:", v16);

    }
    v17 = 0;
    while (1)
    {
      v18 = +[MFMessageHeaders shouldDecodeHeaderForKey:](MFMessageHeaders, "shouldDecodeHeaderForKey:", v5);
      v21.receiver = self;
      v21.super_class = (Class)MFMutableMessageHeaders;
      v19 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](&v21, sel__copyHeaderValueForKey_offset_decoded_, v5, &v26, v18);

      if (!v19)
        break;
      v17 = v19;
      objc_msgSend(v9, "addObject:", v19);
    }

  }
  return v9;
}

- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSMutableArray *headersRemoved;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved)
  {
    objc_msgSend(v8, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSMutableArray indexOfObject:](headersRemoved, "indexOfObject:", v11);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
      goto LABEL_12;
    }
  }
  if (!*a4)
  {
    -[NSMutableDictionary objectForKey:](self->_headersAdded, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "objectAtIndex:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_8:
        v18.receiver = self;
        v18.super_class = (Class)MFMutableMessageHeaders;
        v16 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](&v18, sel__copyHeaderValueForKey_offset_decoded_, v9, a4, v5);
LABEL_11:
        v13 = v16;

        goto LABEL_12;
      }
    }
    else
    {
      v15 = v14;
      if (!v14)
        goto LABEL_8;
    }
    v16 = (id)objc_msgSend(v15, "copy");
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)MFMutableMessageHeaders;
  v13 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](&v19, sel__copyHeaderValueForKey_offset_decoded_, v9, a4, v5);
LABEL_12:

  return v13;
}

- (NSData)encodedHeaders
{
  MFMutableData *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int HeaderFromDataInRange;
  __CFString *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_headersAdded, "count")
    || -[NSMutableArray count](self->_headersRemoved, "count"))
  {
    v3 = objc_alloc_init(MFMutableData);
    v4 = (void *)-[NSMutableDictionary mutableCopy](self->_headersAdded, "mutableCopy");
    v31 = (void *)-[NSMutableArray mutableCopy](self->_headersRemoved, "mutableCopy");
    memset(v40, 170, sizeof(v40));
    -[MFMessageHeaders data](self, "data");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "bytes");

    -[MFMessageHeaders data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    while (1)
    {
      -[MFMessageHeaders data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      HeaderFromDataInRange = ECGetNextHeaderFromDataInRange();

      if (!HeaderFromDataInRange)
        break;
      v12 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)(v6 + v40[0]), v40[1], 0x600u, 0);
      -[__CFString lowercaseString](v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("from ")) & 1) == 0)
      {
        if (v31)
          v14 = objc_msgSend(v31, "indexOfObject:", v13) != 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = 0;
        objc_msgSend(v4, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 || v15 != 0)
        {
          if (v15)
          {
            objc_msgSend(v4, "objectForKey:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "removeObjectForKey:", v13);
            -[MFMutableMessageHeaders _appendAddedHeaderKey:value:toData:](self, "_appendAddedHeaderKey:value:toData:", v12, v16, v3);
            objc_msgSend(v31, "addObject:", v13);

          }
        }
        else
        {
          -[MFMutableData appendBytes:length:](v3, "appendBytes:length:", v6 + v40[0], v40[1]);
          -[NSMutableData mf_appendCString:](v3, "mf_appendCString:", ": ");
          -[MFMutableData appendBytes:length:](v3, "appendBytes:length:", v6 + v40[2], v40[3]);
          -[NSMutableData mf_appendCString:](v3, "mf_appendCString:", "\n");
        }
      }

      v8 = v10;
    }
    if (encodedHeaders_onceToken != -1)
      dispatch_once(&encodedHeaders_onceToken, &__block_literal_global_9);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = (id)encodedHeaders_orderedHeaders;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v4, "objectForKey:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMutableMessageHeaders _appendAddedHeaderKey:value:toData:](self, "_appendAddedHeaderKey:value:toData:", v21, v23, v3);

            objc_msgSend(v4, "removeObjectForKey:", v21);
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "allKeys");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(v4, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMutableMessageHeaders _appendAddedHeaderKey:value:toData:](self, "_appendAddedHeaderKey:value:toData:", v28, v29, v3);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v25);
    }

    -[MFMutableData appendBytes:length:](v3, "appendBytes:length:", "\n", 1);
    return (NSData *)v3;
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)MFMutableMessageHeaders;
    -[MFMessageHeaders encodedHeaders](&v41, sel_encodedHeaders);
    return (NSData *)(id)objc_claimAutoreleasedReturnValue();
  }
}

void __41__MFMutableMessageHeaders_encodedHeaders__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0D1E558], *MEMORY[0x1E0D1E530], *MEMORY[0x1E0D1E550], *MEMORY[0x1E0D1E528], *MEMORY[0x1E0D1E538], *MEMORY[0x1E0D1E540], *MEMORY[0x1E0D1E548], 0);
  v2 = (void *)encodedHeaders_orderedHeaders;
  encodedHeaders_orderedHeaders = v1;

}

- (void)setAddressList:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    +[MFMessageHeaders encodedDataForAddressList:splittingAtLength:firstLineBuffer:](MFMessageHeaders, "encodedDataForAddressList:splittingAtLength:firstLineBuffer:", v8, 72, objc_msgSend(v6, "length") + 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMutableMessageHeaders setHeader:forKey:](self, "setHeader:forKey:", v7, v6);

  }
  else
  {
    -[MFMutableMessageHeaders removeHeaderForKey:](self, "removeHeaderForKey:", v6);
  }

}

- (void)setAddressListForSender:(id)a3
{
  -[MFMutableMessageHeaders setAddressList:forKey:](self, "setAddressList:forKey:", a3, *MEMORY[0x1E0D1E568]);
}

- (void)setAddressListForTo:(id)a3
{
  -[MFMutableMessageHeaders setAddressList:forKey:](self, "setAddressList:forKey:", a3, *MEMORY[0x1E0D1E600]);
}

- (void)setAddressListForCc:(id)a3
{
  -[MFMutableMessageHeaders setAddressList:forKey:](self, "setAddressList:forKey:", a3, *MEMORY[0x1E0D1E520]);
}

- (void)setAddressListForBcc:(id)a3
{
  -[MFMutableMessageHeaders setAddressList:forKey:](self, "setAddressList:forKey:", a3, *MEMORY[0x1E0D1E518]);
}

- (void)setAddressListForReplyTo:(id)a3
{
  -[MFMutableMessageHeaders setAddressList:forKey:](self, "setAddressList:forKey:", a3, *MEMORY[0x1E0D1E5D0]);
}

- (void)setReferences:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMutableMessageHeaders setHeader:forKey:](self, "setHeader:forKey:", v4, *MEMORY[0x1E0D1E5C0]);

  }
  else
  {
    -[MFMutableMessageHeaders removeHeaderForKey:](self, "removeHeaderForKey:", *MEMORY[0x1E0D1E5C0]);
  }

}

- (void)stripInternalHeaders
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MFMutableMessageHeaders allHeaderKeys](self, "allHeaderKeys");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (!objc_msgSend(v7, "compare:options:range:", CFSTR("x-apple-internal-"), 1, 0, objc_msgSend(CFSTR("x-apple-internal-"), "length", (_QWORD)v8))|| !objc_msgSend(v7, "compare:options:", CFSTR("X-Apple-Content-Length"), 1)|| !objc_msgSend(v7, "compare:options:", CFSTR("x-uniform-type-identifier"), 1))
        {
          -[MFMutableMessageHeaders removeHeaderForKey:](self, "removeHeaderForKey:", v7);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)MFMutableMessageHeaders;
  -[MFMessageHeaders description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR("\n\tAdded:\n"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_headersAdded;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_headersAdded, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@ => %@\n"), v9, v10);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "appendString:", CFSTR("\n\tRemoved:\n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_headersRemoved;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@\n"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v12);
  }

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headersRemoved, 0);
  objc_storeStrong((id *)&self->_headersAdded, 0);
}

@end
